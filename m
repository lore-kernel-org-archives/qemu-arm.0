Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6258714lff;
        Tue, 17 Dec 2019 08:42:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqxRQIHEvIp5shV2MYCg7wsf2hMNFlr+IXpCJMrvlsFRHtKGd9G6RlO9ld5RawPnUZmxdSlO
X-Received: by 2002:a0d:d64d:: with SMTP id y74mr25158818ywd.386.1576600935989;
        Tue, 17 Dec 2019 08:42:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576600935; cv=none;
        d=google.com; s=arc-20160816;
        b=lPZ6iEBjWXavf8DqAZB0jGLd/kFSuE9cIYrzFp3CCaIHDLZhgD39JfuBrwYFDFQYhG
         TBtfkqkp6EfnlyDXmGpmYVaHfKpNR0BnwpHIBWoetgtt4i9/EPU1KhlGCdNG19VcbRtC
         CsOlSc7ksuihm6vD1+8N+0uQP8ymqHQhCXf7Mk5GsiyaTfvqWhi2TLqF60iLDouxwqQ5
         uqyiAfhMSEXlkEgrZSbUvOtsx9kiuPiwEjzmsCRCsZ95eG6Mw/K7jzKiu3yVgJCfp6Ws
         FfGY+zSijrwmovSoY0+iBJQXa+B7N/GdC7FsegR0q2b29GUyVIvAg9FxOs4wPwbvcApA
         wnmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZWk3zkMpgfU3ZN3J4EBBgjkfYGLkbV6WwKoyJTF7Ddg=;
        b=tRmSAtXm2uAauP4bRobnbOsan8YNnfXE6QtVszIXB/5GtZKukU1DZAiJzRaLdHdFRc
         q4PP8RySFAgWR89n08rumujFMEOLVaQpQv7Y9vQP+LC1n0ISUuZhPTWCYF5+lDAsQ8Ln
         qXvyQuta9zZMkV+anoaPeQ0/s0JnL1S+DckmE8fG11PRYqOH8FyoZdURy/JYvDm40FDP
         Fs2I+PonJEZh4YCgr+ZM9nG8V4BzW6ttmKu45eQ2GeAN/DyyO2iZDZ7pYrsyJW4JfNEb
         gpfdoB62kG7rmFJe7u70mKmjD8XBYAXhxmsio33UlECOshuDLTIg0Uve83RO3JITTzNs
         +gUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q2Mgumvd;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id b135si6630122ybg.408.2019.12.17.08.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:42:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q2Mgumvd;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576600935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWk3zkMpgfU3ZN3J4EBBgjkfYGLkbV6WwKoyJTF7Ddg=;
	b=Q2MgumvdGvUajQdfGBqiQYwIMW9Qic7W5nkAzNlx1wgpI1UmMjlgTKLvdfGUWSIe4A6aNQ
	OAM8EFB++J8vl8pWjSaXFxynHNplww8c19ywjTaqhPZEzEZtdpF8k9FFN1GxqBWdBdnCOj
	DsmSG7plpGce4+fkFbbce+smJLFojyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-tPNfmaoHPaSfPXAbkkq9zQ-1; Tue, 17 Dec 2019 11:42:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77E7080256C;
	Tue, 17 Dec 2019 16:42:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CA6C675B0;
	Tue, 17 Dec 2019 16:41:44 +0000 (UTC)
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
Subject: [RFC PATCH 07/14] ccid-card-passthru: Explicit we ignore QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:38:01 +0100
Message-Id: <20191217163808.20068-8-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: tPNfmaoHPaSfPXAbkkq9zQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: id/hNNogYnb3

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

  hw/usb/ccid-card-passthru.c: In function =E2=80=98ccid_card_vscard_event=
=E2=80=99:
  hw/usb/ccid-card-passthru.c:314:5: error: enumeration value =E2=80=98CHR_=
EVENT_MUX_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
    314 |     switch (event) {
        |     ^~~~~~
  hw/usb/ccid-card-passthru.c:314:5: error: enumeration value =E2=80=98CHR_=
EVENT_MUX_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  hw/usb/ccid-card-passthru.c:314:5: error: enumeration value =E2=80=98CHR_=
EVENT_CLOSED=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/ccid-card-passthru.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index 267ed9a8a0..190f268da2 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -318,6 +318,9 @@ static void ccid_card_vscard_event(void *opaque, int ev=
ent)
     case CHR_EVENT_OPENED:
         DPRINTF(card, D_INFO, "%s: CHR_EVENT_OPENED\n", __func__);
         break;
+    default:
+        /* Ignore */
+        break;
     }
 }
=20
--=20
2.21.0
