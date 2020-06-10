Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp171810lfc;
        Tue, 9 Jun 2020 21:50:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+3f4b7qqCu8QE0QRFzNTn/i76xdCX23IHAP0efa+Va8/Jf6Rx+I80oHmhpy+5p3Dlt7gW
X-Received: by 2002:a25:2f4b:: with SMTP id v72mr2586827ybv.232.1591764645442;
        Tue, 09 Jun 2020 21:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591764645; cv=none;
        d=google.com; s=arc-20160816;
        b=npUGGVrLvcYH+usefQPkz1J+bEaCM8QmZ+sd7YgdKkMbaSpGPH+vCkxaZR82vyYGEY
         spPQKpKOP8u6G3BnSafm3ElmvmoIh3Q0rrOR9czuIwlT1U2zn1sDDq0RKZuVXorU8NWK
         kOukdAb3qJoDZ0oiBWV73xKoBUYJuSy8mnqqp5zu0UT7ibEB21zb+GOn+Zc43PDu4BTD
         P2K7DuYDveU6AFQ9dy5W50Dcd8cYdpMjNCPdNfaxSqCp4MHM9GvBtatdNoyl2etREfXW
         yUXNI//7Elny5aAOmu8WiFV5v7t8fR1bNlaXz74g7+5BBzvchPthtbBrT9uSjmhJ7s+A
         1PIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=XYJWosKtNa0YrCdfi+nbmPQlsHhZsqpfDeFMOxFj1JA=;
        b=aRlGTt/D6AmALsewiuGyg0dQpdaF81X4VXdk6z0tRiR81g/9Jc2iPBP2mUxT20wYmO
         txZeH5sEGXf9g9AMlYF5FUv3tcD86JmWTSvCpLU23LMyoCVvb5kGp8sv8BxZqKCrB3LQ
         /zfYEgVB9Cvykl6B42eqKt6ioCtq/lGXFUMYphjvgeNvmwqFbI7ueLFTUb0uVPmFZstM
         b0/gG0xlBgo6Np72PaM0ulubjtuaFIZYL8BGi4WwBEk1NnnIyfS8Cn9HGOCFTj+WCXAw
         BBFxLNFdD8SgX/RIftrn9AftpB+rEpQWeX8tJCe/QnHpXlh/fTnfOWFS7YDeHRhrXQ3H
         GGPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LHKwVLGj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si4147006ybo.264.2020.06.09.21.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 21:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LHKwVLGj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jishI-0007JE-LN
	for alex.bennee@linaro.org; Wed, 10 Jun 2020 00:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jisLC-0000bI-FP
 for qemu-arm@nongnu.org; Wed, 10 Jun 2020 00:27:54 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39568
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jisLA-0008K6-Dm
 for qemu-arm@nongnu.org; Wed, 10 Jun 2020 00:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591763271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYJWosKtNa0YrCdfi+nbmPQlsHhZsqpfDeFMOxFj1JA=;
 b=LHKwVLGjYKFCrkQAcYsyFDTsfZMOKLV/98p0gX6Ccw1+atnqZy+uFm6Kz13hhkaoMdXI6w
 t/xBq0buP3b4571HrLOpU5wFdjAv2PS0vBGtvGxr5a8+2MapA6c4N8Ir11vAcVsyjXFCEO
 FlVuv7Lg/Yj87lmabTHG6fgV6zDpW/E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-PNg7nommN4-n6V5PEfbJdw-1; Wed, 10 Jun 2020 00:27:49 -0400
