Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1511678lfb;
        Fri, 20 Nov 2020 09:42:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQA1lbgawSrrxja7zABl9Jqg0Uy53jJO+M+LB3loTWxaw0to9pqWVPieaYRGZBgyYMd80v
X-Received: by 2002:a25:d713:: with SMTP id o19mr24964284ybg.378.1605894161389;
        Fri, 20 Nov 2020 09:42:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605894161; cv=none;
        d=google.com; s=arc-20160816;
        b=q49McarKfCL2TDQq3rCYZCa8Pxf6XUQmoMm1tcxe/q2IyQMm1lqo4/lZ+YT21oIDnF
         zXRY1WBvq6ZTSc6K88QhnWwYKAPQpRNeS7eZ30fH6GT4jG87BFty0Yf0dPl2zichPWIb
         r7MbxZvXqILL/cYiCDNYgPdiRk1ZJQsialvx8Qs5fsvo/Bp8fdq0l3LYGGuLOMFNircp
         3ZsX3WAD5a1EgO331CaTzKfjy5uGacYtLZ1s/gM9ZnnwgZSUDC4cmdbKhPdEmm/fMUKq
         aMGrsvrSQQlUHs8RVGwYaNc6CmJtyp5YuDMbpdX75mjnpdyQSisMO794QacY6PBubq1N
         76kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yZ0I/ttxO6+0LXOLVk/H8KWH+cjP5hkp2EiObPP5BgU=;
        b=wxMD/ackyPvcZGwFDsuRoBJmpOxgFAe0jGlOpAX0wWS3tCi1pEhBSL5XZMLSJpVYQ1
         d6Lg10J8JSXtt/iP3GjLmzWF/EqrbDu8f6kfSVkYN12ftJDP1amj7YpXv8kyiyKovTG+
         v6pA/kw6rxOH+ob/TbYM4nmdadCkKa2wAuQB2cEVlnkt9yJEsK0Yfxx2eaMcDsqS5f5+
         Zo3zCIfT5jBUnT21Jjki2cYHiEX/FTvDDboDOZa1tQD11/Mw8ujgi8GJKoAYBDExct5p
         r+R5qnY8hJNU/NuzomUeJ0geYHOA/AXdbAUhZtwwQEPBGcWSjJOIpAhbE6ft8t5qNlAC
         hTwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WYTXFXYh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u106si3133156ybi.236.2020.11.20.09.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 09:42:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WYTXFXYh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kgAQi-0003Uw-Mb
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 12:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAOM-0001iK-Jn; Fri, 20 Nov 2020 12:40:14 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAOL-000495-1m; Fri, 20 Nov 2020 12:40:14 -0500
Received: by mail-wr1-x42e.google.com with SMTP id c17so10808619wrc.11;
 Fri, 20 Nov 2020 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yZ0I/ttxO6+0LXOLVk/H8KWH+cjP5hkp2EiObPP5BgU=;
 b=WYTXFXYha8FlU1Yh2C6Fx24GYiZ673tSBvrPguR11dOyZMvauU+fZ/ueDBds/wKEGQ
 rIsJQfA3kQhzfyTKB7yTr7AhVRx7m5knHAkNLfDN4mUv8b2eTvYISs1+YGoIYHW++P8b
 Wp8DQvLn9JwX4v59qfMx2Iw2vSE5eYwROEwB8v7UBMlSF1C08Kghj3FIYz2AmIRUt3Ks
 1xEFiTGN718BFJQhx70+xQm63fe7qpXYAFb3nxhggL2laTxbCJ7shd2hnkBBAdumjcIz
 hs1023jQRUYTTqkxlUVEYrj/o0TOslHmbdmyhSDKkkdW35PtTLIghRkJ0IT6OBPzjNKR
 s6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yZ0I/ttxO6+0LXOLVk/H8KWH+cjP5hkp2EiObPP5BgU=;
 b=tDKGUvJ3pizDPjVeDDNnkrQUdRKoaaiYQgqxsUxYwRQBs7gxzT7bbqzlkOwPhYI2ei
 X4zUWgvNNE2XieKf4RtRV/0GnNN3oxk9iOb40RNyV7QrvqRzY4N07U08bWkLamji/LxT
 G/vQmZbC/GjbOLIyzn8FnEY2aYCqs2mbhj12w5c00kbDCR4qslk2hVtiUUeaR+MFGbeS
 jAcB6wLLJecNyrM9+3nMUbnZYbDyUyilbQn4VAmDA3UhT/MK3oOwTN6VTthSVbEng2IQ
 XCm5MXMQf+8qt6Hxd/QbWuEWdBX5SXCi5qwhgvqnwmV+BaWwduKGK92t4+mg2G1wLORX
 lkuQ==
X-Gm-Message-State: AOAM532U45jmu/VHpQ46utO4mvZhN45nthJ48ZcbVmMmPQHOofVHxXD2
 XEChJ9TdzM0+cqxSp3w2kruZtGJEg3Q=
X-Received: by 2002:a5d:4046:: with SMTP id w6mr17014247wrp.51.1605894010736; 
 Fri, 20 Nov 2020 09:40:10 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id i5sm5727796wrw.45.2020.11.20.09.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 09:40:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 3/4] docs/system/arm: Document OpenPOWER
 Witherspoon BMC model Front LEDs
Date: Fri, 20 Nov 2020 18:39:52 +0100
Message-Id: <20201120173953.2539469-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120173953.2539469-1-f4bug@amsat.org>
References: <20201120173953.2539469-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VUdyRlo9OCAD

Document the 3 front LEDs modeled on the OpenPOWER Witherspoon BMC
(see commit 7cfbde5ea1c "hw/arm/aspeed: Add the 3 front LEDs drived
by the PCA9552 #1").

Reviewed-by: Cédric Le Goater <clg@kaod.org>
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

