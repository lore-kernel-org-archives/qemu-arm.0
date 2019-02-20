Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5052341wrx;
        Wed, 20 Feb 2019 14:51:13 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaWLyDU2MxQW4yJ3m4KVK/EFWdgYbE6T8yBtaOIY+75fjBp+MJumkuIkDFgJaGE8Xo6VSJj
X-Received: by 2002:a25:71c2:: with SMTP id m185mr11810849ybc.162.1550703073777;
        Wed, 20 Feb 2019 14:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550703073; cv=none;
        d=google.com; s=arc-20160816;
        b=qB16JjM9p407panhI1EdnfTlCWY1BQuRRn3p+3VbjCmN9v+pxqAm+hXR+QPiMH/q5E
         23tW6Pmee5g3wguRmwa3u6dm2KNTnHsrFWYf7gdecMHTVK8y5capCJ2tfAbRXqtlDlmH
         ZKcdH96yW8pW0uwnRgRG5mGuE2Q6VhRacrcRYecUi7SzydhSKhU1FhLx+fk6irF4TSJV
         smY22/Y8EV6ZyI8EUay9ibaot1nuFn/Xe6AM7EMCYtqsn0PQG2cpUS5NGwjHlm2n1mK1
         U8Eb55wQDnG6zSKXAiQCk62sMRJW/YIxAEbfrkyaE286wqxL5+lwSg/89jcIbe7k3dKv
         RNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=mXum4Ib+hDm4l3zc0V9E04ZBWfZs3QWr15a7bvjfYB0=;
        b=GaiCWSIzAcj4a9PC47m8RjVA7ArdOBysqEjQMqEqWyA3kr7Oug15UCECrkt3QjQWec
         lEHJWaIhF8cwcLt/nHAlGZnTgMQDyxjJZgYkZ3N8agME3a8TQOrUHMj5zT7+z2Q4P2kM
         qfvucM1NU2Lyy21XXXBhrZZqr2KaybwiU+cbsm+1JQkODWGPR7KiXuj5DPEHnekhd8dv
         OIKoTEYiZeCmZAg+Lr58tBb3tZuYA+dadfX2DMRsl+uXOS7eyoklvGyAmISoIJYO80Bg
         tLi1Fb/gaN4BYdh7ZAbmLTO2aZWfOpe92OO9GJt8RCDHVWdRfUKO64BADyS6FI/1LdS9
         MFFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a84si11953966ywh.254.2019.02.20.14.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:51:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwaht-0004FB-7C
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:51:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXe-00044S-TX
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXd-000057-3A
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaXc-0008WJ-T3; Wed, 20 Feb 2019 17:40:37 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4310C0467D9;
	Wed, 20 Feb 2019 22:40:35 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C1D25D6AA;
	Wed, 20 Feb 2019 22:40:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:52 +0100
Message-Id: <20190220224003.4420-7-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 20 Feb 2019 22:40:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 06/17] vl: Set machine ram_size,
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NjMhGxQPYY1G

The machine RAM attributes will need to be analyzed during the
configure_accelerator() process. especially kvm_type() arm64
machine callback will use them to know how many IPA/GPA bits are
needed to model the whole RAM range. So let's assign those machine
state fields before calling configure_accelerator.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
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

