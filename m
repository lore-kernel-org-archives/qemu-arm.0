Received: by 10.28.71.27 with SMTP id u27csp3553239wma;
        Mon, 22 Jan 2018 19:18:29 -0800 (PST)
X-Google-Smtp-Source: AH8x224FWB7Rczsgfp67LAyRNWVMzrHGg4uUv56i1/Zjuch1wxft7Df3AxTVkEP3lO3+4cU4Y/0i
X-Received: by 10.129.109.138 with SMTP id i132mr1000525ywc.190.1516677509745;
        Mon, 22 Jan 2018 19:18:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516677509; cv=none;
        d=google.com; s=arc-20160816;
        b=INBfegkcdN/8y7dpcg7v1Zi0LuQ/ceNFgPwlWON7a1qSGXo8UiPmuTDGMkKs7kQ8VH
         M56C5bn7Hj2KbFafoKZiHfBTzbS1OR4qop3KxBrAv9xvH5XiYGohWDcHsCLNP4UN3uRY
         7REGiQAuudxnXMoIvt4EWDDRhQwOQx8ozyGIOHEoYbm+UynuVKkjNJAqrtUHxCY8u83z
         3D95RFRsl2ZxNltwCN2cDB/uM8MFh2+if4URhNaoOeXHrsa0cAMDekmixVEfwuB2DOVo
         AZvQzrv8MPEdKUsva0ykMvhWNDittsPHNjfyyzpqxMioHcfZCXZgs00yCwsk7ZtOBCMi
         iSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=XOVwQvbupg+sDv3ZIv2VadxJqjQz9cvovFXpAuLXU8s=;
        b=m8ANU2b6XEmYJX2c+03eukAYqCQzaWwGIYP6YPHUS+tSu7RRsg3PHcnqToqX7d+aZ7
         5kQuztsfCAplSJFa7aw3rhvqqDJqKMz1DXGkcuVyVjQR5lXYWNOWQ54MGeKnJC1ucTQ8
         BIiRDVq7fBKCUD+3JhgdRM03l1WF3tKHk2RWTZx+z+mjE090MbwCJzKLVIWFdqxhLq/Y
         eCn0u561gtKHaycptngu+t2HJEPcHdhej6oD066G2mKOTRs7SPEPgpnGUpdPg9AHvHAE
         gAcOjSnPAkHsXHjulW/uY8vjfWKyGuLx1xPSHJivMJmAtuYWZHXEsumhRsKFTUeZIUFo
         JrEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UlyyDgJB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8si2200303ybk.637.2018.01.22.19.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 19:18:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UlyyDgJB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edp6T-00017Y-6l
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 22:18:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovV-0000uf-3S
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 22:07:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovU-0004sE-AD
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 22:07:09 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36479)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovU-0004rw-5b; Mon, 22 Jan 2018 22:07:08 -0500
Received: by mail-qt0-x242.google.com with SMTP id z11so26365120qtm.3;
	Mon, 22 Jan 2018 19:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XOVwQvbupg+sDv3ZIv2VadxJqjQz9cvovFXpAuLXU8s=;
	b=UlyyDgJBiXu2+k/kWjHb5qQuPHvuc7t+aVdNFt2wKWdDz7GrDD5Sp42M+V3RgXu5SF
	Ry/OAMfhmwkMHWMW1pWaRGce/o/KFMeu7yI9HPXFN7N2yNenkj4H309tX1PbIfP8G/97
	I7WyLkSIRSjh75ipBT2Hh6oeC97mEb1qXr1ImsjgW/RxW9CU5WwyhKK8917E1k+ZMTeS
	SJj0qTuGcJ/Af5WCCThddtFvJ9WMIlpnMPGzhTDTJxHhO1rcnM1GtOjye1VJzRWTg7Ul
	kWvQ4NGhgh+X/RfNt2kW+9hRgUTFINneA/WDHy2jrsp+k6A3q88jOLPPdgsgBsONVi5b
	nNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=XOVwQvbupg+sDv3ZIv2VadxJqjQz9cvovFXpAuLXU8s=;
	b=rS4Ui7oIKjwAPj7IyTR2McnA76q9ngq+ye2OzIC5y1B6ZdXAoYQOqDm3j/ncAopJ0/
	8Q1ToJ0YD8YJ+A64tWYi68/Cg7XmVu1w2Zbh2j1VuUaw08sBqyBolD8nMI/tWRDyg9Az
	jl47I7Mm+zgDW+i0ggd3EW+0yejcuAGR4/pDPmQPP10SNHmxNjY7Lr383mo9Ys3o7Sx7
	c3pGVvfjVakTjzwT67OV0REY6gaAxjhPdK2OQzPAhA/wWCm8vbDrkuNBdRDF21XLNuTZ
	+naomjaEyS96W4L06H8PyNcFVV60fcOCP0UPDvpIVsu1whkjv7ixBR1Gn88qIjUW1Jvb
	UHAQ==
X-Gm-Message-State: AKwxytctqUx8vK56ZpFvTtfFFy5JG6Vz7wTm7e2Y11Cb54Z2CwZMV2BU
	7Ct8UUqtY5ho50FEqS5VQvQ=
X-Received: by 10.233.237.18 with SMTP id c18mr1530416qkg.267.1516676827764;
	Mon, 22 Jan 2018 19:07:07 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	v20sm4174785qtg.79.2018.01.22.19.07.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 19:07:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jan 2018 00:06:25 -0300
Message-Id: <20180123030630.26613-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180123030630.26613-1-f4bug@amsat.org>
References: <20180123030630.26613-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v8 09/14] hw/arm/fsl-imx6: implement SDHCI
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
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OzmCoV30tEHQ

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
various FreeBSD console output from google search show this register having
a value of 0x0377c800.

 hw/arm/fsl-imx6.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index b0d4088290..1f4607f206 100644
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
2.15.1

