Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1944693lfq;
        Fri, 2 Oct 2020 15:00:06 -0700 (PDT)
X-Received: by 2002:a9d:70d8:: with SMTP id w24mr3141926otj.275.1601676005953;
        Fri, 02 Oct 2020 15:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601676005; cv=none;
        d=google.com; s=arc-20160816;
        b=rnayT6TtwTeqH8Cb+xoRDsw57nhpJe1FUovpOlimVYaNF9T6g86tJ4dBKQCnlkj2Gp
         arq2DCbw65jgV4pKuJ/uuNeg+0odKco3spcB/k2TQ8g9gviT/KdnHzqOtuZ9TGaxgniy
         ZsCaQVFJGzUzbokwdDMKOJtrI1e6hk1isu+3hpJGDNPjtSR4Mg1mDNavWc+ohF3raE/1
         Jm+oKnOrK/K0Ewm0gZv9A65+AtkEC4ooU/eHqFRq80G+IZsUcYX007ZPf8cGWgXNyKHu
         MwjTvSJrrK9gMOgnwtc6bAKaZl2t+m8p1Ncm0IVPBL0bkbZRD6+cFkFx5SYHFO1wA06m
         yNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=alZjlQJXj3PE/fgiElfGG8lmZ092HOwXFHnkKr7NfsI=;
        b=Egt6dhPGk/TnT+DtjuE4XSuN/QAh/XPjT3nJOHCpcWbs++DnwzU2QqsoLObHj3gNc9
         ritKoT7ayzImuRqKxG6lN8ANqGr6J8wVTnM5eiGbbStoHNwiZxMqfvwRvNx0xGQDw7iX
         Ko0+jyBPmNwsdFsB4JGo0ALvdyruu9hR4dC7LFw9LYqCV4EWIpM+KefZXhaMfttVKyd5
         pwfyMOkfAMzS/o5zs28xjd5Mc8/yljfLMDr3KvwtYBUqpATSm1pcPQ2m9apA45v1xRas
         01F/BAHiy6d5AcgtHxo7+jFTmI6B6OfgFWfKU4VVM1XU88dkYOYmjnRErkDDa02whK9C
         S+Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUcdYUiS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g5sor595780otp.56.2020.10.02.15.00.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Oct 2020 15:00:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUcdYUiS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=alZjlQJXj3PE/fgiElfGG8lmZ092HOwXFHnkKr7NfsI=;
        b=eUcdYUiSmOLmvla2rtrnuoi1pzh744TEe44bOlVtAgw8+NvZVdc2bXArY7DuelD04O
         w7HJZP/pzKf6r1dsQao0tiJrRHLfWnjkwC9uc3QH67sWTA86DEYlJz067luFaKvLq7OL
         sJ1ClV6tg7+8TeKee3hbBrH/fLpIIPmY6Zeo/R/f0JhoCXqpgxfDXWJAvoKdLQ06RDim
         m73XpI/AbFBU4Mr7JYbL3np7yJrPRPg7UP/+8b2ALXAS/iZrJuAi1RHCcwiVmpEPZU35
         LYwO5bryl+f5gtz3u5Hz5jn2ilyeBJbwm4qOrtsRlwOIzApbvwuEgkaXL3KKJut8s7Tm
         sBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=alZjlQJXj3PE/fgiElfGG8lmZ092HOwXFHnkKr7NfsI=;
        b=sA6fkoaxFNLLV5aGbEnMGcjRr8PbrDvzx2E0e+tQnil42KB2+cE273FxIxw5J5U9Qy
         CFgj5qW8RNIkkilZeXUBTiTwV8hJ2l/VXrkprSihUb4y702L5x2qH5K6kd7YL7TLn/4w
         YzhwZ4LXH/wWtfnAevsmvuRbKBGH4S3gmZl8nFa4jkquhgjGITu24kIYipMs8hRgDtzL
         Ru87cnd/0NvyRFI/OldbNnPlhXJL93frja4DBXdmGaC8s3xUyVYyTqJNZQQ+ab2jVKpy
         dZxnFg3Muu2ROUivcK8iptAhITgPBKvD+1Rd3/Du1N3TXAAriXohyPWzQKDVMbF5zpDi
         xt0w==
X-Gm-Message-State: AOAM5314gWN8N8zgtuZ3eqRFXrqmiaLBc9tj2D1Z9MxC/RV/c8EQhatj
	4MjzP6NySlmmPWjyqO8pvsfOkTo5
X-Google-Smtp-Source: ABdhPJzAwkqMnyDkaRt2Hhi7hKZSwOFDBLSrdfxuy2ZLAyLSRw3vxCSGx7WK8zk2WM+41m87kzuNww==
X-Received: by 2002:a9d:a24:: with SMTP id 33mr2921358otg.305.1601676005510;
        Fri, 02 Oct 2020 15:00:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id k10sm684268ots.60.2020.10.02.15.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:00:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v10 5/8] linux-user/elfload: Adjust iteration over phdr
Date: Fri,  2 Oct 2020 16:59:52 -0500
Message-Id: <20201002215955.254866-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002215955.254866-1-richard.henderson@linaro.org>
References: <20201002215955.254866-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ofgJ63guFGGk

The second loop uses a loop induction variable, and the first
does not.  Transform the first to match the second, to simplify
a following patch moving code between them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 7572a32a30..735ebfa190 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2426,17 +2426,18 @@ static void load_elf_image(const char *image_name, int image_fd,
     loaddr = -1, hiaddr = 0;
     info->alignment = 0;
     for (i = 0; i < ehdr->e_phnum; ++i) {
-        if (phdr[i].p_type == PT_LOAD) {
-            abi_ulong a = phdr[i].p_vaddr - phdr[i].p_offset;
+        struct elf_phdr *eppnt = phdr + i;
+        if (eppnt->p_type == PT_LOAD) {
+            abi_ulong a = eppnt->p_vaddr - eppnt->p_offset;
             if (a < loaddr) {
                 loaddr = a;
             }
-            a = phdr[i].p_vaddr + phdr[i].p_memsz;
+            a = eppnt->p_vaddr + eppnt->p_memsz;
             if (a > hiaddr) {
                 hiaddr = a;
             }
             ++info->nsegs;
-            info->alignment |= phdr[i].p_align;
+            info->alignment |= eppnt->p_align;
         }
     }
 
-- 
2.25.1
