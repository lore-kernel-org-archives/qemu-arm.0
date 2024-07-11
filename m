Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp65066nji;
        Thu, 11 Jul 2024 03:06:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVj3hTJ4JXy9XWLT4/fT/dyFlGA0B83kpa6YSQpyPqw82Z2f4utAn0tlDkL5EaCraqNacLbwLz2OR2k6xuqyXNiHcfOC6XL
X-Google-Smtp-Source: AGHT+IEQyV2Abn4bVnJ0+RvzXQfd9hw0TVkobFh0kaNJUzdhzdtiiGnRbYuHuSu48UuNSdqReCop
X-Received: by 2002:a05:6214:485:b0:6b5:e1dd:369a with SMTP id 6a1803df08f44-6b74e968874mr16285786d6.11.1720692416863;
        Thu, 11 Jul 2024 03:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720692416; cv=none;
        d=google.com; s=arc-20160816;
        b=dvLc6wrO0dL2k62P7mK0DdtrBGzSXlGHBU6iLzuwdLLpgoWYWm/agjPTsnpbbyg23M
         yUoD8AkffcWx+8F6yHrwZeKmgZpjCHRDZ2tfvh+pnDpDG+FL+dBgkaF29MtOSJjxECQ6
         0B3w4OrBwVhfJQ+Qv+Kj3qlbmKSloIYFiS1e03TY/4r0rjMU5og9hLsV1/zYo15KGLRM
         oRp1ibHgyKSn1pviz+fa2rgOYU3Ol5uvLoh+SnQLb32kgC5DZ12JTyI196gTo3Fp6KiT
         l2C7KXFR0qJ36wm9UsOdc3gamPB//qGo9FX4ISkNUAe+OcFZfpDqLVj06hjli9ayMn00
         Id+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bSlZiBkF41thqlaeJ7gQmqe90FaqKX7hDK44FbZ8aDI=;
        fh=ru0K2WcncFYRKOF3a5SejTaQrTlfkdyGCsb+OtH0RnM=;
        b=X67IIycszFaSGZhprmtccwQ8TfniYzCxqeViBTT5xAhiMOoibDtK3AlOHU1sXcd0xF
         GxJnXhfXKqQ3GFPnEiGuSf4zCgnrUJeGw5w2DO3ccXELRgDGE3E1lBUjypfdd86wiCm+
         zHi/WAF3O+u+3KXUpEtrlOqfc/b6OHkIaAdaN1yLegR4eTI65sNsjCmJWoC912ecULCA
         Hno0OOicBBitIluL/NDK1nDT8EgjEv2KyhNFNYEIm1T0vvuM43ZrqYCABRRmbV/KeSOA
         gkYPTJ4FSpIMKTobjyblopbhCNh9NQCUXXw/jxmtFyrSmJxhce3vpR7xJtcWyGGNf2oW
         HvxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PGshCwxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61b9f7451si68818816d6.5.2024.07.11.03.06.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 03:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PGshCwxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRqhJ-00007f-7M; Thu, 11 Jul 2024 06:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRqh7-0008QX-Eu
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 06:06:35 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRqh5-00031D-Jm
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 06:06:33 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-58b447c513aso871514a12.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2024 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720692389; x=1721297189; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bSlZiBkF41thqlaeJ7gQmqe90FaqKX7hDK44FbZ8aDI=;
 b=PGshCwxN1UncB98gW0w0qDsZYBNnF2cqrdc0t6ILcD3iRjNm4dsRMWqKyEtSXjgxQH
 qEN2m4ivoBKzzvP0qU4EO4SA7W70Mwdpnsiwbuw5f7Lu1rMtavPvWgG3o9Ymfny/ucPP
 tqnLe8aX2lVJnhIouto7xUXFBDp9Yb8wDi1OJGE1b04W+jQjg4l0KC3NbMxKqlK0WHmA
 0/iMtiU0lVePmCiuFkl44WkmYkpy8Xd402eHPEoGKcQ9DFsFeZf/+BNRD5W8nuZdZZTj
 +G1pheLIfV0i/WGR1CYR6/XE7ht4BSqyXM04VnfE2+kok6o0gCVdg6K0tkDWAuIuzvNg
 6tUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720692389; x=1721297189;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bSlZiBkF41thqlaeJ7gQmqe90FaqKX7hDK44FbZ8aDI=;
 b=arSxaBOgvKikJAnFiX9zqatzZljt7WRaoJBMyWNMEK+q9fFM5KjCPun9fFrXJ34QwV
 TvJ9+Os2kTf4KoTyIcfed3rlM7ZJ8wJRkMadyVCxK0pT+cxzg9DgcVaKjA/krecy8ZKc
 3qe8N6iXAyr+JZvTUTMArFdFHbVs/W3pvP3WyOTWxHRE5SniR+EsrKPu8mRHfLQFmyYO
 E3xtl8rltK3jBX8iZZvQgMRbJ3Nm+EqNg0fw//m+R1tRnnQWwFlJm0V8K6xAmpuTRJ/9
 EH1fqdYsyCnbz+uVD3ioY5H3p0oN/6xKQnJGGMbBLQpng7wZOP4GTt21wsPCQYJdQOsz
 DM5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXssDFAZlHlBW6fUvJfFzKfnCAdQMdsg3oyMjeTr67Z/cmDI+1k2Z06VhTBXUn8shtd8ZMZ5tpVP4qz560vEFxdLPdQ
X-Gm-Message-State: AOJu0YxHzNz8mKk6d+jHUkTvR298+hXPGOgxyYvLP4itxgZ95ABPxnzl
 VZ15ofe7XcIk3sAuYZ9Absp4q//WFxjDTBQ8ByHoXOCtWmb7Vy8C+Mcu8sFSbVos/iG1Hf5BAUi
 0hRt9FaAx6lHJ7C/IB/LHQM06rxhj1vXymmbnJw==
X-Received: by 2002:aa7:cd52:0:b0:58d:77e0:5c17 with SMTP id
 4fb4d7f45d1cf-594ba5a033bmr4630024a12.21.1720692389484; Thu, 11 Jul 2024
 03:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240709000610.382391-1-richard.henderson@linaro.org>
In-Reply-To: <20240709000610.382391-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2024 11:06:18 +0100
Message-ID: <CAFEAcA9_3512Fs36=dCFZ2RwsDLwa-gT3U_+pUxbpZA_s0O4JQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/6] target/arm: AdvSIMD decodetree conversion,
 part 3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: J/tQWvuKtyOY

On Tue, 9 Jul 2024 at 01:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> [Sorry about the @qemu.prg typo; resend for anyone replying.]
>
> A small set, but better than waiting for a larger set.
> It's a good stopping point, finishing the convertion of
>
>   disas_simd_three_reg_diff
>   disas_simd_scalar_three_reg_diff
>   disas_simd_indexed
>
>
> r~
>
>
> Richard Henderson (6):
>   target/arm: Convert SMULL, UMULL, SMLAL, UMLAL, SMLSL, UMLSL to
>     decodetree
>   target/arm: Convert SADDL, SSUBL, SABDL, SABAL, and unsigned to
>     decodetree
>   target/arm: Convert SQDMULL, SQDMLAL, SQDMLSL to decodetree
>   target/arm: Convert SADDW, SSUBW, UADDW, USUBW to decodetree
>   target/arm: Convert ADDHN, SUBHN, RADDHN, RSUBHN to decodetree
>   target/arm: Convert PMULL to decodetree

Applied to target-arm.next, thanks.

-- PMM
