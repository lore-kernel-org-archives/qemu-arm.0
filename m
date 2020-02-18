Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5942144lfp;
        Tue, 18 Feb 2020 01:48:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxRQFiegEbHtUhlW5IXh9eyP7VhTBSMEIwlPUEiR7Z1/6iE15tRXeh2aQrQSCGhjClttyec
X-Received: by 2002:ac8:60d5:: with SMTP id i21mr16682928qtm.341.1582019320558;
        Tue, 18 Feb 2020 01:48:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019320; cv=none;
        d=google.com; s=arc-20160816;
        b=WoM26UR07w2eFDdh7xmIgQdcIyZhgdJO447kkBNF9nqU8Qi7WjPwEv3MEcjPblsuJa
         WtN83b+2HmNbKuFG424Fb4z9OjCxh0Y8US+U8VJcqo9zAcZXufBBSAod0irdevQoMg9b
         q3XLnusnP/bFT9TmziI3JyK1d+5jif/LJCKYeuQUBg8vz9r31kk1FWDhrOZ/VdHllz18
         O+fKoAxKh4bqJZu58azIVyH4OTdzShaR2+bWIz+2K3lPJzOfbeGABx+FUToQx9GTPgY8
         VvzbivXjOGonos5CS+ZEd0oD9ctBIbpLBXFs2JiwipgE6PRSeqaNd/o+qb9v9+lA58YH
         +XHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aFwSqFOqQSCSww1xvrmrTjGR2tB5knkZUpnBFKdTlOc=;
        b=s2GTh+0d6DY0zXRVJsZvJ44/YRQhD9GwJUpr9nmGsrUUTLes3ecJPtlP0FS0PXftXX
         2LdN1CnEJuMl16TohHZr+LvckMRQz8mGTfo42ggItDpfAaKNWellT0iquw7rp/KCbYuB
         BmT8JTzuI6xH0NeYjH8QCf/AF6sG73bXUvutebgS7F02TCrUBRVCdwsEMQnxqMMWay8p
         1zsr7x9mFL4Xo92SpUqDEejHzZFoGgdH3KZlZBZsLEEvc96yhGKP8csPDWDi/zjSsgf9
         brfI71dhS5ctbDXORU5TY5CkeLaSYDypApyzvDfE2j+Xz7i0B9arQ0x2JGQj/E6Kae0E
         bPYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SM7tdCiH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si1657004qka.286.2020.02.18.01.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:48:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SM7tdCiH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zUe-0007zL-0c
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43487)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQY-0001gw-Fn
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQX-0005yx-C4
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43315
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQX-0005yo-8g
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFwSqFOqQSCSww1xvrmrTjGR2tB5knkZUpnBFKdTlOc=;
 b=SM7tdCiHCG8cBtgPR2qrbm9ubVOsuMpjxF/6sS9dFhevdkckNExMedvCs2ceGKKIABIzOi
 DYRhc/hy5e+KkRD7V9raab1Oe8JHWvhGulS4+jaUKzhEIaxZZ6xBZE4oW8C7iRKCTSDOKr
 zqE0sqISNHmuXIow85VJVM7pXSaaPAs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-BMMBU0wrM4eXuIQ7T_4OsQ-1; Tue, 18 Feb 2020 04:44:21 -0500
Received: by mail-wm1-f69.google.com with SMTP id y125so691332wmg.1
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EdIcfUQ/U2hHF17TjP9T3eQu8UrcSLlBv6lIHRbb1ng=;
 b=dLXYKyxiowvWCVIRt21MESUZuKdfmfmMdTfft3wjxbPvnxzYrzjH+Dfp0Sq2kp/Ulu
 6sh+SQxM3VTtmUOhZv3AcQjC5MNINl+QmtgMWZDhYFGOIlMRgrQlRNzymoLYLOKK//mm
 9Q665DwguE5b38UT+GYR+SuNROM9fEHxV1vYv1FJic22xaPZjjX2wKI1Fuej/2Qv9Zw/
 0KF1wyyLf6a3IJECTOgbKFQUYpnM7/mbdNjNagWHf8H5MdDJ6MFle1HdTMj9ALAqlQlI
 tzFBoyuN7D++IK1/wd8Q0L2T6Ps4GwJvyE4ie9MZ40SHrqAsPxfDjkHQTh6TQzMPXPh5
 YMtA==
X-Gm-Message-State: APjAAAXSpmqxYMD2+qhUtWJBEmu3pwXJ+ylIZKJDz7niJpkdlzcnrU+d
 CWZucxrUdvw1V7dEGnzyatDncMSKTBxYt7Zaoj4avT5xl0gK5JnrHSUMD0v/F21ZPa+Yl2ZjeGn
 PFzVuwxMeHFGT
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr2223560wmk.68.1582019059941; 
 Tue, 18 Feb 2020 01:44:19 -0800 (PST)
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr2223512wmk.68.1582019059684; 
 Tue, 18 Feb 2020 01:44:19 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 07/13] hw/scsi/esp: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:56 +0100
Message-Id: <20200218094402.26625-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: BMMBU0wrM4eXuIQ7T_4OsQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
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
X-TUID: RmBju9YT00F/

Fixes: 74d71ea16bc
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index f8fc30cccb..405f8b7cbc 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -293,7 +293,7 @@ static void handle_satn_stop(ESPState *s)
         s->dma_cb =3D handle_satn_stop;
         return;
     }
-    s->pdma_cb =3D satn_stop_pdma_cb;;
+    s->pdma_cb =3D satn_stop_pdma_cb;
     s->cmdlen =3D get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
     if (s->cmdlen) {
         trace_esp_handle_satn_stop(s->cmdlen);
--=20
2.21.1

