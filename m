Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3448299wrx;
        Mon, 4 Mar 2019 02:17:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwMz1g1fKCnXgweGssPvCdLFukkM2JMEzz9lhvrhfOvtLefdNMmM7qAZq/BuiJtjDkjnAY2
X-Received: by 2002:a25:8884:: with SMTP id d4mr14220092ybl.451.1551694625083;
        Mon, 04 Mar 2019 02:17:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551694625; cv=none;
        d=google.com; s=arc-20160816;
        b=Kf3lzDLGW8O3NB/O12n7dalBEbxwMWe7zeg8q93WIARa1K6u2cF/2POxgaWshsriq5
         6gwGFP1Ha/WUrc+rta0OPsktGvU64hQGxN5jz4is3bKqxBwtGH+rkcB35zzomsFZTpNm
         4dPpOjCWuj/Asu7G+US+31ydYrB5lAsEqjLDBvOB/P6UzTpfoea8jjCi7hfAFOtjHu8H
         jWAnGN5R/HkqzUIQXRyA/g8nzJEwYEDP8UM7GmZFeuqgUqiYzW2ks2TDNd7BJ3RdgNtg
         jM0Dore8Q2JqN/2g72qjyw+HWlZ3Iw//NQZX1pY0h5KrYLjnykam2iZ1+qc8gqgN9/Vh
         F5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3ZU/w5s3aqCJwqFuNMmMLFEPqRqeQab6hCDJZVmU42E=;
        b=BbjKM8VadDBQRMG6HMVVmPi6XuHQiE1jfHdfPNvJXZmtZWSKSx7/SEZwUD9eYcLy9R
         QJloxufoQOyyPg4mbhJF57H93j1K5KWRldJiEUrWKQ78k3EzMXBOLGNw/irUphla25nk
         y899kpO6W/Xpmt4hwM3iT7EntEdXEuP4cnDVVhGz5B4WxbyPhDNMJTzJw9lsh3dQosl/
         TwY87PFKdApJndz1p8cHgvqsvxFGYXa3Of7YFTfYU2qABJHzHsxNYjs/aH7PqiykAxd5
         j/YSFdIkX/9IhbmFW5L6jJidqqquE3EsY+MfywrHc1QesF50HsBxt9V7FrfrhkVImq8m
         jH3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 203si2864270ybo.413.2019.03.04.02.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 02:17:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0kee-00034S-Gw
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 05:17:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kcP-0001jI-2N
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 05:14:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kcO-0000OL-7Q
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 05:14:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40170)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h0kcM-0000Jf-94; Mon, 04 Mar 2019 05:14:42 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 831B13097021;
	Mon,  4 Mar 2019 10:14:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6325519C3;
	Mon,  4 Mar 2019 10:14:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Mon,  4 Mar 2019 11:13:35 +0100
Message-Id: <20190304101339.25970-7-eric.auger@redhat.com>
In-Reply-To: <20190304101339.25970-1-eric.auger@redhat.com>
References: <20190304101339.25970-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 04 Mar 2019 10:14:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v12 06/10] vl: Set machine ram_size,
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
X-TUID: uPdI+IX1KaLH

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

