Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp340361wrp;
        Tue, 3 Sep 2019 04:50:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyENPW66YROPBllAWLWwtHzs/fgtddvyp9SdvH7bCvaLxwoZluOTpKPlL4+o4NQEHkTW+fx
X-Received: by 2002:a37:9303:: with SMTP id v3mr34164667qkd.369.1567511403351;
        Tue, 03 Sep 2019 04:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567511403; cv=none;
        d=google.com; s=arc-20160816;
        b=efvyhcOXSvGeUXw5JnD2AKPaS1v8mbnbVgzoG6u1BLXJ0bJcfKC/hPZoFpMZE8/LHz
         ZKKVqYWXbBwbIpnPb3vu0lGTXQGV3qn2tvWnjm2dcAw0Cb5QzOCg+C/FjfXBseNSkGIl
         AzjRVYXQzcwctHiVd2Q+IM7tY4c5YxJt1pcvFFFuJcGWJ3MARKdIb4zOgVKUltGQTdeS
         NsjH1IVYt7P0VE7SWISVf4xwSvRKgxbk9zbCvc7FEfZXvSz/tztAO1UhneMGVD02+lei
         G0UpriZ9nSxH2PlZ8OZ3ID6Hk08Nq337HF+ZWnlXOmRQk9lBSOEY3qHTzkJMRXBJMhmX
         c8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=b3KKdZDcdc04PsiHX8pE+quiCVd0795OHr3iAnsKDeA=;
        b=W/AwrZcQZbcy0Q9kzdMyGlmbJ4uFOstY3CKDm9a6am0bOH4THmavWz3iqG/bX2Allz
         Effs/nmVcngXyXPpkURBklOIqpaa2ACgaYjDP1kLL3Y2iNo8f8Ma0ToCc3uI8kxe+9v+
         brrJsW2SmjbPwUBNpYV1eIsNI1JScc8eH2wE009Bpz4dD4Avy+fug9fbyKsiqhRwNL3y
         1IVAib2TgD2PhDXoa4RA/XWL5xzTIMrkXu6glord7/m7GW0X/SYhxi9WSkBZ2//olofS
         JQ91fMKYY+O54yfKbIdWTe8LIMPO91iPo1AuHCvn8NlcLtZSEg7u9WPETA2dIJoYYBsY
         7Nlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si5323336qvj.1.2019.09.03.04.50.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 04:50:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i57Jx-0006sn-Vb
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 07:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55149)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i57Hq-00056S-HJ
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 07:47:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i57Hp-0005zb-FV
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 07:47:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39348)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i57Hn-0005xA-6I; Tue, 03 Sep 2019 07:47:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8016685360;
 Tue,  3 Sep 2019 11:47:46 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-102.brq.redhat.com [10.40.204.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E580F5DA5B;
 Tue,  3 Sep 2019 11:47:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 13:47:27 +0200
Message-Id: <20190903114729.3400-4-philmd@redhat.com>
In-Reply-To: <20190903114729.3400-1-philmd@redhat.com>
References: <20190903114729.3400-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 03 Sep 2019 11:47:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 3/5] hw/arm: Restrict pre-ARMv7 cpus to TCG
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pdf/ufT5icCt

A KVM-only build won't be able to run pre-ARMv7 cpus, disable them.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: - "depends on !KVM" -> "depends on TCG" (rth)
    - do not modify default-configs/arm-softmmu.mak (thuth)
---
 hw/arm/Kconfig | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 76a2a6bcbf..1c359a6f47 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,3 +1,15 @@
+config ARM_V4
+    depends on TCG
+    bool
+
+config ARM_V5
+    depends on TCG
+    bool
+
+config ARM_V6
+    depends on TCG
+    bool
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -23,6 +35,7 @@ config ARM_VIRT
=20
 config CHEETAH
     bool
+    select ARM_V4
     select OMAP
     select TSC210X
=20
@@ -32,6 +45,7 @@ config CUBIEBOARD
=20
 config DIGIC
     bool
+    select ARM_V5
     select PTIMER
     select PFLASH_CFI02
=20
@@ -61,6 +75,7 @@ config HIGHBANK
=20
 config INTEGRATOR
     bool
+    select ARM_V5
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -86,6 +101,7 @@ config MUSCA
=20
 config MUSICPAL
     bool
+    select ARM_V5
     select BITBANG_I2C
     select MARVELL_88W8618
     select PTIMER
@@ -99,6 +115,7 @@ config NETDUINO2
=20
 config NSERIES
     bool
+    select ARM_V6
     select OMAP
     select TMP105   # tempature sensor
     select BLIZZARD # LCD/TV controller
@@ -121,6 +138,7 @@ config OMAP
=20
 config PXA2XX
     bool
+    select ARM_V5
     select FRAMEBUFFER
     select I2C
     select SERIAL
@@ -232,10 +250,12 @@ config COLLIE
=20
 config SX1
     bool
+    select ARM_V4
     select OMAP
=20
 config VERSATILE
     bool
+    select ARM_V5
     select ARM_TIMER # sp804
     select PFLASH_CFI01
     select LSI_SCSI_PCI
@@ -327,6 +347,7 @@ config XLNX_VERSAL
=20
 config FSL_IMX25
     bool
+    select ARM_V5
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -334,6 +355,7 @@ config FSL_IMX25
=20
 config FSL_IMX31
     bool
+    select ARM_V6
     select SERIAL
     select IMX
     select IMX_I2C
@@ -349,6 +371,7 @@ config FSL_IMX6
=20
 config ASPEED_SOC
     bool
+    select ARM_V5
     select DS1338
     select FTGMAC100
     select I2C
--=20
2.20.1

