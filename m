Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3707936qtb;
        Wed, 2 Jul 2025 05:41:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1UbER1Qx+fdlGhgv35wyN7X5n3T8Q+ex4RBVouXmHv0Bm9spgk3kxRwgZPH7yJrl4aVu7HMYsChhsjg==@linaro.org
X-Google-Smtp-Source: AGHT+IEdtCUNOj56mAdjFgRUIMsmMr4YRJI7+N+NviGoQOFkisu3Z0QXtUzr0mG1tDUdj2NQYhM8
X-Received: by 2002:a05:620a:1aa1:b0:7c7:9a85:d395 with SMTP id af79cd13be357-7d5c47277cfmr390502485a.44.1751460083763;
        Wed, 02 Jul 2025 05:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460083; cv=none;
        d=google.com; s=arc-20240605;
        b=drqgWbPPuz/X+aA3ZJmQusBHxtkxdVB5cN/10BKSbFpeFX9YXGpZjFBEgCxZvgLQO3
         8HdMNusbBn/e3G6ZkaNntfpISmPQ+FAgRynirds9P5GbEJcfnQO3WkAq5PxWr/IVLrLn
         TCqw6Zd45xhkHI/CKWMolHijFentrdBaRihyeRlOhDQUSphrwErmmikNDrMXiBo3YJzG
         UYjmCchPldYJzxZGzmeAoXvQdH5zlHHDT/3cDmYwh6y/vx2iRRILhED3Pg1WKho7K8P8
         Q4pTiMiHbPNI54gdJijUxdLKN6amP+jSs6qzGIzzNCviPtnquCT4R4aVuwoaWovFjkfP
         slVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=veT9cRM8uVQ4CyOBVMkGv45SOq4u7Wg0GMO4n1xsuYc=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=hDoHNT2uJ3PjoFIrLXScE1C2Qn+3kFN+QINb5RoEfQmq6GCbqaBV0g5jc189JYS8Ys
         4JwIRHw8ogdf2F8VrbYf16Dl0pKx3D9ibiX57uzA+CQA3xyQFKv2D5jyEK982TcSrtsq
         6xfH+wjERpQWRZYF1/jm4rk4GT76n1V+I9d02gC8NF2lmb288kXDO3M7xhdJDkA8gnwf
         YUFOo1DdrtVM2WjZIzO3fO2XwGaT22h8gT4m6CGTDJuw6IhQw+lTOqgL0nnBXP4bzBLt
         re/SleBInXPkFL/bImA4zlfkGczzmAHHM52cv35w4JkTdRs9tbUuMfmXpALQBm2BjlQo
         L5xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIVgS+Xh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0ffda1si131305521cf.51.2025.07.02.05.41.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:41:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIVgS+Xh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwgD-00087A-3j; Wed, 02 Jul 2025 08:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfq-0007eB-JF
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:34:52 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfd-00011A-Mo
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:34:50 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2ea6dd628a7so3907560fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459675; x=1752064475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=veT9cRM8uVQ4CyOBVMkGv45SOq4u7Wg0GMO4n1xsuYc=;
 b=fIVgS+XhgEa/Y2eua6RF+88UK0SBQtuCXztSuFkJD5m7VmagCVkJXd8ZctxOCp2lVl
 rZNDW0cdeWMJZg2VpX99TR75RwELPiDNPv6/kvQSvE6yViLQrlRgCirHF3bnn3/1fh/t
 dKbXfeheJZllvnajCCu0pVNtDJlOmuLF7W2O8yC0L3Rb6kDT3WoMGwLJAttLO578tHn8
 V/cfCfRX86s02EBYKj8ee86fDxfDq/ED1H6EMZ2UIKk/LAAOQPA0vnNrGxDf+3GjC4u3
 6RRChgYqBJvA/izCO8B3XRinFUurSkgrNE5CgYRxeve+FvqnjNQfaT5Ds8JiRbTiyMzI
 7A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459675; x=1752064475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=veT9cRM8uVQ4CyOBVMkGv45SOq4u7Wg0GMO4n1xsuYc=;
 b=nthsv2iKyMf42xgd1aCEMQ0w1CS0uJaF+2hCtd9+QEIQnze3CKjRq3hu4SRxj4QvPY
 D3CbemOr51xZYhluYcBey+XrJ4Iyr+DXhT10IJyF5ICxDxYuyPdSwrpu7Tmc6OVRVyOE
 qzPi1vZzQpBYz16Xkngj+xUvsFWJkHg2tTZ7exEJuKRHHP3gP9kq7vm1WaAZUx1Inwkj
 9Q3vyNknwA0NOk1fiigrZr17J9Y424vGN8rLg5Acvgbgo6q7pq5pPFeCkhzTn4L7kwc+
 ttIijk8dcZJ63f0RZrUeYMsKvoai83Dap53sz2YxuvHURqPAs59S/ELpv7C3DiVUbK3k
 159w==
