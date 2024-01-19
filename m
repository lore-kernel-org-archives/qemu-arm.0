Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp880681ejg;
        Fri, 19 Jan 2024 03:41:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEncIJ+KlM8l9aFgdRHdXAv5YJQQQg06UzEBj2heKDN8RRCb9OweQvB4hrLymMmSNzheOhG
X-Received: by 2002:ae9:ea02:0:b0:783:3002:b789 with SMTP id f2-20020ae9ea02000000b007833002b789mr1100450qkg.51.1705664486290;
        Fri, 19 Jan 2024 03:41:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664486; cv=none;
        d=google.com; s=arc-20160816;
        b=twqbarBx//J9ZUvvoQQegpFMc+9VecUSCVFqV7y999ed9yUA/CTxm2/iIiLyHLUToN
         wUY6pvlpS22IUCyZYSBTxc3xo5stdlZG/fSAZJb30glMufeO0iHn0Vk3in4++NZ8vOFU
         7jeVg6mGMzBYWlGKP21VM8qE6SbulY1w35Xa4G7STd7iJR90Osaq5yoM0bFIpn+S/SV7
         16oEZXT/f0wNOa0BkOHMVqaUwgtN8NW6DNMfZTfhI5YbTUaoa+OfIXrqdKPlFkdPAQGD
         4kY++VzljUmoLrZh5as8GqgaQHWBP0hRmBmq6sYSZDSrfuedyx5DAXebPJrGA2XzY2zq
         hZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PRuBRVEWPg8k5cL0C9qDEuFeMVHGZcEBcpFoyN0cEVQ=;
        fh=0x3oxSDM+3B1iq7MNcEDPiiYDxF4jnBXeQY/LXh8Yxc=;
        b=jv1x5ZR3y8+w835kINHV6296nct4v7gLmL9XDtvozMvInSOZE6MgDbeAU9YTtaoYJY
         VTJ8yR4yFP/6paxkpWoyJNSH23Z7NetvTgrAqueRdMBggMClFGcp53RV3Ym5OIQGAgOj
         ccmSjCMMjrL1i5CpHfDEFQCP9wVSIZoGVvHzAQD7rfViOYL2/PmMUeEZClk3R7o3Qzfs
         KMQtS3MuUj0hxP4RxTjA0GIAwprB38o7l3qkk5TH++2n3rY1fQYUmiMJcZlX/LlfyK1g
         QJBSR3XfvE1Ms1SX9Qkx0cNZGqxhPN3iwWGmnXUp1mw/u8AIz/PxZliB57kCJQ0XWrdF
         Fg4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EMVAxAMr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020a05620a147100b0078158194a58si15622862qkl.556.2024.01.19.03.41.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:41:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EMVAxAMr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnA6-000219-Mb; Fri, 19 Jan 2024 06:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnA5-0001zg-4g
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:49 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnA2-0000H7-93
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:48 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e72a567eeso7432695e9.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664145; x=1706268945; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PRuBRVEWPg8k5cL0C9qDEuFeMVHGZcEBcpFoyN0cEVQ=;
 b=EMVAxAMrrzUnjsnO7ApWlfOIu7VNaPwPDdRXqzgzqvcoRUYR2UMjH/dU9JDn5o3tB2
 g4sPh+YrgMNowicgedvP/qPWXRDTJeB0mQurnCO2bBAUROZwOh18nksK2ZfsfD1cT6j5
 pB42Hh4d1+usxIxhOaTkSnzG1mBnu9xD/LEUO+65bmGlUXtfgwgrkot5T/bzfkEctact
 7z5N8TIYa8AOpxVWyWRgXhnc5G4JjeNNUna2QJUho23GrzfWr3dW5pOb0/UI9gFqa3rN
 op4PS+HMsB0neOKJgtyPbp0njObQjitiAJixKF4AgFpGh4eyPS+ZRE4ApmY8+yJ0ezRC
 RFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664145; x=1706268945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PRuBRVEWPg8k5cL0C9qDEuFeMVHGZcEBcpFoyN0cEVQ=;
 b=jy/xvk5vp3K6QZWuvXFpBPqD33D9A7baovssaiotexiYbPt9Rn1sbGNF5T19sr+LDK
 ufY1xgBuHZK1bSvjy3EM5lEjkjr1FjqtXeDL4VAUA1dXv0LU7uDPiTKJnFgLJXxpGX1E
 9b4JnCP1JFK5ITXJSr5DuMZ+hwhRpYGibaSKvu2I4fvEkPJ8aG5DIdcUxK3uqSa80Eg1
 5PNWJSHfifUaiKAcfSrYSfipgz8BD/Pcv7nejbCpQwSGg7ijmF6okJrMIp6li7ae3e07
 UHxCUS8FYP6aIM2c0ao9HN0ZDk96EXkVS63Ffm3uIE4rfIEmspIIiq4loc6/QfHAvhwu
 tlIQ==
