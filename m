Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1781066lfa;
        Fri, 16 Oct 2020 11:42:24 -0700 (PDT)
X-Received: by 2002:aa7:9299:0:b029:156:5edc:a506 with SMTP id j25-20020aa792990000b02901565edca506mr5099404pfa.52.1602873744127;
        Fri, 16 Oct 2020 11:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873744; cv=none;
        d=google.com; s=arc-20160816;
        b=ADCYWD8mOUOBunYK/TVzuxKeGZ3dPPg4zNLrIEWVLfRp/pG5//GCfhSUdaZMBF2WXK
         DJ8F2IbZ/xKdsn9Lpr3/9j128uFgyQa9SJpeGpPiSvYeMSR6NRpGWATJLT8EDp+1m6Dm
         SfuofX1d+qzxLOz8zX9uYxGWNoQGre8xs/5gyRjjh3fOpeR8eQZpyahzSp3gQEbwPK1X
         KiteaF/5MA+hmmjLAmxJ4TD/sxZWeLtmpBnvP2+Lta9n7P49XVY8w8zIFoD8IIsXb7lZ
         rZS+f7aPwJX4VYU+j33na3MuBpjksxlfO+Xs/4N20WUw//bN4GLVOC+FZbSj0jyFSilP
         MAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=r7Om/lCAM0XeGEoR/BbgvQnU929VV6uqCsbicYkIs8s=;
        b=kYv754hsl0iLG3YzUMrU0M0mOHKKr6UyN9h0hNEDMMwMrYCOlrYLu9hEXutXDbmWwJ
         qfdZRxTYYbvnIJGn3/eSHUHFtTxtV69M/7/mVo65AXRikoIFamZS1OzdQA2RhKZ6iZ+c
         LkWgGzoilMvayv/GozEWS0n2se427lkLkzqx4T/0ADVcv3HAe+o5QXgUAnMBq2IsO8ai
         I1cppKVymLt7FZsawg6NXTzM8gBYw7UYSEGwiMOfIfWeaojUA2NdkvNn7yMCfVt6Sn/Q
         5w6WUVn9PD2MiApyV0ZTyBmVpGtc7WPnGhv5/KQKD6gaqI2Jr6hKbH1q3iyZcMIQ9yD8
         duCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nWnfj2+N;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r12sor1753708pjq.23.2020.10.16.11.42.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nWnfj2+N;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r7Om/lCAM0XeGEoR/BbgvQnU929VV6uqCsbicYkIs8s=;
        b=nWnfj2+NfwHyIX0khnpHi9q/tGs5ljebusoiCWy+naSMt1TlymRG1STYDRb8oYYr1w
         BMhKdsV2CufxXdeqs2lK2WMae0E6cV6p/ik9hhdmaaniQqxGQco4PiicvdaSz+4Jy5cD
         FpRr6Ty8xH5bfIv+ekHLKCgJBC8pPlEQFe6K4SRDGg1MrZSd7eX+Yj08Lu8VL1my1yAH
         U1C4wI9dOEqwN5REY4zLyIcS2Pzj+tXtpf/X7XCnrE1hxV7rWTruH9eMRp47jsfkod1B
         tPuVK9up/E06g5bNCDEkKx7sdPsjMR/FXY17P/Q0ZyzDxtfTzBBZqykJSWv+liymJifR
         a/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r7Om/lCAM0XeGEoR/BbgvQnU929VV6uqCsbicYkIs8s=;
        b=C/Z0yqMJu7WbZel9spRtA21pzQJqCZ6FQVwjb4QaNnvT61u9LvKMPEHiPVu/2lodgk
         4ATEzYCjDWA9NQ2ajuZI0E8+enSGmtOUdHGUW47j3mVTUKGao0R2XabNd/X0qhFCGoui
         BcNWcnnr+GOHBtneyhv+dPHbnpAxFMuxE0ia0zbjMMtt97lhyqA1LI7rNaiS9Ego8/ku
         Jo4cb0cUrYwaNY3E0HpLy7Kp8Wvc7y1p2/5Ld1fZhL+iaNZhryilyet2veeNv2pEI3RD
         /GyAude7X4ZHvXXTJ2wwmev5wujJj21sI9SES+s1QGQx1wE0rHJB/YMLpOALX/n36VjM
         VN6Q==
X-Gm-Message-State: AOAM530J/t6ee8o3TjFkJmGdmtbimwsJyduqge5e/SOQMBPUJamBvDcF
	LweDukby6n8QFdJTPAU3EbyoDGsZ
X-Google-Smtp-Source: ABdhPJxzALA8rRT2Is4FUDpsg+Rnn0qMwOW69zmiptnYlPkxr06rDzUX7Hyt8oLEJz6QZVjztVdGsw==
X-Received: by 2002:a17:90a:c285:: with SMTP id f5mr5594904pjt.87.1602873743570;
        Fri, 16 Oct 2020 11:42:23 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v11 09/12] linux-user/elfload: Use Error for load_elf_interp
Date: Fri, 16 Oct 2020 11:42:04 -0700
Message-Id: <20201016184207.786698-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vJ16BQcLHApk

This is slightly clearer than just using strerror, though
the different forms produced by error_setg_file_open and
error_setg_errno isn't entirely convenient.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 56fbda93d0..04c04bc260 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2675,26 +2675,27 @@ static void load_elf_interp(const char *filename, struct image_info *info,
                             char bprm_buf[BPRM_BUF_SIZE])
 {
     int fd, retval;
+    Error *err = NULL;
 
     fd = open(path(filename), O_RDONLY);
     if (fd < 0) {
-        goto exit_perror;
+        error_setg_file_open(&err, errno, filename);
+        error_report_err(err);
+        exit(-1);
     }
 
     retval = read(fd, bprm_buf, BPRM_BUF_SIZE);
     if (retval < 0) {
-        goto exit_perror;
+        error_setg_errno(&err, errno, "Error reading file header");
+        error_reportf_err(err, "%s: ", filename);
+        exit(-1);
     }
+
     if (retval < BPRM_BUF_SIZE) {
         memset(bprm_buf + retval, 0, BPRM_BUF_SIZE - retval);
     }
 
     load_elf_image(filename, fd, info, NULL, bprm_buf);
-    return;
-
- exit_perror:
-    fprintf(stderr, "%s: %s\n", filename, strerror(errno));
-    exit(-1);
 }
 
 static int symfind(const void *s0, const void *s1)
-- 
2.25.1
