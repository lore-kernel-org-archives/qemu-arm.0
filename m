Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1944718lfq;
        Fri, 2 Oct 2020 15:00:07 -0700 (PDT)
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr3236894oto.297.1601676007303;
        Fri, 02 Oct 2020 15:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601676007; cv=none;
        d=google.com; s=arc-20160816;
        b=DLLtamK9qgG06zJGD5EuIDR+4HR/GoErPDG3GGiA2RwToGh0UdkHKtTt1h82Ff1w5n
         +dCDxm8HWPyo5jqeBE87VdeRSuG5fqMdo5z1XC0kBZ34OOW+IivGYJcgnJGT1xVN6fsq
         GKQXw+GILSGVuvOfPYJblkTF1qIA5nEaOVL7d85JGVcAhu9YqaNZWH2yfCCH4nK+gK3z
         qjWg8sar0ItYTinZT8+WNi0qiPM4Ay46M5RlNyhhQS2SbHuuWHUnA3YcyGwYbSnzHqJ2
         d/reUoONPXBT9KBHn9hRfe2Owkxlkd5L/ntXHBmPrUgsn1Vf2lb+LEgcaNFnHKoi2bQJ
         rOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0BbDoe9J1HK0fsnnyytHHCY6uKzAPenEs5cQszBMvV4=;
        b=bT/LK3/sXbGw1D7nCNqfjUKWqH5sghz6cHbVR2ZLBLMyxWydNKKYlRZoGLwb8o1MY4
         HZZlzjwdFZMM9ZHM/4qWEiXFZHeYRtZjXMy7jKabotIATfGfeH0zKfGnsuGH3Mb9xXwG
         Mw8ijtDGdK8inUWWGAJsKwZPHXmgr2bG64VdpRuV3ITKoR3JW64Jjl+lZAAs7KIGbZ6t
         xvg3+XNZRmlPuZKH6zfkNrjhWrcYKW4rvZPAUGN7QtRv0sQNGVKrtTiDH/zWuCmBWxSi
         4TJYqGh3eDSQuDZxYeGVwvrmQ3CskENHjjxhhUSS/uzadeoSgCF04amSRCQiIDuPfHeP
         4Lbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JCe9wMsr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f126sor454267oia.73.2020.10.02.15.00.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Oct 2020 15:00:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JCe9wMsr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0BbDoe9J1HK0fsnnyytHHCY6uKzAPenEs5cQszBMvV4=;
        b=JCe9wMsrZyC3phlm+nCPDYtTM2wgzzXqQeVhag4Fj3984KbhMy/YCPnTQjD5V683ek
         80XUY8dr7UseqrBnHBh6eWTf2s/VIHtLkOqqLbF5zXwRbRMPZt0mBlRxO7efMVcAQzi6
         BT6QjzAwGnJZ5BMr6zybhOFVpOJ5Q3JyM3ngN6Hb4FToUgKzO0ToJGOrnSow9pQ1qIBV
         u2MS0ZOQWRJK6mka+A/Gn2JTVkxEyq5C7OgpYg5ydfHRrUkpB/kkRV0zIyF+NsYt12G/
         d5tMHQSvmeahqTNqfssPePXXKTVOgvZ+AMvDNA8R0j/3/ATySk3IYWEn4DIUFao9GG9x
         IRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0BbDoe9J1HK0fsnnyytHHCY6uKzAPenEs5cQszBMvV4=;
        b=bUO2c8ee8rMIZX3zWbdJpO37xZe6ckYF9luwJWnVX2MB7HbZlZJdDHTsR/uX7p8SlS
         C2XcrEesX58om+z8Zscm8lwyxvwPEfHCHtJ3p9769XCdgzVVequI7g/7tCiEka1QJa7e
         CPn65IB+C3LskyPFB3iXudH+wBmBEom/STqMPBL/iZZzkL/5dQm4FVdb7NGaPcFotiYE
         fnPy2/7Ce+uxvy/CW6uQnMZpBNDdobNb4uFqaJ3CCuNlobswgKu5Eg7JK+fXqhIG4oQT
         u5AL4RLZpXcWRI9ZeGMirmUSkZtPjGiQRXQRLU6hiQTMtpUrhooD7z9n9u9GRC6GR1+E
         6Fgg==
