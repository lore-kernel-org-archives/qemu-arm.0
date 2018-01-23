Received: by 10.28.71.27 with SMTP id u27csp3551996wma;
        Mon, 22 Jan 2018 19:16:41 -0800 (PST)
X-Google-Smtp-Source: AH8x227qWJM4qfxxoYkQnHG+GtmTWqQePXyQvgsltpepgqsPWScPC5IhebjITkXfUSiw2TFe/7Vq
X-Received: by 10.129.42.194 with SMTP id q185mr1032423ywq.232.1516677401010;
        Mon, 22 Jan 2018 19:16:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516677401; cv=none;
        d=google.com; s=arc-20160816;
        b=dDDQuBSRZIOTHqz88TZjOMKqxN0+8eM0so0GuCthe8+Rs2IcbcgAJDsiSyBRuK/s05
         /0TkMgEfAiOmjkdkI7iF1i6go/dUgmcMW7PbrjbtyE/CC+AimIJDpgkdKauqpkIXswt5
         EAqH+lZxToRrzcaVK0ILdeZUj6pXJJYD1ikSwqCWoJzczTSBebOfZnDH3+Y5Y9/C80Zs
         kavmvtuz6TX/ESFu3UfbVq3Lbbs00+X3+sjP8QSPnmYUPH2F77r2pWhyG4opuNZIY4dm
         drQYkb38Agtr+bhMmzEC+lteNXL0Ff0jB6aUST+bKUE4AyPnPsomYakk/kfbcRx0CB0I
         xnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=oZ3t9UCfX4JvNkYI/DG3vjF7bCeBOj2NU1tsA1KTyLA=;
        b=kHngyDXKnm+E0U1C9KD/Q6pm4CvKEGPTk9PMndfzz6pr5Ljc4Lox7rxnFrIgDoT13M
         JNiLQfbEwCpz5k01dVRjyGtPmSXROOL2aMGx+p6erHmbBpfZPMQI7PWpzWY5utUH+gBx
         p6zbaZ0LwHagqNr5rhYTwF/K9FXxNwaLT9KdyAZ26M80YWBoqi7Lkq+SSyo1nbRY3tCu
         gdEXws9OII1dmz++CWrc2vSkn9LkC5vLUSkUmr6yTlftGlIdVPtbiwn/iMqTFSqt1w0g
         WMeKiJnzaNjkzMwiZGIfwDB//2taVmD7+SImsN45yhPX47jeuA/lSpXS/D43OH53EQcA
         a1/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u31XQIxq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f18si208739ywk.751.2018.01.22.19.16.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 19:16:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u31XQIxq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edp4i-0008Pi-Dk
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 22:16:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovV-0000up-7D
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 22:07:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovU-0004sM-By
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 22:07:09 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:41969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovQ-0004pt-HH; Mon, 22 Jan 2018 22:07:04 -0500
Received: by mail-qt0-x243.google.com with SMTP id i1so26378405qtj.8;
	Mon, 22 Jan 2018 19:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oZ3t9UCfX4JvNkYI/DG3vjF7bCeBOj2NU1tsA1KTyLA=;
	b=u31XQIxqulud1OsQbNcbYtdur0y+syv7JFU9LXOu9Jiszy8D7lufqU/HHxTKLwgwIX
	MxStrovwTbkfxyJUb21gmqHffHlo43+CSeBcuQ1VUBjf8vjp9eSgS1k6X0p2QDvJk6wS
	HE4ZgElnhpCteAXWTtQEpsH6wrpBPEQ/heuU8y5tLsvELrfl8iAprJMBp5x5w9UZ3vPx
	tXS5Ttaboqehv18DhRfv7kd5AuoNNLj015tds4uYcjEeiNmj9z5GshIe71N3p4pBp1gp
	AhgSgyip73mc8rI3dEDytC0m094nYqm+xo/4mBveRp+CWdPVgygqwmjCuI9XaMofLGAS
	zw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=oZ3t9UCfX4JvNkYI/DG3vjF7bCeBOj2NU1tsA1KTyLA=;
	b=AZKqMep8h/KLX5fLQBX2R4yI/JvtyF2F/zbyGOLOuv4OCF7k9gXswobNlOYMs2uv69
	NU0QjxisoEy6nC/fSK2ZaYV1LSMhNf2Kf8oJbSGypsN26fmZAax30IJ9vFgrSX9/DA1Q
	/q/nfbR/EUYHEU/nFg6JtYU1Quw7DfkXnJoBoJj4usA9TWtWlqzLho13KKtOHfFD/yy8
	+HOvWjipGx6k+XDYxbr+yYw+bA4Zc2USPRjnZPfxneszBDe+Aiba3OlWjY/GUmvvb7mu
	Pa3uGh4BpG27NqxoDTIPkvN3v/09IvfUF6iWnPcTkp6JKpUi/JwkZM8LyT/Ju8Wp53uy
	hfGQ==
X-Gm-Message-State: AKwxytd1IY84jjf8jQmd9987I85s7botxlnEgzKONM1cnLlhV2GlFuep
	Vd0LODYQl+B3dWKmpGOjgOU=
X-Received: by 10.200.53.6 with SMTP id y6mr1484547qtb.191.1516676824155;
	Mon, 22 Jan 2018 19:07:04 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	v20sm4174785qtg.79.2018.01.22.19.07.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 19:07:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jan 2018 00:06:24 -0300
Message-Id: <20180123030630.26613-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180123030630.26613-1-f4bug@amsat.org>
References: <20180123030630.26613-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v8 08/14] hw/arm/bcm2835_peripherals: change
 maximum block size to 1kB
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I5lAk+i9XYzJ

following the datasheet.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 0570cc4ad3..6b86a99b14 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -19,7 +19,7 @@
 #define BCM2835_VC_PERI_BASE 0x7e000000
 
 /* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
-#define BCM2835_SDHC_CAPAREG 0x52034b4
+#define BCM2835_SDHC_CAPAREG 0x52134b4
 
 static void bcm2835_peripherals_init(Object *obj)
 {
-- 
2.15.1

