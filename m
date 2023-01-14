Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp240888ejc;
        Sat, 14 Jan 2023 09:03:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXseRiQGsvLHg0rnobix5NqKSsq/Q1DsEMUdWnEenvsgoz1WePg27qePHLzQZYtNPY2NjNFe
X-Received: by 2002:a67:e996:0:b0:3d0:c826:599 with SMTP id b22-20020a67e996000000b003d0c8260599mr12227002vso.11.1673715790854;
        Sat, 14 Jan 2023 09:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673715790; cv=none;
        d=google.com; s=arc-20160816;
        b=GlkjH27YVih26X9y7Poyke5Jqwf39Zc4d3S3EomkXO1iZdWFcSGbaGOEyLw9d1+yi2
         2yRzyhP54r6NgmioGFza82O5UxasYBQlTdOKecFOKZKRev4SS1r8gveC/E6l2b6TuuG2
         NcV+pOlm+rKUlw1XkZfYl6tgGMuBd+tIOOBcakwjGbQ/9msEYL2VsgF/joP8mEQjCPtA
         RhzXThWb9NoJ17Sm38JMiB1u8lMSm1159OYF1YfXd5Ik9XSwI4pNMy+i5+NOQl7fBQ+o
         auu2kJMLyPS48b6+GI3Z0uvBEH8OGSzAH6ksij/iob/m9PLEiNVTUS4QSiLglRvROLKC
         AYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=lewC+ZaGDv5b7C0ojRtWuEYCAZCuTnLQIoSlO5Ywr6Q=;
        b=GYOueSxYRhvUjiaqXOz7ooGJ+dLg+79fHKcwrCh8XkVlgUknGvzVNHoub2ZIikFjcM
         V3fVU2jfRruA7RLLUdcsxI18ASb5yNWFj1Vzia1RbPx/45+m/vExonn4XXpzZ5ct13+0
         Dvk2wcI/zcml3wDPBkrr+xanlH+g52cmI9/rtECGjE7Mc1iv0BBxl3WpB7VtZzuDeYTp
         CvsligypGS7MIT9sfp07zvAjiLaVpBhGdrPeWb0uBCw36ApnfwYFR+8kXIt4L9L/H2l7
         5EVQqC01yqwCBylzjo4vuZN9gOlP5K4u6Mni+3IGLC0Iu3IsJsAMfS6teHmCh45WMm0B
         QlBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=kh7jyQiw;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=S634VwkI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a056102100a00b003d0fb095199si2547753vsp.567.2023.01.14.09.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Jan 2023 09:03:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=kh7jyQiw;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=S634VwkI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pGjvA-0005gN-Qq; Sat, 14 Jan 2023 12:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjv1-0005OU-TW; Sat, 14 Jan 2023 12:02:15 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjv0-0005Ve-6h; Sat, 14 Jan 2023 12:02:11 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C81365C006A;
 Sat, 14 Jan 2023 12:02:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 14 Jan 2023 12:02:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673715727; x=1673802127; bh=le
 wC+ZaGDv5b7C0ojRtWuEYCAZCuTnLQIoSlO5Ywr6Q=; b=kh7jyQiwJIdbrX/E9+
 LQBEja4SVQMEDA0+xXJN4sFsdtTmvQDWeOFxDp+4lDxn5os6mqlx4jAxCs2HlEms
 9xqL9Z06YR6IJxWjnigB084ZW0u+pZmG9bJzCpMrfhrhRBoUDjtDcGcnapzIlGH8
 BbBHoTw+GcBBfHMbeDQ16VC4i1BeDgVQMcFql3oli/mjCHUO2Ukxb2owAFdWyWgp
 LC6jKbgSknXrJGqfIgE86gM/7shIOZqSNokcuuo21KKuPQKGwICDmRmYkDVsjEHB
 pqG3+bFXCHaKl6DCDjB+eCSQTmxw/zLWflN0SjoKnKLnBp+UZrczWM1hiYuM3hrJ
 Sv5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673715727; x=1673802127; bh=lewC+ZaGDv5b7
 C0ojRtWuEYCAZCuTnLQIoSlO5Ywr6Q=; b=S634VwkIbVr75m7Jfq7pHqMaFp4+1
 98N7/gmGbiVoMbyOgcF+ca3/QlwPn7/uAavYE9XJZ+wOFnD5MJYCxmm+RKY9HHte
 gfOv1sp0MKWYMCRl8/pQ+AKKJYZDRnRGjF3DKR10j5liWCnXq9JLKeYOZjBC1Yxo
 jTEYSxSClMuvEYRzzfaUSwfW9TQCw4R+bK+R6k7TlkF+AXiMSPOcT0ad8n3Nn/FG
 fYBuZ41ircNPLqVO0RLU124gKAOKw46FoGb1T7bDImDKqSVQf33dPrjW84XQUxtG
 h0lKFARUpRcOU1VU5kx9MYfNDQuF3JNFAEtFSjffS2TCsRFly5np2KUzQ==
X-ME-Sender: <xms:D-DCY3tcsWI8iZy60iEL1Cs1E9gCtNuehuIu9As9IbwOnVLCOVDZ_w>
 <xme:D-DCY4f-9JGi24ZsrfyX-LNjnk8jyclu-T05nxkdEbJDqn8N0s3QDeR98QrO-HjMU
 KejJmWNSx8WEXt-3Dg>
X-ME-Received: <xmr:D-DCY6wB0u8gw04Eeoff-nDMU6mI9g3paMJEYbKGqotwoLn0m8DhBpHfBdXeZ5yqX4Zwid3437uNMUpp0OnMqFplMD8AE6bceA2hB6QLd6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddttddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepteelgfeuleeffffffeekiefghfejuefgtdfgteeigeekvdefffevieek
 vdelteevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:D-DCY2OqXsFQ30VaZtaEKbhLtTdkkGzlxuAlBU-aGyMv-WWuoqcZFg>
 <xmx:D-DCY39C64v8v11nmU_rM1HQ4h4Y4TheNhmAh7j1jXJa8zPNKPAeXg>
 <xmx:D-DCY2UG5OCvyg9X7wuYwau3DOMi9ZbYdD4YJFicWHzNLhR8OqEBew>
 <xmx:D-DCYzSt9AHnVBMyV6_bl9ryq8GF-LPBy1bqhUwKnB0OL3Am1w8rtw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jan 2023 12:02:06 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: patrick@stwcx.xyz, peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 6/6] hw/arm/aspeed: Init fby35 BMC FRUID EEPROM
Date: Sat, 14 Jan 2023 09:01:51 -0800
Message-Id: <20230114170151.87833-7-peter@pjd.dev>
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
X-TUID: gYwecqZIzpS0

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c929c61d582a..4ac8ff11a835 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -922,6 +922,52 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
 }
 
+static const uint8_t fby35_bmc_fruid[] = {
+    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
+    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
+    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
+    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
+    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
+    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x54,
+    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
+    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+};
+
 static void fby35_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -1363,6 +1409,9 @@ static void fby35_reset(MachineState *state, ShutdownCause reason)
     object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
+
+    at24c_eeprom_write(aspeed_i2c_get_bus(&bmc->soc.i2c, 11),
+                       0x54, 0, fby35_bmc_fruid, sizeof(fby35_bmc_fruid));
 }
 
 static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)
-- 
2.39.0

