Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2543053wrg;
        Mon, 13 May 2019 01:31:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNXfBAw7sEQeYdc+Ta/pHPplCBhHHBl+SDCa+XB8mq+Y5GF+S8T4nBDx/xrhLcFjYw7108
X-Received: by 2002:aa7:c44e:: with SMTP id n14mr27453345edr.203.1557736315595;
        Mon, 13 May 2019 01:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557736315; cv=none;
        d=google.com; s=arc-20160816;
        b=vIE3mJtkuNQ6tzM9UwzY0wClk0/puY2NB5k7NzPczjCih61jrtOULkYjYDYJ4J14Oc
         xEO9G+F/CvIPh0Ox2m7q98Qg9r5igWdavwmXjE/9blwNamPlmc/WRUkTXXZw6XGYeNDD
         7sRlEltlgBmIFiuk/xWvP4DD44fSJkYO0Ckl+Uej7bkgeNLiopR38InsVTBl2bCn2DMY
         VV5QdN4+dY3E5wshufvfBwZSiw6km7DRsaOPBPXlHfQJYIlbJ3n1zuYcWKU/wXHPPevL
         lpmx7pY64eu/7EtN3Pr/9MoeW3PcmMCOaMb2QcqrVo1fUeL+Xso3OwVq0ZdnEI9RvrGL
         Bb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=PDVCOVMY70a3t9IYBqGeTAN88myHoHxhj0Z4Okl/CHM=;
        b=rsKLJmx7lSmqgiI95sp8B/Z7QM4UNYiMy3mgtWsRVl7I+ywbomWsndxgpYQs+h1EcY
         Psxd8w/stPdWlPZTi83FjWYicPbTtm6I+TV4UeeOoz8CZ7RH3dMz7OxOnaNiZvfvO5rA
         tNa8m3I2FOAURI+v52LOOTZKqzlPyZw1Ok3PsL11FVBBG114jCE6itLU1/TkRDcn8pyx
         I0t4WBcMGkq8aNVP4SM1P7ftnLqKzoyw2c3W2ILFxlKoQakyEM6HMAtQCh/m3FzYQpAA
         SMFEyN1doNrFH0oMWaLHeT+T3vNRR/WrrSuAGFWnPEnjfB/ntVMocb7Y3GM9oP4PDF4v
         OiSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si280683edm.48.2019.05.13.01.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 May 2019 01:31:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQ6ND-00070J-1D
	for alex.bennee@linaro.org; Mon, 13 May 2019 04:31:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQ6LI-0005OH-MT
	for qemu-arm@nongnu.org; Mon, 13 May 2019 04:29:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQ6LC-0005OW-W4
	for qemu-arm@nongnu.org; Mon, 13 May 2019 04:29:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45220)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hQ6LC-0005Nb-9u; Mon, 13 May 2019 04:29:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 666813092648;
	Mon, 13 May 2019 08:29:45 +0000 (UTC)
Received: from thuth.com (ovpn-116-122.ams2.redhat.com [10.36.116.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 862956B8D1;
	Mon, 13 May 2019 08:29:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Mon, 13 May 2019 10:29:39 +0200
Message-Id: <20190513082940.30295-2-thuth@redhat.com>
In-Reply-To: <20190513082940.30295-1-thuth@redhat.com>
References: <20190513082940.30295-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 13 May 2019 08:29:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v3 02/29] Makefile: Fix inclusion of the
 config-devices.mak.d Kconfig dependencies
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /AyswD4umJFF

The Makefile tries to include device Kconfig dependencies via

 -include $(SUBDIR_DEVICES_MAK_DEP)

and thus expects files that match *-softmmu/config-devices.mak.d ...
however, the minikconf script currently generates files a la
"*-softmmu-config.devices.mak.d" instead, so the dependency files
simply got ignored so far. For example, after a "touch hw/arm/Kconfig",
the arm-softmmu/config-devices.mak file is currently not re-generated.
Fix it by putting the dependency files in the *-softmmu folders now.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile               | 2 +-
 configure              | 2 +-
 docs/devel/kconfig.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 4a8ae0ef95..66d5c65156 100644
--- a/Makefile
+++ b/Makefile
@@ -350,7 +350,7 @@ endif
 # This has to be kept in sync with Kconfig.host.
 MINIKCONF_ARGS =3D \
     $(CONFIG_MINIKCONF_MODE) \
-    $@ $*-config.devices.mak.d $< $(MINIKCONF_INPUTS) \
+    $@ $*/config-devices.mak.d $< $(MINIKCONF_INPUTS) \
     CONFIG_KVM=3D$(CONFIG_KVM) \
     CONFIG_SPICE=3D$(CONFIG_SPICE) \
     CONFIG_IVSHMEM=3D$(CONFIG_IVSHMEM) \
diff --git a/configure b/configure
index 63f312bd1f..8999698bc2 100755
--- a/configure
+++ b/configure
@@ -1832,7 +1832,7 @@ exit 0
 fi
=20
 # Remove old dependency files to make sure that they get properly regene=
rated
-rm -f *-config-devices.mak.d
+rm -f */config-devices.mak.d
=20
 if test -z "$python"
 then
diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index cce146f87d..d6f8eb0977 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -299,7 +299,7 @@ and also listed as follows in the top-level Makefile'=
s ``MINIKCONF_ARGS``
 variable::
=20
     MINIKCONF_ARGS =3D \
-      $@ $*-config.devices.mak.d $< $(MINIKCONF_INPUTS) \
+      $@ $*/config-devices.mak.d $< $(MINIKCONF_INPUTS) \
       CONFIG_KVM=3D$(CONFIG_KVM) \
       CONFIG_SPICE=3D$(CONFIG_SPICE) \
       CONFIG_TPM=3D$(CONFIG_TPM) \
--=20
2.21.0

