Received: by 10.28.173.206 with SMTP id w197csp2679926wme;
        Mon, 15 Jan 2018 04:46:23 -0800 (PST)
X-Google-Smtp-Source: ACJfBovg6Owsh1OwD6ZTO8CHwzwxf0+dHpwz8p1ila1YjWVcZ5AoVA7Nx2AWY8Ybb3VCY+DnBuuM
X-Received: by 10.37.129.80 with SMTP id j16mr18542501ybm.9.1516020383463;
        Mon, 15 Jan 2018 04:46:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516020383; cv=none;
        d=google.com; s=arc-20160816;
        b=djKcIYK9PdC9UkoZOXGYDzPfNlVic0t2NSo/wv4fU7d4TT3i9IOSbBlAHwLyBh0ZpY
         zjC2dweDdqAzCf21ISlxxQfYIkwy5MA5sc/3kzzb0Q4qxbs7/d3U6/xoG+2wfmBhKbsI
         9N97fSZS1OCGKVcrWAMpLdnGG6HGampsR28PtCJvFv2DKB2qjp4O7bPuyp5nLkXiJApc
         Nl7Ft/i+5vxy69CT9agpkjGeyJCQ1eFbJ5fSB1zjRXBJsAbFx+B6zPNut/9DEVBFd+M9
         oL5qT7WxtTtcAaUSJKVA1kxHT/siRpcylRDOKfKywKQNo2gM64eSJvkpp3RXVi3sQ2ML
         j7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=LcpGctRLjkZ36yxxcqc5yZtWvDhY9PRxTUOU6qai+x8=;
        b=SXnumCg4BKbgCqt2v/y156e+RmWzHdIDkmM6xEM3tn5BWhuboF9HLtRfggeKvsLJNC
         DZSFhGBhqgIC3rUX792GysJkTQ5qXw9QfDuuDWAUi0BscVufbSnfyPri4HnEF0hslZ67
         c6OTRJ9L+LezP0sam3xiYFFtijSTvFasff/v6+xgwpi1qamHDiXRNtPxNzv3taZLxjEm
         8TNf9tJvlHkNEavdbS8MA4pcbvhb8pj5SMBpu+j1j0i8M9MHUscsjXGp9c96TShFzuMD
         eeALLZzUnwFnmgkAkQYzpymtvFmBWM0Cba0K/ezSZ1wBHhNOUH+jgIzY/hddT0MRzW5q
         8uOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ACHqbCkb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8si2210270ybk.637.2018.01.15.04.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 04:46:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ACHqbCkb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb49e-0007Q9-Vv
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 07:46:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eb49K-0007GZ-No
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:46:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eb49J-0002Bd-Rv
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:46:02 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:41498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1eb49J-0002BO-LR
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 07:46:01 -0500
Received: by mail-wm0-x243.google.com with SMTP id f71so1679637wmf.0
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 04:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LcpGctRLjkZ36yxxcqc5yZtWvDhY9PRxTUOU6qai+x8=;
	b=ACHqbCkbn3tQJyzxgkFYSu3aU0Fqck1Q6nsfaYNYTe68GSG34PXRO5wGo6Jr6jpfUS
	ikmpFpC9wnUCEQNbO3Bkn/ndPANSe6l1MaKp1LVhzZqCH4iffhf4EJYQf9uAO7XUOF9T
	G+C9S/M96bPQTYu3JJzKegXKfTsX4cIhviwNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LcpGctRLjkZ36yxxcqc5yZtWvDhY9PRxTUOU6qai+x8=;
	b=d99OYWOTyF1t/bnVt2RKG7DrffIVMoOdRBg22RJZKgFYAzgNcOZbJupbCQhq1JcmRZ
	019BHCSndMtmFxcTfTzdIQWj9sgdQKgNi7F3oqPgONfP/qKD3bcJlhIy6jjln1fCUb87
	yY3Fs9kc3fLamux+YTByj8K1g6ONrdjtel+SK8BxkFh73q2UKjH1T+xbpjNc4Be+9LKn
	Pw9mbE+yVivjs5dCzeFxNLKO52zqanjHzUSZE6I9zmkZqpbKt+43ggKPlkTYnaDLZMif
	BzBO79DnQCxwwiyP8Q1DZlO7XFt0WTGFGeR78Q3R6HetXhiTj8/g+KsomnHYwGPrenQR
	r+Aw==
X-Gm-Message-State: AKwxytcpNBLPSYf9FVqjH48+Oe2C7FYoK5nQ9RePrfk+eXL+PFUJLT56
	RegrrlVluHHznrap/sBoR7K8r6ui+cE=
X-Received: by 10.28.140.67 with SMTP id o64mr11069954wmd.137.1516020360326;
	Mon, 15 Jan 2018 04:46:00 -0800 (PST)
Received: from localhost.localdomain ([160.90.52.105])
	by smtp.gmail.com with ESMTPSA id
	i71sm16816701wmd.1.2018.01.15.04.45.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 04:45:59 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 12:45:46 +0000
Message-Id: <20180115124546.7253-4-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180115124546.7253-1-ard.biesheuvel@linaro.org>
References: <20180115124546.7253-1-ard.biesheuvel@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: [Qemu-arm] [PATCH v2 3/3] target/arm: enable user-mode SHA-512 and
 SHA-3 instruction support
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
X-TUID: pOs0ES876Jsf

Add support for the new ARMv8.2 SHA-512 and SHA3 instructions to
AArch64 user mode emulation.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 linux-user/elfload.c | 17 +++++++++++++++++
 target/arm/cpu64.c   |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 20f3d8c2c373..6402d185ff5e 100644
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
@@ -532,6 +547,8 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE(ARM_FEATURE_V8_SHA1, ARM_HWCAP_A64_SHA1);
     GET_FEATURE(ARM_FEATURE_V8_SHA256, ARM_HWCAP_A64_SHA2);
     GET_FEATURE(ARM_FEATURE_CRC, ARM_HWCAP_A64_CRC32);
+    GET_FEATURE(ARM_FEATURE_V8_SHA3, ARM_HWCAP_A64_SHA3);
+    GET_FEATURE(ARM_FEATURE_V8_SHA512, ARM_HWCAP_A64_SHA512);
 #undef GET_FEATURE
 
     return hwcaps;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 670c07ab6ed4..f27d68b55eaa 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -224,6 +224,8 @@ static void aarch64_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_AES);
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
+    set_feature(&cpu->env, ARM_FEATURE_V8_SHA512);
+    set_feature(&cpu->env, ARM_FEATURE_V8_SHA3);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
-- 
2.11.0

