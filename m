Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2620972lfg;
        Mon, 1 Aug 2022 09:35:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sxCMJfRl1+zfTyZRDpBj6L79rKPKZIW6ls+KUQDY5FfAsNJ+KIzWnN4QVZvkfDtBLMejXE
X-Received: by 2002:a05:622a:4d0:b0:31f:41d7:7ef6 with SMTP id q16-20020a05622a04d000b0031f41d77ef6mr15294379qtx.331.1659371718993;
        Mon, 01 Aug 2022 09:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659371718; cv=none;
        d=google.com; s=arc-20160816;
        b=GqI9lm0ohb46EgJiBoYm0wE335Z3yBDqtp7XkEgVnVTRaByj/3sx0gR41UTggFp2A6
         VnsiQyZXjfnXEejglI/TxaTE6JshuwiuPpHU98WfYobZ6Q5jdwddMfNyeuw22rKjKYu7
         /ShJtrkbJUKOuiHSz1bk76XXJPKg8yODry/gu4Nke/6OzOves07eYt6OrkQjZUWgk7lH
         3A1IyIld6931kxWADQijp8d9Jz3eH22E5hDy3ayuqk3WbQgPN5CykoW0LsVuy1Jk1CPb
         k5c63o/PMh0yxGUGJIauPWXO/aw5d9JD6Zd4OHNHZv9H0FnVtFJ2+xyldBjoRfLoWiMh
         Ktgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=LxJpB+WX07OxNIMmDEdWdoPS4rctCSpwGImUZmKyBpQ=;
        b=EMszeST2KnezwJ0rV/YbG5Vt+5x3nu9M+96VIa+zh9333Adg7Bo3Ej5lqGnNwmPUh2
         zBt8aDIvkeIOgxznwB69k33FcKQFcQjbalzBn5jArfSnM6XCgX5/wYVeT/tPwbHr0nCt
         ApXLTqGz/Aqm0AUOZaH4FmoMRUcSFpPUU9+59T64adPp1jl+xpHXvtqM0O7w0jkLNhqp
         a7nvWDU5Sn7yr8d7Uns54JkkJcyKzHwIeXOOmo8UO5hDcSUAzZ+lvTCrQk4/5puwN0LB
         i2ZYnjOe+ZHicEzLSymK6nxSGGvpb5d9O3AQedqdyZ/ExIEznhfsc9mDzcReiPUmuSkc
         XL5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020ad45c6f000000b0047059799e9bsi7817687qvh.70.2022.08.01.09.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Aug 2022 09:35:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oIYNy-0000DG-F4
	for alex.bennee@linaro.org; Mon, 01 Aug 2022 12:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIYJ6-0004cn-5P; Mon, 01 Aug 2022 12:30:16 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:49711
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIYJ4-0006tG-2C; Mon, 01 Aug 2022 12:30:15 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LxNrb6sSDz4x1S;
 Tue,  2 Aug 2022 02:30:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxNrY42JZz4x1N;
 Tue,  2 Aug 2022 02:30:05 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 1/2] aspeed: Remove unused fields from AspeedMachineState
Date: Mon,  1 Aug 2022 18:29:47 +0200
Message-Id: <20220801162948.1920497-2-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801162948.1920497-1-clg@kaod.org>
References: <20220801162948.1920497-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=LBbo=YF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oOpfkBwxYiPw

Fixes: 346160cbf2af ("aspeed: Set the dram container at the SoC level")
Message-Id: <20220727102714.803041-2-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 4193a3d23d1d..b3bbe06f8fa4 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -38,8 +38,6 @@ struct AspeedMachineState {
     /* Public */
 
     AspeedSoCState soc;
-    MemoryRegion ram_container;
-    MemoryRegion max_ram;
     bool mmio_exec;
     char *fmc_model;
     char *spi_model;
-- 
2.37.1

