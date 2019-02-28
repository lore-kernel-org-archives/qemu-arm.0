Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp681165wrx;
        Thu, 28 Feb 2019 07:05:50 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYlaEWtdOn10RNewuch7ZLirpZqFTwD2RJ/gl4I8ygdvgWS+2jM2EcnDa7dGrxNaUQ9sbZ4
X-Received: by 2002:a25:af06:: with SMTP id a6mr6944924ybh.413.1551366350130;
        Thu, 28 Feb 2019 07:05:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551366350; cv=none;
        d=google.com; s=arc-20160816;
        b=bqCF7ZxQ7mmCpeCOON1g2jAibLeHoTWG3kUWbWHy1CHCZbtG1lwlRhkUm8F/G6FY0P
         NMJTwLLtvgQ4006wPwvF1xXZb2AZD6xB9jYbZ9e/TuzDUChq+iqj0oxRdEN8E2/OhxrV
         89iLMDRhjydBPE5JVn4ppqdhFOS4Ee7cchryeyGvFfFfivkf6HVgdbcLHRdzTbg+6f5F
         ILhwm7fcd1kNxi6ZQkmk+oGB/r4QCTpE0TftkeXeeTkrecWYwcldFZUXBE2qguNJ8A1B
         yfjX5G7gLI3KXAALEOb7jZ1btCaGObPKl0woadNbbZSaszcprvxrGtDP9myKx0MR9qZb
         VmXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3ZU/w5s3aqCJwqFuNMmMLFEPqRqeQab6hCDJZVmU42E=;
        b=aZA87aOoI65pbU6LYr9UNErftreeANIKcoLr9VaP67L48X+oK2D9y5aaQJcSbdn8u/
         R1wk1mc7Gt2PwpHqnFbqdrDcsOpQt36j7p39sZy8YSU/8vqM0HUIJUUqZOx7CEvYk25W
         IQyHwc5PghhtxXI1p6TEFfzh0AXayZrBeo8bjyQQSfTE1CoNBiFfbI6Fdg6+7iuzc8eQ
         sYqeUYh3dkTFRfaVpcPoGFj15HU9bgjORbR4IVs+FF9lYizUeUm/AFhsOCR8Yby+qIaF
         t8w21laaPjPD/QmLTgR18xqX/6s3/ZtlE/bjkS7x+La5QH7lZPCwh5T9CpbfaFfaiLbt
         OcrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x72si10734326ywx.148.2019.02.28.07.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 07:05:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzNFt-0002oh-HR
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 10:05:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNEP-0001bp-G2
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:04:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNEO-00044h-Fm
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:04:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41510)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzNEO-00044H-9G; Thu, 28 Feb 2019 10:04:16 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7767C36359C;
	Thu, 28 Feb 2019 15:04:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BFE51973C;
	Thu, 28 Feb 2019 15:04:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Thu, 28 Feb 2019 16:03:20 +0100
Message-Id: <20190228150324.25973-7-eric.auger@redhat.com>
In-Reply-To: <20190228150324.25973-1-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 28 Feb 2019 15:04:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v10 06/10] vl: Set machine ram_size,
 maxram_size and ram_slots earlier
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TNnn+YWzdsx5

The machine RAM attributes will need to be analyzed during the
configure_accelerator() process. especially kvm_type() arm64
machine callback will use them to know how many IPA/GPA bits are
needed to model the whole RAM range. So let's assign those machine
state fields before calling configure_accelerator.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v7 -> v8:
- added Igor's R-b

v6 -> v7:
- add Peter's R-b

v4: new
---
 vl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/vl.c b/vl.c
index 502857a176..fd0d51320d 100644
--- a/vl.c
+++ b/vl.c
@@ -4239,6 +4239,9 @@ int main(int argc, char **argv, char **envp)
     machine_opts =3D qemu_get_machine_opts();
     qemu_opt_foreach(machine_opts, machine_set_property, current_machine=
,
                      &error_fatal);
+    current_machine->ram_size =3D ram_size;
+    current_machine->maxram_size =3D maxram_size;
+    current_machine->ram_slots =3D ram_slots;
=20
     configure_accelerator(current_machine, argv[0]);
=20
@@ -4434,9 +4437,6 @@ int main(int argc, char **argv, char **envp)
     replay_checkpoint(CHECKPOINT_INIT);
     qdev_machine_init();
=20
-    current_machine->ram_size =3D ram_size;
-    current_machine->maxram_size =3D maxram_size;
-    current_machine->ram_slots =3D ram_slots;
     current_machine->boot_order =3D boot_order;
=20
     /* parse features once if machine provides default cpu_type */
--=20
2.20.1

