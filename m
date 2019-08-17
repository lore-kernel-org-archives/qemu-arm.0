Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp452531wrs;
        Sat, 17 Aug 2019 03:20:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzW6gGWF0fR2lzofVAB/DUC5+bzDxkOuBhDL/iRwA5Scc7eBXPP35JlSZjIQqxX/k7dNJV
X-Received: by 2002:ac8:c86:: with SMTP id n6mr12482183qti.345.1566037204491;
        Sat, 17 Aug 2019 03:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566037204; cv=none;
        d=google.com; s=arc-20160816;
        b=CG1yqN+5XO/c9Eyhyn/c+Ad/Hedxjpop67901OvXqUblDuzBWdTBAiXiqTmM8iscIk
         XjppFRwnHZetRl4k7p2xzR9p3I0iayaoA2GqDEJZMHKn65WUiWH3RnC5SnYAfhCVtxft
         qdE5zmMI9Np/29+SLdnSBJQA+DESMOuIqqB3c9+z03QJiSxYrrIC+jIz6kBYlFa1Gt1p
         A7BZngLKfdwo344lh9K85aZFg71rv26a0GNkoHl2noUaWRI+0903tBfekcwGf5xRJjjo
         UKPdloaDabM0mBbSt82wPLRRev9heTJX8iUvHqiuLS8bh2pjPrSRZwd7AAJhuxFkDHas
         jUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YboOk3c74vlIOSdXA1CyfD3ggid3QW5DjguJEO1SREQ=;
        b=GKRjZ6Ktd3+l1+75ukKLaBqytTfrlz38Nf6aV/YUzQ6eP1jaDt2LUwPtRK3EXaBMJo
         AMA2jcZfacRtilAj6IDFVv0WdWOKKM27eWoI2MCbJ0z3X4OGB7GHQX2C22tZVqO8TspC
         ZDeEXnDXqmz0jd59TIm+RUwQx3Ks19NQQY7mz/1E6Wde41ExqYoRLe3FMKRM54IQ9k9L
         nUMrlXySnLr3hgqD+sjxNdFSNNuh8j7V+deBylhfZUUTeiFGcj+PTRghT+xg/9eCdmjP
         fSuEzB5OcZ4+JjBfXHg4GcgEMfdDQqhR2Ik39Zkn4POm89YotuUIFD7VH1vqnC2KAxB5
         90Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v124si5262268qkh.273.2019.08.17.03.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 03:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyvoZ-0000ia-80
	for alex.bennee@linaro.org; Sat, 17 Aug 2019 06:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58022)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hyvoG-0000hF-S7
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hyvoF-0004Na-TN
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:19:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43840)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hyvoF-0004Mw-OR; Sat, 17 Aug 2019 06:19:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1380B36955;
 Sat, 17 Aug 2019 10:19:43 +0000 (UTC)
Received: from thuth.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A996FD1E5;
 Sat, 17 Aug 2019 10:19:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Sat, 17 Aug 2019 12:19:24 +0200
Message-Id: <20190817101931.28386-2-thuth@redhat.com>
In-Reply-To: <20190817101931.28386-1-thuth@redhat.com>
References: <20190817101931.28386-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Sat, 17 Aug 2019 10:19:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 1/8] hw/Kconfig: Move the generic XLNX_ZYNQMP
 to the root hw/Kconfig
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
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 40pP50JGdepH

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The XLNX_ZYNQMP config is used in multiple subdirectories
(timer, intc). Move it to the root hw/Kconfig.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190427141459.19728-2-philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/Kconfig       | 3 +++
 hw/timer/Kconfig | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/Kconfig b/hw/Kconfig
index 195f541e50..dbae1c0852 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -73,3 +73,6 @@ config XILINX
 config XILINX_AXI
     bool
     select PTIMER # for hw/dma/xilinx_axidma.c
+
+config XLNX_ZYNQMP
+    bool
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 51921eb63f..eefc95f35e 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -34,9 +34,6 @@ config TWL92230
     bool
     depends on I2C
=20
-config XLNX_ZYNQMP
-    bool
-
 config ALTERA_TIMER
     bool
     select PTIMER
--=20
2.18.1

