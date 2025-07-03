Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp492630dyc;
        Thu, 3 Jul 2025 05:15:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuWK0KHyJ/gfDycpXWfjwJ8Mq1Y9YT+b3ApEKk88AQHd4w21D0ZlrRW/ybgNfV12vvhrz75ZiS8xNjzg==@linaro.org
X-Google-Smtp-Source: AGHT+IHSiMoBumWfzo5d/25BUI4J/PRv9Mew2LSgwwcCjYXXIpbTSs5/NSYNNMptSwt4E+rSK+zf
X-Received: by 2002:a05:620a:1aa8:b0:7d3:f8bd:f34c with SMTP id af79cd13be357-7d5d3f2dbb4mr289547085a.10.1751544935668;
        Thu, 03 Jul 2025 05:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751544935; cv=none;
        d=google.com; s=arc-20240605;
        b=gpz3upvptfAF9DbTwjZIZHaG0XNbah3bJ8/daRg26328u27dTs5ClmPA4QAnIq3eeC
         xd8rF+0I0dpxiWGWg6P7Mkw4X9botTpNpvu63CHEEONzTnnCCLGhol47zeGAhK1BDlDB
         QCDNdyWtLua957934RmfGw2tgJeynVgJIQLbeRsmpzrh5HCe55Tcg9xm5VampeSO2D6Q
         YhhhMVBTXswCknh4VquKqVR2AIz7SCosCk44wj/21erlilaixJkWNz/q/9X43xxahanw
         bowKFf81+SgpBtZFzlkzlPELeen4U0AS2EAz6MiknMLDOeRtaT38m+jKF8jS2RVtCcgN
         OJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tBgsgIeawqL0c81jNvHXOOlPF0rya4pW0p9Ob7Foz/o=;
        fh=ygQWW4nvewYAF7MWKiYj9ALkIaORVXrcwY8vF4Qcx/M=;
        b=RDw8Krq8cBOcDVPgTsx3FWpVEkAch1lOVQz++XUnS8datpZVBc/gQloxy2u992cmjF
         xe3yK3GUWDgQ41AQR/mcuyBy/pGmpFkGy0vJFbQZN4W7gfW/o2xkbaFa0/Ti2AAQUSx3
         Xd7xmFzVgNhZY1EfUzWv1VNu1Rzf0r0YEwXn/iGZoZm8nrBt/BkCtX7AhFv6Ak/O8vIy
         utKUBY59k0b/ptTwzjNKjgP7bAyQbOsht+u8K2Q7LVvfyoV2EAUiPYdMHdi/TkjFYq2O
         qq5JExLtaEwX1SlHDXqZoB5k9X82t3D5J5CdUbo+L5FWTRRdRpFOaT9Tb+i00IQzuI9Q
         lK5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="oXZkIM/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-884d1d7b001si3530132241.133.2025.07.03.05.15.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:15:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="oXZkIM/D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXIqc-0002MX-Ug; Thu, 03 Jul 2025 08:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIqb-0002Ji-3X
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:15:25 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIqV-0008J8-Iq
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:15:24 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-70e3e0415a7so9837117b3.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751544915; x=1752149715; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tBgsgIeawqL0c81jNvHXOOlPF0rya4pW0p9Ob7Foz/o=;
 b=oXZkIM/D2znMLKsT3McK/56MNLDPQUMTgdt1x6H9Qrp7a9U8bT4z1/CZuqBmEjZYRO
 K9/pORt1DttZYDa4TylNpspOHchJ5B7ae1mJ9PmWZZhxgSHEior/QPD7BZaPJyjfehsE
 mG1otf9yEoEZHocgV/VrWbL+KxlHnZmfP2eVmEVD2Lr08qU+kGNZJpkFOSWD+sybvFv8
 KqGCy7/SVH/T3FKKHCuTKMOgkT9Q4Wa01dsRbyKg6JiH1dp0r2p7kyW+FfmMJtyOuC0k
 tlrH7uEI9XtruHHxnP5QZpaBo2xARbG0oi7akWjSbTjszoC3moLSz+YhM22fe5MgXpN1
 Z3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751544915; x=1752149715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tBgsgIeawqL0c81jNvHXOOlPF0rya4pW0p9Ob7Foz/o=;
 b=d+n+niShhkNweIaj7dxwD32Dr6s0KNafzDZHOQ+fhlUIFCtZnzzPkBXDopLRfVRTgc
 A29A0B95TfE11MOHM+Q/flW5/cUBDc/PYk0XsEaC/XGfD41urXvknvPbaJBnPG6mD95r
 n29uyv7gYuaIJBhQHz8AjWJlDrnYU6RU9yk0FenhXbPZnMfmm7AA50YnaxeFQRQLxFhc
 Fe2xs6vQqd4xtSIZd+1on+8UijbMkY5HQVjqVQOCEDSh+9pQn6kmo8Y/1bnlSDmDd72d
 /HssUbm4t6d+BEZ5cHjsfzFLCLd0SLb5hoHcBlWiz/uFdovfYDDiXtPdhdDArYsegpeK
 CFiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi6FpMSWTAz83G6x/vn/ENaKRm3/Ip5d6wALR1O5svTNChauOs1CM4o00vq0TGV70uNQVec8DGJg==@nongnu.org
X-Gm-Message-State: AOJu0YwetuC2el372f3RI3v/S2bvOT2DKsDmHHA+INTDo1lSvkUHjOg4
 KFRIxA9YR2QJOgn3B0sP+UGFnkfxDK4MjnLWNkqg8w5577oJ5mD3BCSM67bok/+ywYm3CkslOiy
 LSO4YgkznUVLN5ejVscpQOMPKwP57oREANVxb0tKYGpXEP3q6b0qY
X-Gm-Gg: ASbGncv4uNbThwKk+HjixCWViqGBWu3kM+Kc0ujEnIVS0dJf+UkJeqe04OykJh07sOK
 Vk2qtCxlRD/yNemKf1NSfOOLhdWbKVSHGWwJeid4jO63veD1/ETq1b5YEoJ32Cb/4LVIkP3gBhz
 t54NJ0UbgUgnBHKdYvCc6TRNoe7wogZCTYLFd7YZk4SmgX
X-Received: by 2002:a05:690c:3807:b0:712:cc11:b02 with SMTP id
 00721157ae682-7165ca32b44mr24996527b3.4.1751544915555; Thu, 03 Jul 2025
 05:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-71-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-71-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:15:04 +0100
X-Gm-Features: Ac12FXzFE_4J3f5FEw9PehjR0I9rp7xVvVcKXyjJ3Gn9iVhU-5dqMZtr_cIWaaY
Message-ID: <CAFEAcA_7dTmTB4xESb4nN3WqGCcBPow7pakq++vwrM3Yep7qcw@mail.gmail.com>
Subject: Re: [PATCH v3 70/97] target/arm: Implement {ADD, SMIN, SMAX, UMIN,
 UMAX}QV for SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jJu+Wkf26hpK

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
