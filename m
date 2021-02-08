Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp851419lfc;
        Sun, 7 Feb 2021 20:20:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4kn5XT371y7CjM7px6c9sM8vLSmCkvvyqgDnqIR1iphiggskcqsVZiDiybklEVrAaCGHo
X-Received: by 2002:a25:af0b:: with SMTP id a11mr16331064ybh.228.1612758033393;
        Sun, 07 Feb 2021 20:20:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612758033; cv=none;
        d=google.com; s=arc-20160816;
        b=dNjZWnSB8WZb9EJX5yl4/W/nxulGK70tg5mZ1b0NKPibazt1evSNVgn1hQxgqdhx32
         iaUyJbgGjRNIIXE78EmIwJ09XaxpK+y7+Xqi8bod40SQGCenxZRuwrRSOpJIRwLAkcH/
         GzG/2eYj+RbEQNVlASV+45gFHuu+5K0C6ihSSnh2wSFKtJOl7CNb3EL++deQi5Hc3pU+
         2hP+sa8Acpa2bywUC2p0NvHKV7ondFDDH5gV1j67RKxPo3yyvW3IFkmknLauJf5l/AIg
         aYzZeCtDEvjHvsrwy4rWE+syulO5lUrMW4sdjMBuwhMIowoiAzJlO/7NRIvX/icQK7S0
         nqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Wfrxe2AEinW34K0GuFsTKfhMgJ70NeWcmQ/m1I/W4tU=;
        b=PJoKrm91yzjvEp4YnDszo8FdSMyvBuCgm7RiLff58lA+bhnABOe/GAREPfDHFvNSVQ
         VJHHVm+DI9cR5CbLDn9bHzLXeaPYwf5b+6e1A3+cfULE7D9LYpcRFCCMd45gUMmBI0VH
         wpjL/yO1my4KzNCFCJmcwEOUQGItnLKY0OOFbWm0ld6bRMDu9nsjwT9uZGjubMOrwvjM
         soiDOYY0KG6j3Lr5Xe/NUX3yKnCP3mtsMH+wGM1f8zROQDfbcRqoE442mAB1wka7w9zk
         MoWrEr8lxDSki1PN5//LMTjKFL75jnw21tw7qbOG8RN+sQcOGHVZXaAJ4YPtvz+40QdZ
         RABw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MGOteG1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si19130799ybj.81.2021.02.07.20.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Feb 2021 20:20:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MGOteG1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8y2K-0003yL-Qr
	for alex.bennee@linaro.org; Sun, 07 Feb 2021 23:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6J-0007kg-5g
 for qemu-arm@nongnu.org; Sun, 07 Feb 2021 22:20:35 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:40926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6F-0001k3-5w
 for qemu-arm@nongnu.org; Sun, 07 Feb 2021 22:20:34 -0500
Received: by mail-il1-x12d.google.com with SMTP id e7so11434477ile.7
 for <qemu-arm@nongnu.org>; Sun, 07 Feb 2021 19:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wfrxe2AEinW34K0GuFsTKfhMgJ70NeWcmQ/m1I/W4tU=;
 b=MGOteG1tAXL7clmx6mozj3kJm8zN1mKOSl5adIZe31SqVf5ZePTq0s33hjMzU/e/Ar
 rUcGCuHuHTAhLi6iKxJ95AkX9jQBcn/7Bd4pfuyTq2oxisbMtm0FJJbz4yCshAlFuKja
 br1sGPCmsGZ85cjxUrTpFddoKDdd2pQKVdEwCawU4RZintNzMJhMIaQZQMwEzKxEKMXg
 HXMUu9Sj0qRzitTZ//7L6A6h+5RJmnO/gzDxfPUYcfAAyagDQ0/2vQ/NZTnzbLtogeEW
 MmeKuFtOlpfGZ4nKLVyrFo6QaiKFjv7EiH33KkD8CK4V97M7JkHpo3ojBhJBMRqVM64+
 1kUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wfrxe2AEinW34K0GuFsTKfhMgJ70NeWcmQ/m1I/W4tU=;
 b=COmY2N6wFhuO+UK9J1VUt++GfRbG5jHoBPPhwfu/QtegPzIrPjo9CLT+e5J9JCTfvx
 7IzlWsLj5fuxygQs2V83rajBuG0NZMmiyrcNPBaAJ96rxrQVtQIMKBlj/hgcHt95zJPM
 lfZzeVQMvMG/pP1snkOCw9IawMWcWHbZ+u1m5eHIVVX9W49Tq5JteVoYP+5hBc5FEJVS
 pOo9mb1JD2br5V81tCz8OzKVE2miGZRoh1O6OaUYnaUWyqN95EDivaYDAEt9wMqsQeEU
 X1AfNT76jQT2USsZFBIO+I7Uikk8HnRHj5BMPcZv9UtvHFjOlcAE1KFyiTHTdRn5rSfO
 UyAQ==
X-Gm-Message-State: AOAM533fAZ9C758UUvG/7Xo+msAgGlcdtnB+7YEL1D/74Jo5CPkoNm+6
 7w/ZYyEaAHdLGhkVwYqcTfRg
X-Received: by 2002:a05:6e02:e51:: with SMTP id
 l17mr12795315ilk.199.1612754430274; 
 Sun, 07 Feb 2021 19:20:30 -0800 (PST)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id o8sm8022965ilu.55.2021.02.07.19.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:20:29 -0800 (PST)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [RFC PATCH 5/5] Enable the MTE support for KVM guest
Date: Mon,  8 Feb 2021 03:20:06 +0000
Message-Id: <a42721fa503d6d26995f451a8ca6d59ae7f3b138.1612747873.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612747873.git.haibo.xu@linaro.org>
References: <cover.1612747873.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x12d.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R41lomC/uzyK

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 623d5e9397..c2358cf4c5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -79,6 +79,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "migration/misc.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -821,6 +822,21 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     }
 }
 
+static int virt_precopy_notify(NotifierWithReturn *n, void *data)
+{
+    PrecopyNotifyData *pnd = data;
+
+    switch (pnd->reason) {
+    case PRECOPY_NOTIFY_SETUP:
+        precopy_enable_metadata_migration();
+        break;
+    default:
+        break;
+    }
+
+    return 0;
+}
+
 static void create_gpio_keys(const VirtMachineState *vms,
                              DeviceState *pl061_dev,
                              uint32_t phandle)
@@ -1898,9 +1914,9 @@ static void machvirt_init(MachineState *machine)
     }
 
     if (vms->mte && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "MTE to the guest CPU");
-        exit(1);
+        /* connect migration precopy request */
+        vms->precopy_notifier.notify = virt_precopy_notify;
+        precopy_add_notifier(&vms->precopy_notifier);
     }
 
     create_fdt(vms);
-- 
2.17.1

