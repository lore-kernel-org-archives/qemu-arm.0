Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp296442lfu;
        Mon, 4 Apr 2022 08:59:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY1mtNsqOKIXNUQUQ22/ogZm+SUfnUL1hHLg8wP+EsghOCMdDVM+hGPci2IyrFD/P9BQ79
X-Received: by 2002:a81:f41:0:b0:2eb:70ce:4179 with SMTP id 62-20020a810f41000000b002eb70ce4179mr581980ywp.187.1649087949759;
        Mon, 04 Apr 2022 08:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649087949; cv=none;
        d=google.com; s=arc-20160816;
        b=bNU0R77LTti7RhJ663KHz7VxWAaGxuN0W+TaajhSyamZWgWuQeU58pOiuLUp9pRlCL
         pAwOqHT/c7fkgA1hPFp/FEje/VUNuUhe1JdWq0pPe+hsIo9cQiV3P0BACaDn+FNIPr0t
         tFWtZSSeUEJORkwHVGiGqoEDC3hw7WNUXqg1mnLFL/b8SC/1EzE9ZZfkAYFGHKJ9jBEK
         blwLMv4W3sjBxjqONhkZIQUwx2hP/D1rlrlI4uyDVC134NeG/DJnQylaiFA1UNadpZUa
         hmNLpD2WcaQQHnYchp9QnKLkXgvoQ3hCJCNdzOSvZ+iiP65WI2lPJ5yUoplGGf9pM+/V
         NsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8IklllfqRFRKXmmlJE9sO7JEtD1ZesISoc7R62vlasM=;
        b=bvKvHA6XAI8IXnlrumKniA8qx1P0TtF5FDLAic3QGTJ64v+VsLY/AuPhCMqxD04Zw4
         MecDLODAdHZ885JeT5PBeTQxmqjMrEJCMD4UfwgIRCfBzz/Jyd3ZzZvx82nkCxe6WuzQ
         JhqmGnvQKy2jv6fZVO5bAfopKgEq6vy+93VvZTA3RHLQqpvoC6qUmKSiY/9tC0WgPo4I
         Old6B7kwxusI0yCFGMQqBiWNasyiD2ZZu6hB8ne6gTsFURYM/yX1Wpzd51VxaWb5IzXs
         UnEL4iL1sqYShnt9739oB+BpaRywxaa5rIqQLi1yROHPDM01NsR19VnnNHUb7WM7zrYv
         XalQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IChOTyjV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z31-20020a25ad9f000000b0063d4010a563si8410869ybi.293.2022.04.04.08.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 08:59:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IChOTyjV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbP6j-0001oX-5i
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 11:59:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvD-0004xU-Vk
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:16 -0400
Received: from [2a00:1450:4864:20::32a] (port=41726
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvB-0000V7-8V
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:15 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so5897251wme.0
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8IklllfqRFRKXmmlJE9sO7JEtD1ZesISoc7R62vlasM=;
 b=IChOTyjVlvZjhEIqIjhIc/CDGYDBJdF0HJd0BCHxAux9mjOBwRks2gV41/k4QQcJap
 NHgZqzzZZiEegGURi290CQHRrWybfZ06ND299xH9I/qto6T2aTtWaGifnPVfentGaeHG
 uiWUNbcOaUdC0IWcAy0KkHeTsIneZmJ8pb2WInvjZ4TDyfZcB00md34usiltStB55Dwc
 m/AVBirWArgFreNOM/Q3Kyhv0cA8FhgSNRp3tHRmiMDFk05/p0M/QM4nxcLlElANdwQl
 ZgM7yhdLhHaJGTQyPEFkpcguo5Osunyfgks+DucN90EArqiOuD5IML85krMux3zjkT+h
 2UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8IklllfqRFRKXmmlJE9sO7JEtD1ZesISoc7R62vlasM=;
 b=0vXUJuXLd9mFfQOYjOSa1sCs79/w7wRh3XiuRqLXkMdnosemugyR9/GnRUMD38ATvv
 AB+NwFyD8jYQ+27kUcnJvZyzojC4ogB65a0TffrRpqd/tZ1JHpZx7oFEqNI1zPu8DGLv
 VnLv2YcGZEpv1s6iWRcqEdmgEgxDVlsfhIb2W3nReczOkpCDiVBsdYQp02pEx/K8JsaH
 hwinVbVGqlLIle9cDyByGC7NVGYi1izqilxZaHl7IWh9twmEEFvBlrfsz5Jw0/vE9kiI
 /o76WVvWEr78OuBvJ8GD0bGX2lvfmCT8xOecOAIkEhT142aBU4Hledp4G+uOYKjWYD6J
 PLww==
X-Gm-Message-State: AOAM531NO2k2c4TfZJS7ubttrvO8lrX3V8ZF89qxEAYFA8FpIQ+VxMhZ
 /LnCAeytbLgBKam80YuNUZOs+Z/ZwT2pAA==
X-Received: by 2002:a7b:c30e:0:b0:37f:a63d:3d1f with SMTP id
 k14-20020a7bc30e000000b0037fa63d3d1fmr125298wmj.178.1649087231181; 
 Mon, 04 Apr 2022 08:47:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 11/18] hw/arm/exynos4210: Delete unused macro
 definitions
Date: Mon,  4 Apr 2022 16:46:51 +0100
Message-Id: <20220404154658.565020-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: xDrU3WB9DGNS

Delete a couple of #defines which are never used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index b564e3582bb..f0769a4045b 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -67,10 +67,6 @@
 #define EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ   \
     (EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ * 8)
 
-/* IRQs number for external and internal GIC */
-#define EXYNOS4210_EXT_GIC_NIRQ     (160-32)
-#define EXYNOS4210_INT_GIC_NIRQ     64
-
 #define EXYNOS4210_I2C_NUMBER               9
 
 #define EXYNOS4210_NUM_DMA      3
-- 
2.25.1

