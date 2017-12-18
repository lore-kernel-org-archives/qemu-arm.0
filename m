Received: by 10.223.159.74 with SMTP id f10csp2928062wrg;
        Mon, 18 Dec 2017 09:42:43 -0800 (PST)
X-Google-Smtp-Source: ACJfBotLm0P7ihc1hQTd2usSh5/r3HGE9DtJwFR9TuDNlH8qhEHWbsuwOCPpxXvZeat4+db+ADtQ
X-Received: by 10.37.246.4 with SMTP id t4mr455431ybd.297.1513618962915;
        Mon, 18 Dec 2017 09:42:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513618962; cv=none;
        d=google.com; s=arc-20160816;
        b=ZeX0FSQ2i/RTDquS3I1elAEaAFfRq1fvNLa5Vupt6/4qKQZ4O7Ran+yXiTnjJFRDaW
         xgirFTDPFCqYgY2gs9/J+qUljtIrBJQvg9YqBSUuu1VT5aPWSjWIH/+B4qjrSgYUf0RE
         w0P+JskJq4k+U1nxIb5ewh+EhVvZz+SMLI5yHvq+ptyT2Le3xDTB3Tw8yUWRehPjpkbV
         iE787pCrrkOhvdYNQn5LLfhenwQAmUgBc4hPN/DzSkqdYkeqkqrheMgJKBGEpUyBxxb4
         d55bAeP1Sfqx2RggmTQRagTx455O5J+LwlQlNSOy5oyD3lKGk8G3/YvkHVF7szCptU6m
         Z7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ihqxkNadFMqmm87H014iNHYSjzIdW6NTum55BD40BtQ=;
        b=dnoqxAm2DTMBKYlzRb/rWViLKjUQ0LYglGvyAFei9GjqINz7PKLztYtzCLQywm9mQ1
         87tGPpqhigtLTZnropMkfBdA0vw0FHhb90IEERwaaYkDr5BktK+xP7L68pog2mSj78e7
         U+wwVJOA74ynLoOPOO6IWDOjuqlCt2UJ+e9vdR7AjS2isgTtPyGEkj0+rU85Nh+cFCb6
         UEetOLtECY25iPB6UvWvuONZ79gDf+msTFILArKhe20sNlHtrv5VPbMxUAYZp0o8Dsu7
         nT+ZCM9epLqGiWxYDry0bSWiGxJEs6XxyOJhGmdONF29eXWiry1nNqyFX4SzXjRE7A+G
         aJZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fD5ERZbo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q126si2594532ybb.432.2017.12.18.09.42.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:42:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fD5ERZbo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzR4-0004jP-BZ
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:42:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9e-00061x-8V
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9a-0008EG-Pz
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:42 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:37962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQz9a-0008DR-JK
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:38 -0500
Received: by mail-pl0-x243.google.com with SMTP id s10so5202924plj.5
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ihqxkNadFMqmm87H014iNHYSjzIdW6NTum55BD40BtQ=;
	b=fD5ERZbo7rNdc3HjaBilZPCBA2w+YBGug4G7LUS4Oii+vzYCI2uUIzkMKSKXoH4ixR
	8HLmDFy1aRcaEp8owvDJku7E0m+0AUJDVMFWczh8FyFmkOX1gKTMAun2JvMR9A7SMEyv
	8yXf5HW7G3YRfIvODXK8Bru1gjZ1fs/vFQsfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ihqxkNadFMqmm87H014iNHYSjzIdW6NTum55BD40BtQ=;
	b=NTs/5t/KcP/r8yYt8n+KDEysbYm6A0gK6YBJvm4+w4OvBZjEVjX0XJH62zSn1Wuu9J
	OgZIQiMGBObHnwb5kPaMxKiSpM8fXEa1F5f0lRoZp7p6IxiruIylXk48a41EO6HArZGI
	n8Yq8OmH/FgCNUfbEasskZwZTZSwvk3GN+dOV9k2gaQ25INg2j7BLlAp715QmlbV4OVr
	EL6lyLvFi2MWS8M6dW8/GDGsMH1G/RNuBEiY2WdofJG9kbpT3ZFYD2VVZug+KRL1/L7V
	Xh/AgU63QwXDfIKxGihz2zk/nV2GFp6uYU0y9Vld7e3dZQKy9b0Otsf0V7uW3ncwdaH/
	agwQ==
X-Gm-Message-State: AKGB3mIpMSKepwMsaZr2J06K+2969mr2B7WOw65+Upe/CqfQAkkRobHA
	ytnXh6z8iMqDbGPOHR0TADMcEA==
X-Received: by 10.159.252.6 with SMTP id n6mr431673pls.370.1513617877761;
	Mon, 18 Dec 2017 09:24:37 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63])
	by smtp.gmail.com with ESMTPSA id m10sm9260469pgs.4.2017.12.18.09.24.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:24:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:24:21 -0800
Message-Id: <20171218172425.18200-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218172425.18200-1-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v2 07/11] target/arm: Add ARM_FEATURE_V8_FCMA
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PqB8jGXMICbN

Enable it for the "any" CPU used by *-linux-user.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 +
 linux-user/elfload.c | 1 +
 target/arm/cpu.c     | 1 +
 target/arm/cpu64.c   | 1 +
 4 files changed, 4 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e047756b80..7a705a09a1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1353,6 +1353,7 @@ enum arm_features {
     ARM_FEATURE_JAZELLE, /* has (trivial) Jazelle implementation */
     ARM_FEATURE_V8_1_SIMD, /* has ARMv8.1-SIMD */
     ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
+    ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 95f550518e..e07184902f 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -541,6 +541,7 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE(ARM_FEATURE_V8_SHA256, ARM_HWCAP_A64_SHA2);
     GET_FEATURE(ARM_FEATURE_CRC, ARM_HWCAP_A64_CRC32);
     GET_FEATURE(ARM_FEATURE_V8_1_SIMD, ARM_HWCAP_A64_ASIMDRDM);
+    GET_FEATURE(ARM_FEATURE_V8_FCMA, ARM_HWCAP_A64_FCMA);
 #undef GET_FEATURE
 
     return hwcaps;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index afe84645af..6cd8ae1459 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1629,6 +1629,7 @@ static void arm_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     set_feature(&cpu->env, ARM_FEATURE_V8_1_SIMD);
+    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
     cpu->midr = 0xffffffff;
 }
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 67a01bf7ce..43b42f95fd 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -228,6 +228,7 @@ static void aarch64_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     set_feature(&cpu->env, ARM_FEATURE_V8_1_SIMD);
     set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
+    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
     cpu->dcz_blocksize = 7; /*  512 bytes */
 }
-- 
2.14.3

