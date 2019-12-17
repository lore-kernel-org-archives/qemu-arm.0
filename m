Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6257724lff;
        Tue, 17 Dec 2019 08:41:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqxGFI75W7RSCCI/5dHynKvDuflW5HZCRfrA54IVVeI1uPiiURnbBtzz1u+KHW0ywHWW0a8K
X-Received: by 2002:a37:9f57:: with SMTP id i84mr5934686qke.29.1576600885749;
        Tue, 17 Dec 2019 08:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576600885; cv=none;
        d=google.com; s=arc-20160816;
        b=iwCuUeKsmVGrJsgM7QvGF4HlcIm1re5tNyt3b60ytdWtT+pXNX7xBQCojbeQYmDI35
         BKg9U37zjuuJ91f/b/57awPQwNbyYDlcol01aliE/99h1Mw+5++2g93UCbocq26ta4e/
         6XaJF3+2/SViU0L7SbgVLG2uSHlkSU7O+PWIFNOAfs+77z1vvP/cgMDYQbadGCmdzeIk
         1/mcIvM+vJCf0z4xo6m6qOQ2NqlCZYVE50Vm4ehHo6nToCxyAjuCPnpvO60SFJAtQVi8
         Ei2Ful8ElDUS8DiVkBEACunlyQHrNYfmpB+Jd7hJl8e9I+p1doXf5EKxb/UnoYPdKbXJ
         6+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=evC+sSxtNpMvTh5wC5Sh3YUUefjPdijlTohqC3qDS2A=;
        b=jncIjWvH2Z1Ld2kd0nsvJfEqkW+eRR9p27nAO4P4+KSiPIzYJ5pxTCtfHrKkosZBVU
         4qzNSBeq7R4nMtQaJtEGUwkTKOqZaY07Eqo+ThLp8MC02S+UChn/vCc+Trexj5RcB/8v
         fBzsEmlMQw80tcCjhNsGE2yM4TKMha5Xjv54V8KaX/OSa6Hcan1QFoJqoEZtRfRQKgW7
         G9PNiz2f6ovIICGpdzVo6+ppS0RyA15Pti3kpgcdlhTxzFY0NBrViiSfQN/OmfgKkXOe
         XvThmCp8V+3oTfLUMJEFNbg9SAcsELDvXSIkw1lYpwhqV9E8r+70r16eU30RimxKsvFr
         tEYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FdwzHp/l";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id c21si5668675qtj.144.2019.12.17.08.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:41:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FdwzHp/l";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576600885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evC+sSxtNpMvTh5wC5Sh3YUUefjPdijlTohqC3qDS2A=;
	b=FdwzHp/lP5sHuZ7ttGBe8+Bp64eZdSnCvUaVkaZe2KNKOzeKiA0xtjpJNdRZ/yD1aXTfCb
	RkaV4OJSHt2sxyWUjvl0HeWye7s/QlESSHxJpH36b2L12k4x2IS9em56hbHuJaabTNUTr8
	S7EejjDt8FKXJ4M27IoYq2HLnQ8HfRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-VG_OKgThMUSaVLGhASXBGA-1; Tue, 17 Dec 2019 11:41:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 214938E3E0C;
	Tue, 17 Dec 2019 16:41:17 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A85586888E;
	Tue, 17 Dec 2019 16:40:34 +0000 (UTC)
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
Subject: [RFC PATCH 05/14] hw/ipmi: Explicit we ignore some QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:37:59 +0100
Message-Id: <20191217163808.20068-6-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: VG_OKgThMUSaVLGhASXBGA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: E+BD+1oi9xrQ

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

  hw/ipmi/ipmi_bmc_extern.c: In function =E2=80=98chr_event=E2=80=99:
  hw/ipmi/ipmi_bmc_extern.c:389:5: error: enumeration value =E2=80=98CHR_EV=
ENT_BREAK=E2=80=99 not handled in switch [-Werror=3Dswitch]
    389 |     switch (event) {
        |     ^~~~~~
  hw/ipmi/ipmi_bmc_extern.c:389:5: error: enumeration value =E2=80=98CHR_EV=
ENT_MUX_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
  hw/ipmi/ipmi_bmc_extern.c:389:5: error: enumeration value =E2=80=98CHR_EV=
ENT_MUX_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Corey Minyard <minyard@acm.org>
---
 hw/ipmi/ipmi_bmc_extern.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index 450926e5fb..9d67e6a4a5 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -435,6 +435,10 @@ static void chr_event(void *opaque, int event)
             k->handle_rsp(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
         }
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
