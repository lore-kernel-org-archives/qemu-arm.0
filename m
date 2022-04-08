Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp386290lfq;
        Fri, 8 Apr 2022 07:16:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRqK/7UQAf/nu5cKnF4kjiImj33IAQLmfEmVHjEV2FKO/F9evdnVVHENH11AQu6vO0jQxx
X-Received: by 2002:a5b:982:0:b0:63e:7d7e:e2f2 with SMTP id c2-20020a5b0982000000b0063e7d7ee2f2mr3989245ybq.549.1649427398086;
        Fri, 08 Apr 2022 07:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649427398; cv=none;
        d=google.com; s=arc-20160816;
        b=d8NIG22FjSh2GeA68KcufRHCh/6rr0/SMmKsSzdA2SEW8GPC4SbmymgLjOuhUfOo1u
         2nFOZ5Zq3qeWS0wt7IRXpDpCeKfvzBydYCvv/lWw93RCapvVHIAEsSk49hS/GEX5KLt9
         akIlRMzywuDqm505atCrjUJHSN4J088HG4Lf71WNqdKXFFQ17U+UMfso1hgOdsN8g6zS
         e8/gmZ4nrz2KnNk9GHPVpLuv2dd9jmvHHczCbXYamoeLXDe1QM0FmJpj1nD2Swv/WynD
         9bfGzFgbVFfNVI07gKCtKZgWD1/vc5NP36nfj7eQWsrkESm349x09vcmY49fUO/PSY1v
         n8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aUGTtcuyRkJLND+YR/BochtoXe47TvFlIFGMevyBOhE=;
        b=DnpSB5m+oPBbtu9s8vTAOeozoscw4a8521bS2PZyec48kyHTiDgik7GMTMToKmI+sX
         k8FdTgZobWZNNECGs9zqf2QLxOuYxpq7bWFgV1FEwOXhoJyQIXhkkrsdDzfr8dTluZf6
         QD4EUb05A2xNC2OVOz7hjnxsvQDW/mostH0LQ0wMLG+CVZJr8RMkCmFOAi0XnAA793bD
         4EFVGzvEn4FgQfXAfxtFnKWu4GwqUFhtDQ+YuwQ49Rb05JLiZ5VvIYaaREspDmkmkLg/
         kiViQfSfYrEtUtTGEruuAujerjs8s11UP+rAaTB6Vksau2+J0mhLUKtkVZM0auMFYCb6
         jhHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=humxBtPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 185-20020a250dc2000000b006411916d480si249334ybn.476.2022.04.08.07.16.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:16:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=humxBtPO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpPh-0006k9-GI
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP8-0006hg-6h
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:04 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP4-0002EE-WA
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:01 -0400
Received: by mail-wr1-x429.google.com with SMTP id d3so13057871wrb.7
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUGTtcuyRkJLND+YR/BochtoXe47TvFlIFGMevyBOhE=;
 b=humxBtPOkxRfVI2XnjAympOGejUjQ2XBP83Bqf6fYQConEhVJZA+MaUZrB5j0pBJN8
 6iqQR0adle8w3e9EiOrevvunmyYrsdoU3Rh0SMZhxEcANW0yJNePGqOS9GLR/6QuIgIp
 LOUlczbjXu6+aE+6WsuAVhznfutBDwmDc2bhEEdemrle7oF2iq+o4NJzW+l1FC+NzpKe
 r0BUgasV0A3xbJ4KMzaFKpQYuOV0Ma40iwq5+sfiGm64sf5eknBDbO4kegGPYMN4QFL7
 MfVV8vnZ8BdDIdTqUXRc1TNy0kWE5Gh00ClLoLqMB72y5rpcQWiievo82T8mcVfpiRb5
 afaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUGTtcuyRkJLND+YR/BochtoXe47TvFlIFGMevyBOhE=;
 b=M/QOlAuea7h+OXuFdr9XLgGI7EL263KCV+NIizXP9evdNP26z/iwrS6LwHMZCopvY7
 kae3MD7QD2E+Iwo/b+Xsiolmj6/FQb5Z4cI6sxCu8U3aYBj30m9EB+aukbgrkitrXrEX
 UgakT4LqGgUnkpHGqLUmOd+JlG5Shw5NeUJYYz/IIPonlDc48IXKI75BMgKmMQTJBtHX
 q6lo9CbbfcEmFuln+6HisLpb9D9QpcifYVpL/IArSQ5aQuFdpch3GjF4K1BtVXYqBiaw
 58PxlkAMS7k5TJOjbLEbgMd/IAA7GfWsW0uffsqMlI7BE8sMJRxJISRnuok67ptIcz4U
 OHIw==
X-Gm-Message-State: AOAM532vtT8TWdfaMoRPvsFElMZ8FEr5bgPXg6Cl49FjdnsovtzW9edh
 gHSvitMcajaGLlMu2C+WLEzKFiyDAklEWg==
X-Received: by 2002:adf:eb07:0:b0:207:8534:2ef6 with SMTP id
 s7-20020adfeb07000000b0020785342ef6mr7114524wrn.62.1649427356616; 
 Fri, 08 Apr 2022 07:15:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:15:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/41] hw/intc/arm_gicv3: Sanity-check num-cpu property
Date: Fri,  8 Apr 2022 15:15:11 +0100
Message-Id: <20220408141550.1271295-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nSMzs1+aqHxU

In the GICv3 code we implicitly rely on there being at least one CPU
and thus at least one redistributor and CPU interface.  Sanity-check
that the property the board code sets is not zero.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Doing this would be a board code error, but we might as well
get a clean diagnostic for it and not have to think about
num_cpu == 0 as a special case later.
---
 hw/intc/arm_gicv3_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 4ca5ae9bc56..90204be25b6 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -328,6 +328,10 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
                    s->num_irq, GIC_INTERNAL);
         return;
     }
+    if (s->num_cpu == 0) {
+        error_setg(errp, "num-cpu must be at least 1");
+        return;
+    }
 
     /* ITLinesNumber is represented as (N / 32) - 1, so this is an
      * implementation imposed restriction, not an architectural one,
-- 
2.25.1

