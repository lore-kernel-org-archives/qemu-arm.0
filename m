Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1026109ejo;
        Tue, 12 Dec 2023 08:31:52 -0800 (PST)
X-Received: by 2002:a17:907:31c3:b0:a19:a1ba:da2d with SMTP id xf3-20020a17090731c300b00a19a1bada2dmr3987385ejb.84.1702398712486;
        Tue, 12 Dec 2023 08:31:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398712; cv=none;
        d=google.com; s=arc-20160816;
        b=RJjwOA2xODe0eK0rI9j1td53uuu80ztyQRwaTidWxRJvtM3TAdTne1zBLFHAlq3dsY
         yQ1UINOI21DxZwESWsI3YHiVVBD5dYcv3EH9YNzrvXix4Z3UWdr84N4M+u9ZNWHcf5kN
         6BfD8w6+NxM7uWt8MFziW+FYeee1P1SvdKUVHN/4EeWiDj3EWy1xZxPnBnEIRRm39y4a
         G5OkS8Jxhg9G1DZqM22tklWLB/9ArM3AOUr0ALEouk+ckqLl8egAB02i1IxuDU5lpzJ1
         p75VfQ/S97lfGOv1rJOTVN+mvfDTtj2B0x6sYyYWas+ldJzJ2IdWT49IVcBT2meDh/N4
         PQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XiepaygppBbcW3Zh+1TG9/b3hf0ew+z06xur2FyhJl8=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=QGsCTArtIlIVZ9HLED/clp6CEY7SWq/OO18bEdXm1tTDfUU+0IYljOJHhimi4vuOzY
         8B0nOG+EOJ0L5TsoFBpJDFoYzgRk+0FwK5jwbRgTTyV1lxGUa6wvKqckrNq6gKqrCJfN
         hQxHxfKiSFbv9Mc1L9vQyNKr5gLuBEsVINstBB7Oxjad9QTq2L9GqNfjmicxofBoVVwq
         aG1KywWGMXithRtwSr3SUjdZycxTeinLEPUhIEKsdd+W2bX9p9GjtbEwXJ0WTqTYRl62
         Skv1DhKpbCTUYcx43rsXG8Qx8TK+mqk5tUg2dp6lfiBmOZjlBXOuA1He+Y2EXWKL07bG
         U7IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ruQK3TbA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hx27-20020a170906847b00b00a1f6bfba46bsor2406374ejc.15.2023.12.12.08.31.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:31:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ruQK3TbA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398712; x=1703003512; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiepaygppBbcW3Zh+1TG9/b3hf0ew+z06xur2FyhJl8=;
        b=ruQK3TbAByxsBlxTm2WCHqg6zAzthxNPzV055ZltT6yEUAE3DSJ416ZCtbXa9vAJcM
         dowm5u+4UXsiUbo7tW/d5+dRk9+rBApdBhiG9KlUx9TrHKySWffP+83Tn/fiyd3+e+7E
         gjcnTcxtEo8B14kJcs4VtDhleslSE8qrxKgNYS+MWse+US8QosNErw7ymElBCOL4zdzP
         ldN9F5/ntZpLaj8mpXqKE5j+TIxbKM3gyNUyVDzDFA+POar4SfjbzZiSwPi1z67gVfoP
         Ng53SihuyAT5/lpP6A4hn1aZGbyHXYM1ymCR2twNT7PIfnts9/RQumjrJxrV8KJbAekE
         Ua6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398712; x=1703003512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiepaygppBbcW3Zh+1TG9/b3hf0ew+z06xur2FyhJl8=;
        b=COQXHrv8oJzbnJ0Yi8Q3OLJUv1fuIPbAiqcHJ7L/rMpuIJw5iFgZJ1ruMcD7RD/JDw
         g96R4hXERriUl+ztqvHrliUcmS8ayxuykzOjI5RdrATwnzlOx/cgGV92WBZT97mtdfht
         IsCZb6dGGcf+nAE6UJWUbp0srop5qsnprNLiElhdFQJ1UFnYqmkVVGl/MOK+S6EndNtm
         TrEj3XYwrrDtLXQbC6SsLUi4mR+Z06AS068wrtC7PfBYhNmUHr6aQsHMFkzIU9049Ry2
         dYED5OjcF5LVQvLrU9IjwT7U0elYcdGkaBl18S335rJUcFDES+Kz1cHRfvgQsU2xrBK/
         1rZQ==
