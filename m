Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp550504wrt;
        Tue, 27 Nov 2018 19:53:38 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XyrTYpoF570GC1bp6QU4KoZgVrlVEWEtfkrdBL4hYV8M2nvTyUuJutSIysIBWZB9fh3wqj
X-Received: by 2002:a81:4412:: with SMTP id r18mr31229669ywa.204.1543377217940;
        Tue, 27 Nov 2018 19:53:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543377217; cv=none;
        d=google.com; s=arc-20160816;
        b=j2ywVKq7Sx2M02Zsir51rK/E1gsSWGfxaGT0+RgjYpGRIMHM5LM4ISc4BjEZtfFQpq
         V5s5UkDxUJqZPx4iT09rZPcmGYOua4rmeAMsR6RThlzLA0ZV4UN1Do8ejSedPlL2n0kI
         WyvPMJdYec0bJPCGsre39gjZgZq53WW6vRwCQiT7phiJ1dW6Wio8ggnXaAWlOFRunzlc
         vWK8wpvdtCUY4NEd7Y6XRbm00liZu+rGHj2Y2+MhNWH8RLjwhFN0opslG7valQ0nmWYP
         bx2iD8eIVLkFS1s70WeZp5n2zWn9UJyL3Pu74pvjgG/TZRrlMsvdQBCUrJOZ78mDf5LT
         SSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=ZYKEpIHZC9VTMIYDYLgTEC3U8fCQCnfcoQpAbEChL6A=;
        b=MSLGAbFLAP7klZhc4NOBku1y8RDw7eqgmO1JQjubJLPC/bHvi4gDYmgMmVqV17Jry5
         /KBZy4sYDCYqK0JtJNpi+lowipDknLm0V2ihIoRIVDbnojxYAboMk2XAE/nHMmn0uvvo
         7BSZ5XS9V0AeDZnuPNIA+QJ1ljDlYtkqKF6FcVbO/WtLfQUXUYSY0ndCixr2w28jeNEP
         zQz0xGbZZQuHCWfuRR0N/ThiCWB5BzgjPRT09wp5zWNZc6x8PBwygwQCV06ZTgPHdx+u
         rEbU64OfDftizRQkXLBPPfUoivvuhTLkqOkT1p3+U/x39CAN9AnEDpB+cLjao9GgcNlN
         3UQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6-v6si4432439ybt.127.2018.11.27.19.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 19:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRquv-00064V-Ao
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 22:53:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqs6-00032d-PY
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqs2-0003sv-4p
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:42 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:24992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRqs1-0003qx-PC; Tue, 27 Nov 2018 22:50:38 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id AA7118E4E2C503F48D6A;
	Wed, 28 Nov 2018 11:50:35 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAS3nwSq058790;
	Wed, 28 Nov 2018 11:49:58 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112811501878-13417766 ;
	Wed, 28 Nov 2018 11:50:18 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Wed, 28 Nov 2018 20:12:52 +0800
Message-Id: <1543407172-16175-10-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-28 11:50:18,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-28 11:49:50,
	Serialize complete at 2018-11-28 11:49:50
X-MAIL: mse01.zte.com.cn wAS3nwSq058790
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V10 9/9]  pvpanic : update pvpanic document
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
X-TUID: Yn2ydt1MBQcJ

Add mmio support info in docs/specs/pvpanic.txt.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 docs/specs/pvpanic.txt | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index c7bbacc..b1beea3 100644
--- a/docs/specs/pvpanic.txt
+++ b/docs/specs/pvpanic.txt
@@ -1,14 +1,17 @@
 PVPANIC DEVICE
 ==============
 
-pvpanic device is a simulated ISA device, through which a guest panic
-event is sent to qemu, and a QMP event is generated. This allows
+pvpanic device is a simulated ISA/SYSBUS device, through which a guest
+panic event is sent to qemu, and a QMP event is generated. This allows
 management apps (e.g. libvirt) to be notified and respond to the event.
 
 The management app has the option of waiting for GUEST_PANICKED events,
 and/or polling for guest-panicked RunState, to learn when the pvpanic
 device has fired a panic event.
 
+The pvpanic device can be implemented as an ISA device (using IOPORT), 
+or, since qemu 4.0, as a SYSBUS device (using MMIO).
+
 ISA Interface
 -------------
 
@@ -19,6 +22,13 @@ Software should set only bits both itself and the device recognize.
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

