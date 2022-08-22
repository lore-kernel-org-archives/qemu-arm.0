Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1003624ejc;
        Mon, 22 Aug 2022 09:13:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4AJ5lx92SHaoULE3ERqJDHyGJ5dG6r4pMpfNUNkEkGDmanLy0zdIddTZy5b6kFTbdjGtBt
X-Received: by 2002:a05:620a:1512:b0:6bb:2393:7520 with SMTP id i18-20020a05620a151200b006bb23937520mr13361266qkk.488.1661184815255;
        Mon, 22 Aug 2022 09:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661184815; cv=none;
        d=google.com; s=arc-20160816;
        b=mhgF/KS4CeIAlppjvuvtC5XZSdcUnePrfi+SKRAiReQgBlbd/TZ6LVwiecIB2JWGkT
         PGa78/8Lp11XjWXDZYjTOwf9phDywZ3AUE+aqjinWbCMrhIHOZ73Y8xDeRW8Tv9QP09t
         i1gcntIZatwP4bs5nsXpycP9oudhD+d1koS7/4cr48PpKtgGs9FVefuwSfy+vkTKDgcM
         uxIlpiZroJwa2ah+vqPHwD54+5+0futv4oiCmD1ni4Otxg3kWVddQ1IkdGCgVXLEs3Li
         7qEUYj0Ki2K9tmJ7CwlI3peGm9h9Fhg2gBatVRtCav1M89DSUxyJG1OtXjVdws2gZDpF
         XWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8ckYZp2ZvZbbjSC1kLgVsysS87kN66e9geBqNJpjIqo=;
        b=ahQNDBC3/E3eC1R89bO4tYV8JA+U6fAOB2Hr7Af8Zu+yUOu8lT8jo/hUEdYnOApWuj
         S9U7CwYQ7Zjagjcu8jBMnpFGZb8RIOH+IIY3TAVqXsrpuzqqaiy4m7F8YBCbkfq+GCve
         Cyv98zC1JpSvj5A0JKkqEBFikuTiAlPjbr0DQtc7yubn7ZjNjh94mxYhSpmOg7K0XP6J
         MmVZo56uQWd3r9lQWSYo4SI6f4iIBxX1DLC6C9zEbzLJsMopmjuV+sazA8rxOYgXPFV3
         e/dFDWNg0V5OzPGKAWK/Q9Rs8cFtl5TiHU8wFflH+pY0rHIcnr4VfNho6vrKGsi98hEL
         2h6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rNkciHAZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020ac8108e000000b00342f2d7ef15si4533818qtj.482.2022.08.22.09.13.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 09:13:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rNkciHAZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQA3S-0000Vm-CG
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 12:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9M0-0000o1-6S
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:40 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ld-0000f0-Sm
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:39 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x23so10232024pll.7
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8ckYZp2ZvZbbjSC1kLgVsysS87kN66e9geBqNJpjIqo=;
 b=rNkciHAZFqKS7O33KhCFPzLUzUp+7gcxaq2LffmReh9wVXWXJVSJhwt6k29lxjVg6j
 inSKnsPuhcMretBF7rcT9mn7KiCt9imGW5Nzjjws2AeIcKjG0/sjO7wk5A45WriVDSM3
 OmrnVWDTd9tsAL4mEOwT/Ng4SOA8Xw6vfJtl+P2kgpCrf1q7CQfTQoqBc3rAzAg3ELt+
 gPUtcqUFUhgpxM0JrVQp8GqZX5+JdU8gAdrVTdCl1gCELP3no74NivpEFqlECHcQuini
 ol5K6k6gWbjRFvHF25r6hM0jjNJJ2COBqK1YbR6MtohxjA35NagXn+zhTGe2g5eDRIib
 mhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8ckYZp2ZvZbbjSC1kLgVsysS87kN66e9geBqNJpjIqo=;
 b=vkC7ZR6+tucwT339rSoMtwpwb17/+llKDSpc3BchfkgonRO2fJLKs2YI7GjgoIZpdv
 QDzrHxS1JJP2GXFNN3wCD21/a22Hm3XgI0viHbTYuel8fMsn8Y0S31CAYbTkzsQdJaI6
 AkIxUnju6WW340ya3Tx1hqxhP0hrvHTyugu8fcuDeDRGI+z6waiNtDmyZq4P/4MuCfu7
 UoGilM5TzwvWJQV0KcHA3UFo0DYvVMpjYSAhDp3R5btdUZQUuE7/heZc4DBxD5gzz7YI
 tjd5qkNGVpQpsmpqgqysmEd943o6S4SYcqERDFRwRIUO3ltsgFqQGs6EF4fEs+Dr+ev7
 o1vg==
X-Gm-Message-State: ACgBeo0MNPp/T7nWw1qgcML0XQBvq+1SNHCK2CzQ5jAT4I4tzgp7+4cr
 D2CQhSqJvRiALJK+ZT0l68Q6gBP8DG0vcg==
X-Received: by 2002:a17:90a:1d0e:b0:1fa:bf2e:a56e with SMTP id
 c14-20020a17090a1d0e00b001fabf2ea56emr25998470pjd.23.1661182097106; 
 Mon, 22 Aug 2022 08:28:17 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 38/66] accel/tcg: Drop addr member from SavedIOTLB
Date: Mon, 22 Aug 2022 08:27:13 -0700
Message-Id: <20220822152741.1617527-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: B5I/Q4hG2Uag

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
index a37275bf8e..1509df96b4 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1386,12 +1386,11 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
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
@@ -1420,7 +1419,7 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
      * The memory_region_dispatch may trigger a flush/resize
      * so for plugins we save the iotlb_data just in case.
      */
-    save_iotlb_data(cpu, full->xlat_section, section, mr_offset);
+    save_iotlb_data(cpu, section, mr_offset);
 
     if (!qemu_mutex_iothread_locked()) {
         qemu_mutex_lock_iothread();
-- 
2.34.1

