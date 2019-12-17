Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6260831lff;
        Tue, 17 Dec 2019 08:43:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqwP1JBcGtK3ffS0xP9Kl7umqVLwwyoD7IgyL96Ht4+Y6w8fIn3z6/X10PTOrkRnDsuiu8pU
X-Received: by 2002:a05:620a:10a7:: with SMTP id h7mr5812375qkk.423.1576601037142;
        Tue, 17 Dec 2019 08:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576601037; cv=none;
        d=google.com; s=arc-20160816;
        b=vtSdKb5887xXeTGB4t3Jv837qr2sYQYfct9GDOKOSfxZU16rETEqcKVajU2XR+a/oE
         LRnDQmaKQmpABHj11x9LFBdPDIL0iXTo1YNXP/7uwfvD8gEUY82faiaefSOG4r7ssQiA
         o/+9GDF6UP4DTIkNkmsyjCBAjBzUu5Tx4VH8JbHuAQFfysT+MH/s8XshpNqcIQm87gNv
         ULuwf3EjZvIVhxDiH5/Qm+7DvGJQN980L+Ox84rCjpsxI8kj9xwpU3BTrkoC509kVZSc
         dwCsAt1xAk0s5bWvqjZi1hcSwSBqr9eJDR/zWnYA8ll54uIHaqCGYU0Zdh9zhbj9OCbM
         g42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KFfF62p0wtfpbuoQUs8fUU7/4Wwx9UtbFBKJZwS7G3M=;
        b=knhvCuOfcEEAnm3zEkY15arx0VrypVJFFhsC4fwiku3gJ5wLCepV0FJ9fiVAzsJ1wF
         XbROS4ajdgsiFzQV/8UMse6Dm7H9NaS4s1mkNOss9faSSq05hkJrFa4AAEKk2G69qoo1
         3qihWoU6bW5W83cHXLq/xVATRekU5X+3QJIrJhvnY1Q3QQV4Isyd5uKl6T3KDMVVl/2u
         Uax+S2+n32M3Cmj8I/R8u7K6sfG+B7ONwbwHs0AwKhzlavpHyai5MNGvPAX1dg5wwN2M
         Xhy/eTEka+MghTnwvSLU3wpQC7ALMJocwCikTIavM4+N6X0VcAqW1gvg0qizihpwIQOQ
         3gkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iWe3cMvr;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id k8si955516qtq.181.2019.12.17.08.43.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:43:57 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iWe3cMvr;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576601036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KFfF62p0wtfpbuoQUs8fUU7/4Wwx9UtbFBKJZwS7G3M=;
	b=iWe3cMvrwKte8ti8MCuoYZlXzG/HIrTiyuLJvx7vM8eLpXxNd6kOzQ+im1fbVc+Fse7Fs9
	RISB/9xkFc4fsDyzTdTc0giv24xCrJSmzr+5+u/LMM2PEVjud7AycEmzmzU5w3FxBpZE3k
	gu0PNyOJsyIrHElBC0Ar5haGDbHoV6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-7TX2JT0qOyim0MLRiwnoeg-1; Tue, 17 Dec 2019 11:43:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16A93A0A6B;
	Tue, 17 Dec 2019 16:43:50 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B5E468877;
	Tue, 17 Dec 2019 16:43:25 +0000 (UTC)
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
Subject: [RFC PATCH 11/14] net/vhost-user: Explicit we ignore few QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:38:05 +0100
Message-Id: <20191217163808.20068-12-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 7TX2JT0qOyim0MLRiwnoeg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BG8QM/uPDpBL

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

    CC      net/vhost-user.o
  net/vhost-user.c: In function =E2=80=98net_vhost_user_event=E2=80=99:
  net/vhost-user.c:269:5: error: enumeration value =E2=80=98CHR_EVENT_BREAK=
=E2=80=99 not handled in switch [-Werror=3Dswitch]
    269 |     switch (event) {
        |     ^~~~~~
  net/vhost-user.c:269:5: error: enumeration value =E2=80=98CHR_EVENT_MUX_I=
N=E2=80=99 not handled in switch [-Werror=3Dswitch]
  net/vhost-user.c:269:5: error: enumeration value =E2=80=98CHR_EVENT_MUX_O=
UT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
---
 net/vhost-user.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/vhost-user.c b/net/vhost-user.c
index 014199d600..383d68024e 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -294,6 +294,9 @@ static void net_vhost_user_event(void *opaque, int even=
t)
             aio_bh_schedule_oneshot(ctx, chr_closed_bh, opaque);
         }
         break;
+    default:
+        /* Ignore */
+        break;
     }
=20
     if (err) {
--=20
2.21.0
