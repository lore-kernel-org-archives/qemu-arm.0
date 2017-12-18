Received: by 10.223.159.74 with SMTP id f10csp2926492wrg;
        Mon, 18 Dec 2017 09:41:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBovgK3DIG5MRyKmbk6YaD70zEacKGop+/0UAAA7ccrIPZBT62w2osrKqzGauAFRONf7ThYb+
X-Received: by 10.129.90.135 with SMTP id o129mr458276ywb.28.1513618900356;
        Mon, 18 Dec 2017 09:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513618900; cv=none;
        d=google.com; s=arc-20160816;
        b=vsUvL4waauYCRDIc+ZjHw+nNJPZbbJG1IpNmKGqZVnST/7NCzdDHVOIMgisGRNaTtl
         hzf3I87xyU8FWICzBs4Tueh1UfmeSAe40N7ougimj8OC9eGgEL5EXd4ciHpLXwAK2Dae
         vkDSFhBHQotDJIPTXeePHFoVtmWRWwd0D5z50fuQl/jewFKkLZ7SMNS5uqqQgTSGpwIj
         gCgJJCp5d6eXmTK1zs7QZGG7U2+YemGYGqXkzdhAPBNX/nToTMsbBIL3DPPbI9bLUhYd
         ptofDNE5AbiHtUmEP9uA5fJQ08oo4u2bhgpnaH2JfdEoy3tjMxP+8ehVoUaoa/d4+GH3
         9Qwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=hQz2mr3ZIxdEcu/gt27H94bv5BFl3Ifu10zuNk+r8Z0=;
        b=H84IgP8syHEtnPbNIQmCidSOz6W6ZhzI37LmtAV/bOG5ibsF0jZlaENkYdW61nwFW2
         Yi3Wpaoh9Ofd5r5CD/YRzit68+1A3x4j/I99eASL6mD0AoeXDTmGRJw7vw6QaG9p7mDO
         d4t4z61eH5Oln7Tly+NzqIZkSk5G60OvoV3ubEjnjp5PP9NhBfwRVuQ+X1tnyxwnYe6U
         RMUqzo4tlbJs6+VAEUGPM9NFTkHDJu83G0oOW1KuJD+5CItGhwhXA8yjx94B9IfraGTj
         KYCf5YUV9hxTyq32iMnHrXA2Yh3k0IGf8R+lSnXQzM10EEUafp776vOyA3KN4gxtRYWT
         BgEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LvfLkzDa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e75si1087113ybb.331.2017.12.18.09.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:41:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LvfLkzDa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzQ3-0003I8-MI
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:41:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9V-0005r2-98
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:24:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9R-00081J-WA
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:24:33 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:45343)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQz9R-000805-Qu
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:24:29 -0500
Received: by mail-pf0-x243.google.com with SMTP id u19so9926586pfa.12
	for <qemu-devel@nongnu.org>; Mon, 18 Dec 2017 09:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hQz2mr3ZIxdEcu/gt27H94bv5BFl3Ifu10zuNk+r8Z0=;
	b=LvfLkzDaW61FQZ2MRqAWnj6bawkTM4xyf1pHRclH3oFl0hOrnKLT74bTaroEzBakSW
	5kNpalLoffuYoPReLD4Lcl4yaoQZvejnFIwLJ/A4SLdkuG+YgaYmi1tCw8ALGC73WQai
	2Wv3UUl87VHFdXr1BWkBfjutXBl0HN1Pvq36c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hQz2mr3ZIxdEcu/gt27H94bv5BFl3Ifu10zuNk+r8Z0=;
	b=nv3HYYTpn2gCOD8gt4uq6HidPDzfVov/V7oqKBOhlwKBl3CqezDfRQFjiNWqiB44HL
	Q9beRWeBEMuYAtjQnDic93xCLTGJ63SFo0vIqT74XO+B3r01vm0uemVsJpbOXCMH/mG4
	NiZJLi+GJJvPbR9k11vf8yO58cNF2JoJMZtyjBzvG17tk9KPWxGfgUXvnGFm+Wl4nhQ0
	1+DULCrPyw4C5UZB+ToSQS57MgAnOWHnNZWN1f1oy3/RZcWHRUXMzsFrJkYKxQs6Piml
	kTIfMT+4kXhqN4tucR1C5ofNAJDRF3UsDK8bUz24NdhY7+3LH1vblsNGOTH7iiDW2SXI
	nZzw==
X-Gm-Message-State: AKGB3mKkh3Zd99pBjMAozyt8+yFW63QOb+u/sbTtGJXOs12tjzp9hR+z
	sxineLS//U395JIgf/YFY4mOWASIfZo=
X-Received: by 10.98.134.65 with SMTP id x62mr413468pfd.81.1513617868578;
	Mon, 18 Dec 2017 09:24:28 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63])
	by smtp.gmail.com with ESMTPSA id m10sm9260469pgs.4.2017.12.18.09.24.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:24:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:24:15 -0800
Message-Id: <20171218172425.18200-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218172425.18200-1-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-devel] [PATCH v2 01/11] target/arm: Add ARM_FEATURE_V8_1_SIMD
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qU+UVUyN9Pgw

Enable it for the "any" CPU used by *-linux-user.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 +
 linux-user/elfload.c | 9 +++++++++
 target/arm/cpu.c     | 1 +
 target/arm/cpu64.c   | 1 +
 4 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 715ec6a476..e047756b80 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1351,6 +1351,7 @@ enum arm_features {
     ARM_FEATURE_VBAR, /* has cp15 VBAR */
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_JAZELLE, /* has (trivial) Jazelle implementation */
+    ARM_FEATURE_V8_1_SIMD, /* has ARMv8.1-SIMD */
     ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
 };
 
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 20f3d8c2c3..95f550518e 100644
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
index 7f7a3d1e32..afe84645af 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1628,6 +1628,7 @@ static void arm_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_V8_1_SIMD);
     cpu->midr = 0xffffffff;
 }
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0dc4debd9c..67a01bf7ce 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -226,6 +226,7 @@ static void aarch64_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_V8_1_SIMD);
     set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
     cpu->dcz_blocksize = 7; /*  512 bytes */
-- 
2.14.3

