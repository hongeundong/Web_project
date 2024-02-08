package com.springboot.project3.controller;

import com.springboot.project3.data.Post;
import com.springboot.project3.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.List;

@Controller
public class PostController {
    @Autowired
    private PostRepository postRepository;

    @PostMapping("/post")
    public String posting(@RequestParam String title, @RequestParam String content, @RequestParam String uid){
        Post post = new Post();
        post.setTitle(title);
        post.setContent(content);
        post.setUid(uid);
        post.setCreatedAt(LocalDateTime.now());

        postRepository.save(post);

        return "redirect:/nb.jsp";
    }
}
