Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3482403wrq;
        Fri, 25 Oct 2019 01:41:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziGSuMNrLs4Zfih/XUu08mr0HH0x8U+ned7Hkn7Cs/dtEhuPNV+TSU67yExqW2AX0YJet7
X-Received: by 2002:a37:bbc5:: with SMTP id l188mr1830478qkf.118.1571992908810;
        Fri, 25 Oct 2019 01:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571992908; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVg0Qg8DToKhTjvfg0CmNWkwhMnOou4STHaOeBsNT0CXptU7/rS+X6z8MWcoVIcV2z
         zgS7bPqXBYPG+SFV92+LPh30ASuQNg0l/cNVI9tI8L4DiAI7Co86SfaH6ymc9pT/VTXB
         tbXwCRkM/2Cm3W0Q45iB1R2Rd1pjONeQ0eLFnLuc3kQ1jfx2D57TGWgoD2RP4I+0laxD
         OCSaTKj8/sueqzE08r4jyIFAHOqoQFN/0SpXm6QnMNJLWh+9iphBtiJxDjPQTiEgP8fX
         x2gUm6kkxUgnPv+Mo5RpjhRhwpYBwGxP4R2sLtbipcihR9D8qkoI4sBapV5K0I4XHD+q
         KDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ggJPVPlg3MUdypDYoJNr41DfE6UIdhP2qe6eHT3WqPU=;
        b=sjr7qAlU1vgm3xsyDiPtaOk80YGeVKr5hJRQUHu7/ysJuKodSzln+EpAEvKsA/LYpM
         flEmFbjMpfv4eEXhkijmNPTq/V/YbfLKi0pFSkNrcXJ9iFeMiX2TwPc1i/HuXsjzanIR
         iwae2EEzAoh6Z+yF6He+rWvmzWNXNydA2dOr8aZ5Vt4HzdcShhjpaeXU1khH6C37u7pB
         Bn0AFU+MuJa+J5MxCXgEbnV8TSO9jXkDpHo4q5hv/zQ/EUY18U4SJRmVFgXSvpcDUZqm
         nZOCo7LTLnRdqHOF1fJV+BSFPGU/EHSr3SYULN90sKKaszQmqx4xl1nJy1uyk7Zqo7z4
         EaGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si855293qtk.79.2019.10.25.01.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 01:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNvAJ-0007cv-QA
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 04:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv5A-00012e-58
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv58-000826-U3
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:28 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38597)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv58-000812-Kh; Fri, 25 Oct 2019 04:36:26 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mtf7H-1i9HlJ04mV-00v6BH; Fri, 25 Oct 2019 10:35:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/19] hw: Move M41T80 device from hw/timer/ to hw/rtc/
 subdirectory
