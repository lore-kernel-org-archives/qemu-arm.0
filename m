Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4466216lfc;
        Tue, 1 Sep 2020 03:46:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybey2AIJ95WSJWj46T13feNYYe/4KqW5G2H+MUgzRS+Xha8p/18x3RktY2LUtwtx//E4Wp
X-Received: by 2002:a25:b18c:: with SMTP id h12mr1751141ybj.315.1598957197942;
        Tue, 01 Sep 2020 03:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598957197; cv=none;
        d=google.com; s=arc-20160816;
        b=kkYLZnEa/s2nTz5y/PicBnA4RD0MAujq80/IqKl3NM/hKcy2f0gtNp6nn9tU3lcOZd
         YgIdDuPkhT+uAoHtu31WFWslQAVZr9gnn7a+kpw+eERHK0Adrf8W5MlT8tKAsUdYnLyl
         7aRdu+OHjpi6oalRqTJtZZtKcZ5MdgnuPbQE3W29vRY7J7fSjIsZHY4pE6GWhFvplkMo
         ArHIq4zT4OHJGhqK/xEiLt6HAdqQTpA+glHsv0rvF4EwwhdOrkIwmMKokyQJr41kjBj4
         XjTcUNZc1+D9C+0QBSHIuJVyWZ68Wi3JzKcEQaeu5uE00Cc3BI8HcCyHDT/ghBMnYDWN
         26yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EVwru8QefO28g6zuQPi1gYOba0DhzrEbVlsJ/k3IAUU=;
        b=lBZhkkFT9Cy5IvvYj8wtHrufDlfRZ1/dTnHnnRzvsZ9ElbYMarjQ/y/+GAkSVOmPCk
         9hSvVdF3fH4I/Q9Va7EwkwLCgExz7TDZUO8g4ObJ/qXDd5EZ64r79iXBw98DI/8NU0to
         qSYigUBqkhVLGAcmNa3HOeZAvpkQpTxYWHd40SJm/59SUHUz3DlTe4F8pfWkdCpIP1jp
         EeDHC4YgLOA0C3Tq3GCVB/biFQ4j2T7WMKLoB9R9y2YqQiQTIsv7/WsjyOclo1BCfh1e
         ySbcph2WD9fLMCekOHaN3x/R+X1q3tzjM9JbN9hKZdjHzhwHvcr48PZoOaPcIXgK1THR
         8lcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FDmPDV0A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si778938ybk.233.2020.09.01.03.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 03:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FDmPDV0A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD3oD-00068J-BR
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 06:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3kQ-0008IQ-IS; Tue, 01 Sep 2020 06:42:42 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD3kO-00024H-Rn; Tue, 01 Sep 2020 06:42:42 -0400
Received: by mail-wm1-x344.google.com with SMTP id a9so672555wmm.2;
 Tue, 01 Sep 2020 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EVwru8QefO28g6zuQPi1gYOba0DhzrEbVlsJ/k3IAUU=;
 b=FDmPDV0AiezhrXiEgWW1ImO/qAXvkwiFDwQJec+ITgfbJRe4Ta7BceBuxPENvTn2JC
 7WFoIkEUJfowqeaiVQde75uOmN58ByiSnm0uFHNtMnR6X4XILqbowy85isykuWTNLA21
 K2gW0wx5G+7yiStL2u7Dk63MWFCYKzUteuLqlAlmRPWVNuOLDxF8pL7sYTNgUoS9is2f
 KGWafk8poQAm0DjlEoIQsEQbyre5A4gHpBUB1B/j9r5obH3cY46eqhQTpZyMcLzyB1UI
 IvJ03Tax7mBHWeWs98OhiryK2eH5232ZeTM/n9ESCOGSaZdQN1aKTqP3lLZE7gBCZO3P
 2fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EVwru8QefO28g6zuQPi1gYOba0DhzrEbVlsJ/k3IAUU=;
 b=ah9kF/OxqJ8WRunNLg6H73gKnJmaRnHnzpTgWwSJzvxXkLJxL9VyDj0Moy+gAG+xz4
 O3/SrwulV1+lF63l481R+ELB/XU7F4fFzItV26BelcNpMo6TeodRoOi7WlahxC9L0Xua
 Ung0Li+zITBQfD+mGD4dDMy+8lXmSU8rfdRBQGB8JDL7v6zsKyD8QpuLj2x55NQJKfWT
 9fCDM5xV0ItSLHi+zuAsjofiPCkyboTQHMcHg8c9ElJZKXpmPrYbZ/E/CZkBVSosiFxv
 lhqzJYtviQZNci4e+4I8fK/WujfFVBPAdTd9hePro7D3Ujiq+hnoDHZUSNZtN+ArYu92
 pHVQ==
X-Gm-Message-State: AOAM532lpYdvhYol+9BAgkS0dSOX+9Oj22bkIIeTRpZbqU1Jc9kx0bhj
 wjT3NcxzNqLzF6eKs1MGRZKBsk6cSUM=
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr1114027wmi.135.1598956958026; 
 Tue, 01 Sep 2020 03:42:38 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id l8sm1693217wrx.22.2020.09.01.03.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 03:42:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/gpio/omap_gpio: Replace fprintf() by
 qemu_log_mask(GUEST_ERROR)
Date: Tue,  1 Sep 2020 12:42:33 +0200
Message-Id: <20200901104234.92159-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901104234.92159-1-f4bug@amsat.org>
References: <20200901104234.92159-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rRLye85kvSG0

Replace fprintf() by qemu_log_mask(LOG_GUEST_ERROR).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/gpio/omap_gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index f662c4cb958..e25084b40c9 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -392,8 +392,10 @@ static void omap2_gpio_module_write(void *opaque, hwaddr addr,
         break;
 
     case 0x10:	/* GPIO_SYSCONFIG */
-        if (((value >> 3) & 3) == 3)
-            fprintf(stderr, "%s: bad IDLEMODE value\n", __func__);
+        if (((value >> 3) & 3) == 3) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Illegal IDLEMODE value: 3\n", __func__);
+        }
         if (value & 2)
             omap2_gpio_module_reset(s);
         s->config[0] = value & 0x1d;
-- 
2.26.2

