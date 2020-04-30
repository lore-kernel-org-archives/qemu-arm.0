Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2211350lfm;
        Thu, 30 Apr 2020 11:28:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypIlM1dXYsxyv2jAhysbWZutAMP9pHXncQgM9+JbmoyKU0R+zdEPehcvYwFDbZOe59dtSFCA
X-Received: by 2002:ac8:67d9:: with SMTP id r25mr152235qtp.338.1588271290350;
        Thu, 30 Apr 2020 11:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588271290; cv=none;
        d=google.com; s=arc-20160816;
        b=UTzNsquVdvwEXc5/TQNHl4RE86Fye+bpfM8aDUvjQG37q0SsGfnAHPVUWSV6nFgBsU
         WoJDB0FzgBvkBGN9I1eqGDCX2+5NYzy3kmeLrOoOhk0uBMlrJRwv9eak1AJ0c9WFri8Q
         taCzGy1Vay9ElT5I+s1G5oxLILagCOsm3ajrBA93+byATUJcuS0lao4R/E1cL+IAm4qq
         QB7+QrZf4S7f1UDBFjMD9BAc36AGlzUTRL1JElZO1DfHCdM2INywx5oqDuYhLUHGJnrE
         k4m2BRW5K0BXi/7cAtkWmGlC5QMowgbWB7cBzZOxohd1E4+ZOfHdTWRNtVm1bdYTFgOm
         ijDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4Ydk5Bbg9ucmSMF8TUFcEzRTltMFyrq9kyl7LYvgv0o=;
        b=wLnd24vBPrOA82A+5FkuZphVJXsDmSlMvjHxolvd188eHrmWnlVh0rk1dlOyHiQjC4
         bnc8jnyOe6HSpjO0hzak2atpF7xY9NsLsQnaDMjcV5OjGT4lX3txXR1opv4oJ0Uncr9l
         5oK6jKdnNVLcoigQf00qya/Bjl2dFJA7LBYfjE+ZyTagID26rsBiLoHLgLS9aSK83QdD
         jLkmXLzoS9Own0gcik9brA1AzSUMhx+j26Z/x3ZUck/7Q1FXtkm6EgJ3UlnXBLrtMKt4
         fbCuCELNp5lrl54m+nZmC+UCC+RYx2kcO6vgw4UjkZ0dq5gKDQaDLy/rv3VV+/VlaOR5
         VWwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qvuTMQAz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id v5si270330qtd.197.2020.04.30.11.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qvuTMQAz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDur-0002hQ-MS
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDeU-0002MK-MH
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDdx-0001JW-A0
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:14 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdw-0001I5-Rl
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:40 -0400
Received: by mail-wr1-x441.google.com with SMTP id d17so8142652wrg.11
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Ydk5Bbg9ucmSMF8TUFcEzRTltMFyrq9kyl7LYvgv0o=;
 b=qvuTMQAzrHTd1Rxab03/A8N4GOPCCBd9O35Kd4IDXR4qO/6p4bJroxbGPYv0XUn8wl
 baF7ghyewUvDoLkqRTSAniGx+bKc+Iv1xYhTuDfEkkow2G0Uy9YRX7GXdK8JHtBwfzv9
 S3M7u16z/s3t0yYyLItIaQdlAxWyKL/t6m/78UVTqHKntgwEUSicnZOJEYm6vfDwAYhc
 +bjLsLpcE6mFbGSvnJ3CspP6MpXCMCQlJ2k93U5eaAMXKQQfrEPZmhGQa+6aTtmV85bA
 IF0i0Ovn/xPoxnKZKPuKwqpFnOPhPeM0808hWZddlhf+1Dsef6ZD5NyliqDJrXwZRWJ8
 fWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Ydk5Bbg9ucmSMF8TUFcEzRTltMFyrq9kyl7LYvgv0o=;
 b=UOnJYm5TAOXv0gQ6EOxhQkulK+RWtM7DEtBEhIbgPhvSsiyZGm0RV4BCXdr0knWNpn
 KcENF/PV/kaDE/nlcrh4gdsbjzrKRiIXxYwxPJDYMNz+aIxpk0r0+pq7hvIoXs7taQZH
 SUu4d2c+iM0Bz0qFudAbXOrWg3kg2vlNEt26v9NpQ9aKKVD6hdeth6RzLM2hcxx93MVJ
 5RXeiNmofj/ynJUka2Net7Ot0RkKxRchPTDf93p1dDK2p8cZWJ4AbgAVKEdno0GYr+Kb
 hHfiHwkx7dL8qfGa2pwoQcBMI/Sxzbzh/ehJp+gvmPr7fPyxIiJBHq+1qnW0q0JXag8n
 aHgA==
