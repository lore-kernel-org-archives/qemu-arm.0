Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp253174njc;
        Sat, 8 Mar 2025 11:05:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWTn4kOnaxqw79Umd+2PStsZLoQ0m7q8IVj8UEEa96dTQkpcNPRQgk7Ya+obM8B6ifxnO52Ec7ZbvHOng==@linaro.org
X-Google-Smtp-Source: AGHT+IFAT8rjK8c6W1fThUjcdOzujDQZFA403D7poKsLU583eE0/8aTjn9LehR/BrStlPiw5LS80
X-Received: by 2002:a05:622a:118c:b0:474:f493:3ec0 with SMTP id d75a77b69052e-47618b027a8mr102155581cf.40.1741460757678;
        Sat, 08 Mar 2025 11:05:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741460757; cv=none;
        d=google.com; s=arc-20240605;
        b=YZFyWpPISz/KsQ4sOWdaHWsNadcYT0j8liILEDr828tbdbSZ3EUCGqlWjSCvTnySAO
         J9Csl9UirzojZ8xXxyDRlNrfXrj+rPqnYbwL4AQ9HJg3W+DAl36YDUz1Nd4OJsU6mk/4
         5GtKVg3rHMTUpO88JLrut7sP1yvXsOqf6tgEHYMynp8kKyj3u85A/znep3H6Uv3EWidw
         xjAiAolbhFK/sSEmZvogSyCq9DIWAmv2IRMrOSa3zsyLuuCJoILF+qlEnveWtQn5ADk3
         BgEhltnP0ZDV8hv5THqoQSJkmr+R7QlemfiXZv/yDOFWfSG3lsytfSc+PY90BZtByJIF
         ZRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=74sWG9go8/U3pCHdLat3DJreQSt1Fc2X0U97u54k3uc=;
        fh=mIdlPJRCApO1KQhGB9jm3TfKuhxkvueDvY4K47gOYEY=;
        b=k5OC2l1GcNUm+dbCoKfLwsEPuODirZ/Tbqfif0ASEl82U/7O5HZgj3yma4zrpZ5ian
         X2USnqyPFMX9+FcOBb6hlb353uT7GcQr5SazHPOij9Lhv9SbR2yhMV2bPAzx8ZaL8j1l
         VCxgEG9WEkMYLtcM2WcjauGswgFsZKCo142kM/HskQryR152MYxAcnSvj3rN96T6ffgd
         78FbhA+XKk++c5YRrV7OZllCFJOAZc2vFaYKx40UEPGwC4cA0gXrXc4Df2ZirG2+xbep
         4NE5D7Jv2ZXUJnC+0sRdF9pJHRPUR0H7agFfMMRQ8rkn70Hx9ugtYGUUx4UvFXy5ZSk1
         Ei2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gkeA2RAP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db46297si57630711cf.602.2025.03.08.11.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 11:05:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gkeA2RAP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqzS8-0007GP-9l; Sat, 08 Mar 2025 14:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzS1-000788-VT
 for qemu-devel@nongnu.org; Sat, 08 Mar 2025 14:03:10 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzRz-0003ar-Rs
 for qemu-devel@nongnu.org; Sat, 08 Mar 2025 14:03:09 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43bd5644de8so31823975e9.3
 for <qemu-devel@nongnu.org>; Sat, 08 Mar 2025 11:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741460586; x=1742065386; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74sWG9go8/U3pCHdLat3DJreQSt1Fc2X0U97u54k3uc=;
 b=gkeA2RAP1Be6Z5+Y1egFLwYOde6qzbPy1UJKtM0F7K8Qd0iReidEANQMMyQlwSKEX5
 hQCUmVczZPu9XqeWb4vTZvXCl1AYVdUhJhzPKT8/2Ug4CUjahddCosY6sUsrqTknslud
 u/NjvNCUioyAuenkcWSUTT/v0y0Z9O1ohBFgmK0u3m+875OiaDYWX46UQOMD0zRsoj+N
 9DXfwWvOCleWwS46x+AsWhJRkMIoOTTaVKtDfIT3Lk2uuGO6Q4CYQgk0VcsOpVEx1lYw
 /Sfb5FZmcVpCq7q6yuB0vcG0tqRl5ZN5/P1+hX+EavqZgix28Sle+BOCxlFtkpwfN2A5
 LHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741460586; x=1742065386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=74sWG9go8/U3pCHdLat3DJreQSt1Fc2X0U97u54k3uc=;
 b=cLH2qnAWdtufu4x6/WkqspIqUqDSPCLr0CcKPTyukCvlRyFllLS4zRQuUNyewv9CK7
 vIGxavPMxhIqxBJ6qBOtovYGAYOClYR1+mpb2ViWBe8ICdr7lnBHZHLszRXi99Gjfpw1
 OugRHzeTF5Aqk5rhDFOYzNzTG3+N0VYua+RY8J7B8BOtXxT8gbmelEJy/LuIh384yRwK
 sY/NhRXvGkwaDVCBejnl7FhVkCouV3SS/fbyxpz/bcMj3EHKXtiXq6qLNp6UuRHYMh7q
 aL6nlBln0U8KTQuF586rxy0QcFMJoQXcZzJAofh5NDxpaJaWCpnrHUTZp1kUVXoaJWRV
 XmDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo724xjw+lU+js8iokyFc0V5dGLo1CQPn2yS79RcJxsnnC1xs79aJOPZ1aQOz4XgMCPsLJBjSZjWCy@nongnu.org