X-Gm-Message-State: AOAM530CehNfgsYWwHASA5h2rMbso7UnKIOYXA7aqxdIY+WmEVsjSaWC
	3IA33CQK6STC7CTXn3plqSCi7B3I
X-Google-Smtp-Source: ABdhPJwGR+b4eiNsToawk3uOhGkWc/zWtEQm5DkyAXxEm9dRSKNuhaVjnQOtySeTyCt2zBPWkufzFg==
X-Received: by 2002:a54:4d88:: with SMTP id y8mr2501987oix.97.1601676006853;
        Fri, 02 Oct 2020 15:00:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id k10sm684268ots.60.2020.10.02.15.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:00:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v10 6/8] linux-user/elfload: Move PT_INTERP detection to first loop
Date: Fri,  2 Oct 2020 16:59:53 -0500
Message-Id: <20201002215955.254866-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002215955.254866-1-richard.henderson@linaro.org>
References: <20201002215955.254866-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: laVVyU71jVuD

For BTI, we need to know if the executable is static or dynamic,
which means looking for PT_INTERP earlier.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 60 +++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 735ebfa190..6b422990ff 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2421,8 +2421,10 @@ static void load_elf_image(const char *image_name, int image_fd,
 
     mmap_lock();
 
-    /* Find the maximum size of the image and allocate an appropriate
-       amount of memory to handle that.  */
+    /*
+     * Find the maximum size of the image and allocate an appropriate
+     * amount of memory to handle that.  Locate the interpreter, if any.
+     */
     loaddr = -1, hiaddr = 0;
     info->alignment = 0;
     for (i = 0; i < ehdr->e_phnum; ++i) {
@@ -2438,6 +2440,33 @@ static void load_elf_image(const char *image_name, int image_fd,
             }
             ++info->nsegs;
             info->alignment |= eppnt->p_align;
+        } else if (eppnt->p_type == PT_INTERP && pinterp_name) {
+            char *interp_name;
+
+            if (*pinterp_name) {
+                errmsg = "Multiple PT_INTERP entries";
+                goto exit_errmsg;
+            }
+            interp_name = malloc(eppnt->p_filesz);
+            if (!interp_name) {
+                goto exit_perror;
+            }
+
+            if (eppnt->p_offset + eppnt->p_filesz <= BPRM_BUF_SIZE) {
+                memcpy(interp_name, bprm_buf + eppnt->p_offset,
+                       eppnt->p_filesz);
+            } else {
+                retval = pread(image_fd, interp_name, eppnt->p_filesz,
+                               eppnt->p_offset);
+                if (retval != eppnt->p_filesz) {
+                    goto exit_perror;
+                }
+            }
+            if (interp_name[eppnt->p_filesz - 1] != 0) {
+                errmsg = "Invalid PT_INTERP entry";
+                goto exit_errmsg;
+            }
+            *pinterp_name = interp_name;
         }
     }
 
@@ -2590,33 +2619,6 @@ static void load_elf_image(const char *image_name, int image_fd,
             if (vaddr_em > info->brk) {
                 info->brk = vaddr_em;
             }
-        } else if (eppnt->p_type == PT_INTERP && pinterp_name) {
-            char *interp_name;
-
-            if (*pinterp_name) {
-                errmsg = "Multiple PT_INTERP entries";
-                goto exit_errmsg;
-            }
-            interp_name = malloc(eppnt->p_filesz);
-            if (!interp_name) {
-                goto exit_perror;
-            }
-
-            if (eppnt->p_offset + eppnt->p_filesz <= BPRM_BUF_SIZE) {
-                memcpy(interp_name, bprm_buf + eppnt->p_offset,
-                       eppnt->p_filesz);
-            } else {
-                retval = pread(image_fd, interp_name, eppnt->p_filesz,
-                               eppnt->p_offset);
-                if (retval != eppnt->p_filesz) {
-                    goto exit_perror;
-                }
-            }
-            if (interp_name[eppnt->p_filesz - 1] != 0) {
-                errmsg = "Invalid PT_INTERP entry";
-                goto exit_errmsg;
-            }
-            *pinterp_name = interp_name;
 #ifdef TARGET_MIPS
         } else if (eppnt->p_type == PT_MIPS_ABIFLAGS) {
             Mips_elf_abiflags_v0 abiflags;
-- 
2.25.1
