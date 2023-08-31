Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp246923ejc;
        Thu, 31 Aug 2023 15:57:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwJV9iRiioknDQvCWkFlIKEWw2Dq3nIxsA+jkegjTIJJbPOKUhEZsaukDVvrsit3GWP9bH
X-Received: by 2002:a0c:da04:0:b0:651:95e4:ec85 with SMTP id x4-20020a0cda04000000b0065195e4ec85mr1465741qvj.32.1693522673785;
        Thu, 31 Aug 2023 15:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693522673; cv=none;
        d=google.com; s=arc-20160816;
        b=IGgb+kRbN/kJKD+0blCTYg+EC2GuzwPBWc+UHlaX23nGYpw67rsB+rLx5KPsx3snsK
         xu+N4hAOsJt4qrNzm/nfn1znOFnKT7NuX+KiyqQPKoXtowmUftMFVVetzORUEEGFa0D+
         ew+Z7WdzJNRUChBkh5H7bWTl4jqQ0+FFFnYmRwEuowEA/RKSGb+GK10XEVJaG6oM3dsD
         axJFEvJgJJDWjrpIYgb/TjVOtUNnd+FF0BeXKcMZ7WUhVvwNIbJOnATZejyz00TBSeSA
         gsfSbIx7P0gXWBi1kTpv3Lfop6x0S+aK/nKmWc3u81BtlrKriVDAp+X1uDOrNaNJ1er/
         lrZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4KLx6XBhwZsbEqcvd2/L0DAF2KnkpBlHb/IZBmOztIQ=;
        fh=6kBnmdThd/Mtcn6GnZSOF8dqD10/+Dyg8jWJhZHC9H4=;
        b=l80fEeH5ZP5dGyIGuYMpS3SOmJJl5OwPM32c68DwK9lbqZJSy85YeUDRnroS5jl6qx
         1E9Qs4LcegF7OG6TpImNGugKeTcN/Mn7NNPQsw8sHYuggULvrnOp6vO7kg7x3N7TpJCR
         Hr9bqUzKPel/woSc67u6ikhqTWMw08rhW4Q+LNaRDB1bh2N3KgBelJV5vBCvB96OIJ8S
         PiPAl3xJuFLoaoAxNeQvPv3BjjsyUsaWI4RPxvzJ1nJZGFalF/LF3SHN/KaKuTZWTcPw
         ooSfZfG3s6BGquh5xVibDzONrcIXQ8L6NsHjSkAaoX09Sd8VtnTbxAq2omZZ6RCuk7tw
         jquA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YeGwrBIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a0ce48d000000b0064f53ba19c6si1494246qvl.389.2023.08.31.15.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 15:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YeGwrBIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbqb6-0004US-VY; Thu, 31 Aug 2023 18:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqb5-0004TI-2S
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:57:07 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqb2-00037w-Sa
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:57:06 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9a1de3417acso551233166b.0
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 15:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693522623; x=1694127423; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KLx6XBhwZsbEqcvd2/L0DAF2KnkpBlHb/IZBmOztIQ=;
 b=YeGwrBIuzjOTSmCeVjJ0kHsDobcKC4tY5b8eMQbxApar//mN0cp3kZIni6gJHA82s0
 v3V64jpK/XFDcYolINV+s8QhM59Bq3a5/2ls1J11O8kjsapmtLiEX5cxPWXkmp8BRjRm
 Uv8yOPwmEtxUoLZXBKnTohZjfaXfrSDqocKkaCOG16cYptDz8Hnl2G9bTr3Ga3ydKg/3
 ZU2ayDxvrPn1UwdqF/qQ6Shqf7slVdOBqUVzDNQ2E7VeDB4yd60SxfXtOIcRwsTKd8Fn
 RhpeBDKN6AVseHlnMBcj1vN/QR1Z309JdZiByDAimgeKjp1XiRff0B8lhBDL3nyy8Axf
 mbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693522623; x=1694127423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KLx6XBhwZsbEqcvd2/L0DAF2KnkpBlHb/IZBmOztIQ=;
 b=FCho08dV+oFEubfpw3SJihXTvmqM8ib0kIvIFzJVbFVZdLiBBagOCH4G973NkiCqDq
 GwPNa7+QNnKUoyRqBXHaGnw7C0K2MsYTQ6XIOAs9duEPMFrFjWRXO0QGBPQPnf6+kk8F
 0qWQZEWRpSztEGGk2RJ/CsvOtsYD19UL2H+CHh0l941le8CD39rwu9Lat+qS9POFxjRm
 w150CaVJdcqQTzw7URBldIvFP5xqwRVtgeKRTV4ejU9iTBY/6MFB3qkyBlzk5Gs7Ta9W
 rSHb/QFzVTMq/Q88Z7CCsloOycow7na1yC37IqjdMfIpCBiGZfuCsLFowUMZjNgo2iUL
 D0Nw==
X-Gm-Message-State: AOJu0YwLXnicKYAxKVU4P0peKhYULviO9XdvGk+pUNwQ8kcdfE0+ctMP
 YNyV3jVJ+vOi9St5ywNU4ewxgA==
X-Received: by 2002:a17:906:73d5:b0:99e:afd:f2ba with SMTP id
 n21-20020a17090673d500b0099e0afdf2bamr1190360ejl.35.1693522623707; 
 Thu, 31 Aug 2023 15:57:03 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a1709064f1800b00992b1c93279sm1244368eju.110.2023.08.31.15.57.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 15:57:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 09/11] hw/ide/ahci: Clean up local variable shadowing
Date: Fri,  1 Sep 2023 00:56:04 +0200
Message-ID: <20230831225607.30829-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831225607.30829-1-philmd@linaro.org>
References: <20230831225607.30829-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: t5b7yknicO7I

  hw/ide/ahci.c:1577:23: error: declaration shadows a local variable [-Werror,-Wshadow]
            IDEState *s = &ad->port.ifs[j];
                      ^
  hw/ide/ahci.c:1569:29: note: previous declaration is here
    void ahci_uninit(AHCIState *s)
                                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ahci.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 48d550f633..8c9a7c2117 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1573,10 +1573,8 @@ void ahci_uninit(AHCIState *s)
     for (i = 0; i < s->ports; i++) {
         AHCIDevice *ad = &s->dev[i];
 
-        for (j = 0; j < 2; j++) {
-            IDEState *s = &ad->port.ifs[j];
-
-            ide_exit(s);
+        for (j = 0; j < ARRAY_SIZE(ad->port.ifs); j++) {
+            ide_exit(&ad->port.ifs[j]);
         }
         object_unparent(OBJECT(&ad->port));
     }
-- 
2.41.0

