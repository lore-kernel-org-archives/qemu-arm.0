Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6256334lff;
        Tue, 17 Dec 2019 08:40:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpPGWCQbZMV6xd0gYrAwrEC0NQjTRPGQcF2jd00SBLDrwIVaGSKllWmxkD51SKJ75r8AKH
X-Received: by 2002:ac8:6053:: with SMTP id k19mr5370554qtm.348.1576600815621;
        Tue, 17 Dec 2019 08:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576600815; cv=none;
        d=google.com; s=arc-20160816;
        b=aCxmrU1KD6MUWktdckkmwgscQqbItTpXp6luIrWFPlEdAxWghrg/WhyNZ4OkMIweGF
         VJ1Jji63tN8UKyLor03WuplRnnvjtPOnTpllULOIYAMia8mB5GZ1qt2VCxbR4VhsnZ8l
         VI+ZEU8capKSXXxIS9LafKQTy2+I7EY6WQV++1bbm/S0RPUF3K7CltOIFghmI6ddw3+5
         qov79JU37C/qqUDfzTyPdP4d18ZfvgvBtRtdLg68ywwPQRkR0eTGLZq1T/ecYVwGEXZy
         Ar/lqtW/lmWPxf1CF4sedq0cHb5GDGRIXRiguXB4maaFZrE1qjDgMTGto1NAhQy2FooS
         +r4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UyNiSII4bECQvnQNLsrJWX7wCLrL6i3l3plxAAkIibg=;
        b=cXKy1dvFMvsKdF2Qui7SqIedoCasNPmu6P/ahf2NEDVxqDG3aVCorvQTHQ8pizHBXy
         oydnkWxVFfiLA+Bp/YB2FzYppyvVSjUAXME/iD2DqniQPjTCKlRu+6KZdtgXTPY8xfCB
         Dk+2NVD1u5rnFaL1ddAdjmOYBwcEOfu9nkEBKEHDfTYjG7zqhnNL077dqf2rlSdC8LCb
         YKg55/BOUVeA1Ts9UTWPXf9Ml+0r8ShlO0WBL8Qb7PndLerKyEd3XcVQFo5QrKP8feFL
         owFJWFzi0tP01nqwm0ZDXmo4Wlxq22qpEfjFtCZtaJca/nxtN3nUwVoFNPo9Z815OqF7
         XTaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FvSrI5jN;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id t15si7701346qvh.126.2019.12.17.08.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:40:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FvSrI5jN;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576600815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UyNiSII4bECQvnQNLsrJWX7wCLrL6i3l3plxAAkIibg=;
	b=FvSrI5jNcjscxO87wz5nSL9+5BF+au2w3g7N+VM9pleU5g0say2m65rOv3ODiOyCPH5/mC
	cVbkJgRvJXJzlqx1EerMd3oXyQVzXjfh8Fodi8jkZqz8b/D1u5SqpSA1koMpA1dtqslWNB
	zIyFj6ZCcTBPKxiOzB1oJnBqgcWcVsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-XjCk825XO-Sq4YcNnMKgDA-1; Tue, 17 Dec 2019 11:40:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA5E8800EBF;
	Tue, 17 Dec 2019 16:40:08 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22850675B0;
	Tue, 17 Dec 2019 16:39:41 +0000 (UTC)
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
Subject: [RFC PATCH 03/14] vhost-user: Explicit we ignore some QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:37:57 +0100
Message-Id: <20191217163808.20068-4-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: XjCk825XO-Sq4YcNnMKgDA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: sLtMwjVDhIjd

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

    CC      backends/cryptodev-vhost-user.o
  backends/cryptodev-vhost-user.c: In function =E2=80=98cryptodev_vhost_use=
r_event=E2=80=99:
  backends/cryptodev-vhost-user.c:163:5: error: enumeration value =E2=80=98=
CHR_EVENT_BREAK=E2=80=99 not handled in switch [-Werror=3Dswitch]
    163 |     switch (event) {
        |     ^~~~~~
  backends/cryptodev-vhost-user.c:163:5: error: enumeration value =E2=80=98=
CHR_EVENT_MUX_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
  backends/cryptodev-vhost-user.c:163:5: error: enumeration value =E2=80=98=
CHR_EVENT_MUX_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
---
 backends/cryptodev-vhost-user.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-use=
r.c
index b344283940..d700934a0e 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -171,6 +171,9 @@ static void cryptodev_vhost_user_event(void *opaque, in=
t event)
         b->ready =3D false;
         cryptodev_vhost_user_stop(queues, s);
         break;
+    default:
+        /* Ignore */
+        break;
     }
 }
=20
--=20
2.21.0
