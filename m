Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5412291wrt;
        Mon, 26 Nov 2018 03:34:19 -0800 (PST)
X-Google-Smtp-Source: AJdET5cYSV+nIqw0RgyZ4ga5r6N5gGcxLlSxKvasBIToApuJzlt/ra+cEgcUphu1X9EITuJe/j0o
X-Received: by 2002:aed:3b25:: with SMTP id p34mr24874215qte.310.1543232058989;
        Mon, 26 Nov 2018 03:34:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543232058; cv=none;
        d=google.com; s=arc-20160816;
        b=fOsdQVkmZP8QWEcFxiEk6RH2HKfogYsGoqAnCJUdJIZFv3Carj5NfOQeIvKZ8CYMJS
         kZf0JgbCXTMBXgQpNxc1SR0TTMzKaQjJ/o5LnPXgUILhl6tIkegcQmy80G7vWg7rPrFQ
         YweVm/TeOfsJYxDP+tbBkJZBooYD8P+hHOXIK4GedPj+GQnP00ghV7bzhQg/DRkWNPH9
         b1v//7DqZWpgZBBolREWglXb1czgd4SIqSO/Ls9ca/cvYYgLJLlQqwf1RC+M70PTsIfW
         D5ZIvxUk9mlLYIFNUHeyZPPeP5gFN7Mof82qp0CovoRPFMpL2sHNwWETHdAevEkCxJSR
         J3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=rgsNek13KUEbJ+NZZbd22wPLf66wwZs0AN7Zn0GtErY=;
        b=Oe1MQO//Yr6QFKRSKrwt/3QeLOaVUIH1IIri3dQ6Nxnk//h5T0fpeelrQvbRudOo4E
         oq401wJyZa956ZXI6iCDX0VBsoH9EfVqekUb4AR0/mhzVv+k5MubYxQxt2Wh1uA6VkY2
         t2BoBYM8SifWxCz7tZvyErHX4T9eXIT0uGoMUvPAicCjwm7cBOoDF+8TIWxcIdEIv8y8
         ZJLiMdEBlgrg1YKPG0aAyxHejrHs0e5Vblf05wBf79WQN+htV2fZv3yzXvhu6wZk6hQs
         B92QEAqSsSfFo3S5iORN6NkOOHuQrSskLr88kB64b6EabrPMMSpYDuJPmOFCyi4OYHHR
         gFdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h13si32311qtb.233.2018.11.26.03.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 03:34:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRF9e-0000oS-9D
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 06:34:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8d-0000El-VK
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8c-0001vm-4Z
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:15 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:56510 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRF8Y-0001rI-Ch; Mon, 26 Nov 2018 06:33:12 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 848B752AAF40B43A8EEF;
	Mon, 26 Nov 2018 19:33:07 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAQBWxng031734;
	Mon, 26 Nov 2018 19:33:00 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112619330760-13057785 ;
	Mon, 26 Nov 2018 19:33:07 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 27 Nov 2018 03:55:59 +0800
Message-Id: <1543262162-6351-7-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-26 19:33:07,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-26 19:32:59,
	Serialize complete at 2018-11-26 19:32:59
X-MAIL: mse01.zte.com.cn wAQBWxng031734
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V9 6/9] hw/misc/pvpanic: add configure query
 interface
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
X-TUID: SWfSywlpzmbP

Add configure query interface for pvpanic-mmio.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 include/hw/misc/pvpanic.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index f1a05b2..2f0e9f4 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -28,4 +28,9 @@ static inline uint16_t pvpanic_port(void)
     return object_property_get_uint(o, PVPANIC_IOPORT_PROP, NULL);
 }
 
+static inline Object *pvpanic_mmio(void)
+{
+    return object_resolve_path_type("", TYPE_PVPANIC_MMIO, NULL);
+}
+
 #endif
-- 
1.8.3.1

