Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6549900lfk;
        Mon, 15 Nov 2021 14:37:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyr52qHmGAhE7t7ELAwWPrhOWWK+tcXvYKlfHB8XZ2AViknsZAaMdj7loX2NYQx4LxUobtY
X-Received: by 2002:a05:6102:3ec3:: with SMTP id n3mr49299947vsv.48.1637015843735;
        Mon, 15 Nov 2021 14:37:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637015843; cv=none;
        d=google.com; s=arc-20160816;
        b=dQLyf//E2Ar2aUgvIcrKg2mnl36ppyWt08AaXSo3cl6n6CroyyD0hIZ0lBHZGIJ10K
         qiIbBmuPjDH01IW0xsQzv+9PRD3In4lTOoFjPHOKOuD/SOQWtETtQo55Mdd5bbfZH+hR
         W8XdzppcKmEtC7edWwE4u49YouHOwHAuthh91e/F2hqe8ajAQzm6gcPz0PF9e+IPvrOi
         FhApbJf8REm70rm/1al3PZ48PeXHCXWwO21jsIfAYlXNNWTsUlti4lFDgkcX7k07mVwT
         DW/LFuH0VzZs30GuSJtdzFRnczNLd8ExL1uCqM2ulXRspWiY6Rx/2KBgAyC3tvesCUGK
         Y25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=A6cf7aB4+QDSTk3uAaJrNRUpmepplRJF45y+7KCnkr4=;
        b=nIcs4UoiKBvQQ165aVj0TY0u1aFUBIjq5m/E8lx8lPmkb9ajaj1mytmLpetek3nD7+
         qDl2Ter+bKbvYzdkQ0BjiN47+Fep5z7tBLEjLS/F+D2P8aimbysDn+rRSN+8N9wZfrkV
         sj090/Iqlm+H6TTx2qSpQslBBEELc/0QV9i7vI2ovrKa/J47m10GMvvbI7bonl5u2ykn
         AiWyx4cJ9MvJBUvTvrH/l8kcbq+VaTxcnts8c3XPdWntFiEHOFkUxlG/8DBALXxnSdK6
         19mLBUHw7YBSA5XpCZMYKD/KVxIw+fkTQmk5oHylZQ4PqNvzylfzdojm9WVsXnaIBEMp
         dhAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Jo42cPZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si19846372ual.218.2021.11.15.14.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 14:37:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Jo42cPZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmkbL-0002S8-3m
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 17:37:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkab-0002OG-Sf
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 17:36:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkaW-0002lO-Ix
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 17:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637015791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6cf7aB4+QDSTk3uAaJrNRUpmepplRJF45y+7KCnkr4=;
 b=Jo42cPZuPACnFFhtMYWVuxJWfyjSUTpbofwO2lRgIgEuLXOb3aJ2EfNo+pSwza/vrze4Rs
 3W/eff6bxwbAOsfYMDjwZiBn9/b5nmcVUgcbfmqsug6z0cSuWwMpt38MKM4clwli9OmDQQ
 EVIGJP8HQsCH3BC6Wl/xOyfQhFdZCXI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-OL-3Wg5FNBKLfrnQssY_rw-1; Mon, 15 Nov 2021 17:36:30 -0500
X-MC-Unique: OL-3Wg5FNBKLfrnQssY_rw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso575117wms.0
 for <qemu-arm@nongnu.org>; Mon, 15 Nov 2021 14:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6cf7aB4+QDSTk3uAaJrNRUpmepplRJF45y+7KCnkr4=;
 b=0Zd4yGNblZOx7tGMMfZREKDxFX/zRYUe1SiGnJedzwCqoNUEdKjqaQNu8wx+47DYCY
 kHdu/9dnDh1H8Nf4q9NBhljB1rS2U66jvUbN0Vu/AI9KP6OayhdXZMxXY+YHvcyMpUYQ
 rDD/dnhV1j0AKXFa9i/D/e+qTzCSrkyMqWHWQEAm27UmrZnzArZAeZ8lW8bpycd+bKrt
 tlYeTncbY8kVCPWEW3DNs5K5UxYzrPA1P0sCE09j/+AM5HlOOBEq4DhDqkBuOBbHrdGQ
 qOa/PYPpnSW/mPwnZlkB90PWWoXVfL9/ja2+fS8gpXDR8fZuBSMnIi3/zQaA30yeA+1e
 YTgg==
X-Gm-Message-State: AOAM531FcAG3t48S3cJ4gAlpQX0dVJR0rxpVw4e7RxUQcbNIhE/88Dvy
 Ru+b0pc2Bf3Y3AFJj6KjjU1ElyTm+kJJW9n+K8V/nCf2oAONPS9L8gabjXZEQVQQDV7RIkseaEM
 Oc5A6yMCluMIs
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr3347007wrx.236.1637015789623; 
 Mon, 15 Nov 2021 14:36:29 -0800 (PST)
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr3346989wrx.236.1637015789471; 
 Mon, 15 Nov 2021 14:36:29 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 i17sm627846wmq.48.2021.11.15.14.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 14:36:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? 2/2] hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG
 Kconfig selector
Date: Mon, 15 Nov 2021 23:36:19 +0100
Message-Id: <20211115223619.2599282-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115223619.2599282-1-philmd@redhat.com>
References: <20211115223619.2599282-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sJVzJice2jM8

The TYPE_ARM_GICV3 device is an emulated one.  When using
KVM, it is recommended to use the TYPE_KVM_ARM_GICV3 device
(which uses in-kernel support).

When using --with-devices-FOO, it is possible to build a
binary with a specific set of devices. When this binary is
restricted to KVM accelerator, the TYPE_ARM_GICV3 device is
irrelevant, and it is desirable to remove it from the binary.

Therefore introduce the CONFIG_ARM_GIC_TCG Kconfig selector
which select the files required to have the TYPE_ARM_GICV3
device, but also allowing to de-select this device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/arm_gicv3.c |  2 +-
 hw/intc/Kconfig     |  5 +++++
 hw/intc/meson.build | 10 ++++++----
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index c6282984b1e..76950c6f724 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -1,5 +1,5 @@
 /*
- * ARM Generic Interrupt Controller v3
+ * ARM Generic Interrupt Controller v3 (emulation)
  *
  * Copyright (c) 2015 Huawei.
  * Copyright (c) 2016 Linaro Limited
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 78aed93c454..010ded7eae0 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -25,6 +25,11 @@ config APIC
     select MSI_NONBROKEN
     select I8259
 
+config ARM_GIC_TCG
+    bool
+    default y
+    depends on ARM_GIC && TCG
+
 config ARM_GIC_KVM
     bool
     default y
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 11352806db2..70080bc161c 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -3,12 +3,14 @@
   'arm_gic.c',
   'arm_gic_common.c',
   'arm_gicv2m.c',
-  'arm_gicv3.c',
   'arm_gicv3_common.c',
-  'arm_gicv3_dist.c',
   'arm_gicv3_its_common.c',
-  'arm_gicv3_redist.c',
+))
+softmmu_ss.add(when: 'CONFIG_ARM_GIC_TCG', if_true: files(
+  'arm_gicv3.c',
+  'arm_gicv3_dist.c',
   'arm_gicv3_its.c',
+  'arm_gicv3_redist.c',
 ))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
 softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
@@ -26,7 +28,7 @@
 specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
-specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif.c'))
+specific_ss.add(when: 'CONFIG_ARM_GIC_TCG', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
-- 
2.31.1

