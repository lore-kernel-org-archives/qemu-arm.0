Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp796599ejo;
        Fri, 5 Jan 2024 07:52:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE58ma4Wt/BfR31/nJgfY8Z5a9p3Dt13GckYlirveRbwt/gQYHUNjcoTzD2HY/b8Bd+Clxn
X-Received: by 2002:a05:6870:aa99:b0:204:5a14:c4c0 with SMTP id gr25-20020a056870aa9900b002045a14c4c0mr2408945oab.97.1704469975175;
        Fri, 05 Jan 2024 07:52:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469975; cv=none;
        d=google.com; s=arc-20160816;
        b=X87Gn8fn1n5TKbPqcUp3rtiOeEW8x5x+Eb9jkaJGPyM5DacBeSKcZeF5OcDill7cKf
         ksE3o5DiT+kBZjxq9km1+AmGwmvgQiMQ7+saxsgS3dk06wTRy3G3Ss4K5Wm2vGS8kUce
         wm/3IvDJy8oVJ2gJyxhovtITaiOs4yGnyVkVxdAYecGe1Zf5dT8DHOyuX9woHpZ2Ctp3
         4HWDxnEY6odxrEd4VKRminPZ2D/K2izahe09bdM4fIz04iFpctvyGZ6G0H6u4Jq50NRN
         QuYVtp948cPfdBLu9I9+/QIWrYafOo9sRAwOO7J9/LIFE1CsV3uss2W3zgW1JYGKSAMe
         FolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QIi494ZIPpClTlGLpiqU0qCpof/tLsTarUcBXXHQbq8=;
        fh=cQ2FfVt2/IZC0ZMISg8I4sbY1PJjpClPDf1skqRY4EQ=;
        b=aWn/iEa+TUGFTGxCGgRPUkwaB59ckXWyl9hmWEFCtpEvec6OUNC4lcSFageiWXTVmn
         BkqF1gOCY9Ktz8ER7bajJocyefTs+seqrRToghaK4Fq5n0MuKLsPlE+X1e6ZghHisjnb
         S0NhV/yJtsFtVQ9qFiHPv+dgkCdh27fCg4ikVpjdxWZkOg8nhLUxJ/nSWyQR4/Q5fM3p
         Fma+fVKVWdIMBANMPP0hJXKgkOb5kGTHQPmMgSJDDgwMiHYCFJYBFIlFR7NqL9no7eN9
         zxrMV/aLgMqFpdMc/nmGl2SwMRGgjf1JgzRjNh+rh3uO9hK8IncKFKq5e/FD5gvJnOQH
         NnNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vF/Df9YL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm16-20020a05620a199000b007819e1e4a49si2121371qkb.461.2024.01.05.07.52.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:52:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vF/Df9YL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmRB-0003If-Mz; Fri, 05 Jan 2024 10:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPw-0005pL-3M
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:47:28 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPu-00048I-5j
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:47:27 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e37524fafso8947815e9.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469645; x=1705074445; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QIi494ZIPpClTlGLpiqU0qCpof/tLsTarUcBXXHQbq8=;
 b=vF/Df9YLbCjANguPuSTnr5QfBzVSnVUxQLKWNRIi39PkE0VqwfoMXZwtY6i9ev2Y3G
 k1c044BErpcFaMnnVAmS27oU/FYDSUs/07xVVhlVDTcgiZRasF7PxTLhn0nhwQzRYJjF
 P9wnNG/gEJPshWBVVLfQpz3KqP4AQyeL1SUIkhYQ+igni1G5atHybX1NltpzRDGmE5kG
 tXsgdGji5hVH79JHmL9/7/qXTDl6d3Hhy8kVx3KxRmZ52OlbqNGD89B/rVuN3ZFeWJHj
 T2qVhc50YHGebsufMNlPCQzVCGLbFHERMejo+B43BAYGIjLgjXmRM0Oigxac2DKatPhX
 Y0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469645; x=1705074445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QIi494ZIPpClTlGLpiqU0qCpof/tLsTarUcBXXHQbq8=;
 b=VoD7Kf008VWHSt0jO42q65xSvRZStLw9ULmUoONdbM/klgQj0DCvmbWG0nqFvnaaCx
 3IfsYof3MbV1BC29IimSAAzT6IC2up7/LQ5UusbSJV1M3pSQEbOTvNC10cBFSHW5PmJ9
 941xNh1wbkQ8nzbVSPrFjbzvPS+VHZKVb1h7IZRo9R3hK5b2qURKHKtfShDIfi95L9WY
 WifyfkmEV4CJ7hRqbFnGl3sjHNzT/Qin2IV4e+ssxKCF7yZ4a96qLUObQlv23OzW1PZj
 epW73fmomte1UrgnACbwUbJ2zeSV6U2yY1Czd0uS8UNNtbyV9jOsX/aYjI4Mq3cUE4qU
 bA5A==
X-Gm-Message-State: AOJu0YzaeWxdoaKubyothdt47JYC0dctib1AtREwrs0TqV0yTyS65kE+
 47nNeW7cPz8D16zFy4o0J+QIwaj+bZ21xg==
X-Received: by 2002:a05:600c:4f02:b0:40b:5e21:ec3f with SMTP id
 l2-20020a05600c4f0200b0040b5e21ec3fmr1175525wmq.113.1704469644973; 
 Fri, 05 Jan 2024 07:47:24 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 iv20-20020a05600c549400b0040b3d8907fesm1928352wmb.29.2024.01.05.07.47.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 39/71] hw/arm/bcm2836: Use ARM_CPU 'mp-affinity' property
Date: Fri,  5 Jan 2024 16:42:32 +0100
Message-ID: <20240105154307.21385-40-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iGxg9J33MzSj

The 'mp-affinity' property is present since commit 15a21fe028
("target-arm: Add mp-affinity property for ARM CPU class").
Use it and remove a /* TODO */ comment. Since all ARM CPUs
have this property, use &error_abort, because this call can
not fail.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20231123143813.42632-4-philmd@linaro.org>
---
 hw/arm/bcm2836.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index a1bd1406e1..289c30e6b6 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -127,8 +127,8 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
 
     for (n = 0; n < BCM283X_NCPUS; n++) {
-        /* TODO: this should be converted to a property of ARM_CPU */
-        s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
+        object_property_set_int(OBJECT(&s->cpu[n].core), "mp-affinity",
+                                (bc->clusterid << 8) | n, &error_abort);
 
         /* set periphbase/CBAR value for CPU-local registers */
         object_property_set_int(OBJECT(&s->cpu[n].core), "reset-cbar",
-- 
2.41.0

