Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4078727lfg;
        Mon, 1 Mar 2021 17:48:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqVFVhgEKzdNmfkuEq0oUJgiZqVhSm1lH2dwPQejzEQ1d/OPJPT/vI+BH6d6qfsaXUem7v
X-Received: by 2002:a5e:9612:: with SMTP id a18mr16257400ioq.13.1614649689257;
        Mon, 01 Mar 2021 17:48:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614649689; cv=none;
        d=google.com; s=arc-20160816;
        b=YFtsAGj/1OlMcLywHFS+9A0quaMy6M71TFCXV0kOzOgg1BjSMNocQQbjkdDLaz3Xau
         twPyuwpRq5TwCfnMkXlp1kaQT5+aXGKv7Z/cl22EeZvPCevW1OuSVeApPbk325Qew3pp
         vr4av7JIn9A1WYIsNF/YQn6AlMaV1Hel2W/RHUzgDvZvmXm1LwY7y51dGk2oNjyeTO+9
         17qANsMgd38nJI4g5Ka0rfL2b399NA5KIxcwuL2FwfSjJYqefaLTrFGK/S5R9scvqslQ
         tPUliaRIXlOSgpueefHr0f/ugEZ75i2KWR7Qef9WRjsIiRAN/uC9ptBXLM10WRtJvOzs
         JdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=kpPFFjA24ZGThZS1GYY5Tvg8kQFh1t9IdgiwXayB5Vw=;
        b=owfR/2YmLxGDLQYzHJid7BCt3usbY/a7S95uxIm82qqokVqcZIKlAVPhD4xF84upez
         RR9iZ5J+vI4yW9B8J6vnpBN7nCK+bYMLhaSg4fsPu9GIocG20LZvqTf61F1FZl8iwWzG
         B8gWCn9E1sPo7ZiLQbU1TLcNmEGUoDKslBdcMg8/W6fCfIzyhL+qYahjuXyKNxt5nMo1
         NdayRHTyuiDXLMdXAHN1ByasaSlBQUyivUzE+98E2q3iXdbuFeLLs+Z3/LWcv207WjjF
         JsnYNsLQgIvVjLzL08qfC4AoH5GaAeTy4BI2/TcK8LjkXvihpB4Eee8a2RcA6cgAexxR
         dJhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=eILslYBr;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=iNq8nTS7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13si3236669iow.1.2021.03.01.17.48.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 17:48:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=eILslYBr;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=iNq8nTS7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGu8u-0005HB-Fd
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 20:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4i-0002Br-RT; Mon, 01 Mar 2021 20:43:48 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:32909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4X-00021h-0m; Mon, 01 Mar 2021 20:43:48 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 27CE55C00C6;
 Mon,  1 Mar 2021 20:43:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 01 Mar 2021 20:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 kpPFFjA24ZGThZS1GYY5Tvg8kQFh1t9IdgiwXayB5Vw=; b=eILslYBrMcjxjVhx
 AavR0EWix2lDWYbdEpXCg5ji2HhQGNTf9sBzwOJZSHnzgex79FgovP6b6m8Hr/6f
 1Z8QtQkXvxuLkWCruPCl3nS/Bf2ptW5sl1qNujcEexG/ymzQGscCVyfrHUuIbtLE
 QOhUS8JXKEicDIBUzD+vjmEcq6+qm2FiCbFNUDoM7rI9G2KjhzrhI0LUI5SlD2Y/
 IgVtfZaTAigiELHwkiB5rsPbGkdaQugozw3MIFj2sAvzrLlt63yzuAv1sJb0Ionm
 NM5tes/CJI/UR7ZWPAzdd2z9lr9d0Aqa0UWvzU/m7QUV6oFk1tP8unE9vgqDhxA9
 pglt1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=kpPFFjA24ZGThZS1GYY5Tvg8kQFh1t9IdgiwXayB5
 Vw=; b=iNq8nTS7uHcnd8gAP4QzorXgUeNboGnx4AQ3eaGLkrWqNtwK/RCB8IHc6
 WT8IgLVtb3ZxDPW5PvIYH7ApyXltgOa9ghiHE+LGerOWw2CopVOe395mPY65yTcI
 XLsEg2uvk4iJqri8L/IZm1uPPlviwfQrEn5vjRjBsqm8FH7GBgn0zMX4KDX749jr
 I2uQf5NT1oCjYIM92WJfcgQsXDiiLBTpXzJPxVZHBWvhvYR7YL+3/yG8qTaTe3fB
 CfisQ5I5ZIL0vcJK7ePQHd4mdGZ4a7X+YsU8z/xsqY8uOVfMKsFZeGeIJ8hr2oQI
 vfeOM3RjpG8vd2oKD/vS6f4MF82xQ==
X-ME-Sender: <xms:RZg9YHnCrNOw-Jb5gQCL2Fxd0GfbeqY6dnnb10bfKduxwrletFTzbQ>
 <xme:RZg9YK2fydQg-llfrElFpPWDFR_EA7vsRzazZcelhvh2IMyHKdYcymZ8AmMJ_kFB5
 c1pRYeJ0h3b6zLK1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleelgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesthekre
 dtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnheptefhvdethedtgffgvefftedvkeelvd
 fhvddtjeeukeevvdekjefgtdeifeelgfegnecukfhppedugedrvddrledurdefjeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:RZg9YNrCKvAh8s0SQHMxNW5MuBzIKEQ9ef8V8OZPh7H5bmuUVIGDgw>
 <xmx:RZg9YPk-IJ8ZsBP_7KFApRchvgh8FXhteiMGkiTK1rUipNxtvWhb-g>
 <xmx:RZg9YF1KHvGrH3dzpUVwAArxkPy-iiFmPpUT8IsZ-STzZ2klql2-vA>
 <xmx:RZg9YN_OZeA-D7ysvnh7J2u2uygAyf0YPMbp3nTzmLT2GeX4CW4lmA>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id EEF8D240065;
 Mon,  1 Mar 2021 20:43:29 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 1/5] hw/arm: ast2600: Force a multiple of 32 of IRQs for
 the GIC
Date: Tue,  2 Mar 2021 12:13:13 +1030
Message-Id: <20210302014317.915120-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302014317.915120-1-andrew@aj.id.au>
References: <20210302014317.915120-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=andrew@aj.id.au;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fDSl9rziyVhQ

This appears to be a requirement of the GIC model. The AST2600 allocates
197 GIC IRQs, which we will adjust shortly.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bf31ca351feb..bc0eeb058b24 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -65,7 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
 
 #define ASPEED_A7MPCORE_ADDR 0x40460000
 
-#define ASPEED_SOC_AST2600_MAX_IRQ 128
+#define AST2600_MAX_IRQ 128
 
 /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
 static const int aspeed_soc_ast2600_irqmap[] = {
@@ -267,7 +267,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     object_property_set_int(OBJECT(&s->a7mpcore), "num-cpu", sc->num_cpus,
                             &error_abort);
     object_property_set_int(OBJECT(&s->a7mpcore), "num-irq",
-                            ASPEED_SOC_AST2600_MAX_IRQ + GIC_INTERNAL,
+                            ROUND_UP(AST2600_MAX_IRQ + GIC_INTERNAL, 32),
                             &error_abort);
 
     sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
-- 
2.27.0

