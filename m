Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp299282lfu;
        Mon, 4 Apr 2022 09:02:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZrqku89S1YdhqACG4p2qLpshGGehEtNkOb/5DhhZOXqQPr1bM8a+SuMFdReitMF9lKXB2
X-Received: by 2002:a37:708:0:b0:5f1:7f74:fbe0 with SMTP id 8-20020a370708000000b005f17f74fbe0mr387925qkh.220.1649088170902;
        Mon, 04 Apr 2022 09:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649088170; cv=none;
        d=google.com; s=arc-20160816;
        b=v22B2mafEQMlm6XqVkOuchMsoGq/hOxMRYmCQ/bE4kqPRmmMDyic/XFFmlSHyJItNO
         2lUMkI64rIceCuoqXv1jOQx4LvQJ2lzGSbmzVwMrmjYZLCAsek5WCvhlX3qhqaISBlJV
         ucsWfRBk3jzpUilCSPakDMQZ4p4g7sMXPnfroxsHBzYtOkSJiVHdHB87pPqXsH/ZECB6
         Za0scUFjbkI9KKXF6XYBXp81o3gwM0GvMVa7Y4syvEnot14aeLUtAhnTcbLk+87Waisw
         UANIX7H4s2RCq+1GdOhE4MVAiYbXYDL1rTgrZ6etGSaiOj77OnJtfNrbSmZ55HDLZ+o1
         FR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OUNuH1OrmQHlLHSJWhZiFssMXN7AYK8/2scwMC66OkU=;
        b=tD46BdEhcwOOLD4XbfUB96WfrK1JavDQP93iCW4M/wWvitd4jcZQl9Fd1ajdjI+KnY
         jpTduJiez67CA1SSrm24Br81oWm6rNRrWEZgXu3ep4lYw16ocpaknLqb1yIIta1wLP08
         qIRuwvP4IkTJGenFrFM7degbbPlVW+frsHZIygZ96sd/bWUK01RlRpwyozTq/prnUdry
         e90q6IoWTvWDYg35Lo7b1e+zGJguvUlHZMFnTSZ18aRZzt4BcpEdTunp1wrgoEZjFBQO
         GwT0zjx/d48WSI+Dsp/kY0ttRvKpPnK8m4YTMpsX6pT8ZoYZccnbwA9J79SCJSeNmOA4
         D7eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cXaleMaH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs1-20020a056214226100b00443d3c19ddfsi1458855qvb.132.2022.04.04.09.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 09:02:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cXaleMaH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbPAI-0007pu-Bg
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 12:02:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvH-00050Z-Au
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:19 -0400
Received: from [2a00:1450:4864:20::42f] (port=38879
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvD-0000Vx-J0
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:18 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j12so7543914wrb.5
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OUNuH1OrmQHlLHSJWhZiFssMXN7AYK8/2scwMC66OkU=;
 b=cXaleMaH2gS3x7m/eq6A0mKB7wnGm8opjk008R8tXhDpbKO2E7pFy/IL/h3UNl4AIq
 U0iiFunAIF+pwnaF85l/2agd19JpsluGk21wB4md3cUS9dbsXpWwOd1hTn4bnqkQHMSv
 GeUwgQu1rg8mHHEAi48BcSLWSD4Sksarb8RK7Weq7NRgShXV6b6soKO2s3m5HpjvoTTl
 gdWbRHnwItN5sjfU1WFVqnCLJiQHjmvVlYOK/sXg4JmYGGqbKtAd4cKitgcfCh+XVovs
 qZ4ChAJ7jGzldGCjABmEoW0QnMWp1WxdQBGnAa4TLhhzluUmCXA7g6S8cs1Pge/zifIa
 xaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OUNuH1OrmQHlLHSJWhZiFssMXN7AYK8/2scwMC66OkU=;
 b=odwblxBdchvATpPunluldFmpY29c4rWvv8jfwb0muGpaDM8U1KS1ftWgAXYOLJM6v4
 iG3Og3W0Dgd0rWnMFxm7ej1c/ReKPdJsIl8+1UWf1wCoXvRv4vBNAsmEMifLijDmgRwd
 0Om8p/SIeqVU5SNQ1WiGtgcj3o1qxqXoWpZ+k91dIUw9HNEGDXqTnucKUsnWciDI/ESg
 b+SCswkrOJ/tnTTSHugXjusToovttMyMq2XRiBjpADiM0GagNHyzvEFryVf/FQVTKlIR
 dMIg/4i4DfJ0OfWh70bAIMupSLmsOjTcTKAjJWEdJIt/Td96EMfMIHPcV3WHY1o1Ad7h
 LzRw==
X-Gm-Message-State: AOAM530KCZcIMk+wzCqv58Ym8Blz6eQwGoT3W1Hm8pBkL41OnWMzJEuT
 l0tG/JkfAy+5If/HT01Rm0Elxw==
X-Received: by 2002:a05:6000:18a8:b0:203:eb58:9733 with SMTP id
 b8-20020a05600018a800b00203eb589733mr274798wri.151.1649087232910; 
 Mon, 04 Apr 2022 08:47:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 13/18] hw/arm/exynos4210: Fill in irq_table[] for
 internal-combiner-only IRQ lines
Date: Mon,  4 Apr 2022 16:46:53 +0100
Message-Id: <20220404154658.565020-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xeAsKrk83PzH

In exynos4210_init_board_irqs(), the loop that handles IRQ lines that
are in a range that applies to the internal combiner only creates a
splitter for those interrupts which go to both the internal combiner
and to the external GIC, but it does nothing at all for the
interrupts which don't go to the external GIC, leaving the
irq_table[] array element empty for those.  (This will result in
those interrupts simply being lost, not in a QEMU crash.)

I don't have a reliable datasheet for this SoC, but since we do wire
up one interrupt line in this category (the HDMI I2C device on
interrupt 16,1), this seems like it must be a bug in the existing
QEMU code.  Fill in the irq_table[] entries where we're not splitting
the IRQ to both the internal combiner and the external GIC with the
IRQ line of the internal combiner.  (That is, these IRQ lines go to
just one device, not multiple.)

This bug didn't have any visible guest effects because the only
implemented device that was affected was the HDMI I2C controller,
and we never connect any I2C devices to that bus.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/exynos4210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 919821833b5..a4527f819ef 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -310,6 +310,8 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
             qdev_connect_gpio_out(splitter, 0, is->int_combiner_irq[n]);
             qdev_connect_gpio_out(splitter, 1,
                                   qdev_get_gpio_in(extgicdev, irq_id - 32));
+        } else {
+            s->irq_table[n] = is->int_combiner_irq[n];
         }
     }
     /*
-- 
2.25.1

