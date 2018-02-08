Received: by 10.28.71.27 with SMTP id u27csp2310026wma;
        Thu, 8 Feb 2018 09:09:06 -0800 (PST)
X-Google-Smtp-Source: AH8x226uVxfAJFqx1027/FITlEPG8Y2jN3HJ4t3RWwa/3kE2Ciqi82uRMPppJGCgxEdHFWWAUKhL
X-Received: by 10.37.206.134 with SMTP id x128mr1044871ybe.83.1518109746797;
        Thu, 08 Feb 2018 09:09:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518109746; cv=none;
        d=google.com; s=arc-20160816;
        b=WW6Yb1sDmI8u4qmH3w8Ush499FIfZ8wnCFPGO0VQOWbqQnsYvt4y9SPXcF3h2/d/TV
         jkm7nXFIcO7UNYD7cDZesQtc+tJTEAVzUxHyrZo2s36j4v/46cazPjtw545M8ynRbnj1
         MqR7ebTA61eAjo6tcsTIqwiUdeJ8weYDruLkbMJmL7W3cvSGsfnj25KzG+oa2iY2U6cW
         DHPWpoFxsqT7pEo3nG+JntuyGc7cCA1ZtTo1mxeeJ3dlF5s/ApsjZNiTbgQFmL5lKO1p
         UfeAAn5lVgw2V6Zrs7C4ak6gj88AsoBdAmn5n0ZQRdoN6twvoigOjgPLsZhPSOL/tVmY
         OvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ro6NsGQE95TgqhEe4cM+3fq55Nj7p/DfcTmAK0a7k7c=;
        b=Kir6rtyNuOydwBm8ikFHwIrqRIaVq4zzMQvQQPS5q3BtbDuyWA5SJSBUeZLMpzhWLp
         ygU0w8nBkAd/4u24gp9McVroIebCOEm/mu6EysF5QoLzPOzpPazIFDqXMAYNd78zpqcB
         f9OMeMSwS2g8ITmQZ91YsFo7NOVmPMhaNM7gye8TsxkIUXUgsNmK6W0dG8DFNy3Fy3cR
         4guL1RgY+hROh7zWvbiFzbr2cbcbAyYs2/JLaj8lWZPVS4ROJeDKf8Z72Xc80n0q9NxJ
         bCQK4x+lMxCTZicYfjpv0emm7VJemPchevloASHq2xq0VF4uPM3VS4jAOnLQkhlU9FjQ
         sRhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DC2Ufi3H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g66si65324ywa.650.2018.02.08.09.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:09:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DC2Ufi3H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejph4-00083i-6A
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:09:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOT-0000J3-N1
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOT-0004UC-1J
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:53 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:43032)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOR-0004St-1k; Thu, 08 Feb 2018 11:49:51 -0500
Received: by mail-qt0-x243.google.com with SMTP id m11so6972233qtn.10;
	Thu, 08 Feb 2018 08:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ro6NsGQE95TgqhEe4cM+3fq55Nj7p/DfcTmAK0a7k7c=;
	b=DC2Ufi3H8gK/MnTOk/TtnqhID3otOWW9ILPnJsUcI27YUdwcnxDHajukIhgkSp/xpM
	Nn8Si+XtVU+TiEpcas5EtanspcJ7mFaVCqGefclSEGzdZf13nJOdsc8XfzqfOiH1IrUT
	+Is71HcgBf8TmHPkIJYjleVokSKUWxU7z1jZLY4iyI2inHwavy7v7ORfWRPq2SVc9UjU
	EmzEUzyOxnGmzfCLS0DeWvBc0msGb4hM7kNeT+b5hLsuKU/wzvPRbGYcerxwQjY26jZj
	JWEfNs9NOY/1PRJrmGSMuLewcNppnhMb7DIRDjkbF2t5HaF385eLIEkvffP5h+2qFxwH
	Xu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ro6NsGQE95TgqhEe4cM+3fq55Nj7p/DfcTmAK0a7k7c=;
	b=be9tu4XLb8k4yoiz7Ptu33Dnjsd3Jq+3TZkRq471P1uhNHTY1Z47McPkcXr6zq2b4l
	iCowbqzDEcA5sx+XjPOohTosUhO4aVp4LyysRyCNMIusfJbKuUG9+3blC6rXtcAz7Rpw
	J+E1bEDZp5wc/bvvZy+SUpFI6u9eO0behdnBkt485QnrGsaD8EdhG+28pqnVAaWX4Xli
	LnQ/oLwDFlQzYEQRetYmcMILiYeu/JmageWR+NnIA3L/W3/ighZH6ulE3x4vrrBOEO+h
	1C37qOZ1Xcg4MlEezYSQjSRYhinpYaF3R2x5jHdnW4WD4WVIPHfVfH3AV3zyQh4jyOEU
	xJyg==
X-Gm-Message-State: APf1xPDf9GEsRP9cZ4Zyy5h7+fS4U0opCP8u1HoiCWGKXgZY83UrN2f6
	POvVdW4w3Xn75NSYVz6UtXQ=
X-Received: by 10.200.46.145 with SMTP id h17mr1924148qta.111.1518108590525;
	Thu, 08 Feb 2018 08:49:50 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id z66sm240905qkc.9.2018.02.08.08.49.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 08:49:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  8 Feb 2018 13:48:15 -0300
Message-Id: <20180208164818.7961-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208164818.7961-1-f4bug@amsat.org>
References: <20180208164818.7961-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v11 27/30] hw/arm/xilinx_zynqmp: enable the UHS-I
 mode
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A+8ICvq9z6c2

see the Xilinx datasheet "UG1085" (v1.7)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index e39ad73bec..4b93a3abd2 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -400,6 +400,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
          */
         object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
         object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &err);
+        object_property_set_uint(sdhci, UHS_I, "uhs", &err);
         object_property_set_bool(sdhci, true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.16.1

