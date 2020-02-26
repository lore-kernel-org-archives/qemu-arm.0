Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3545595lfg;
        Wed, 26 Feb 2020 13:05:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpDjcvr7hXpbbgBWKI9b6V9mKlxT+WBs19CggKYH7t2ummvrg6HyDw4XSJPrflnJfakKM8
X-Received: by 2002:a05:620a:2224:: with SMTP id n4mr1205768qkh.21.1582751144487;
        Wed, 26 Feb 2020 13:05:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582751144; cv=none;
        d=google.com; s=arc-20160816;
        b=fgmpedZUL2JbIA2oSHj1ElbVYMPV+ZGKOEaFGEj3e9FnKE56obafC7YYbAT0ytyFtB
         iOjT9DXOHG5UcOm26vbNvuv1f4/uMtZMtAtnP4nARD0t1blYhjA618gv5zogP4jLDdTY
         zfC1anMQrGoNb+yHu8PgC9TAyGksDCtkg8USrxnWa4o5azf5hQSMUa0EFAXz/hDfwh43
         Xy8bEVrTxejlQhQLmVI5sFmPTDXhTE9qiKjtvF8LmpSxGoMnFlf7JudWCtyvwccoepz9
         voUCXnEsHbGBQ6FkZCS9egsWN/TG995Nl04nPVEmFGIBSU/oqwMN6VDymDGvAc3xzLj9
         XUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AcEAzEIg5Y72FmfbH2zPaJhaPozpVkgSIhG9NLMTJFE=;
        b=IBxlDal3isXDixvVq3rMv+SFDYsEBdurDdfG6jFy/lZtNzk1HowO1LCI4whggwzkAJ
         GD9rf1yTO1ofewoAc25hnQSEUI8tPPjSaXffkkhYjYZQejf43cKzzlC8HKOM6/s4x5mt
         7J+7lYh8jKSbvW8Eh9N2GHe6fStxFMPsmN20GCOXFcgxcknlPDVrrf+SWUa8tGNLuQUG
         voJbiwum7lw3RDwF5XeDQlSqB8VqVRBC8mI9nnTfMe5v2L+POKK+xxtQ66t1BFsyBKRn
         tXw9Z6G8ei/UWOlfkWHJzvi1Y2XvaQltL5aE4NL/57L0VvYiOuBpqKtfpAj6R7rGWszO
         bXrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bBGOkw8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si350706qka.154.2020.02.26.13.05.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 13:05:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bBGOkw8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j73sF-0005an-PQ
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 16:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j73n7-00072o-HK
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j73n6-0002Yp-5W
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52421
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j73n6-0002Xq-1J
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582750823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AcEAzEIg5Y72FmfbH2zPaJhaPozpVkgSIhG9NLMTJFE=;
 b=bBGOkw8h3HCPtkVdc/Or/va5C+EglBxTyQVw00My8KFzi9fpe/h4JM4ntNP2G6kJJmpPRe
 J60lNuJYS/xFkaSTlk9u79TEdjC7AT9nkgqB5e+21u86VhSKWRH/bVker5nk3eKgW+Y4AR
 kIkKRAEZmJ01IgRbybWQ5KB2E5VKY94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-8KkmQhT3OVqcbAR8SYvUTA-1; Wed, 26 Feb 2020 16:00:22 -0500
X-MC-Unique: 8KkmQhT3OVqcbAR8SYvUTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D94FA13F7;
 Wed, 26 Feb 2020 21:00:20 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73F025C545;
 Wed, 26 Feb 2020 21:00:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 04/10] tpm: Separate TPM_TIS and TPM_TIS_ISA configs
Date: Wed, 26 Feb 2020 21:59:36 +0100
Message-Id: <20200226205942.11424-5-eric.auger@redhat.com>
In-Reply-To: <20200226205942.11424-1-eric.auger@redhat.com>
References: <20200226205942.11424-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iIA5HuvAAVnO

Let's separate the compilation of tpm_tis_common.c from
the compilation of tpm_tis_isa.c

