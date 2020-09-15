Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3112665lfq;
        Tue, 15 Sep 2020 05:13:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDxOtw8NC8D66Lb45FKKCEWJpgnhJIziPKz8AAdLOaPi183xZicXrkSV+Pgy8xsAbKbi3k
X-Received: by 2002:a25:2155:: with SMTP id h82mr106355ybh.169.1600171993199;
        Tue, 15 Sep 2020 05:13:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600171993; cv=none;
        d=google.com; s=arc-20160816;
        b=SSW22YpCtxhP5WtIeYa0EZwFopjkKijKrGGm7iNILoC2N5sfd9mZ8Llk11bWuaKiPo
         xBQ5gtNI4lyO/t9zvU1LZFsxndfJrZk7tIolkpILeffEhpRvxfJ4q/hOryFK2vaf2Y21
         og/ZnoI/1DOYewmvvhi9gTbcE3i3ZUBUaNlXHGmaFjH0TWbS5g5EppEJKtfBl3yBR9Oa
         0sPTxA+1Jed7PSTGw2leDH3tAnQI6gbyRgRb5jqJAGA71frUNYxjHI9DyXvr1f68AUrH
         hkKKTAhyYOilAScSO7Up919V7K8XPY1GZZnSxFO6KR+WtyC2ptioTijEcaT2TGcZnsaU
         7I7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=f7gcGwGKvQs66zPNjI3Utr4hWVSraR8+eNzLSiL1B7A=;
        b=XjW40ntQrCOAL+Z+NWzAUrXXcVvoPSdTLs/CqhUaunX4dKejMn3ziLh/5I1YCdMDJw
         +rKhJaq6IWWk9UsihyZvGH8t71VyUQji/lh5DViZJKNeAMiIQHEAQeR9pnMPYKtmflen
         mAU97Hhj0LcOSzNmK7N2K2D5jKlwhsUGk3R0jbpgdNWdwVn8prD7pbR3DmgKuvZrAgqf
         GYvn6CgGXxqOs78PPlIn5Zl8oU5JHwFqxDC7U2zYc0zLrFTJeBR9zeOGE16wsFzbDesX
         JmUKyoz1P7VM5gXn9acLgvX/NaaCaZ6Xh3LXX4SAq2aIUgocCTP4kY+pFshCfZjcfB8T
         Jdvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ElLj/4CY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si14669764ybp.202.2020.09.15.05.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 05:13:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ElLj/4CY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI9pg-0007nv-Ez
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 08:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nE-0004nz-Vx
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:10:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23834
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nB-0007gh-5H
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7gcGwGKvQs66zPNjI3Utr4hWVSraR8+eNzLSiL1B7A=;
 b=ElLj/4CYAPTKyPtwEKzUXBAkV0HYWSnKM+bNTS/CPZQ3d5aTqKaq9NLTst4BqdfRelwEGS
 DwEAwN+osWbs4B6WcVM3XkgmAObSXlD0sSgN3C7zTxla7emUzgZXVdYQjtSKhVumDUTxcU
 ph/1LoOlql8IpDaw/xkClcVRErpimeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-1lSCAGw_M7CRskbdED_EdQ-1; Tue, 15 Sep 2020 08:09:24 -0400
X-MC-Unique: 1lSCAGw_M7CRskbdED_EdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7974918BA284;
 Tue, 15 Sep 2020 12:09:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 231B75DE47;
 Tue, 15 Sep 2020 12:09:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E8E504083F; Tue, 15 Sep 2020 14:09:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/21] microvm/acpi: use GSI 16-23 for virtio
Date: Tue, 15 Sep 2020 14:08:58 +0200
Message-Id: <20200915120909.20838-11-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 05:35:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oE5QU+f0qKDk

With ACPI enabled and IO-APIC being properly declared in the ACPI tables
we can use interrupt lines 16-23 for virtio and avoid shared interrupts.

With acpi disabled we continue to use lines 5-12.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/microvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index e1b86da8a92e..ca0c9983f137 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -125,7 +125,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
 
     kvmclock_create();
 
-    mms->virtio_irq_base = 5;
+    mms->virtio_irq_base = x86_machine_is_acpi_enabled(x86ms) ? 16 : 5;
     for (i = 0; i < VIRTIO_NUM_TRANSPORTS; i++) {
         sysbus_create_simple("virtio-mmio",
                              VIRTIO_MMIO_BASE + i * 512,
-- 
2.27.0

