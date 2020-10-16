Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1780979lfa;
        Fri, 16 Oct 2020 11:42:16 -0700 (PDT)
X-Received: by 2002:a17:90a:4ece:: with SMTP id v14mr5661180pjl.70.1602873736645;
        Fri, 16 Oct 2020 11:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873736; cv=none;
        d=google.com; s=arc-20160816;
        b=MChl3ovasM+9R33yV/kI5bzFWneMsexduSX70dwiba9JS7H+jt0oR+UwYaLwUbZPnk
         0yulpGE3unTmO3uW5ujLB27BSob/igK6Kgo25KaV7v57bzxNBphTVPl9y+zgQDRXIid7
         EMvfZd3P+TafPPQm/x6+wZEN7cPrUyRMjAjysxJ/4vRBgFQf21dBoYeeYv2fUmvWCO4N
         Fu8e+Ufm4jJrrEYVP2Yd4oHqJU6Ut/c7xHkh2llyR4HEY56QmJlmYSFfTYrJTc59pmZT
         33Bhj99gKOi5Gl6v/oTqn5ph0lFZXs9R4NdsURBdxcXampAx09oGGQQa0Dw7maFpBjJC
         po7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tcQiTVPZ4EDkEsGCvdGZmCD7eErMNKvjpgH4j/u5Y8I=;
        b=gE12nO1Q+0qe3dOSOm0xwR3RVXy9SqBRv3FRvBtF8xDSr/LFPpa3Kf4M1xibeGRUaW
         27eRgrDZDtcLasbTDFluOvbvKXPFStd5ZKkZg3aPx5muNanmIThGtanWngWb/QucRzYS
         r+eGDQhsR24LqBiPDwZNNZK+yZe18jGVtIcESBNeiQg6aIzDJF593JHJI8vakfyWNB/i
         E0VLx+x9aBEU7KQU8WGGshQwOOWTbXeP0ohxxrZKRsWXnGymSROS47BIwjVjQNTDwluA
         CNDnBe+k0560Mjvq/ECGRR58R4ZJSAOJntC7f/uZZP8MKf0xQt0yImYmInmKlfRWkylo
         ZBgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BIq43mfI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u14sor1714571pja.4.2020.10.16.11.42.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BIq43mfI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tcQiTVPZ4EDkEsGCvdGZmCD7eErMNKvjpgH4j/u5Y8I=;
        b=BIq43mfIl6tPMcY1In/e2r93+woPXqHZoyGSA8eMLv2FIRvOtQ9a1kuUSIjsoN6lOI
         T2jIycCPbQAcU2X/v2GBYGnWd2hsAaALrejJrmkjH3Hn9ZmDcqD6ohIhgcGO0P8yj2Fn
         gHQALboLEEgdaKOOc3ooPWif2spFY+X1bhXIuivndCsynXb+e4Fclc6gwuEhnYbDESPX
         n2rOhuXRaxFP5Mg7HTrtx6jz3YEVDtt2UVGHItxk/H0/PZSaoW/vUk5i6EYTyucAUMIL
         ljl60noBwvmFXZfaJ8S3Q5wFBwUFnfNmFDyVZaqPkViQk9QflU+tpvYFfC1ZnRi6amZL
         mNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tcQiTVPZ4EDkEsGCvdGZmCD7eErMNKvjpgH4j/u5Y8I=;
        b=Yz8DCPHMU5hiP8EB5zooafji/dpHWxfegdJqzD1tUR/xLhvshwmqXjVC7w/XrXLaq/
         K7fuFd6TUGU2Lc/TzTsf/uaY0S+ckKhRrVAAf2/2irirsxeoxEBDMKjjoXuIWXAfastf
         22XtwiC8gwysiGz2vx4qidwbiyPvHTC4wFavr0em6kR9woVjF41yd/c702JtV011+tI0
         QLc7+aoXM8I+Vwkgs5617cphd3aJDHPjz2OYl/ItdVHZa5ZhalYxh/lcD4sws4J11T6t
         fiEl28DWPIhGb4b5fsBaRD4TGN+bW+5Hz+sITogVaXNNLO5VFcwLLHZCJ3VA/wb/8cai
         XmwQ==
X-Gm-Message-State: AOAM532tYMSDb7dbqdBC6MC3zCHRqSu2Vxc7DA8LUoq0SQuz/1gvzN/t
	p9cu4Xu5jAgg4tlbt+6hzvVY5cMf
X-Google-Smtp-Source: ABdhPJyY6cd47FDfccdN3dhaPcSnA7qoUywjqtl2kuQYqDWbXvCmsDteT4ZxzTaHdA1rQXeo7n+OPw==
X-Received: by 2002:a17:90a:8596:: with SMTP id m22mr5218160pjn.42.1602873736199;
        Fri, 16 Oct 2020 11:42:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v11 04/12] linux-user/elfload: Avoid leaking interp_name using GLib memory API
Date: Fri, 16 Oct 2020 11:41:59 -0700
Message-Id: <20201016184207.786698-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7G1+6tsipO9Y

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix an unlikely memory leak in load_elf_image().

Fixes: bf858897b7 ("linux-user: Re-use load_elf_image for the main binary.")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201003174944.1972444-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f6022fd704..1a3150df7c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2584,13 +2584,13 @@ static void load_elf_image(const char *image_name, int image_fd,
                 info->brk = vaddr_em;
             }
         } else if (eppnt->p_type == PT_INTERP && pinterp_name) {
-            char *interp_name;
+            g_autofree char *interp_name = NULL;
 
             if (*pinterp_name) {
                 errmsg = "Multiple PT_INTERP entries";
                 goto exit_errmsg;
             }
-            interp_name = malloc(eppnt->p_filesz);
+            interp_name = g_malloc(eppnt->p_filesz);
             if (!interp_name) {
                 goto exit_perror;
             }
@@ -2609,7 +2609,7 @@ static void load_elf_image(const char *image_name, int image_fd,
                 errmsg = "Invalid PT_INTERP entry";
                 goto exit_errmsg;
             }
-            *pinterp_name = interp_name;
+            *pinterp_name = g_steal_pointer(&interp_name);
 #ifdef TARGET_MIPS
         } else if (eppnt->p_type == PT_MIPS_ABIFLAGS) {
             Mips_elf_abiflags_v0 abiflags;
@@ -2961,7 +2961,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
     if (elf_interpreter) {
         info->load_bias = interp_info.load_bias;
         info->entry = interp_info.entry;
-        free(elf_interpreter);
+        g_free(elf_interpreter);
     }
 
 #ifdef USE_ELF_CORE_DUMP
-- 
2.25.1
