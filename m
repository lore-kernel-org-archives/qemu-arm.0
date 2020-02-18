Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5944166lfp;
        Tue, 18 Feb 2020 01:51:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNOWkCEy81hnx9zD0U9SvV6PT4tQsR/yh4dAIQHtRdi1oMtWuTMrvNcuzY4niGNym7vZvA
X-Received: by 2002:a05:620a:8d6:: with SMTP id z22mr16474564qkz.420.1582019489249;
        Tue, 18 Feb 2020 01:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019489; cv=none;
        d=google.com; s=arc-20160816;
        b=m2pdfD/0hPmiC9SSvpSIG4fR9lBYiYKzNceKV//qv6LyRyR5+RkTNA6IyT4g+4IXEo
         vvbKUc9hxxEe1syUnZg6sogE9PWQ8epF6JaWZMDsQCxFgIr+j7Xf78DDLYenARHxceCa
         8MSH7nRtJ+mX7DgCDQ1we2R7S1CE+aMtOQ2zhyGDIAab13mJMSX1i/hmiX0TeFIhgBhz
         3K+4ae2xGtp3R5gaG/ndOxf1jQAWuWoPhgeURPAN8cpwwjDfSiqVfxRbONPxzcQG6SR3
         evDCvYnWhhDUzDATWtTaeMEoP5wgSrcZvQIhgMvzuX5sv1PNjBeFC00PhwEWPdGOEUG+
         PEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UPePaRqkaWNyhfXeO+GdlIKEGlxMZTPmi+n7OlsW4E8=;
        b=M0S3PtA1Kqy7i9qOMVl+duX0J6q7I/2njBHGIPV39DzukA/61Kfkr/wnfKTaHqCb1C
         MYVZkH3Jw/achXXnDbo7L9Ameab2XsMQ03oiJ2CzUecVOa1Deglkk5tcl32Sri89xZvp
         vRWcYR1K5LhPuetnUBZrCcC7eXf3ozhR0eJG+gE6wAlJbpOmhktIdHoVOe8ET63H1tic
         X3IcPApdiitb/yT2nO8E7j8FPkIJfmNcAjw7o14lIZgd1fIVVhTaezZbfiRffJh7Z6iC
         ABsWX5brL+XukwB3HWwtKUjoPSRmWStcN3X4tdCZmThOxMimiega9SnRYUpRlPU/os66
         O8nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ids7fY6r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15si1503232qtc.170.2020.02.18.01.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ids7fY6r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zXM-0004sp-NN
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQU-0001Sv-Ds
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQT-0005vh-BT
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:22 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50644
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQT-0005vL-5n
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPePaRqkaWNyhfXeO+GdlIKEGlxMZTPmi+n7OlsW4E8=;
 b=ids7fY6rA5BpE8PMb1nylvWHocjAcJUUzUdXfe1hXx8R+/E+dwnljiy14ZxEXnJe1S3Xnm
 +xQWYnQmjo6z6FMHJRFPeSMgBRY4vZ/MJmrTRSqjy/7ogZNycgpwlAYa9iB0wPAGA/V36S
 vtQCtCSghX37n5I8xUo9DZ4lRXDu9SI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-zEOuAuP6Of2m8ovE0aISww-1; Tue, 18 Feb 2020 04:44:19 -0500
Received: by mail-wm1-f71.google.com with SMTP id 7so783781wmf.9
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:44:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y3Lefu65TV2Zn/tMAo2R8DrtAEmfr+gqWeC3XzYh9go=;
 b=YEV8LHmNbYLP84oKdqxcEfng6h3ZXJN6FBHPNhdBW8jHtA/m0e/zziUOVWxGiYithX
 orrDjkHm1/kpSHSZEW4GQFGTuc58bF7eit3nIJUQ8rbtfFX3RVMCOpB6Bqb8lZ38upJz
 zZVtCoC6n4aXfnqg43XkKHnjsSLthcMlz87Hq5oGB+vrpGojd2vnyxUj1w+rZM+ZNPkE
 7q4Qj+pdZhMqSPq0d0rwYKLTL90wrMzKGyisUzO3w3ye2YUJY5KNqE/QyuGqM5uOYyUC
 QCCcHscNIlBJcw9qgkzExfLSmO4u9eD7X9QC78HF1iLmAckHmrDSL9blojna55kE3onE
 J4mA==
X-Gm-Message-State: APjAAAVVtDWfUC8MOV+vfS/rj1zeX4br3IuhRKk4WovLZ7JqJs6q2XqW
 35Wci9aV7WzkKTwYJm5M8ivevx5ytgM/v0cOckOUqohme5mAZfUyibT7nywyearL04vgoTSx58X
 ycvICwoe+WMnY
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr2131165wmc.52.1582019057869; 
 Tue, 18 Feb 2020 01:44:17 -0800 (PST)
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr2131136wmc.52.1582019057681; 
 Tue, 18 Feb 2020 01:44:17 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 06/13] hw/m68k/next-cube: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:55 +0100
Message-Id: <20200218094402.26625-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: zEOuAuP6Of2m8ovE0aISww-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lpw8WOxHgZRT

Fixes: 956a78118bf
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/m68k/next-cube.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index e5343348d0..350c6fec78 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -734,7 +734,7 @@ void next_irq(void *opaque, int number, int level)
     switch (number) {
     /* level 3 - floppy, kbd/mouse, power, ether rx/tx, scsi, clock */
     case NEXT_FD_I:
-        shift =3D 7;;
+        shift =3D 7;
         break;
     case NEXT_KBD_I:
         shift =3D 3;
--=20
2.21.1