The common part will be also compiled along with the
tpm_tis_sysbus device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

---

v2 -> v3:
- added Phillipe's R-b
---
 default-configs/i386-softmmu.mak | 2 +-
 hw/i386/Kconfig                  | 2 +-
 hw/tpm/Kconfig                   | 7 ++++++-
 hw/tpm/Makefile.objs             | 3 ++-
 tests/qtest/Makefile.include     | 4 ++--
 5 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmm=
u.mak
index 4cc64dafa2..84d1a2487c 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -20,7 +20,7 @@
 #CONFIG_SGA=3Dn
 #CONFIG_TEST_DEVICES=3Dn
 #CONFIG_TPM_CRB=3Dn
-#CONFIG_TPM_TIS=3Dn
+#CONFIG_TPM_TIS_ISA=3Dn
 #CONFIG_VTD=3Dn
=20
 # Boards:
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index cdc851598c..c93f32f657 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -20,7 +20,7 @@ config PC
     imply SGA
     imply TEST_DEVICES
     imply TPM_CRB
-    imply TPM_TIS
+    imply TPM_TIS_ISA
     imply VGA_PCI
     imply VIRTIO_VGA
     select FDC
diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
index 9e67d990e8..686f8206bb 100644
--- a/hw/tpm/Kconfig
+++ b/hw/tpm/Kconfig
@@ -2,9 +2,14 @@ config TPMDEV
     bool
     depends on TPM
=20
-config TPM_TIS
+config TPM_TIS_ISA
     bool
     depends on TPM && ISA_BUS
+    select TPM_TIS
+
+config TPM_TIS
+    bool
+    depends on TPM
     select TPMDEV
=20
 config TPM_CRB
diff --git a/hw/tpm/Makefile.objs b/hw/tpm/Makefile.objs
index fcc4c2f27c..3ef2036cca 100644
--- a/hw/tpm/Makefile.objs
+++ b/hw/tpm/Makefile.objs
@@ -1,6 +1,7 @@
 common-obj-$(CONFIG_TPM) +=3D tpm_util.o
 obj-$(call lor,$(CONFIG_TPM_TIS),$(CONFIG_TPM_CRB)) +=3D tpm_ppi.o
-common-obj-$(CONFIG_TPM_TIS) +=3D tpm_tis_isa.o tpm_tis_common.o
+common-obj-$(CONFIG_TPM_TIS_ISA) +=3D tpm_tis_isa.o
+common-obj-$(CONFIG_TPM_TIS) +=3D tpm_tis_common.o
 common-obj-$(CONFIG_TPM_CRB) +=3D tpm_crb.o
 common-obj-$(CONFIG_TPM_PASSTHROUGH) +=3D tpm_passthrough.o
 common-obj-$(CONFIG_TPM_EMULATOR) +=3D tpm_emulator.o
diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index e769c1ad70..028af5b782 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -54,8 +54,8 @@ check-qtest-i386-y +=3D q35-test
 check-qtest-i386-y +=3D vmgenid-test
 check-qtest-i386-$(CONFIG_TPM_CRB) +=3D tpm-crb-swtpm-test
 check-qtest-i386-$(CONFIG_TPM_CRB) +=3D tpm-crb-test
-check-qtest-i386-$(CONFIG_TPM_TIS) +=3D tpm-tis-swtpm-test
-check-qtest-i386-$(CONFIG_TPM_TIS) +=3D tpm-tis-test
+check-qtest-i386-$(CONFIG_TPM_TIS_ISA) +=3D tpm-tis-swtpm-test
+check-qtest-i386-$(CONFIG_TPM_TIS_ISA) +=3D tpm-tis-test
 check-qtest-i386-$(CONFIG_SLIRP) +=3D test-netfilter
 check-qtest-i386-$(CONFIG_POSIX) +=3D test-filter-mirror
 check-qtest-i386-$(CONFIG_RTL8139_PCI) +=3D test-filter-redirector
--=20
2.20.1

