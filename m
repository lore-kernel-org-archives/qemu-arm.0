Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7ACCD3439
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 13:26:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKyjt-0001RR-ES; Thu, 07 May 2026 09:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKyjr-0001R8-50
 for qemu-arm@nongnu.org; Thu, 07 May 2026 09:26:03 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKyjp-0007PA-Gv
 for qemu-arm@nongnu.org; Thu, 07 May 2026 09:26:02 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-65c3ea2ebf7so882889d50.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 06:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778160360; cv=none;
 d=google.com; s=arc-20240605;
 b=lip7hjPc+JQw5SO/x/OA9RH2fgE0GIa3fdeDaFCMBIAVFqItQDQdWWQq1pwbbq/rxA
 RJWp4TqVclBPK5Ny/SrNeiTtg7jPLv9DsMALOu+cxz5IPjKDNH6T0D23D+azGIVcXvC3
 5W4WEe4AbNOrHpGwZkhz2mp5ISQfZOcnBLS5fjjkFvt7PsqrydVbBYVkB7mi5AiJ/N8X
 DaOnLl1gsduglFUgfe81GiK0vctxh3rLivFfzh2tBGQPKYZ0Q0K6HHa75TojUJfdPKQz
 vF0jTO0cuTVQhmoyGqCFenKLC6GC7PZXebhatrwzkApGfLIRyE5N5siCqKs44iWztpFn
 T6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Jvi0wZDRtms50VaJzC2TWWz961jRC0TW7x1auq6beF0=;
 fh=50Siiax+a6s6NMOU1QyPmgQU2MycHH4tuL+t9vztKO8=;
 b=JfX4t8lz0yRWNC7fo0o+X/fcOtyu5hYBrt0Ph+DItcKxnZdBNBYc851EaIZe30MFE8
 Roa9rMzsIyv1RACDJNUgTNzj6QfDKBdGl1oKWjr4J4V/mCcdBOxzwojxVfdMwmHp6U5H
 9vTOmx72hF+HCZlhlGBv4UR66rfHGAHxra8sIgpiqzxKVMzV9idxVz9SwRCIEAbPlPyY
 xVfKIqoz+vfYKQAv8aMSF4ickSZfcPYuwCi5G2OdPDWUlqYB/7tAF3+xcf24FCxUfxBM
 NdW6/XGOhoOWQ9cprUZkUH23zmhkKyOm7ZfIxwoiuKs5Qp3mIt+BrK1ZlOBTxAGGgIhj
 UaXw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778160360; x=1778765160; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jvi0wZDRtms50VaJzC2TWWz961jRC0TW7x1auq6beF0=;
 b=rfeH7vZUpe80WymOXtgug0n8qIAVzML5M+VFV7GS0imHudfr4edN8ZrDUEy9yx8+uj
 KZxEBOcRkdObSrfo8AQtMpW+yHUOeU5ApwvrMKrAxLsK5bKexk9l/fzXvaUPf+UsZsou
 aa00jQriD/3U1a9TdkbA+fnKYb6Y9LWyg198enACMJOV5DGLMDg28KlDIzLylHXMJrnK
 QHkBrd5QQ4fszQP9LdrDDQK5fw7qQJ1VlC5NdoWpBODpA+YCw0uDTRoQsDuJ1X+JjsUV
 u9SaQjRe7O+z+LoWf/pEdgQEkDn1LGasmBy2imWfT8rHvz02J1B1QDTKPQLSTwAnE8vr
 ldGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778160360; x=1778765160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jvi0wZDRtms50VaJzC2TWWz961jRC0TW7x1auq6beF0=;
 b=AfFijqU/YYmW+yXFjVfJyicsCaBYRgLvl7w/TLTzLsOAEYzXw8D0WxueWCXh/g9Ux4
 JKPSSc1WLH/1P03ca7YrO33WeJ4jtFlQj5NIKHRyTAMSDz1LBfWcAvKBj1s/zwNraFqL
 Aqt1YGjEPDxBZtMeRP9mC+NVOJ8gCht5Sg5txlTX+eULKDe3mXSzZZ/xMcylN1yKP97T
 U5ST7joG0haveb1z/5SqE/rgtdp84Dxs6MnxkQ0rZzn3ZE/NAc01OUIUz5MhJcabMZ2S
 H8KizIH/coJ1ExYTHP2uuwEk5y+aeeHNkb/+AnHkDo2Jc3UHcoqBo7Pa815eLHX72PMS
 F+qg==
X-Gm-Message-State: AOJu0Yzj9p5GcTVBg0VcusvuZ8mR30qvBwo1H5b1fqsbPtxhr/g+XOuz
 46doiyC70eaQasabGXj3dnnRtg+thW61j7tmbT4bz4ffxoyiHl5TWX5fhT8dhb6dVy2w4HGL2wK
 E8Rh/90PqjQ28Mt4jSTbt3Lb6/TeRDVeYBG2t5OuZ6iAP+bbPwBZgtMg=