Date: Fri, 25 Oct 2019 10:35:02 +0200
Message-Id: <20191025083511.11463-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K108If5qegdxqtLY28ckEaAROz9TzMIgHjuzWirAeKvjB1s//jF
 yI7eGDdb1l2U7+8j4xKDz8Vk+KBqwDQgdZ+9r8rUf8cPOHjgIxh1faZu0zjHf5MtOFKT9E7
 yhHmhOJsqYLvyIS0Z2jfCLO5ZZo7ShImbP8OCjmlj1FR7ndiR3VCS6g7aOdDbFwKiniZkA1
 sP9kSmYGvXlxqISjEbmeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RUpsU3/Gu3s=:X+VJFz7P7jUzGq6x5bPpw0
 oDtLaEReji5sO7r99qRzygZ2YuDR4yDQWl9ctIEqBZqnCas5oiaQp2imr521WmJ73CrQl7DZH
 3E45cxLjP3fEjriwjwXkcCiaPByxutU/8+QNt5gdqRWWE04ZYWc9+OgaOcpqDAODz7CBkpa6F
 UbmZzMw9qsSKyADjrfloDXfyp6o7fpnPFNqEzSjSXODTsxtIklZMHU1+ys0TGBnEQ7eCefYjZ
 vPND0og2eG2mXclG31IOgMDauaumk+5cZz7DWSNBYCDjY2t9xv+wLGqOL9DTyamoXdz6vdyHE
 MdEB+/gRTnboZHgh5xQSbKCns1VJwfic+3Dy4W/pN3XQyc9/4MNpYoe1DcKbdvTE09xpQbc4L
 rfvnkrlUhEk1hq3H+s8wko9kDiPe3rUsucVx44j3xyFk8wfjlMqG/cJ3xEncRiKBKJitFM267
 iPYBv2H4+tIGbWoLimCRO5pZlZJfCVLZMTV82ks7OHeDyHsTKqwXdyWVlb9ZpbzayiYsOQPs1
 imeTOw48PboqcKdJF2Oddx9d3LPATHw6kdsYBGwcCaDjnTfMxfVw9LZSIf/M3mXHUa9EpKrvQ
 CzN6lpOBVpBIjGuGfv9oa2ASZenmoO7qtnmv8ZdaEAWMIkF1uRwnq367sxqRCGd3nEpQ/fbwI
 vCjIJWsKj1Q/kjRLkusccN6V6O7pxpISBpO8Id8GWKJB9K/q2jWALnRS291aC9GdAUMMlW7JO
 llhnwRWgdF40A383fwZ1jHWuf060/q8aeqzc1mT+gRr9OPShAN4LyKPfslWxJVKoyl+JAeKQT
 oZAn0yPH5fL79YeQlWXOT1oe5J4MyBtah077jxAoDqGdHH3/4SzeompNgTgVY/a22AFyG0RNu
 hMdGtPMx3JX+ZqLmfSbbSRqLM2S7kER2WvmI6lW1g=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CR72QJBGhBNX

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The M41T80 is a Real Time Clock, not a timer.
Move it under the hw/rtc/ subdirectory.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191003230404.19384-6-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS                | 2 +-
 hw/rtc/Kconfig             | 4 ++++
 hw/rtc/Makefile.objs       | 1 +
 hw/{timer => rtc}/m41t80.c | 0
 hw/timer/Kconfig           | 4 ----
 hw/timer/Makefile.objs     | 1 -
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename hw/{timer => rtc}/m41t80.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4e65f062f29c..ba0d1906aae9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1111,7 +1111,7 @@ F: hw/ppc/sam460ex.c
 F: hw/ppc/ppc440_pcix.c
 F: hw/display/sm501*
 F: hw/ide/sii3112.c
-F: hw/timer/m41t80.c
+F: hw/rtc/m41t80.c
 F: pc-bios/canyonlands.dt[sb]
 F: pc-bios/u-boot-sam460ex-20100605.bin
 F: roms/u-boot-sam460ex
diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
index 159c2335171a..434b20b2b1bd 100644
--- a/hw/rtc/Kconfig
+++ b/hw/rtc/Kconfig
@@ -1,3 +1,7 @@
+config M41T80
+    bool
+    depends on I2C
+
 config M48T59
     bool
 
diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
index c87f81405e9d..89e8e48c6409 100644
--- a/hw/rtc/Makefile.objs
+++ b/hw/rtc/Makefile.objs
@@ -1,3 +1,4 @@
+common-obj-$(CONFIG_M41T80) += m41t80.o
 common-obj-$(CONFIG_M48T59) += m48t59.o
 ifeq ($(CONFIG_ISA_BUS),y)
 common-obj-$(CONFIG_M48T59) += m48t59-isa.o
diff --git a/hw/timer/m41t80.c b/hw/rtc/m41t80.c
similarity index 100%
rename from hw/timer/m41t80.c
rename to hw/rtc/m41t80.c
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index a57e9b59fca8..a6b668b2559b 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -20,10 +20,6 @@ config HPET
 config I8254
     bool
 
-config M41T80
-    bool
-    depends on I2C
-
 config TWL92230
     bool
     depends on I2C
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index fe2d1fbc4040..2fb12162a623 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -6,7 +6,6 @@ common-obj-$(CONFIG_CADENCE) += cadence_ttc.o
 common-obj-$(CONFIG_DS1338) += ds1338.o
 common-obj-$(CONFIG_HPET) += hpet.o
 common-obj-$(CONFIG_I8254) += i8254_common.o i8254.o
-common-obj-$(CONFIG_M41T80) += m41t80.o
 common-obj-$(CONFIG_PUV3) += puv3_ost.o
 common-obj-$(CONFIG_TWL92230) += twl92230.o
 common-obj-$(CONFIG_XILINX) += xilinx_timer.o
-- 
2.21.0

