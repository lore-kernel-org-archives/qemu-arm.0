Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3294212ejc;
        Mon, 23 Jan 2023 16:01:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsXOMQtEqncSv/oCD1Uv7RE+OUTfgdsbN6XVxPur5jHOhYownoniUTvs4NiCTf0jciYuQyT
X-Received: by 2002:ac8:75d6:0:b0:3b6:34e5:3640 with SMTP id z22-20020ac875d6000000b003b634e53640mr42898661qtq.56.1674518500567;
        Mon, 23 Jan 2023 16:01:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518500; cv=none;
        d=google.com; s=arc-20160816;
        b=trLr6+etBt/Nc7GJ9BOOqAB4tZU7h4vW503QbouqZb4JAUWCOdONltiE3Vt2IhYVoC
         hhvKwSXcujOdamPqRxpPrmtegYZ4L0xsrJytZnwJnMIweDj9V2hT7OoPC52xylfTs21c
         w2kdS67hITnkMDhzBeCcGe3Enq2aKwmM09PMQtabD8agat1ytyuLGkTzf+GsRZGsjvsw
         zWESSGzK6fNe+2Ha4sGRg10BjyooQ2MiLRca7n0KeGP7HF6ArWfqznLUYjgbpIF1j+E1
         yrfSRpIUDfojTjqd0btpZ2FOaKRYS7VCflOIT4a4/YXJBNR9lZlUBx8YeXrVvd/VI1MQ
         QXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QK9QlABk5t9+fp8Dy6kIrYtuJQuby0NjdaBqhl+wHuM=;
        b=E/RP2qwv1bn7fLPtOd5uFgnr0J4ebW+xeTAiRBj5Rjo3rxT19Kx7eThOMWS9bNby3z
         l7j46Z5RR4jZ0T0Heb23sbKws6VOvfZy5VlmyrOj6dfVtkJXtRG/qpFLG5ntOslVR7It
         ZMThWpiAOW/2AL9NN7k7BmrKNGBF5pItwLgAdlqxuRUDHrflyd3EGuJMab0UCc0yrKk6
         sC7HEOBShMfaajO5sw7HnxKqQXQUp+Y0ksV+sT8l2wk5wD7zuhLvTacPivNArHIIGa8Z
         74FEiWGS5lgjVcuxPM62bF5H59lArC7RLPOTCj7LvAGEN3+zDrtDBiFd447R+bUi8Yr4
         /fYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WvEXUHsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16-20020ac846d0000000b003ae586fccafsi271309qto.544.2023.01.23.16.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:01:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WvEXUHsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pK6km-00022R-Od; Mon, 23 Jan 2023 19:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kl-0001rb-7d
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:31 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6ke-00020W-Nu
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:30 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b6so10237547pgi.7
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 16:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QK9QlABk5t9+fp8Dy6kIrYtuJQuby0NjdaBqhl+wHuM=;
 b=WvEXUHsm7KLRLg6Ywu9lX/WUlE2AG4kqp9QgslghcrYvDYgmMB7ajJf7QV/5HKmJ3w
 0dnNpruT/qhxh/zS4oeJqtYP+livbdPaZE63m2iXQVSFtQ1TOgJ5WXhwC3MlpOjldKKJ
 MLhzI1olWBa+tG0YkQ1qflRfigwFDQe4FtTG9BCqiHkpDl4mSHC2wE7I+RQoE+uy3iiS
 ZnQ+YseiXuMEqlxiuLdEavBBNNElPAiPLPhrkNG99tIfOu7HeM+BhF95sMXHxKNbz33f
 OOJwUTaLWYjUF9JEsfglCIGrtgYB/S0u4PhniGMri9tPrNItQG8lqgrbnOkYjT3vLgRc
 Lhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QK9QlABk5t9+fp8Dy6kIrYtuJQuby0NjdaBqhl+wHuM=;
 b=XFp4Z/c8Qz3uvWO0fR+PPRf3Eb6FNvrB/BnBX5gso314Aiedr82XpFgr0pYLqPvJrd
 l7YrvDAxtLS9UNBODWCbO4HJhnK8GrvQq+k0uejPYutduFyKW10BKq7M2qYzwMGc/7eW
 IOqzz5ZGxI9PxnxmAcuCLVQeNTmHLf2FckhW4LMtjASTgxMLhI99yD+yyG1p3SNq3lyG
 Cq3dyeDLYe7QO9vHtG0KXIvmTRLT1Yso+AZBie9keNNQfmOrZCEQAec8TpMKpRcdaGwp
 B1xUQDKVh59lA8dwrM+rlKTuxMikfH2mnJcu85Wphc0UbiCVEUoByzNswsu20FjSPdQm
 N8Ug==
X-Gm-Message-State: AFqh2kpEa40iwYol19Ho9rPzc5wVkvysaHiak5vA7HeA0v/Z8OpjqyJh
 gQkWoV1fmOPQMIN7M1IH61A1BQ==
X-Received: by 2002:a05:6a00:1d23:b0:58a:9bef:5cd3 with SMTP id
 a35-20020a056a001d2300b0058a9bef5cd3mr24725396pfx.17.1674518483396; 
 Mon, 23 Jan 2023 16:01:23 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 21/22] target/arm: Enable RME for -cpu max
Date: Mon, 23 Jan 2023 14:00:26 -1000
Message-Id: <20230124000027.3565716-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: XOBqCfksYPYi

Add a cpu property to set GPCCR_EL3.L0GPTSZ, for testing
various possible configurations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0e021960fb..b9343004fb 100644
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
@@ -1300,6 +1335,8 @@ static void aarch64_max_initfn(Object *obj)
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
+    object_property_add(obj, "l0gptsz", "uint32", cpu_max_get_l0gptsz,
+                        cpu_max_set_l0gptsz, NULL, NULL);
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
-- 
2.34.1

