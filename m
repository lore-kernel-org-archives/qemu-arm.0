Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3048901wrt;
        Sat, 24 Nov 2018 00:21:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5d5xJesr06f1a9cO5uSRuuPvH5DcgeVSwI76K0N/MTn6dIujm2kQVNs87Z+iSGxSJozoc7s
X-Received: by 2002:a81:a8c8:: with SMTP id f191-v6mr20078419ywh.393.1543047662593;
        Sat, 24 Nov 2018 00:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543047662; cv=none;
        d=google.com; s=arc-20160816;
        b=JNfuAaQiT8bXvXeFLPKkB+LHkU5ckqpdh6lBuMEpxPl5O8hwwG6prSFW2DXJAN6cxY
         y7jYx3hkTaDPQKj8wilqpESeT2SjOpFNau/wE6EGORWvLM1IbryCGqQpIQ2W/CYQHYAb
         tPHkylYkxmsArCtzm1/PRJUHPQvkrkfiUWVjaiJdQPBPz56r/igYOLLu2WHGtJAhmooR
         /WDCORmuZNSb6kckJWDuQmts+W6LEvmE5QwwG9oizcS6eXzP9oz4fHsvJGwW8psAZVjd
         jxGxvwyA5zVexZMfut0n6C0429dD/J03hmzksFpV5w+iClfgf9XFAWTY3sYGAEQerFbx
         LVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=v4fs4qdjV+xjkqfsJBPsRDIuLOnVBtBsK4CsW/eNIsI=;
        b=XpHKRLfvG8X5uszrCqgQfazcB047R/xLq1iKh1k2ujVDyYkdO1u/paskCMiN8PC7CQ
         3VZ7UH7PfUcM0P6SzLUpfCMQkkpZcidBDyVHMZpL1mXHCK1nN51D/rWFtWHKdtmOXM4J
         qTSPMaxMl2k0gJaKSy0oew125pMYGCKR1jLAEadfvPQ1ruituGhcLOgWnDvtFo0cIe9t
         3XYrn+1COFydzTT6DTc98uXl3M2rBj8B8LCg32UjU8tRjLbGp6nKTjhappVhoHEWWp4R
         Xv2h5EzCR3JAzfSbS3fotDehxATW0v36WXlLBWO5Skn46ShfH+ZM5+KqK6+6mOEaYOkZ
         DA3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 204-v6si33174972ywf.99.2018.11.24.00.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:21:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTBV-0000DG-Tm
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:21:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTAq-00007J-RC
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:20:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQT47-0005rg-U8
	for qemu-devel@nongnu.org; Sat, 24 Nov 2018 03:13:24 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:40538 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQT46-0005kl-Ok; Sat, 24 Nov 2018 03:13:23 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id EE1877AE883F0AE0D273;
	Sat, 24 Nov 2018 16:13:08 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8D2oi023478;
	Sat, 24 Nov 2018 16:13:02 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416134372-12697210 ;
	Sat, 24 Nov 2018 16:13:43 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 00:34:30 +0800
Message-Id: <1543077273-16201-7-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:13:44,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:12:42,
	Serialize complete at 2018-11-24 16:12:42
X-MAIL: mse01.zte.com.cn wAO8D2oi023478
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-devel] [PATCH 07/10] hw/misc/pvpanic: add configure query
 interface
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
X-TUID: DEGDAkJ9AcVg

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

