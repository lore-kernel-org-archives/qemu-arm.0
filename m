Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2058309lff;
        Mon, 14 Jun 2021 08:10:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPvC0rI6Okb7WKsx8SrQFKNC/e1nSjLTjYmIEk8OYry6EfNjohe0TNXBGEGYruAIVsyELc
X-Received: by 2002:a17:907:70d3:: with SMTP id yk19mr9201638ejb.450.1623683440521;
        Mon, 14 Jun 2021 08:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623683440; cv=none;
        d=google.com; s=arc-20160816;
        b=hmp7s0BWs8DTSXiOd4s6qXczcXfQ40lgSPlO/ERNm2UGfZ/AVjG+QQuM4qucA/8xTr
         1usydavtsNzgAxdEtxRRp6zP03+SFfMwoXmXrVot9Rm2T3tz1ynJ+lwvhfkjyBVc76ot
         EtDyZwXKtqHA8wo4JGNYu7C7ddUJEbDMf9UEDskdhdoJ6KU//cVA7z8sLmMvVyPBcmqv
         ei0w6uevpAb+5SHQMtoJReUG0RZi2GO8mebgcHp7RA5ygPkgZAyHLaIK/SjTD1gjKFtJ
         b1Fmq4FifjaeIXfJq3urX4hwFjANzsQzwStIF5zJIVToYFNCYi/sQaggcWI0o+dz0thu
         GcIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MoiTJRMORwlU/6130KYoeMaB9eDKtR75xsguj8maQTE=;
        b=CZ5TiilQPUgJSqTwA7iiY2TzV26Kay0tqC7A89EnH39I8cq+/cVJ0476PSbikZMoXF
         lpctutXAUZfLvMPBiOVCI9N4S3SQdtJH3TrQqzMeNYJ5RlpAphl1BJJhKxpxSbni8CEC
         ucCOstYSfjomUmYV4+V+S+vauY3pHUHtCUhttUNVkUGfJEcgZu741e4YtAuNUIbrVyN6
         HhIpuMnMF4oY4vPvKeatAkWTtPzt++F62pFiimGcTWmOSA3tW+NQiWSs0mFT3Tge0UCN
         A7U0LyrnQUs2nIYHXNz/3g36j63XLzv/XwdGHoTnrebNjQLq62ALBqLGyx49bJXV3aBf
         Ag3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MmacP3vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x25si11883991eds.477.2021.06.14.08.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MmacP3vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoEZ-0000D8-Et
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEH-00008w-6k
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:21 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEA-00005X-Hi
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:20 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m18so14940752wrv.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MoiTJRMORwlU/6130KYoeMaB9eDKtR75xsguj8maQTE=;
 b=MmacP3vquQEenIbYMr/ksqzQFNZ7Sp9P4rlQUko1XmDEkM41p1BFA0odQ1K62bc+pt
 7aNlRTrp0VGV6Czm7hxIkz3JfhpsR9t4QnwfAtVzymUNRV+MkOLidK/GMdS101MInALk
 0CaMONZ3u4CigNjrWexETZZgl2I9mG1b5Vkabc4D7EUBhGkY0Z66D1svxHQ/kYupZGtK
 XbvOAXAZZw4G3/jcNXL1pQ0YNEQFXRhdufYSQOPCNdmngQH5y376/FIdE3/kblbyi1Qn
 7yr7443QsfGQJIQEcpzN68AGp127jH27+KPgBJgB4IoWocnekyurEJYN66sFd6x7qMSh
 fJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MoiTJRMORwlU/6130KYoeMaB9eDKtR75xsguj8maQTE=;
 b=efeJOPoyZCCRTOgLZ/2xpVcchfK3Vp0wmbbJsluSebKaAXm3AP5JLG3+CR/GacCMG3
 7fQkUgZpamgPtvapJUZ0G6D6oafl2Uxf3xiduB6IQpdABfwI7/Eu9cIiu4ba4lBEAg3i
 1MYMM1jM5rVkZcjTcFYEndGveI5EyobfcixuNXbmNQhpcVV05c5x3WEXf/kjaGM+EPHu
 tGBE6HTFpKjCZtNTXVV8UPM9Vk8UL4pSEfbSPO+k6up3suY61/8U4XIoz//9ZRSFYP/F
 +yF4Qxyid5yWNkzOYjIXjH19tL1SdblqYpMph1PnMlZ265im9TMzewwBMsM3P+n1ibR9
 Md4A==
