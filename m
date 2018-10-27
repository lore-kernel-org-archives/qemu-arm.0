Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1768457wro;
        Sat, 27 Oct 2018 02:57:21 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ctLaNj4Pe1rYoA342tXEB2XwVpGWSKj01nXLDAQxgfWmQ8hsMTTjx+eQVGd8FP60rJyxpf
X-Received: by 2002:ac8:1815:: with SMTP id q21-v6mr6410557qtj.223.1540634241192;
        Sat, 27 Oct 2018 02:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540634241; cv=none;
        d=google.com; s=arc-20160816;
        b=bairYR0xG+J3nqUDYdMDpDpIZis/qgSkzLl5vpbebLQzH16rwP0aZbm3gR3Ggmif3B
         CP1rCYps3zb/nnT1zFm1TrFqh9pqBNLCFNuqmMJytqTX7l0HLwFbFSoseb2/XmHiurCS
         Dnk6JlRHB5HxMA50btdEKKJ04QSC2UaJLhR/ROV/E/7FIC1MYX9GqHBMF73XOOB6bI9d
         npKB/scGsCu/S1/2KJp4JJIq4wA6jMzYm1fEijjre68JRNf44lJCLg0o8bGuyyLSu0Nv
         ljOCl1SNkuNkAX8xhIMpYDN5Uvy1/6z1EVpYpIKknVkts5dFnAxZphgZLxlUxlECBU7P
         QmDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=YuayZn3UVNMC5a56lShBwRILTuikGd2+AP29+8Z99DQ=;
        b=tsBpuwNwGHqc+ejdIOc7yrFtKi0jvnxM1cU5224osdHDPeGZLhJLnayq3ncLk0m60P
         fp9YeSSKuaJ1b6OinYY+CI/VlaCKrexlqT0esq4eABlMEonkhnouUtDdh3H9k1MnlmEW
         idIWm0gaQB4eqAuXNIpqAGnrLeu4v6pLE23TuoZun+AV/Od96PXYczK1+wKOLsvLGyPe
         CPq5swI/Kz1qA8nTQfVyfPK9yo4lqXjyc8NbeFnbRvZLMNUlL71UOmJcYuiJGCBx2L78
         B0mSV23M/KUevInQwuR1VbFbsI3E+ob02Urg3WpuU67bWnEtIn0+h1oA48fq5I0HIqiO
         6avw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11-v6si4665362qtp.177.2018.10.27.02.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Oct 2018 02:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gGLLM-00069E-Lc
	for alex.bennee@linaro.org; Sat, 27 Oct 2018 05:57:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gGLL3-00067f-Ky
	for qemu-arm@nongnu.org; Sat, 27 Oct 2018 05:57:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gGLL0-0003Rj-FF
	for qemu-arm@nongnu.org; Sat, 27 Oct 2018 05:57:01 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:64886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gGLL0-0003I3-0C; Sat, 27 Oct 2018 05:56:58 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 740F8A65D33A288F215E;
	Sat, 27 Oct 2018 17:56:48 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9R9uflf070655;
	Sat, 27 Oct 2018 17:56:41 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018102717572827-7044940 ;
	Sat, 27 Oct 2018 17:57:28 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, philmd@redhat.com
Date: Sun, 28 Oct 2018 02:07:25 +0800
Message-Id: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-27 17:57:28,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-27 17:56:21
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn w9R9uflf070655
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V5 0/5]  add pvpanic mmio support
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
X-TUID: /PQAX41NSnFM

The first patches are simple cleanups:
- patch 1 move the pvpanic device with the 'ocmmon objects' so we compile
  it once for the x86/arm/aarch64 archs,
- patch 2 simply renames ISA fields/definitions to generic ones.

Then instead of add/use the MMIO pvpanic device in the virt machine in an
unique patch, I split it in two distinct patches:
- patch 3 uses Peng Hao's work, but add the MMIO interface to the existing
  device (no logical change).
- patch 4 is Peng Hao's work in the virt machine (no logical change).
- patch 5 add pvpanic device in acpi table in virt machine
v2 from Peng Hao is:
https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03433.html

v3 --> v4
  patch 1,2 no modification.
  patch 3, add TYPE=5FPANIC=5FMMIO for distinguishing different bus device,
           virt + isa=5Fpvpanic will abnormally terminate virtual machine. =

  patch 4, "pvpanic,mmio" --> "qemu,pvpanic-mmio".
  patch 5, newly added.

v4 --> v5
  patch 1,2 no modification.
  patch 3 delete PvpanicCommonState structure.
  patch 4 VIRT=5FPVPANIC=5FMMIO --> VIRT=5FPVPANIC
          correct VIRT=5FPVPANIC's overlap start address
  patch 5 no modification.

Philippe Mathieu-Daud=C3=A9 (2):
  hw/misc/pvpanic: Build the pvpanic device in $(common-obj)
  hw/misc/pvpanic: Cosmetic renaming

Peng Hao (3):
  hw/misc/pvpanic: Add the MMIO interface
  hw/arm/virt: Use the pvpanic device
  hw/arm/virt: add pvpanic device in virt acpi table

 default-configs/aarch64-softmmu.mak |  1 +
 hw/arm/virt-acpi-build.c            | 16 ++++++++
 hw/arm/virt.c                       | 21 ++++++++++
 hw/misc/Makefile.objs               |  2 +-
 hw/misc/pvpanic.c                   | 78 ++++++++++++++++++++++++++++++---=
----
 include/hw/arm/virt.h               |  1 +
 include/hw/misc/pvpanic.h           |  2 +
 7 files changed, 105 insertions(+), 16 deletions(-)

--=20
1.8.3.1

