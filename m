Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp517978wrt;
        Wed, 23 Jan 2019 02:16:41 -0800 (PST)
X-Google-Smtp-Source: ALg8bN45xPvjmLyTntc79mLFmDPIlzTa6JuP7mleh6Gf7aOtf+F1+VDTdNYz6XqTyH0l7G9pbYzj
X-Received: by 2002:a5d:60cc:: with SMTP id x12mr1900120wrt.193.1548238601954;
        Wed, 23 Jan 2019 02:16:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548238601; cv=none;
        d=google.com; s=arc-20160816;
        b=KX5BTkMKvdd0QOs+110w7cHia+4IhiEw6I5yEt9Kzc5JUZvUq5TzQxl4fzJ+Ryd+J9
         epk8raAEPm2IBasG1fcjrKQlT+VQ33MUV8IpGotHyy37reTvuaPpTycAYIpPn3fnWgbM
         rNkjS2fXFeEBXzmYmzqOqos7BL8QeUJNR8byk4KCFuEp1laUhhvhhO6fgshGmEgtm900
         WgoH+vBWzWiFjLuwLQ8WpuAn8mp0tNHPXePxVw0yQ8RV0zBWcwm0mInYZjwCKvE58Kpv
         Zoj57oTCZHTqmKpy/F/0khyjY4Czu7mbypa2sy72GfKqI5Fri7bFnzH+TMoFSSdxdp14
         0/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=hRp2g3UftOLjpcuXHRltj9VCL46tbcnJ8ueBLEIvpSk=;
        b=b5dUYx9yLQ4X2CV7qWTnGFRjV0gXyyDfdIPR/Sgkkrco+WFuUbbZtjjtw0SJxWE1rz
         MWAFThX32sMHFAv3I0sOnYjLINtej3rFOw8zIURdLVSCulEukgIuqmS+zDxs1vjbIEuN
         qtUtm8fE9jFn+9Z23d1k79xb+UyLC/JApzI+ncjcQC27IiYLZ9YX2LrnOtIacoxaFTOl
         5DEnSOHO6smhe++6OB/jUuyAJO67NHb+4nd0WaLRZbabrJGQQ69LwJP50Sx9JGh26wS5
         iGYnuJE5K/UP1JVAAQNcA8bFKO6AhLpxl3/0fJF3iCFI7/1x0GpRhr2FnayXktken+qw
         QHVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si74115397wrh.313.2019.01.23.02.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:16:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFaK-00020s-V1
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:16:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZd-0001bn-L5
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZY-0007M6-FQ
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35136)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFZY-0007KK-7w; Wed, 23 Jan 2019 05:15:52 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 408FBC057E00;
	Wed, 23 Jan 2019 10:15:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 134F560181;
	Wed, 23 Jan 2019 10:15:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:48 +0100
Message-Id: <20190123101458.12478-9-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 23 Jan 2019 10:15:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 08/18] vl: Set machine ram_size,
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
X-TUID: o2W3D7DMzMYP

The machine RAM attributes will need to be analyzed during the
configure_accelerator() process. especially kvm_type() arm64
machine callback will use them to know how many IPA/GPA bits are
needed to model the whole RAM range. So let's assign those machine
state fields before calling configure_accelerator.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4: new
---
 vl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/vl.c b/vl.c
index bc9fbec654..844267201e 100644
--- a/vl.c
+++ b/vl.c
@@ -4321,6 +4321,9 @@ int main(int argc, char **argv, char **envp)
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
@@ -4518,9 +4521,6 @@ int main(int argc, char **argv, char **envp)
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

