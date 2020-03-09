Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1264612lfc;
        Mon, 9 Mar 2020 08:22:08 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvWslJzImWTbIjqjHx82xciS1wLaPZTuqryUcjS5YxvX5EgrZeOgzVBh86RqlDVyjurfBbD
X-Received: by 2002:a05:620a:382:: with SMTP id q2mr15945760qkm.474.1583767327989;
        Mon, 09 Mar 2020 08:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583767327; cv=none;
        d=google.com; s=arc-20160816;
        b=EHvhW1BnsuIBr4IP8UA+hjn/zBZ43NzQ3DWbsLmlLk1fzEZcvjMD1ioTxkPgNOZDIl
         r68ASbqYUz7Ii/K4xOCP16WbtebrIdjrSGUNFB+z0vPKDLGsJc9bdJuJW8eO0nT4pXeC
         /Gm2odMxqnxtH6WK3gYl61pEPRFt3z0/JW4+E0uR2nQOkB+MhyE+jfyu2qtmCK+k0yA0
         is9KC6HnWWwXrLagJktB8QPFgYshwGCpIX2tZKJdTwO7D9GkgemH/OAS0ngNzWIKMxdo
         puqaq7vBp22MO+5NeUkC7esV7VKagwiRIiRdkL5BYNbv+mBkMifOhs0ASsVtkhaSAKbD
         A6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Dtl3x/kwMS/XZdBZSgn7KkhP2sVuLwIv6X8OOJ8Cb7U=;
        b=OjIKq5MzSW2D1OSVRX85tmqrzI7Wc52Wvup0bDsFogiMwEAbQcNChelw+O4xNoh1fh
         Tfo9cbKnFFzp5NSATCGNkFZqKbxwuaPELp69imxSJS0uVmpFEpbz2GLAe1EQwB58pIGl
         AKnitM7VU+xGyZihLPWINizs7x4TyAUHZwaZsMdhOD8acI9EWKiaUIZ+daLhFhiou9QL
         IjlDLs1E2nbi0zywy0vseFi9j1EoBqgUW2iUGPrwg7GA/cIuJ3k7wmuY+Kphglrk9lkX
         0P9ZeH4/GT58tyt3iYW5Zq1rM73wwmav98ipElEo9eKAm3WhrRqhurq4FgaR+uPMCMUK
         WPXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16si6542151qka.183.2020.03.09.08.22.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBKEI-0000sv-IH
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33375)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2U-0007vM-Pr
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:09:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2T-0007ht-NK
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:09:54 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:37415)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2R-0007fp-AF; Mon, 09 Mar 2020 11:09:51 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mw9Lu-1jRt0S2TYa-00s5PG; Mon, 09 Mar 2020 16:09:08 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/33] hw/timer: Remove unused "ui/console.h" header
Date: Mon,  9 Mar 2020 16:08:15 +0100
Message-Id: <20200309150837.3193387-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tM2YDmot9ihGaPhyf6qhTyarNgEYi/pV4Q4kB4JhgYFNz9yEN62
 6m9K4srE81GDTMvq6HW+nrSU05dgDqxVxoc6T1JP8ZoPzReEsm9oCFmiYrW7TFq6QNQ9Ivb
 QL8ROcBTlwseBc7uI2EEjChxJ4a5Yi/bNPj9QgQihMxcuhPos3qlUU4111hzZvhfx/icFOB
 qfLvLwApS1ROlZFps2Qmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BIzu0BJEkmM=:abdPkxT3jKmvPh6xvVPRht
 tK6BS77CiBwZeTxvxE/HDiQIU3QjYLrT8MuFRRjUjleEfVxDtRCC84+xETfRuzkLYUlhk3Xiv
 uuN/i6cvXRag8xpnAUFbHxMX0/AVjBbSh3BfmOMlu4AOqoqTZzh1F8Uojf3TZhCs3FSlw5A05
 9RE4fRJrhC9j11rZ4zTwvhxyTT/pS2H+dkT9cPkeg01384pxU+lTXSIsXeXcHWARfu5HwJ5uW
 L4hxSdHjOWHAG5j5PPHs19o5Cgt5QttzkQo31YNsfu9ONMnRHnwZpyRdYzPNmTyn1ScPwXOX3
 pyXw9qmMrBoqsdM4/1kShYW75XxpQknfOzqXB7FTeVWHe/k09aqNjRGPsZ/b98+rD2qYJz3nY
 G7AC5aaz8+k596vl/EKgMCVMhY3GcCVzKBa74hJxWwXxhp7eMmNuyjVg5E7C1SUx0GVaa9+wM
 8zt8mkwLe+ac4sBLiqCs6++21kVyZ+FIA1MzLWx6YWEwkkFkOAWmEOoRvbHipb464ftaOcwOT
 ThR5B95U/L6ubo6ecMzlppO5VGa8OtcbsbqiVmA3Pt7g2zBgZmEcCjzi6qZV2qkVDxifen7/K
 OUMaNmIQYSHKU+WBFIVc+WfLeex+9V9bijKEimyn1ZBRGROGfbuLaRXY5GavIS0mNVdUrZPRi
 Xm9DJPcAWhNoFJXi2WB1aSo8uYOOxEnWHbevGVcXXK0BRNc5lSEQ/DVH3mow1nH3P5PnF0QyB
 9hvSfqmF8cQyM6aquaQRP/JrvCL0/yhDrtg6J16ZSIK0q3Y6ZRq7HcazP8E87BrUpdyore2xK
 uUIag31ivesa3qSz6jlHiV7PLLFVTcHV5aZjyP+G5JW0W/V/MAXyzUmGqscHZfp1ui1rVQy
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u8jjpnjT5E7n

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The timer models don't need anything from "ui/console.h".
Remove it.

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-5-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/twl92230.c | 1 -
 hw/timer/hpet.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index 63bd13d2caa4..d0011be89eef 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -27,7 +27,6 @@
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "sysemu/sysemu.h"
-#include "ui/console.h"
 #include "qemu/bcd.h"
 #include "qemu/module.h"
 
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 8dbcbdca16a6..4f30dd50a40a 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -27,7 +27,6 @@
 #include "qemu/osdep.h"
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
-#include "ui/console.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
-- 
2.24.1

