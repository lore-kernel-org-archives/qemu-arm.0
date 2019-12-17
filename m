Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6256847lff;
        Tue, 17 Dec 2019 08:40:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqypYYifza92kqwPiuNtotFwMej3G6GWx5CNGeQEVozxQ8AEw7gbDw2XI2DhcFbMzagnMoHa
X-Received: by 2002:a17:906:ff01:: with SMTP id zn1mr6077681ejb.323.1576600841286;
        Tue, 17 Dec 2019 08:40:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576600841; cv=none;
        d=google.com; s=arc-20160816;
        b=0bbhoN3Uwdw6PyiZu6uKUt64srfH8e87hxbaujZQWHWjCa12m6dG3mhRCzqLHitw5b
         Q/vMt5MbcBl82OJOa8r+7nXRW3qgRIZBgr4EPvKohHww2vEASuI5OuaxDdDuTMdznV+I
         0UE9pN4LZc3/4WhhT6oLGqernLU/NXOqxNEOLy572aoVE+w3REtiwtwg0wfVFJsLa2za
         M73rCjZO5YkOTg72z2VJ9tBJhSe6AH/BANCreVRA3wAvcpUGIlYdD2rQvDXP96FNAIO2
         9fXkQLsgqU7mRWpvVeGOmg6WfrQJ53hV+pKG5aa4hw8zv9Ik34LhrVFt0b/B86Jogrw7
         OCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7hfjipPNHS05FZX4gKyoZHOjOIm+A4c3HTMdvd0V9Mc=;
        b=b3/G7xwbpOukkWmUChFhh3qTOxK74Yxvxnw0DtxDxbTYc1md+z4ogM9HX5cI9CWthR
         gPhPCN50cIdTNft3o4AC6DsAK3hrUaAWXlnM7rs5OTOCzr6iHrrCRW8H4BDRjov/mH5O
         ZlZTedLLofr1wyODExV/ySsIwrynPjaWaziYHL6pKkcsrMxczCuUt6H/WuCk91dnw66J
         8XFr65nGm4uw7s1TLx0eCXRX2/AxdnOXpy07h9eyAFM5AaDx3ygl8bSftRlsCDnTFwZc
         0W/NjsfGQT8nF7QuDZ+6sJT3j/4MrWSJTqkUR76HVb6+UOBDD0ApLaUxdgrS6Dgc/Rc0
         zM0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FHhJGVVe;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id s15si15761712ejj.363.2019.12.17.08.40.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:40:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FHhJGVVe;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576600840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7hfjipPNHS05FZX4gKyoZHOjOIm+A4c3HTMdvd0V9Mc=;
	b=FHhJGVVeUzXjRcj/gkDlmOiXr911ot3L89fsjHtBw2Kh2LTS39Er8VhXUcgM12Kuh10Q4K
	mfpjCjtuF6Ty51YaLCKy/i7RHtZVNpyNsaFMs2L72np4HhRApC0421P7uLYbsHSO6TKzMW
	65vziEPU13/X1Zz1Za86/j9mQpWDvP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-FouF0qVGOieVWA7x8cLNmA-1; Tue, 17 Dec 2019 11:40:38 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19AAC800D55;
	Tue, 17 Dec 2019 16:40:34 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76D8F68865;
	Tue, 17 Dec 2019 16:40:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	Zhang Chen <chen.zhang@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Paul Burton <pburton@wavecomp.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jason Wang <jasowang@redhat.com>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Corey Minyard <minyard@acm.org>,
	Max Reitz <mreitz@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Markus Armbruster <armbru@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alberto Garcia <berto@igalia.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	qemu-arm@nongnu.org,
	Alistair Francis <alistair@alistair23.me>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-s390x@nongnu.org,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Amit Shah <amit@kernel.org>,
	qemu-riscv@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Thomas Huth <huth@tuxfamily.org>
Subject: [RFC PATCH 04/14] virtio-console: Explicit we ignore some QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:37:58 +0100
Message-Id: <20191217163808.20068-5-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: FouF0qVGOieVWA7x8cLNmA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: wA7UWOY2sidY

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

    CC      hw/char/virtio-console.o
  hw/char/virtio-console.c: In function =E2=80=98chr_event=E2=80=99:
  hw/char/virtio-console.c:154:5: error: enumeration value =E2=80=98CHR_EVE=
NT_BREAK=E2=80=99 not handled in switch [-Werror=3Dswitch]
    154 |     switch (event) {
        |     ^~~~~~
  hw/char/virtio-console.c:154:5: error: enumeration value =E2=80=98CHR_EVE=
NT_MUX_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
  hw/char/virtio-console.c:154:5: error: enumeration value =E2=80=98CHR_EVE=
NT_MUX_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Amit Shah <amit@kernel.org>
Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/char/virtio-console.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
index c13649f1ef..d3f7ba36fe 100644
--- a/hw/char/virtio-console.c
+++ b/hw/char/virtio-console.c
@@ -162,6 +162,9 @@ static void chr_event(void *opaque, int event)
         }
         virtio_serial_close(port);
         break;
+    default:
+        /* Ignore */
+        break;
     }
 }
=20
--=20
2.21.0
