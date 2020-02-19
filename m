Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp320361lfp;
        Wed, 19 Feb 2020 02:21:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQNEImFbLuvwv0vKT8UK8npYSQ3escpcd4Jxv6H20UQp7eb/79ohploYrMAjB3qRcuw+69
X-Received: by 2002:a37:5347:: with SMTP id h68mr22266070qkb.393.1582107717186;
        Wed, 19 Feb 2020 02:21:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582107717; cv=none;
        d=google.com; s=arc-20160816;
        b=ZnOK/mF6MuBNfCf+rA51A7FsQPZtRtcQRnrRd12OghRlwsIiRn+KWcBBaxp8lUSHjs
         25owt0uv6n8W+kpp/zH1YvQRoL+zn+GtsvHUCnGzTicw2qXsdwyk3rgWYJu1bh7BDZB2
         iFv1D8qSuAtdGwyLR10RgwUb9tYO+ZDAxlK6q7npox6VClHwnu4L4Bs6bHkN4BIo3eeT
         xqR59cR/RFbUdkKJ0qWOFF1mi9tWYxu1HHV11+Gnrvddk9eiEMfxwLIxUUulkqRbFDiR
         tH7dyf7ytkyYk49faoi6iGh7YFHlLqsHWFiFbvZHZ5zs8nkxJ32hpSFvMeSDVEKSyc5j
         DsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=grBQC5/EvhSORMSNxmKhXJGIMsWyQl9TMMIasUEP9aM=;
        b=TKTKntCS/a/Oc0SSnbZ2M8bdi04GmsNjCL+HIzwnEuyBJ2FfauUuVMHdl6MaKjfusz
         WqkV7nCK65S7dGXm4FYwKk0DAyEVwcDcQWKAnoeGknAke+HyJ0ByZFAPGEvAsGwRjWtD
         o5KfDAZMqPxC2FNNKI52vbHE2omPhPS8detM8h5CpnezY3smjZun94NekI7uZc2dh2j5
         N4tdBvbL56fnhWKUwBod0/4N/srUFQk5UreRBFIQQeX0bc2pP+NtFU+fDJomkLdvywsL
         2Ll0/u9pJ4KyESIZ2oWrtQq6DVKkXxangK6xS2cKmt/Ho/6ZFwKaUKX8KbFCVoYL3IBQ
         zhag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a198si669057qkb.38.2020.02.19.02.21.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:21:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MUO-000406-Gx
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPn-0003dx-7O
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 05:17:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPl-0005H0-Hg
 for qemu-arm@nongnu.org; Wed, 19 Feb 2020 05:17:10 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:47379)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPk-0005Cd-Fh; Wed, 19 Feb 2020 05:17:08 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MeTD8-1jcbIM37AK-00aUpn; Wed, 19 Feb 2020 11:16:35 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/17] hw/vfio/display: Remove superfluous semicolon
Date: Wed, 19 Feb 2020 11:16:03 +0100
Message-Id: <20200219101612.1033925-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zTkAU/Y8DhwEahyBf+WI8UH2+PM9/HQTnyCeb+8pYDSKsPZVc8R
 UdeMGG5+v8QDNdoLf8CpwFv7IWZPpPW437QYyWwINbsgHsv/vzz7OQQFxbkmgpySroP32k5
 tTIb57Kebi2NxYeHdZXn/Pgq7YOxe3lbvfNKd/Rk/vdZSwJX70BZBvZvVHEb/dQYktbC/LO
 EQoYavwKZwfRddx39/FUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CMWDfnhlzHo=:Fk6+tD8YC2b79OdA3FSIAY
 Qr9u7JHF/1bwjF4205hQIME/Kv1eSl1wTsDsPprrhvzmsYT5QLCQuNjR/gYNj/s8dl+Gggf6y
 gYJxb/iR0BDR2gObls55LSi3NGnHXpXX+GFwvczFvqtJrc6zjTTjcKivk+D+Ul65PhDBqxDFe
 K1pPT7Q95IFuvbL2X0zwiA0KOAAoprPdktxYPalrbuJ9XMhLjrJFvswQt6AbPVBjQgyaPc+qb
 tMUidHOVAyGqmA8nxjQqAn11RNlnoFhBEjDTjkqVKkFYXAqZWMz5pLZlMxVzZiKHUhlb7hBON
 j9mTS+Hdqdg3tAfAJxYj6+v+kEu2ijAJJHJZe/ZJIjS2ZRkpFqwr8IIZszUcB46Mqhz6ryGsZ
 xsZBuSQPui+iIF6pcWESPZRDAuWHROE0kpKoVryX1+s5jIBJ7X/nRMZRizP5xt83EhSATRy4V
 u8YKu28FC0zRUmkhCT1MeU8+BQhO1kWnC7N8SgSTKKkGlRknNfZC/DWs3PjLfx6oymwMtkzwp
 fa4VNj5zGIqvhnGcIkB11deuu8ggOOyLiTpvz2IX376ZCyKps3EHQgSkGRJeuftB/z3Drz2rV
 O33qqdZLtdhFZEfJP8NDCFwN+ykNbysnM4G8p42R/Cc+RdUnhdAlWd5+cyUBL/0jnGHcPFJnM
 MbziFqHCsvsUvpC6ZW3eXV1yZSaj72UF5CZa6Mgwc6bkgBrYK+G3fQcNAnDyflzoa3VlrS9Fg
 PPyq38I0xtNbA4QDIVNtEyzm0xBTd02LDTsxUt4Y1uejXw8oUTlFMg1TJ8yyeyu6jC2RmdMSy
 3UrePCuTW9EvMlR/yo9enR/J5PLAGytjfO6P3L03rfVhtRYPEou/OdBrbWUu5sLx2Hx981P
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
 Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-trivial@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HdATbKfcRfuP

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: 8b818e059bf
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-9-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/vfio/display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index a5a608c5b226..f4977c66e1b5 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -287,7 +287,7 @@ static void vfio_display_dmabuf_update(void *opaque)
     VFIOPCIDevice *vdev = opaque;
     VFIODisplay *dpy = vdev->dpy;
     VFIODMABuf *primary, *cursor;
-    bool free_bufs = false, new_cursor = false;;
+    bool free_bufs = false, new_cursor = false;
 
     primary = vfio_display_get_dmabuf(vdev, DRM_PLANE_TYPE_PRIMARY);
     if (primary == NULL) {
-- 
2.24.1

