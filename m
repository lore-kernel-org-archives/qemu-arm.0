Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp714548wro;
        Thu, 25 Oct 2018 06:36:32 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dbnClVINLJG1BPfO/sxKds2HBvDCHfqaP6SbK/fojvKnQDdeOxF82nI1vR/XhYjyAo1y4D
X-Received: by 2002:aed:3721:: with SMTP id i30-v6mr1484162qtb.58.1540474592030;
        Thu, 25 Oct 2018 06:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474592; cv=none;
        d=google.com; s=arc-20160816;
        b=cuzyiHNPZ82QCMrlAZcy0gtAcGSUEbQZoGqxhENpWTPUW3uKLYJAyaHNulODmj1wax
         if3W8Ll3Bz8i0Y7OUn8Uhk3Z08e6HVkgRSupyFhA/QyU88pbATbn4W5vo/m2DhftBo/S
         fnjcPooI9+DClgWTTxQrmdOezmI4g7GnBDawolJJzxvHl7dN+S3aBdTAkhcLPPA4n9sj
         BqUEw31raF0E8ITwDUKd2wJcBKiDsvUdUTEkir0bSbtMmxU7uOybNr7NthYx2MfzTk4n
         wdPdaZrvFeKt/wPpno/0zvVy1u0nQKaHO3y1JZjyULpF5Wu8ppIqFqbBY8QkTtLngGy4
         nETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=gmFJtoCLGW57H1cUVx6wj4zSU2CUCEgW+QnMKrTvoYQ=;
        b=JkbhLBPw0mLbFOdwtZIRJRlknj0ClYfTXaPMr9rcjY7rR46DR5GULEQdCWFOlN/0ye
         xX4VaclQsVfLxbWMof2qebQV+Kbe70bnwE+GSWy6xi2gw+Wyg7zS4Bl3b/Rf5KSm3sut
         J5K+5JeYqiZ+B/Ln/HiCaa5mS/tZTdjMu343L3uEl6pRTgIdubexsqGqKs0dBFoGUX2q
         pMZxcs1R9pr1F5Fjxp6AjJxggwpsAu+kQpqI+iU0eoQCbPMPtMsnYyRaTHUnKoTB1q7/
         BGd4Eg27VcQtnH+A1F05WzRRFsZZtVMxcSmvyFR35UmUNkE8ZaGjncifg+Xln4wrSpFa
         ppjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k40-v6si1078405qtb.401.2018.10.25.06.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:36:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54493 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfoN-0003Tu-CA
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:36:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfn0-0002Qr-5A
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmw-00081j-TJ
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51152)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfmw-00081D-Ne; Thu, 25 Oct 2018 09:35:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A742C30832E9;
	Thu, 25 Oct 2018 13:35:01 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D940E5D6AA;
	Thu, 25 Oct 2018 13:34:56 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:34 -0300
Message-Id: <20181025133301.16578-17-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 25 Oct 2018 13:35:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 16/43] machine: fix a typo
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	qemu-trivial@nongnu.org, Li Qiang <liq3ea@163.com>,
	Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sCJ5ZrTWJKiB

From: Li Qiang <liq3ea@163.com>

Cc: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
Message-Id: <20181010161025.34796-1-liq3ea@163.com>
Reviewed-by: Stefano Garzarella <stefanogarzarella@gmail.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1987557833..da50ad6de7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -636,7 +636,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
         machine_get_memory_encryption, machine_set_memory_encryption,
         &error_abort);
     object_class_property_set_description(oc, "memory-encryption",
-        "Set memory encyption object to use", &error_abort);
+        "Set memory encryption object to use", &error_abort);
 }
 
 static void machine_class_base_init(ObjectClass *oc, void *data)
-- 
2.18.0.rc1.1.g3f1ff2140