X-Gm-Message-State: AOJu0Yz7Z+7SeOV5LT2vSgib2M/qJoIs/ETFHH4RkYFiP4cU61PNBJkk
	0Mte1adN8UZTxj/6NeixXukRrVWl
X-Google-Smtp-Source: AGHT+IEGJB1Kg+vrsX7qnSQDbyV5YTp8wo+VFKkjcLN/23vK5gDSX5GaOg4/fO3vujamRqj2ti7JGg==
X-Received: by 2002:a17:907:7b82:b0:a1a:f475:2ebf with SMTP id ne2-20020a1709077b8200b00a1af4752ebfmr4042581ejc.59.1702398712107;
        Tue, 12 Dec 2023 08:31:52 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id uv6-20020a170907cf4600b00a1e443bc037sm6569803ejc.147.2023.12.12.08.31.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:31:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/33] hw/cpu/arm: Replace A15MPPrivState by CortexMPPrivState
Date: Tue, 12 Dec 2023 17:29:18 +0100
Message-ID: <20231212162935.42910-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9eaXe+HRucGV

A15MPPrivState doesn't contain anything else but its parent,
CortexMPPrivState. Remove it in favor of the parent.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/aspeed_soc.h    | 2 +-
 include/hw/arm/fsl-imx6ul.h    | 2 +-
 include/hw/arm/fsl-imx7.h      | 2 +-
 include/hw/cpu/cortex_mpcore.h | 5 -----
 hw/cpu/a15mpcore.c             | 2 +-
 5 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e0663ab50d..2f51d78e22 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -108,7 +108,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Aspeed2400SoCState, ASPEED2400_SOC)
 struct Aspeed2600SoCState {
     AspeedSoCState parent;
 
-    A15MPPrivState a7mpcore;
+    CortexMPPrivState a7mpcore;
     ARMCPU cpu[ASPEED_CPUS_NUM]; /* XXX belong to a7mpcore */
 };
 
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 5ed22004d1..b37d544319 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -68,7 +68,7 @@ struct FslIMX6ULState {
 
     /*< public >*/
     ARMCPU             cpu;
-    A15MPPrivState     a7mpcore;
+    CortexMPPrivState  a7mpcore;
     IMXGPTState        gpt[FSL_IMX6UL_NUM_GPTS];
     IMXEPITState       epit[FSL_IMX6UL_NUM_EPITS];
     IMXGPIOState       gpio[FSL_IMX6UL_NUM_GPIOS];
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 87faee33c2..a6f3a96029 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -68,7 +68,7 @@ struct FslIMX7State {
 
     /*< public >*/
     ARMCPU             cpu[FSL_IMX7_NUM_CPUS];
-    A15MPPrivState     a7mpcore;
+    CortexMPPrivState  a7mpcore;
     IMXGPTState        gpt[FSL_IMX7_NUM_GPTS];
     IMXGPIOState       gpio[FSL_IMX7_NUM_GPIOS];
     IMX7CCMState       ccm;
diff --git a/include/hw/cpu/cortex_mpcore.h b/include/hw/cpu/cortex_mpcore.h
index 73627bc415..7822d5cbc4 100644
--- a/include/hw/cpu/cortex_mpcore.h
+++ b/include/hw/cpu/cortex_mpcore.h
@@ -117,10 +117,5 @@ struct A9MPPrivState {
 };
 
 #define TYPE_A15MPCORE_PRIV "a15mpcore_priv"
-OBJECT_DECLARE_SIMPLE_TYPE(A15MPPrivState, A15MPCORE_PRIV)
-
-struct A15MPPrivState {
-    CortexMPPrivState parent_obj;
-};
 
 #endif
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index ecd04b7af1..87b0786781 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -125,7 +125,7 @@ static const TypeInfo a15mp_types[] = {
     {
         .name           = TYPE_A15MPCORE_PRIV,
         .parent         = TYPE_CORTEX_MPCORE_PRIV,
-        .instance_size  = sizeof(A15MPPrivState),
+        .instance_size  = sizeof(CortexMPPrivState),
         .class_init     = a15mp_priv_class_init,
     },
 };
-- 
2.41.0
