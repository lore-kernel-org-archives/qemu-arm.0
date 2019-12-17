Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6260356lff;
        Tue, 17 Dec 2019 08:43:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqwtNuNSMhA3pyVmM2cafVUTTJa4iud/FkwKmORWPnEP1J0qhhMtH7p+8Du+MXmvovN0BzEI
X-Received: by 2002:ac8:7a6c:: with SMTP id w12mr5407686qtt.35.1576601014965;
        Tue, 17 Dec 2019 08:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576601014; cv=none;
        d=google.com; s=arc-20160816;
        b=LzmhkuW5yX6DUdDkzTl9vpNlBfZbwChgcEfAoCWI9hQxHQJOTUzUH1ca+AeV03bQqV
         wuekUr3IVvdFmoQSWR46PhPXT3KnhWC99nPSJon2xOA4QR4YvvMStcB8fEJwSv0TZsId
         J2ZK5l5Sr1UgTQDZ/y/3CUMQ8mTcUZ+7Xmfbhp0PF9iG24jURhCUfKv8JVa1UyRaD0HC
         Y1ja4EPbMjEthFpQLRmf7zlh8T2lTkR5Qjr6Mwmat39hlXzLss8Y0Xu6a0SqJkZ5wyPv
         smrNHl6tAGrflwqtZmDDIGtgpFYtRQj8XhSuIQe3Dn12CCNQGuE1AKl7C6sTAF7LH9De
         6BeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VieRlOSNQiL1buz6KYPsrx/GicOx3CeNAj0YsqGdShM=;
        b=T3rGnophX1GnNJEfsIjX5fO8MXzbP4Y8r3/PC/ghWKmpuDSvL1t/hslOLmlKZFgIq1
         aXb/k9pmuoSMfkzdA4uUXOUvYWQEntqk95OK4rXN9wFkSy98wbcrG85snpVZ/cygfYO1
         pay0Ql6VBXC8lEcIiYOKhyJ3ZR+Nnd6DP4gevaR9d9xUJlvDZoiATr4Zy2zX/x+C42e4
         a0L/lCXBju8l99yGw/RtbWHFpgugaaoUMtv2bTpUofNwqVfEXioV9UNxiVMePY5d53PM
         t1+JcSshwTQBox2e3Dmz9LVu6hwms7NW1Zg06BSmrdEiemzktZQ8zL15VvZ/QvRRhavL
         f4AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XXPTUo+H;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id bk2si11667761qvb.153.2019.12.17.08.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:43:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XXPTUo+H;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576601014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VieRlOSNQiL1buz6KYPsrx/GicOx3CeNAj0YsqGdShM=;
	b=XXPTUo+H1SSrwVRjqGB/PxhTyZVU5SYj9fXz40wEwwRrvktxkyr5cSE4jzBMWrJRv2nEv3
	ToJ5Slb1C5fuosQhj+NrmHNhHA1AUwRLfkb5IDQpUgOGwqprz2AT7hivnfRx87bkA/L8an
	oUmCNcbkuE+xv6kWNi8RY8KkRGb5iFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-SwlvgClkOOWB37uaT4TC1A-1; Tue, 17 Dec 2019 11:43:30 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF70F18B6394;
	Tue, 17 Dec 2019 16:43:25 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 039D368865;
	Tue, 17 Dec 2019 16:42:57 +0000 (UTC)
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
Subject: [RFC PATCH 10/14] monitor/hmp: Explicit we ignore a QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:38:04 +0100
Message-Id: <20191217163808.20068-11-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: SwlvgClkOOWB37uaT4TC1A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9Bm/rS07zFvH

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

    CC      monitor/hmp.o
  monitor/hmp.c: In function =E2=80=98monitor_event=E2=80=99:
  monitor/hmp.c:1330:5: error: enumeration value =E2=80=98CHR_EVENT_BREAK=
=E2=80=99 not handled in switch [-Werror=3Dswitch]
   1330 |     switch (event) {
        |     ^~~~~~
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
---
 monitor/hmp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index 8942e28933..d84238c120 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1371,6 +1371,10 @@ static void monitor_event(void *opaque, int event)
         mon_refcount--;
         monitor_fdsets_cleanup();
         break;
+
+    default:
+        /* Ignore */
+        break;
     }
 }
=20
--=20
2.21.0
