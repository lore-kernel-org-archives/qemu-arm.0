Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5941307lfp;
        Tue, 18 Feb 2020 01:47:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqyU1VR3Uk7p2GkwrXa08KaPoWHSST1UTvAUXTBf43GQxZr8aqUEoX6Gk2Pp96Ot5csj5AZT
X-Received: by 2002:a05:620a:662:: with SMTP id a2mr18716402qkh.329.1582019243307;
        Tue, 18 Feb 2020 01:47:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019243; cv=none;
        d=google.com; s=arc-20160816;
        b=cnbkVswAVZOircCYjycckeIW4Xqm5CN1YqdeGKi2gkt5cL2Ijrh3Uyb0ptk83IP4es
         hyhKr32inD8ilJJEWKd8Ow6aP9T7lONxgCMs5iRh3Y69W0NEYszCSMhvKp2frSfgz9H6
         R79TrnUQijpOh0k7MCvwX5Vl9VVmTO86BBazFQyhGOryQDod8BSTG5WjvaB3P6OllTIP
         K/x28m6fFhi2Mh0cSE9rzxWznm+ZtCi1C070iWdgL8HwRtTbW6ud1zMo9GqRvIQI9jNf
         zZ8jEJSff3xqEn5PKjDy3VooJWNVLfkcNDmDy0to01f+r31v4pFgQCh7c5FKjBNVyGkB
         bOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=twD42LsJdxtk70mtkC2JiuCyIG9SZpU8nshsRUT8WmY=;
        b=mdIt452phLcO5im5X5EwrX6r45CYNEAY2sBK9dL+mneiTLqew7z4heVh0cpXHOvCHN
         DV+oNi38i/bJDNoZtx7EThnNydzYUtYmEnH/jHkDi0RhBJrdWUvCc2dG7GUhApuGeK1e
         uiz0k90QEn1CXFHCJs7H4WulrE22Fobs4sIYurHdpbCMAb6PrinWwMIrRRRnopvzXRyz
         Z5TnaPBWCC6x4vPidSI3e0PSTw4PttoNrtK0iV/BaHcEQ+/qOMdEcWnPsj5NeKJ1Yo7E
         LA/a4DQ+O35jw2igj37IXUH1dQHcI7OryCs/1IGEArqCfyrqL9w3h41ZuP+snsyB4ILq
         KzLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ep23fMk8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16si1677208qkj.46.2020.02.18.01.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:47:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ep23fMk8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zTO-0005Jd-OU
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43373)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQT-0001QQ-JG
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:44:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQS-0005vA-Ia
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:44:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31829
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQS-0005un-FE
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twD42LsJdxtk70mtkC2JiuCyIG9SZpU8nshsRUT8WmY=;
 b=Ep23fMk8v2ext4p6Maj/ihjBjmpl4o8y7/BJqNO2lP/MiIRWhSWxiu9SpAOPeijrazEoWd
 w+gK6+j8AV9p26HOdWhe0vW4x6kCzsVpaBwmORR5m2cJOUFs/8fzbFaHUCZs2UA+g+1rhf
 9vmMBoqLWYBp2Ij5OTFZsAoxPjVcnDQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-nplV5Z1BP0KsmYq1dUOQyw-1; Tue, 18 Feb 2020 04:44:15 -0500
Received: by mail-wr1-f72.google.com with SMTP id m15so10436288wrs.22
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 01:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhIk9nB8PMGzSNjXgBFB3gJKa0gAiyLYRyAtuExQk+A=;
 b=F5r8q6c93ZvABrCWYOEWFkT/0E4/qrCpYpG2U0k3H/CrHBDCynYBBd7Qgy4TUO7TB/
 vXS7TeGrY6JOLOThyRiF3xnutT6g7266uHMM/He1Z4oX9yRt0R7XBauDVHMExvmXAnzj
 WDSd7eXLEGpimHhv8BGbZ9lpSRKIDU9033a5N0/uJFQhBWXwox4GTu2fDQePE8FwydgJ
 g73KQ2wHiV6MhDaP74bty7ecoV+9Y48QQ8I/V3LZs1sMIkNbnERjFqBALHihf7gFr4+x
 vYmk9v4I+p0AQYTzUHjOJvQyvmIxNQj2Icwjci+ha18w+UReZ9bxZP7J2qnqeAm7qu0D
 IIbg==
X-Gm-Message-State: APjAAAUIQ2yGprYwokm9hgLpApiWDWeAH8wFlaSBIKSGG1CYdyqdUC2t
 rjZun8N39k5o7ndBXMH8/uL+QetVh5yKAr3aYiuDH4ZXgRf7TvLuhRBo1WO1/oWnLG6WgWs0vBU
 YzXNwnYE87tVrZOU=
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr2157064wmd.77.1582019053904; 
 Tue, 18 Feb 2020 01:44:13 -0800 (PST)
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr2157015wmd.77.1582019053713; 
 Tue, 18 Feb 2020 01:44:13 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 04/13] block/io_uring: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:53 +0100
Message-Id: <20200218094402.26625-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: nplV5Z1BP0KsmYq1dUOQyw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cwRbILt5kCcM

Fixes: 6663a0a3376
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Stefano Garzarella <sgarzare@redhat.com>
---
 block/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 56892fd1ab..a3142ca989 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -187,7 +187,7 @@ static void luring_process_completions(LuringState *s)
                     ret =3D 0;
                 }
             } else {
-                ret =3D -ENOSPC;;
+                ret =3D -ENOSPC;
             }
         }
 end:
--=20
2.21.1

