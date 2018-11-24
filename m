Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3049289wrt;
        Sat, 24 Nov 2018 00:21:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VnCU1Zf4QZBMAfiRn/vqZv7WiMRG1CWLjCUTo/WmtR868e6kURaLnwXzOT5F1+RF99y1u7
X-Received: by 2002:a25:5843:: with SMTP id m64-v6mr20268861ybb.426.1543047695038;
        Sat, 24 Nov 2018 00:21:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543047695; cv=none;
        d=google.com; s=arc-20160816;
        b=kJSiNalITZalgX/llS1PYPrLGdKiMkJpZR34iBaCZRPn/BUJFYo9fXd7mI1Zp31P/1
         mCDWSNVBI3la0aX/X0H5nfORELfmres/KFAXitLAFksfxJD7c2+EdRE9Yo0RRWg5SSlV
         wgcFN5ZGBRUjaMCNqWYw/R5g74pFDMKhgT1W3QBry2hpOb2VjNfgDpL0ORYgjJZE1paB
         vAOsLXM+JL0JD2e7OiPTst2zkrerD2t4TkRY4XaF4sWaNUwx2NZr6fHiQg3grNqcnyR8
         UWBXJBlXUEQdG43foXLKonRxCuv9zKqx+CuTrOJe3MJz6jVdH06KBrqiTjnOTb05I2Zf
         6rOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=QfH64Oyz8eGCqJOzDW0EOFxQ6pjIgFGISrv48SRXNZ4=;
        b=LcBWQKpUg31W0IFKt12mrIHJjku6LGzybtzok5B6B1LvJRPdrvTKdiMGLxg5zCf7KY
         U9fhn9I8SqALgUy9l4dhwNZdVa4m5TEj9Fkx8iyhdxbe/SkDj2lR6Xsskz7k8ZrsMZ+2
         thjljK1vsJEIEUJmVrxfb++wyPLKEydEkcwS5XHcXP495GwuJRDaFdHbMXoU+v8eQNwc
         3yFt2xwcuaKjytCJkzfXo6lIbAmUM/N4bMn5WAdML9QN8EpJsWwZdl6Ha1VBkfVEyQw1
         FWn0VfHCOZQaCGIvA7SAi1Avuc66oOV0G2cKAfbKGld+NMAh+0H4yJ8pAqcUnnt+WchM
         aTBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f82si14835489ywc.257.2018.11.24.00.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:21:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTC2-0000w9-Cs
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:21:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTAt-0008Lg-ST
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:20:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQT41-0005fd-Qg
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:13:19 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:27278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQT41-0005Lm-Fu; Sat, 24 Nov 2018 03:13:17 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id DF1BBB2BC04D625E8CB1;
	Sat, 24 Nov 2018 16:13:11 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8D7P0023579;
	Sat, 24 Nov 2018 16:13:07 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416135360-12697223 ;
	Sat, 24 Nov 2018 16:13:53 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 00:34:33 +0800
Message-Id: <1543077273-16201-10-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:13:53,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:12:47,
	Serialize complete at 2018-11-24 16:12:47
X-MAIL: mse01.zte.com.cn wAO8D7P0023579
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH 10/10]  pvpanic : update pvpanic document
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
X-TUID: tWCjLW3FVWpM

Add mmio support info in docs/specs/pvpanic.txt.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 docs/specs/pvpanic.txt | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index c7bbacc..2d06ee5 100644
--- a/docs/specs/pvpanic.txt
+++ b/docs/specs/pvpanic.txt
@@ -1,14 +1,18 @@
 PVPANIC DEVICE
 ==============
 
-pvpanic device is a simulated ISA device, through which a guest panic
-event is sent to qemu, and a QMP event is generated. This allows
+pvpanic device is a simulated ISA/SysBus device, through which a guest
+panic event is sent to qemu, and a QMP event is generated. This allows
 management apps (e.g. libvirt) to be notified and respond to the event.
 
-The management app has the option of waiting for GUEST_PANICKED events,
+The ma:wqnagement app has the option of waiting for GUEST_PANICKED events,
 and/or polling for guest-panicked RunState, to learn when the pvpanic
 device has fired a panic event.
 
+When pvpanic device is implemented as a ISA device, it supports IOPORT
+mode. Since QEMU v3.2 pvpanic also supports MMIO mode, it will be 
+implemented as a SYSBUS device.
+
 ISA Interface
 -------------
 
@@ -19,6 +23,14 @@ Software should set only bits both itself and the device recognize.
 Currently, only bit 0 is recognized, setting it indicates a guest panic
 has happened.
 
+SYSBUS Interface
+----------------
+
+The SYSBUS interface is similar to the ISA interface except that it uses
+MMIO. For example, the arm virt machine could put the pvpanic device at
+[0x9070000, 0x9070001] and currently only the first byte is used.
+
+
 ACPI Interface
 --------------
 
-- 
1.8.3.1

