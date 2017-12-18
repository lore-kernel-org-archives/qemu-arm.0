Received: by 10.223.159.74 with SMTP id f10csp2964831wrg;
        Mon, 18 Dec 2017 10:15:29 -0800 (PST)
X-Google-Smtp-Source: ACJfBoukVe90iXGd4DOfLMHbF84pV4c2VfwWsph1JJN1p+N7caMF1nWm4YkEYeHXU8yGED/lM7aB
X-Received: by 10.37.18.198 with SMTP id 189mr614324ybs.184.1513620929050;
        Mon, 18 Dec 2017 10:15:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513620929; cv=none;
        d=google.com; s=arc-20160816;
        b=opN0YZxG7SYEKzU78GrL2gXUv3xWUpc06va8bvDGZVvEYZHvglWJD3fEJB8oEwKiMA
         NEwW3k8T1vdojyBIvLbJ5Tq9TYVnP0iiMy0lsri+olXMOCtB//5L/agVe4vNXjsp8OMo
         wbHmksn31tXjMVcTL2CV3seEyV1iME6yYObFpw4wvvEMSOIWOBk9U5IBPvwZoG8sioki
         cupO9Zmn9Bm8uUgyjxDC8DKG+GSi9tZ/eUoxhvIdF5fUlotCUUpWZErcHz0Ur1EwLHXi
         dICBl0/9pSSthaaOz4qqMgn2sZ4crQybWxVig/sdR4LrMGt3ojGWsxPUNwQtAbWjp56S
         eo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=805GdzO1VDtAQUydyknMqA/OvRmWH/xy6j89TGjAx5A=;
        b=CqzwF2bQlrcTSD8kGTd0IW35wxL4+8g8QJnXgRvbyOcEcVF9Wmi6Fi3olra4vHOajy
         051BFeitvDYPkLDriNZT+VsEiPJ2gTeKNyc/PVppwRvzNf9fYWei/HgkXvcFIm5s40Pb
         +8LBuDpOWPy88cSPCSsCfjWH2E3g4+NSNUNIdGEkH11bvuMf0LPuFm6kt9M47FsS7JaW
         IVv0qiwvXO339u/z6IpZZvSM4/mmKfYS3+NTO+jUJ06DBX284TN8v2A2r7KA/J+GEoIs
         sUURucrPbcONW+3O7vKA9TAGnhLMrJe3liBQL5Oe+bMHts5vyzOJ9hd1d7bi9cXIk9Z3
         PV0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dvm1M93C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g9si2541621ybc.19.2017.12.18.10.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:15:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dvm1M93C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzwm-0001ve-Cx
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:15:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFR-0002is-AM
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:30:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFQ-0004nO-3z
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:30:41 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:45035)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzFP-0004mK-U6
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:30:40 -0500
Received: by mail-pl0-x244.google.com with SMTP id n13so5214239plp.11
	for <qemu-devel@nongnu.org>; Mon, 18 Dec 2017 09:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=805GdzO1VDtAQUydyknMqA/OvRmWH/xy6j89TGjAx5A=;
	b=dvm1M93CeFiDdGVTBCWJsVaK/emysmW9pKrQjS78cFwisrVN5ve8SmrgJTNXOvhwqH
	zqBEjBZu34Dr7Ye5mdzZh8s8znn8hY61Pofm1oByb7tBO/en+pnkxor4o+F4kki4Q3X0
	pSLnDFyz9S5xTxUxIDsHn1SjcnLJktKzXtK9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=805GdzO1VDtAQUydyknMqA/OvRmWH/xy6j89TGjAx5A=;
	b=gSVk0kPSlA96BZibIMQtapogIFPKLe4tvBUOgr4RBbhnp91IA6OtKJSMuPTjAfArSm
	ikaDyOgMWb5q1DLJ/GdW1WpJXUSIi5oWmt8s/sPvU28ZL+2FesCNI/Z6jejspd/J+9rg
	ZAsKke8r8GJPyzTgMOZm9OAYW+vU/Asma7yYA3faaoqXp3viJ0cVGkYp7yXhOs/dfWHv
	zYIj+MILEgxXWwbhon+/2e5DapbiTJH0X3C0PRplWFZLrWHhc7z5jUNLmF2mlCToQXuH
	G8xkWCNyZgEfu2uTSHEBbzdTCL8/FlD0uQi8fQbi/ablJqdm/ppXHE2QyfJHPLRk6Fng
	0/mQ==
X-Gm-Message-State: AKGB3mJ1CUHkhLH6wWzqWZfc88kn4Tk5MsBox/88/QcTy0XSUAdKLTSe
	VPNEW9E7Eo+5EwTeN2mtiTLtC1io2c4=
X-Received: by 10.159.230.3 with SMTP id u3mr442740plq.2.1513618238582;
	Mon, 18 Dec 2017 09:30:38 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	h69sm26553411pfe.107.2017.12.18.09.30.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:30:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:30:22 -0800
Message-Id: <20171218173022.18418-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218173022.18418-1-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-devel] [PATCH 9/9] target/arm: Add ARM_FEATURE_SVE
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
X-TUID: MD9jYmdkoI81

Enable it for the "any" CPU used by aarch64-linux-user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h   | 1 +
 target/arm/cpu64.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 37b8cef2e2..652e00d957 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1386,6 +1386,7 @@ enum arm_features {
     ARM_FEATURE_V8_1_SIMD, /* has ARMv8.1-SIMD */
     ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
     ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
+    ARM_FEATURE_SVE, /* has SVE extension */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 43b42f95fd..366ab2eeee 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -229,6 +229,7 @@ static void aarch64_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_1_SIMD);
     set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
     set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
+    set_feature(&cpu->env, ARM_FEATURE_SVE);
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
     cpu->dcz_blocksize = 7; /*  512 bytes */
 }
-- 
2.14.3

