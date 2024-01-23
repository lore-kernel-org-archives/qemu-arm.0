Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp617425ejc;
        Tue, 23 Jan 2024 14:50:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0px+XY9FZRl1X+q57fd5Oqgrxuex2Tap+igiKesL9TF9lqMcvK+jVu9bjXb7MOE0DpCTu
X-Received: by 2002:a05:620a:2888:b0:783:9e81:29a7 with SMTP id j8-20020a05620a288800b007839e8129a7mr528252qkp.57.1706050209393;
        Tue, 23 Jan 2024 14:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706050209; cv=none;
        d=google.com; s=arc-20160816;
        b=xWrBxIRNqZV+XqOxS6qTpJ0EetDLflDwFpSSmKdhFnjWgdagqjAkOxZNrrJFmJO2pY
         SGeREQnI3ROUxd9o8SC/GarrVxWLm+uOw6vyg+FN+zKA2/qKc93W1vyCZimysZjgWLeX
         8ourwAG4okswGi504mICv9m9ydk+rsVXxTJDmnE2gzsUaUpBE0rXZvMLZQ7RrURfYCp0
         tvAButtTsZDvmVEpqHX9nj5wePHmtMxqX3eqbO3l5sgKoKq886PU+CIZxKjCTVNAFdvb
         jjH+7MZ5JCZ04qJfHaD3BA5CsOxbSAFUPvlFlLfyp7dO3INpjpo+FKS+ez3iu/AG8PSe
         hNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ne9fETa/FFUb8yRzxwXxz52suSQeNnRaNemXs5i2sTM=;
        fh=syX9H1Z6jvTUZoUNlfCNxZiWCwEj552WMbtCUDPMiLw=;
        b=jNKRauYq2umShDYX4CuFqGwGT+/K3LB9WVER/05UVCZps5dwWYq/OG7IERilb2XaXk
         5Q7sGL3iMSba69e0TVk4JfjGTNaF154swae0qbkSfmBHQvYa9g10292OkV2Kdh4g2aEK
         aPbQrfqmlEqIJt77f6RYJZvA7PbModfrnuhGeowGjj2Y2sB2HOahOvziDbc7sEyd3ztN
         6eF5v32tBefviQ2i3+7kULn+G5NW481iHj8fdofLyzVzeuDJ4V/NMYruCHGWCxKMK8p3
         Ww4+engkjhqDmcE1wrk+DfY03YRPWu+CmSEHiBRXkQAOv8xOtJwsQMdry1rOtocRFsvs
         FXZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZRuyS8Qn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22-20020a05620a211600b007833c95c11csi8608747qkl.684.2024.01.23.14.50.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 14:50:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZRuyS8Qn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rSPZl-00070o-Lg; Tue, 23 Jan 2024 17:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPZh-000701-B9
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 17:48:58 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPZc-0004Gf-QJ
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 17:48:56 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3392291b21bso4159650f8f.1
 for <qemu-devel@nongnu.org>; Tue, 23 Jan 2024 14:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706050130; x=1706654930; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ne9fETa/FFUb8yRzxwXxz52suSQeNnRaNemXs5i2sTM=;
 b=ZRuyS8QntMWqxs9s7HxavN5d2ok6Fulqs2JUCVXbQypc/+ztBEyHIWPblsxiVnxM8P
 +k5ZkCPzqB4XgUzFqQQ01YJJXkvcwEueh9Lz0xOene4T7DSBZuDibeYeG8SWd+Kg2G5K
 sb9rkDZuXOcaCB3+0KKZrDCdSjRDspMWQm5IBWOHuLpKQE71EWWd0PxhCXmF8fAARpRD
 qJy1RETk+py0JJ2Kx1FVxdD0zR+4XRlaICI4+aTCXD35DVFwVeeGX/sk1CuAXtbZa/Ec
 s5qgyfDA+76CV9A/RFTulO0vqnz4DZYFYeDrCmv93JdEbL2jtu/BtelRsAVXsB+NEZvx
 Tp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706050130; x=1706654930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ne9fETa/FFUb8yRzxwXxz52suSQeNnRaNemXs5i2sTM=;
 b=UGQ0RLR+aOyF6LO4/rvG1aokAMWZWP6J7iNQOHFtltqPyRGo8pvrcrefsoQ045Bv2z
 xHWSpxPOvf/RCC+0/Qj2dBfur2yaWYwrGLJun/X6c/Ds/Ky2X/S6lqxklcNZAURCxNhy
 35DtfvUxBsuu6l7oe4Xty20HkbFpz/db8vsSjsFG/8E8lHF3nMQhZDf2sIRt2gMz/3vn
 D0y5rjhWnP1r30mbWJ5Y7ni2eEc7Znh4C8aMNPBXm6EQkoGSkWFbm6GrftGEHr14bw2K
 tOO6tPLOjPitcWGtRMa5b7zh3WgcrShtce7Q8ZIiP5RUDsTpIHHKPZxXSBeq3tF6Gyvb
 4yYQ==
X-Gm-Message-State: AOJu0Yx53vvo6uRAzSyLKXPH2GgF8drWATvHyG/iwdjSR5CGe+3k/yA4
 iF8rzmKK5QdIhcd0zyfy8ObGQGHai0Ai++zyAre3m/v+S3+9OESV3MW+1nv3PBmSPo2hmtyzp7g
 A
X-Received: by 2002:a05:6000:799:b0:339:3595:56a with SMTP id
 bu25-20020a056000079900b003393595056amr2564123wrb.26.1706050130455; 
 Tue, 23 Jan 2024 14:48:50 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d67d1000000b003392f229b60sm7627985wrw.40.2024.01.23.14.48.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jan 2024 14:48:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/5] hw/arm/aspeed: Remove dead code
Date: Tue, 23 Jan 2024 23:48:38 +0100
Message-ID: <20240123224842.18485-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123224842.18485-1-philmd@linaro.org>
References: <20240123224842.18485-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mkNLWxMyiKOA

Remove copy/paste typo from commit 6c323aba40 ("hw/arm/aspeed:
Adding new machine Tiogapass in QEMU").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cc59176563..4bc292ff84 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1301,7 +1301,6 @@ static void aspeed_machine_tiogapass_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size       = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
-        aspeed_soc_num_cpus(amc->soc_name);
 };
 
 static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
-- 
2.41.0

