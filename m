Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1268435dyc;
        Fri, 4 Jul 2025 07:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpibhx/C3J/zI1syb42cMdzZZAHJ0m9Fj2rq5rnoHh/FYov09eQtLF59WMHNkrKqcNFNBdKr1sngJO3g==@linaro.org
X-Google-Smtp-Source: AGHT+IFyCR3ymMeqTg2uYM7uwKntk7VMhL4L8APRdMfalIlvMaWVcpIg1+fZoXU1IhioBJ+/yk5W
X-Received: by 2002:ac8:5792:0:b0:4a6:ef6a:ace3 with SMTP id d75a77b69052e-4a9967290fbmr49527191cf.44.1751640891242;
        Fri, 04 Jul 2025 07:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640891; cv=none;
        d=google.com; s=arc-20240605;
        b=IV+pBCGGGSb8dQYUrwi2R/4t+amjM3ZJ9hm5jm/PWngxhs5+2gZC3ipun+b4x7caKD
         GouciSASggYMCvbmt8yTcd0oNtPEmai1KaQbjaZunFgLfnav8imBn0B9PnHM46tkF83Z
         ZrVZoXbsugo3h4gC2lepo4FcB4JGSgo8tRisAOoyyUqBkYmhlWfIo9qqad2DKhIwOmFe
         NG9VnHCB9jkT0pcE2BZBXbS/uDNj7J3K2Elvbw5kh9qEWvo2LIa5NpEAxB6AvnC8hI9H
         /rKliYqdc05YHofrOAOg5fI0KZie4EA2JqKP3ro/sf+7UFAUposEzo/EchyU/+ukb4Mh
         eAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=joESWnY5bJ8UksgfoDko2BOSAXcPRoGq36B5uo0O7JU=;
        fh=G7y4beCLRe0um+iTOyFPD4S2WaxCfagOMzXVN6Ueloc=;
        b=HSOfirzy9Yc1JEpSm4Unt3mtU6i3eiYnqPKXPC0or97gixuEAFV7k22iXEmLIsc2vl
         0ZxruQLZCKlNbtfw2iMV6HycKXuXaYuFA0q5MDOjrFYoRDNteX2gw969g6ApBvzoGX6S
         HH44R3V2lQ/Fc2CInTTrtP7EFuG9axcRlVFGyUltqeo9/vTozh+kyDTEg+46nFNNRiuJ
         5kD9/AaXHiUeAkAXJZnsLdSYGWZf5Ve5mt75b6Q/ZJjUaDsAcsDiOV6EY0q3QRXfVY/T
         YysdshFYQ1HDKacYHUaQ9au6KbBops83B5wW8i4muFPyHbDzH5yLxaUDwc6IQkd2f9sL
         tB4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Psl3DI0E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbee1fbbsi237968885a.477.2025.07.04.07.54.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:54:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Psl3DI0E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhZD-0003ZX-0a; Fri, 04 Jul 2025 10:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhPL-0002gV-Ea
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:56 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhPJ-0001bK-Gr
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:54 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-714066c7bbbso9774437b3.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639332; x=1752244132; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=joESWnY5bJ8UksgfoDko2BOSAXcPRoGq36B5uo0O7JU=;
 b=Psl3DI0EWeQ6hlg/gUZkGgqlpUifOY/nKkbTvzyNSGb1j9cHHPdGUj5add2wP49k6c
 WcqYW9eR4Of9Dyee8d2kWLb4mq/VQMs7mkFn5dZTH8p7A7aCM3AwX0cuMNX3FgDejhVz
 ih0R3Am16emBKfeKVxAxunGD0gQTemt4SZlqCmCY3qDnMGegqubUj4AXPgPAVWSDL18Z
 TfWVsl5QCAwa66cPQNve4eKcOUDuKlc1/RuINBRRN7NUZL8PJbtUMGb6YDSOk+Qyynpx
 rUXEzuvbp+EYIrND4gCpAGdfCbzC6PMy0SqtwZzX/G+z8ZDPtichC0dVqvXX8MP9vVNi
 lx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639332; x=1752244132;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=joESWnY5bJ8UksgfoDko2BOSAXcPRoGq36B5uo0O7JU=;
 b=k8yAyKRo+N4GCji/4Piqrf4Z9Bwu+kSst6aJYy6W9iRy7F7LBBjSz2Kw0UMYnzHdKS
 Hh+6XloARSiRF3dNAwepxnFdD5j+U6lXBAfNQpXfxGm6DSjgPnZiCzR7RxNksZq+lS/f
 xgVJNYgjXJlZLvj0mTAyGHfvOxmUaLl72CwuoMwU7wbXyIwaPzjejs8jV5gcvilbCTLV
 jKoqAXRUs3Q4nrr5XwYx6u9ZBvJdulYWRr70A26dWo1VL8D2xKY0t4CwzAxqdehj7YTe
 l7ekYTl+78mntud6rzIqmn3IGK4/PiQ34vKdrjSIcJ1kFkmNs5/eiC1H/4hEKrgGc/VJ
 lqYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCty+ejA0NP0jvd6j29K8rGsPmxNMhnwHNnliH/KPH7iQ2sPmbdfAvezttwY0cAz61DVGOmjjPIQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw9jpY1VPwZq+4Vf304WmUv92rHhfyyTI2OGDhWkufD7b2k1IZG
 +yToxu0+aMtZjtNzhOToRZiGY3ndmpG2Ijxu5Umn8Pc7a1LPkYrWz0eKkbli4KlWQw5rkF0jEKT
 h+2am9qmPel9NMWecBOQNEurVo0UV0JRRTJpVZyVN5w==
X-Gm-Gg: ASbGncsK5e7o6bUSwZb4YaLSyZr+xq72IvVK1HtNDvKycGkamQiX7L2BEsp8ZYVTXsP
 6ff1dn/WDCFDQ7mqQvuyvfflbjGVwI+8VzDcupi0UAZFZ0Fn16Q2ipFtemWh9ARpmvisOM5QV8T
 7lscAfnnIJTX6K8UqmbirBxs0tDMfT0D0MNYneFQ+eitk5
X-Received: by 2002:a05:690c:4c04:b0:70e:142d:9c6e with SMTP id
 00721157ae682-71668d0ee06mr38690167b3.32.1751639331948; Fri, 04 Jul 2025
 07:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
 <20250704142112.1018902-62-richard.henderson@linaro.org>
In-Reply-To: <20250704142112.1018902-62-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 15:28:39 +0100
X-Gm-Features: Ac12FXwlUTLQ7G7oZWsruazCkXotjVGAn9kSNaMdF7GnYliW3CqyySkf6ncp_u0
Message-ID: <CAFEAcA8xKgak7VEHa_SqGkZpgUK3ZKAEN5JNj4dap9GDhO3+XQ@mail.gmail.com>
Subject: Re: [PATCH v4 061/108] target/arm: Implement SME2 SUNPK, UUNPK
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
X-TUID: NRhtsX44iSk8

On Fri, 4 Jul 2025 at 15:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme.h    | 13 ++++++++++++
>  target/arm/tcg/sme_helper.c    | 38 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c | 16 ++++++++++++++
>  target/arm/tcg/sme.decode      | 18 ++++++++++++++++
>  4 files changed, 85 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
