Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2449042wru;
        Mon, 1 Jul 2019 02:35:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHCJOdli5sLl8rvgnVJe+CFbV0yev1ecJx/urs/7zLWbavUmUOWJ6VG8wdXlK+C7JQ9Gp+
X-Received: by 2002:a17:906:1496:: with SMTP id x22mr22170918ejc.191.1561973723979;
        Mon, 01 Jul 2019 02:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561973723; cv=none;
        d=google.com; s=arc-20160816;
        b=kd98kU2EA82hQBIf+d4G8UXnjOHwBPvXw3HAN7bYGcmHDSRnG3G9el5/mCDSlLNV/w
         qmBkjylA35/U7rqLwNl1vZH9spYBIq2HRfn+uk963zIdLg/t+/9m+iDImPJyQMCIfmH2
         VZtN37HxIIc6iX0D0Our/KuEOvRT7sW4+0KmJjGLluTsZssNZ+xts0OoAP1jWSOCIRhu
         9/W08IfkzE5ss5ENtG67k3RnH7IQNUYKQ1/auTPzhi448K4LmLxgCPhJ7C+HDTgWUNBd
         idEjFVKs7Ht5Cn2I9jtGLOvlsCagNMq53S2dfYfAEehL3AuzgY7xrXNJFLYAskkCeMi3
         wrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UsKKosMODWH34+1mrBj93znF+OlIHbUl1ClS5ALtRnk=;
        b=HbTsMzzffbx+3GZ8oRhknpLQ3zuZH2s2qtYSRGQm2LtwvRr/YzZLERTLNCwLdEGlKH
         sMD7ZoTb5ObirgnOqa9U2ggXKAvB7C6CZW6ulKENdOiIW9lLOYJikoRkreroIXI8QmhT
         Owbdwgu1+ggpVAThkl5ZYbOsrPuq3PH1QJKTTpWcKPS+voB0D6/wvcjZWxna92z4k1Yo
         wKobe1HA9CagRJznlzMA/Wve7FdUih3YrdUfXH9hmffKi2VgNKZbTzVmbbd+f6dD1xkz
         JMetcmGqCEbWI0JFB0csDW6NBlZx5nPA60kz8UEI3QMipmth6IKlx9IO+BjP0McHsX+o
         vInw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n29si8552445edd.66.2019.07.01.02.35.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 02:35:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhsiZ-0003CN-2k
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 05:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49616)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hhseg-0002KU-9a
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hhsef-0000Ne-AZ
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38528)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hhsef-0000MY-3v; Mon, 01 Jul 2019 05:31:21 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0E55730872F7;
 Mon,  1 Jul 2019 09:31:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-89.ams2.redhat.com [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8A077D580;
 Mon,  1 Jul 2019 09:31:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Mon,  1 Jul 2019 11:30:33 +0200
Message-Id: <20190701093034.18873-6-eric.auger@redhat.com>
In-Reply-To: <20190701093034.18873-1-eric.auger@redhat.com>
References: <20190701093034.18873-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 01 Jul 2019 09:31:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 5/6] hw/arm/smmuv3: Log a guest error when
 decoding an invalid STE
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QXhmCZjR1nCx

Log a guest error when encountering an invalid STE.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 384c02cb91..2e270a0f07 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -320,6 +320,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *c=
fg,
     uint32_t config;
=20
     if (!STE_VALID(ste)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "invalid STE\n");
         goto bad_ste;
     }
=20
--=20
2.20.1

