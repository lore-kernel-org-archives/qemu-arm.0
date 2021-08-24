Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2586412lfg;
        Tue, 24 Aug 2021 01:05:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWt93Vkj8Wo5O6W0EM/pRxnfEhyc7mCX2f+dyZfNQALci2dgY0E1vPHk6Fnc2tFWfU75HI
X-Received: by 2002:a9f:3210:: with SMTP id x16mr5396046uad.135.1629792347481;
        Tue, 24 Aug 2021 01:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629792347; cv=none;
        d=google.com; s=arc-20160816;
        b=F0C8mavpzwLU/NCv/bq5xJlqQpzUsfEU6iXkOsOvj+H1eeD8sWk6YYlp/RcP+Q3slg
         cgO+bP4kDqSdE8z0wHD5DMnzaZSGrilVoszPfQNOgvbMPjMq7FRRc5gXbOSmlqA8Ea/x
         PYne4d/tkEwmFI8PwACFjltGuKo4XPvODrUTKseAJaWmryxRW3bF/pPUsy55ZRZOUn+7
         m46/YTtKqU3nE9A3t2xkTBOfLwMjRhPzDGlIiFJ2j18lCobRMQIoL/YmDG6PdD2Ek6tW
         VqsIVXY5w9sQOEdqvmpJ8Dyhn06W3D3WvQmE4FKeO6WVkW4kN++G6DKGUncJERdV9HK0
         XGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from
         :dkim-signature:content-transfer-encoding:content-language;
        bh=l2nmer7k63UsLGqzxaN4kdwI+Jn+CamBAdDDAeX5Chk=;
        b=ak+kURtObOYp5UbbatHKqj5hu7P3YSlx1CKrnGjCwxaW0TODNqeNMhBsuQP4pT7+jK
         hZr4FjyaVSx0/yUUBM4vD38duCUMXc1L74RW7vZDfvXlNnOObUgcsc0d+eUN5y904/lp
         7oVZ3E0/neqE0HUtLMBKa2Do/wVnoxBPWODG2E7xPiyn6TpLbykJjm7PaNPmlMwmct3V
         lshOboAoz3Mb01dyVFW3PlKGcWR6KCjNnb1M1Xd62ipXm2mYKjamifi8B/HFKfGN3+ik
         kcnHo56g9+X09tYAVVYMxt+RmBLq65BvHGwGW+5F05R8dvkT5Uq/Mtp/EorEsbw/pOS6
         PZMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=F3mVWi7X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si6108877vsq.193.2021.08.24.01.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 01:05:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=F3mVWi7X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIRRK-0007Fj-HT
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 04:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRR9-0007FW-SW; Tue, 24 Aug 2021 04:05:36 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:30393
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRR5-00005A-FV; Tue, 24 Aug 2021 04:05:35 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629792318; h=from:subject:to:date:message-id;
 bh=/jKFh4xM7AYLLLE/KZ+AbLDnIMG2QCxHop0vcn6YZUs=;
 b=F3mVWi7Xaakdqo8D7/oUNiE43Bktf0qncHJSwzYdDJGaDyrQdqjZfPEQBIagWigsZa+5PWsx54t
 kU4ULedH7rOAzXB5O0gudrsw8p+kQMMB33nxh+JqzvNyT1OTDi4dYegLW5/BmI4THIAm5lA0ry86C
 IOpfbbARW1kEczdiCtE=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Tue, 24 Aug 2021 16:05:17 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: [PATCH v4 0/4] hw/arm/smmuv3: Support non PCI/PCIe devices
Thread-Topic: [PATCH v4 0/4] hw/arm/smmuv3: Support non PCI/PCIe devices
Thread-Index: AdeYvsYv7RS1QEwxTvW4Y3dsOYnBaw==
Date: Tue, 24 Aug 2021 08:05:16 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142FABD6@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.182]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--2.776100-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gk6AEyHOrl92

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

Li, Chunming (4):
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

