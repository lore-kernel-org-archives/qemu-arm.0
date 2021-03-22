Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3439266lfg;
        Mon, 22 Mar 2021 03:10:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvNA21Wx9RhwFNGlQFj10+BheoFo0CJUeopVt7K4nwk6KlQ7wzimU257R+s8qrL9FMDEHX
X-Received: by 2002:a05:6e02:1a8d:: with SMTP id k13mr10886823ilv.21.1616407850361;
        Mon, 22 Mar 2021 03:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616407850; cv=none;
        d=google.com; s=arc-20160816;
        b=htQSC35timEzzwOC1ogwhnxuk1tMPVYUo/42Xirg2ZGdf/3LvdfE+1Rpfc743q9uWQ
         q1lZoy1fmld0Fk6EfMUijixFU0T/0Up3UrwmaCAO1C8FIIIC55xUs5sJ4QNeW1tVx2t8
         5oZsBKK3dwkJy0gLHKiZlMDWu4sU0b6uQAoy1QToksDRQXW27hJa/rmYQKuRZUg7/0pG
         aDgCKPt2wkCsZSLNqBSOBJB4RkzyZLPEPGN1Feh5ZVGeM7llOdPol4lN2HTLEFXuCeYf
         9addHcJrHBEnvAfOnO1UqYFrRV/ZfJkc5uzXR/lZQpmlcqqdxE3IaE5tf0qI+x0dvvRB
         6txg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0LuoR9HyBU4NBA/WzdyWv4ccTUx2ilAAc4PHL/24GyE=;
        b=hcHF41S8oEGminAzZvcYgksQxquMMvOJ3tOtcNX9SkhCoM7qHFswF5XxNfljZhBmwP
         EP6G2um/ehXTh7bC1hZ7YMu0XuTuBngPkrf+eu7YBfCgUSVxTXTN3gKI6zRCWucE1M1b
         /dh3XzXb9k/GSUZY5ICfO5ZCZe/eeQBLOOsZEN3W/1rfyW0HSgFlsRxYJ5T6+egqD+Pl
         IAZt2VoCJgz47j7KI2eaOJHY2SPwlXIpXpzXMMnpx88pMDG/Jf6Z2MdeYDZZo+Zz5h6a
         CeqIH+jXpJVaySS68ISL0Xkic7Rkl23nEx8rSKtjEtCKxn2Y1rLuUTX4dcFvK8Iwlaab
         vxXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G8WHIoFC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si8492359iog.50.2021.03.22.03.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 03:10:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G8WHIoFC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOHWL-0000Uw-GR
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 06:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOHTO-0007Bn-D7
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:07:46 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOHTL-0002Ru-On
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:07:46 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 32so2156368pgm.1
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0LuoR9HyBU4NBA/WzdyWv4ccTUx2ilAAc4PHL/24GyE=;
 b=G8WHIoFCBnroQz+ENJ2xXSN7RJmMFm0kSWm+EjWA9IoHFBcy08j0FaqJ+vo6sX8JJc
 QbImSNn8ddRT0e4XjkryZSobI6QZSS8pTcLHBSij1EpZEC5tNPjubMDnWgIoLT8hLW1q
 71onww1bFxgOkFDsuOPb/3MKKgvKqYISfVYso67DAfL43H9kQt+s3rdNLenmFYWTzb90
 wM7q7ygbjK9euGWNIviFKv6YC/yuJ8iE5J+qfXC7itkJX8J/zJaEal3w78GcHZMYj0FF
 d13TWhR3PUtTWTpNXisYHIL4In2Kg/ah46lgRNjuhYronjtj2OZjXqgWf48eoUj3TxQu
 UiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0LuoR9HyBU4NBA/WzdyWv4ccTUx2ilAAc4PHL/24GyE=;
 b=qKdq1Omyd0bh3iFtLKCF8HUPxwoKDge6I7qhDvC3gGNCInQyPLyCOClR4+2oNeKAYu
 VQbyPgazKpdLiIeIOSjdyWTw6LmeOZT5fmcAQUSM0CNMuI8/gRdHs8m97Scr0iQrc18A
 z4MI3dHX2iXhwdedyfZzijwirDrMAeGRU8fcBdbFXa8qnjQazjMq83qsSASQGAPgWFJL
 +zP9F9zuDtzIsXgVvMqYTZijfBeQRAxkZZ1obflx+WFRkk4WEQ5b/DLIItu3LyhXcG7c
 KpDx+CptO3LT7v0PLqtOvK7kzGQ7bNapNRZ0YIY5St4BEYlTicMeXDTid/B0Ybp24HJR
 9FDQ==
X-Gm-Message-State: AOAM5337iSjgNDS5saMK5+JsZrEzhhHCUQdpaqp/BSHLClmTzdhhJFAx
 p/GT6yE+xo6IZwB3tvszwm/8ya7osQH7LrY=
X-Received: by 2002:a62:5c84:0:b029:1f2:a5f0:d12a with SMTP id
 q126-20020a625c840000b02901f2a5f0d12amr20474940pfb.36.1616407662346; 
 Mon, 22 Mar 2021 03:07:42 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id c193sm13697145pfc.180.2021.03.22.03.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 03:07:42 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 2/3] Enable support for setting KVM vGIC maintenance IRQ
Date: Mon, 22 Mar 2021 10:07:25 +0000
Message-Id: <621f2848d4115c6307fe56b6a6cff254c273b621.1616052890.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616052889.git.haibo.xu@linaro.org>
References: <cover.1616052889.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=haibo.xu@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 Haibo Xu <haibo.xu@linaro.org>, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2hLZuL8BzrR7

Uses the new VGIC KVM device attribute to set the maintenance IRQ.
This is fixed to use IRQ 25(PPI 9), as a platform decision matching
the arm64 SBSA recommendation.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 16 ++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 3 files changed, 18 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..3ac10c8e61 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -495,6 +495,7 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
+    DEFINE_PROP_BOOL("has-virtualization-extensions", GICv3State, virt_extn, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
                       redist_region_count, qdev_prop_uint32, uint32_t),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 65a4c880a3..1e1ca66e2c 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -826,6 +826,22 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
                       KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &error_abort);
 
+    if (s->virt_extn) {
+        bool maint_irq_allowed;
+        uint32_t maint_irq = 25;
+
+        maint_irq_allowed =
+            kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ, 0);
+        if (!maint_irq_allowed) {
+            error_setg(errp, "VGICv3 setting maintenance IRQ are not "
+                             "supported by this host kernel");
+            return;
+        }
+
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ,
+                          0, &maint_irq, true, &error_abort);
+    }
+
     kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd, 0);
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 91491a2f66..921ddc2c5f 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -220,6 +220,7 @@ struct GICv3State {
     uint32_t num_irq;
     uint32_t revision;
     bool security_extn;
+    bool virt_extn;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
 
-- 
2.17.1

