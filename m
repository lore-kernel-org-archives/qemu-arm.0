Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5044732wrt;
        Tue, 5 Feb 2019 09:59:50 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZZu556xUV/4gju1uMowLtUACJ6cvN5BLA1NodGKbO3tFR7HF2txnVUpFw640mGFiTGb+bO
X-Received: by 2002:a25:404c:: with SMTP id n73mr5012061yba.27.1549389590844;
        Tue, 05 Feb 2019 09:59:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549389590; cv=none;
        d=google.com; s=arc-20160816;
        b=QiU9W6sErv71rwxdm4hOojnxIK+AKfay7cF1EDtFw1agS3CZaZtjQapWbIiKEivyBC
         NU9nThnVX4sMd6g2PoYUxxXxi/W+8EuNrrIWh+MX1vbQcxw6a42FG14wUk9O2G1uT9uv
         OKdwwGphNoAzS38bqgRYl0M7uDU8AOlNXSpit1bvd+FHKFJ27CZupV+tgWhX0MuIMGXS
         MtvJqxmbJ/lVv8HV4s2BTspWH1r+FQNH0X4oF9Gr1PUhmZm6pHJ//B8FcM1FbqHAp84W
         lxJXJ9tMLfYwga4ZP4xj+CH9o4QFSpPFMks3/6eSTXjOLj0Gj6MvAbevnqcxSyE1ch9T
         3h0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YX1rR2WRIJNCTb2sN5wUAkXe8c8AsqsWygnfaZZWwCY=;
        b=cnDIzTSm7zVDfNfUp0W0rzMh9LeeDN0eAxrUfIexnMyzafTWphtCfRw+NzR7H75wCQ
         hCBeX3nlbAeZCxx72fOBtsX7Aau0N5NplEVgvPO6epdMyfMk2SpqvoLLZHFBxOmxsIhh
         T5cPXK/l0bDZ5d9JTxvVG3IknCLKkoXrKfydkZqj+t8QaNs9tHjaY2EvwTEDXBWLI2hv
         qCAowEcPHF0J9TjnwZh+SZQ1QMPCUjHWZp3omqgcCiOztBOnHFYBSAb+4mT7rx7weN1t
         0Qtgncrj+kP5ujdcVoCH55Bxhxztsy5F8gA/o6oEt3m9715Vgj1b3Tv3llgCe5neO3dZ
         akDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si1332592ywk.105.2019.02.05.09.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 09:59:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36069 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr50g-0004Qp-3q
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 12:59:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bh-0000EB-Kd
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:34:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bg-0004Km-8g
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:34:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60195)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4bc-0004Ex-Hq; Tue, 05 Feb 2019 12:33:57 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E9AB58E59;
	Tue,  5 Feb 2019 17:33:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A445717988;
	Tue,  5 Feb 2019 17:33:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:32:56 +0100
Message-Id: <20190205173306.20483-9-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 05 Feb 2019 17:33:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 08/18] vl: Set machine ram_size,
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SQh/rEGrDChk

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
index 9cf0fbe0b8..28f6bbebe2 100644
--- a/vl.c
+++ b/vl.c
@@ -4324,6 +4324,9 @@ int main(int argc, char **argv, char **envp)
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
@@ -4521,9 +4524,6 @@ int main(int argc, char **argv, char **envp)
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

