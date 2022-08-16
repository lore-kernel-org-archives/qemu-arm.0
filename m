Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008836ejf;
        Tue, 16 Aug 2022 13:34:12 -0700 (PDT)
X-Received: by 2002:a05:6870:340f:b0:118:1d8e:7d4f with SMTP id g15-20020a056870340f00b001181d8e7d4fmr140402oah.121.1660682052528;
        Tue, 16 Aug 2022 13:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682052; cv=none;
        d=google.com; s=arc-20160816;
        b=SanjZwgpSX7pyfFCylimeJRkImqGYBBMoMQVnbOSFzEYLbKeV7owlazeUTAVA7+Nsq
         hKz2bR4dzDDQpg0LTMPLzc30YPJWuMfe/XHnqW6h891OT6nM08X/6zD9K+RXLXYhAKS3
         5pXM2wx2mHDaASqmKmJXVBeUzeWvTasR5ST1ZW4l/m9oREKbvTLpM8a1ee4aQl4gPy7b
         vYkNC7BNVvbc9dym6x2BTUz7YpFWUqdNFzXyYv7mfFrCqPbufPfH9fuYJN4RmLsulqMT
         E2SKwQkrJk2g7yQ6g1nk3DBnN6UdOEpQcOacRJldG0LdnKyuhWkbx6pC0z9PQ0ERHGBy
         Vh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X+2CEfgvZFxpq8e6EY+n5lvWBzz+vc8fFcrenQ8ZGDI=;
        b=KRY1xgFlndwNffMvNjyHmtJYz4WRVB44QCdn8jSfUHVYLZ/JwZeNaXNHKgEtXYXiva
         zvuE3rEkfJV6Y6blnE/IVQl+QEQq5OUxGfGCE8Ek22xiAt5A5A6q6J+zDY5CR/3XwPJf
         dd3W/hqt8/CwDJNoOZqwKgueAC04N2EwbXLQvVZP1Vk/9ErNNoz4xaszgd/OkO1Z9zwJ
         98dpRjyjLNNm8oYs0Rv7TU06wAFGKJjlQgSjKOCGHUZ2bl0xX+1F5+RQq5Ih5n/TdLzA
         SHvLRwb1mCMuBpmpCgbrcgijBdQXMxiaqF92E+TJR0I02gy3m3BtwjUOzOiydNxDLnC3
         vHXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wxp36Q2m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z20-20020a056871015400b0010e86463650sor2356018oab.124.2022.08.16.13.34.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wxp36Q2m;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=X+2CEfgvZFxpq8e6EY+n5lvWBzz+vc8fFcrenQ8ZGDI=;
        b=wxp36Q2md0qnMRWC7iJRWrPljfk3YY4ss/v5NNmDqz9qd8HChkrMXEGw0Loj4dkLge
         Wt+QpOsbZhnimu1x3djtflOdpVih/xCGv9eTfUjj2tjuWiwMJ5Ldl+iDOlevU0ZLaER0
         GLVx3J+sWamaF93Oaekmt1B/ku/w8KBZ/EdabhHGvyewIGKKVzMKXUbWaCwW3JEXyRBS
         PfNEKlL2fUst1eK4mkqlJMk3Y+2Mth0a+w8GRQAcB27FBiOsUqBOyd2ziSAzBsQRllAu
         6Vkd4Z26TZ6Ev+NKzA5Vl11jrVX70XrkqWltEQGdCLey7vTXNc9IxaJV4ut3KRveN8KV
         zc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=X+2CEfgvZFxpq8e6EY+n5lvWBzz+vc8fFcrenQ8ZGDI=;
        b=ekk1WiWTjt2uOujBDDQV0wjoGNuL+lLSQVlwTwDfwpbM5nqTxlpuqnLqlkz6gfXESm
         UFF8Am0VRiwGQkpPaZZlWpEjBoVQevOt3a06yJyh5xJSfIWz1AQsk2mcwXYUhXD6yV0v
         9GN/jl8LEu4d0lWtxU0wiRfNOTRKuurt/19YtFBTYzpUYCafbeRNdzNlItd/wjq0Qh7P
         fkbOPX/XI1Ta6csjkkeFTR7tHF4KAofzZm6R1AcE1vMLL4jPb3P63uAWQr2fadPcBMho
         bz3wxmMi4th7XLbQTkbM+6IHgag5a0sOO5m+y1E0PX0IMCJATRKxO90pPby7sdtBFLOB
         DrGg==
X-Gm-Message-State: ACgBeo3rXn4gVTzrjlK6AwwR7/0nhCtvKamRWZExmYP/J4ZK004kxlvm
	TS11Ai9nL9JE/7TjT42b1ewTivBa
X-Google-Smtp-Source: AA6agR7AIyM0meJ38Q6g7vrxciJvzvnNhOeXxjVBeJC07Wx/zrjRlGJ0TyATHceV6K26OZb1lTWVVQ==
X-Received: by 2002:a05:6870:4251:b0:10e:6ca2:5a29 with SMTP id v17-20020a056870425100b0010e6ca25a29mr161727oac.100.1660682052144;
        Tue, 16 Aug 2022 13:34:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 03/33] linux-user/x86_64: Allocate vsyscall page as a commpage
Date: Tue, 16 Aug 2022 15:33:30 -0500
Message-Id: <20220816203400.161187-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: VLAWPv//S13J

We're about to start validating PAGE_EXEC, which means that we've
got to the vsyscall page executable.  We had been special casing
this entirely within translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 29d910c4cc..d783240a36 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -195,6 +195,28 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
     (*regs)[26] = tswapreg(env->segs[R_GS].selector & 0xffff);
 }
 
+#if ULONG_MAX >= TARGET_VSYSCALL_PAGE
+#define HI_COMMPAGE  TARGET_VSYSCALL_PAGE
+
+static bool init_guest_commpage(void)
+{
+    /*
+     * The vsyscall page is at a high negative address aka kernel space,
+     * which means that we cannot actually allocate it with target_mmap.
+     * We still should be able to use page_set_flags, unless the user
+     * has specified -R reserved_va, which would trigger an assert().
+     */
+    if (reserved_va != 0 &&
+        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE >= reserved_va) {
+        error_report("Cannot allocate vsyscall page");
+        exit(EXIT_FAILURE);
+    }
+    page_set_flags(TARGET_VSYSCALL_PAGE,
+                   TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE,
+                   PAGE_EXEC | PAGE_VALID);
+    return true;
+}
+#endif
 #else
 
 #define ELF_START_MMAP 0x80000000
-- 
2.34.1