X-Gm-Message-State: AOJu0YyweYeuxpzvIMIOCpQmhWC1j63MZTk+5lnVAGWpL+R71U3C5CHW
 dAhOrz1NeX2txvCyM99zh2lxXxirwG/MQEntbbpjWwxHjXoFz4mcsqXbAH1K5C4=
X-Received: by 2002:a7b:c4d4:0:b0:40e:7611:e52f with SMTP id
 g20-20020a7bc4d4000000b0040e7611e52fmr568136wmk.315.1705664144965; 
 Fri, 19 Jan 2024 03:35:44 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c459300b0040e42391a12sm28532667wmo.13.2024.01.19.03.35.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 08/36] accel/tcg: Remove tb_invalidate_phys_page() from system
 emulation
Date: Fri, 19 Jan 2024 12:34:37 +0100
Message-ID: <20240119113507.31951-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oyZeTWfzG2g5

Since previous commit, tb_invalidate_phys_page() is not used
anymore in system emulation. Make it static for user emulation
and remove its public declaration in "exec/translate-all.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231130205600.35727-1-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translate-all.h |  1 -
 accel/tcg/tb-maint.c         | 24 +-----------------------
 2 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/include/exec/translate-all.h b/include/exec/translate-all.h
index 88602ae8d8..85c9460c7c 100644
--- a/include/exec/translate-all.h
+++ b/include/exec/translate-all.h
@@ -23,7 +23,6 @@
 
 
 /* translate-all.c */
-void tb_invalidate_phys_page(tb_page_addr_t addr);
 void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr);
 
 #ifdef CONFIG_USER_ONLY
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 3d2a896220..da39a43bd8 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1021,7 +1021,7 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t last)
  * Called with mmap_lock held for user-mode emulation
  * NOTE: this function must not be called while a TB is running.
  */
-void tb_invalidate_phys_page(tb_page_addr_t addr)
+static void tb_invalidate_phys_page(tb_page_addr_t addr)
 {
     tb_page_addr_t start, last;
 
@@ -1160,28 +1160,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 #endif
 }
 
-/*
- * Invalidate all TBs which intersect with the target physical
- * address page @addr.
- */
-void tb_invalidate_phys_page(tb_page_addr_t addr)
-{
-    struct page_collection *pages;
-    tb_page_addr_t start, last;
-    PageDesc *p;
-
-    p = page_find(addr >> TARGET_PAGE_BITS);
-    if (p == NULL) {
-        return;
-    }
-
-    start = addr & TARGET_PAGE_MASK;
-    last = addr | ~TARGET_PAGE_MASK;
-    pages = page_collection_lock(start, last);
-    tb_invalidate_phys_page_range__locked(pages, p, start, last, 0);
-    page_collection_unlock(pages);
-}
-
 /*
  * Invalidate all TBs which intersect with the target physical address range
  * [start;last]. NOTE: start and end may refer to *different* physical pages.
-- 
2.41.0

