Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2316467lff;
        Sat, 14 Dec 2019 07:57:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkNiuRd+iUdV9KwaMS8ieFiX7M3+SqIm7aELhYAydczE2evI494AZTrDuPdInRSYqwgVeQ
X-Received: by 2002:a9d:6e12:: with SMTP id e18mr20026302otr.47.1576339057831;
        Sat, 14 Dec 2019 07:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576339057; cv=none;
        d=google.com; s=arc-20160816;
        b=S87ArEFoTm+spiNBg80qzCB2L3zxUUqqKVMMxMWzv5ij5vtXwj3IrvV6uCvuCVt/tR
         zixjd1vZaHC7rG+w4cFve09yYfDPlwO2aWMR8sSnSri26LBv+MaAX0hAMW4CsrCIkK1I
         /uXau/kF1nx+X5c3QtQ7TnPfysJcohOn+CM8i78Lraslr8mdEIx+R5zM/lfxI6BDLOwk
         62oW4S/DBSo+Cf9JsIVLdRsP20yB1OUee4pt78l5nX0qZXk0m1Blkntah2leTYaW38ZG
         6nanOlrQjY/GcWjn4wfMUrDRQuQIceAD5ijkvpkz1VfmaXbivpyCQYwz7SbszetpLqlS
         VqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=7SlorlqSNo6p31H7HgBYKxDoBhr5Y5T4+whsDnKxCwo=;
        b=MBGuehkle7dbO4yN/NuCPKcVjW3ks8I38yeH1sXXBCf/hTc0J0kDiM47RyzKpshPvo
         C8mypAHHXPElngbAHuCUpy7yNRFCMrnA9VffDgcxMfeQ+odUNiKcW5RQt0tgq38FJIQV
         3Ia9JgeccmAsJEkD+wzWmTDGGf0KHFdWO+B7h2hNBurEktWihLZbYythNHvfdVsPljhB
         276wctEzM3G1i4cjBPPuZnkiKuHVUQcL46VKbbuuyMnOKIFC6K+23bFBu/AEdl1llYqM
         TDoLgQpBUngBBk0offXIUeYhqJkWEna7jXIDrYRsHXEd9khhd7z03qVOqFgsXMdOAUfP
         jN2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WkaGCgLA;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a205si7330504oii.95.2019.12.14.07.57.37;
        Sat, 14 Dec 2019 07:57:37 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WkaGCgLA;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfLNP5g (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sat, 14 Dec 2019 10:57:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29790 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726757AbfLNP5g (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 14 Dec 2019 10:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576339056;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7SlorlqSNo6p31H7HgBYKxDoBhr5Y5T4+whsDnKxCwo=;
        b=WkaGCgLA5aQ/4Dwf7BpSTUQuQD0OqJ/DknzWKRSZ0Sp1QhADzX88nY/0LjJDUpLQjhR5zI
        XB8yCAntSwZxnUwk3Up2xFOHRqxREfHDd7GAoSTtG7YPxWyW+4o2IwMEKS0yhy9sQ1LsAF
        9QUpCc0P6Mdq024wMUxvBOoC4tgc4Hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-uNUZ_QilNLChRElt76KaAQ-1; Sat, 14 Dec 2019 10:57:34 -0500
X-MC-Unique: uNUZ_QilNLChRElt76KaAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61F701852E2A;
        Sat, 14 Dec 2019 15:57:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 0764F5D6A7;
        Sat, 14 Dec 2019 15:57:19 +0000 (UTC)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Andrew Baumann <Andrew.Baumann@microsoft.com>,
        Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
        Alex Williamson <alex.williamson@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        Paul Burton <pburton@wavecomp.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 4/8] hw/i386/intel_iommu: Use memory_region_add_subregion when priority is 0
Date:   Sat, 14 Dec 2019 16:56:10 +0100
Message-Id: <20191214155614.19004-5-philmd@redhat.com>
In-Reply-To: <20191214155614.19004-1-philmd@redhat.com>
References: <20191214155614.19004-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: auZH/Fd88bwC

It is pointless to overlap a memory subregion with priority 0.
Use the simpler memory_region_add_subregion() function.

This patch was produced with the following spatch script:

    @@
    expression region;
    expression offset;
    expression subregion;
    @@
    -memory_region_add_subregion_overlap(region, offset, subregion, 0)
    +memory_region_add_subregion(region, offset, subregion)

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/intel_iommu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 43c94b993b..afa7e07b05 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3363,11 +3363,9 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *=
s, PCIBus *bus, int devfn)
          * switch between DMAR & noDMAR by enable/disable
          * corresponding sub-containers
          */
-        memory_region_add_subregion_overlap(&vtd_dev_as->root, 0,
-                                            MEMORY_REGION(&vtd_dev_as->i=
ommu),
-                                            0);
-        memory_region_add_subregion_overlap(&vtd_dev_as->root, 0,
-                                            &vtd_dev_as->nodmar, 0);
+        memory_region_add_subregion(&vtd_dev_as->root, 0,
+                                    MEMORY_REGION(&vtd_dev_as->iommu));
+        memory_region_add_subregion(&vtd_dev_as->root, 0, &vtd_dev_as->n=
odmar);
=20
         vtd_switch_address_space(vtd_dev_as);
     }
@@ -3764,8 +3762,7 @@ static void vtd_realize(DeviceState *dev, Error **e=
rrp)
     memory_region_init_alias(&s->mr_sys_alias, OBJECT(s),
                              "vtd-sys-alias", get_system_memory(), 0,
                              memory_region_size(get_system_memory()));
-    memory_region_add_subregion_overlap(&s->mr_nodmar, 0,
-                                        &s->mr_sys_alias, 0);
+    memory_region_add_subregion(&s->mr_nodmar, 0, &s->mr_sys_alias);
     memory_region_add_subregion_overlap(&s->mr_nodmar,
                                         VTD_INTERRUPT_ADDR_FIRST,
                                         &s->mr_ir, 1);
--=20
2.21.0
