Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD3DCA0EE6
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:15:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXhW-0001Nz-JJ; Thu, 14 Aug 2025 09:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXhN-0000v2-Hr
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:08:54 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXhC-0005xB-H1
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:08:52 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b471738daabso722724a12.1
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176912; x=1755781712; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Xz5ywrXRvUgKRNtpJyxz8fg1SwzzhmCjpXpAJaxAoA=;
 b=LJ32U4ureI3Wb33fNOmeFtzovz99Q/CUhH6St/XgkUOdhhXCBgeuZk/fxzYE6ewUtv
 c/SB/HvIWLQnPf5eLzNmTQNc+DjUnbo4A9jz3+RLkhb3RzPHFFiuTwYLAjmZId279wsy
 cOBjrdvMo1CdI2JkQGBpkiSWVMPBizftCbCfhQLa4xDznV2O67HXah9xwvJEiL+vCNR4
 qhV4m/Zc39frMcN/Fd3zyXDcv6mlssGd0mMKRV8KX7lut+FyrssyT+4W8eByU8NsmZIl
 lj9rDxpXQhDPdEeSOw9kXEVlAPkde5UnexnGhKRax+sbuLod0KvJYz5E3x/3UEytSpYU
 B53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176912; x=1755781712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Xz5ywrXRvUgKRNtpJyxz8fg1SwzzhmCjpXpAJaxAoA=;
 b=KN35k5UKGUfz1KuuPxHzATdRHNh36rja6dLom0mbwcrLbEvhUdddI6GBDtuCioK04Z
 NW43PdRkBpafyO51tGXBBO4c8zvLai701y9nACJ+r7DKnIBPRwEpDxZF0Qwg7dBmqk7B
 qJHZDhwGk7Y/2PL3RcdhbqPPG8m5cuTT+tQnxhUZ724LdkCStoW69WsxRFHmVZAIlR74
 JHHymA5hs7d3B+FoQKIntr3mgJ8yb5FRF1XtsEX4mJOmc+wp0zz/7wF/vkmmtoe9iUzb
 S/pWAAINqrguAYEu9OjR2tUL4TMnW4f3qXm3grIQSCW8giEkzmWoTxQKN8D1ezSOWOIv
 CB5w==
X-Gm-Message-State: AOJu0Yz9SBLLEsi8++jP3+2pswGN1NQJJXZgn1nbVROpcsdkk7aQNTPK
 2Xj8qqSijUTDQzJ0UbVeRK/zwZ0QHVBM/aHDrUrRyVdM3sPJ84nAGj+9Zek78BY+NHajOTGQTRX
 +AQBym2s=
X-Gm-Gg: ASbGncub8Mn6BdBBS3dkLF8N50GNMv9Yjil1RiAJiszFTaRbui/EuWqdg5IrZsIyBCU
 eujUMrvfqoXGcqlD894fIO6IZclAD1YYb/cyYZDXvXuAQRcl4isRCskY1bDPOXA/CFgw+o+HO5j
 FqejtYUZRyzOJk+oUr55Acuajicod8S+dvNt6DIXR+vXBVztSbuMFk2CuBhcCys30tX/yqnzT8d
 ro4klLOO0zHE1VNmQazuMfZAokvPSTetI3fSvO0ggU/YzB618P9MfESdWEzVWXRyhdKTmJusIZF
 y+9FoL8SwXe2ERO+YWrKwPRrlhmTFKq66d6tTk+R1g4O097CAgkoViO/G+T22f9lynXCEDjyq34
 5nP66sJp1KdFt4oOVNSRRMfNnj4EaeWSZcdf4EXASa0Qxj5c=
X-Google-Smtp-Source: AGHT+IH8wCgRgx1Gxdk7EVHy9Jg2RPrVCUOg3vltmvLYl/U/TpbZyCpBsGuNGBEXDGi1bMcyO7flzA==
X-Received: by 2002:a17:903:228a:b0:242:9bbc:c775 with SMTP id
 d9443c01a7336-2445871c7d3mr43166585ad.56.1755176911664; 
 Thu, 14 Aug 2025 06:08:31 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24304c2943asm64438335ad.30.2025.08.14.06.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:08:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 81/85] linux-user: Change exported get_elf_hwcap to
 abi_ulong
Date: Thu, 14 Aug 2025 22:57:48 +1000
Message-ID: <20250814125752.164107-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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
index ea214105ff..d87d1a16e0 100644
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
@@ -1824,7 +1824,7 @@ static inline void init_thread(struct target_pt_regs *regs,
 #define GET_FEATURE(_feat, _hwcap) \
     do { if (s390_has_feat(_feat)) { hwcap |= _hwcap; } } while (0)
 
-uint32_t get_elf_hwcap(void)
+abi_ulong get_elf_hwcap(void)
 {
     /*
      * Let's assume we always have esan3 and zarch.
-- 
2.43.0


