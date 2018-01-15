Received: by 10.28.173.206 with SMTP id w197csp3096657wme;
        Mon, 15 Jan 2018 11:44:05 -0800 (PST)
X-Google-Smtp-Source: ACJfBoswxbKnen2dP1DzwYLU9Ky2SW2GbK4thWC/DcFybmtmsDcHcKHVdJ+K/mVGxaoTgNeUkO+n
X-Received: by 10.37.214.9 with SMTP id n9mr13598147ybg.73.1516045445383;
        Mon, 15 Jan 2018 11:44:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516045445; cv=none;
        d=google.com; s=arc-20160816;
        b=agYzVcc5qEncYpsvRqjtWkeMKC3nE/JSYePe0XiZUvpApJDseakiP+qRG7XNrN0bJ+
         +AyzRS7TAWVFrxQclpzGV1ljHXQ4WL1e1/Rv4S+ZurSoxsU6MS944G8+xEtOiDiH7GLC
         Z0+pT/MiDbZazW71uMIH1UcZCfZTbvbKof68URx9Q9N+GMTmEH1qKjkkY2MBRyQZ4wuj
         4QanNInvYzAB/0+iWcasu4Oq7KEMcDZQ09gUvsw1V/b/U2ofgxfhykwb2vjkNGB0TPAX
         fCpqi1alQQFk+3fgPEIpsQTOZY8mWgCxF0Hj6K9jktoE4JPCibS6dOW0Hiss+GaSNzRd
         O1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=iQ1FLKmYb4BjFce8j24OXUKRD4+hEekWhEWExhcW0Ys=;
        b=etw6of6/h4fjOxTFxRRkTBKsruPbjNM7y+UIzJsVmM+11W00MQqDuqm4N+enJieJyU
         P2/2BMtOuxE7Q4/mZ5qvwEMGcQu0tVzEIS4Ojc6pYZ9AGw4P9mnBJftudYZSoGxS/sv3
         zZp/DRrD6mcQQQ/GzljGyaOZ2mwmBRxYShFrtQBsV1Tfjo2i/bN7vXx7TT2AtAs5bTL+
         SXxdJhUuunUHHRaT9/PfCcWJepJzFKMniAuHI+LOtLsMAM/WPvzme31+vr14fCAz40sC
         rN7izdW989aU6CyFRDh3x4WVEzxnKcXnH/uB6DDddHx4Z+p5xnATNuBv1gdLrYSSN1Vh
         8Euw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M0OXeFzD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2si86707ybc.99.2018.01.15.11.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 11:44:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M0OXeFzD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebAfs-0002Ss-Rd
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 14:44:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ebAfS-00029k-Gg
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ebAfR-0007Mv-Ky
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:38 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:46933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1ebAfR-0007Md-EZ
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:37 -0500
Received: by mail-wm0-x242.google.com with SMTP id 143so3926936wma.5
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 11:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iQ1FLKmYb4BjFce8j24OXUKRD4+hEekWhEWExhcW0Ys=;
	b=M0OXeFzDX10TTbdXqpiXa56/Up5lTnyvd5mlc86oEN3F3bJFLBmYdy/7UzlKuybbme
	vmwT2J8u232IR/3ey4mA1zNDC6hbb5hNuHGiVgd5mUf6QdX4CbbVpQwL6bVWSQuFD9ig
	FtVoBOlWAERFiY/FbVoN8oWI70+k3GafYvius=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iQ1FLKmYb4BjFce8j24OXUKRD4+hEekWhEWExhcW0Ys=;
	b=aK/Y0ujqMKCUSm5IOelOTTgZ+E/naSqVTKjqbUz/DhF6KqYSj7KUQniLlXeyW5bYLm
	hPFJJdtqZHUXj0TwTlxtDZQh/1IGKhMh15ocHgYC6AVzwVoJQSmBje+Q7UNOMRa5Pxf4
	SrfKOMVTKQwd8KxcaceKBPpBcRafpGdtp/stUdC83ds4sonCwgPaqX5tCFfGB/X9dNQs
	tQlCjROV5w5yIBFx7v/Gt/r6mAdxrcXyLpZyEdR1+AUq7YFzJza7lKLbReJZ1a2KGP5D
	hNZsiqR4Xb/2Wqg1Hdm/tgVPVF0lpzc5jjZpf71PcM7UOq8PvydkUYJSDuX9wwnOWu0R
	w1ag==
