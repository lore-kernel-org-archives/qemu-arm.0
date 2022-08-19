Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp901775ejf;
        Fri, 19 Aug 2022 04:12:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR52H4sFc7frWWPz4mkScexT79NSKFSpYgNoqRbcGMtrL7YfRmWh/e1zIK+t7rGXLxHwUU0t
X-Received: by 2002:a05:6214:262e:b0:496:bac2:c7f7 with SMTP id gv14-20020a056214262e00b00496bac2c7f7mr5081872qvb.126.1660907560667;
        Fri, 19 Aug 2022 04:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660907560; cv=none;
        d=google.com; s=arc-20160816;
        b=Ec2e9dihWaW7RmJxyFYvSf3Z06ElaTA9CxUfAdzeQIAjlnCuRxNMlF4vdZz5KtaQL1
         e4ej+BsfA8g7utWCeFIH8x1hHhduMRsw4gBk0SNuXjEGV9qEASL22GAUGqYTwRssNERM
         A5YZmqZWe4pc6dc+BF6U2JWeScwX7Y1ITENIgn6CUu6ITNPMxpL71x/iyg3rCJVQz/Ia
         BzDZJ/pViyz6nRedByeB5VsTA9oXlmADx2DojClKf8jHfMxsaTKgKegjv6aHdG31tGI9
         XyPEosQO4TathDESZusf82juYWO2l0sbGbrtt32oXTcM+tX3D35b5GHcJdNdIpHnA0N3
         lSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T2d6RVLzyzWzf/spKdraeHdOh9Hi3cYnCCfjXRwnKAY=;
        b=wczuxGL52EdfzfCcggvF9TKAw+C2A+KxHbJMGKZyQ8OtEn9IbnXhvfu9C+Hb8n/Y27
         uTez/ibfg1M2s3aX9obz7mM7yC3YFvYqHXfHQzxEDEYYfox7bFYEFwXsoRJ4Y2kDLd9X
         XWL47r6aGvXY0jELGYDNS8e3E3uCaBWGnEjYSEsxQxBCSpvP/Xbv2d4d83DoZLBlotBP
         bbKVFGNzj9ESAg7oRdCd+4xZy5EEpF4n99hfDYMBKg3/WWRCcwLlb9xI4/0QioIEbQkS
         NfUIJpot/tT5JvYDQ7mdJZMUmu9AfrTd+quKe32N+cp+X35jU/zM3V6fkjNJdhxStH+i
         XJrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pB3Rw7JH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11-20020aed278b000000b003434dd78e37si1841615qtd.268.2022.08.19.04.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 04:12:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pB3Rw7JH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oOzvc-0000N0-5V
	for alex.bennee@linaro.org; Fri, 19 Aug 2022 07:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkP-0002Dd-F8
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 07:01:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkJ-0001Qt-Ij
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 07:01:05 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h5so3950901wru.7
 for <qemu-arm@nongnu.org>; Fri, 19 Aug 2022 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=T2d6RVLzyzWzf/spKdraeHdOh9Hi3cYnCCfjXRwnKAY=;
 b=pB3Rw7JHLxETXLhhQKkoqOxrSCKbQO5QRkNaCMeTh3O1z5NGfzSwSqUG8szYxOsBkE
 HJ7NtJBPucCCfKNK7IasaTWHoFoF4myWOagjqgj0DsWq3tFqz1WVez6ttfZ7H23pw85J
 92zMJJhZfoNcxuxKx1PnvAv8xPsgqlaH7/JFOrObjkYX/KBU9Sz9T0mFaoyTD6UUHVft
 Qh/R2L9RzuRjGFthi0NmxHjZ8h0LQpIoRGFAsOMUiYETvScxQxb5Mwld6ZispScZFPSq
 S45cACxcuFMAuxm6cWwCHccmUNC4GgGC2rymQMR6xbfSD7FSBVsAHlgRxYnLUiu49vdz
 65Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=T2d6RVLzyzWzf/spKdraeHdOh9Hi3cYnCCfjXRwnKAY=;
 b=RTZHdFdZ9wjKso/lwMYGhNMpM/fusqNZ/ML43kG7euh7Fh/nqDfNObkFEFaykKol1G
 bSAn45E60Jy8ix/0+I2neA+EZT02tSkTlYjh8SJWYQyTQUP3TToPz+qso3W6374gFPhh
 4PLHQqabswdFZ3qQTbqzi/Am2IdeWH7ZK5U3juGDpvLeWgiSal9VPQeYWC0DGRm0cQk6
 OJcqLsPkQLLGGHDuM4i681gAU/XnYyZpbcFEucJZE85We/mJKQmYH+0ZaQ9eVcQVmMsE
 /XlTd5MbIeozCAj377wJDzC46aTlE4tR+ig5F1s6uytBZsT4tonCkwlLtY2gXiVWeDIq
 dFoA==
X-Gm-Message-State: ACgBeo1EkiVSyEEEhg6+GHGuglYjAw3nNFwdDBszoL0JcdNP6ticOwDw
 rE98cdYPW4kFbAoWZjRu0lQR2JIiIsh/eg==
X-Received: by 2002:a05:6000:1549:b0:220:7199:bd4 with SMTP id
 9-20020a056000154900b0022071990bd4mr4157147wry.673.1660906858347; 
 Fri, 19 Aug 2022 04:00:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/arm: Advertise FEAT_ETS for '-cpu max'
Date: Fri, 19 Aug 2022 12:00:51 +0100
Message-Id: <20220819110052.2942289-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: c+l3kIop3mcS

The architectural feature FEAT_ETS (Enhanced Translation
Synchronization) is a set of tightened guarantees about memory
ordering involving translation table walks:

 * if memory access RW1 is ordered-before memory access RW2 then it
   is also ordered-before any translation table walk generated by RW2
   that generates a translation fault, address size fault or access
   fault

 * TLB maintenance on non-exec-permission translations is guaranteed
   complete after a DSB (ie it does not need the context
   synchronization event that you have to have if you don’t have
   FEAT_ETS)

For QEMU’s implementation we don’t reorder translation table walk
accesses, and we guarantee to finish the TLB maintenance as soon as
the TLB op is done (the tlb_flush functions will complete at the end
of the TLB, and TLB ops always end the TB because they’re sysreg
writes).

So we’re already compliant and all we need to do is say so in the ID
registers for the 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8e494c8bea5..811358fd0a0 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_Debugv8p4 (Debug changes for v8.4)
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
+- FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 78e27f778ac..6d65248f29c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1043,6 +1043,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
     t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2);      /* FEAT_PAN2 */
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
+    t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 1);      /* FEAT_ETS */
     t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
     cpu->isar.id_aa64mmfr1 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 3099b38e32b..f63f8cdd954 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -67,6 +67,10 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX*/
     cpu->isar.id_mmfr4 = t;
 
+    t = cpu->isar.id_mmfr5;
+    t = FIELD_DP32(t, ID_MMFR5, ETS, 1);          /* FEAT_ETS */
+    cpu->isar.id_mmfr5 = t;
+
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
-- 
2.25.1

