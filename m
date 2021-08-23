Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1686033lfg;
        Mon, 23 Aug 2021 02:18:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzKyxhUQu1AKRuS6C0Im0JvtiJJGLOuHH+zNc6tMz5inJBu7l/NZK4LBvQx+ruVtgxKK9d
X-Received: by 2002:a05:6602:2c05:: with SMTP id w5mr25550759iov.91.1629710282191;
        Mon, 23 Aug 2021 02:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629710282; cv=none;
        d=google.com; s=arc-20160816;
        b=UP7IMmZtT+BuioHZUNEEgnAw6QmvzyHzn3RVnGr0jnim4SYRjP7N5uN9B3V9/gzKKs
         iPveeoGbMuyUDb6hSMtN3RhaQ6jcS42BIVuQPjbjHkP+o1oPJp/PO5Wi8UF0Pn6w8FxI
         xAWW4qLFIYzjM1+WZdQtwe8WSI1KyxrrbScukS6OybI6rWEwe4Z4yUFkbVB+OOZVV7G+
         nDYSRB2NtwwNijAs+K2jRJgWpdMRUCAj5yo4RBphHNlQlMG6bXqTp01B3S00Uzbaem4b
         vmz82qEZik6R0z9g6iyO48DPhkqMcOntN3g3YtY6YFdUwGUY3hGmzeiOKukOrgaI6RcC
         kTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from
         :dkim-signature:content-transfer-encoding:content-language;
        bh=uu3NbpnJlLmvy8Ob3NaUz/Su/4IFtfj4/DfzxH4JThw=;
        b=A+vvhSjtQ4zeCvC8lsl0/WIhUEiAm0qtIdRpfAHnPi2nlbpmH/F2vOnmyF7Y2HIuvS
         x98TT4JxlYPLrWOsDwLnoFSG/7YoDmAvqysXD0I6jt27NMicetQK/At7MZnUkfo0j7jP
         y+RyKZK3EERp/kVH0WNokRaKNddDaPDysaxaf34xheyz535omA7TYaDRBI5NePOmDC/w
         IMjV+h+IHofEGDvqIDxiMjZ9Jcx8lQetB4Q7SJAk3x5P7MWTowC/jDfZ0fphaTwwdHZm
         hwlIFDPtml/bNVRMbBBT5vW7KQ7DxwoQuMkSwIO+m2xblTQ6zvjfc5Kx4TvsHp02Dmck
         8Pug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=eD0Q1DYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si17011220ilu.84.2021.08.23.02.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 02:18:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=eD0Q1DYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Received: from localhost ([::1]:50924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mI65h-0006nH-HG
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 05:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mI65W-0006my-6S; Mon, 23 Aug 2021 05:17:50 -0400
Received: from [101.89.135.45] (port=44451 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mI65Q-0004AC-Fx; Mon, 23 Aug 2021 05:17:49 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629710102; h=from:subject:to:date:message-id;
 bh=8uv6waHRcI0bnycZTrYtIglsrUAN9CGAvGZy+61uXco=;
 b=eD0Q1DYINW/xmKH0G+uwg5t60RccZ1ftfNgvWys80JXRjRpu9DiD0nYh/b+Rk5v03VcMrCkPR5G
 qLR5XZW/S8YvKoJRMg+KIhA8ajFxIVlFDtbl9K6WSaeFmXsnocRLqx1m9BtRi/6uziNUAYqLEmo+E
 eIa30ywQvQRLLvsVSpw=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Mon, 23 Aug 2021 17:15:00 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: [PATCH v3 0/4] hw/arm/smmuv3: Support non PCI/PCIe devices
Thread-Topic: [PATCH v3 0/4] hw/arm/smmuv3: Support non PCI/PCIe devices
Thread-Index: AQHXl/03JZ8T3FCsZ0CNQ+atIxw77auAzKWA
Date: Mon, 23 Aug 2021 09:14:59 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F972E@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.223]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--2.776100-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 101.89.135.45 (deferred)
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SPNwMCAHzril

The current SMMU v3 model only support PCI/PCIe devices, so we update it fo=
r=20
non-PCI/PCIe devices.
  . Add independent IOMMU memory regions for non-PCI/PCIe devices
  . Add SID value property setting for non-PCI/PCIe devices
  . Add PL330 DMA controller into "virt" machine and connect with SMMU v3
  . Test PL330 DMA controller and PCIe e1000 network with SMMU v3 enabled

Notes:
  You need apply PL330 memory region patch before compile "virt" machine:
  https://patchew.org/QEMU/4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM0=
3.verisilicon.com/

  The old PL330 model cannot configure its memory region manually.=20
  So we update it and provide path.
  The patch was reviewed and will be merged in target-arm.next for 6.2.

Chunming Li (4):
  hw/arm/smmuv3: Support non PCI/PCIe device connect with SMMU v3
  hw/arm/smmuv3: Update implementation of CFGI commands based on device
    SID
  hw/arm/virt: Update SMMU v3 creation to support non PCI/PCIe device
    connection
  hw/arm/virt: Add PL330 DMA controller and connect with SMMU v3

 hw/arm/smmuv3.c              |  81 ++++++++++++++++++--------
 hw/arm/virt.c                | 108 ++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmu-common.h |  12 +++-
 include/hw/arm/smmuv3.h      |   2 +
 include/hw/arm/virt.h        |   3 +
 5 files changed, 178 insertions(+), 28 deletions(-)

--=20