X-Gm-Message-State: AOJu0YyptRKWO0RaugNe8rwAWeu9RbhIJFr0r7uRBAS8ML3u45YgIXDc
 UPwtaHM93DJlEpEkJivqsSAJj5kmxYj6G2CqcGIpfXoOgSWt8OY7+pO6XBRFlxjAjoP7qxlCn8E
 47le5ZaU=
X-Gm-Gg: ASbGnctlLZuLx+R2qsqHJ6ysWoD1V4Qcbhtt1JH3l38FPTY3ckBWho/8JJTfcfnUPQt
 fTDILEeHTr32HWXz/vLbyBE5AnOLJN3x2gqYsRpAgh2n2CFusXaQisky8csSqwqfQ9Qxio8vm0V
 J6w+mhuz06hZtGJUYiBrMOXHQlfi7dGj/SdQ20jIs/h1JWW5y/y2ngyhvWEO9jiW+T8+GT1kTTp
 ohd+XMhBY+hSb/CmpDSKDua9k0U1rIWK6W4F5LpRfDwnVROP588tQvnZqt3fA5BNRW8K5y64Hry
 GG9VpF15vLeAQ+Bvrmn2S58m0s0iqas5RJ+BYaSJ7OATBKqpV7uAdrm0C15Oq2C6XKCwbA==
X-Received: by 2002:a05:6870:e993:b0:2d5:b7b7:2d6e with SMTP id
 586e51a60fabf-2f5a8c6e11amr1851391fac.38.1751459674616; 
 Wed, 02 Jul 2025 05:34:34 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 17/97] target/arm: Implement SME2 BMOPA
Date: Wed,  2 Jul 2025 06:32:50 -0600
Message-ID: <20250702123410.761208-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 64gVdSv0XKMm

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  3 +++
 target/arm/tcg/sme_helper.c    | 34 ++++++++++++++++++++++++----------
 target/arm/tcg/translate-sme.c |  2 ++
 target/arm/tcg/sme.decode      |  2 ++
 4 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 8246ce774c..17d1a7c102 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -153,3 +153,6 @@ DEF_HELPER_FLAGS_6(sme_sumopa_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sme_usmopa_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sme2_bmopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index baeaa3e069..6122a5b5d9 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1297,17 +1297,31 @@ DEF_IMOP_64(umopa_d, uint16_t, uint16_t)
 DEF_IMOP_64(sumopa_d, int16_t, uint16_t)
 DEF_IMOP_64(usmopa_d, uint16_t, int16_t)
 
-#define DEF_IMOPH(NAME, S) \
-    void HELPER(sme_##NAME##_##S)(void *vza, void *vzn, void *vzm,          \
+#define DEF_IMOPH(P, NAME, S) \
+    void HELPER(P##_##NAME##_##S)(void *vza, void *vzn, void *vzm,          \
                                   void *vpn, void *vpm, uint32_t desc)      \
     { do_imopa_##S(vza, vzn, vzm, vpn, vpm, desc, NAME##_##S); }
 
-DEF_IMOPH(smopa, s)
-DEF_IMOPH(umopa, s)
-DEF_IMOPH(sumopa, s)
-DEF_IMOPH(usmopa, s)
+DEF_IMOPH(sme, smopa, s)
+DEF_IMOPH(sme, umopa, s)
+DEF_IMOPH(sme, sumopa, s)
+DEF_IMOPH(sme, usmopa, s)
 
-DEF_IMOPH(smopa, d)
-DEF_IMOPH(umopa, d)
-DEF_IMOPH(sumopa, d)
-DEF_IMOPH(usmopa, d)
+DEF_IMOPH(sme, smopa, d)
+DEF_IMOPH(sme, umopa, d)
+DEF_IMOPH(sme, sumopa, d)
+DEF_IMOPH(sme, usmopa, d)
+
+static uint32_t bmopa_s(uint32_t n, uint32_t m, uint32_t a, uint8_t p, bool neg)
+{
+    uint32_t sum = ctpop32(~(n ^ m));
+    if (neg) {
+        sum = -sum;
+    }
+    if (!(p & 1)) {
+        sum = 0;
+    }
+    return a + sum;
+}
+
+DEF_IMOPH(sme2, bmopa, s)
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 7b275dd2b8..c2615f06ae 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -539,3 +539,5 @@ TRANS_FEAT(SMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_smopa_
 TRANS_FEAT(UMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_umopa_d)
 TRANS_FEAT(SUMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_sumopa_d)
 TRANS_FEAT(USMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_usmopa_d)
+
+TRANS_FEAT(BMOPA, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_bmopa_s)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 37bd0c6198..de8d04cb87 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -165,3 +165,5 @@ SMOPA_d         1010000 0 11 0 ..... ... ... ..... . 0 ...      @op_64
 SUMOPA_d        1010000 0 11 1 ..... ... ... ..... . 0 ...      @op_64
 USMOPA_d        1010000 1 11 0 ..... ... ... ..... . 0 ...      @op_64
 UMOPA_d         1010000 1 11 1 ..... ... ... ..... . 0 ...      @op_64
+
+BMOPA           1000000 0 10 0 ..... ... ... ..... . 10 ..      @op_32
-- 
2.43.0

