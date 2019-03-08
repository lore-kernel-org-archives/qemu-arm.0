Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7811244wrx;
        Thu, 7 Mar 2019 17:40:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqw1f9ULqd0GZ18sOU/FlGXajXJ7EkoTu9Wsf7eRE5QUTo7Fvk5pKxXQVMqIfir9/1CN8NDQ
X-Received: by 2002:a25:8101:: with SMTP id o1mr4186930ybk.504.1552009256666;
        Thu, 07 Mar 2019 17:40:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552009256; cv=none;
        d=google.com; s=arc-20160816;
        b=SikgcATRQEM+0KcIZIaBja8VOyVtk6uGt9bPYPsBNrWIPV3fps6YqpvthxwmRwrBMT
         s7TAKvNWqKlKcHmyMajupTNAefa6jRyQtPyK3XneghvkxwTGONin0BJRu86kh2CA0am7
         ykXRcQFn0ouapQ9OX7Y+rdxVsSfDMWS/172a1i4FQB23HxjkcEjDAHRXOL5GTqH9xz4d
         MF6X5Ew7K+nbPgANP+t2fe0BTmgu3YE7FSyz7axXFTKuUG1mrGvA4IFzbajyTSsoLKbL
         MWfp8DVMZj0gS7UEcpaNdio63HBHjhBdYmIBoH7BXb66OQqZVJs01VvfBOn7pyyJPyR+
         ZOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=yTqmdjK/mkD1qYtJWOhELfc+eocqOTfhk/uCaS/lzUw=;
        b=rFELyBt6zaL6xPLTnhBu0ER0nZUaKVcRFEsh9PRAN802AvvGkbSnoDpp4us0Xc5EDu
         OA+PfkcCaMusstQ735BfZihnB5Dn/xyS7H7tI/KCZbki5HqoNoDa5XiIlgyvRO1XMW6r
         yuYRt4KIDFhecKjp3utWIQqlGWB3lfPT2EO7Ck3pFCfG2vpsUt15wvnWK2VCAfk/VWDf
         H5lOEM/Rs4DYH5JVw9A93sZFjjcoePbaKfMLGJKHPkTqEY5zxuhi0VFIdK/Z6595f6Ra
         AHxoHxggS2gsx8m3Vu/WP70lS1CM+7oopEV8fmuwMEHIXhkfFSuFW9S1JHLoeHt0VD+Q
         W7ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d184si3553949ybb.61.2019.03.07.17.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:40:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24VM-0000hO-24
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:40:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24P2-0003Au-UL
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:34:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24P0-0001lI-Vo
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:34:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33796)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24P0-0001i9-O6; Thu, 07 Mar 2019 20:34:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6A04C0578F8;
	Fri,  8 Mar 2019 01:34:18 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B83E6B473;
	Fri,  8 Mar 2019 01:34:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:14 +0100
Message-Id: <20190308013222.12524-11-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 08 Mar 2019 01:34:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 10/18] hw/nvram/fw_cfg: Add reboot_timeout to
 FWCfgState
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
X-TUID: TSe7p6nE6W8o

Due to the contract interface of fw_cfg_add_file(), the
'reboot_timeout' data has to be valid for the lifetime of the
FwCfg object. For this reason it is copied on the heap with
memdup().

The object state, 'FWCfgState', is also meant to be valid during the
lifetime of the object.
Move the 'reboot_timeout' in FWCfgState to achieve the same purpose.
Doing so we avoid a memory leak.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c         | 4 +++-
 include/hw/nvram/fw_cfg.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index b73a591eff..182d27f59a 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -250,7 +250,9 @@ static void fw_cfg_reboot(FWCfgState *s)
         }
     }
=20
-    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup(&rt_val, 4), 4);
+    s->reboot_timeout =3D rt_val;
+    fw_cfg_add_file(s, "etc/boot-fail-wait",
+                    &s->reboot_timeout, sizeof(s->reboot_timeout));
 }
=20
 static void fw_cfg_write(FWCfgState *s, uint8_t value)
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 828ad9dedc..99f6fafcaa 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -53,6 +53,8 @@ struct FWCfgState {
     dma_addr_t dma_addr;
     AddressSpace *dma_as;
     MemoryRegion dma_iomem;
+
+    uint32_t reboot_timeout;
 };
=20
 struct FWCfgIoState {
--=20
2.20.1