X-Gm-Message-State: AKwxytcm/zX2w8vwYThcUtDwJCjqSyjuJbt3ujnNfq58ZHzCNWSJN2fE
	7E/urfMwD66peiPo0eBQQ9RGPrkBqEY=
X-Received: by 10.28.15.13 with SMTP id 13mr2279834wmp.105.1516045416086;
	Mon, 15 Jan 2018 11:43:36 -0800 (PST)
Received: from localhost.localdomain ([160.90.52.105])
	by smtp.gmail.com with ESMTPSA id 34sm435051wro.7.2018.01.15.11.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 11:43:35 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 19:43:21 +0000
Message-Id: <20180115194321.15411-5-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180115194321.15411-1-ard.biesheuvel@linaro.org>
References: <20180115194321.15411-1-ard.biesheuvel@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-arm] [PATCH v3 4/4] target/arm: enable user-mode SHA-3,
 SM3 and SHA-512 instruction support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iBHb5lxQW+HJ

Add support for the new ARMv8.2 SHA-3, SM3 and SHA-512 instructions to
AArch64 user mode emulation.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 linux-user/elfload.c | 18 ++++++++++++++++++
 target/arm/cpu64.c   |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 20f3d8c2c373..5d5aa26d2710 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -512,6 +512,21 @@ enum {
     ARM_HWCAP_A64_SHA1          = 1 << 5,
     ARM_HWCAP_A64_SHA2          = 1 << 6,
     ARM_HWCAP_A64_CRC32         = 1 << 7,
+    ARM_HWCAP_A64_ATOMICS       = 1 << 8,
+    ARM_HWCAP_A64_FPHP          = 1 << 9,
+    ARM_HWCAP_A64_ASIMDHP       = 1 << 10,
+    ARM_HWCAP_A64_CPUID         = 1 << 11,
+    ARM_HWCAP_A64_ASIMDRDM      = 1 << 12,
+    ARM_HWCAP_A64_JSCVT         = 1 << 13,
+    ARM_HWCAP_A64_FCMA          = 1 << 14,
+    ARM_HWCAP_A64_LRCPC         = 1 << 15,
+    ARM_HWCAP_A64_DCPOP         = 1 << 16,
+    ARM_HWCAP_A64_SHA3          = 1 << 17,
+    ARM_HWCAP_A64_SM3           = 1 << 18,
+    ARM_HWCAP_A64_SM4           = 1 << 19,
+    ARM_HWCAP_A64_ASIMDDP       = 1 << 20,
+    ARM_HWCAP_A64_SHA512        = 1 << 21,
+    ARM_HWCAP_A64_SVE           = 1 << 22,
 };
 
 #define ELF_HWCAP get_elf_hwcap()
@@ -532,6 +547,9 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE(ARM_FEATURE_V8_SHA1, ARM_HWCAP_A64_SHA1);
     GET_FEATURE(ARM_FEATURE_V8_SHA256, ARM_HWCAP_A64_SHA2);
     GET_FEATURE(ARM_FEATURE_CRC, ARM_HWCAP_A64_CRC32);
+    GET_FEATURE(ARM_FEATURE_V8_SHA3, ARM_HWCAP_A64_SHA3);
+    GET_FEATURE(ARM_FEATURE_V8_SM3, ARM_HWCAP_A64_SM3);
+    GET_FEATURE(ARM_FEATURE_V8_SHA512, ARM_HWCAP_A64_SHA512);
 #undef GET_FEATURE
 
     return hwcaps;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 670c07ab6ed4..56d50ba57194 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -224,6 +224,9 @@ static void aarch64_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_AES);
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
+    set_feature(&cpu->env, ARM_FEATURE_V8_SHA3);
+    set_feature(&cpu->env, ARM_FEATURE_V8_SM3);
+    set_feature(&cpu->env, ARM_FEATURE_V8_SHA512);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
-- 
2.11.0