X-Gm-Message-State: AGi0PuYDiiCn1ClJ1FLh/i1LEjQKtuUsSEym3tE6G1zxN+pF8ezYi60+
 CPbFq0j7gG6ZgDABPmdFo4A9l7kqBwYLwg==
X-Received: by 2002:adf:9d85:: with SMTP id p5mr5505683wre.101.1588270237967; 
 Thu, 30 Apr 2020 11:10:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 25/36] target/arm: Convert Neon VRHADD, VHSUB,
 VABD 3-reg-same insns to decodetree
Date: Thu, 30 Apr 2020 19:09:52 +0100
Message-Id: <20200430181003.21682-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gzUqZ6a9ZhFD

Convert the Neon VRHADD, VHSUB and VABD 3-reg-same insns to
decodetree.  (These are all the other insns in 3-reg-same which were
using GEN_NEON_INTEGER_OP() and which are not pairwise or
reversed-operands.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c |  3 +++
 target/arm/translate.c          | 12 +++---------
 target/arm/neon-dp.decode       |  9 +++++++++
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 7a602d76566..bdd5f33214e 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1032,3 +1032,6 @@ static bool do_3same_32(DisasContext *s, arg_3same *a, NeonGenTwoOpFn *fn)
     }
 
 DO_3SAME_32(VHADD, hadd)
+DO_3SAME_32(VHSUB, hsub)
+DO_3SAME_32(VRHADD, rhadd)
+DO_3SAME_32(VABD, abd)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 67616fc218a..29301061ca5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4787,6 +4787,9 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VSHL:
         case NEON_3R_SHA:
         case NEON_3R_VHADD:
+        case NEON_3R_VRHADD:
+        case NEON_3R_VHSUB:
+        case NEON_3R_VABD:
             /* Already handled by decodetree */
             return 1;
         }
@@ -4867,12 +4870,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tmp2 = neon_load_reg(rm, pass);
         }
         switch (op) {
-        case NEON_3R_VRHADD:
-            GEN_NEON_INTEGER_OP(rhadd);
-            break;
-        case NEON_3R_VHSUB:
-            GEN_NEON_INTEGER_OP(hsub);
-            break;
         case NEON_3R_VQSHL:
             GEN_NEON_INTEGER_OP_ENV(qshl);
             break;
@@ -4882,9 +4879,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VQRSHL:
             GEN_NEON_INTEGER_OP_ENV(qrshl);
             break;
-        case NEON_3R_VABD:
-            GEN_NEON_INTEGER_OP(abd);
-            break;
         case NEON_3R_VABA:
             GEN_NEON_INTEGER_OP(abd);
             tcg_temp_free_i32(tmp2);
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 055004df4e8..4b15e52221b 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -47,6 +47,9 @@ VHADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 0 .... @3same
 VQADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 1 .... @3same
 VQADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 1 .... @3same
 
+VRHADD_S_3s      1111 001 0 0 . .. .... .... 0001 . . . 0 .... @3same
+VRHADD_U_3s      1111 001 1 0 . .. .... .... 0001 . . . 0 .... @3same
+
 @3same_logic     .... ... . . . .. .... .... .... . q:1 .. .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp size=0
 
@@ -59,6 +62,9 @@ VBSL_3s          1111 001 1 0 . 01 .... .... 0001 ... 1 .... @3same_logic
 VBIT_3s          1111 001 1 0 . 10 .... .... 0001 ... 1 .... @3same_logic
 VBIF_3s          1111 001 1 0 . 11 .... .... 0001 ... 1 .... @3same_logic
 
+VHSUB_S_3s       1111 001 0 0 . .. .... .... 0010 . . . 0 .... @3same
+VHSUB_U_3s       1111 001 1 0 . .. .... .... 0010 . . . 0 .... @3same
+
 VQSUB_S_3s       1111 001 0 0 . .. .... .... 0010 . . . 1 .... @3same
 VQSUB_U_3s       1111 001 1 0 . .. .... .... 0010 . . . 1 .... @3same
 
@@ -86,6 +92,9 @@ VMAX_U_3s        1111 001 1 0 . .. .... .... 0110 . . . 0 .... @3same
 VMIN_S_3s        1111 001 0 0 . .. .... .... 0110 . . . 1 .... @3same
 VMIN_U_3s        1111 001 1 0 . .. .... .... 0110 . . . 1 .... @3same
 
+VABD_S_3s        1111 001 0 0 . .. .... .... 0111 . . . 0 .... @3same
+VABD_U_3s        1111 001 1 0 . .. .... .... 0111 . . . 0 .... @3same
+
 VADD_3s          1111 001 0 0 . .. .... .... 1000 . . . 0 .... @3same
 VSUB_3s          1111 001 1 0 . .. .... .... 1000 . . . 0 .... @3same
 
-- 
2.20.1

