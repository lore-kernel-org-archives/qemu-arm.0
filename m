Received: by 10.223.197.9 with SMTP id q9csp5931720wrf;
        Wed, 4 Oct 2017 11:44:13 -0700 (PDT)
X-Received: by 10.55.144.69 with SMTP id s66mr26922336qkd.111.1507142653108;
        Wed, 04 Oct 2017 11:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507142653; cv=none;
        d=google.com; s=arc-20160816;
        b=jhA9HQ2w+S3PhClMwtAK9L13I2w2xaUnFKqetvKpRHtmNle+nq3Nv2t8/v4T1PlJPO
         PZ2diIRs2HxNkRDf+artEwaAk7osN8/OgvnACxizsaCqbBIiO1h/laf/HzbWnjW43Vg5
         BNxzfCYswyEPSlJWL3tvfXEYz6bAV+mzrisZ/JMh77P7BktwPXWbmPsMEoRZm9t7AiJ7
         lbFRUlC777/LXC9KEzQbtoz6qbWG0BJ/GyDPv9uRKP0mgewllJYdByAr763AINCqCxc1
         zwXp92sxMKfFOrevkmuv8/vwwuxdKcaKR8+Icmm/S3jFybvc0QyyZ6tCfywP1vd1dKtx
         BX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=3scm5MUW7GUgyfh34S1Vo3Ln+aBGgTxbTJqlG1RMo0Y=;
        b=cNnr4t93616vrFoDaCM+dcJeXRSZYW6Yc6NUaS5wl7Zqf//5S4XiaC7jkfGXp4iLq+
         cEKjtvXE/0Br9uPK7kUpNi3tMnX54W7IJdkAMBMfgd3RaZoSiyG97RDdWGHBEABI1pm2
         xg46uGv6uoXdTvl0a9ZiV7mL+gDgBlW3ba4RepBuo/WwaPkDPksxG1RAqy8cwl7JgTnj
         fFhD1GFATymy5WAhz0a8ktPKs65xrbqR9SuV2k4rGrykOghdXojdp484vJ6Bd6MlXdgK
         NHBULKw/ddgv6CPOZBHpr6jp4KiZlxFoy+hjP2JID9c03nJGvJdsblaDjFLASmoCwVXs
         Rj5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hyFNsxdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n64si606265qkf.65.2017.10.04.11.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:44:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hyFNsxdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzoeS-000089-IB
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:44:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodq-00089U-98
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodp-0002bs-Dy
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:34 -0400
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:46500)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzodp-0002af-AY
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:33 -0400
Received: by mail-qt0-x22c.google.com with SMTP id 6so11967117qtw.3
	for <qemu-arm@nongnu.org>; Wed, 04 Oct 2017 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3scm5MUW7GUgyfh34S1Vo3Ln+aBGgTxbTJqlG1RMo0Y=;
	b=hyFNsxdM7mv8C6EQ6USs0ULOxFGlpM0Bfq5kObLwQIFSzFHItPTPIW//y7xbVHvfY0
	ucY16HvBwtJ85Cc7ynGtlrork8dWciqtrb18XgisA/xUaijCgY5i9mNk/jUvvvtaeBVO
	SXE0ckYntDUbQmLrrwtO5o3gZfqus0bbgiHqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3scm5MUW7GUgyfh34S1Vo3Ln+aBGgTxbTJqlG1RMo0Y=;
	b=VJ7aSPvRRRKI3ub/RIJ8frGKJub2+DBFI9+dQTy0XcmS8x47Dys9v/pGfGVMktdsd0
	eDeIsR1XmFZRG3rbbb8CYchApdXQWuyX2fLsE5PbaNHBIhvzRe5vVb0CIgzB1ZBXnaAk
	9mi3/PgvIOsn/qP5a8aQZVW5wbFKxz/L3680IKJ43sRulHno3ZYdzRdEgchdXOse3Dl6
	tZFgo0kWjtEqL3NnjNkfXWVapv5jIAwMaDHIHBLjjZySt66wJrkYvvUKrhOe+88Po3Ml
	28iZ6nqzokQqjdTcaHa5Ny9DL57tlMBBqHyZUqSVQZnqQMTUZJRAjlqFgfrQtG4Hb7KC
	C7bQ==
X-Gm-Message-State: AMCzsaXDBQh0ZQZQyDM0zuuAT067NbuGojThsGJvGzhdW48ggbvTqohL
	gDmx3kFGoDmiTrb/KauU+Bs93Q==
X-Google-Smtp-Source: AOwi7QBOmZpQdNFyhwtv9boN0+r822rs9ZmA9MSjTfjzmQFlNyoGdHctkdEjchh9mcC6qdpS06yufQ==
X-Received: by 10.37.194.130 with SMTP id s124mr4787132ybf.271.1507142612679; 
	Wed, 04 Oct 2017 11:43:32 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:15 -0400
Message-Id: <20171004184325.24157-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: [Qemu-arm] [PATCH v1 02/12] target/arm: Add ARM_FEATURE_V8_1_SIMD
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nGM8OCk0X7ms

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 +
 linux-user/elfload.c | 9 +++++++++
 target/arm/cpu.c     | 1 +
 target/arm/cpu64.c   | 1 +
 4 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 69cb49acc3..c5c9cef834 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1312,6 +1312,7 @@ enum arm_features {
     ARM_FEATURE_VBAR, /* has cp15 VBAR */
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_JAZELLE, /* has (trivial) Jazelle implementation */
+    ARM_FEATURE_V8_1_SIMD, /* has ARMv8.1-SIMD */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 79062882ba..003d9420b7 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -512,6 +512,14 @@ enum {
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
 };
 
 #define ELF_HWCAP get_elf_hwcap()
@@ -532,6 +540,7 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE(ARM_FEATURE_V8_SHA1, ARM_HWCAP_A64_SHA1);
     GET_FEATURE(ARM_FEATURE_V8_SHA256, ARM_HWCAP_A64_SHA2);
     GET_FEATURE(ARM_FEATURE_CRC, ARM_HWCAP_A64_CRC32);
+    GET_FEATURE(ARM_FEATURE_V8_1_SIMD, ARM_HWCAP_A64_ASIMDRDM);
 #undef GET_FEATURE
 
     return hwcaps;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4300de66e2..276c996e9f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1603,6 +1603,7 @@ static void arm_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_V8_1_SIMD);
     cpu->midr = 0xffffffff;
 }
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 670c07ab6e..b05c904ad2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -226,6 +226,7 @@ static void aarch64_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_V8_1_SIMD);
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
     cpu->dcz_blocksize = 7; /*  512 bytes */
 }
-- 
2.13.6

