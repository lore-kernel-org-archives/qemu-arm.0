Received: by 10.28.71.27 with SMTP id u27csp2303679wma;
        Thu, 8 Feb 2018 09:03:43 -0800 (PST)
X-Google-Smtp-Source: AH8x22796QldsSzEochWYDPNwvWgYHNZIXTVBPXlm7Dn2+3vHT5UAyGVyAl5Vb2PTmPU/IIzPk7e
X-Received: by 10.37.187.206 with SMTP id c14mr503320ybk.408.1518109423579;
        Thu, 08 Feb 2018 09:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518109423; cv=none;
        d=google.com; s=arc-20160816;
        b=iy7VljfbMadbDmhK1iVL8ysuT95ojRBRhXSlez4IDpQ1+7oMxjzQus2Q9MonaU/JB+
         RSWyqksvc+hLuONuPutC8WFpIJom2n2+lJhlnMi35JNTDIxKT3rKOERUTcsjW2PCev7E
         xHaEo4oWbZqR57qdk2MbiLR08Q4pBgpxnd4g4+uZaVa5wldqx/vxbOpU3zLqvnzvkjt2
         kP5ZiDCA2L2SVuh19JV8vr3CgKqaidJUBtXpbEumigNPIWXXlnbY9OI8jmtCi9fhfV9s
         Sq1LvHW2R8lP4Y6XKiFiX2mAnMzZ2rFzzD9iXatgVAUlsM6uJFW6qNHklKqnk7S5DSqo
         Fqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=cO9ODkySXJeyX3hoLoYb4r2uQetrbgflLQB3t1FquRk=;
        b=LGkwZf29Oj7ebwIxnbo4K6tL5PeHQDxoJpLsyfvkOcMacwowEBf1XniwIIoBVDKaQn
         ssL7qSiaYObSP6B0hK4ksKEnLTbP3QyWUqzZIC6alt0PcPCRYWPSbJ1D+VELv2tlyWmq
         wj9JYjjSWm2IoGEB2RXyb2mTb+YuhdRvpMtA7Nayja1hTlZHNLHeZcE3MxDFl/oH8Ius
         fhcCKZGQYFA+bfUGXeikSpC09ScHV4LhyWviDTHN9NDOjaIvdI2l4GbXkWOtvZEsT021
         xhvDCOR6Vaqr0cniZUXocv8ukqAPF1T/TjnJirzvPHOeOr1i3OcikNZlQcaajI4GNKq9
         hJUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CXPQmDOn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l9si65216ywl.271.2018.02.08.09.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:03:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CXPQmDOn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejpbq-0002yn-RK
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:03:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOL-00008y-V9
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 11:49:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOL-0004PU-4b
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 11:49:46 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37096)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOL-0004PN-0J; Thu, 08 Feb 2018 11:49:45 -0500
Received: by mail-qt0-x244.google.com with SMTP id s27so6993107qts.4;
	Thu, 08 Feb 2018 08:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cO9ODkySXJeyX3hoLoYb4r2uQetrbgflLQB3t1FquRk=;
	b=CXPQmDOnYocYLAmBKzaVPaH8I2NPViR8WqvcruHAYHoX48JmQUjTPdmLb1Z+rU/Pp3
	k2qOnetZgW8hC6okGLdvQCgPdgLTtwU5YKCvES8Ds3tE0A2NAnNvRv7af280GBExWvTR
	dV7cu/ZcrLVe7gwLj9ePloQ+LH1r6Aj7x63kVOrlQ/TLrmLc2uKDEpUHYAuot3PIlye0
	saRqf4THrOUoHHzyRdaQ+Fv7KPkRW4mHefBJ7Kmq0U6h1UixzfJcKJq/hUD4nhKwOPed
	8jKWVAxnQbN8VtwfiDMt/z5AAQkBt3d4eZJtODOhPdT5/yFBxs8FBJXfakIqsT6RyDNq
	BMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cO9ODkySXJeyX3hoLoYb4r2uQetrbgflLQB3t1FquRk=;
	b=rwNYFR/90X6sTaGurAdbTpE2ic0tNuyxLJ6kChVz344KXKuDCVuuK73fjAcjyMohb7
	FQGf0IXuDsgG94NFXz2OAdHd8e7unzfXs7U+W1I7gu+ChiyiGEpu0p2pxh0Y6g5s6hCG
	1C/vDxPDWXAs7jHx4ToboQYhOpE4hAZpemDacQp64I7MEz+BGyYjazw00emtOrC8QqMv
	SS1A2/B5m4A8JlzU1pSDuTHXZzc096PJlHwpy3a5vLKdtRpeSpTtlK3/ue9b9v/HAB2T
	WvS0h3bCzwRbf8yQtLVOD+z61IFtn32h3UG0QnuOR+Ayc51cTHAPYPajOkc0Y7sbbTlD
	NjIQ==
X-Gm-Message-State: APf1xPCQOq4Q7RaDdPSyGmN3dbV6XodHF2DQOfnT5P9IJgnSNTKft208
	GCOrLCdnyRvRwa64DN3ydfw=
X-Received: by 10.200.40.208 with SMTP id j16mr2020133qtj.331.1518108584509;
	Thu, 08 Feb 2018 08:49:44 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id z66sm240905qkc.9.2018.02.08.08.49.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 08:49:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  8 Feb 2018 13:48:13 -0300
Message-Id: <20180208164818.7961-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208164818.7961-1-f4bug@amsat.org>
References: <20180208164818.7961-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v11 25/30] hw/arm/fsl-imx6: implement SDHCI
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
	Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LjefQJDNDBoW

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
---
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
2.16.1