X-MC-Unique: PNg7nommN4-n6V5PEfbJdw-1
Received: by mail-wr1-f71.google.com with SMTP id s7so502923wrm.16
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 21:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XYJWosKtNa0YrCdfi+nbmPQlsHhZsqpfDeFMOxFj1JA=;
 b=QX5Y3QYvqscnf3kYLAcC49dktE4wFoBpWx5B/CsV9724QhGIseCdJ9jQYj6AIGdcz7
 fnvCRgPStgIj+0AD40QpAQ95ZVvgo5a8ACAZRba6poTTJlHW43l6C6AxSuOBgs2a0r8E
 UyPM6B2Dorjcal6DK4pNi2SUVuegqv7VKZAeMmqsPHJkncKIw4NKRKxdlYfcdSSulTyh
 vrcl0quxhO23vLmaQ0NhqHa0cd+wivJPASjnA5XGxGZ2RHum9fW0hEpl4a3mARaRhVAD
 nMnmXhUGah8SZIMsqgxLL1+vI0h5D5Sh2xrlcIadN4g6AYCjnlmpgVwHPc4Qz8tjFwgc
 QuGA==
X-Gm-Message-State: AOAM531/lPAaVuphOpBUwOKZ3aI+3vY7xBrWe5AhpGlheLlecY6ax8SK
 Y/tn/6Za7s/LdRvoONZhCm257gvfyt+7faEEiBbkiyW288viQtAxj/h2SzyEfUzkXFyMJS3zhmp
 hc2yjmgAgoRQ5
X-Received: by 2002:a1c:5502:: with SMTP id j2mr1151791wmb.15.1591763268425;
 Tue, 09 Jun 2020 21:27:48 -0700 (PDT)
X-Received: by 2002:a1c:5502:: with SMTP id j2mr1151780wmb.15.1591763268232;
 Tue, 09 Jun 2020 21:27:48 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id h7sm5196859wml.24.2020.06.09.21.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 21:27:47 -0700 (PDT)
Date: Wed, 10 Jun 2020 00:27:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/56] hw/pci-host: Use the IEC binary prefix definitions
Message-ID: <20200610042613.1459309-34-mst@redhat.com>
References: <20200610042613.1459309-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200610042613.1459309-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4awgYv0MB8w6

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200601142930.29408-6-f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/pci-host/i440fx.c    | 3 ++-
 hw/pci-host/q35.c       | 2 +-
 hw/pci-host/versatile.c | 5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 0adbd77553..aefb416c8f 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/range.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
@@ -301,7 +302,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     memory_region_set_enabled(&f->smram_region, true);
 
     /* smram, as seen by SMM CPUs */
-    memory_region_init(&f->smram, OBJECT(d), "smram", 1ull << 32);
+    memory_region_init(&f->smram, OBJECT(d), "smram", 4 * GiB);
     memory_region_set_enabled(&f->smram, true);
     memory_region_init_alias(&f->low_smram, OBJECT(d), "smram-low",
                              f->ram_memory, 0xa0000, 0x20000);
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 352aeecfa7..b788f17b2c 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -589,7 +589,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
     memory_region_set_enabled(&mch->open_high_smram, false);
 
     /* smram, as seen by SMM CPUs */
-    memory_region_init(&mch->smram, OBJECT(mch), "smram", 1ull << 32);
+    memory_region_init(&mch->smram, OBJECT(mch), "smram", 4 * GiB);
     memory_region_set_enabled(&mch->smram, true);
     memory_region_init_alias(&mch->low_smram, OBJECT(mch), "smram-low",
                              mch->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index cfb9a78ea6..8ddfb8772a 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
@@ -399,8 +400,8 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
     pci_map_irq_fn mapfn;
     int i;
 
-    memory_region_init(&s->pci_io_space, OBJECT(s), "pci_io", 1ULL << 32);
-    memory_region_init(&s->pci_mem_space, OBJECT(s), "pci_mem", 1ULL << 32);
+    memory_region_init(&s->pci_io_space, OBJECT(s), "pci_io", 4 * GiB);
+    memory_region_init(&s->pci_mem_space, OBJECT(s), "pci_mem", 4 * GiB);
 
     pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), dev, "pci",
                              &s->pci_mem_space, &s->pci_io_space,
-- 
MST