X-Gm-Message-State: AOAM53350udFSPIaJhfvTudeh0yGqfADK0biuXl69qnFHdAJOce7H8Pq
 0mKSyr9T58k1hvrEeCRHMkG8HPpDhqrFfQ==
X-Received: by 2002:a5d:67d2:: with SMTP id n18mr19256635wrw.158.1623683411963; 
 Mon, 14 Jun 2021 08:10:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/57] target/arm: Enable FPSCR.QC bit for MVE
Date: Mon, 14 Jun 2021 16:09:12 +0100
Message-Id: <20210614151007.4545-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: Euxz76OBYhq+

MVE has an FPSCR.QC bit similar to the A-profile Neon one; when MVE
is implemented make the bit writeable, both in the generic "load and
store FPSCR" helper functions and in the code for handling the NZCVQC
sysreg which we had previously left as "TODO when we implement MVE".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c | 30 +++++++++++++++++++++---------
 target/arm/vfp_helper.c    |  3 ++-
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index d01e465821b..728856dfd45 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -784,10 +784,17 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     {
         TCGv_i32 fpscr;
         tmp = loadfn(s, opaque);
-        /*
-         * TODO: when we implement MVE, write the QC bit.
-         * For non-MVE, QC is RES0.
-         */
+        if (dc_isar_feature(aa32_mve, s)) {
+            /* QC is only present for MVE; otherwise RES0 */
+            TCGv_i32 qc = tcg_temp_new_i32();
+            tcg_gen_andi_i32(qc, tmp, FPCR_QC);
+            /*
+             * The 4 vfp.qc[] fields need only be "zero" vs "non-zero";
+             * here writing the same value into all elements is simplest.
+             */
+            tcg_gen_gvec_dup_i32(MO_32, offsetof(CPUARMState, vfp.qc),
+                                 16, 16, qc);
+        }
         tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
         fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
         tcg_gen_andi_i32(fpscr, fpscr, ~FPCR_NZCV_MASK);
@@ -869,6 +876,11 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         break;
     }
 
+    if (regno == ARM_VFP_FPSCR_NZCVQC && !dc_isar_feature(aa32_mve, s)) {
+        /* QC is RES0 without MVE, so NZCVQC simplifies to NZCV */
+        regno = QEMU_VFP_FPSCR_NZCV;
+    }
+
     switch (regno) {
     case ARM_VFP_FPSCR:
         tmp = tcg_temp_new_i32();
@@ -876,11 +888,11 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         storefn(s, opaque, tmp);
         break;
     case ARM_VFP_FPSCR_NZCVQC:
-        /*
-         * TODO: MVE has a QC bit, which we probably won't store
-         * in the xregs[] field. For non-MVE, where QC is RES0,
-         * we can just fall through to the FPSCR_NZCV case.
-         */
+        tmp = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(tmp, cpu_env);
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCVQC_MASK);
+        storefn(s, opaque, tmp);
+        break;
     case QEMU_VFP_FPSCR_NZCV:
         /*
          * Read just NZCV; this is a special case to avoid the
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 496f0034772..8a716600592 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -220,7 +220,8 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
                                      FPCR_LTPSIZE_LENGTH);
     }
 
-    if (arm_feature(env, ARM_FEATURE_NEON)) {
+    if (arm_feature(env, ARM_FEATURE_NEON) ||
+        cpu_isar_feature(aa32_mve, cpu)) {
         /*
          * The bit we set within fpscr_q is arbitrary; the register as a
          * whole being zero/non-zero is what counts.
-- 
2.20.1

