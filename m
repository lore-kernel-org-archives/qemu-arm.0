Received: by 10.28.173.206 with SMTP id w197csp3730814wme;
        Tue, 9 Jan 2018 06:02:21 -0800 (PST)
X-Google-Smtp-Source: ACJfBotpzSkv9t504ui6k5oM0oR4enAJggeo7vGzKvSyPHv2KhhZKhGbkWhFmp6A/clm+uTxNqes
X-Received: by 10.37.189.138 with SMTP id f10mr14220931ybh.219.1515506541242;
        Tue, 09 Jan 2018 06:02:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515506541; cv=none;
        d=google.com; s=arc-20160816;
        b=GsjiSHobIp8gARHrSc3s65Ep1levgPOliGXRN2u4MqwsJvbD+A3kRMl/nm0vt4NdPj
         kBnxYNaKgEnrsPBJiNs5JS7T5h+fL8ISFRNd/agFMeYBjo6YVL8MUhfft7YZA7IZK9vt
         JmgWP9+2ZdYKugiJ+QFwlUa+ZZXkHOFdAoZ8rwQRLkjtXl+4RdI2f/ceu31AJJ3V0Z0U
         pt2Pe6mzJwNSgMr9sOigb1bJ7iK968gAt1xYnS87MFU6qEYSCPKILcbMWitHY2wY1ubD
         s5wXeaZ0SJyYklY0tPmVdLv8NkNdJZ8Qske0dQznHxLqT8iGR1diVwa9SblbwFMV4Nrh
         A0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=e8D3c+rvhcxq/fooYISPPiT34fPHUsEnaEB+nUHnzr4=;
        b=EfBBQnBc+NAhmR+kqbQRZeVflZEWfpfyQnVJyKYhruokxqOjPhThui38byXLAhS2XC
         xWa3mDH7QsgvDIa5t0O0tthXMq/lMQMKTjLBeJMsCTF3vaNpXg8+tHZKVzG5RzLbKJul
         /nLUOvR+db8Oz34JndrHs90ZU27AD4E0iW0IeCUOu6MWBMPNinTkig4b1YeVlOVYNUm+
         Wx7j+S0Sm9cRarooQDV6umyIUVt4f+wdo6eq5ZYdWn6JctZ6GK5s84qrmOZ0LIklRPLf
         tmZNX+GI0oIzAsW5o7z+sVFn6/8NasKTKTHLbiTn6YqC/bg1XsDUk4fsFNsBDo0HyHmP
         46jA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s8si3074150ybb.524.2018.01.09.06.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 06:02:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYuTr-00077q-Ij
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 09:02:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eYuTY-00074l-5K
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:02:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eYuTX-00017X-G0
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:02:00 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:45792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eYuTX-000159-95; Tue, 09 Jan 2018 09:01:59 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eYuTT-0003eT-S4; Tue, 09 Jan 2018 14:01:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  9 Jan 2018 14:01:51 +0000
Message-Id: <1515506513-31961-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/4] hw/sd/milkymist-memcard: Reset SD card on
 controller reset
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ldmgp6AVmAsK

Since pl181 is still using the legacy SD card API, the SD
card created by sd_init() is not plugged into any bus. This
means that the controller has to reset it manually.

Failing to do this mostly didn't affect the guest since the
guest typically does a programmed SD card reset as part of
its SD controller driver initialization, but meant that
migration failed because it's only in sd_reset() that we
set up the wpgrps_size field.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/milkymist-memcard.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 4008c81..341da88 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -248,6 +248,10 @@ static void milkymist_memcard_reset(DeviceState *d)
     for (i = 0; i < R_MAX; i++) {
         s->regs[i] = 0;
     }
+    /* Since we're still using the legacy SD API the card is not plugged
+     * into any bus, and we must reset it manually.
+     */
+    device_reset(DEVICE(s->card));
 }
 
 static int milkymist_memcard_init(SysBusDevice *dev)
-- 
2.7.4

