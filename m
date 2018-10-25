Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp558715wro;
        Thu, 25 Oct 2018 04:16:15 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dZtB5U6vMPr7qQZEsQ6tQvm8+qi91/uaitelklwCO0FVT9TXKIoD34QWciGb/loRk4xkkK
X-Received: by 2002:a37:8503:: with SMTP id h3-v6mr931052qkd.82.1540466175337;
        Thu, 25 Oct 2018 04:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540466175; cv=none;
        d=google.com; s=arc-20160816;
        b=jaMJoJACZh4+RwphFrlkoKm4lgBDLEETOOzXPW/6WDRLSDQQuc2zBzlnwQ/SIPJ8tL
         i2PevztYBYMWuMe1Y5i04o/KV3GsovHbNO5ddxaCrsGR0ZNA8HGVy64WZXtlMcOtXaFM
         8d+FXRhZ6A7UAlwrk35534edgIlH2QRbAxBoJwgilH+TKpc4Oq7i+1z7dpGZqBSQ8OZI
         e9HEvXHs2Uv8NclNFyeUtyBkZIEOd80cFnIUuDc4NHrQwoq7yGboM1c3WjKGUptZ/8GE
         YPGk5kHX4c5v6e1Wo9U2iY/1tTUWTfUuds9Tc83MDcL3kzpULtJv7lNGbmcGbr0e3wj9
         DPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=RaXHhm/BxcBpm2KzX8+9rsPbs9z8WoIwBUA85ls2/lY=;
        b=H+7RyrmvWSXTQF1GExqEa6zU8gcmBt2YxV+wmljMPd9bb0ted3eO3uHORhxqzo+hEE
         agnCxIKj1da4zjMIE/RGluStRRuY2axgFrA+tS2GcWKstkXvUpYbNCJNxT0xF4htyzJN
         M+L8ag7wX3VnqBFZcZ/FQpT1q6DqVggXNTE0shDouY/xi7FwJmhVW+Kmy2SS0Im9iHr3
         jn9KTfn7WEwwJVlPc2Pv9XYR21EiJBhh0kcOWnmSi8Q3wyhVD2vsyeHdt9MoS5ji3PGB
         WE19o1ay3ljdUusA2SfaQ+GklLplCRy+ISLIJoNeb3DUmph1t2KftMSRzTTV0Te5LmuH
         cgOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l15-v6si1109302qkj.184.2018.10.25.04.16.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 04:16:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFdcc-0008VA-S1
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 07:16:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZZ-0006Ea-I5
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:13:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gFdZQ-0000co-4K
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:13:02 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:13182)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gFdZI-0000Qf-Gm; Thu, 25 Oct 2018 07:12:55 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 57505231F27ED687D42F;
	Thu, 25 Oct 2018 19:12:28 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id w9PBCGh5015183;
	Thu, 25 Oct 2018 19:12:16 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018102519124783-6703125 ;
	Thu, 25 Oct 2018 19:12:47 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, philmd@redhat.com
Date: Fri, 26 Oct 2018 03:23:12 +0800
Message-Id: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-10-25 19:12:47,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-10-25 19:12:04
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn w9PBCGh5015183
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V4 0/5]
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
X-TUID: 5JQwa/Zmrg5N

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

