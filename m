Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp244447ejt;
        Tue, 20 Jun 2023 05:46:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6nyO26g0YkXcHWBpe9qoXxsjsGZq5DCf8B8m7C94p0g/ZmYbuih2ALabzAdUJZQuk4ELAZ
X-Received: by 2002:a05:6214:20e4:b0:62b:42e4:bc2 with SMTP id 4-20020a05621420e400b0062b42e40bc2mr13517801qvk.29.1687265183128;
        Tue, 20 Jun 2023 05:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687265183; cv=none;
        d=google.com; s=arc-20160816;
        b=RO+w2TH8zubWG4ZCd6nAIvIoNSi1oLP9fW9E7f9p5pNY6nR52ndztjhiTuiWvg3NVg
         EoTifq1/73cz9UeINv1xFg3Yl/xP2wMUQWr3mYJs+xCTWjNvaAyi/jsZweDnmMn4+9Q8
         ifgv5ldZBr9c6P1d6iqDVIoS5q3mFOiN0SNkmWw9WjlfbMzJtx1j7HOLp2SVZvDcoDiZ
         i3pogfMyoM8Oy0RImivRnwctGwcgzmaOB1vtEVCyAnxVDbhxn9dd4CivNoZaxLlp6uKT
         5ut0c78agetlkdTZvZycFlzZTqwucggzP22wsjWJYcRasbUX2qHUqNYXKHAiWa5iEoeo
         ZAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1HLF4JtJNvNK+eLsSqEMWXzm1BweGNtst+0wJav7KZ8=;
        b=gHmZm+DgMTcN49cyLJYK8HfIZeisLDm4oxh1hbg+0bOCLfuL5dKWe8/blG3okzRHG6
         GCjvlEv60CRgBbUlT7JHAxiqhhFw6USMeRvhJz3gFx7HrLTtuMEx4UHgtOWiBlZ56kM6
         puwcEJWOZRQthyWda3f4IJgusKIRDQ8GLDaXqQjPGNfhReREQhFeyvH+RKASEjF4lNJ1
         fEE3NOJ06H1SZuG1ZqpObAtEan2kAUjb/OAJpII9cUSWfPPm1vJPfW0tA4896Aj70XpZ
         DkJud81loFHzuiV9K5Srp6S3QBKzYQkoBoAUTg9w1cHv+0TTlEnvDOYuSS9dAnUDqsWT
         rzVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cEQNTNWn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020ad45bef000000b006237f66138dsi763125qvc.497.2023.06.20.05.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 05:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cEQNTNWn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBaj0-0001j1-HQ; Tue, 20 Jun 2023 08:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaiy-0001hQ-6O
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:44 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaiw-000277-Fl
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:43 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-518b69d5b5dso6483430a12.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 05:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687265081; x=1689857081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HLF4JtJNvNK+eLsSqEMWXzm1BweGNtst+0wJav7KZ8=;
 b=cEQNTNWnXzbUArmvjExoCMRgyEWQMbY8gI3YT+jyej1n1i4FTL5XEWhurZnVAiorRI
 WsHMWz8cYWR0qJCSFihP6pIONUEq2Hi2cPJ6CLmVsU8dSIlT9o3LNcC5Isye/IQb6D1x
 BwhvrZmQi9cUFiz+AA2DKG7zCN9m98IB+KYHXNx6oOi4NSu3Pk7NEgitAWB1OWRrWEKC
 nlwo1pMo1GCB3wAM/0aCBHqtrXC45Xft38Up14Jnp1PM63FNhrlvA0vCCCHJwlySQ21f
 QTl+C3Wdq4Ua2uUrSsTrFD5t0KrTtKbSCvkdl4/Gm7ZV7Psh8LGcRb7qjM1c7nDY3O7H
 O1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687265081; x=1689857081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1HLF4JtJNvNK+eLsSqEMWXzm1BweGNtst+0wJav7KZ8=;
 b=EcB1T5XDMuFTnY+rr51tgT7OX6UWIbTbXYPZQUBkVyk1ni4W32EfBNV5henCsSGWyG
 uTP7//xqtzCGG8gtcvwuCjCCrl5hXBegd3Qd/QQKiKLTFGHUlJkmSF+WdBD/NIGzRKhQ
 5qe/2tx1ZOwQ509FSiWWsy+LYXXvxvTcmf5Jx7qaBBKEhuoMHWfqisNzD9JDxmIfXQiQ
 xr3wwN36eR20LMF07W7KQZ9xWV+OzZfephmZLWec/+Hsc69vEDJabl4hgyeywiS2j9wZ
 dsKhUWln18Mr2DhVLySgTtMqbHM620dzgeo6NXlRxfxaZGRXzBI9VbY/1Tt3jx6b735C
 9SdQ==
X-Gm-Message-State: AC+VfDzB4kWMP1Z/ZvqD3Wtvv+NSt1UzvvroDFbI0LqPVWPed8LzUjfr
 yPiJavodHr2dU+SlTG5LEIH51Q==
X-Received: by 2002:aa7:d585:0:b0:51a:3b59:20f with SMTP id
 r5-20020aa7d585000000b0051a3b59020fmr8433356edq.36.1687265081139; 
 Tue, 20 Jun 2023 05:44:41 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 w9-20020aa7dcc9000000b0051a313a66e8sm1142541edu.45.2023.06.20.05.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 05:44:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 20/20] target/arm: Add cpu properties for enabling FEAT_RME
Date: Tue, 20 Jun 2023 14:44:18 +0200
Message-Id: <20230620124418.805717-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
References: <20230620124418.805717-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x536.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +YiaP6FLjwnr

Add an x-rme cpu property to enable FEAT_RME.
Add an x-l0gptsz property to set GPCCR_EL3.L0GPTSZ,
for testing various possible configurations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 2976f94ae4..6fec2d8a57 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -142,6 +142,56 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
     cpu->sve_max_vq = max_vq;
 }
 
+static bool cpu_arm_get_rme(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    return cpu_isar_feature(aa64_rme, cpu);
+}
+
+static void cpu_arm_set_rme(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+
+    t = cpu->isar.id_aa64pfr0;
+    t = FIELD_DP64(t, ID_AA64PFR0, RME, value);
+    cpu->isar.id_aa64pfr0 = t;
+}
+
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
 static Property arm_cpu_lpa2_property =
     DEFINE_PROP_BOOL("lpa2", ARMCPU, prop_lpa2, true);
 
@@ -700,6 +750,9 @@ void aarch64_max_tcg_initfn(Object *obj)
     aarch64_add_sme_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
+    object_property_add_bool(obj, "x-rme", cpu_arm_get_rme, cpu_arm_set_rme);
+    object_property_add(obj, "x-l0gptsz", "uint32", cpu_max_get_l0gptsz,
+                        cpu_max_set_l0gptsz, NULL, NULL);
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
 }
 
-- 
2.34.1

