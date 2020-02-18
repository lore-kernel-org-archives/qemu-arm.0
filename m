Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5943959lfp;
        Tue, 18 Feb 2020 01:51:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzUTHapZK4iEkrXRQofvIyL+YoXKcyd7tDmAynsYi32AoLgP61zrh39SZQfk6jdv7b4I8Q
X-Received: by 2002:a05:6214:4f0:: with SMTP id cl16mr16083665qvb.213.1582019471297;
        Tue, 18 Feb 2020 01:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019471; cv=none;
        d=google.com; s=arc-20160816;
        b=cjTDw9UCyi9s46kb0x0F1n1wCj5oFaUUfHOdGMlN/emiVBzIlwIEMqmdBdm2ydWD/Q
         kXEgL1/mJQukq2lwBCiXtM4cGwA1Tkx+QUt7I+AYcp9rovQr3IQOS2LuvzbuUDiOeFvD
         aqTDDJv+pj0mNpmfXVmkHk65zVx2xgW1nhcuL4v6R5/CUaS7Vt3vnwDgwFoLoX2KKT7A
         WVkje/U9Z2zzMR2YgC61Lg75vzqvOwbNK1pE4tak9yckpnQptLEaomVFlRPHdufkz4kc
         gRD7Ko56wzcESLnZcX3VBbLCuNKTvcTMVVIXugsaZxamSap1jUmlzQO0Drn4KI8o9bFL
         qjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XCQCf8OR1kY+/p5b4mHJ3QG09v3lGeftuZ/e10MXqmo=;
        b=CW7tFteEh5Z/K5J1/USZ1hIBxlVNFzM3qEbK0z6z+k5r8E+jp/HdoFooCccla5pHyf
         IpE+vmf0OP83VwlKY7zEMJtHW4GgN/F+YcZDJw4LjQoEPbc39dUt9/PsvDQwWMDVhs5f
         LJ/5cOHJTh+YaZvIcNbO9DYeT/48NEmTxRlD8HOiGHwhw/RenSB9I273kk3KTM1cp6+I
         KpKfv/bDeevAl4KUeGErtBxvgyAUHKL23XbbdVwwno5KDGqgL6LvGY7xpJd1y120Z93b
         VuXk0eYhc9y36tPPjm3WMlBP7Apz0krBBPCKyRIxZa0JnKWGDtbTpaf5VzbEMjOjt78d
         bAgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=attFcFDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186si1653289qke.262.2020.02.18.01.51.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:51:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=attFcFDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zX4-0004Ey-Kj
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQZ-0001kc-Ow
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQY-000603-Qq
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41203
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQY-0005zd-Mp
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCQCf8OR1kY+/p5b4mHJ3QG09v3lGeftuZ/e10MXqmo=;
 b=attFcFDn/PAl2t/iz7ta77weDRVagqe/M8+3yrDaHrGxFeoFgl/XPisz3nVZOVJzAUWlUP
 3ptYFuNlw4NJMHpx0Wmckps4VYen+l1sAiA7bYbBLNIWwLIa3UBrkR4erN6MMz9AqIyxtM
 yoAgsyAe87ihVzG2kWp1CLGc1jO2sbA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-B0shi-blN2arGcOdKEnV3g-1; Tue, 18 Feb 2020 04:44:16 -0500
Received: by mail-wr1-f71.google.com with SMTP id d15so10511811wru.1
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTAYCeyl+pNe1lk0kNlsj14Fj0ev9DGEUp2oxJFg1Hs=;
 b=ky9L0CBorW+8lekMNqLtsiPnm+HmdNS7iiOgXi28Bd6/WSjGTeMQ0ibjK/AQhYu2bF
 EOz+TCSrV/fNU74yUZDNJ4YYI4KV1WjhBbgbl6GAezFwXTetTkMBUqzlrSlnp2W2woqG
 QgnVfdKvcsFV2CqTIZ10eMERv75yV2lakiWtMObIsBuyzJPttZTHznadTl2jAJnwSFnt
 P+jQzqHjYkA1lrTJwnYsqyXnrmY/W9VufuU8TJrXxCJ/AH0mh5W8x84agG9kQ6pnm37g
 w5GQ2TNspulWRQFe45BXEiZ/AJra7NagDPpsuFeI4n1ZnZMzfyj4tmYYgmR23ECKNN5Y
 0sNQ==
X-Gm-Message-State: APjAAAXZVYm73b3Nyr9t1o2/xxvw1uNI28hzdD4WxWmOqDMAwNSi481Y
 bTJRiUaVPUdhARMSmd0Cyx7r0xSyuO/aG+Dg5E5iT4Je25axSWklLORFiolfq/w1FNroRlzYBBj
 PjuEqxbAyH7VX
X-Received: by 2002:adf:de86:: with SMTP id w6mr29018407wrl.115.1582019055797; 
 Tue, 18 Feb 2020 01:44:15 -0800 (PST)
X-Received: by 2002:adf:de86:: with SMTP id w6mr29018383wrl.115.1582019055600; 
 Tue, 18 Feb 2020 01:44:15 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 05/13] hw/arm/xlnx-versal: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:54 +0100
Message-Id: <20200218094402.26625-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: B0shi-blN2arGcOdKEnV3g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-TUID: yH6MRsGBnSpk

Fixes: 6f16da53ffe
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/xlnx-versal-virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 462493c467..0d2e3bdda1 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -350,7 +350,7 @@ static void create_virtio_regions(VersalVirt *s)
     int i;
=20
     for (i =3D 0; i < NUM_VIRTIO_TRANSPORT; i++) {
-        char *name =3D g_strdup_printf("virtio%d", i);;
+        char *name =3D g_strdup_printf("virtio%d", i);
         hwaddr base =3D MM_TOP_RSVD + i * virtio_mmio_size;
         int irq =3D VERSAL_RSVD_IRQ_FIRST + i;
         MemoryRegion *mr;
--=20
2.21.1

