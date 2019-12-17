Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6259778lff;
        Tue, 17 Dec 2019 08:43:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqy7y96uu447v0e32WMB2ryU+lnPHCJxsAht53MPWEeFg7f0PiE9rSUuv8Ms3UXhmLPZFT3B
X-Received: by 2002:ac8:1e13:: with SMTP id n19mr5299877qtl.384.1576600986950;
        Tue, 17 Dec 2019 08:43:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576600986; cv=none;
        d=google.com; s=arc-20160816;
        b=A/Ubu+zD7mNqZE5NmQdJwlNke6CZEzq7GlgYIsnLLCSvRFDnCgEQWTG9alTmYI6v7G
         rp1/DwJi1AW1eUFRK8xmpdK6CX9hWGexWDstb4+WHsb4++CdLElZUjVTmO0Esy+VFtnh
         kPym/EdoJdS0pN9TLwBAo+5ImieoSwIIGodMkmo5xb4JVbH7q+nNgkfqSQJSxWEgneCv
         8bTrLXfU8ixR2s5kZT3nZBsrbXrKlqDDpTGbeylsKwP/mqdPP2yUTdKpWiEB42O6i5Jj
         C/GR3rXI13YAHDDT3G9KZ0UIW7ZQcN3zqLUqjjidbX/2MMmihyDi3wZv1Qgh2moNTnGq
         LJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LWPdmhlylc1YC5H9DvoZFc9kbqPgnBG8SfVBw2Anx8I=;
        b=pRlw//nEh9AexXMjXYbE9wpW1O7rC8KPzSAuRTFt9iJpnMTiNjqIZdJvvdJSwJ4opQ
         5BPCKfkUB7hhG+UAxElccVvPGn3ZOqqBxHSeDKyXXuD46b0eINXv7rq+hZqF26KqO6bL
         MUyM29yDJVRjJpQ/Mf8QwWwTr8whRKI957sHHMf+W72+WERuldovxpbO+i/ZGO7Q4T0r
         QQO23yNWPMaRFMr/pMnpPOeG5Dr0sbSbjOfDJLRYTCq8z+FW8fWlwaxysUA2R+4HpRnI
         /Wr3GacAlGtZsMBIOckX7vtwH6XaYin66pyXz96KRFZY6cP6XSI0g3n3mRE9DhhpziiC
         kmTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PXJo1+fb;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id c40si12186104qvd.147.2019.12.17.08.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:43:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PXJo1+fb;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576600986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWPdmhlylc1YC5H9DvoZFc9kbqPgnBG8SfVBw2Anx8I=;
	b=PXJo1+fbrtrISifAMs+xnXJAp8Z8JpikzQ9xdtf/5hia42uzWLYq613BHhxy8RNBG4LCyc
	PezH1RB7JBytPSeY1shT8HWRy/hVNfQFOHqhHR2CgKNe+bEB1NZ27RHVJfo9uH5ez5lD/n
	lo3GM6fR5PSC091J5b8B6w9UjVxZ1yk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-itWGShRrPOK60sk3Fmx78g-1; Tue, 17 Dec 2019 11:43:03 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EDC86A2A6;
	Tue, 17 Dec 2019 16:42:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5A5B68865;
	Tue, 17 Dec 2019 16:42:31 +0000 (UTC)
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
Subject: [RFC PATCH 09/14] monitor/qmp: Explicit we ignore few QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:38:03 +0100
Message-Id: <20191217163808.20068-10-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: itWGShRrPOK60sk3Fmx78g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: a6Kk717ttpMJ

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

    CC      monitor/qmp.o
  monitor/qmp.c: In function =E2=80=98monitor_qmp_event=E2=80=99:
  monitor/qmp.c:345:5: error: enumeration value =E2=80=98CHR_EVENT_BREAK=E2=
=80=99 not handled in switch [-Werror=3Dswitch]
    345 |     switch (event) {
        |     ^~~~~~
  monitor/qmp.c:345:5: error: enumeration value =E2=80=98CHR_EVENT_MUX_IN=
=E2=80=99 not handled in switch [-Werror=3Dswitch]
  monitor/qmp.c:345:5: error: enumeration value =E2=80=98CHR_EVENT_MUX_OUT=
=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Markus Armbruster <armbru@redhat.com>
---
 monitor/qmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index b67a8e7d1f..d666b07e68 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -365,6 +365,9 @@ static void monitor_qmp_event(void *opaque, int event)
         mon_refcount--;
         monitor_fdsets_cleanup();
         break;
+    default:
+        /* Ignore */
+        break;
     }
 }
=20
--=20
2.21.0
