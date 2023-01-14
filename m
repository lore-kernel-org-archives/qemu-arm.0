Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp240420ejc;
        Sat, 14 Jan 2023 09:02:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu322coFmls/1se0PMd1zMgtqKuzPPvzI39n/FZSgInbeHhT95b+/TdPksGZWpkcYz/UVdI
X-Received: by 2002:a25:42d2:0:b0:7c9:9c59:c95 with SMTP id p201-20020a2542d2000000b007c99c590c95mr7719720yba.40.1673715754162;
        Sat, 14 Jan 2023 09:02:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673715754; cv=none;
        d=google.com; s=arc-20160816;
        b=ygOCNe6gxrhO1RreIAkijIbLM/x0Hrx3XEQ4TDAarNDBshCYxIHYUKdrTlSlpf99P8
         j3U67BO0qBSOW4SrlqKrKMGGUZeLQLNpttntgxjq9x0mlu9/voZTPJPrNqyrUK/srTqO
         YsR6qwO4DXdzxk+QKEyY1Yyfeh17phDgVzrv0HX0qidAVRRHg6UaW87aRJ3bi0E4OnZP
         XWWVLyALS99FycSTn0uDKqlXEn/8by6TGYVklDbFqhvswngGp4ftxA8epLwr7gkzdCwM
         qXgvAl3WzGXgunTqapi3Pga6Lyh1G52+aEx18sPmn065t4qHQ3Z6z0H0/96UVaGuCMLF
         sZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=2HFbEEwhihpA0OQ+6uIgQ52MfEuAPOyUdvNrKSDsV+c=;
        b=o6UUDZfkbr+Tx9N7Wzyl6mJlN19V/HOrwY7ZjMWdk9/RDJjjqmj59uMaAEthXiS2Ff
         DvMbAdoi7NZgMytC18p/3tnCAONhV55dFX14ifF3FWGB2DfadNWZ+cII4QRvKLuXBhXw
         5pZ+lZkKXId4iDjAg1k2xhNcLJ3vu3aGewEdidtnAFjBGcGJLvfnOg12P6Md3nh6NKzk
         ZGT0CkC0Z1HwHitlfXhkV71a72Fnerv3KXMD2ds1j+sBh3ReozAu6Pnyx4S9Y7+CmfIm
         MIVBYn2M5ar0g3pJCrUPfJD9TFVjcyPb5SNsRGxEkumrS//IIxPKnzBKzM/nrCgbEfBt
         pkSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=KSIXczFr;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=TQqVqRkb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f198-20020a1f9ccf000000b003bd3b0d17d2si6408267vke.200.2023.01.14.09.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Jan 2023 09:02:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=KSIXczFr;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=TQqVqRkb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pGjv6-0005Vs-Ar; Sat, 14 Jan 2023 12:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjus-0005EY-0F; Sat, 14 Jan 2023 12:02:04 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjuq-0005RQ-HX; Sat, 14 Jan 2023 12:02:01 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C1DDE5C00DE;
 Sat, 14 Jan 2023 12:01:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 14 Jan 2023 12:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673715719; x=1673802119; bh=2H
 FbEEwhihpA0OQ+6uIgQ52MfEuAPOyUdvNrKSDsV+c=; b=KSIXczFrgsJwx7gVz5
 Yck+6jBFfJGQgV4C6mjAiFoRwdWLDJrgBHrYGxV83nKMbtjjRiOXhW7T3W9x+9tx
 jfOTYnfaJsIBZZTRk0WYdib+cgL2tBStK4hlNriAQBHI1AW87XNYShb7LRzMvS0d
 hoGShvHxrvnhZAyvQrslItlKnwOQMED51MMj1v88nc9LaPO+c2gAv8iUtLkEgm/I
 cxdbjC4+ayJoWUDSjBndy5HtULuFkvq7GKGqjYjN1H1GKsuiNtwimJp9GebxeIC3
 m3aTANknT8heeTUaRRHOq0dJhfg0z07kdd0CkcweHkNZVw6Ykpe7+ewQRapYfrYQ
 f0/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673715719; x=1673802119; bh=2HFbEEwhihpA0
 OQ+6uIgQ52MfEuAPOyUdvNrKSDsV+c=; b=TQqVqRkbqMFdPq7R4h4ox5it2Tayx
 zXH1h5xHDWX036Fh82syM+xsRawxeeK18eD8xsMfzKfYc6VE20MmYMGqY2GEz/c6
 cTdzpHDgDTVboxEwWg9d++mRzVdiOKkDsSdAfezLog5XXBj3lsQwmeXO1m7BzQCk
 EK8PqtX1fynho1AHwtXkCpNiRCMQA6JquObALaLssyIgk6mP5AkzynZAQX0st9bY
 rgqH5IXc0zFt5P+zHWtTpPpFJu1vugqqw0UJOp+SE+d9KR0QUs/t+VyEXYZi+kxd
 oe8/YrGVsIZImjruc8pAhscgFcpXVO7PAYUUH7KbJAK8OPFpn7rsWJEmw==
X-ME-Sender: <xms:B-DCY9dbYinBWqeX3xsY5TdMmINg3w0NuMQq8akm5lYRpsksQyhEeg>
 <xme:B-DCY7NgjmF8YqGVldOlPYckjCT-l14ffhk5Lyo67YO_RfYGBc1_iVJP6m0r__npj
 LqV8WWI4IVVJ_W2xTY>
X-ME-Received: <xmr:B-DCY2hW5Mr3hJrjfveTE4d5zZCqTKY1EHCkREmw-xgwveJotFXid5M7ZU6Hg9Fwal17fLTX3i8Knbyra3fsbtN9Vv5gT19LZpOLgeuP8Cs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddttddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepteelgfeuleeffffffeekiefghfejuefgtdfgteeigeekvdefffevieek
 vdelteevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:B-DCY2-mnaUuzMKZtWeGwf820rDwGvCPOTyauf7ByNqsfmjN0nGm3Q>
 <xmx:B-DCY5tbPxSn87bKwQw1ZnrXIb7xuJzYG1Aek-0Et4PeLL6x8lwQdQ>
 <xmx:B-DCY1HfEen3FFPGCJT4OxSfWoMC-tlBHpwrcaAoiNKCWbJ25iEJrQ>
 <xmx:B-DCY_CodaspLRSm-Ss5xHFxC-cO9MC54QJWOQjZXKwXqMJEIC5Llw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jan 2023 12:01:58 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: patrick@stwcx.xyz, peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/6] hw/arm/aspeed: Remove local copy of at24c_eeprom_init
Date: Sat, 14 Jan 2023 09:01:47 -0800
Message-Id: <20230114170151.87833-3-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114170151.87833-1-peter@pjd.dev>
References: <20230114170151.87833-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +lnNUpemMgiL

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 55f114ef729f..1f9799d4321e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -17,6 +17,7 @@
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
+#include "hw/nvram/eeprom_at24c.h"
 #include "hw/sensor/tmp105.h"
 #include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
@@ -429,15 +430,6 @@ static void aspeed_machine_init(MachineState *machine)
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
 }
 
-static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
-{
-    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
-    DeviceState *dev = DEVICE(i2c_dev);
-
-    qdev_prop_set_uint32(dev, "rom-size", rsize);
-    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
-}
-
 static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
-- 
2.39.0

