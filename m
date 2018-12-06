Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10478769wrt;
        Thu, 6 Dec 2018 03:04:57 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VY4qB1sFbaNCE0PWoX61ToMMqHPUo3Xzh6LCMRwJ8fPkBW4kqUYVI35fR963vtmIbP0zEG
X-Received: by 2002:a0c:9272:: with SMTP id 47mr21173667qvz.142.1544094297000;
        Thu, 06 Dec 2018 03:04:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544094296; cv=none;
        d=google.com; s=arc-20160816;
        b=IldcWGgsCOB3YDWttspl7RoDWBeJljDY3gmSQqV+VvZ1/PUr2E8vJT3ctnttS0Zl4w
         0PXTXS3KbvwQC9UtvjvLgWA7scEXdWsa88xZ4Vkv2OKsXKiBgnkxOb0i/G95Kf5Es/qG
         W2eYtcLhH1CKXQHE3BKZhv+Ra+fuKZTfyMgEZ/ksF4EDNbWjSPmsBTVlRrdxW8UBIuh0
         vfRGbSFGY19siGyDFsRZ0+3ucGOgvbro1rsRoQSTIL5A5e+5anSpPcQn2QftsmK4QmYT
         nEr+08J57rZF8BifjADlXnNXdjPaOoLggLLDzBFT50bGDgltvgu61EbQK+oRZ62xi3TM
         +bCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=3aV7UVkENACClB3gampgPYSZ3Q4ImtREmqmEZqom53k=;
        b=YWMgJJAx8qHqJkXwxH/bfoOSZ3tefyOafjN0SDIcSYUrK4ZF5knQrG+6fuBPgjfGx2
         Ar9e7Hg0r27fYbT7vesgKn/iSva93AXccb2cJbtqbub9sDM7QLYqc23cslDOC8Hyszop
         EkZN5IMYbvlLJjyk2+AZxrYNPphD9bFsKUBru7Re0jz5ze/2rshSXHJZeVkX/D4OcEZA
         YZuS8088JE5akdjdJmyIJczAf2Xk1viucXG2QotCGwcVagW2uYEEe18Fr/dnIXm3Y7Hg
         2PdpzzMW4BfvoowMKcJTc8CHk0i/eNJtJdRYMVO1+HEOjqKf3o4ENJ6iiyfUj5PjcYE8
         2sDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si10569qvk.217.2018.12.06.03.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 03:04:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUrSh-00034D-Ml
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 06:04:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUrSJ-0002xH-PW
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 06:04:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUrSF-0000EN-NW
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 06:04:31 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:65048)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gUrSF-00009e-95; Thu, 06 Dec 2018 06:04:27 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id A04D0D15F1847A5791BB;
	Thu,  6 Dec 2018 19:04:15 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB6B41ZG072829;
	Thu, 6 Dec 2018 19:04:01 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120619043367-15124414 ;
	Thu, 6 Dec 2018 19:04:33 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Thu, 6 Dec 2018 19:26:00 +0800
Message-Id: <1544095560-70807-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
References: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-06 19:04:33,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-06 19:03:50,
	Serialize complete at 2018-12-06 19:03:50
X-MAIL: mse01.zte.com.cn wB6B41ZG072829
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH]  pvpanic : update pvpanic document
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
X-TUID: WrTxsyGQTeEY

Add mmio mode as a pci device support info in docs/specs/pvpanic.txt.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 docs/specs/pvpanic.txt | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index c7bbacc..6d62d72 100644
--- a/docs/specs/pvpanic.txt
+++ b/docs/specs/pvpanic.txt
@@ -1,7 +1,7 @@
 PVPANIC DEVICE
 ==============
 
-pvpanic device is a simulated ISA device, through which a guest panic
+pvpanic device is a simulated device, through which a guest panic
 event is sent to qemu, and a QMP event is generated. This allows
 management apps (e.g. libvirt) to be notified and respond to the event.
 
@@ -9,6 +9,10 @@ The management app has the option of waiting for GUEST_PANICKED events,
 and/or polling for guest-panicked RunState, to learn when the pvpanic
 device has fired a panic event.
 
+The pvpanic device can be implemented as an ISA device (using IOPORT),
+or, since qemu 4.0, as a PCI device (using MMIO address space of pci
+device).
+
 ISA Interface
 -------------
 
@@ -19,6 +23,13 @@ Software should set only bits both itself and the device recognize.
 Currently, only bit 0 is recognized, setting it indicates a guest panic
 has happened.
 
+PCI Interface
+-------------
+
+The PCI interface is similar to the ISA interface except that it uses
+MMIO. For example, the arm virt machine could enable pvpanic-pci device 
+according to adding "-device pvpanic-pci" in qemu command.
+
 ACPI Interface
 --------------
 
-- 
1.8.3.1

