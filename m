Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6261363lff;
        Tue, 17 Dec 2019 08:44:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqwGoJAcfW8EQFQw+SDTI5yn1vkfyBRo8thDsXkoVKYbE9P8I6cm1f/bKrCo4gKX1csLQeCQ
X-Received: by 2002:a0c:eac7:: with SMTP id y7mr5656055qvp.86.1576601064242;
        Tue, 17 Dec 2019 08:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576601064; cv=none;
        d=google.com; s=arc-20160816;
        b=SuOP2f78HhqvYFKm7GtSmwso5AusraztoHhup4XWqg6UUO2x/9u7I58NktxBCYOPnm
         adAvjzRyYRbXyQlzrOfSj32tWnLU9meIlY/Vy23rBGh8m/4fXAaCYb7EJUC99Y02/W45
         bThvL11TKQO+cgVrvB3/apIrzyamuR3N25CVs6H86ciLWvnFVoKMZMIIr/u8xtXcCLH6
         vj6fNuUZotIp94Tk+baTtWrNoMjTYDBn8n3TgWacweutMoCxf5SLR7rxyIX7twUSQNm1
         7Bm6oibFDJ+ZFC1pTBI4sElyseXIUrURlZxONSL4hg0stp43PdHZp3KygkQQSmtsjqFP
         v9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MYVIpFLxZh/foCyP2XwIVnvo4LnIBsgaGRLRhMaYw14=;
        b=tkxnNU+9aR1eR3XZLybc4230nNx04cX60iuTZW77zmpTWmuD1OjaTehxjE+EBkzwb/
         i/HKqZM50mLfC8Q6m3VmAMVaC4/O1b8un4xjPjHoTMgrZxtS53GQZrHBX/Ci+lPmv3MQ
         LMwccqD48HxbelsmNPIaiUFFo1HrMNGxo19w0CYgRaP741xUO45JmfGYcXgzMdraLLuZ
         9rpTPZmXlIgFUT0ST9giWsTD54r1WRn8RQZl7l5mOO1EAr+4GGWTBfTis5iWU9NELJac
         gxiaAnxY4eI8DROyHBbQ4opl5qO4KLUd+Wrm//iAj4PMEGeQTNCix7GWxSnFuJWtWzbx
         hk8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PRqc/4FS";
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id j6si11764026qtq.27.2019.12.17.08.44.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:44:24 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PRqc/4FS";
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576601063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MYVIpFLxZh/foCyP2XwIVnvo4LnIBsgaGRLRhMaYw14=;
	b=PRqc/4FSK0EezMtFucpWfaxMAvKfPmdv8O7abU8yVdZQ3Cch10WgYk1xIdXKN4cXn8Wqnz
	Wu9eWtTpKD9OXwBjKfhMz8woVhSUZJnb6vjvsG69P0UN0lt8b8DYStKP1ai2zwEW0AWryU
	WmEli4lyDxsVgxivK5++v+O4qIvxueE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-wgik6hrlOhGkOgAq2xvtuQ-1; Tue, 17 Dec 2019 11:44:19 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 770751023150;
	Tue, 17 Dec 2019 16:44:15 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7598D68877;
	Tue, 17 Dec 2019 16:43:50 +0000 (UTC)
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
Subject: [RFC PATCH 12/14] vhost-user-blk: Explicit we ignore few QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:38:06 +0100
Message-Id: <20191217163808.20068-13-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: wgik6hrlOhGkOgAq2xvtuQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8V0OOB0UPrgg

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

    CC      s390x-softmmu/hw/block/vhost-user-blk.o
  hw/block/vhost-user-blk.c: In function =E2=80=98vhost_user_blk_event=E2=
=80=99:
  hw/block/vhost-user-blk.c:370:5: error: enumeration value =E2=80=98CHR_EV=
ENT_BREAK=E2=80=99 not handled in switch [-Werror=3Dswitch]
    370 |     switch (event) {
        |     ^~~~~~
  hw/block/vhost-user-blk.c:370:5: error: enumeration value =E2=80=98CHR_EV=
ENT_MUX_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
  hw/block/vhost-user-blk.c:370:5: error: enumeration value =E2=80=98CHR_EV=
ENT_MUX_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: qemu-block@nongnu.org
---
 hw/block/vhost-user-blk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 63da9bb619..4e2b2efdd3 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -383,6 +383,9 @@ static void vhost_user_blk_event(void *opaque, int even=
t)
             s->watch =3D 0;
         }
         break;
+    default:
+        /* Ignore */
+        break;
     }
 }
=20
--=20
2.21.0
