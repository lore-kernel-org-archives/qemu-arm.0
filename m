Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61138C87FD2
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 01:43:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiNiu-0007V3-79; Sat, 02 Aug 2025 21:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNiq-0007Qo-Pn
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:41:13 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiNip-0004gl-8X
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 21:41:12 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7180bb37846so20213957b3.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 18:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754185270; x=1754790070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tUId5F6z2x4/S6lLBlgo51rNHngTmeRrnS/Doi1yk0A=;
 b=sdnJQf6CZWwbbjELZeotEPvL4YA0/uzbjAo+Rdy6o9pUKHTGL3aM9CehfGSPqWiD21
 dpCQKhofeEIGXbdiFmJzYnv+HVi63p35bnELB00tF5OB3u5eLN7E7oPtzCRpxg6ovM62
 PyKyohAgPWlj6oJzd3vadvaMgg0Era1BVDmzusT6HOD716kQ3fZ/QkwMdf+i7+yjrATc
 Fe3cDNXeyr5rvIfcsXTmPjvfqLegzEl3Lq1zk+1r0PP0d6xASUeQAFdZBfIeMKI2mVsB
 jVpRtg718XV/Zs7afxndAzzBJ39w5uga5BBDbUkLXiQnedvBOKXubnPkidV+w2zIZu9m
 FSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754185270; x=1754790070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tUId5F6z2x4/S6lLBlgo51rNHngTmeRrnS/Doi1yk0A=;
 b=jM/dv2vXyKXbD+JZjExsDTwhtbKEQIhbWf7lzYjVrr5xTtlsJnZIdq/10EJy4BedlE
 q4p28lwtTvOs3lkHgokBiMV0VBa8zVArELf6KEouTRkQ5isGw4dcY1NLJMuWcUw6S60P
 xP7oCQ6GNO3jHhrRf19YROJiK79vvCOxw25n1Ugmwx6r1VX6s83bCok/b4Y4IBsRpWaK
 gvcK+zNZpDcWG4kUkHt8/quP/2g8tJ1Esy2wbPcCGNE74D2JoX2SFW78GTf8g/3C2YSL
 bFWKTn0ba3JHqKnJSq/ukzdFlMY1COKGyusm2QBjAnc6Aigoi+wgtV3iqvPi0ZK4ZQtd
 vU+w==
X-Gm-Message-State: AOJu0Yxfn6SEItcOYWpfUihi+7s91LntGZhgCJ6j9VcYxqZ1A/X21sP2
 msN5jke1KwyeDE3O0efoRKkTlIRt4jBP69pig2ZBHgv8FAYPhoGmdtSOBKEOR0CuCmU=
X-Gm-Gg: ASbGncuY5wJzX2I+nqy/evOWJK4YxhFs4P4AExpENipnf3CVH3yM2TXKFjCsZu23bTI
 ah4LS1TQ/3Kl3Ppv1bnLvLA6g0t8NkcZrXuhZn37dAQSXJ2GGfjCSC70phTW+BvVI/3TCg6zHbc
 JaOKQmqMQroRbycPHWo3uB41SytsA3na8wzz1ilw+IqXWE/+QnLiYCfFWhNTCuNJwvMIpEMhkUw
 YvoSzANau0DjzhFaKRUn8qRqvZBlkjzV6x9YFEgOfWBoUHhaBfMj3cPYEQ5EGRfhj7ysCabP2nL
 jnOLP3zyKabWI6E2ec4JnlPobnxllXm5oeJ6R0zLd+IwB/T93es7lVmk9KBHuaw1DqiyJW/lKww
 EajvS0i+RxDPaOxZfkEDHvtg0PTFYNer8TwX+9yl5NKTWnkSbVdb3/rZBJPUyBWM=
X-Google-Smtp-Source: AGHT+IHc5sazqexzGqAAVCEhhqq1068iphfmrDRigV+yvwhxVwmBYnu5Lbn6yAHDG6dEwpoMOuzkBw==
X-Received: by 2002:a05:690c:3382:b0:719:edff:65a3 with SMTP id
 00721157ae682-71b7ef6d3efmr63890327b3.29.1754185270289; 
 Sat, 02 Aug 2025 18:41:10 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71b5a6031a1sm18753227b3.86.2025.08.02.18.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 18:41:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/11] linux-user: Change exported get_elf_hwcap to abi_ulong
Date: Sun,  3 Aug 2025 11:40:18 +1000
Message-ID: <20250803014019.416797-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250803014019.416797-1-richard.henderson@linaro.org>
References: <20250803014019.416797-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

AArch64 is about to add the first 64-bit hwcap bit, so we
have to expand the return type.  Since the only user
assigns this to a abi_ulong, match that type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/loader.h  |  2 +-
 linux-user/elfload.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux-user/loader.h b/linux-user/loader.h
index e102e6f410..e1badd4393 100644
--- a/linux-user/loader.h
+++ b/linux-user/loader.h
@@ -99,7 +99,7 @@ abi_long memcpy_to_target(abi_ulong dest, const void *src,
 extern unsigned long guest_stack_size;
 
 #if defined(TARGET_S390X) || defined(TARGET_AARCH64) || defined(TARGET_ARM)
-uint32_t get_elf_hwcap(void);
+abi_ulong get_elf_hwcap(void);
 const char *elf_hwcap_str(uint32_t bit);
 #endif
 #if defined(TARGET_AARCH64) || defined(TARGET_ARM)
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index baa618d6c2..4ab6bcd50d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -511,10 +511,10 @@ static bool init_guest_commpage(void)
 #define ELF_HWCAP get_elf_hwcap()
 #define ELF_HWCAP2 get_elf_hwcap2()
 
-uint32_t get_elf_hwcap(void)
+abi_ulong get_elf_hwcap(void)
 {
     ARMCPU *cpu = ARM_CPU(thread_cpu);
-    uint32_t hwcaps = 0;
+    abi_ulong hwcaps = 0;
 
     hwcaps |= ARM_HWCAP_ARM_SWP;
     hwcaps |= ARM_HWCAP_ARM_HALF;
@@ -841,10 +841,10 @@ enum {
 #define GET_FEATURE_ID(feat, hwcap) \
     do { if (cpu_isar_feature(feat, cpu)) { hwcaps |= hwcap; } } while (0)
 
-uint32_t get_elf_hwcap(void)
+abi_ulong get_elf_hwcap(void)
 {
     ARMCPU *cpu = ARM_CPU(thread_cpu);
-    uint32_t hwcaps = 0;
+    abi_ulong hwcaps = 0;
 
     hwcaps |= ARM_HWCAP_A64_FP;
     hwcaps |= ARM_HWCAP_A64_ASIMD;
@@ -1825,7 +1825,7 @@ static inline void init_thread(struct target_pt_regs *regs,
 #define GET_FEATURE(_feat, _hwcap) \
     do { if (s390_has_feat(_feat)) { hwcap |= _hwcap; } } while (0)
 
-uint32_t get_elf_hwcap(void)
+abi_ulong get_elf_hwcap(void)
 {
     /*
      * Let's assume we always have esan3 and zarch.
-- 
2.43.0


