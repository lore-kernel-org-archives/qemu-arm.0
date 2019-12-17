Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6255840lff;
        Tue, 17 Dec 2019 08:39:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqyj0YJwDXmTuCJpNbBXou30eQioBGtWseloOHlwJ512pNX/j4ge7rVSLeRz9/srz50hNq2a
X-Received: by 2002:a37:6656:: with SMTP id a83mr5866788qkc.398.1576600787848;
        Tue, 17 Dec 2019 08:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576600787; cv=none;
        d=google.com; s=arc-20160816;
        b=SbVbjSERDybW+12C56Zdnvm7OVkfeLU6pTxNH69n44uR4QIP5gXHYqq+WFFh6zSHX/
         Vh7Do8Ql39H0Ek7gp3vLZo1iiUxol9+CDOGlWnDxkYxcVAhrF37VyoT5EHJOpigSS/aR
         M3aS+taQ+HGmt8e5R3vld2vYmukywQMAW1nFlFHExRcWjNvuvsQYht0/RoQLUvqP2jvV
         hgtOdfmUTnrc62YGU3L9MgTchNchDcyLSOGhZ5GXyQp9a1Kyi++hY8d5SFfyEQMHUPf/
         NPGsHXuwce/2YqrbAPGmkx2SCBV1muAC31Cuj0F6j8sV9nnzK2Nsw0Py4U6ClPNUKPTj
         +x7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M5eisbppqcSSLnhV695pR3rX79aTKoSsMq1feLLMG84=;
        b=TMXLG33wrpgwZeYREOfvm9staYjJ6yjc1jxxUPrLL90L8+xpMBmdo25pyH9yJa7RuE
         vRg+xMxGVmFeBXnotN7kEyXb0rgO58f4/qQvw84yITWLz7u3noV+TaehS3L2RTCuRaZv
         ps4WqpdLVRvHw/EAK/V5GgowOX/cvUzrR8WmPx7ElStfQvc/UxCHOJjHhHkVMPpwWbKx
         5eORwS90XLzrxCxz2Yiud37CgsCzKyX7UkwWlf3ENMVLgc4Sg2EjFUlGfPI0H2D+evJs
         PdnDVV/BLUS3BIRnGIOB8y8kJQY9jAjhFRDnW6N7PC24KwZ+eCA/Vu1I1QXp0lsAc7e4
         c0Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cVEOSojg;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id ba4si11791618qvb.200.2019.12.17.08.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:39:47 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cVEOSojg;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576600787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M5eisbppqcSSLnhV695pR3rX79aTKoSsMq1feLLMG84=;
	b=cVEOSojg6DdTohvNT/8RGjoUaYXPZ1ZIYKnBngroWxImaUiMg0QJAnQkOVaOUUCH1gyEQO
	lcJ5Fta55Xg4aacIUy9BEAuOZeBoGDQEi7AQfCMqfgThxKQhZXLEFtxNXj847kPArlsYu5
	OMkb4Lc3yutCY87I7gY3BMM0DyAUlk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-DAQQ_TLkMuupDsbn6svgGg-1; Tue, 17 Dec 2019 11:39:45 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70B7F800053;
	Tue, 17 Dec 2019 16:39:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63EB5675BF;
	Tue, 17 Dec 2019 16:39:12 +0000 (UTC)
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
Subject: [RFC PATCH 02/14] chardev/char: Explicit we ignore some QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:37:56 +0100
Message-Id: <20191217163808.20068-3-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: DAQQ_TLkMuupDsbn6svgGg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6t8STWwsz7/U

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

  chardev/char.c: In function =E2=80=98qemu_chr_be_event=E2=80=99:
  chardev/char.c:65:5: error: enumeration value =E2=80=98CHR_EVENT_BREAK=E2=
=80=99 not handled in switch [-Werror=3Dswitch]
     65 |     switch (event) {
        |     ^~~~~~
  chardev/char.c:65:5: error: enumeration value =E2=80=98CHR_EVENT_MUX_IN=
=E2=80=99 not handled in switch [-Werror=3Dswitch]
  chardev/char.c:65:5: error: enumeration value =E2=80=98CHR_EVENT_MUX_OUT=
=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/chardev/char.c b/chardev/char.c
index 7b6b2cb123..c4b6bbc55a 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -69,6 +69,9 @@ void qemu_chr_be_event(Chardev *s, int event)
         case CHR_EVENT_CLOSED:
             s->be_open =3D 0;
             break;
+    default:
+        /* Ignore */
+        break;
     }
=20
     CHARDEV_GET_CLASS(s)->chr_be_event(s, event);
--=20
2.21.0
