Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4362563ejb;
        Tue, 20 Dec 2022 06:26:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/oNaF3219E2DkVR8NqvoDEtQqIsOb2SKITc2/wrORtT+mWStsAfoQ8pQ0DiFdVb/ojEzP
X-Received: by 2002:a05:690c:2:b0:364:1ba1:d792 with SMTP id bc2-20020a05690c000200b003641ba1d792mr15933984ywb.28.1671546389190;
        Tue, 20 Dec 2022 06:26:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671546389; cv=none;
        d=google.com; s=arc-20160816;
        b=QwYUBmGZ+as8hxGxQkOUntb8/khMaTSX3LX45+PUyakezGGVwAfo8IknVpym94ercQ
         wrIGa+7TQWi1en55HoldAXWFvs5iHGzGWh+DVux+NlXlJPk/kiWJkdf5msddKBm4ACkI
         h4/Nej6LS55nNyC22yiN+9VMfbMdRyMV05p/vHV9hV+td28znL/3dL8oab+sfspGpKXh
         sduq9ljUiHPk7ZcNg+68BUBEXvNRBJexzKf594yKIXKQGirRRV8+ygwfoNUuEUlSzdgI
         1b6chv9VtowfcAAl4ocFuOUUDXLzM3xp8h6kZb5ev8xqlW5MyvxB7SvSg/SQRWAe1PBR
         Pp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SRfQXt0cpRTOP0e5a6mN6QzhWZi0GjW4YvHNsYLxYhI=;
        b=s/2x9FTbv9XQ5wJzf/I0l+lpjYKlkrkqHYaQcFnIheeNK1JVF3RrRaZw/gyVGzaSGk
         Z2cuNZVtUgu7QavUgTcL3qBPWCW3dUInR7Jfu9Y78wTtPAEIhkjxrRRg7z5PqqoZRj88
         xYjPkBlN2Q+go1deJwgvKDbvq2lYa+9lPw/PFg+TXSDIgfrP1rega/wVDeKNYh6Q78YH
         ZIEJUb+KXNFetv1tJoLiY/8kCmgfDginwi1ssaDnpzNECl9GZxuWVybY/lkj2z+XXzAN
         2CuCPLxip8nM5EvN+bubcw88wT0UyjhrP+Df8Y3f8dP9xg9iRvLXcRUJ5US1lKJ5smiq
         xYNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MsCKeFeU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20-20020a05620a095400b006feda799d24si4911952qkw.296.2022.12.20.06.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 06:26:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MsCKeFeU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7dYm-0002kG-R8; Tue, 20 Dec 2022 09:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYd-0002fP-Eu
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 09:25:28 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYb-00073e-PL
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 09:25:26 -0500
Received: by mail-wr1-x430.google.com with SMTP id f18so11903345wrj.5
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 06:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SRfQXt0cpRTOP0e5a6mN6QzhWZi0GjW4YvHNsYLxYhI=;
 b=MsCKeFeUB215xQ0Idjul67RCk8ITzj0rPWoUjbneLjjlNjKDgNLWg6u8ZDeyfXvYzA
 zMWjC2Egf75hYcFsfy5itih33Vrusctz1eHUvbD2OZxAIZX8DbsZ92ZFRf2DTqBUAjSb
 /q1i5YnbVriFmbIPt+XMB747XYiHI9XyZ+mEzV2v5zS1mjF3lmKft+rhkOnu6t+etgaR
 Mv3oKQDpW/D3Zk3OC+VHXZePluy/36WaOh1T/f2KfGbmJ/lAf4e4I8KwAPl9gl85+RZE
 OzRKBI4SvSaOsMyuAVrUZBJ8uD4KEIVO+kIE4OsPZwfaYYzshGgUZWuM/SjRCD+EdZwN
 RMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SRfQXt0cpRTOP0e5a6mN6QzhWZi0GjW4YvHNsYLxYhI=;
 b=cUEuuF1Xo7ql9O2MvX2BBGB4Dc857xYDjvWgAC3rbEXWUs5iku10gZW7wCWqtGYgnp
 mKMxEvqlbrk5X24Awdjdqyi2YO4kJ22YzJu24ebTkru53wVgvJUkQbQ+VsjNIboD5YSE
 oRGYGURW6cuvsFPBk9F2FJyx44m0h8kn68vyL9YRVEFU5SzYkrjjtZ18J3Tgjl41iVNz
 5+yu2O86cO/t5+zCSLZUrMyN7z+TVONtc7bFRRPsJFkAKZYAXQn/RPpv7+/yJv5JG2et
 rbh2+thzXk7wsJAzGkUZwN+0GD8+T1IEa2UkC7vbi18WtSwYW8NPSMmS172w03djomMJ
 MfyQ==
X-Gm-Message-State: ANoB5pnu3EcNh+KoJSR4GIpikGQW9+AK30tc6MfOtSPuELh0hVwyMOuJ
 ejAG7XGB1vBppdTM9xS6kO9LLA==
X-Received: by 2002:adf:a44f:0:b0:242:63e5:2449 with SMTP id
 e15-20020adfa44f000000b0024263e52449mr31951432wra.69.1671546323543; 
 Tue, 20 Dec 2022 06:25:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c18-20020adfa312000000b00228dbf15072sm13322372wrb.62.2022.12.20.06.25.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:25:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] hw/arm/nseries: Minor housekeeping
Date: Tue, 20 Dec 2022 15:25:17 +0100
Message-Id: <20221220142520.24094-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fAODDH8tPTbh

Constify read-only arrays and remove some -Wextra warnings.

Philippe Mathieu-Daudé (3):
  hw/input/tsc2xxx: Constify set_transform()'s MouseTransformInfo arg
  hw/arm/nseries: Constify various read-only arrays
  hw/arm/nseries: Silent -Wmissing-field-initializers warning

 hw/arm/nseries.c           | 28 +++++++++++++---------------
 hw/input/tsc2005.c         |  2 +-
 hw/input/tsc210x.c         |  3 +--
 include/hw/input/tsc2xxx.h |  4 ++--
 4 files changed, 17 insertions(+), 20 deletions(-)

-- 
2.38.1

