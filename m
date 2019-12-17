Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6259202lff;
        Tue, 17 Dec 2019 08:42:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8S1a/16QBYoFt1jqiDmB+kI9ct/xnpiYJjpFfkr2WC0Z52OGyxyGvj+ZOk7dKXwxKWMgG
X-Received: by 2002:a37:88c2:: with SMTP id k185mr6098703qkd.317.1576600961584;
        Tue, 17 Dec 2019 08:42:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576600961; cv=none;
        d=google.com; s=arc-20160816;
        b=WEUbyV+zC5WBPeTLludZNmUg3v25mkOZJR+/OIfvmPNxJOlRzH7VqXo1axJ8+n/wEd
         jnnqevqtMQJWR+RRTKBSsIUok3Xa0Vvik8JJaS394WcoAziL21V8Vi4yDzzJpa86iwQn
         c0teLYBw9U37qU3bGYp9zwhPWC///7MNkttRrSxnCYNcB6M1ulkjuMwyHXRrucUcQJDM
         wAD095/b+KRcbpwQLFVQFbvjuLn7UxsbpqBmf10Yfvql1Jn53bJicYzxFe9AqgJtHS3N
         GLgLm8TcFjeIFfG2diuABA4bxgcjrOdlyjS2d+UkuTkIm41NaHpINvLpJVXiqE0sGYO2
         Sb8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1q0+8G9RTWbeMkR4IbHhx3lZKW72mNyCaGGTfMLDypg=;
        b=cxnaLOg8SAm5WFTGc/3y/WgbAMBPMuXmNQM1IaFZJ/oTrq9LYbn+/X7xz5Jlk9gUXE
         2x9/XiDUXlMAcpWw8tifMTL0c0Btt/bUFLPOilcfDVuHMLuBqXvB0sohFYza3Vx3ljTM
         i33Jp1imOd1UIvbHHvBA41yOo7sxnmJCLT5VEJXBUbC23SRkEG4j46lqdLzkcLhtc+GH
         u0ZqNFxddHirRuwqx7rlAB4UmfX8scR6UGMIeOxOkhkC4QuphwF7gxLa7KhE9DKAPKwR
         ZZG5anC9SvA1sIpxiLWS5kiHlnMXQrj2YuW72D2ErrATr2+cEnKiGP6h0LYa1HYpuNKq
         U57w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KhjVgIQO;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id l184si11873973qkc.220.2019.12.17.08.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:42:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KhjVgIQO;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576600961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1q0+8G9RTWbeMkR4IbHhx3lZKW72mNyCaGGTfMLDypg=;
	b=KhjVgIQOJeERrHh59Uic7l81qFudpOo5sS4d4+09CI7s4jfg3Z9LukbP5jJxfjBAT5DNFe
	rprGpolUU0GQbQ0LeEqolPp8MkQt0A/CrTdFtlUAkFjzZozKu4SVACinhyT8+bjXvHFG2U
	4BAYA+qg3jnG+VLEHkq7zwfMj/Q2fh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-FX8W9uU1OgGW6LcCMY_TFA-1; Tue, 17 Dec 2019 11:42:35 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62959593D8;
	Tue, 17 Dec 2019 16:42:31 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B4AF68865;
	Tue, 17 Dec 2019 16:42:07 +0000 (UTC)
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
Subject: [RFC PATCH 08/14] hw/usb/redirect: Explicit we ignore few QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:38:02 +0100
Message-Id: <20191217163808.20068-9-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: FX8W9uU1OgGW6LcCMY_TFA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cIKlkMeJQg/G

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

    CC      hw/usb/redirect.o
  hw/usb/redirect.c: In function =E2=80=98usbredir_chardev_event=E2=80=99:
  hw/usb/redirect.c:1361:5: error: enumeration value =E2=80=98CHR_EVENT_BRE=
AK=E2=80=99 not handled in switch [-Werror=3Dswitch]
   1361 |     switch (event) {
        |     ^~~~~~
  hw/usb/redirect.c:1361:5: error: enumeration value =E2=80=98CHR_EVENT_MUX=
_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
  hw/usb/redirect.c:1361:5: error: enumeration value =E2=80=98CHR_EVENT_MUX=
_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/redirect.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index e0f5ca6f81..acc376cc95 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1370,6 +1370,9 @@ static void usbredir_chardev_event(void *opaque, int =
event)
         DPRINTF("chardev close\n");
         qemu_bh_schedule(dev->chardev_close_bh);
         break;
+    default:
+        /* Ignore */
+        break;
     }
 }
=20
--=20
2.21.0
