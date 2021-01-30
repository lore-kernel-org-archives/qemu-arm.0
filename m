Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1620792lfo;
        Fri, 29 Jan 2021 17:56:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfEnAPyiGfMd9QAp2okZjxXQRWIHcprmu3M7GglrNa3xx1cxr3XPGBYiZjeXBDxZOq3+hm
X-Received: by 2002:a25:b74c:: with SMTP id e12mr392009ybm.20.1611971819096;
        Fri, 29 Jan 2021 17:56:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971819; cv=none;
        d=google.com; s=arc-20160816;
        b=zRMsJzwuDSs0uHrMSUsyWRIS/uwVMR0MTadcI/ogIAAdHSohKTPr7ZZ4CMoq4qmDdJ
         7TCwh255iio7gOIKhXCNPt0H1K0snlGeQSac4LhJ3OF2Pc7AtcCHDcHEGw6mxSyLgVxu
         dsTnst9GLMmY76+aV75gHhtpjWUGYhpAC/VU6TwqjW16MXT+nJI5LhUVW0bRsp+TyhXa
         Ybe2pScANFfJOdVnsIAMMQu5sVyxD1rM8E1rbkczP3em3HDYA/v6hsy3Cnk+raBfSE5u
         LjBBS9JpoIPks63pNlEDs62/5jWwhurnPZ7KwzQ8F5wRCcvh3JbNugpl68WthCTlPMYq
         Q05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0V4s5H5BNAAAhx8ZOQKz6ZBT7eCkPLs40vaKE8q9iFo=;
        b=gm+NU2sd7z9+n87eC5Xxm3e5EuM/7sxIU7pRVbttPARZCLPCsZV4vjg4x8CO6mRPQO
         us1NrbtQFvO86HzOcsFFaLu82PEEdGdOS4A3lXPDRWqDZ2SK3ZTUereReby/gNFOiKam
         DN/vZ0SfrG+/c1sWNSmDXQoKk+eNXheDQ4592UcMINppP00W0MgVIdd99cM9LBvL45vr
         tmR7v59766FW0Bw6Iyhh6co4SxvtN+y9pNV/kjWw4atciIrLLk3CWohInPf89R0hzfuS
         kEeW0akfLMQh7UQpfiV7tuv5HBtfPOTMQQz0E362ljxk8FpRsKhYXZPF5lT0/qsSbJLF
         9jtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=APEse49A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si10471803ybd.399.2021.01.29.17.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 17:56:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=APEse49A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5fVS-0003Wj-Hi
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 20:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fU8-0002oK-Oy; Fri, 29 Jan 2021 20:55:41 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fU6-0000uG-RH; Fri, 29 Jan 2021 20:55:36 -0500
Received: by mail-wr1-x42d.google.com with SMTP id z6so10572199wrq.10;
 Fri, 29 Jan 2021 17:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0V4s5H5BNAAAhx8ZOQKz6ZBT7eCkPLs40vaKE8q9iFo=;
 b=APEse49A8zK0chpt6sp8oLYngL46dVofgjHcagLSV/788H7B+zhuhPJcbysfMy4nz9
 7yFpIwdiozY3UH6COinIyhLWTpcQyuvzJ8wPie3wcmipNmy++QCvOGM8jy5ppfP0aVCh
 LXXOhE/eLhSK4PTnH1NziZ68dYjW9lPQtKcU9NtJQ+EKFa6KW/O9W9jB8H4FiOSAvQ9A
 MmcVFLZIzI+mT2wQRMiUov1wW/WyonwMGHJigitn3RAud4MkwCZ9qSeIVBY8ER9rU+TS
 QusOVR6pjG/Vvm74qn6i7z0nQDSZ6PvpSOJdCntz2V1WfFLlb6zT3piprJ2a4ApNa6aI
 aw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0V4s5H5BNAAAhx8ZOQKz6ZBT7eCkPLs40vaKE8q9iFo=;
 b=PHpyYllOfj5ee7s2vs1qMKkGcwhWJnTPdW65ZfehZYoGmmDhuBxojqWlnhRbP8nfRM
 6/mEhNNDK7Ew6e9IYwLm5M/c5/fDMSyus92udXjW3SWWeGA2js5oPfekDBXbedakj2e8
 E/3wiU79X+a0RWFVX/2lnoEiLlnpVHYzvuR+8UMbrJT3LX1z0hkuJipZHBveX7hf2MWM
 kIh4qW4ipUFF0nsX1vKoYQLFInVWlbESJC8Uz2UFAF4MYb1Gh3yxoYWA02v03SSbrSj3
 TkbxRLmhVztGXHodOVv5sBMZHWoRF5ZhL8T5RrlpT3xD/yGwh8hvRUfx2Ok1omo/7YpJ
 mo5A==
X-Gm-Message-State: AOAM532po/96k/zmTQ/lcEGyEkwjMSpT6KdbshfU6WtpWDIm4GfBrRt3
 Ct3PRbSYvS/h/pW0qa7CEO0YMrkguOs=
X-Received: by 2002:a5d:60c2:: with SMTP id x2mr7649542wrt.248.1611971732203; 
 Fri, 29 Jan 2021 17:55:32 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s23sm11913258wmc.35.2021.01.29.17.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:55:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/arm/Kconfig: Add missing dependency EXYNOS4210 ->
 OR_IRQ
Date: Sat, 30 Jan 2021 02:55:18 +0100
Message-Id: <20210130015519.4072469-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015519.4072469-1-f4bug@amsat.org>
References: <20210130015519.4072469-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c9C8lnJJl4/X

The Exynos4210 SoC uses an OR gate on the PL330 IRQ lines.

Fixes: dab15fbe2ab ("hw/arm/exynos4210: Fix DMA initialization")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a320a124855..223016bb4e8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -52,6 +52,7 @@ config EXYNOS4
     select PTIMER
     select SDHCI
     select USB_EHCI_SYSBUS
+    select OR_IRQ
 
 config HIGHBANK
     bool
-- 
2.26.2

