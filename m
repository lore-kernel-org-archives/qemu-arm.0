Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp4196300ejn;
        Tue, 25 Oct 2022 08:24:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Ii1ZrnR+WNfmG08RCTQEhzm/ZiWPijrNR2lgV5bubgP+CCHVPBOGGsifVBICsegUjJiyn
X-Received: by 2002:a05:622a:292:b0:39c:f2b6:1580 with SMTP id z18-20020a05622a029200b0039cf2b61580mr33230995qtw.72.1666711490072;
        Tue, 25 Oct 2022 08:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666711490; cv=none;
        d=google.com; s=arc-20160816;
        b=G1MTLhTias8AYMh/VoniLjm/HgaxGwtr2hHnTFvCLI1ZEsmz/lN+MSch+M7+89HWlX
         +ztA9m0xDXNEyUluNci5ARghOF4uI+c07Zs5WLH/AfRyb2S84liEy/V9TAE35sqIUfQG
         nTHwpiLGGRurHg2KYA7jEa/Y6HBuR11ypEJvDl2LlpUUDjafYmrxsq2UyT25ksj3frfV
         e4/HTQN+ZhHcQYL5ZPIMPp8BABp8oyTBf3y312i0tFViLyvwOuLYsXpZKs5omMSrglSj
         9QX58pme1lvPhTet8LoPxQ2Hrqza9pyaug2ucdKrPnh5dq8RTJEQ/7SiU1el3hXRnDfP
         pd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=wvg+KBo0xwwiv9gXAg/mIgkgrfVuZ2qfVJXbOh2HhcA=;
        b=d9AXcLGbEBxJEJKXECECNDQjDifMH9sT0JbcMZCbP/2km3PU4xzUku9Oyb23uASjSY
         OjPy9bZos7JqjeDF2xxycQFvlCHU7uFD+l5iRW86vPXNHLns0CSJi2bUcag7Eo1WXxRF
         kb5Bt/vERVkm06PLoGrKcXWromTtcANxhXSP98Vgy4L+jRTgduWARBL2hPCGC/zhcOxZ
         bAw0BoLTAN8obIekqE4e4KPHbxPECvCOykholKijsUXFXajSatFOu21QJ98FFAMu8imu
         +OMlBsbun9BlMevZJwWjQgwMAX3kgzS3AC8zJLJ303ebBfq/uck7SXZ3756gsAcc6Wub
         7eCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a378a02000000b006f4744c23f4si1773362qkd.550.2022.10.25.08.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Oct 2022 08:24:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onLk0-0007Dw-Sr; Tue, 25 Oct 2022 11:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLju-0006fh-2b; Tue, 25 Oct 2022 11:21:14 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=KVXu=22=kaod.org=clg@ozlabs.org>)
 id 1onLjs-0004p8-E6; Tue, 25 Oct 2022 11:21:13 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MxbHm2Yrfz4xGk;
 Wed, 26 Oct 2022 02:21:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxbHj5n1Xz4x1F;
 Wed, 26 Oct 2022 02:21:05 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 05/16] ast2600: Drop NEON from the CPU features
Date: Tue, 25 Oct 2022 17:20:31 +0200
Message-Id: <20221025152042.278287-6-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025152042.278287-1-clg@kaod.org>
References: <20221025152042.278287-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=KVXu=22=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1VJWD/e2J4G5

Currently, the CPU features exposed to the AST2600 QEMU machines are :

  half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
  vfpd32 lpae evtstrm

But, the features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC
are :

  half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt
  lpae evtstrm

Drop NEON support in the Aspeed AST2600 SoC.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20220928164719.655586-3-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index aa2cd90bec17..cd75465c2bdd 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -307,6 +307,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
                                 &error_abort);
+        object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
+                                &error_abort);
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
                                  OBJECT(s->memory), &error_abort);
 
-- 
2.37.3