X-Gm-Message-State: AOJu0YyRLvS19sQCTji/I8AMvl4hMt/gX9nH0GLpPei7fgKG+jz2Sh6i
 7/ZBtzvjSckFrPKn3bN5wat909lbaa8FFc1tTPo410n4ggitYV9k31itzRt6yE0=
X-Gm-Gg: ASbGnct59PE2Y8kGsajxmKhQx65Gf3IoroOMvL+iqfYEMuQD2T9fGHp+dSb0GK1mcjd
 M4p0nDhuDY2+LZpKJkZwUbg8QVa8yygJKFN6P/fZ1pBUrs+ZU6V1lnZH/4ydgf+NCjvYQXdTiz6
 K4Lf9sCiJU2nLACDjmgsWbW30skueusCMmRKSusci6hqgFk4MNRb/aM++0QLN51f0TmOWIZxYGU
 wnBMpNcMka+CIS0LwcgrH68BG/TAzYWkuJIFUNgnZjBJY7MdvL0k5vvPf3En/81ruObTQOUJQ/a
 mtpcs+sA+WubSYIoDLe7WciS6FX+b+NqT7Dss29DMU+qo17Z4m34EdNhZ55JILI001/J438WTDC
 g4ujUkKquDiAMhfQ6Eno=
X-Received: by 2002:a05:600c:3544:b0:43b:d6ec:3d57 with SMTP id
 5b1f17b1804b1-43c601cfe21mr66427045e9.15.1741460586266; 
 Sat, 08 Mar 2025 11:03:06 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cec8e1596sm17687745e9.31.2025.03.08.11.03.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 11:03:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 07/12] hw/sd/sdhci: Simplify MemoryRegionOps endianness
 check
Date: Sat,  8 Mar 2025 20:02:25 +0100
Message-ID: <20250308190230.7508-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308190230.7508-1-philmd@linaro.org>
References: <20250308190230.7508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8aR6MrLXkW35

While little endianness is the default, ome controllers
might be only implemented in big endianness.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index d87a7bb45a4..d115e88c4b9 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1443,20 +1443,10 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     ERRP_GUARD();
     SDHCIClass *sc = SYSBUS_SDHCI_GET_CLASS(s);
 
-    s->io_ops = sc->io_ops ?: &sdhci_mmio_le_ops;
-    switch (s->endianness) {
-    case DEVICE_LITTLE_ENDIAN:
-        /* s->io_ops is little endian by default */
-        break;
-    case DEVICE_BIG_ENDIAN:
-        if (s->io_ops != &sdhci_mmio_le_ops) {
-            error_setg(errp, "SD controller doesn't support big endianness");
-            return;
-        }
-        s->io_ops = &sdhci_mmio_be_ops;
-        break;
-    default:
-        error_setg(errp, "Incorrect endianness");
+    s->io_ops = sc->io_ops ?: (s->endianness == DEVICE_BIG_ENDIAN ?
+                               &sdhci_mmio_be_ops : &sdhci_mmio_le_ops);
+    if (s->io_ops->endianness != s->endianness) {
+        error_setg(errp, "Invalid endianness for SD controller");
         return;
     }
 
-- 
2.47.1

