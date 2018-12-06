Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10478366wrt;
        Thu, 6 Dec 2018 03:04:37 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U71rxxImziBOBwTUEFy7DrNMazTUxxOVSPxJFWv/0Ver+wIZKLC1TcQVAmNpwXrU7F2esz
X-Received: by 2002:a37:3c06:: with SMTP id j6mr25380282qka.298.1544094277355;
        Thu, 06 Dec 2018 03:04:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544094277; cv=none;
        d=google.com; s=arc-20160816;
        b=huXrUz0T6r1+YxhkgbBoA0sItbz+7488Vj1NbiDWd10ylyoYZLYyHQN+tTFVBkqjvX
         FX18M7mPUG6j0qIV1tScPlcoGphNdrWeS0vdNpnUSODfTmwjoQLxlpJmdkWSesYW61Tx
         quTxb4ZGSj4OLmZES668UFy5Pbk4q3Fr58XyBHdBSwblJYdjFp2+3M8sou29yj8d98fD
         DFNtO+v2yVXX+D2E0SgCekvxxaSpo849jWUP3UyPtJrWxiijBZT7JxvS/jXkxRMpz64v
         YYg3rCKdSsSRvDzmxXy5J78HsQrTKCRsp4SMEuNY71zmbNkzP1pAXDaC2cH8F9AJLNR2
         T2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=TyfUmFU6Ya7rplTnzKoKI6Kpw6zobyclUICuCeD8th8=;
        b=yfaYH6Bmpr/RI4tpvRxeV4tkTc79c9tg053aCUi9Op4Y8zuAUAbhjw1oko/bxcqlDg
         deY6getGeZPnGn5NTyz9V4pAe9oxxZuqB5+YGPid6BN0njGmis4FASFY3QXkPR+v6GhZ
         vv6HBVAngdE58vW3eIrej8lf8BNcFO+3fJlrT4TGfcRE/PwrSc145awqtdqCjeynt+ts
         K3KmudgClK8rqu6+71dfd7xIw/bo38QWl+S81byX8RWGTxiz0gjxKFzXF9mVCaeYlWlz
         z9tJhWRSmu8omL3CnQzcpxiEka6rxf6YlGrLMKM2PXc9Z2RGID5HU7Ba0GBrxoZBbt8K
         Kb+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 36si20025qta.249.2018.12.06.03.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 03:04:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUrSO-0002vx-Th
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 06:04:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUrSC-0002vo-Cv
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 06:04:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUrS1-00008O-9u
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 06:04:16 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:41028 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gUrRu-0008Vp-CL; Thu, 06 Dec 2018 06:04:07 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id D271770258A149B120FD;
	Thu,  6 Dec 2018 19:03:59 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB6B3qer072742;
	Thu, 6 Dec 2018 19:03:52 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120619042409-15124379 ;
	Thu, 6 Dec 2018 19:04:24 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Thu, 6 Dec 2018 19:25:55 +0800
Message-Id: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-06 19:04:24,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-06 19:03:40
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wB6B3qer072742
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V12 0/5] add pvpanic mmio support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SJsVNaABbhbY

The first patches are simple cleanups:
     - patch 1 move the pvpanic device with the 'ocmmon objects' so we comp=
ile
               it once for the x86/arm/aarch64 archs,
     - patch 2 simply renames ISA fields/definitions to generic ones.

     Then instead of add/use the MMIO pvpanic device in the virt machine in=
 an
     unique patch, I split it in two distinct patches:
     - patch 3 uses Peng Hao's work, but add the MMIO interface to the exis=
ting
        device (no logical change).
     - patch 4 is Peng Hao's work in the virt machine (no logical change).
     - patch 5 add pvpanic device in acpi table in virt machine
     v2 from Peng Hao is:
     https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03433.html

v3 --> v4
     patch 1,2 no modification.
     patch 3, add TYPE=5FPANIC=5FMMIO for distinguishing different bus devi=
ce,
              virt + isa=5Fpvpanic will abnormally terminate virtual machin=
e.
     patch 4, "pvpanic,mmio" --> "qemu,pvpanic-mmio".
     patch 5, newly added.

v4 --> v5
     patch 1,2 no modification.
     patch 3 delete PvpanicCommonState structure.
     patch 4 VIRT=5FPVPANIC=5FMMIO --> VIRT=5FPVPANIC
             correct VIRT=5FPVPANIC's overlap start address
     patch 5 no modification.

v5 --> v6
     add document.

v6 --> v7
     patch 5 modify device name from "PANC" to "PEVT".
     patch 6 modify document description.

v7 --> v8
     add configure interface for pvpanic-mmio

v8 --> v9
     revert "moving structure definition to header file"
     because of compile error in x86.

v9 --> v10
     Modify document.
     Repair missing header files.

v10 --> v11
     change configure interface in virt machine configure parameters.

v11 --> v12
     realize pvpanic as a pci device and use the mmio of pci device.

Philippe Mathieu-Daud=C3=A9 (2):
  hw/misc/pvpanic: Build the pvpanic device in $(common-obj)
  hw/misc/pvpanic: Cosmetic renaming

Peng Hao (3):
  pvpanic : update pvpanic document
  hw/arm/virt: Use the pvpanic device
  pvpanic: add mmio interface as a pci device

default-configs/arm-softmmu.mak |  1 +
docs/specs/pvpanic.txt          | 13 +++++-
hw/misc/Makefile.objs           |  2 +-
hw/misc/pvpanic.c               | 91 +++++++++++++++++++++++++++++++++-----=
---
include/hw/misc/pvpanic.h       |  1 +
include/hw/pci/pci.h            |  1 +
6 files changed, 91 insertions(+), 18 deletions(-)

--=20
1.8.3.1

