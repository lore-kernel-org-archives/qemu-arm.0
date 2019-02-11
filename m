Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp111753wrp;
        Mon, 11 Feb 2019 16:04:43 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaRhq3AImGx9QBxfDudNzudt7bG9TslA4x1IRXZlDlvRtyKdOT7cnHKVMXkjk2RXBIcHoXS
X-Received: by 2002:a5b:3ca:: with SMTP id t10mr694401ybp.304.1549929882958;
        Mon, 11 Feb 2019 16:04:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929882; cv=none;
        d=google.com; s=arc-20160816;
        b=TaA0Vxr+Nj6qCZ2MuxKiUe+bG4qbX8RaXXv6VuMLMBh2SzyHz/7jqDBiNmaridT1jb
         2KmroP6qq36LjVk53ICNEfLnqteFr85Xw1QO6ZXLRqDFU4wVKdvKmz2vN0koVhLBXHb0
         ZKDMRSqxFrCYlMTYSb8hSBVKAGb65eH8sd7DQNLriG/+KJKcYlxdF37yXYwxGnznPHuW
         Wv7XYGPwaJCXhDmBPUOFL+DIiBy0BdSXvbZnayy+gqjzga3N1GRZBWqj5shAKTp2fuqy
         JKj44nNZk+WBx2Ct7z0E58UDUg727qSCXOdVckMKmhwohGEyRpBP2H1s2gijisgZBq6r
         upxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=sSJPTVVkjcWARcwigg6wJDNen7ofl5R1qSbWzhReSSs=;
        b=RbD2udvbZPlNQGvkMjonK0VZMqwrsczvqaWoE3WdIsRbWj8vf0akrFRgX3jW/xEwY7
         YJnJ+LTuwabTypI6BFWYjvTZP/yu9A/sNys9cENSyi4bd71xHeqfIOW+GgER6HiChxnD
         6lTtAgPilzRsOGA2gFXi2ltApTdf5LrqMceSoS7R6JbBgWXcwdu8YJXt4LkXxK5UY7k7
         OUqm8c8Yepa+Ic4I6Tl6ANE6GwazL6LmMTsTTNqpCxduTezsAVpxrfMBh0ychgPxM3gs
         9ebU3SnCuUN5uHpu69oVh8zihZp0Ef760rJYZJndTsTGklKNNzHRiDhPW2nyH9NQTgst
         b/8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ou0+mTUM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si6880254ybj.265.2019.02.11.16.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:04:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ou0+mTUM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLZ4-0005Gb-BM
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:04:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLO9-0005IQ-Rr
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLNu-0004Os-Dm
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:12 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45667)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLNt-0004NH-OJ
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:09 -0500
Received: by mail-pl1-x642.google.com with SMTP id r14so316309pls.12
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sSJPTVVkjcWARcwigg6wJDNen7ofl5R1qSbWzhReSSs=;
	b=ou0+mTUM08GaHP5EZOVxGaNcsMe3aqJOEp4TUAeHzgdrBYQGm4hh1Ry7dJemCe9Tsb
	StNuX+8Kz+SfQG4v939gJ3Cdrz8PxoJyjxOhLP+fUUqcWLWk17wNPpvGwHJASBxCIaL3
	3DdVYDoOX3zBvMLTaCaSjnyYIcY03lZ3C3nHifXI4aNaqILHsYfrAGR0d12/lrGmM8WZ
	JQX7DMbkTam4axLwezkFIVoAZbRtPQhLfv2utzBTKqYvVCl7TMBt1y/i8onT6uIrrBJF
	2p9ulNQKaBQ7hn4HPWhoQWk94yJDYe1p08MW/u0bXcUdRLeotoITNtoywD0UeyRPyjxr
	A7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sSJPTVVkjcWARcwigg6wJDNen7ofl5R1qSbWzhReSSs=;
	b=sQKKiD/66n1Tgb3jShde7h1Lq8QdkLB2Mkn5mi5Y9KZkGdLbk/Gil/7CPdTCodaAAQ
	kIYRsGbrTNZB7aOaWz6VeS8fd8oxJZgtdzZPihoNp6dymqXP0rnUou9Z5GB2O2IhfO8d
	v6S8dZwHpvb0h0Ps/1t9JJSqAg6noBpLaAOvYDBJxE1yq+M9Sq1QkwR8sKk3OLLj1gaA
	u+8JrylV+aI+vyyfUavzErQbfCJSjzvED30WAO+6eMhVv9cudWjoFPJUYRbUw+qyGjcq
	1MRxQyl/Tk8a609QzRGOmMSj8Myk2x/Oa/o43Houg6MCwESLeJ7/1t1X1/WKSMdCZojN
	iFFg==
X-Gm-Message-State: AHQUAubEn5umWPJT609so/ZqjnmofEhGS/qSrqqSA8K0W54qHsI1ZZEz
	MLSlclf5wTPxP08iVS0OCL5z0YVHkaE=
X-Received: by 2002:a17:902:f091:: with SMTP id
	go17mr910510plb.235.1549929188245; 
	Mon, 11 Feb 2019 15:53:08 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:35 -0800
Message-Id: <20190211235258.542-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-devel] [PATCH v3 05/28] target/arm: Extract TCMA with
 ARMVAParameters
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
X-TUID: ucVPhGeUihng

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 1 +
 target/arm/helper.c    | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6c018e773c..2922324f63 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -959,6 +959,7 @@ typedef struct ARMVAParameters {
     bool tbid       : 1;
     bool epd        : 1;
     bool hpd        : 1;
+    bool tcma       : 1;
     bool using16k   : 1;
     bool using64k   : 1;
 } ARMVAParameters;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e73bdbf041..cbe3500f78 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10447,7 +10447,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     uint32_t el = regime_el(env, mmu_idx);
-    bool tbi, tbid, epd, hpd, using16k, using64k;
+    bool tbi, tbid, epd, hpd, tcma, using16k, using64k;
     int select, tsz;
 
     /*
@@ -10462,11 +10462,12 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         using16k = extract32(tcr, 15, 1);
         if (mmu_idx == ARMMMUIdx_S2NS) {
             /* VTCR_EL2 */
-            tbi = tbid = hpd = false;
+            tbi = tbid = hpd = tcma = false;
         } else {
             tbi = extract32(tcr, 20, 1);
             hpd = extract32(tcr, 24, 1);
             tbid = extract32(tcr, 29, 1);
+            tcma = extract32(tcr, 30, 1);
         }
         epd = false;
     } else if (!select) {
@@ -10477,6 +10478,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         tbi = extract64(tcr, 37, 1);
         hpd = extract64(tcr, 41, 1);
         tbid = extract64(tcr, 51, 1);
+        tcma = extract64(tcr, 57, 1);
     } else {
         int tg = extract32(tcr, 30, 2);
         using16k = tg == 1;
@@ -10486,6 +10488,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         tbi = extract64(tcr, 38, 1);
         hpd = extract64(tcr, 42, 1);
         tbid = extract64(tcr, 52, 1);
+        tcma = extract64(tcr, 58, 1);
     }
     tsz = MIN(tsz, 39);  /* TODO: ARMv8.4-TTST */
     tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
@@ -10497,6 +10500,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
         .tbid = tbid,
         .epd = epd,
         .hpd = hpd,
+        .tcma = tcma,
         .using16k = using16k,
         .using64k = using64k,
     };
-- 
2.17.2

