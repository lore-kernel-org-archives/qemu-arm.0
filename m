Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp419515dyc;
        Thu, 3 Jul 2025 02:52:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJjr3AYafxpqoKxNGnTpsRkasLSC2GRWVnA0nfO/OTCsgDjy6C6gEbiMCifv/D8geFO8hkZ/SoOXb2RA==@linaro.org
X-Google-Smtp-Source: AGHT+IEwe7Kpt/OhXBgrtuye6bh7bOhH/LXnGuMYgDR3LB0cJ0ZNPdPtXMS2uxRmrykJLInVP62L
X-Received: by 2002:a05:6214:519e:b0:6fb:f19:66f2 with SMTP id 6a1803df08f44-702b1a3e750mr97238846d6.8.1751536331855;
        Thu, 03 Jul 2025 02:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751536331; cv=none;
        d=google.com; s=arc-20240605;
        b=clnEuGeuMshgNyReek/UusYlCji365V+BI5UWfMidKzoA+r1TMHhZBP4RZca3BBzx2
         zOIkVqhn20ep4/bKMwNNBC+j+OX79RSHDoWzLK0oqztvatg2G4G83oUem7QYJqNa1woJ
         rKJXOrVoqZFkJ+rQBhCetuPppSocO4BhuM3BAxDBJ2XCI3Ez9zhk5ArHChQVn/8bX4+B
         K5zK9YTZ5VE8knphHQCvRQVZ69PzpyjTiBLMF0/iEWWbvtU0bC7wZ4nv5bFxQ677b8Gq
         lMhNICdc9SHXqnWeA6uoqd8nHUhJPNEOmNkazAfAGO/P3OHz2dLYI1bLisBLbMDEyOsG
         ZCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/NoHf2a1Zo6RocIxZitcR//DWchIRQTyoNenFJdE110=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=jWZ0ElBFuyZ7aiJpLww8X19FMPu7FbvGzFkZSy9WgzsHBf/PpQy5r1dZ6M2OiYHYlg
         RlEiqwczEleUTozuylRnxYYLlis0tSoWWZ4Mso18mAPqG6upQ0PBI1exgPdPpCnJ525v
         4T6WSZLJ2GCBl9mqTUUE4869Hq+sSem4HeFVCPH4RTAfAtd1e3+tpfgu5VLLZ9EbdDv1
         IRHR/FcegVkvsnihUihfM3Mw7/im/jFmQqR8H+ehDrmjInp6LylD4GHRYxa8qVo/Snnw
         xO8g+tqOyCcKSAI1YoxtcWv8FJMXk7VfWzxdBOMpbzj6mxs+GZFThJw3KUEOCRymfGjx
         LEdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JsK/05Ph";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77385d58si165261186d6.345.2025.07.03.02.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:52:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JsK/05Ph";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXGbC-0002G4-UK; Thu, 03 Jul 2025 05:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGbA-00028w-IF
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 05:51:20 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGb8-0000tP-QV
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 05:51:20 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-70e64b430daso59469857b3.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jul 2025 02:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751536277; x=1752141077; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/NoHf2a1Zo6RocIxZitcR//DWchIRQTyoNenFJdE110=;
 b=JsK/05Ph3YbfVP/ByX8pExnn8dlYrm7+0uc4dumVxAbKa0dVrbatHt+0fCjpRP0rkJ
 s/+l35nKDb8KfPxNrm2xkskt5IlwG7pzqtOvTbOAIz9x8pD1jCLRsLTl7kcyN6tLah7P
 FcJJWCON6f4+W5ppmzr+XdQBFj8J9yoLpmOBv1GfALeRFKqg/VYyZqOaNuN/dqvRY//L
 1/EdTkP3CfmiG8Q03xyDmwdaPAFHDwqogfjc2zxnNi5l1uhzxR04e3sYw/JISDhhI5eI
 /qmW+NRQCK9omME8sLWPRUxOc0SGhvNgrL2pqoj56+nQg7Vme4sFDTw0fTVENccvIbWd
 Y/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751536277; x=1752141077;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/NoHf2a1Zo6RocIxZitcR//DWchIRQTyoNenFJdE110=;
 b=Xn+aqlvZTgt8ryl9JEZLD1Hj7nOqzQ7zTXymCLhhpTo7V4cq6fK1P2h/9FUNtcDUj0
 LonO4k19BCQ5HaAd8CHxMCtiY6rklEyBm35e/F0fX/nMu7kmkczGHox7vZFo1ku6ZDcI
 4u+LPNiB2d36771/X3YBzinkifaoDAcicO3QmZvvu/qnMX5mSlCoh9z1p+9tDLwkqiHx
 4R6ct46wJHuTG8DTYFQDknvAK2nkewzigT5zQT0v2NtLbajM7Roa8xSsEPy0DxuizzM+
 tR7iUIUuDBWKNwmHDxnuf+WRCmC2SaV7hkGj08z2Z2uDZ4hlj9itAZX30hhV0xkzB4PB
 t2Pw==
X-Gm-Message-State: AOJu0YzAjgpkR2MjOtpf+s1cKHtYt69G7Qksk8rNJLxQ3mRFJ7S1QdId
 B1xPqDfwNjxG6OSNXtEefgik9ZTSreKDVE2Ez0/3I622zHjiPGA/SXTvj8/dhFOMngqWFoZNUFu
 2KdZfN6F2mYxKfHXDp7RReGFHSew06asxoeigN4LsNgHwWVBMExoD
X-Gm-Gg: ASbGncu3FVOlXz1CzngHUrNxFqdm4UIVh8kCbCYsVCUMcK5HEi/MZ+Mqfm8J5cXKgMo
 FnSMWz/TnFN+cD9jSWeSp9AI15wwTuYMYM8ik2Wz8rk4cGpuuC0GRh39uzVl9xzse+bJoSWghdD
 CsjXMn7JFW1xiWcSCbl7nGTeg6IWSvlftCeI7osRsxhQZJ
X-Received: by 2002:a05:690c:64c7:b0:70e:7ae4:5a3e with SMTP id
 00721157ae682-7164d2cb17bmr96914047b3.11.1751536277594; Thu, 03 Jul 2025
 02:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-41-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:51:06 +0100
X-Gm-Features: Ac12FXzjj2X34VeGZRD6FBw9FZdPBaPVVvALvmDb_4SJQUfxkaXQ9UDWjxPSU20
Message-ID: <CAFEAcA-e6hSoEMh=2TUieqmBMnmX1-uAd2PRkHsGVW8jV-BT=g@mail.gmail.com>
Subject: Re: [PATCH v3 40/97] target/arm: Implement SME2 FADD, FSUB, BFADD,
 BFSUB
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wyRlgREdQA9M

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper.h        |  2 ++
>  target/arm/tcg/translate-sme.c | 44 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/vec_helper.c    |  2 ++
>  target/arm/tcg/sme.decode      | 25 +++++++++++++++++++
>  4 files changed, 73 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
