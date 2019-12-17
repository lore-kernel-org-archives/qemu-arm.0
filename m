Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6258236lff;
        Tue, 17 Dec 2019 08:41:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqxJoMmal5EI9WDEpTGqqDUVSaNcmmBp2HXF5ydiyXgibEA1IpsxmokFyg7b+g/94gYrGw96
X-Received: by 2002:ac8:53cb:: with SMTP id c11mr5324101qtq.14.1576600914866;
        Tue, 17 Dec 2019 08:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576600914; cv=none;
        d=google.com; s=arc-20160816;
        b=TDyPJc3XT7awMH/7cGry9h7+1WlFk2g+h7PXsod04mRHOHXzuzXiNzPIPACRfWZTI+
         gkW3Alnh6GIpjLk6oEKc3lLRPDLV3AXAaqI+GyDkgYvF+wx2KBQpSF70wboQxIE9DDA8
         OU7xX0oGsIlrJ+Gd9U7BvSf8jGguGHgWbFURg0bT3YBLGs5UQ61kelWUPZiI9TvfjA1F
         Q/669/GSYCDiM4WMivGsc/GEssketEaHQj32VvXmuGAijp3XHxdyQReUsNJLr8Lu3FiU
         nPUSBPjNOpLp65S4uID6IvCJoPfAI1jvcZ9pbXvHEzT8E8v8YPz2cDRe5UUsEH61d/gP
         iY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aNeyU7/Lv4XpR7KzxXHIM4Nb2F8VTLxcvwFNAQff+7M=;
        b=z0N4Rq57q2Azt+QHOPNjJRbf8vWxoXfMRMLn41xFq2avNRNmvqemib7kzIt9JSzCDP
         in+oouPtqvHIg1BxatTRw7Z3UNmCw/1xpPcaCYyKLp0Jn46IDcdHLvM7n6YThsCc/AzS
         WN1UtxRRvkjCcAOZIszObvNaSElxu3GSk0GllS4Hh1cRvxMRFjdo2PY7OIjQskzE4InC
         z55MeOehCyYWJPLpIKFOrWCn/SSLDh/H13m6SePXhadPi9qoJqUeV/J2DHx5YiBJ+uR6
         pLX2ZQeIL2P6kyhQqMzNaNDeYzm2k90/eytd47gXC+maZ+bGa2n8B6CdrVtAltaFQObR
         SquQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EvzdZtdm;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id k3si7550206qvr.132.2019.12.17.08.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:41:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EvzdZtdm;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576600914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNeyU7/Lv4XpR7KzxXHIM4Nb2F8VTLxcvwFNAQff+7M=;
	b=EvzdZtdmAApTryXwtAOo7yMv+yhLqtNCUWabet+VDmINXW7Ipfpo5BbC51pOMnflKBa734
	iXZ6koR/nRlJbDxO/r3fCOnX24wsHgapjrT27j4AnHRCaVV28JP4of3I5Cd6GDb8dU9zOD
	99DL4oQ5CAeao04wl361IB/VcM//BaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-0NjUTsbmNF-QwDxiAk6QrA-1; Tue, 17 Dec 2019 11:41:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5BBF1034B23;
	Tue, 17 Dec 2019 16:41:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9588C77C80;
	Tue, 17 Dec 2019 16:41:17 +0000 (UTC)
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
Subject: [RFC PATCH 06/14] hw/usb/dev-serial: Explicit we ignore few QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:38:00 +0100
Message-Id: <20191217163808.20068-7-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 0NjUTsbmNF-QwDxiAk6QrA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /v5kq+JllrjU

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

  hw/usb/dev-serial.c: In function =E2=80=98usb_serial_event=E2=80=99:
  hw/usb/dev-serial.c:468:5: error: enumeration value =E2=80=98CHR_EVENT_MU=
X_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
    468 |     switch (event) {
        |     ^~~~~~
  hw/usb/dev-serial.c:468:5: error: enumeration value =E2=80=98CHR_EVENT_MU=
X_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 hw/usb/dev-serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 45cc74128a..497f932a5a 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -479,6 +479,9 @@ static void usb_serial_event(void *opaque, int event)
                 usb_device_detach(&s->dev);
             }
             break;
+        default:
+            /* Ignore */
+            break;
     }
 }
=20
--=20
2.21.0
