Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp592273ejj;
        Thu, 23 Nov 2023 10:35:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFncezjVJsQ+Hi2ifT3FAmiFwdVabNHtEXYKth0OKn7kJnLphSYj8zf9pKa8Us3Y9BORczF
X-Received: by 2002:a05:622a:255:b0:423:7b45:6bed with SMTP id c21-20020a05622a025500b004237b456bedmr5879527qtx.5.1700764532974;
        Thu, 23 Nov 2023 10:35:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764532; cv=none;
        d=google.com; s=arc-20160816;
        b=MF68Drg71vkFoNH9Nn0ui6mXD3MG+G718riO27ZpaRfxNflt38HzynsBAwsVS5NeNa
         KMcJ2b5dQF2UKQz+6H21omgJ506UaZ/TpVCCPb3ctrL0zKFSsCbCILTCpyEB59Gdback
         kx3bvdmsoFYmLdJ0CxJnEb3DGgQ49HYf3/hvXQdmFYCz8ynhrD5OJTWUipiE0YGcg82+
         tdXYNKJJCDmSM9ITxY0EN5aJ2Ixd+smje8cesWcfzLp4QKhg6bey12sIkxtQt+LrW7X9
         AgiiDJAiYBznuyIrMxaq1fsDY7vLUd158qh0L2LgG0ljMHNP/m22EG3BYumcFTWNhje9
         x6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=EggnDxiS3lb3CDYKGlg1a7WOxUSv7txLuyeSgPzo5Gg=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=l68lQkv3Ssi7NmMAy/it0bL467kHUYK2kousonKDOayJC5E1xCev4QgRI2ZuUJtZnZ
         pFMUsb+I/ypCCIclcZ5NCzKlAYmfJryEck8+zg6V3HwELmuFXTw6BZooxyD6jUeeZ9X7
         A5RJWJvaOKY6xtxbSyQDj72dp/edaoYKP+5EQgKD8W59uONpRXEzxfrBpsMqufdT3LZr
         O9Spkf58kTOoIGRfcQortYiof8eCPu9avZa+72Sf+UHraNs2O7O69xFI/6Ox9RH41mBT
         Pl3NC201wvMhlENsAa1iMSwCtcwRJI2VmF65EwrzwNfm/h0XVaug4YUxw5pCPw64wAH8
         OgAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKtrpCam;
       spf=pass (google.com: domain of kvm+bounces-2370-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2370-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2370-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id bm32-20020a05620a19a000b0077d7c88c597si75914qkb.96.2023.11.23.10.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:35:32 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2370-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SKtrpCam;
       spf=pass (google.com: domain of kvm+bounces-2370-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2370-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B4D71C2109F
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AC24D102;
	Thu, 23 Nov 2023 18:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKtrpCam"
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4A1D6C
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:28 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4083f61312eso8901405e9.3
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764526; x=1701369326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EggnDxiS3lb3CDYKGlg1a7WOxUSv7txLuyeSgPzo5Gg=;
        b=SKtrpCamdd1fKC6FcsHrqFmRgsCYr3lryf0X9TlczoLckiUIShfSYx1GsY7BqTG03Y
         mNoyAHCIDQDaM/yZji0uFwpvj00/t6mAT70PCAI7jobE0zNSQ3/qfULqOHkgcoXMzSqJ
         czwBZ4kxEf8l4RkSHSfcV8P3cGwRD82tdlDzh9topuglmOkWGzxel38MesgSEtjOCpAE
         P5RmTPBRW/51dS5Dh4W/LWJGkxx8hXCMcIQ+x4vsmaSatSM9h6H//XB2HCYq/rTSjopk
         iDWBUOcpgSVtKmAtER0mfYlStA6id3Arb2MnpbYSu+ShGWyL5J20L9VBhrGw9mWdV+d+
         ivMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764526; x=1701369326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EggnDxiS3lb3CDYKGlg1a7WOxUSv7txLuyeSgPzo5Gg=;
        b=NxuxoJW65USN+DQSyF+nTnbP+KGlHPpTGfiIUdkSoqVd/9EfoUseow3PQM8R2I9ubq
         l1ARZiXLdfUJgwYCTruDuMCLkT54vtvw13Cl10JIAtt4dGHqqajo/kl2vJ/LIF4BVWvT
         SMTZgHIJHPxZQUo1MGOL+0fCjpWfdt+gw2Gk9gSCdbTPI6lHDZ9xE9RcHMXBWxN4yp3m
         +BysTV5aIZQlrg/QCEn4gH8xzLHvK1DdXHHKjuqwOTl8gWlsPvaPMWFjoOqu4S+NBS//
         Fqjw/UIVSsEeyg86uJov009zWQkAio47vVlolC4E4sGFdIYsL4SBsObeGDYnTDPf1QzZ
         QXVQ==
X-Gm-Message-State: AOJu0YzEDJmllSs+wRaa61s6jYi1fr0xlxFqAvWH26/C1eIQHePfyvcA
	lBh1Y/fCb6jthqMbexLwdPknQQ==
X-Received: by 2002:a7b:c8cc:0:b0:40b:346c:f3f5 with SMTP id f12-20020a7bc8cc000000b0040b346cf3f5mr345640wml.30.1700764526586;
        Thu, 23 Nov 2023 10:35:26 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600c451100b0040b379e8526sm2034152wmo.25.2023.11.23.10.35.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:35:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 01/16] hw/intc/arm_gicv3: Include missing 'qemu/error-report.h' header
Date: Thu, 23 Nov 2023 19:35:02 +0100
Message-ID: <20231123183518.64569-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123183518.64569-1-philmd@linaro.org>
References: <20231123183518.64569-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 17MY/GtetoVm

kvm_arm_its_reset_hold() calls warn_report(), itself declared
in "qemu/error-report.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/arm_gicv3_its_kvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index f7df602cff..3befc960db 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/error-report.h"
 #include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/runstate.h"
-- 
2.41.0

