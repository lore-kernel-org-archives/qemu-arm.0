Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp196190wrt;
        Fri, 11 Jan 2019 06:24:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4pBPOSu+94xb4LiZ3l+tYcGe7Noy3YwIpozxXP09fqUTquGJEcTE3MIxac5S6rAT5xZoMm
X-Received: by 2002:a1c:934b:: with SMTP id v72mr2627441wmd.5.1547216692271;
        Fri, 11 Jan 2019 06:24:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216692; cv=none;
        d=google.com; s=arc-20160816;
        b=UAxmIKWeuGhduxJndQLnJ7Hbr+EYSBXWQmi1sMY7pu6t05CMHy6GcGnl/Gl1DOx2fj
         ogsW1PoRvzLtEeZH2VrXi7roQTL7U9DYl0DLdfl0O19xyL2rAtS9hBps2QLpnxUR1VS5
         grwgSXu0zhMDdfrzk71Lg9xKGQ6EjYJO0dftpESUojRm6UZNT+v79r7Su0jhP04GwKYQ
         zDM6JeE3wPYyeQy7/hiuyYUqZLxonKTR7UOscA4GZeQDk7ls6tIGpeC4EH/PzJ1+l/zr
         v108IEchF1JT45v7y+Zm1S1S3xZ0/5G/emBCNGdKbLGn+LqVlqikbEshBznxAGrIqCqE
         VrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=D9GMZqtWaszFKo5qCsBNst2AcUK4kBo35LU5i/BECa4=;
        b=KAHgnQ6OOF9x1uh8o5sfwJoPaxywrXLNHS6aARgqufB+r752kNJdQrtwukPm6+xC42
         mH+3lCSEryTItiWFe19L4kfdQjOs1wm8iJ8lu2lpW2xwFV/fUUNa5i8S313Sj/xrQNmK
         +N8yVDuJPBtp7R/i310u1jAHTQlFHGl4cmktMQllojyhLMEvvFPmoYpGvTkDL8EOVzsg
         3+g2twLx6ue/N17n4EjAxez9ocq2DNLEJ3/Hjp+WGALCR7kIemUN3mVeqPF9PnfJ7W7o
         xREjC4PpEuXpm1lYhyQeQM3efi3/h2ZCYHcTGDkhF+f1kQEmaJLiABFSwRDvYPutW6+g
         mWTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j123si13369284wmb.138.2019.01.11.06.24.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:24:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxjv-0002ch-9c
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxe6-0005cP-3o
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:18:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxVA-0000WA-9f
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:09:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxV8-0008BJ-Dc; Fri, 11 Jan 2019 09:09:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8323C04BE18;
	Fri, 11 Jan 2019 14:09:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB45F5D6AA;
	Fri, 11 Jan 2019 14:09:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:43 +0100
Message-Id: <20190111140857.4211-2-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 11 Jan 2019 14:09:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 01/15] hw/input/ps2: Remove PS2State from
 "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c56D6MAMXEDZ

PS2State is only used in "hw/input/ps2.h", there is no
need to expose it via "qemu/typedefs.h".

To clean "qemu/typedefs.h", move the forward declaration
to "hw/input/ps2.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/input/ps2.h  | 2 ++
 include/qemu/typedefs.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 213aa16aa3..b60455d4f6 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -31,6 +31,8 @@
 #define PS2_MOUSE_BUTTON_SIDE   0x08
 #define PS2_MOUSE_BUTTON_EXTRA  0x10
=20
+typedef struct PS2State PS2State;
+
 /* ps2.c */
 void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg);
 void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg);
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 741935fe36..28a8b9e7c2 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -83,7 +83,6 @@ typedef struct PixelFormat PixelFormat;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
 typedef struct Property Property;
 typedef struct PropertyInfo PropertyInfo;
-typedef struct PS2State PS2State;
 typedef struct QBool QBool;
 typedef struct QDict QDict;
 typedef struct QEMUBH QEMUBH;
--=20
2.17.2

