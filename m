Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1781025lfa;
        Fri, 16 Oct 2020 11:42:21 -0700 (PDT)
X-Received: by 2002:a17:90a:6985:: with SMTP id s5mr5284539pjj.17.1602873740799;
        Fri, 16 Oct 2020 11:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873740; cv=none;
        d=google.com; s=arc-20160816;
        b=fSJTvO0Wg0fgV8r99UyXdAF/JMoXWbqVCEbErC6OuOOVL9CQsexH6pjJ4hnriEZp84
         ILb60d01+oMUl+vq5ot1rIQud+qnpUYT911M2S0CSllpIw0BJ4sDODN6z7aGeEJVDpAO
         Pc86UxV+0M6FCbcYg/GkszEyy2qVOSEb7CmJbw9z4lpzyAdXqyTnqH3+ujzgVttwMEVL
         Xb0mAAy8o0rkWqe/RqP2Hv4DD2A5Xuuayes1babcbatf/S2GdbR21H6BYCCKp2Lzw+jL
         UluggAMRNkVbFjBYmqUsD6V7IgBTNTYbo8QFCRtJha1/39XZjbBKOnWN6tirRdqt0IIB
         WACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XLExgzrLRIoZ+1AkNjtHtGQ6oai05Dc/yN88SMU2dO4=;
        b=H7TETOO4/E5STb2wF0PfDC4WDTJy7P8rIpaG1hnMJEODGeuZRrj9nnil/zDSH3hEZ6
         N3J0jyoYRShexs7vwOksstUdV7/yDPI9zobKyKch+/nKPViLFECLuswci1las16dTv5w
         oOaVP+g6QjMzGEqmu/dbZ46ah7OV6yqu+tbnA3QD498XD6O9wobhaC+YkaIXo7PFhjBH
         21xVfD6TD6GZYanUKe4TVMYNZd/Whvda0xqiNVJTf4oJQBl0kyGZzUofOJT6kNc059MP
         CJM7gTrI874ZKDychOX1KKQSpIC3LfYor+MUo3Si6UqOJJrt5rVkwnIQpfKKO8rdlBxm
         wRzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hPk1qod+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f5sor1641067pfe.21.2020.10.16.11.42.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hPk1qod+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XLExgzrLRIoZ+1AkNjtHtGQ6oai05Dc/yN88SMU2dO4=;
        b=hPk1qod+fK8AtQQrSb7TPV6K9ZeH6o4v5Hy6KIGmSclYFut1xPUDzTFQKBacGsalLz
         nQW64DIwzktBdMA+Nl1k0fRJQv7vPs5h2oruYo59xIbLxcSnQ4AkvW8Yp1pIql7mHZ6b
         VEkCAPTkO39Mjd0oOKm9ZurYx6KKpEHiSvo6UTa/2yZTRouCkZNbVVCCjEkmKmGdCPD5
         +kSi9O+if6bYOraccuVhleCD0gEl5h2tNFu1xUue/G7Me4ieOABxhdcRp/5LMOwX9cJN
         +hQalGw5bK/I3fr+mAGXcahuMiyrgXEbbnP/EoUgafb/mOjc2M3ChfVCSQJG+1K9wQqe
         Kg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XLExgzrLRIoZ+1AkNjtHtGQ6oai05Dc/yN88SMU2dO4=;
        b=l9ycjNGExBjoAvn00I5YRSWpiBpvu+lh8Qy10Sn1UfXDiDOgmNOGloqrtrJIhCR8la
         WjZ3kE1/1QEaShg9lN5UzTvL07KL0XOfdss0LZb7X6sYrjokGsctunZVLw1t6cvPhNn+
         EYOPbxq34FjIo/beowrwCoRkB04NtmtJlEyLTn1Fem6B7ZcDZcaZiqTC2cvtWGGxVIzn
         hbkftLxljI/zrswd+6Pt6Do97U0DR8QTJgtsyBVM2PDA64qtBcUzfQdu+UJWa9hi1bJO
         fBpOgzdN5V5EljW75JIcpgViGIO0+XYgViBqLxCle5MzRQPH4AkugEDGXTnZKrrVHkwq
         q6dg==
X-Gm-Message-State: AOAM532NlMZU03zJNSe5GjLS1ZKH0mRL3Yip5CU4CVBaypQUPaieHuh+
	opg9QMKkCjHkayZl7E+SX3W6cUOr
X-Google-Smtp-Source: ABdhPJweavnub6Y8gAoYuo2wCaYnYwsqEqkbeNMd+w8JQVgmsJQTAjEUSGzlkVW+97s/Ltt5clFI8g==
X-Received: by 2002:a62:7ad3:0:b029:155:7c08:cc9a with SMTP id v202-20020a627ad30000b02901557c08cc9amr4956913pfc.28.1602873740299;
        Fri, 16 Oct 2020 11:42:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v11 07/12] linux-user/elfload: Move PT_INTERP detection to first loop
Date: Fri, 16 Oct 2020 11:42:02 -0700
Message-Id: <20201016184207.786698-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QBlxzVzEj45u

For BTI, we need to know if the executable is static or dynamic,
which means looking for PT_INTERP earlier.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 60 +++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 210592aa90..107a628a9e 100644
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
+            g_autofree char *interp_name = NULL;
+
+            if (*pinterp_name) {
+                errmsg = "Multiple PT_INTERP entries";
+                goto exit_errmsg;
+            }
+            interp_name = g_malloc(eppnt->p_filesz);
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
+            *pinterp_name = g_steal_pointer(&interp_name);
         }
     }
 
@@ -2590,33 +2619,6 @@ static void load_elf_image(const char *image_name, int image_fd,
             if (vaddr_em > info->brk) {
                 info->brk = vaddr_em;
             }
-        } else if (eppnt->p_type == PT_INTERP && pinterp_name) {
-            g_autofree char *interp_name = NULL;
-
-            if (*pinterp_name) {
-                errmsg = "Multiple PT_INTERP entries";
-                goto exit_errmsg;
-            }
-            interp_name = g_malloc(eppnt->p_filesz);
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
-            *pinterp_name = g_steal_pointer(&interp_name);
 #ifdef TARGET_MIPS
         } else if (eppnt->p_type == PT_MIPS_ABIFLAGS) {
             Mips_elf_abiflags_v0 abiflags;
-- 
2.25.1
