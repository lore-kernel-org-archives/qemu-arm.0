Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5940305lfp;
        Tue, 18 Feb 2020 01:46:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqxlHgHn+pc0NqkeuMHWDPXFFi2kOod6e4les1yENdcu3o+nPGTqPfgkjP6o3qfrhyIPF6i2
X-Received: by 2002:a05:620a:1656:: with SMTP id c22mr18619445qko.144.1582019165434;
        Tue, 18 Feb 2020 01:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019165; cv=none;
        d=google.com; s=arc-20160816;
        b=z+Oq59Qu0zx8Pq/Oasg7z6l/lfXRbFz8TdsUk3WACbph/bJVKbn7BePmg1pFXs1xiH
         eb0j++nIOZ7/qLARX01jx16mQNR4IoVgbIUI+8/IKl3r3cZU6PBBbLw8GT6Cu9eYxKp2
         IlxN3Imqt5qvNK8ES72AZczmG+daItgaQogfWtOOry6WZXk990RJrw/6w86CTS2WiyhV
         ArBRh6I7MY2LB7oWWxiq4B8gXSKK5VY7iUhQvsD3ZZ8duYFCiG/anW2To64yvWMunBNr
         56pmFgWaT5M4Tdkv2pse5qoCqK5C3HeikkEJ1KqU4uC9H4zqgoaE0Ek0hsb3wqA2sXxb
         rv8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Xoqi0ftXRFYJhu37T0Dgt5lu+ZSvSZSENltlLvBq3/Y=;
        b=t03EKjxdPEuCi5AWunMMWpN+zpGKEWb3U7o+4JbY2jjJBxN95kw6RDwbt1IHgIFSyP
         WEb1LTVGWDo6Gd9lzWxUy9+62XwE81kuqbPupUpWfwvHQwUIpoY9DBgzUuBcclMwQbFQ
         q/UOS93htqReO/LquYtpsV92xPUCJbFfQEPFtKm30632AaTMOzNBlxr3d64qKVMFGYEO
         FBOwBHggoRRK1omsE7gHTMOFqsiW26t2e5MRRWKONLbMR+9PpUR7fFMHR6p6xIT3H+st
         u8uSon+djHLBHg4NI7ExFTaQVLYpvxD0sp0LvOg9AVjzPrFiq8sYj5D1o+uz7Z+NBPCU
         ojQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Rnx875Tc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si1406839qto.189.2020.02.18.01.46.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:46:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Rnx875Tc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zS8-0004Xi-Tr
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43775)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQk-0002Bd-3Q
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQi-00069R-25
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47402
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQh-00069A-UD
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xoqi0ftXRFYJhu37T0Dgt5lu+ZSvSZSENltlLvBq3/Y=;
 b=Rnx875TctDJciB66R6ccgeN5tSUUcJBl95pMtVBnwFpia6JLv0UhwelitG2ULUfPVZ5tGZ
 m1V1brnG8TtnWsD32ZIrheB6Tp6l7pLjVLfa/SM7UrugthsjEe2BOV3OLlpicuyIgLpeXS
 P39ZthqJM//zEVbBfpiOolpwelK+BtY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-quU7eH5aOgadDkA2mIuqwA-1; Tue, 18 Feb 2020 04:44:33 -0500
Received: by mail-wm1-f69.google.com with SMTP id n17so797297wmk.1
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ro3XhYqIaHVGzILEuv36nU5CQfCJ3/xXhyZLIOGXLvI=;
 b=H1EDZ3UABJsdqBjspkYE9TtWsuzXNnT3BQiGinQJjV8GBLB9JB4vovd3kqnhR4iQug
 7SbrwIKEg0PkLUdK2I2GRFVVryd99t9UXBr/iu0ctVh2p6/Tg3XlUmVjnJGoxvJlVuQk
 KC8NBEP1wnCtdeAmTAM5KraMsv2Ch4wKtP3fXKVIN6i61Ng1OK9SghaDOKTrBlxnQyDT
 L9+s8+9pwpJNO2ioejMLxXJ41AQ5jmMA4NTp5Weva7SFk5uYRd83GmPGr7v22ja8AL0f
 CVUMwvVGSdDZ1QQOp5HgYD3SQvrxx3fDMQp9ECpKK+mrN5n99UBsPh10bbt2HQL78oHr
 /a2w==
X-Gm-Message-State: APjAAAXGidBBQM3UjlYJqzRa1djrLWIcwlS6e/SMLRPCt8Huzs1SXvfs
 1iJnW6+kYS9UktAqy3Z0iz1tw1sUHnC/D3b0KLfx4uo4w9rjR+fTf6gGIOIQYxWj01s0kS+bm2C
 Y6yfzYhgRSQjO
X-Received: by 2002:adf:ed09:: with SMTP id a9mr28611356wro.350.1582019071901; 
 Tue, 18 Feb 2020 01:44:31 -0800 (PST)
X-Received: by 2002:adf:ed09:: with SMTP id a9mr28611329wro.350.1582019071762; 
 Tue, 18 Feb 2020 01:44:31 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 13/13] contrib/rdmacm-mux: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:44:02 +0100
Message-Id: <20200218094402.26625-14-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: quU7eH5aOgadDkA2mIuqwA-1
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
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Shamir Rabinovitch <shamir.rabinovitch@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cgQw110yhB++

Fixes: a5d2f6f8773
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Shamir Rabinovitch <shamir.rabinovitch@oracle.com>
---
 contrib/rdmacm-mux/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index de53048f06..bd82abbad3 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -490,7 +490,7 @@ static int read_and_process(int fd)
=20
 static int accept_all(void)
 {
-    int fd, rc =3D 0;;
+    int fd, rc =3D 0;
=20
     pthread_rwlock_wrlock(&server.lock);
=20
--=20
2.21.1

