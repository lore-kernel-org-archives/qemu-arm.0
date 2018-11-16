Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7771552wrw;
        Thu, 15 Nov 2018 18:34:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5eOnFe6iHBD8m45OcZQdH/YREgDTiBhM23MBsd1aDiEH2t8Ar/rd9tVgPQijz18TV84GFtI
X-Received: by 2002:a0c:b5c8:: with SMTP id o8mr8775440qvf.213.1542335679184;
        Thu, 15 Nov 2018 18:34:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542335679; cv=none;
        d=google.com; s=arc-20160816;
        b=ZWuH9JK/2O8Ab0QWsVRGHc5DaH71g9kSCLMZFqy63pDnB5EkijjqkAXygY36hk+hr4
         QSDB8JAgkFTevzVqQ9DZzpaOLr8kTXt4u+iAMOgJZNxVQiMqQiIJDSU7EoLfeR/z616B
         axcmyeCdLnXxMoGMIVMWE/8jaK2+uzON96F8luxj5nxsIWl9J9HAi72czTe5TencMKeu
         IrMl5Jvzrx37830pMHiyXtpMAM5qOAhwXSLiI4YXhrLPUBKFabKRDXy7mLc/KqsdGRxt
         A4qwgHlrqqMjh/1ukZpNj7XTS7J6a41IbwQxsE2kUOciCcxNfdIK/j23XUVnLvQEpcfO
         M+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=86LMZVK4iFKn5NETe70i5pW956qas38A1vTL+WMzpRA=;
        b=FVM9qtwHS/8m0XiOPkxoSc+G2zotMIMzzrEzKnFi3JJEj7njhstqDCJWrLOmg9r4Le
         VgpjbKEIQbrut8KNwuLPkOkuFUSp0A2Y9PqjkyzPzwjwMv1naQ7GQwscEMRqRb+HHjHa
         REVRB3OLzDcLHPJa6Ob46yf6kx1ICsdAr2FE5WcADju3I2JY8s5/cC64pHnjr5twoIqq
         Gg8Dd0iURvViMkapZS/4C6M2qojzWtkfYThIIcUAWgT4bnyLmMePq2Yo95CzPKzjkn3F
         xxYkqL3M2ZkSFqoyfRo8b7K106R65gCZPHBbnNQWP+REp7jMil8Lac7e02kdrHQzFUfP
         XXpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l13si5880809qtq.121.2018.11.15.18.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 18:34:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNTxu-0007w0-NA
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 21:34:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTrp-0003JW-Tf
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 21:28:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNTrg-0008T9-15
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 21:28:18 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:36876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gNTrX-0007wH-KT; Thu, 15 Nov 2018 21:28:06 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id EDC6C3D703A0B17FFBFA;
	Fri, 16 Nov 2018 10:28:00 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAG2RpvS028767;
	Fri, 16 Nov 2018 10:27:51 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111610282647-11036273 ;
	Fri, 16 Nov 2018 10:28:26 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Fri, 16 Nov 2018 18:50:06 +0800
Message-Id: <1542365406-81310-7-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
References: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-16 10:28:26,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-16 10:27:35,
	Serialize complete at 2018-11-16 10:27:35
X-MAIL: mse01.zte.com.cn wAG2RpvS028767
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V7 6/6]  pvpanic : update pvpanic document
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
X-TUID: t1fB/ZbGsOFL

Add mmio support info in docs/specs/pvpanic.txt.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 docs/specs/pvpanic.txt | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index c7bbacc..4e1f69d 100644
--- a/docs/specs/pvpanic.txt
+++ b/docs/specs/pvpanic.txt
@@ -1,7 +1,7 @@
 PVPANIC DEVICE
 ==============
 
-pvpanic device is a simulated ISA device, through which a guest panic
+pvpanic device is a simulated device, through which a guest panic
 event is sent to qemu, and a QMP event is generated. This allows
 management apps (e.g. libvirt) to be notified and respond to the event.
 
@@ -9,6 +9,13 @@ The management app has the option of waiting for GUEST_PANICKED events,
 and/or polling for guest-panicked RunState, to learn when the pvpanic
 device has fired a panic event.
 
+Some architectures do not support ioport, just like arm. So add mmio
+support.
+
+When pvpanic device is implemented as a ISA device, it supports IOPORT
+mode. If pvpanic device supports MMIO mode, it will be implemented as
+a SYSBUS device.
+
 ISA Interface
 -------------
 
@@ -19,6 +26,13 @@ Software should set only bits both itself and the device recognize.
 Currently, only bit 0 is recognized, setting it indicates a guest panic
 has happened.
 
+SYSBUS Interface
+--------------
+
+The SYSBUS interface is similar to the ISA interface except that it uses
+MMIO. Pvpanic exposes a address space region 0x09070000--0x09070001 in 
+arm virt machine. Currently only the first byte is used.
+
 ACPI Interface
 --------------
 
-- 
1.8.3.1

