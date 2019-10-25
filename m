Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3493307wrq;
        Fri, 25 Oct 2019 01:54:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmYd4z0Zp+HarOY+eKd2nEXDJc/gNlZPLbkmK6RhXX65KVN00WsiHHrqCdFmj6P0cvXhK0
X-Received: by 2002:a37:6353:: with SMTP id x80mr1909997qkb.52.1571993683020;
        Fri, 25 Oct 2019 01:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571993683; cv=none;
        d=google.com; s=arc-20160816;
        b=DtMBUsTM5pBlXZO/12GaVWxNelIJS9xPgRzAgFupwFMGNzhsh5TgEejT8Mu/hvaqn3
         ToMFS616e2xVOMrlTA5U6zGT1ZaYjnkgOMaNcbjeSqAOt8aPKNKDAVp1kXueF8nWtKJ1
         +vol1CZXeEF4dHLIPEW91kOzU/037B9s8r7R55zdcxwOSkDztXMebmej/uOX9XYtHijU
         WDZH7rAsi4ovPukCfRuqPwCAq3v0jj1STQdAvsDLxfVQSYJmitK1kGPoAenOk7xRWqxO
         XyIv0LxxYEjdV3BxQR8jm6Yoecpc6zg5ZOPLU+TAiuK3MAvfg9P3sJ/z1adDo4jqrc3x
         fXyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=sqweg4Fo7IFCZOW9vsJaNSgl5SzmzPgyHIEGpDCAKSM=;
        b=nTCvAClXD5+kzBhkCYCnEYrKtWmYDwSct1tWfJbLuTA0h3kVfP5SlQhilf5iFyvci+
         cxz9bXejelmZnCp45Ls5J/CbcBFjgaBhhDXkW/8Vh8DGvE7g4oayhVcXNsWkIn3PPiZd
         /z6zKCKCN6KKXduNqQS/clvvQ+X9lfry6SHUY51ZYhmSUZea6Cf//B6e1ZgVn0aTk2BP
         mLJYKVykAiFnEfUW9cDx9GFMZ1v+c29rhL8LBiSZ1FGBGksUu7oR04iYoNAIUY1hggkR
         17k6DACGR5XoyxKnEvQVtFYk7duqd1gcwm2B3KCbsoLz98LVMlTGNp3DHOCERvsjQXBz
         7yaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si885613qto.218.2019.10.25.01.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 01:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNvMo-0007yb-09
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 04:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv5N-0001PP-1I
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv5L-0008B7-P8
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:40 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:46229)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv5H-00087p-Q8; Fri, 25 Oct 2019 04:36:36 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M6DnM-1iLi9W0W2S-006iku; Fri, 25 Oct 2019 10:35:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 17/19] hw/rtc/mc146818: Include mc146818rtc_regs.h a bit less
Date: Fri, 25 Oct 2019 10:35:09 +0200
Message-Id: <20191025083511.11463-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fo2sC3oBx2jPfCQrBxU70SXruu633246+ExBKU/D1kXsJeNwjU1
 KGlpKsDt/yD75ZoHmLJa2QkafdPSh1tg4ganhk/ql+nAX4rFsM0ITal+Dpn3xQi5yGSX2m8
 r42SjKHR50g2K6NplUIHbhIONu9cNLeMLQF/7zobNvxifyD7g9pXOBxZgdxQph2T5uvJfqW
 FgD4vOsO7cQBgO6ye4C3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uqFFU+R/qyU=:7NGivjYrUMNBsUkQhEZnTC
 Bz8XFSK2xIFoUbLGzIQ4tYfkZmkARsWvxG0U5GkhD2jQc7F4RarVAo0PYMsympI+bLIyZoeMY
 LZkGTEdKcCSZBcbp9wEfiue5IVvuqGU4m8agSxf5zVIk83/gefhDLFvU6YgdKXOxclLRswq+n
 1wHyZoLHFxPvqS0vBlFeyH3lQ86gtDQMLCqFSHKNIz0If8FaC6qjL3EPmk71hyTr010qmUNO/
 lwpNLf6qAUIVHvHlos8BJXXmc/sVlPnJekaV6lbMgGi4rfKp2VmViwCCoQ3Ym0y4dMd0vtrYT
 lK5gekFz1M0bc61wWMB45rMztnRXs5m4GEN/qWoARZqDhDGAt3y2MPk3N5FWZksZX/huoOB0P
 yUUjB6LegLBYq5HyNuu4paf0f6jLmgES88n1aD6FSzlI0EMGRODT8QPXiI/P0OQ5k0oW1w4Sh
 H4nqf8BL2wYy/wyGBC3tG201UPAQ2ChOnzM/cn8hf9SbCevFTxs2zzKuK1zlj91JZf2KreNJG
 cqq/B7Miftl2i1zUxEluyS2CyKUVszXt48xECr2cBQbG6/5oHhKUEiH0NniqZWwQa2JaQvMfT
 kusdP9/mh/7e+E/0UM/OKysPzSx+4GrCTxJF4LSZwYN9Jj9rEs9jmx1Kv/Ftrgjxx8uRxx40P
 cRK9XzvtprSO738VZX9UpIvZlH+cCPGAd20si7mFB8QGBDWyt2TPL9IlYIgoiIQjmgpmb2/ZF
 OMTFHbJZu4GMDnXkd5MNUt0X55epUJL1wKccrgqkpmd+gzMuvKjHvCePnGizyyqH1EOVMGB3C
 k0Bub3cyWxFIeVSbJSCFi07onPe4kLMdXfBMFugMe4KRmRTUXEoFgGsViTOKByygFkbxcI4pa
 90n4bvXNmhFl4nRTSjgijuc/vdMwqo5iHH/11FzT8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
X-TUID: fg2XMz4GJ26f

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Only 2 source files require the "mc146818rtc_regs.h" header.
Instead of having it processed 12 times, by all objects
using "mc146818rtc.h", include it directly where used.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191003230404.19384-13-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/mc146818rtc.c         | 1 +
 hw/timer/hpet.c              | 1 +
 include/hw/rtc/mc146818rtc.h | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index ced15f764fc1..9d4ed54f65e2 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -35,6 +35,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 02bf8a8ce8fc..9f17aaa278e2 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -34,6 +34,7 @@
 #include "hw/timer/hpet.h"
 #include "hw/sysbus.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "hw/timer/i8254.h"
 
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 2e9331637a6d..7fa59d4279c5 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -10,7 +10,6 @@
 #define HW_RTC_MC146818RTC_H
 
 #include "hw/isa/isa.h"
-#include "hw/rtc/mc146818rtc_regs.h"
 
 #define TYPE_MC146818_RTC "mc146818rtc"
 
-- 
2.21.0

