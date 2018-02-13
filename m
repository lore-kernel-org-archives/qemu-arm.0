Received: by 10.28.71.27 with SMTP id u27csp693131wma;
        Mon, 12 Feb 2018 20:35:25 -0800 (PST)
X-Google-Smtp-Source: AH8x224nzLEP5vz/Sw7Lcr0NNwhhvTrSJo4TTzPqygllEgTA7EuHYtal9nqiikYOY2sA7Oz/4pKq
X-Received: by 10.129.193.9 with SMTP id f9mr1381492ywi.25.1518496525556;
        Mon, 12 Feb 2018 20:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518496525; cv=none;
        d=google.com; s=arc-20160816;
        b=Lu0qPNKroqdLjwhHQei/SvghXaPp+w8B9Uq7NYU/Trl2pqqzFQDHrQ3SVy/7TR5qui
         L7KXC4e1RJ9+ST5NZVlKDW7DtEpk4yD7YLm7eV3g05NqjEHBqqXG+Ghffhu4dmikLifd
         ofDosvIiA9kzugfKrUQl6O2Is0baO9bvDGbQJvZJQDQ17HMzY0IvCS00YetEHAeDeT5Q
         vLK/5SZ25dNtOolHmrJBjkHknd3vBm2j4xKOx/KMuTUuRTVcwz88t/OUU4vI4HW5cHa9
         2sn/FEQir8GoVOPw686fTm40NZYiUNk41I4yJsSLGzeYgDn73oSWHqUvmKbhgeowcaBW
         ymMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=v457jH8C5UirGQbVe7z02s40zgDFDhiKAvbmiOY6FF4=;
        b=uYQdedUx1Zg/K0p34KBDwIhC4XAhNPENXl3Qm5xORVB+BHOSvJKJDZl4OwJ5ZXfIdL
         GdyEACUhgg0cHHmJSwT9y7jHWIlznJpvAk7UFauujRMzZWdpgmcowLxoMOlbJEfONJMQ
         tREmW0DQohqgCDEOoOG4+Wd2VyzTbdI+7v0XavZqDDDFWkVIU6rW7do4xpVFRnJpeODA
         5WzrDESdHFpUQ8zPR6JkO0gBl4H7jGz024qbjwQ2SgfamrmeVDuy+etz92LwMaCXg9QR
         rsekcLWW1ITDAueii8EkpZwgR/ai9NBw9NQwF0OIfLmN8A5q9MB4uDMdXCXqMv2BGQDH
         Fbhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bu82+OUh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t140si221705ywc.707.2018.02.12.20.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 20:35:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bu82+OUh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elSJQ-0007xi-U5
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 23:35:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuX-0001hg-NI
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuV-0008Up-2N
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:41 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:34305)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuU-0008Ue-Tg; Mon, 12 Feb 2018 23:09:38 -0500
Received: by mail-qt0-x241.google.com with SMTP id d14so2250666qtg.1;
	Mon, 12 Feb 2018 20:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=v457jH8C5UirGQbVe7z02s40zgDFDhiKAvbmiOY6FF4=;
	b=bu82+OUht2fGWhGsbRyV+QgBzCZHmQTgsrXn3lRuWNlT1bVtRUGpXojTl4xfMrxQ5Y
	9ceiDBayKzvUhdwuJugkbOe7hSf2u2Q/b3oM+Kz03HwqEHShdERK/XJd21HEK5un0CyW
	LHlDj8nFP7BFdYHn/m2PSFeesbYmcYYtuggiMy+dLzwMaarsCG1y3VQ6Nnh5dY5a4Uws
	WEySyUYlpS1EdAEZwJeif84FjEisSYixm+xV1B43GJYHFTsHiVqhkbD5xHscFGjZU87R
	aNK9BG9bZCyrvj+9H+W4LOxnsI27BqY8dLYw8aJjhAOe5E0QKC2d8m4wGiUGwpDNXEsr
	Kf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=v457jH8C5UirGQbVe7z02s40zgDFDhiKAvbmiOY6FF4=;
	b=qJYSxv8Yd4uyJ57iApPNl8FC2J0TgHo1+jKx+/JlpMVu0kyZS7Hq4YzmJV2R58gqSc
	J0u7i1YdC5SyHUtAcAGf2p7DQMKwK0tx/aNaVwoOZZ2lIYSIY7dw+LNPM0wPnQYDG69T
	vilUchcmvGSk/94eKsPikixmY87ZPLCzjrPM07sEOQcRTWYUL9SflsGXqq5PRojRF90S
	LpeXe2qyzgO3gmKzcsqV+1eKY8ujUzvsTZh70v1AoCUX8bGRCk2j3NZmYAX1oUBamgCC
	lBB4mQb2+05oVmdu3W80NQ84HSXE+0OgJwbbNVM9Uwc9xdCH+mJhAKq/B+JNsnQDZnw+
	bsQQ==
X-Gm-Message-State: APf1xPBViHaTrf1yihYfjitxs/jfx+7g522VbWOZFRmHbWBTYkmfMnQp
	WLMxH2x46GwPqdBsNglbRTc=
X-Received: by 10.237.45.97 with SMTP id h88mr1734772qtd.284.1518494978554;
	Mon, 12 Feb 2018 20:09:38 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id q2sm7350435qki.10.2018.02.12.20.09.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Feb 2018 20:09:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Feb 2018 01:08:04 -0300
Message-Id: <20180213040809.26021-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180213040809.26021-1-f4bug@amsat.org>
References: <20180213040809.26021-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v13 25/30] hw/arm/fsl-imx6: implement SDHCI
 Spec. v3
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kk4GCdM69cgH

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/fsl-imx6.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index e6559a8b12..b6ac72de27 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -27,6 +27,8 @@
 #include "chardev/char.h"
 #include "qemu/error-report.h"
 
+#define IMX6_ESDHC_CAPABILITIES     0x057834b4
+
 #define NAME_SIZE 20
 
 static void fsl_imx6_init(Object *obj)
@@ -348,6 +350,11 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
             { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
         };
 
+        /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 3, "sd-spec-version",
+                                 &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), IMX6_ESDHC_CAPABILITIES,
+                                 "capareg", &err);
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.16.1

