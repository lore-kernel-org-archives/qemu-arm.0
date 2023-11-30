Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp264725ejb;
        Thu, 30 Nov 2023 06:26:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6zgbAL1aADscIjIoEcdKGAaTx9dthv2UvvBS4z2drxFTgjZ6wzK3HBG+dELGZWnqSTFCf
X-Received: by 2002:a05:622a:1aa8:b0:423:93ea:18f1 with SMTP id s40-20020a05622a1aa800b0042393ea18f1mr25897982qtc.66.1701354414607;
        Thu, 30 Nov 2023 06:26:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354414; cv=none;
        d=google.com; s=arc-20160816;
        b=X4ql+VYmbwNlv2T8ir8NFbCuxMVrzBbHG8DkKCRNB4h1ZFZ2a9J8R5VouNFQQ0DbAX
         wbGry1J/ZPMvS+vPt62o03qS2noO9TkKhd14UVkdI/Yc+czVyLiukfOXyHG2fnHt7029
         1B5La70maViyIH5SCQN17YJp4dUvnLUZuwwDOJcj1g9P/gd9+RQkti5kjbHBHJVTw40X
         5GgTXWo/zDupaKe21cpzIAA6pYQk0un76AZUzBXCJhLixq/Spzvd33sm74qVo+T3Xvhx
         eyZ3RL6V7BufTi6QOWs8pMn4anQwzGNBkRwoVa6mDL0bz1cxFhHZYA4XBMGpwwOOEuPK
         8z7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7kz+EmRH6e7FNOo9AaU5Yw2D2TcG2jscWc1DZXFhalI=;
        fh=DKQFoSm5rvXVk6AUqpSavFv+IR+qPwKdgcCOIx8jJm4=;
        b=md9Oziw2iiGQOljqxNtjaxnCiIdihTmFJWsMnjpi+XVNFr+0FhQZBIu6iZiVnnYyCi
         ALBXFKgtMI+QrGNsvH3ttTx3YTTqz1+v+MYvVR5wVEKjLcf7qfSsxvgBN94n644VCv2z
         fnrDCWxTX9kixka2U7siS5bDD4hqB8XqzqIyEOTJRG61HITezb8nYOuECzZSsAFQSalk
         uAVFB3lAoK12X+/XSOjjDGdwHotwWZ5Bid11O2EehOSXhSCQj6YwOY4W0EqiuUzrY7Ny
         v8nMEenNntFjTJJU08g41x3LxOmo54lNad8d9ygOwNR67Y3XmjJao/UIwfe/NNk+5No+
         eV7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d6fefebx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13-20020ac8498d000000b00423f8ce7977si1094189qtq.273.2023.11.30.06.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Nov 2023 06:26:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d6fefebx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8hz0-0006FA-AH; Thu, 30 Nov 2023 09:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hyr-0006CN-2n
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:25:31 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hyo-0008Jv-0K
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:25:27 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-54af2498e85so1089561a12.0
 for <qemu-arm@nongnu.org>; Thu, 30 Nov 2023 06:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701354322; x=1701959122; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7kz+EmRH6e7FNOo9AaU5Yw2D2TcG2jscWc1DZXFhalI=;
 b=d6fefebxDo+ZTD31jVQkPnRPg/PpAQ+TZfH06nIZ3NJec9jBJUInIXaGgCFOKHk7XH
 6aX9yTx47uTaUY/OTylc4/Ez1IIREu4polJNAeyE4g6ygfH+NhuO5Fpk38drIeN1QOnr
 p5Hi+lxM/kLeFykyoJLEZtflY4kJIn8u97G4FND+2DhNNmlNxDWNop4jn7lwj8ESRrDC
 QggquvYTIUsyR3CBxCSfuwNjsKMrukwOrTsrB2p7N9UpBcmseMVxadFiOO9MtwR5K9Rz
 unk8IXlQMoRueGpW9qfDX47SyHTW/9aTHXmqC3IMqwnB2jEXZCwkEe/01/UPydiaNcmU
 QNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701354322; x=1701959122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7kz+EmRH6e7FNOo9AaU5Yw2D2TcG2jscWc1DZXFhalI=;
 b=joZ3CVQqOU59hOefIlHUlDD4CK3/dq44r9uCAlQ1UYiU1pTwc5lxM9zr1SqZe4wDUG
 xCpHbIguMCnPm2ABRLUIv7RjVEuw4TTukL6aNXe//vD62QS5bi/Ade6M6BtfBF/qP6YJ
 xRz+qzwc+fidWZ6IQWF45Dvwn9KMfCVPaXSfkqktsNw5KDRR4ZAy0L+L6WZcu082Qfkq
 5wO8tG7ZK8WnL9vApaXPrjQ1mZywWOxeKzgQy+NoZJwXK81c73ojuZNc7kTWX4uAWfcZ
 c9pPGMlmDjp73kSW6N/IzuSdXrUAvDYQAoOIaFceDjm4OQiHPKMnXnyT0cEUPoxYStCz
 XgWw==
X-Gm-Message-State: AOJu0YyR0nybiQ8XEoPrEhl4TbJBGoO4xj/QfRzO/Pu0hJjgidWhmBzS
 NFQKX3IAOqV+FSjeRazzUUIfEA==
X-Received: by 2002:a17:906:18c:b0:a04:7cdb:ff97 with SMTP id
 12-20020a170906018c00b00a047cdbff97mr17479212ejb.0.1701354322313; 
 Thu, 30 Nov 2023 06:25:22 -0800 (PST)
Received: from m1x-phil.lan (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr.
 [176.184.17.116]) by smtp.gmail.com with ESMTPSA id
 hg1-20020a1709072cc100b00a1933a57960sm205200ejc.22.2023.11.30.06.25.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Nov 2023 06:25:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 0/3] target/arm/tcg: Few non-TCG cleanups
Date: Thu, 30 Nov 2023 15:25:16 +0100
Message-ID: <20231130142519.28417-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: PyPyCHdtgboS

Few non-TCG cleanups extracted from a bigger rework.

Philippe Mathieu-Daudé (3):
  target/arm: Restrict TCG specific helpers
  target/arm: Restrict DC CVAP & DC CVADP instructions to TCG accel
  target/arm/tcg: Including missing 'exec/exec-all.h' header

 target/arm/helper.c            | 60 +++-------------------------------
 target/arm/tcg/op_helper.c     | 55 +++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c |  1 +
 3 files changed, 61 insertions(+), 55 deletions(-)

-- 
2.41.0

