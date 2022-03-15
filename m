Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3072785lfo;
        Tue, 15 Mar 2022 11:22:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR+GsyLTTroWUX1XjQyyk9WWnZ8jMy50G0cNm4nBagq7OKT1TTO2yAGBOQymr1b+TiZt1w
X-Received: by 2002:a05:6902:308:b0:633:73dc:8e7f with SMTP id b8-20020a056902030800b0063373dc8e7fmr5032597ybs.424.1647368527489;
        Tue, 15 Mar 2022 11:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647368527; cv=none;
        d=google.com; s=arc-20160816;
        b=moMW4L+DTzpt1C0Gs3V+WN8MSILeOEnOGUvU2O5bGAWDdkFnof6chgmsDdIK/I4whq
         795LPAErU5qJaPVDT8tLC9PzybTWuMXM4r1hrEXFQsSlrxdZ4noeoYfkS8DizwDLA0OI
         /Tam7U2YiG/K5/bcUnHwYJhUqWum2j0+rntKdPhbAUykfetxMGV47BfZ1qguJ/TjP9A6
         VL1DOY9s0i0cEfSdsYAO/S4S66XqC5gxGm2ASHR8bJBkDS10snn4Tjy6h1F/zAQE0VYb
         CjVWw8zQvR/Xo4mcr65P0RihCyjQacEZ3dJkN7ReiJoTXCmkD85tVMcNDpSmihAh+Q/n
         oUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6grNoADTT+T2yahG9oP6AWYgykkuuTYI1in4uTHk5t8=;
        b=FcrTPS1gKrllVAvECT3NVcoelYl2B4QdwSRAJOQWQ3UfAXOPDQNCZaNzCDC3SyZzlq
         EQxJObXPh9WzZCZQCHcvDKMjHLklDZFhPhdcvpyiZLxlVcHLQo9kln9X41Be4JcMCXbT
         M0URY3O92t8a5hSRW0eBibv3Q+YUBuHiiP+Jg6ClkdhguBZPv/sHDTOiFIPv0gpv0Ph1
         syr4SP6htOCLGeZUV11Nb+2/o2mP4Mw88gj3o61IgiwM19ybrsSuqQPlUEj5mNUX+hhu
         LXxNYvQR2nlSEnmKfbyvueWMMwFGZJ9Z9j1fgZ0g0YJ0HYa/7p/lFH2lZJNXklXeTYr1
         gl3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PbKAEF3e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 131-20020a810b89000000b002dbc58ed3d0si11674139ywl.124.2022.03.15.11.22.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 11:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PbKAEF3e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUBo6-0007ML-Mi
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 14:22:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBl2-0005gl-Gb
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 14:18:56 -0400
Received: from [2607:f8b0:4864:20::1132] (port=43447
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBl1-0001mB-38
 for qemu-arm@nongnu.org; Tue, 15 Mar 2022 14:18:56 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e59939b862so15820237b3.10
 for <qemu-arm@nongnu.org>; Tue, 15 Mar 2022 11:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6grNoADTT+T2yahG9oP6AWYgykkuuTYI1in4uTHk5t8=;
 b=PbKAEF3eK/DGOeYjkjDWd82Uep05iZ2KpXGY2WKWEytv17J605XopyZGqbGPLIy8QZ
 2LTArJ511DOb6EZwehnfMlA6zvBcca5hGJdZvINkQS4BdGKmIJa2DAPFnbyFlvGPKfml
 gEmZelZtgIKaiUyXer3WxrIdg5igxF7xSeuRYHPmnXpXbd0Jzdoef3TlnI2lOVMslDXE
 CpCqrJb8Cc/OdPpqShFv+kojBhLm0irSWB9iT4rpWAqAAPjr9NQxSc2DLcL2/LICq1nM
 Ctrty064DmLlYBWv0HyjQ0+blu0yiPMcmdSvGhQLgsuFOycMFVB/FwCXqyOOfhW8EBNb
 hLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6grNoADTT+T2yahG9oP6AWYgykkuuTYI1in4uTHk5t8=;
 b=3sL+4NEvPv73qk7zRlyhbKE6hJX4YZUmDSf5MY/Yx2Kmy4PwlnGZnt58fXSDUXxkAb
 HsK7AkjZSSOD/E4YENey2eAkLCzX1JE0ojgh5xeywpuNnOX/9OUMivBZTqmitlmJ2JCg
 8+imuhrlDc2rtzGHZrw234yWwMefY6K4uM5uH+JYYm3JhvP927aMPMKJ5fVV4SBNmKqp
 FyOXl0l3Z/kUPjXDKSYd2LumsxhbObZbUmL/05xtoUIKufxnndq65j0NqGHsaY/y4YOj
 yc/Y3N7ZxCn+0gG1Nbte4eSfCpzDkfX5EmoXr/rASBAEH6ikvo3/oHCFoMATtCWVgLd7
 nF1g==
X-Gm-Message-State: AOAM531IF2sCKb8vYjzW1pSM9eHUr/YrhWlxmlqLP3J/Xs+0gHZ4sxWq
 q2b6QNbJjj74vSBttU4Q7gk5bPoYw70Hc8yTIZZx4A==
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr26887036ywf.469.1647368334020; Tue, 15
 Mar 2022 11:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-4-richard.henderson@linaro.org>
In-Reply-To: <20220314044305.138794-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:18:42 +0000
Message-ID: <CAFEAcA_8vJOJBatwFiX255n3HgTBBhCtiquGfJ8U5ryuL+-v0g@mail.gmail.com>
Subject: Re: [PATCH 3/3] linux-user/arm: Implement __kernel_cmpxchg64 with
 host atomics
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7G1240va+O2f

On Mon, 14 Mar 2022 at 04:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> If CONFIG_ATOMIC64, we can use a host cmpxchg and provide
> atomicity across processes; otherwise we have no choice but
> to continue using start/end_exclusive.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> -segv:
> -    end_exclusive();
> -    /* We get the PC of the entry address - which is as good as anything,
> -       on a real kernel what you get depends on which mode it uses. */

This comment about the PC the guest signal handler is going
to see when we take the SEGV is still valid, I think ?

> -    /* XXX: check env->error_code */
> -    force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
> -                    env->exception.vaddress);
> + segv:
> +    force_sig_fault(TARGET_SIGSEGV,
> +                    page_get_flags(addr) & PAGE_VALID ?
> +                    TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR, addr);
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
