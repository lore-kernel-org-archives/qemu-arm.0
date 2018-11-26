Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5416071wrt;
        Mon, 26 Nov 2018 03:37:44 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WQdGcm+/KnrfFfoLnOib2wYT4DQdJuAp6cOuB73cfWJoJv+PiGHdjdc9UUMGBYcQrwDpx7
X-Received: by 2002:a81:d201:: with SMTP id x1mr18540395ywi.9.1543232263958;
        Mon, 26 Nov 2018 03:37:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543232263; cv=none;
        d=google.com; s=arc-20160816;
        b=Q7AHQElKWuNNIGmvWEv3MW60DTIz1IDDwdS0ZfVta8fzfGZr8bSvBbOMa6mA83IKbM
         88uxqjP7B92uyGzg9nHFLGFAKncsWQYWuUxyBn99Afib+03EX/eQxCR2YsXJw9+Xv1sf
         cPz0b4xq8F8qdCtOn4NgmjZ+4lS1WnVlZ0zhFnMFI1OTGstpHRzeu+DmoJX5y+X3LeTa
         uJJS7Yo/F7yvN7iWZIQ3QkfYQTp6mP7nMXGk/+5H+r4IbaNRpxjB/y1s7BdZw8EOLy0+
         KH+9lKMh2W1QvqbkmKVGn+5ohkXHTMEJVgQVonKQXp7mSE691HiqbXK+jM+r0iOU+WfB
         H72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=UEcIJfUGU9riD5/z/PMazf3rtlGiBqbhngq8uTicT3s=;
        b=ysK/Br47F/zZPw1Xx3sIrlEq9PyHhsn3OlxLgdjceaXE/A/BgO6CQgSs8nIDtxjWLD
         rYmzYgyVrsPTlLMg4By00XIPqHHFU39X0RKGvp8Vs0ta0EL0JXzccfZmMQWBsj9uPEzH
         BqL+Y7xz84aqV5f61DKBR+1Bkeo+aWNj9Ujd+QT6PD4e77UaIH1nb/xZDuu5y50YKeWy
         cMLTRXbvPbABFeG/pgwfblasDYZgI1By+2Gf9FfUozvCWdk//BNrHO8nzms3m13dkgPl
         TEYOT9ulRTRXhIIX+/ABivCkmuwC/hrY7d7sGVg11ImGzG8OGmRa+8YiHSljheQxns76
         srpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f188si36016ywc.230.2018.11.26.03.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 03:37:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRFCw-0003b8-Pu
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 06:37:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8e-0000Es-4W
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8c-0001wd-P7
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:16 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:56582 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRF8c-0001uW-Ah; Mon, 26 Nov 2018 06:33:14 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 1F7F48C353C489583040;
	Mon, 26 Nov 2018 19:33:12 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAQBX3fM031875;
	Mon, 26 Nov 2018 19:33:03 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112619331147-13057804 ;
	Mon, 26 Nov 2018 19:33:11 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 27 Nov 2018 03:56:02 +0800
Message-Id: <1543262162-6351-10-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-26 19:33:11,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-26 19:33:03,
	Serialize complete at 2018-11-26 19:33:03
X-MAIL: mse01.zte.com.cn wAQBX3fM031875
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V9 9/9]  pvpanic : update pvpanic document
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
X-TUID: hvh6Ir55FIam

Add mmio support info in docs/specs/pvpanic.txt.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 docs/specs/pvpanic.txt | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index c7bbacc..67f5591 100644
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
 
 The management app has the option of waiting for GUEST_PANICKED events,
 and/or polling for guest-panicked RunState, to learn when the pvpanic
 device has fired a panic event.
 
+When pvpanic device is implemented as a ISA device, it supports IOPORT
+mode. Since QEMU v3.2 pvpanic also supports MMIO mode, it will be
+implemented as a SYSBUS device.
+
 ISA Interface
 -------------
 
@@ -19,6 +23,13 @@ Software should set only bits both itself and the device recognize.
 Currently, only bit 0 is recognized, setting it indicates a guest panic
 has happened.
 
+SYSBUS Interface
+----------------
+
+The SYSBUS interface is similar to the ISA interface except that it uses
+MMIO. For example, the arm virt machine could put the pvpanic device at
+[0x9070000, 0x9070001] and currently only the first byte is used.
+
 ACPI Interface
 --------------
 
-- 
1.8.3.1

