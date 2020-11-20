Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1396252lfb;
        Fri, 20 Nov 2020 07:22:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGKR8raEQZaoxtkx/S2GnNIEsJVfAcKQTi6ixWVp0kU1BqfS1Vuq3FXmpU0E1hwnl/03Fu
X-Received: by 2002:ab0:1346:: with SMTP id h6mr15026620uae.99.1605885741372;
        Fri, 20 Nov 2020 07:22:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605885741; cv=none;
        d=google.com; s=arc-20160816;
        b=Pp71TRPS2mTfR8Hj6k3UzFnQDXo63WkbnCvGbiqpxQw7IGps3v1V2ZLqmxZpU0zS4B
         21qUclrGsascGfkCdq97tKfCogl6tQvvvL+C/fAn0VB+vLiFza84tjEDyZ+anyKw1oQH
         U9qPb4ofJvbMe2TPwJo7veOxDL3AOFijMOHnzYR3x9fja4RSMHekCbt8gflUPzYh1Bgi
         SE97Cak92v7zozlMmShxHuPdr4+9QGSgOhRvlVXZ0hQF0C6mPd3YPS5utPj/dN89v7Im
         VUJVXgpW1NWrn8OUtWqyfphBgRNm83Vdz41r4VSkYvJXcKzjKGlJTAOcqmtVznb0H/Lu
         SImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3dEydJ5cyhBIzSRwATWy+tOP9vznIXP6/O1QeD+0UM0=;
        b=HokxajEztYttTfxRIjoRMAWEip6FpdXNtePL0fkcq9NiHCHwnF7UufaPjE1BGz8Ekx
         hF8PXe6YgHKML1AfASo/xNmqfIXwhdcVDO5iuNx1ecdlVMUt5rSy4FkeMilgPLpR72QV
         T6bHo+J4K8Re4+YpOUXygandpPW02URo6kAH7eVgor9UmyTR/6xVbKoGKwgCPaW1XNA1
         lLv22xLPK2g5sp4SxwEMn1WLw6kZxmsvyHx+rh2F2xHbCrg+1lyhu0jddZvksO47f4VE
         gllWiwJMYEDFK7MshqOkC8RPkMEjpcKG9WKGwwc2emrKoVQkgYA+4eEuk4XCHPxF5ZB8
         cBkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WYhkTLdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si750618uab.104.2020.11.20.07.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 07:22:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WYhkTLdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg8Eu-0005Dq-JU
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 10:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8Ec-00059l-4L; Fri, 20 Nov 2020 10:22:02 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8Ea-0001wG-PY; Fri, 20 Nov 2020 10:22:01 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j7so10438526wrp.3;
 Fri, 20 Nov 2020 07:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3dEydJ5cyhBIzSRwATWy+tOP9vznIXP6/O1QeD+0UM0=;
 b=WYhkTLdE0t9zjnOnk5L0XwmFRm/hocb2CRsDdlM3OgMBdm5rYx6IOrXIR5Z+y654rn
 QprJ2UOEvVwVDJPwxr6HIePWSjbgVoZpBTzJ7oyuHlUqIiPHW7oXDbEkQNUc3+u6f1Q7
 oYHyHU2qJN+gCe16fDyPiiga5beodXMK3rXlvHGm+qp7blUTP0vk8vQqyJPoJFixlWCa
 K5VWQtabn1a/2GYbKdF3ZfSxnWf9GfoU1x1FXjFSVDC41V45qEsMZzqNmTS3RF0cKDag
 R2NsY/lQ2zYTM+N52Gy7fuahSE4S/o5sX2xa6fdnU68375gRz2kL7gPn1HZtS3/Fk4qo
 Z4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3dEydJ5cyhBIzSRwATWy+tOP9vznIXP6/O1QeD+0UM0=;
 b=pCdvr4uXo/hnc2OMbDsL9yAEqLjkiSSq2hKLCRKjSeYXm18VwdXAzhQsaTmxDfEDE1
 jzpK1Hb0YXAc0Lw6HsXs3j5goXNtBRZC+MwNZ5xCxUnMgRSN1AvftSJUlmQZEBx4g1MO
 6rOpQugqShTAO1e42RRA2bHOFbE2EtJsLH6dw1wYTsRRHxvjGJzdnREUhiYHPzyrbXiN
 sCWHKQNabPIgzAiN27CaY5nexTC++Q3JVsrYTTM982fJDMGJ5Z4t32aUO0ybJJidvE5X
 1nUHqp465a2AgaAidLKxXYBcfOg9tyGo7NT48isfdXAgzqdzwq0O19oXwVR+8JTZVHYT
 ys9w==
X-Gm-Message-State: AOAM530hPuZEPSm0pNmuikKJsy7ZjtAVYd25u1bnhnSXMJ/WSrlKh5LR
 MUFkkaVloK7JEjb5HaFW7hsZjPoNWXU=
X-Received: by 2002:a5d:5450:: with SMTP id w16mr16059725wrv.425.1605885718688; 
 Fri, 20 Nov 2020 07:21:58 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id d3sm5530008wrg.16.2020.11.20.07.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:21:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 3/4] docs/system/arm: Document OpenPOWER Witherspoon
 BMC model Front LEDs
Date: Fri, 20 Nov 2020 16:21:39 +0100
Message-Id: <20201120152140.2493197-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120152140.2493197-1-f4bug@amsat.org>
References: <20201120152140.2493197-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bEFKtqrWr0w+

Document the 3 front LEDs modeled on the OpenPOWER Witherspoon BMC
(see commit 7cfbde5ea1c "hw/arm/aspeed: Add the 3 front LEDs drived
by the PCA9552 #1").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/arm/aspeed.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index b7a176659cb..690bada7842 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -47,6 +47,7 @@ Supported devices
  * GPIO Controller (Master only)
  * UART
  * Ethernet controllers
+ * Front LEDs (PCA9552 on I2C bus)
 
 
 Missing devices
-- 
2.26.2

