Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11095175wrx;
        Tue, 26 Feb 2019 05:55:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbEnEO9Kq+54yVj5h7cbBOc04Mi6YwhfM0/rJIYDdVPcwXFN7vkkspD2jMWq4/fMCIw/cXU
X-Received: by 2002:a25:4054:: with SMTP id n81mr13866598yba.346.1551189307231;
        Tue, 26 Feb 2019 05:55:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551189307; cv=none;
        d=google.com; s=arc-20160816;
        b=Oh+hqAUFf5OtF38N9tHjCgXtJ6sCkE3qkkOdiMTqd5I4nNMRVHb7fjPO3L0hRCHr6k
         R1mCp6WKjhdroCdh7WFGXuqAVhLDsE6N6vY18erY48h9SW9sbXqXwUbS4gK19uxEKkxb
         EkIh8f0ebqwc1VyE/Yw+kFJGbpyDK4Gi+GWPBxoiafRuEOGC+94k/lBpZVo+lWjhv5Xl
         E49D7hXQsJTxbluaLMm8tL1qJGS5F1zgHxaCh5HcuUrI7BOp5ThNBvt9tOilIqCdDPDM
         Kt0BBMKkuzU7MX019vZPMcDNFhJJFcGhZrK2zSuGcnA4X8nE/o4gOWvBJhLvk7wJyo5o
         eYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3ZU/w5s3aqCJwqFuNMmMLFEPqRqeQab6hCDJZVmU42E=;
        b=x8oV+5PEpIeHlM4zAfvLNiw82SNWXgql2k+xxO3SrfmEP7MZkjXakMQub1FvQbTjVC
         mnVXaUMOto5KqO8wvdBaAvH4bArVf29mV9uwg+l5SgsvatzQ4sb471uezYWOrDzxawOD
         upzejFKut1Iz0j+z/4cDfek3f4+fZdL3aBPqvYhwXR7/7cXI6loJ85CxJPF6gRjMf+3e
         PIPM3e7TBwLYl1axYjjpTk4/UHWjV3uDnMYyzAFxfDL/oVJkw8SCQF1wur7paowA7ozo
         fAh+Zp1ew7zfr3PIGCj5hGJlWzQbrMruXoKgI+F4O373y8a9dUSjFGn5Li98UgVTDF0D
         uK2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u130si6912279ybb.221.2019.02.26.05.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 05:55:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gydCM-0002dN-Mg
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 08:55:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8W-0000BW-0a
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8V-00074i-2I
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56378)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyd8P-0006p2-5e; Tue, 26 Feb 2019 08:51:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A35FEC05A1D8;
	Tue, 26 Feb 2019 13:50:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA8195F726;
	Tue, 26 Feb 2019 13:50:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 14:50:02 +0100
Message-Id: <20190226135014.31854-7-eric.auger@redhat.com>
In-Reply-To: <20190226135014.31854-1-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 26 Feb 2019 13:50:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v8 06/18] vl: Set machine ram_size,
 maxram_size and ram_slots earlier
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DWS6pKL24pkv

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

