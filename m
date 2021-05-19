Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1818639lfm;
        Wed, 19 May 2021 13:11:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrLea7On2cffFHEXByPfhWp8zhEl3tzgJp9M4RVyLOXWgnlPfMEXglCLlhkTJjh7Vj6xAe
X-Received: by 2002:a02:9621:: with SMTP id c30mr978437jai.113.1621455080517;
        Wed, 19 May 2021 13:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621455080; cv=none;
        d=google.com; s=arc-20160816;
        b=fQCLP3lxGcvbKshstpxQ0XqZBFLF3gyKYYkZFuV1zKTYm/ZbcBEJfGI1KemQrdSHK1
         WEXpOEUmE7/FiJsZ0zNPUVwd/H4+5dH/S25H8neq/egq7ZAhmzPFdfkEaohb4cgqaeDw
         FYniph5fO9vnhJ29Dm+mq76wQJyXVN0Je4ZlTENsJChFW1JQvz3j494Qm5SIstnJloaQ
         gm4i9PqXd5uR/Rvu3LgcpiS+6ups6AWgzU61vUooaLeCXnoFer8u5IxE6bsaFoG5jEeS
         7Qqa7C9L6m1b1M3ectU3flRC4+4zDnFr02tFd6AhcnhaSkkrIUYNURZYg0lRrWru3NPM
         9eYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UNRUgI7bQlcsYYliaD9X4GS1cwgUena3dydk8aG8JR4=;
        b=J36YVSCVJSBQ1YmGfkV56DZl7qJnhPQttTh9FH/lhryVddx+kq50lDb+H39VwPgU6h
         7Xi81JRfnmzLKltZbQAANgIw2OFw4wOywNxGSjRXQDVoRtvD4Q2Gg/B6Cepl+AXuK0c9
         OeUKe+xDljOM6ET9rJAdrbHW19PcoSu2CzY0csli6w/kIOUj8zMLZ6KxglWBofZJpKpT
         LvDm6GEavfHA66E3qRXrBgFu60ZCLG8xpKmRZYCnAGH/zlWyrm4KsEiKqK5ppklEk/XN
         hTeDni/YzNbbQqC7ak9v7w/cjQcKE5bimzWlzYHYxyZ5J2fP2VRFKdDopcVOfG12BjbN
         olPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KP1eSi0w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si752666ilq.1.2021.05.19.13.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KP1eSi0w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljSXH-0003a8-Sc
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljSW3-00022k-Vb; Wed, 19 May 2021 16:10:03 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljSW2-0003V8-Ds; Wed, 19 May 2021 16:10:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r12so15313222wrp.1;
 Wed, 19 May 2021 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNRUgI7bQlcsYYliaD9X4GS1cwgUena3dydk8aG8JR4=;
 b=KP1eSi0wZ5rZkpG98HHwsb2jPyjGS+OISbQPbKTswYfHGW5B2AmM2sYp0b+qT6ckIT
 WChwmzNjFWBszm/0JGZBpLc39MPsL66PDamiKtGdZbc+hutA5gV76Mbt6g+B7jBTaMcA
 oyWAYsSDWPhxl8qK3iCrqUq9Xl/nMR5sAwFj7RZy4y68oDXAaBejAeenIhwKSQzC6vAP
 w8nc6dnIy4FCxmrsZ3oVSSh9tAc61c4+jKGsve0Q3lAgAlbC1l7LS8/2OuC4aMlCU2BR
 nAVRL7RCEZOVI7pOd6oqpBpRrHyo4487PXgK3apDYwymRBA3qeZQyOeiHwIGRAhGITuk
 wcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UNRUgI7bQlcsYYliaD9X4GS1cwgUena3dydk8aG8JR4=;
 b=NWW6FSMNALUQOWYLet4URpzHbB8orV1AKliCTZUwlEZn6QNkgoDYcdZLeThrsyZS4O
 tTIQgX8f+cvJQcHlXZSC0xTr17i8fE8Ha9jOrqGZ+PVv3Q9eNyAT5uMmNPjve8BpCyzA
 ACHUNJb1oYo979otjbbx/3I7BlRg5ME4m6lCnuI3d7bFsxVQQP0gOipUmLJqjW0KGyNk
 NffzJfarjMoH4WOAbJT+dT+b3cBpr61ddx/PZfSuq/8I7lauujtbf2twSxyW921EQ/sQ
 RXt8FkseHnKyIRaMnSdg3hddASKt4PTFueTQpod8J3GFHZROvGSfbB+nexIwMT5OlwOi
 1jXQ==
X-Gm-Message-State: AOAM530W/UbESKZKo7BNU7q0vC631vGl445uodWRyFXnaY0JWK3PPIOU
 DAI96Go2gq2eSl0JK+TdIO11LEbE76LTpQ==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr695934wrv.382.1621455000321; 
 Wed, 19 May 2021 13:10:00 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r5sm438109wrw.96.2021.05.19.13.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:09:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/arm/Kconfig: Add missing dependency IMX_USBPHY ->
 FSL_IMX6UL
Date: Wed, 19 May 2021 22:09:42 +0200
Message-Id: <20210519200942.2223292-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519200942.2223292-1-f4bug@amsat.org>
References: <20210519200942.2223292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gu8dw9qHuYQq

We added IMX_USBPHY in commit 0701a5efa01 ("hw/usb: Add basic i.MX
USB Phy support") and had the FSL_IMX6 machine select it, however
this machine did not use the IMX_USBPHY until commit 49cd55789bb
("hw/arm/fsl-imx6: Wire up USB controllers"). Commit 17372bd812d
("hw/arm/fsl-imx6ul: Wire up USB controllers") added the similar
dependency but forgot to select the Kconfig symbol. Do it now to
solve when building using --without-default-devices:

  $ qemu-system-arm -M mcimx6ul-evk
  qemu-system-arm: missing object type 'imx.usbphy'
  Aborted (core dumped)

Fixes: 17372bd812d ("hw/arm/fsl-imx6ul: Wire up USB controllers")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 838737656f7..3c3e2e94086 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -465,6 +465,7 @@ config FSL_IMX6UL
     select SDHCI
     select UNIMP
     select USB_CHIPIDEA
+    select IMX_USBPHY
 
 config MICROBIT
     bool
-- 
2.26.3

