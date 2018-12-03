Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6647466wrt;
        Mon, 3 Dec 2018 03:05:25 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W1b2CT3Kqa0J74GFf5nHEps+RdSklt6BMjRQFEtC9Fa8wqF6YarWp+v9sEABn0DtGpZf3U
X-Received: by 2002:a81:4ed7:: with SMTP id c206mr14967389ywb.207.1543835125695;
        Mon, 03 Dec 2018 03:05:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543835125; cv=none;
        d=google.com; s=arc-20160816;
        b=WvXNlgzNHJWf44Z2CLuY5yq3jt43lBLl7nPPBBwnTeRbKngLls2MpjO63yAALvviMi
         XhllPZUcrkicty/Ikx9NLBzy6n3fM203j6AqdmUhtUAznTq3AU0lDgBhc0WkupaYh+78
         F4H/7Gwmjwl+LN0dwAwS3BYZZLcvh87fxljcwkx0aBAGc6VXa0hOqyGxsOD9Uht+qvM/
         XbBrHszKsYMxEtJwT1eskKkchNh3a7k8UCc8jvkUehVX6IgfzLwFX3wjJrnUy4xM1i9r
         0PcfkED+8va4FGDAwMEFv1sqhCKaPS4NxuOEk87EL50NU05QYsKVatGrPbTYQJVFysZD
         x38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=gc7+mi9Qktz05DEAZwPjKquSf8V4WYlZERcL+GM/9uc=;
        b=oQAN4EpUIzf71VjYqWLmUEQSfnih6jK7XjrzRocje0P3qxDFsxRJ9X14DrOWhZIL7h
         DFClwH44n23US9d8xiJm6ijtvEXqPJHMMRNXFEY4MfOwPBfaKpbq91vbklrcFAfQQWMH
         bWVfNHQn8/N9LfAdBe75wMsEIQRdFqHJEoQjKKjDAJmhfkhJ7DWaUzEeuib47IhmzsfV
         dDhPYgG4d0GIt2y/WkVHsg/QB8RP2mGTpBsqDhjEp0XJ6DiXPsYyrbCKtoav2ivIJbqU
         KUKALktLu31lhpsGieJUfQs7OK+mF1hf42Ka5TdKqm6MXSXnj1xCUt4RWD5G3gQXjUVo
         JY8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si1141290ybb.341.2018.12.03.03.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:05:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTm2X-0004gq-34
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:05:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1g-00045d-Ag
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gTm1d-0002bW-IH
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:04:32 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:58706 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gTm1d-0002ZM-7g; Mon, 03 Dec 2018 06:04:29 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 54EBC3E2DAC5772974F7;
	Mon,  3 Dec 2018 19:04:27 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB3B4FmW097986;
	Mon, 3 Dec 2018 19:04:15 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120319042307-14451350 ;
	Mon, 3 Dec 2018 19:04:23 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 4 Dec 2018 03:26:49 +0800
Message-Id: <1543865209-50994-9-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-03 19:04:23,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-03 19:04:15,
	Serialize complete at 2018-12-03 19:04:15
X-MAIL: mse01.zte.com.cn wB3B4FmW097986
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V11 8/8]  pvpanic : update pvpanic document
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
X-TUID: iPUA+UTobAn4

Add mmio support info in docs/specs/pvpanic.txt.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 docs/specs/pvpanic.txt | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index c7bbacc..994f080 100644
--- a/docs/specs/pvpanic.txt
+++ b/docs/specs/pvpanic.txt
@@ -1,7 +1,7 @@
 PVPANIC DEVICE
 ==============
 
-pvpanic device is a simulated ISA device, through which a guest panic
+pvpanic device is a simulated device, through which a guest panic
 event is sent to qemu, and a QMP event is generated. This allows
 management apps (e.g. libvirt) to be notified and respond to the event.
 
@@ -9,6 +9,9 @@ The management app has the option of waiting for GUEST_PANICKED events,
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
+[0x9070000, 0x9070001], where currently only the first byte is used.
+
 ACPI Interface
 --------------
 
-- 
1.8.3.1

