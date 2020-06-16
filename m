Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2348416lfm;
        Mon, 15 Jun 2020 23:34:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFHuLN1p5FcPQLxgYOlnDKAljbziRxh4WsbMWPuOnhhyAnHY1RkGrjjube82SoeQE5cT6i
X-Received: by 2002:a25:9345:: with SMTP id g5mr1790211ybo.485.1592289254223;
        Mon, 15 Jun 2020 23:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592289254; cv=none;
        d=google.com; s=arc-20160816;
        b=mFDB8jDNo7EF9906FCH3NppGk2iSXxuT27xbQpjtnTcsn3WseUXaAd+g7B0m1FqmHj
         9E1RcIIzPxRJx1pCnNSK+HwW/BzsdVmr2Z4IL1Aeko3dHTlCDm/DkD3RNlDRhhRcDxIC
         mhaJpstWpk1WKX+KpJgdSZx+QartpZoymnjDiT5CofzttHVXd1Rq7Ik5uS/2yQb3dHiP
         ibFQAsh/4q4AyQ+vWO89Zpv2MCmqsGu/nBiRL/ddfk6/8BEzsX5Kgq4XQdQX2+dHWTV8
         8V5+sqbdM2Fyu6oxjv8H/Ct+tf8l/P15QVARBDaWFMiJCFrzUWx0BjGsOqJUlzN5nwYc
         ER0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zqA2FU9tJ7z1sN241pmUGO/apZ+JdoG+SHFS+QpWuEA=;
        b=ZAeO2+ZroA0G5ERhVnlvrwtuUBAIqjcqEM7KKC6Irwu7A32c0vN+GnBOlDmZNWHmjE
         uAfa7YP6O3fyDp2g0+c0MILcx9W0yBiGnwZtUcWkJSWH31kbctFpnnBJoK7zNRksElg2
         uJ6q57M+9KP2Qh0WgJ07Fmq89t97q45Lwnvo0Pkl4YcXWyBJ89oiYnY2h8DsJ7El3una
         zf97gPTUYObvDsHXUL8KwLSnD6qzEAtB7RJH4Pk0sXLM6O4h6c7xVpUWEC8QaeW077Gr
         2y1NG0iP7/GAuQcq5RuXZDxtSo72uGuZ83Dhit44x3amonUKtI4QakoKukZTZlNYT53i
         h2DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OYqjEsjI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si6913744ybl.316.2020.06.15.23.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 23:34:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OYqjEsjI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl5Aj-0001DS-Hp
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 02:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl58f-0007uT-8j; Tue, 16 Jun 2020 02:32:05 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl58d-0003LR-HS; Tue, 16 Jun 2020 02:32:04 -0400
Received: by mail-wm1-x341.google.com with SMTP id l17so1723880wmj.0;
 Mon, 15 Jun 2020 23:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zqA2FU9tJ7z1sN241pmUGO/apZ+JdoG+SHFS+QpWuEA=;
 b=OYqjEsjIf9mT85xUHLTdSJOVKFvKCGpcGerrL8lLXivaNhEXa5qarLa0CunVVUj7Ku
 EzsaVGpKrQCasNtZ2EUVHty794yeTatEgiPODQwLGf39DDxj+skOlqz/2+0fPjHqMAhF
 DpCIeQZAa/U0fDaszqyonqqRZnPoalmYNfTVasSEaNJTLqIXG+ZiOYmO7upojA4Ocgug
 ZQg74yFBHbgukaQh9b227/sijPh0q8RKUhu+lDLLQy9dRpRTP09q4L/iCpnPokwNz+Ii
 ZcLT+3w8Z29rvr07AVshDlcYRxvsMWF+s1BUD6l+sGmIHJ95lIBXM3xCJ7FgLFZ2Bccg
 VREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zqA2FU9tJ7z1sN241pmUGO/apZ+JdoG+SHFS+QpWuEA=;
 b=i7Ih2HeskeJgmKFEWMOZFrWyPMZpcRymB178EKmOURdLTNJCpm9gRqoAeinF7uGcB+
 todagm3r0pnO5dsxJKtjlWtgiDFtI5J51fo+csRE/fBuYEImEazT8ywGuhmSQUO4x5AV
 k0A3KO90Vtv1l1WZPY2z4AvOdVIkKn5QnHetW/5yKSqg689zXpuvQFuuKSCbh1wfhnDh
 V9RV67/1D8FF394ZiKfVV+x/qwn0fTm8WihvYxlA/A0pbYOGY6JTydv0dJR8EwtxO3th
 q0h7n7GDS6g4A0DahDc7rWCsJUi/Q+Rh0/LA2u/hVsLn5gJFcd4dgPNxssY9Ia5CgNRY
 62og==
X-Gm-Message-State: AOAM530F6IlDW9YlOTdnpzQPpuxPpEqF6EMpwTGky4Nrc3QVD7H5yhLM
 zgM77xOaQ+1RF3E6XW/mgOuCPG4K
X-Received: by 2002:a1c:b182:: with SMTP id a124mr1470329wmf.114.1592289121705; 
 Mon, 15 Jun 2020 23:32:01 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id t188sm2483250wmt.27.2020.06.15.23.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 23:32:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] hw/arm/mps2: Rename dualtimer as apb-dualtimer
Date: Tue, 16 Jun 2020 08:31:52 +0200
Message-Id: <20200616063157.16389-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200616063157.16389-1-f4bug@amsat.org>
References: <20200616063157.16389-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9E6WGsBdA6hP

The dualtimer is connected to AMBA APB.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 3cc02c9018..1e8d5f21f9 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -306,7 +306,7 @@ static void mps2_common_init(MachineState *machine)
     cmsdk_apb_timer_create(0x40000000, qdev_get_gpio_in(armv7m, 8), SYSCLK_FRQ);
     cmsdk_apb_timer_create(0x40001000, qdev_get_gpio_in(armv7m, 9), SYSCLK_FRQ);
 
-    sysbus_init_child_obj(OBJECT(mms), "dualtimer", &mms->dualtimer,
+    sysbus_init_child_obj(OBJECT(mms), "apb-dualtimer", &mms->dualtimer,
                           sizeof(mms->dualtimer), TYPE_CMSDK_APB_DUALTIMER);
     qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
     object_property_set_bool(OBJECT(&mms->dualtimer), true, "realized",
-- 
2.21.3

