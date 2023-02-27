Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5119483ejc;
        Mon, 27 Feb 2023 15:04:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+Zvn9NJv1sCR912v3yGbc/efNtZT1tQte6R8qsz7ZK4A5lP3HNxQ2jiaHNWw76QynSJPqK
X-Received: by 2002:a05:622a:1206:b0:3bf:db29:b793 with SMTP id y6-20020a05622a120600b003bfdb29b793mr1570132qtx.20.1677539046562;
        Mon, 27 Feb 2023 15:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677539046; cv=none;
        d=google.com; s=arc-20160816;
        b=0CJqtx+y4pwbQrjlI3iDgHue9HBUItE9xDGOQ89fGjSHzq+0Pa5Wy+VZ0IYG6hC+/Q
         md/Tvzc+KVSh9YaIjyUH6MFuOjBkVUpY6Q6rqUbLrdVMhEM1qblpZ/BdFnamatTRjX0b
         Y1ZYQaMJykFYkiCW7wvjeIMDsIique1+v4f5L4faniqKUKBJ/twCPlAkpvvmQeXUaay4
         oz5RrnbR1mSIu1bCtfAIiApch6mk003gOX/qj6ToIbruVrm4+jTVM1koord/1A0WgvuV
         6cP59SEpux4rNw5m7bVy6wFaW9AZs4MRQqmBY5R0Z0F/LfDrgZyJ7vcwDJkK0rJu2CaU
         zb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/Ut/aS2oezKic9UZ9DAK+e9x8VNxmPUkA0viJdZ3AGc=;
        b=xKcXgYDnCd6e9JDDC7ZVd37J7JGXolXRgrLrCSgbhkYnctboREpDDEIN5bc9XhqDv5
         yGM8Z9NLMzVm7UnChRw/16Isc3N2ZRxV/CCsMZeYYA4J1kFvqjKY03aErwvA6/3tbmh+
         2RmefshraFXClrpXCHa/Z0EOQp4RTJfL2QulLrNMgrPDvqhTRjXkFcsuHIGslnAvlCcN
         H5ODa8hvu69tziSp5AgKOMsYuRQK9F2LAX0ci6eMsPeGV5YYFolEaKZ4S6g45qqRdR1a
         0ATvNulmA9P09AiJw7cGzvn8SFHJ/4HZwITDKJ8u7Mc5mlZcHI8tx0OZVB1sXdKFR6ZS
         jNDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xMzdGw/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020a05622a134b00b003b8509b59bbsi7066225qtk.354.2023.02.27.15.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:04:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xMzdGw/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWmVa-0000r1-On; Mon, 27 Feb 2023 18:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVM-0007xl-Lw
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:02:01 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVL-00017A-1K
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:02:00 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso3802241pjb.2
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 15:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Ut/aS2oezKic9UZ9DAK+e9x8VNxmPUkA0viJdZ3AGc=;
 b=xMzdGw/zkrh4HwAwLsEo9pLZwDZO8nnL1UmLwrwKM9kqlxF5An4WaMFAGbDXJ6ai5G
 7eiiY7WmxDbnrXxetUgkXS6ae39Nio5LLPKAcegbDwJ3++/yiUmhee7BGSmugZOWKBLM
 d1pYYva5O2qNMF5jLW3PAJS4RP5vKG6g8HoTWeFkTdgWk32kY6D52uaXrYySGlsaFWfk
 WGZCcykyc62Ux6d2I92uY2mf2gzK5c6N2pS1hUg1SRMwi1tUG69orjnL2/3lrcQwoe28
 idQUGj9TmD//23CWCVpDH2WSXxKAjcrGLYOc+yS86MWmq7b5nCfnxOxsFb72z5dpeBay
 buZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Ut/aS2oezKic9UZ9DAK+e9x8VNxmPUkA0viJdZ3AGc=;
 b=xiDVktq/zUb3h0NsckKpo5X2IBeNHpPOrXrEdjqYUx6LaJviiSq45FDZ9O0INZc815
 zGlSHoV4mcMIl1ZwDmCNYnQnzJMNJwSAj9uXisxautSnr9u9Acgqq/tEy78OLsiNyyK5
 NSd8l3Hx5P5ncXTRMzd3H46ms5zvLNEzi1gONHmXLbUU5hZGT2jChF1hjr7pd2k+mAIc
 +p5fgPPl95Euu2bQ2GE/6M/hmE9GZJaiRxZyX7xAbTUr0bIibZ4aHMAiIy0ojAbiu8q0
 1KLGk5BoLJb6sRlRWkrEcl+HbNXL31/ATIVV4d5TTb10eIBSPx6Kqht7+zMXr4lkLrV7
 DzaA==
X-Gm-Message-State: AO0yUKXyOlL7+uknZEkol2ekCVGXxCPFuAik4CRcMkI9Vv6BqAhZR1A0
 XvTZyTwfiqx8B37z314eQFah+NbiOnExv4FSWsV73A==
X-Received: by 2002:a05:6a20:a111:b0:cd:5334:e240 with SMTP id
 q17-20020a056a20a11100b000cd5334e240mr1456897pzk.5.1677538917647; 
 Mon, 27 Feb 2023 15:01:57 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-8.0 v4 20/21] NOTFORMERGE target/arm: Enable RME for -cpu
 max
Date: Mon, 27 Feb 2023 13:01:21 -1000
Message-Id: <20230227230122.816702-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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
X-TUID: mtPBszy9+2xp

Add a cpu property to set GPCCR_EL3.L0GPTSZ, for testing
various possible configurations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4066950da1..70c173ee3d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -672,6 +672,40 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
     cpu->isar.id_aa64mmfr0 = t;
 }
 
+static void cpu_max_set_l0gptsz(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t value;
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        return;
+    }
+
+    /* Encode the value for the GPCCR_EL3 field. */
+    switch (value) {
+    case 30:
+    case 34:
+    case 36:
+    case 39:
+        cpu->reset_l0gptsz = value - 30;
+        break;
+    default:
+        error_setg(errp, "invalid value for l0gptsz");
+        error_append_hint(errp, "valid values are 30, 34, 36, 39\n");
+        break;
+    }
+}
+
+static void cpu_max_get_l0gptsz(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t value = cpu->reset_l0gptsz + 30;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
 static void aarch64_a57_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1200,6 +1234,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, RME, 1);       /* FEAT_RME */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
@@ -1301,6 +1336,8 @@ static void aarch64_max_initfn(Object *obj)
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
+    object_property_add(obj, "l0gptsz", "uint32", cpu_max_get_l0gptsz,
+                        cpu_max_set_l0gptsz, NULL, NULL);
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
-- 
2.34.1

