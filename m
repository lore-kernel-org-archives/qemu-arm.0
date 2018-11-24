Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3067446wrt;
        Sat, 24 Nov 2018 00:46:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5fhsDiY4YrK2hmt5aRLP72R+6R0rMsgb2iZ3vt8YggaD6fDD7K7QhdXrW8hS6RgRjVn1CS9
X-Received: by 2002:a81:7587:: with SMTP id q129mr19947228ywc.182.1543049207936;
        Sat, 24 Nov 2018 00:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543049207; cv=none;
        d=google.com; s=arc-20160816;
        b=YEjojJ8ohGn/D07mRP2Ng+iT7ekqmSkwq97wyL+N1c1YyI+NJva3lj5LwXK4eg2muW
         rw1ilE6WwPBzII1gUyF76AZugq+CO2ZwpDb++dm5a5YjGvG2tI1XDh3tU29EiPwd6j+X
         71TjaMksCTAmDugiIbvuIz4VPa/s35FfbSB+w2svEkn79Lkzl9UxcGx3/EimAd5lkjr+
         /oEQRQJgiido4/aoDfvjmCKCnBpbSpcHDGg+uMPtm6IrGd5q1XzR5Nan6hvAeIq3gizG
         wdEIqX2hMWnPlQEIawZnHlfUNYS17vy6x5lPwoPArT+xLprrX/ioLMqUNJ+1ZncGn/4j
         cu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=v4fs4qdjV+xjkqfsJBPsRDIuLOnVBtBsK4CsW/eNIsI=;
        b=KUX16tObTEjbQ4NObN2OwUpq0HWQXycYtRsejRzmUMy5AWcfoa4jprxBXzvELLwzm5
         4x3XaHhO91qdWmAFEtjHNX4pajE762UkoIyfQY1KJM/DE6EpZNqJhfNJRTH+jL1Mq0/V
         YaFtJD0CcCqKRvhaZGaN6PVzpWiIaqjqWpltSyWuAFKnmtAilJQQ4qwMoMp7EeoYEy/+
         Gq6xrbo1OTjnsZXtAQQ9wuFw9EpsO2hl0WGJO6UVCatYDhapsg+j1tvraVQDdOC8y5ux
         DNwoqe2+Xf7iE9cizPI69QnIqQ2LGpTX1WeEpW2mqJu077OPvYieJWPuG2EyTWovnoHM
         AN7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u12si17484644ywe.7.2018.11.24.00.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTaR-00084g-BV
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:46:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTUH-0002j7-Oe
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:40:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTSc-0000K6-27
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:38:42 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:55528 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQTSb-0000Gh-NI; Sat, 24 Nov 2018 03:38:41 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id C30077003FFD56EC1482;
	Sat, 24 Nov 2018 16:38:39 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8cVOY035046;
	Sat, 24 Nov 2018 16:38:31 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416391732-12702405 ;
	Sat, 24 Nov 2018 16:39:17 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 01:00:18 +0800
Message-Id: <1543078821-16636-8-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:39:17,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:38:11,
	Serialize complete at 2018-11-24 16:38:11
X-MAIL: mse01.zte.com.cn wAO8cVOY035046
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V8 07/10] hw/misc/pvpanic: add configure query
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
X-TUID: Q4w0dqNdWrK7

Add configure query interface for pvpanic-mmio.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 include/hw/misc/pvpanic.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index 066c707..1f20775 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -57,4 +57,8 @@ static inline uint16_t pvpanic_port(void)
     return object_property_get_uint(o, PVPANIC_IOPORT_PROP, NULL);
 }
 
+static inline Object *pvpanic_mmio(void)
+{
+    return object_resolve_path_type("", TYPE_PVPANIC_MMIO, NULL);
+}
 #endif
-- 
1.8.3.1

