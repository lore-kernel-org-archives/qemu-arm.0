Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp550831wrt;
        Tue, 27 Nov 2018 19:54:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wsfm+TrLUSIa5CkHoxTmee+eXjEI+Ae2IJZ2p2rVfXTRDvL3I6DQWNxEeZhG1l29TluXqx
X-Received: by 2002:a81:b653:: with SMTP id h19mr27379505ywk.170.1543377249513;
        Tue, 27 Nov 2018 19:54:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543377249; cv=none;
        d=google.com; s=arc-20160816;
        b=GqQiXPbG4nc1mcAviyi2tXblDRqlf99JxCv/5aYSGpPAZnENBX/uewLiQrKfLZ3OJy
         +PQOgj0iAzdVrEUWhV/ARuL2wtHY5wkde9XZc1SMqJIW31/M8LlFRbS7pq13ROtoYmsC
         y0j1XwqteNcfqzEf2aPSAS3swHfMdeOigBYuurmU+DTy+psErlF2CJFQy71AlnoejMZL
         blv8Zkzm8ESJwKymmSrjBkXCVqjI7CSwsEmS1JFrkgt6Lxy3Atb6r8pnOp4Tc28rpKk0
         vXu0suvVDOtsSSC7qzL8gAdJ0wJV0MlDU33iaZWSQTT2ZMCQ1LVT3L/swbQP+gqA7Rbc
         9jkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=WkJVD5SnwE3SQLAVBDlksD8Dvr1gFMBXvx7TKIsNtxc=;
        b=qzBEmDL/SErD5sKJ6yP7HQzgC91FsZeuK0axvR7sQR67VtfRgI6q0Z7II4LGvAIhq4
         5exZuhcbjGrSDbQpsq49nxJYPtJPPAZz40Vmt+rkucv/DFHhlOQdbwqxp8D4VtGUp7Pa
         +F60+Jj+62SLNsqFbGHvxFpNoN/j6y3hoFIDun0lOh54ftLPRAftXOj1ytx9kJ4UEbM/
         7CQOupWKGVk0O5JAKmcJ2Ng16NF9Z4kTez0Lxh8J7XDtNpoVr5HBQPV0ygYt/sH7nBSL
         69YkScBvhWj0vHqVoW2Q8SPv2T+nvEDFAazdzFaZoY8K1wfQc4mXDimjL5B6G/q3DY6X
         dKQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u18-v6si3994319ybm.46.2018.11.27.19.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 19:54:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRqvQ-0006fu-Sy
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 22:54:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqs6-00032O-2i
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqs1-0003sg-Vm
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 22:50:42 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:34376 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRqs1-0003qz-Kv; Tue, 27 Nov 2018 22:50:37 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id ACEBC2C7E051E9B30433;
	Wed, 28 Nov 2018 11:50:35 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAS3ntjo058717;
	Wed, 28 Nov 2018 11:49:55 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112811501529-13417756 ;
	Wed, 28 Nov 2018 11:50:15 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Wed, 28 Nov 2018 20:12:49 +0800
Message-Id: <1543407172-16175-7-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-28 11:50:15,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-28 11:49:47,
	Serialize complete at 2018-11-28 11:49:47
X-MAIL: mse01.zte.com.cn wAS3ntjo058717
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V10 6/9] hw/misc/pvpanic: add configure query
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
X-TUID: bqRgW582j8WF

Add configure query interface for pvpanic-mmio.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 include/hw/misc/pvpanic.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index f1a05b2..dc042cf 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -2,10 +2,12 @@
  * QEMU simulated pvpanic device.
  *
  * Copyright Fujitsu, Corp. 2013
+ * Copyright ZTE Ltd. 2018
  *
  * Authors:
  *     Wen Congyang <wency@cn.fujitsu.com>
  *     Hu Tao <hutao@cn.fujitsu.com>
+ *     Peng Hao <peng.hao2@zte.com.cn>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -28,4 +30,9 @@ static inline uint16_t pvpanic_port(void)
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