X-Gm-Gg: Acq92OHdIXlktsr5BhKqpdLDGd771YAgVwvZnUIX+eSM0gqqPx2+iwaDHzSDfye8ABk
 E0F1oTKW2Mr8RZW/pxyKg9VNd9QYnikmek70pzIiuvozgwsExVXCplMbWx3lFMNUA+CQrjpqxKP
 +FfI5AO4xyUEiC9o1yrI4p2tYPVTpl4i6YS0B65/Jnhew8tVXK2CAFHhldsiA+07czW6YQTnLq5
 No6+C3B5U2lnq04fVxBdIK8enBHO4k9AUJOb7SgSYoDktWTNp5lmpeaZB/DI3INEQOJ0M5+Ri33
 FVNxNFR7RJUJ6+P7UexABIGHuF4UGFU9Kfi902iw0ZbIg1Jr97d/Hho7jD3dRoIURYJIdyfAgis
 V7g==
X-Received: by 2002:a05:690e:429a:10b0:65c:2101:e535 with SMTP id
 956f58d0204a3-65c7988d460mr6707450d50.3.1778160359993; Thu, 07 May 2026
 06:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260327111700.795099-1-peter.maydell@linaro.org>
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 May 2026 14:25:46 +0100
X-Gm-Features: AVHnY4L9wyJC6X6RZCqN49q7XrdXQggxtVgyg0h1TUildE1Jce-hLYt_m6IqC-c
Message-ID: <CAFEAcA9zCPyJpvTtuN528V9UGVbQifVW9Usq2V402ofmre22SA@mail.gmail.com>
Subject: Re: [PATCH v2 00/65] arm: Implement an emulation of GICv5 interrupt
 controller
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 27 Mar 2026 at 11:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset implements initial support of emulation of Arm's new
> interrupt controller architecture, GICv5.
>
> I've incorporated the review feedback from v1, so I figured I
> might as well send this out, though obviously there's no huge
> rush to review given we're in freeze.

I'm taking this into target-arm.next. In the process of
testing the pullreq I discovered that it doesn't build
in a --disable-tcg config. I made the following changes to
fix that, which I'll squash into the appropriate patches.
(My choices here are aimed at keeping the amount of fixing
up smaller; some of them will end up cleaned up when we add
the GICv5 KVM support, eg the "if TCG" clause in the virt
"select ARM_GICV5" will go away again.)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 36de9aee3e..5b198402d5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -10,7 +10,7 @@ config ARM_VIRT
     imply NVDIMM
     imply IOMMUFD
     select ARM_GIC
-    select ARM_GICV5
+    select ARM_GICV5 if TCG
     select ACPI
     select ARM_SMMUV3
     select GPIO_KEY
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index a3241fc1eb..636d00b7e8 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -37,6 +37,7 @@ config ARM_GIC_KVM

 config ARM_GICV5
     bool
+    depends on TCG
     select MSI_NONBROKEN

 config XICS
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 0b5303f370..b3bd3eee7b 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -215,13 +215,3 @@ static void gicv5_common_class_init(ObjectClass
*oc, const void *data)
     dc->realize = gicv5_common_realize;
     device_class_set_props(dc, arm_gicv5_common_properties);
 }
-
-const char *gicv5_class_name(void)
-{
-    /* When we implement KVM GICv5 we might return "kvm-arm-gicv5" here. */
-    if (kvm_enabled()) {
-        error_report("Userspace GICv5 is not supported with KVM");
-        exit(1);
-    }
-    return "arm-gicv5";
-}
diff --git a/include/hw/intc/arm_gicv5_common.h
b/include/hw/intc/arm_gicv5_common.h
index 74fa68d8c0..32f6cc9b8b 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -13,6 +13,8 @@
 #include "hw/core/sysbus.h"
 #include "hw/intc/arm_gicv5_types.h"
 #include "target/arm/cpu-qom.h"
+#include "include/system/kvm.h"
+#include "include/qemu/error-report.h"

 /*
  * QEMU interface:
@@ -192,7 +194,15 @@ static inline bool
gicv5_domain_implemented(GICv5Common *cs, GICv5Domain domain)
  *
  * Returns: class name to use
  */
-const char *gicv5_class_name(void);
+static inline const char *gicv5_class_name(void)
+{
+    /* When we implement KVM GICv5 we might return "kvm-arm-gicv5" here. */
+    if (kvm_enabled()) {
+        error_report("Userspace GICv5 is not supported with KVM");
+        exit(1);
+    }
+    return "arm-gicv5";
+}

 /**
  * gicv5_raw_spi_state
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f2646ae4ed..330e9be473 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,9 +39,9 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/core/loader.h"
 #include "hw/core/boards.h"
+#include "hw/intc/arm_gicv5_stream.h"
 #ifdef CONFIG_TCG
 #include "hw/intc/armv7m_nvic.h"
-#include "hw/intc/arm_gicv5_stream.h"
 #endif /* CONFIG_TCG */
 #endif /* !CONFIG_USER_ONLY */
 #include "system/tcg.h"
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
index aeeede8066..8d97449cfc 100644
--- a/target/arm/tcg-stubs.c
+++ b/target/arm/tcg-stubs.c
@@ -43,3 +43,7 @@ void vfp_clear_float_status_exc_flags(CPUARMState *env)
 void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
 {
 }
+
+void gicv5_update_ppi_state(CPUARMState *env, int ppi, bool level)
+{
+}

thanks
-- PMM

