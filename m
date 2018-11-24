Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3065828wrt;
        Sat, 24 Nov 2018 00:44:19 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XqbRzjpLZZ9Y5OQBhqoP8ryf2EQBzJwaHLSv6NZKzQLIs93WLcNGurtrUU12HkDvpj2R9L
X-Received: by 2002:a25:5342:: with SMTP id h63-v6mr18889124ybb.473.1543049059078;
        Sat, 24 Nov 2018 00:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543049059; cv=none;
        d=google.com; s=arc-20160816;
        b=fENtuP/P/5S8WF/o2L4lkIkq07tB2rEvJA1eDvpRhLaw6mPGfV0wauxKGym0Jff7rF
         zMS7KaUfvX4sSMgZ1DGIX2DeSjzgTgXUwzaMuSGaSBVOBqLIbTdQ2SuYxVK0HzjoGXzX
         0nKelHVZE8JdxLW5aLI/Rm+aPpP0dPdMOOmETTg9Z2mY5T99aG9BAwk3dzK05Kfx6wBl
         ZmNcdtxg3lwGZ9w61JSRUwZrcxFKdZqXZQMwoIERScR7NsAISzxsiVNDyUtaDu3UI8qT
         vwNt1nlL9LiP+RLWfPZyJac7/+DKB9Kp1OTUm2PYf7v9UHScQHxE7lhKQzv4g0d9WSd0
         zuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=QfH64Oyz8eGCqJOzDW0EOFxQ6pjIgFGISrv48SRXNZ4=;
        b=ch1BE3UtH5v0tBIiujAdi0jkFy2DUyv2UNFz7uHQvgWiONcg8/zD1kGPqPlbsUduAl
         9dhuIEFBrEv0/cNbh8zOVN77bzAubyFr6kObVwsy9IiF8OmM+ccLlhPBIWaCcVQ4AGat
         6BNKnkLpxryp3YIk757T2Zu/tC5G7vzevmqic0YYQOMohRUUdvfkAP+MvZ/3QTN45z9M
         UhF852eqFeWqrThTNsUdlE4pA81J5oAQ+UExt5BpVWLWCP0uxyMahQbBGPG4KXkw5wQ4
         3rRHOay8DnipnrvGFcXF2AH4NqJI8+eVjU/szK7SQMXkaufal5B5AwuF95cYBAkGEqe8
         cWPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e9-v6si34923424ybk.76.2018.11.24.00.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:44:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTY2-0005EL-EU
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:44:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTU4-0002ZA-3I
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:40:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTSe-0000RP-UM
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:38:45 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:55544 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQTSd-0000Jw-H3; Sat, 24 Nov 2018 03:38:43 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 9490967E8EFAF60B3415;
	Sat, 24 Nov 2018 16:38:41 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8cWvn035075;
	Sat, 24 Nov 2018 16:38:32 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416391892-12702450 ;
	Sat, 24 Nov 2018 16:39:18 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 01:00:21 +0800
Message-Id: <1543078821-16636-11-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:39:18,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:38:12,
	Serialize complete at 2018-11-24 16:38:12
X-MAIL: mse01.zte.com.cn wAO8cWvn035075
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-devel] [PATCH V8 10/10]  pvpanic : update pvpanic document
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oqe3EGLDO1Xi

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

