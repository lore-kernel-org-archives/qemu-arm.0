Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6255291lff;
        Tue, 17 Dec 2019 08:39:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+aFd5ff9CjQpb8s0pJMjmnPdWFddqhcNhgxKB23NhoPyy/rTa2l6x7PsOcJi12qWSUsLs
X-Received: by 2002:a81:b38a:: with SMTP id r132mr25718993ywh.114.1576600760277;
        Tue, 17 Dec 2019 08:39:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576600760; cv=none;
        d=google.com; s=arc-20160816;
        b=LUtmhXF7/N7VjsPjKMm5CE6QRF71+C0AYgcK/bQiiSRa/4u5UKzkg34ldZPdD/e+1b
         8EJn6JGSAoBteVOKjWkJdL5pD/rF+25HmrXBVSsbpqy3a4snGK/eRKYq6C/lDyo8V11x
         CEVWLNPusuaK1DmpY6YBQTXG4eF8xeCksz/SCho56vsZDTH/3LnV7AzNqAF8oq4SvN+5
         XmsljYR5+l2MXvsyqIlf4NeGiVhYU6x6kn8+Bk8OmResG/C8aVm1g3EzokMnYWFw4XEB
         Hv3YpVyKJ5p7gZAc3OMkCIWWJwkylzJHvZIQvHC1cojSDcg0ZbhjAOGpL6Qp1ShIZVhX
         42uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kbJd97UPYoKV5uP5HIXzv9iTL8Rz6OLSDFPr7bKkBZU=;
        b=XK/EURBFk2FmtZgNtJ1KahUxqUyCS7roYnRQ49P5WmeVDa5EPXklg0WV4utuiApTgp
         5mzumXN9f6aw1U2YjDqhI+Sqv/CpdjfIeeRslcB0NPoOID16+nnnNQgJqkZAoyEU4Epy
         U046xUdvqJWOOQq6MucG8M6Bp4O7cpz9lGA85IMGNbxWEXkpOJGXU0WZ7Mtsz7VmGW7y
         VUGOufGGCiIA/+BBcoR8XZVEkzcpfFMrjRRKhzpQZgRoEn8c81ZQoitssttW8D7wILTT
         qWlnf+NKvgCjmOvOsKW40lKjWWd8Tuuq4ALECRZlMie9EAYI3Z8U7+zZai88XzT/c6Gb
         z9qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZMSFuT6r;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id y6si3595682ybe.365.2019.12.17.08.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2019 08:39:20 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZMSFuT6r;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576600759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbJd97UPYoKV5uP5HIXzv9iTL8Rz6OLSDFPr7bKkBZU=;
	b=ZMSFuT6raREBnK6aflTAdsyGLUofp+a6oLDGkblIsQN7ru9s3lAVM3kbxirs6dKBqF7Dme
	DXjOTFGTVPi+jKYTkf2GHUGR9c8Zg/JOzwguULKIzTqbRIdgedDE5MVGj8hSxuurW8Gdks
	FKSN/WgBbMt6HP1K/vmw9fcYg3P8BLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-JyYpJwhBNOmUrZpBXPsPvA-1; Tue, 17 Dec 2019 11:39:17 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67CE810054E3;
	Tue, 17 Dec 2019 16:39:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8131468877;
	Tue, 17 Dec 2019 16:38:40 +0000 (UTC)
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
	Thomas Huth <huth@tuxfamily.org>,
	Corey Minyard <cminyard@mvista.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH 01/14] hw/ipmi: Remove unnecessary declarations
Date: Tue, 17 Dec 2019 17:37:55 +0100
Message-Id: <20191217163808.20068-2-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: JyYpJwhBNOmUrZpBXPsPvA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: p5nlBS6O/ct4

Since we don't use these methods before defining them,
no need to forward-declare them.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
---
Cc: Corey Minyard <minyard@acm.org>
In case the other patches are rejected:
Cc: qemu-trivial@nongnu.org
---
 hw/ipmi/ipmi_bmc_extern.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index 87da9ff99c..450926e5fb 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -87,10 +87,6 @@ typedef struct IPMIBmcExtern {
     bool send_reset;
 } IPMIBmcExtern;
=20
-static int can_receive(void *opaque);
-static void receive(void *opaque, const uint8_t *buf, int size);
-static void chr_event(void *opaque, int event);
-
 static unsigned char
 ipmb_checksum(const unsigned char *data, int size, unsigned char start)
 {
--=20
2.21.0
