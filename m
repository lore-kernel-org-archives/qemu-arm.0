Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp30026ejc;
        Wed, 24 Jan 2024 21:56:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6jIPzPIUDK2kqbGr05C+Cq3QIq+ZVCKSCWFLde1+nx/rwSjJId6xqQ0ljk1C2163Q+omC
X-Received: by 2002:ac8:5c82:0:b0:42a:6286:1d2a with SMTP id r2-20020ac85c82000000b0042a62861d2amr866518qta.30.1706162182568;
        Wed, 24 Jan 2024 21:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706162182; cv=none;
        d=google.com; s=arc-20160816;
        b=hgb4iLqe0KHIFcvg/GYI16bfnozmHkvb1whGSBI8TxPQRywlB3HZiQwPv7lMkhGcee
         SVYMGSwiBMiUKHaTiSy5aZCagg8pyJULHKPJurINo5AZ4gof9zSnsjUCc/GpnCzUMcas
         AAbjGESBzsCX/5412m/3Fi/OdNcyzeEAz4aZaa+BsgriTokM5xKKEMyaCJ1UCQuLuWmu
         sfXBwPgdATnUqZu1zQoq8SF2M7bvau3ttzyaqmV7UzQo6L3wnfGOtfuJZJl1sz+OZiQx
         KazGhiCAszOBEPydtDUnYsB3ivOgY3n/BcYw5M/u9+1QlHwZcCPUiljrApGVdupw0rrq
         TCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LTjUodNM1cz/FwQ+agsvuxdNwnKZ6thXnjAI9kk5o1E=;
        fh=ZofYB1COZgii34hhzHLtVD/QpgCjrxWfRH5mgsGMmL4=;
        b=fyiAlRRtuxNkJF180IFIJpMiyHEBVOrt4oSV3HVVIGtdk813MM6y7rJcBYvLtueuZ1
         xT5Yl/y675vqFtnIpvbld/0onIr7wv9vw22iYwok5j+jaaD1fUvbR/nGYTGJTxqsJtph
         qClZa1iFn7vPf2IzxnxdGWkIDGx8prN0oVTTfuqC5BD9eVUEv5+dfVJrCltAhSF7/uDK
         gxBck40pzZnxAAxF8xVA5r6az/ROUJDKCig/3sw0EiSDx+kxzohov1JBwL3Gt97EX+zc
         CsOIjDp+14IdonJjRpZcebECUQZP6M/Q8JKEzeOOqGXTaIFn2URGGSrWVmypcdrDmqar
         OXbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hure3xIE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020ac85a8e000000b0042a1b115a01si12015792qtc.92.2024.01.24.21.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 21:56:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hure3xIE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSsiS-0003Gn-O4; Thu, 25 Jan 2024 00:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSsiP-0003GB-Cs
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 00:55:54 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSsiM-00016Q-Af
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 00:55:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e7e2e04f0so69124255e9.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 21:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706162147; x=1706766947; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LTjUodNM1cz/FwQ+agsvuxdNwnKZ6thXnjAI9kk5o1E=;
 b=hure3xIE0uajhbLsa4z+UrtyDXcDnOk8FD9OjbUuyG4dchJou+ZC1bO5WgdTIEIM3k
 HqzxjBxXrn/klSAhPll1WhqJWV8S7UEtQwffknl+qtFDYw2ZlNSIzBASyT0Ifl933504
 z/lamoS3u6lQvBmPAMhW6CFzpEWkOoyrYeE4SO+LDoJ3FeCgmCLVkIttxOOWqxTrJ1B7
 NN7V9kMeJQBpEl1ponzkOoJUcdP0xggVeoN+Mayxg5bPzBbevnidyzKtD400xTlxoaSW
 irDJR8wfZ6qkzsvAo8v69PazULTVbVF9EfWhQIkRWmZjzKTWJyc+aUYBwMXUcEWGgKs6
 NfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706162147; x=1706766947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LTjUodNM1cz/FwQ+agsvuxdNwnKZ6thXnjAI9kk5o1E=;
 b=KXlOyZ0RGlmYhn8aA/iZyir8R16RoOiDAw2LfXkZ3hr76BC2U3TqMyJhpargcn926V
 vAEcHEAwGxp9zmOVaY1qTXrKPya4wL5EG4wzs7hhSWbzv/lnLWigB0sqZKQD6g443RWf
 R6YDwp/Q8I9Yfg762o0QwZtH5HC9iLo/f/wGgsWMxNz5XvQd4LU5/tPYVdhQxmx62uU5
 tXB+rjZ12lhe2rk14MIb0RFxgwrxV9Z4vpB0Y3e5YesokC7h5Xcb61teX330783nJRub
 sOWl1j3MoGF87cm/H7wj4dcHiy7ppYj4xb5IxEpxXFHrXkCGxraMrZ2Mtb6gx9NzraLB
 ITwQ==
X-Gm-Message-State: AOJu0Yzb7aA6DAdk3RX/w+q4sBU6Ur0dOJu5C/UIx3IlEWOx84uscnQV
 LHi26Kro8tBVTwX3cqnp9hnNtnrhEg9d+PetRu5JNx9H0hCUo4lHTs9c103APok=
X-Received: by 2002:a05:600c:54d0:b0:40e:6639:6708 with SMTP id
 iw16-20020a05600c54d000b0040e66396708mr16641wmb.49.1706162147617; 
 Wed, 24 Jan 2024 21:55:47 -0800 (PST)
Received: from m1x-phil.lan (lec62-h02-176-184-19-125.dsl.sta.abo.bbox.fr.
 [176.184.19.125]) by smtp.gmail.com with ESMTPSA id
 d10-20020a05600c3aca00b0040e88fbe051sm1222406wms.48.2024.01.24.21.55.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Jan 2024 21:55:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/5] hw/arm/aspeed: Check for CPU types in
 machine_run_board_init()
Date: Thu, 25 Jan 2024 06:55:39 +0100
Message-ID: <20240125055544.79405-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: fBUsOeyc7Uwn

Series fully reviewed.

Since v2:
- Addressed Gavin & Richard review comments.
- Collected R-b tags

Since v1:
- Follow suggestions from Cédric from [*]

[*] https://lore.kernel.org/qemu-devel/e13c655b-7904-4e47-a673-4efd13c26b3d@kaod.org/

Based-on: <20240123222508.13826-1-philmd@linaro.org>

Philippe Mathieu-Daudé (5):
  hw/arm/aspeed: Remove dead code
  hw/arm/aspeed: Set default CPU count using aspeed_soc_num_cpus()
  hw/arm/aspeed: Init CPU defaults in a common helper
  hw/arm/aspeed: Introduce aspeed_soc_cpu_type() helper
  hw/arm/aspeed: Check for CPU types in machine_run_board_init()

 include/hw/arm/aspeed_soc.h |  4 ++-
 hw/arm/aspeed.c             | 70 +++++++++++++++----------------------
 hw/arm/aspeed_ast10x0.c     |  8 +++--
 hw/arm/aspeed_ast2400.c     | 15 ++++++--
 hw/arm/aspeed_ast2600.c     |  9 +++--
 hw/arm/aspeed_soc_common.c  |  8 +++++
 6 files changed, 65 insertions(+), 49 deletions(-)

-- 
2.41.0

