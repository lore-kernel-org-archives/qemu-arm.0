Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp388063lfq;
        Fri, 8 Apr 2022 07:19:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBiaHQL+JLbsOgHqy9nOFZDoWY5ceWsL5qy9NJUN2/ZlhdXvEq3VlUDApVwMzJl52kjw1N
X-Received: by 2002:a25:cf4c:0:b0:641:15d2:54a3 with SMTP id f73-20020a25cf4c000000b0064115d254a3mr787877ybg.626.1649427573645;
        Fri, 08 Apr 2022 07:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649427573; cv=none;
        d=google.com; s=arc-20160816;
        b=P9+4+EWjHsa3LQXefVSAudkr57J7SMSuTiYzyuozKrxM4xFNr9mtF9NMYy2YVNxkuU
         SfgNMBI/Eryt7fgKCVK4PHvtSRZCNQhVOAHZ65aK8nL2NXsFd1h6zW53D3IddYJBYYbf
         rO3sFihmJPbMbClrX08caDX1cEfluiFLwJheCOXr8LC9GxXanq50nNuu83WTg8IYvV+n
         wXu+1pafgxABjzmKOHkqD+4N5U8bor833oWY4OKQxIBTaU4/ibeOAAWHd051Eg6KS4/y
         CO7bPBF262cNcxJuD0H7paUqjMabkvUfjEX2jvzdR4diR+a9q+/nqU9xjj8ydKiTqBs/
         yDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vqFEef+PoO6P4+Yluk3sTBRVOWf6f49lZyd6Jx1qSYk=;
        b=vnMisfR6/jU5nySQXVpO8CUvJfVOJEwIfvGDn0Hk7UH2VqvL/QtJimF4+oRa2VS8b3
         M8mYMUJzDpnT+d/2Iw2F20BS0chqoE9k2YpjIn0PwMaEssrff8UP2gMdVhlO2QtkRNE2
         D/FqxgMv6LL/5x0q/AlSklYvFuH0HhTzSr+MPtd7hJdH4ucSc5j8hCKfk8kpRzIVB8+D
         n8YsGgqWZfVP3vGHntWYBE2GIX5Vn1whoaNkkDC5EWvI9ZMo3NIziMENKBbluOPniDh8
         hqMKVGxqqjjaTBiHmlrqZfEz22aLBH7aj14dxOKygoWxkpkL2Pehg/aD/9TAwFn2bxT9
         jN9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yjamuJc2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020a81d408000000b002e5da2c72aesi504722ywi.487.2022.04.08.07.19.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:19:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yjamuJc2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpSW-0005MO-W8
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP7-0006hb-5r
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP3-0002Dy-Ou
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:00 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f16-20020a7bcd10000000b0038e9ce3b2a9so1227476wmj.2
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vqFEef+PoO6P4+Yluk3sTBRVOWf6f49lZyd6Jx1qSYk=;
 b=yjamuJc2pqo6y6Mkj2KLfZViz+fuzfyhj7AYPuCSvrYaycqs1FeEAnHWT5jJpxI6F1
 uGiEiiOcnSGEpzmondjlIj0k+QtZIEm92d1sb2gxIXdU4lQa8PL4WnUnejTrTczIrgb2
 m7K7Y6kcBzsUtGJvm36dfH8zZmaljljLMWOD1fsVKRxGLx3tuwbHqus8UpPaaRveAKqy
 hi0gHNhk7WtZ5LviKdCjb5tnq5ylaclpodouEpsaIVTZkj3nAIFVvaiEQQVvM9iLpwnQ
 SxtxambsXGQeLXbUj3UNm6bYHjjF6Qz8eSCQz3CPSkIcZ8gh8y9oaf+KGEUAJntpCYFk
 ZzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqFEef+PoO6P4+Yluk3sTBRVOWf6f49lZyd6Jx1qSYk=;
 b=0lO/RK1igZUqd6KUcO64J4WVBmZqAXKsfhyk2O1dqICaV5or/F0DAYlFfm/Jr5BEML
 YKcAn/q9y/JHGPHIYUfnLdzSfPavTciwglGj6DmopZaYY38bicE/gHMT1O0/94z+jdWj
 p6+LLjbWAEf2jziCcO7Re9XjZm9F3DF5EDlYiGGOi6iDyn5NcFspUq4TVsIYooPYrrhA
 Q8ea8dMshW1cuKq9gwfiYnT7RiXePd2SFK4jbT390GQNN9mzb2QHImpWE68GZs9kF5KU
 6nCB40LLYuDxigHlQq8eF+DtnJr0CGZJXHWUlJ1o64FSwfBtYPFRWDkVbNAH0lJyRZwD
 cIGw==
X-Gm-Message-State: AOAM5309DWheH4BtCsjErU/LJMO+0hxTqlr3YMfp3Df2YAlyWwsY1Dzp
 pBJ/qRgG1OY6ynkKBS4TFxIICAIp476yYg==
X-Received: by 2002:a1c:4408:0:b0:38e:aa45:db99 with SMTP id
 r8-20020a1c4408000000b0038eaa45db99mr1615744wma.176.1649427355739; 
 Fri, 08 Apr 2022 07:15:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:15:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/41] hw/intc/arm_gicv3_its: Add missing blank line
Date: Fri,  8 Apr 2022 15:15:10 +0100
Message-Id: <20220408141550.1271295-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: CpGRtcWqB0Is

In commit b6f96009acc we split do_process_its_cmd() from
process_its_cmd(), but forgot the usual blank line between function
definitions.  Add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 87466732139..44914f25780 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -380,6 +380,7 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     }
     return CMD_CONTINUE;
 }
+
 static ItsCmdResult process_its_cmd(GICv3ITSState *s, const uint64_t *cmdpkt,
                                     ItsCmdType cmd)
 {
-- 
2.25.1

