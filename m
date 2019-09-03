Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp341329wrp;
        Tue, 3 Sep 2019 04:50:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVYvx292JUpCGj7mwDkNHEjcNbu5G0wrX3wNebppu5rpb/B4rzOuL3UX+l02JOPQ8MV0zg
X-Received: by 2002:ac8:342a:: with SMTP id u39mr10668107qtb.7.1567511456297;
        Tue, 03 Sep 2019 04:50:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567511456; cv=none;
        d=google.com; s=arc-20160816;
        b=cPW3T3ZBulIbjxvyqI3Q7fp9huHsyXFYjyYrswo81Fi6fdUJcORipybDtj9I/5JLaW
         ldsxXl9yAwAr5DswtyGNdGWp8y8fBRuIRIGaArDgIwmE5+jXGKtBNOT5XHyAUN+OmKwN
         BK6bFlKkG+dhnzvsN8l8SRg+/+hWpy4B8dNLo5LR8Pfwle1qG09toI8WsuCZLz0/HcuV
         8UAh2krng9NjQ0m8JDcthbk1yPLgYlVB3tBYaeOcN8BvJuAxMDzX3r4HyqRpM3wNZF9h
         4WAO4N7XnaWpva/pHpgjQwD1Rphnm1NLbBsIl0kRuVozKlZWiwx1iWTsIbRjhzbBgil4
         bbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=q/JybXqDHZy19qGpVrVJ05xNka2RSFVw+qbHXzCFxVg=;
        b=HD6u574/c+UPifW16KdvOfNiztpYmWqsU0z2IRGd+Z8v0AKhgEFBwkj2zUrkoYI5Y1
         jL1u7eyvmGorCYB8Bf8Ax78yZ3QYFFNFf3BKdGHXb/RqaHzdQ75hLJl5XZJj+5kdykCR
         QorvbA3kDRdLTB5MEZ9YmrbgMPsBXw6kMYTrZ6zkIPMYIriRXNfp7yEfU5hcLsxeMTK3
         cKk1EfkLEOReZ/Vx76eHFoYNYRBOADmn9AaFXeqir9ofHqLn3xYhty7X5qKNmziMuouR
         NY7k7qQyxpm+fFtlOZwrCDrQJ7UYpJ95/RJvjqvqnMC4D+yx5sVWgUOT1fGdkkuG2RmT
         Dg3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i28si13964819qkh.321.2019.09.03.04.50.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 04:50:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i57Kp-0000Qp-QC
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 07:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i57Hx-0005EV-CP
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 07:47:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i57Hw-00064U-Eu
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 07:47:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39388)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i57Hw-000642-AB; Tue, 03 Sep 2019 07:47:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A20CF85365;
 Tue,  3 Sep 2019 11:47:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-102.brq.redhat.com [10.40.204.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 444585DA5B;
 Tue,  3 Sep 2019 11:47:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 13:47:29 +0200
Message-Id: <20190903114729.3400-6-philmd@redhat.com>
In-Reply-To: <20190903114729.3400-1-philmd@redhat.com>
References: <20190903114729.3400-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 03 Sep 2019 11:47:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 5/5] hw/arm: Restrict R and M profiles to TCG
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UXX4+jhAPgzx

A KVM-only build won't be able to run A or M-profile cpus,
disable them.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: - "depends on !KVM" -> "depends on TCG" (rth)
    - do not modify default-configs/arm-softmmu.mak (thuth)
---
 hw/arm/Kconfig | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 1c359a6f47..8368666f5a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -10,6 +10,16 @@ config ARM_V6
     depends on TCG
     bool
=20
+# ARM Microcontroller profile
+config ARM_V7M
+    depends on TCG
+    bool
+
+# ARM Realtime profile
+config ARM_V7R
+    depends on TCG
+    bool
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -295,9 +305,6 @@ config ZYNQ
     select XILINX_SPIPS
     select ZYNQ_DEVCFG
=20
-config ARM_V7M
-    bool
-
 config ALLWINNER_A10
     bool
     select AHCI
@@ -325,6 +332,7 @@ config STM32F205_SOC
=20
 config XLNX_ZYNQMP_ARM
     bool
+    select ARM_V7R
     select AHCI
     select ARM_GIC
     select CADENCE
--=20
2.20.1

