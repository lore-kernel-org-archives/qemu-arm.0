Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp523250ejx;
        Wed, 16 Nov 2022 07:27:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6hQhJMg/sWzmxdI92z4TQK50XxO42eS9q08iVTo6UAGsoVcg1FTNJKIgeHybyvzJUXVP9s
X-Received: by 2002:a05:6214:5b89:b0:4bb:6b72:3c36 with SMTP id lq9-20020a0562145b8900b004bb6b723c36mr21138039qvb.121.1668612474765;
        Wed, 16 Nov 2022 07:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668612474; cv=none;
        d=google.com; s=arc-20160816;
        b=ZISr0od7+C/dxe5xu8fehZ9FT5smK1e9qg+HXfdCwGkMwGaA4DIPjst9yU/JUrnuqg
         /1xa43iEmvz0C3qu/+N870DI4W4aQ4XrpVeC7cFhGciXlO4n4fsg3dm8Ce5rLflhJKvw
         HX4OfFOG9ZHCxnveupvZvd+1U9fXqPN3GDPfqKyYIzKn2zyVZEuqqMHSPq0acTptnW6J
         ug/Ouw9oWXdvshXvg1I7shp/N4UXjFsMDetirVqipevDXtBdDMatL+u+4aV6P/vOKiK9
         +vxP6F0NSWY1A8QLKxLgmXr1N0/Tt28reFf88vObkV+K71JI1yEp+wRViIvM+7RFn1Sk
         FKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=eHcjr1G5UsgFNqeXRp0WTxS47bfofFg325Nhqy6ODP4=;
        b=nBSfHb+SDjvjA5falUeuzCsHKYGfOwyo0+fnx9SIZGQLE4SqCpyP6Ssxc4uAc2LGb+
         kecJqgNH8mn3QA5l0LzYjZjuxKbCmkD1FIF1VanQ56Mjo+tijadrw+ClAmw1skcMRXxz
         v4NzVBXDsRu+Y0Kujq8m7f2THeMFdJBjl9GFk0/T7sP3wuPcLm3/aHFYidclo222sa4F
         iCf6Bz/PvU07kNpp/l7nZ2ppquVBj15zDkb7USpRgCxoPYnv6SUM19Kr2V02BKan/laE
         8rtXXnwz11l3wgPJJc0YLIpJZBozs2VdFPzllJN3+a8AG8yxXGeA39KeYrjamCozg1MA
         rFAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AI3rA66C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020a05620a057000b006fb6a50fb20si5223259qkp.167.2022.11.16.07.27.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Nov 2022 07:27:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AI3rA66C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ovKKH-0003r6-Ac; Wed, 16 Nov 2022 10:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ovKKF-0003oP-If
 for qemu-arm@nongnu.org; Wed, 16 Nov 2022 10:27:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ovKKE-0004DE-7x
 for qemu-arm@nongnu.org; Wed, 16 Nov 2022 10:27:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668612461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eHcjr1G5UsgFNqeXRp0WTxS47bfofFg325Nhqy6ODP4=;
 b=AI3rA66CWqufJxLk+e/o4mGtKJWXVafYN0E/1cU0NYUhingHh59MSXysQzp8UI5JUIHfu8
 FuJitzJygubHW2truvfQp4Ag85cq92T2UEVQiMkL0DNMFAghePZ+WszW5WnsDUPFaXl4YP
 MFsHkxp6ImAbaMqHJrU05fIKPCOoWLE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-l75-cGLROqGjhV2Hdj6rKw-1; Wed, 16 Nov 2022 10:27:35 -0500
X-MC-Unique: l75-cGLROqGjhV2Hdj6rKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9125A3810794;
 Wed, 16 Nov 2022 15:27:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C25C112132C;
 Wed, 16 Nov 2022 15:27:32 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
 peter.maydell@linaro.org, andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 0/2] remove redundant field PCIDeviceClass::is_bridge
Date: Wed, 16 Nov 2022 16:27:28 +0100
Message-Id: <20221116152730.3691347-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 3MoeQK574fix


Igor Mammedov (2):
  remove DEC 21154 PCI bridge
  pci: drop redundant PCIDeviceClass::is_bridge field

 hw/pci-bridge/dec.h                |   9 --
 include/hw/pci/pci.h               |  11 +-
 include/hw/pci/pci_bridge.h        |   1 +
 include/hw/pci/pci_ids.h           |   1 -
 hw/acpi/pcihp.c                    |   3 +-
 hw/i386/acpi-build.c               |   5 +-
 hw/pci-bridge/cxl_downstream.c     |   1 -
 hw/pci-bridge/cxl_upstream.c       |   1 -
 hw/pci-bridge/dec.c                | 164 -----------------------------
 hw/pci-bridge/i82801b11.c          |   1 -
 hw/pci-bridge/meson.build          |   2 -
 hw/pci-bridge/pci_bridge_dev.c     |   1 -
 hw/pci-bridge/pcie_pci_bridge.c    |   1 -
 hw/pci-bridge/pcie_root_port.c     |   1 -
 hw/pci-bridge/simba.c              |   1 -
 hw/pci-bridge/xio3130_downstream.c |   1 -
 hw/pci-bridge/xio3130_upstream.c   |   1 -
 hw/pci-host/designware.c           |   1 -
 hw/pci-host/uninorth.c             |   6 --
 hw/pci-host/xilinx-pcie.c          |   1 -
 hw/pci/pci.c                       |  20 ++--
 hw/ppc/spapr_pci.c                 |  15 +--
 22 files changed, 19 insertions(+), 229 deletions(-)
 delete mode 100644 hw/pci-bridge/dec.h
 delete mode 100644 hw/pci-bridge/dec.c

-- 
2.31.1

