Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1643702ejb;
        Fri, 3 Feb 2023 10:11:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8eZDCkNdFPXaoWNEy5mq9toyvK0faL5YxzZdnc1iXUugd1WJ6RDmF2e87gK1Yh7wVL/y8R
X-Received: by 2002:ac8:5781:0:b0:3b8:6db0:7564 with SMTP id v1-20020ac85781000000b003b86db07564mr20097061qta.44.1675447904278;
        Fri, 03 Feb 2023 10:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675447904; cv=none;
        d=google.com; s=arc-20160816;
        b=kVScPVjKzoTSSzDy3jFAFDnvdcYLqo/D+2ofHSkBbBHMBl9dHYXS0z5Bag4d7KCO9m
         dL4nKQ3djNHjxINNiyxpmbficVhwtPrmlD8caUhpPzweFGP/M8PGxoY0p13xvUmjz89d
         sbfLPuoDA1xuH/fLgHZ5DlGR7kg7mNin8ftptTP28EmijM6m72c4S8rNMBXiYbamChuo
         2wpCILzWrNXmA/qRxvpkaY/CQyxzFpvvGiejSppL0yld9IXO4jt0oYcf2WmLsNvYHGfl
         eg7Zgj0S0p1vn1BwGkTgFeBtmgS5A8mrL3P21SsEoDtfZ/kQAX5AT7qExp0sz9FeaQXW
         CDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g8ALrbnz1qXI5HffWq09XMPgoWQJ0GtQQ757vbcP15I=;
        b=RXjetu/e83M59FqXEoeYxfmgvkBOnIzIYr3vr+qrM5Wrhealz23wCIpqXWwXVGn9UT
         ytkgZuyy0hqRwP4CnrUm6eTIo/0j+h7ANjXTo8pJcrUGMFH8Y8yqT/h+dkY21riRGdRI
         YBY6lSGjP0EuZ4UslBSAX9coDWN37MdCw1JX0x17mK/FRYudbDVUkNbkkv1/q9R4hjFa
         aBOR8JcAedZ8wH5JSMfVhhV+qu5XsCqCdCpeABOOLIfzMtbiBs9DBzYEqCLbJ58Wtov2
         tBEbs/bEGBhJP+9UHVVCcroqIo+G4QujyyoSE9Vkf0lHj+WWwDNOnzcq08kCKcNEzILa
         IGDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HNjQLyre;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16-20020ac85750000000b003b857a77802si2294467qtx.674.2023.02.03.10.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 10:11:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HNjQLyre;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pO0WL-0002AW-Ac; Fri, 03 Feb 2023 13:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WJ-00023R-OY
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:10:43 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WH-0000gB-Eh
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:10:42 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so6575059wmb.4
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 10:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8ALrbnz1qXI5HffWq09XMPgoWQJ0GtQQ757vbcP15I=;
 b=HNjQLyreQEHxmL4W5YYy8YHCmF9c03nB90ylx3Gfz/8BOXXhldHAP1r5R++XmzSCNl
 rFWWJv66Vr/SdTWnMscDKkdJ9tbO1E57TdJ+AA7ZNi8Xeg07whxkgN7lx/oLZednUAt7
 4yytnpoGSzrqy6a5UBBVj3SDHzmUyWuEkvejlSFB0HZEjbng9Ba6MjHOOvylEHOOWSgA
 K/b0ntaL861gYFFNwWi8qz9uDJSPe3ibknBqJlsnN+tiCWEY59OKNCYfnu+RAI50FkZT
 oGBLQi8f0LH/L8re9+heWSbcjX1jF3Sc5cqmoBUEE56NOafMiGzr3LQ4q+EIEA4/67sR
 m5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g8ALrbnz1qXI5HffWq09XMPgoWQJ0GtQQ757vbcP15I=;
 b=bQwW89zBB2cZSi+QRCZNhEeAZ2mDxyZCTvOXu1d+Kq+0CfM6mittTVZjoXMDwtwDJY
 DdU0QtaLm7cP6tB+ndubXrgtiirfduj7R++TIlG0IpE54RW7RXVn+I6f51CGVAPFuvoK
 htLVDX1RTJoQECMwDU/apQCGpfwh+ZjUivJurXqD0dYoorbJnrr2EXq6dwv/eOuCZzGW
 e6sNLQtsiowlGwtD9f3zqn6j+lo9RC/gE+QkCy23+/ILY0nIxMrhFLVCGlozqhChUllt
 ZEYRftLsJrEjX+ZLpVh6cWGZDiUKGiPgHIxZMq6b85htpYoaRF6OSySKyvAOpZWRz/RR
 u4cA==
X-Gm-Message-State: AO0yUKUUe4bM3CtK08z/9oKClr/rBGFek8fkCl+mmRLLjxQbO/9HAOC1
 z06+IXXiiM2HMgalYm++kA067A==
X-Received: by 2002:a05:600c:1c0e:b0:3df:ee44:e45a with SMTP id
 j14-20020a05600c1c0e00b003dfee44e45amr1344963wms.15.1675447840235; 
 Fri, 03 Feb 2023 10:10:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0ac700b003d1d5a83b2esm8154958wmr.35.2023.02.03.10.10.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH 16/19] hw/nios2: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:11 +0100
Message-Id: <20230203180914.49112-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: wfHc8VGHD7Ov

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nios2/10m50_devboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 91383fb097..01f6d5c84c 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -102,7 +102,7 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
         MemoryRegion *dev_mr;
         qemu_irq cpu_irq;
 
-        object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_fatal);
+        qdev_prop_set_link(dev, "cpu", OBJECT(cpu));
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
         cpu_irq = qdev_get_gpio_in_named(DEVICE(cpu), "EIC", 0);
-- 
2.38.1

