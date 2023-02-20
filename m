Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2707182ejb;
        Mon, 20 Feb 2023 15:28:21 -0800 (PST)
X-Google-Smtp-Source: AK7set8Vw19zy8A/plQFFt+/8KPgf6WaBe8vMVM3yNXilPwLDsuRt7Lfwxix2k3kYtIeIJqdgbhK
X-Received: by 2002:a05:6214:2027:b0:571:f87:a665 with SMTP id 7-20020a056214202700b005710f87a665mr6808695qvf.35.1676935701524;
        Mon, 20 Feb 2023 15:28:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935701; cv=none;
        d=google.com; s=arc-20160816;
        b=DPcM4bq0PMi0a9/HRZVhEJYecB7CEYRcxPQxdtI/re2vqyJ6l1VuNIXPV+VoLXAOxH
         C1/RQn++Mw6s4ETso/GuqGOKoB5h7DWev0bKLLGel3F6HiSgwErfAFr5vm40p3VVcqTI
         me2bnePfqzL5q7YE1+IAg5cm9dthTTa5SHR5fOGwaEVaV175waHd332Nwp+nNrHCYKWf
         s8QWob1xCWtTjY7tKDlRK62ERlZ8HoofjVv/MksZVDM/CHYYR+lWPN0FKWJmyJS+MXH6
         07oUwQ6VRZOvz/48eaFyUb58lQVhSune7bMJxgBYjxga1jVXhQM5AlXSkApSJ4Qk44Ks
         ghEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/Ut/aS2oezKic9UZ9DAK+e9x8VNxmPUkA0viJdZ3AGc=;
        b=TdC48qbD0M5EVWCiSFLJBuz+WGagErIYZHyDloezNuq5vwB9kRDpQQ+IZ12L0LhNMb
         qf15TMYaChSkkNrOk/k8Xcc31aRF+yAmpwsEBOF6kc/jPqc3o27Ml9JP0SEeruczC8Nw
         E1FX8XapFJIoFyH6J9Zxdbs4FfUkvNfp9JBjGIMvZsUrZdhdiL+7E15OH7qJ//BgvWHk
         Cs3x4LXNh9KO8p8OfKI7LOasmFB5iqb/uOrakkqDpCGfAUZzNm6aFxXjGeWUqe0t59Ao
         L60F2TbYS+Ai2t5Yr/Fpa3wXYOr7S7XQF7ysgMBdsXWRm1vg2LjYIfKPQ31tjjOZo4mU
         sQnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GhqdHjbr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a05620a240700b007056237b47esi11138028qkn.632.2023.02.20.15.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GhqdHjbr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYp-0004h8-Ms; Mon, 20 Feb 2023 18:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYm-0004XR-K2
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:27:04 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYl-0000TF-1S
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:27:04 -0500
Received: by mail-pj1-x1043.google.com with SMTP id
 v3-20020a17090a6b0300b002341a2656e5so2796114pjj.1
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Ut/aS2oezKic9UZ9DAK+e9x8VNxmPUkA0viJdZ3AGc=;
 b=GhqdHjbrt2izcd84632/7HzZ/sVbJWMYyIOeUcjyL8xy8c7HZzFlH8ta323uZjYDZo
 gXvumDAmYks8aeypQrvrHTFIYKYUOzqmE+VJZd0fk20foX5qK9n6ShZJijB7I1fGXVAM
 a4QV/bX+kRZi0Ak5Dj1kNuPieD74OSiHjFFZwRcxGhKfVS7f8jPRDdZfuEMvSNp6c89R
 ymkHyyPngC3JM2yBJyRHI21tFx5e063YklRuGWxdfBi44/PiN3gTIlUUqn06QmISh8RM
 Ff1eaPESw+r+VyUAfkZ72aNc3cNSr2yW8iQjdMgY+1VuT5VceREwR2scRyQ7qJWWHixg
 r/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Ut/aS2oezKic9UZ9DAK+e9x8VNxmPUkA0viJdZ3AGc=;
 b=aPxu+jBg5FWxsQoI8EfyE3wvgm5lYpjNx1iKsqa3wd0K0bnFCnxIz6FLAHAn55cQnA
 tk6RSgozrCxCcRJTiqODcLJVA0W4oMqyTE479vw81W4k1CHrTE0XzRAfTulLONg79TIE
 KJJtp6BObv4XYQOdptmAQT5rL47z/+R6A6/8Y3EoOP/mOzMBICw+cfm1IbckzPNcmTBZ
 ql9TNLcrEDPw9rr8uOmKrPvJvHbE9iYfH1On6BvB8BtCuPQQM2utoRW9Fw/K4rNk/SRF
 tyEexZzLrNgfjhadEll8rsEhOCBj/6j0D4e8pUYDY3nrLRR+iPgv3r3ZYdYjIcPDnAuV
 KPgQ==
X-Gm-Message-State: AO0yUKXs0gF1oqpEONa0y6acw0M5rADCuoRuOkzpY3Het/UJCtacHtaW
 LNnqXtAqxNamBeY06O/rEsX8sw==
X-Received: by 2002:a17:902:ea07:b0:199:33ff:918a with SMTP id
 s7-20020a170902ea0700b0019933ff918amr4216964plg.21.1676935621746; 
 Mon, 20 Feb 2023 15:27:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:27:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [NOTFORMERGE PATCH v2 20/21] target/arm: Enable RME for -cpu max
Date: Mon, 20 Feb 2023 13:26:25 -1000
Message-Id: <20230220232626.429947-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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
X-TUID: ri2Tz/c/YnZC

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

