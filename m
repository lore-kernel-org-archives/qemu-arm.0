Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2662809wrw;
        Sun, 11 Nov 2018 19:23:26 -0800 (PST)
X-Google-Smtp-Source: AJdET5eKrFjqHKG+y292lyt5feRvKezYVtF7WAvyGlz7n/ZcMkY3trd8c1C1E4S5d0SyjsLgEejj
X-Received: by 2002:a0c:b669:: with SMTP id q41mr17938915qvf.58.1541993005917;
        Sun, 11 Nov 2018 19:23:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541993005; cv=none;
        d=google.com; s=arc-20160816;
        b=Pzd4ajlFX5HQiMUk3548e8YM+gQHW8TpcttvPQAKMlFu4RwL+LCqmMmlHQVezgvAHP
         2m65xD+lIYVFNy3iqifyDBj00N3QvzXfjyV7JZr6/y9Y3DFBqa2KQtroSh0X7fMxIClN
         /KVwkyT72QUSK7RAhOByiW/jYS8kGgcGRT/KhFCkHDJoxpSiUrfPSy/0almw3uSiOLVb
         0BpA1FUOKfeuPu/l51WaRCmJAzJP5wI8fKnT2bwmDEnIH0VMAV9NC9BAwXffmyDP4V3a
         +JMFMcRdp2RPipaesR/Tt/7tnWTi5PZedB2MMggo3h4ZKQXZLijI+50sV+9cEiTAx0CA
         oh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=gex+s+Fqp27Ly9SE4yyF8c2sGVXQIkDsiRqVYp3V2DE=;
        b=jNwE179ewaK6wBw4PTJiXX9w8vIydYZ7Dn2GqYjClZd3xzmfr42p2KnmUl5IUu1wAe
         GM8Tix0WTwQ/6lHhyH44BAcjgxkILKtgie0iCaMDdVn08jmBvAvkdUJf3sqggYtizk0l
         6FsYyrhvFf9QD82PSJ6AB6GgqTagzW5jDdoy6Dj9q0nk05YOB2vxkdXgyk3Oz1Cuq36u
         nor9DeVEe9YhEl33QFcXQhScPLQ6UO2HRFIAiZUaQDWiER5dTCmBFL1PeSPtGarrzd2c
         LKDcYZLyEUmugeksZRhzvzbLDpxahsPWimS6vlw9Bny4d1FVoxuzUpFsbBStUdAQuW9j
         MJcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s34si6053021qtb.17.2018.11.11.19.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 19:23:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gM2ou-00047M-Oe
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 22:23:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2mM-00029Q-IC
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 22:20:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2mJ-00034Y-Nx
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 22:20:46 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:26488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gM2mG-0002pE-D3; Sun, 11 Nov 2018 22:20:41 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id C4A95F8464250B9CCE8B;
	Mon, 12 Nov 2018 11:20:37 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAC3JsBo085000;
	Mon, 12 Nov 2018 11:19:54 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111211195777-10076112 ;
	Mon, 12 Nov 2018 11:19:57 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Mon, 12 Nov 2018 19:42:20 +0800
Message-Id: <1542022940-46849-7-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
References: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-12 11:19:57,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-12 11:19:53,
	Serialize complete at 2018-11-12 11:19:53
X-MAIL: mse01.zte.com.cn wAC3JsBo085000
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V6 6/6]  pvpanic : update pvpanic document
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
X-TUID: XDrAhUX6MPGY

Add mmio support info in docs/specs/pvpanic.txt.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 docs/specs/pvpanic.txt | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index c7bbacc..5d8e9dc 100644
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
 
+When pvpanic device is implemented as a ISA device, it supports IOPORT 
+mode. If pvpanic device supports MMIO mode, it will be implemented as
+a SYSBUS device.
+
 ISA Interface
 -------------
 
@@ -19,6 +23,13 @@ Software should set only bits both itself and the device recognize.
 Currently, only bit 0 is recognized, setting it indicates a guest panic
 has happened.
 
+SYSBUS Interface
+--------------
+
+It is basically the same as ISA interface except that it uses MMIO. Pvpanic exposes
+a address space region 0x09060000--0x09060001 in arm virt machine.
+Currently only the first byte is used. 
+
 ACPI Interface
 --------------
 
-- 
1.8.3.1

