Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2575140ejh;
        Mon, 5 Sep 2022 13:27:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7f0aVlQaL4z0Hrqg8TryAKiqBS2C47ahqeCpSqa6WwPf/UtqKfh2ijDRm+/5cAfsLYHPXK
X-Received: by 2002:a05:6214:d4b:b0:498:f95b:108b with SMTP id 11-20020a0562140d4b00b00498f95b108bmr38226572qvr.88.1662409659200;
        Mon, 05 Sep 2022 13:27:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662409659; cv=none;
        d=google.com; s=arc-20160816;
        b=F+JDFgucz9EhUna2FXQ3VFSyilbvL2pj6cIK2HjjXRrJLkH2/zAXAyKoosVDRTJrZW
         7gq5aLSW/tB9jTSLQ984VDh8NWWH0vbXSrkLE1QcEPFuFmmzhE5t86tY3GEv2HVqI7HP
         kLohyjjnxJeu2M7J3Ksn7B+mnIyoGEIl1lMrzqVBXztbjKQlvFw8SXMfAVpLnMD38uH8
         vL6vmoBp70NwqO7ZTKH4hOLwRWKg+PHWRxRoiKncDB9p9MqB4NZRB4kN4h8KTqTRhV/T
         6LjeTF4jt61Mp5ldZiPAjWqordsF8OqNdu0MXUOaPptyJZiEVq14rtQSSz81RUbhJI8c
         BoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eGrlsO0BMtQ4NxQnZcrpPpgvXA47KiMUFyTlQ1QqPPg=;
        b=WKyNw+4Gs88te5vgTyx3j5O9ZwlsCa51JZCAUJjIfQ067h47K7D6+18sUtJS1WRjoZ
         nXB9qvv5AYG3kn9X1b4hMzW3/svFxP7vBwQ1A9MLulKKAy79LTOPexUdlnKmK6Gx9Tuh
         PQkcwBo74OwBjbDfa35IT9kkVKBWjCWYH+vbV0asWkR/EZjfQKiU0k3GdaX7ea8xTLeX
         ojuRRrkiAxUhmi+g5GfE6irLEMYs2ju4C8mbECMAi/5jYAa8SwmdZwOT0wvnwTfjuURC
         pDhZJB6mEJHjZeP6rwkOH6JmrwESorPFUE5bkMOOzzGp3iFafMdDWjE7/RQuZjy5jvPz
         FNrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LRp8+N3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gb13-20020a05622a598d00b00342ec7a60fasi6211780qtb.547.2022.09.05.13.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 13:27:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LRp8+N3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVIh0-0005Jr-Nb
	for alex.bennee@linaro.org; Mon, 05 Sep 2022 16:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIch-00079d-O3
 for qemu-arm@nongnu.org; Mon, 05 Sep 2022 16:23:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIcc-0004XO-ND
 for qemu-arm@nongnu.org; Mon, 05 Sep 2022 16:23:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e13so12650046wrm.1
 for <qemu-arm@nongnu.org>; Mon, 05 Sep 2022 13:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eGrlsO0BMtQ4NxQnZcrpPpgvXA47KiMUFyTlQ1QqPPg=;
 b=LRp8+N3XL1ner0hOP84QK19qNd5NWTnug8fA2epM5FIjqPNiqDmJOIJ/Uh39TY1hWJ
 xA2llEheBoDn29HR7Ufg2ckrxaW/X0S1Jp1ugrkMKFdIZAtLBdyV7cXJJnFSmWU/aqHC
 ysgY7wWZocgSs+BqDMQA3l3+6NzmMII00vXVZZEiM+NXfO3cCvMOVxJVuNPng1E6Rg/Z
 haX6yDnXyntzVVd8uNU+CQTNzcDSIJxoJ0HedphCR5pp6jdgyUJAgSYiSZWwQ1Be79Jj
 WV/eSgQH2mPeOw9KKuJMfSCii6URm9FADwVYg2nOmUXPMFECrYe4KzTnXSYo+ycYumtd
 nugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eGrlsO0BMtQ4NxQnZcrpPpgvXA47KiMUFyTlQ1QqPPg=;
 b=pVOG0X7i529PnSugudBG51p/hJ0kzGqOOO6pb3g05AmOVQy2bRxYakyi5gDoENrDNj
 df9Ir2QFYoHp4xEa7dJF+JUFmf20d/aPJ/eo8NiIMXtOlZ3cujZoUw6h9NXcpsugR2Pv
 Me/cyONdSS3s3bKW8yqodonl72+Une7adpe2IWevcuwmAP8T+MUFn3mIi9JH9FbM+++S
 kdi/h9iqzFwqPmUp/eBkUbl7dEcaHU6+Xinbc0Ln+STZiJEH+bK3ij8bdSVNEiG4q5J4
 LllyEmO/64JkUVKh/2qbdFjqLO9zs8FuoL7WtoPlQ/2Z54wErpZ7WjALy8AYO4R7yFUJ
 DNJQ==
X-Gm-Message-State: ACgBeo0WF8JfgV1Gr0YprhHZIhOi8K6zH1d41HdZa6p5ZyLBcGPyam6Y
 tHyiqiEzfs7AcxEISsURHBaJgQ==
X-Received: by 2002:adf:f8ca:0:b0:226:e456:1896 with SMTP id
 f10-20020adff8ca000000b00226e4561896mr753191wrq.177.1662409384140; 
 Mon, 05 Sep 2022 13:23:04 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d56ce000000b00226d238be98sm9472404wrw.82.2022.09.05.13.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:23:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v3 2/6] accel/tcg: Drop addr member from SavedIOTLB
Date: Mon,  5 Sep 2022 21:22:55 +0100
Message-Id: <20220905202259.189852-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905202259.189852-1-richard.henderson@linaro.org>
References: <20220905202259.189852-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d/I9M6YG1h1G

This field is only written, not read; remove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 1 -
 accel/tcg/cputlb.c    | 7 +++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da13..9e47184513 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -218,7 +218,6 @@ struct CPUWatchpoint {
  * the memory regions get moved around  by io_writex.
  */
 typedef struct SavedIOTLB {
-    hwaddr addr;
     MemoryRegionSection *section;
     hwaddr mr_offset;
 } SavedIOTLB;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4585d7c015..03395e725d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1374,12 +1374,11 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
  * This is read by tlb_plugin_lookup if the fulltlb entry doesn't match
  * because of the side effect of io_writex changing memory layout.
  */
-static void save_iotlb_data(CPUState *cs, hwaddr addr,
-                            MemoryRegionSection *section, hwaddr mr_offset)
+static void save_iotlb_data(CPUState *cs, MemoryRegionSection *section,
+                            hwaddr mr_offset)
 {
 #ifdef CONFIG_PLUGIN
     SavedIOTLB *saved = &cs->saved_iotlb;
-    saved->addr = addr;
     saved->section = section;
     saved->mr_offset = mr_offset;
 #endif
@@ -1408,7 +1407,7 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
      * The memory_region_dispatch may trigger a flush/resize
      * so for plugins we save the iotlb_data just in case.
      */
-    save_iotlb_data(cpu, full->xlat_section, section, mr_offset);
+    save_iotlb_data(cpu, section, mr_offset);
 
     if (!qemu_mutex_iothread_locked()) {
         qemu_mutex_lock_iothread();
-- 
2.34.1

