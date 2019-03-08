Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7807121wrx;
        Thu, 7 Mar 2019 17:34:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzfiJsonEFZd11OPiELNvfLHIooT2a5aM9IEzFfK78jx7XBr9sT3ZM3mIIjTpAYQ8UroTB4
X-Received: by 2002:a5b:60f:: with SMTP id d15mr14057093ybq.183.1552008888704;
        Thu, 07 Mar 2019 17:34:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552008888; cv=none;
        d=google.com; s=arc-20160816;
        b=gaS6iCwHcR58KKzcF4A4U90Quy4vjL2iohjE6GELdwu3SrMbPRSbueCFI45KMPSMXC
         kWybxQn12vDVuozOa/GpL/YtxkD3n3IZoOwVmCVZ2pvYXEe3rCBJJGHdjtaZqeVsrmHV
         14BE9uhuH5MhVM5GBI+g7CFG64qPPjusimhGp75mvQWn64Pu5PBPEC/1mE/VqCWlCtVC
         bTXQpd8j674Qnhda6t8b7dGNOA3cqsu/2sDQetKJczWO1JWDAXab/jUrdMh3Ir/L1bCz
         erenTpCWpP2uPfWGp879EYwrEm4QGJ1yanZmCk4R9adzepayDriRHGdZZy0oaxnPIuTT
         qFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5BJV47WkcrHytwszKngLrDQJRl5Fzdzs4hS3Qf7qIK0=;
        b=ebStZ1KsqZ6tDcXL4Q1Zr9sneJvLUSY/iYp/AMt9qTdfyysuP92kfQkLy5HpDpyGYe
         bux+eVckzms169i+D0cJpjws6VvcsLUCknXnLsA5uqEGpnT0QtrQqxAHkiumoQLsSKDJ
         DKTTcn9PTA1fJFYyJrLJJpOf2EWpjLIt3wewhepqtWm9iQJcfo6A/jmuvboiT/eh4Jdb
         tfxV96s7/e2b2pCQBOWQi0vfsaFqIzm/PePeIQtqPQmGY64kb758aEfpMA5BOPv+IC9Q
         ufP4d+FnASzM1EAuWfzlAGqh7BbY542IhPAM0Bc2H12k0vYGIKYxIWuE6CbHM7injmaJ
         GYwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w64si3930240ywd.443.2019.03.07.17.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:34:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24PQ-0003JN-49
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:34:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24OU-0002bW-Rv
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:33:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24OT-00017e-W2
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:33:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39226)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24OT-00013u-F8; Thu, 07 Mar 2019 20:33:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E521307E079;
	Fri,  8 Mar 2019 01:33:46 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 157E060BE5;
	Fri,  8 Mar 2019 01:33:36 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:11 +0100
Message-Id: <20190308013222.12524-8-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 08 Mar 2019 01:33:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 07/18] hw/nvram/fw_cfg: Add
 fw_cfg_common_unrealize()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gQOvmUpMJtWw

Back in abe147e0ce4 when fw_cfg_add_file() was introduced, there
was no QOM design, object where not created and released at runtime.
Later 38f3adc34d finished the QOM conversion of the fw_cfg device,
adding the fw_cfg_common_realize() method.
The time has come to add the equivalent destructor and release the
memory allocated for 'files'.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index b2dc0a80cb..0fb020edce 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -959,6 +959,13 @@ static void fw_cfg_common_realize(DeviceState *dev, =
Error **errp)
     qemu_add_machine_init_done_notifier(&s->machine_ready);
 }
=20
+static void fw_cfg_common_unrealize(DeviceState *dev, Error **errp)
+{
+    FWCfgState *s =3D FW_CFG(dev);
+
+    g_free(s->files);
+}
+
 FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
                                 AddressSpace *dma_as)
 {
@@ -1127,6 +1134,7 @@ static void fw_cfg_io_class_init(ObjectClass *klass=
, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->realize =3D fw_cfg_io_realize;
+    dc->unrealize =3D fw_cfg_common_unrealize;
     dc->props =3D fw_cfg_io_properties;
 }
=20
@@ -1190,6 +1198,7 @@ static void fw_cfg_mem_class_init(ObjectClass *klas=
s, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->realize =3D fw_cfg_mem_realize;
+    dc->unrealize =3D fw_cfg_common_unrealize;
     dc->props =3D fw_cfg_mem_properties;
 }
=20
--=20
2.20.1

