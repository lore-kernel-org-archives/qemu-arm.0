Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1500119njf;
        Tue, 3 Sep 2024 09:09:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWw8zJvz4TUHbLVE9zMPBDxkJhbFpp5aNz1U/aD/jP4UWY1f8QH+BUYOIwh2aMPKAe318hwXH7wyNwsPg==@linaro.org
X-Google-Smtp-Source: AGHT+IHNkd2Ftaf8JN26D6yXhdJBgsZuk+cThDG6wqSjASYtIx1RZUNEy3wJ8jGMEh32aDc9Chyn
X-Received: by 2002:a05:6102:290c:b0:49a:4992:e1d6 with SMTP id ada2fe7eead31-49bad2398c4mr2817685137.4.1725379747176;
        Tue, 03 Sep 2024 09:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379747; cv=none;
        d=google.com; s=arc-20160816;
        b=JDzTOBPgGRIhGV5UVyPoyhpLLWjFPWS4MNxLoRdbY8463wMICIlRVXBKekIx5mxM7Y
         PIZFVv+dMdmYvVGxAvP4TbTdd2YYZawDHKJmANywKEKe8j/b8ABpAGCDoZthE0TvdTK6
         QxYCeJDXbFMBPfPPI1Bh0QuG5I6BCuWh+HEeB0yKy9HpBcU+IdN4MqQmT0o+3kHQMrQm
         FgRqjYvKAc8EoxSJZbIPn3lnwLpOGrFzIYD2LzzVTmzUkDpy0eHSqP0kTlKEE9nvgMpm
         9H0aK4CIKf4knt294/RLuKaqJTh8BJ7TsBTl5ovganslO/legnZd6wcV8mH4rJt59Ko0
         Rj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VPp1eQBabOpNy75PWXgECBrWizh2x9vXF9PCGd8LS30=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Niy/9NOrqNnKVre4O4gouqWKq01vkiTXQ/pfb70SuMpIu8l3MPfum+B70i8qsvVrBB
         LoC7aFgGf3JSX0tl7Y/q/t6Rh9OW2XIza5vVvoZ8FvFiXnFhO0fFd66kQ/UmEF32w20U
         FIaGHmNVJt1UVinkESWzk/RQ1KYf477WRnFbcF8/N0znx6NaNIHP7RNUITHIe3Zcr9GD
         qKSNP//ZJhpJ/9P7mLy0asj8wg6eSX6XoWxvm/dh+DiyITYzOqlg6t69n1rzor2VH67C
         /Ou56WhAUhovXcXhbsbKFsBmJ0b8IFa8+ACemuOVStyExBIZkdhGjy4l3fNDHWHktXzh
         QTFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdZLRsNh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49a5f419b11si2573719137.30.2024.09.03.09.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:09:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdZLRsNh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slW4q-0005yD-RF; Tue, 03 Sep 2024 12:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW4o-0005k5-Iu
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:08:18 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW4l-0002kN-6e
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:08:17 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42bfb50e4e6so29509315e9.2
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379693; x=1725984493; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VPp1eQBabOpNy75PWXgECBrWizh2x9vXF9PCGd8LS30=;
 b=gdZLRsNhgsF9F7lNMU3UhCScTfpbTyNUDk0UNEIYIKB2hS9+b6IyB7V5VkHOamANqk
 nR00mf+vLpfIUirZp54H1zPw0bTuj2DSoQo45xy+W/JWyb5s4eRzrm8F9e3vbgK2pkMS
 4Zfcx3Ak+IONzzNe2O5sGv2KZyGu5c6bcuv9Qs1OrGCLUprSN7kS0ARXLTWVMQikrYaM
 Z93shIfksv1YysXWlY1gNme4S6uR8jY/mGjcb5V6H09qTDWPicTveVKDbkvOA9irwDHH
 nI6RFpoo0ipmcVZOCfbNNrxHCHA22AdvqH6Z+3Uxb6JROD3CfJta5/pUkrAIk7nMZlCO
 nRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379693; x=1725984493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPp1eQBabOpNy75PWXgECBrWizh2x9vXF9PCGd8LS30=;
 b=KECrYW5ee1d3jRXoIdS7oseCoUMIIuBF9498egCE0Wpw04ngQSSp6vCRkhpn8WgFBN
 lMdctRChxl58VeDicOZzUR6966R8G36PYa1tJh3JRXxF0F+bETJRcNpBYYaCpu87v+Dj
 Kt0HP94JCTbDn8diIEKglOf0du5yJEyBLbSgKYyGgLQ4gCCylaF6CUwLcpMZZ6HSsEC6
 lHms1bdmbiADWICb/W4O+1S2mZQI9vh1zsqA7/ct5um87OwqmEl1Pi0x2A9ewZos1tqV
 25FF8iICmKD0teiq7lDV3q72shg3c6rLZy6QfftysfD5RJqcfzNCzw4dg5+z24ABxjPt
 iCTg==
X-Gm-Message-State: AOJu0Yy8cAlEcoAPyD6KULNYPGuJxN/Cs4n515by3J+AVOGlgXLMMr55
 kqpDH42ynwFCmSwmyxC/nNOe3QVDmL8KQf7zfKilkE70ACZafa+ERKEYim/BqBJnh5skZuHdJYT
 e
X-Received: by 2002:a05:600c:3596:b0:426:614b:1a72 with SMTP id
 5b1f17b1804b1-42bb0306805mr137341695e9.17.1725379693428; 
 Tue, 03 Sep 2024 09:08:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:08:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 14/53] hw/timer/pxa2xx_timer: Remove use of pxa.h
 header
Date: Tue,  3 Sep 2024 17:07:12 +0100
Message-Id: <20240903160751.4100218-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nd/ft5yVsird

pxa2xx_timer includes pxa.h, but it doesn't actually make
use of any of the #defines, function prototypes or structs
defined there. Remove the unnecessary include (we will
shortly be removing the whole header file).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/pxa2xx_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 6479ab1a8b3..d1a3ecac2b5 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -12,7 +12,6 @@
 #include "hw/qdev-properties.h"
 #include "qemu/timer.h"
 #include "sysemu/runstate.h"
-#include "hw/arm/pxa.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/log.h"
-- 
2.34.1

