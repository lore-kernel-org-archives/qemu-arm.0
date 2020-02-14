Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2246456lfp;
        Fri, 14 Feb 2020 10:38:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqyniJ86TXm5OLjhhHQKAxdIn4oMVN5zs6AXfNI4YCePLBR8EI+a+0C34V9JEGyV+QHfninp
X-Received: by 2002:a0c:efc4:: with SMTP id a4mr3489489qvt.178.1581705508536;
        Fri, 14 Feb 2020 10:38:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581705508; cv=none;
        d=google.com; s=arc-20160816;
        b=L+CG5iPLaZ1x/lsmJeZc4f2njW7eqTQ6/RcUO/efl1ZJxnny3IpYLsUW/Js3e50n5O
         mPTQzQ20lbFzAMtj3dYEO/LUiDLFH9fMoKIZjZ14UFHYu63EBh/MZr2eQ+7IFNJhrEcl
         GB96uCPFIzgArAHFTwvFB4CkYNvu8IhXTMLSjGc32hFHvLcsuUNjbRKLVlImJRMYRh21
         bFvhuwzq7X/tto7PyNlukq1ShLJ9uH24bRD8Q7pMNxwm1x1Q3B+ysynTldapeG3irKWn
         D7+/+L4e5ps/6DKwT51z8h3DdwFGEv8QZ75aglSvAJELywCOUaYSXimRKb+kCNjkQ4Mk
         ulPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WUM5I+j1JR22/Wll5QP0UshXB6fn5FjlT493r1BFhug=;
        b=RziEEj6SahGCIT257C8iWN3JS6E2SqVt0NDP5YflA8vl5k+kh5SLJLSZ8wTTsVqYHO
         VccnKj4fBl1y6nKDO+cPbdDMSUTcyyjRB5yelkwyeOCAIfTPMrUosNmLN2Wt+SK4CIQn
         52eRgmEZhS50DZ0RHcJH0rs5VR2H3SDvEHA9iwxcxxBqqvrOy/J1FU9VnKrQX5n2lFVK
         ELsjJKZeClu5YV3ZqGm4M3wy2ifaDZU/YEzh9wqIIwDXdwQ02yhmyksCUCYXF5/nSwVC
         3gxiv5zHDmyxVE2plsLnRWmATMFwf+VYNPBFVyqbzmv7iB7cBgw+Nh+oNe7M/SDCXMVp
         bNhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PhX2mPCK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si2737074qvu.95.2020.02.14.10.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 10:38:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PhX2mPCK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2frA-0003a2-0h
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 13:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37177)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j2fqZ-0002PC-PU
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 13:37:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j2fqY-0004K1-M8
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 13:37:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28550
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j2fqY-0004Ih-I8
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 13:37:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581705470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WUM5I+j1JR22/Wll5QP0UshXB6fn5FjlT493r1BFhug=;
 b=PhX2mPCKSIKQHu/DBzgvz6UkLqqeaV6vBuU5tIRpFOHklRGx6xC1qAerysWZtiQ6qo7Tv0
 8G6KtqQfQLiH5/5tJRjVOBRTXPBtYf0V0nrUNGZCIVQaK90Cwryd2a2WTJUBI2ToJntBdX
 d5fOA0cMTxzplxnb8N5O0113fJRXOk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-ZSpBLxFoMK2Czdz4eFxCzA-1; Fri, 14 Feb 2020 13:37:47 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D9A3107ACC4;
 Fri, 14 Feb 2020 18:37:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 325215DA7D;
 Fri, 14 Feb 2020 18:37:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [RFC v2 4/6] tpm: Separate TPM_TIS and TPM_TIS_ISA configs
Date: Fri, 14 Feb 2020 19:37:02 +0100
Message-Id: <20200214183704.14389-5-eric.auger@redhat.com>
In-Reply-To: <20200214183704.14389-1-eric.auger@redhat.com>
References: <20200214183704.14389-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ZSpBLxFoMK2Czdz4eFxCzA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
X-TUID: RghjM1Aq/bdA

Let's separate the compilation of tpm_tis_common.c from
the compilation of tpm_tis_isa.c

The common part will be also compiled along with the
tpm_tis_sysbus device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
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
index eb0f23b108..33dd3c89cc 100644
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

