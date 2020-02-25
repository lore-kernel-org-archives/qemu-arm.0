Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1615665lfg;
        Tue, 25 Feb 2020 04:23:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqztYkIzpdFIMAmx4KdQGEIHZkwuJ6JAcBk9uKpSK1ZGfzKGTtQaLqlxftxfqRFAUBl+d81m
X-Received: by 2002:a05:620a:130b:: with SMTP id o11mr29415276qkj.444.1582633417923;
        Tue, 25 Feb 2020 04:23:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582633417; cv=none;
        d=google.com; s=arc-20160816;
        b=tnW8dGOAXxiGpYWQrbk2bXKVatPho634Udy138qz+cjIRYUCD8IxwTPXfqCuE9TeSl
         04GaSSc22i/99ZwXtBoQow9iEI24JU4AOY/aRhgGZOvj3iQY72oNnKodLj0z2hnrsLCl
         7SeM0HwIP3VTBD4KrewnStx5zLMlrM41WJTU4iHfkFGb9+w7/0qRv7ygeufZ/gIKdjBI
         +hY4mT+2X1U3cUUJ9yMcIv6aFD2AuIlAoiT1f1g0BbPRcZrHrPOyc/YBfXXl18AXDBxI
         ydejj08lTGej7pGRjPkD/ZI53iyWMcVrEIUc663EOMZNUFjTPbQ5UY0V1CMalKMGMy3P
         b6oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5yEcJudPsSKynUdTsOA6q32GCiSnAoOzrKCJ4IpFVN4=;
        b=Nyy9maL/MXci0j0lw9eifOJjWbLevfnIwmkNhQHu5/2ZucKOS2eqAgyQOAd7RqkrpF
         Fccq5TTvPyItkoNVp4jPamStz6zV3VXe6uYVHJaDUXALRFAMIzDXMOZ30nDuEk436bO1
         KTlodRH9qfybxC/ResNW1qOSU0GqlF/z666k1vI0astxKTDVT6mZ1HtK0GokuN6LmSl0
         M62VOc1SX2ZUQvDzY61W0jsSN7QmvkI5u+UaBpOH/F+OUf/UUJIhTJAf6Lrwq4a02/Ml
         OVO24xEe6nWczVwaPkKpWPNbWAALHQDKeAirnOhdHgsf0F39dbmJUL4uWB1vqWj/GtfB
         haqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ncd/l9CA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si444961qki.325.2020.02.25.04.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 04:23:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ncd/l9CA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6ZFR-0007Cg-A7
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 07:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6YpW-0002Uj-3K
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:56:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6YpS-0003S6-1S
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:56:50 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6YpR-0003R0-RN
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 06:56:45 -0500
Received: by mail-ot1-x342.google.com with SMTP id j20so11846478otq.3
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 03:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5yEcJudPsSKynUdTsOA6q32GCiSnAoOzrKCJ4IpFVN4=;
 b=Ncd/l9CAT2rVt9Nsutg3JlLCh1Jf+Cb1g10T5dCWiA/pH4pGDfv5OdL6Nb+nkDmzOj
 /89/sGA3AAtVSNYmbF+QzPzbGfezFmBmYASUmsPZFMHZyNCWK9CiUKWGo9cy745uUvkc
 HTuUbD/fXtROjPHjRKMNEKbIxYB2xjiSCMYBh1g64h7zDWV3JNZAgxtrFaqT26Vq0ubJ
 AoSL1T2g/BMgPSvwjHZjlh3j7dQde3eTRw5qz0qxyCZ583I7fKFHStmKMS7WsYmVlfE9
 wJt7xhgraHfLYfmDwkHW3Vcy/XUTqqo6r+UNFRGN5+BdQ2iQXnEbWlB5z9Ugu8DPa44L
 QMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5yEcJudPsSKynUdTsOA6q32GCiSnAoOzrKCJ4IpFVN4=;
 b=q13SoBComWNC0RmZQ3H4HicD9KU+8CfZkFcEILaOQMzjMNHUN1OI/eeLmwZluOwNK0
 zD36kEbahZUNVARf9y44t0lKkvwKzhub0Z9aeEoGABDkv7iwGDQ5oOtv+nmKjntKxoSC
 kT/ga7ARealFxO2ZuFm9yojfmowsKmtUFHjl22WV4vzMC6Yo0z9dbQwyphiEBS/0VSDZ
 OLMwEbYwDpTMObrjXBBHfrcZr7uV8IZ9eoutT23PvvfOp0hoKyz/llMmD7eATpb0F0QS
 b9AW89mAknfE9Y6bPMOMgRYsHV/1fkdKKcdFFcabbyUQI9H4L/RdCsIho9jQQk7IRexG
 glBw==
X-Gm-Message-State: APjAAAVRMnKu8ubBfiym7TFmaTpFErAaluP3lw6ajEnEJRjjBAsVVBmB
 CLooh/iKdkKYMRlAl16EMSFfeE7sSnc2KaBOvya79g==
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr44674013ota.232.1582631804724; 
 Tue, 25 Feb 2020 03:56:44 -0800 (PST)
MIME-Version: 1.0
References: <20200218190958.745-1-richard.henderson@linaro.org>
 <20200218190958.745-7-richard.henderson@linaro.org>
In-Reply-To: <20200218190958.745-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 11:56:33 +0000
Message-ID: <CAFEAcA91aWV45=ozUbekqKzx3EgDm3kamkzM=tROdK7wMndx8A@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] target/arm: Honor the HCR_EL2.TPU bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HH3Qgp/DV5B1

On Tue, 18 Feb 2020 at 19:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This bit traps EL1 access to cache maintenance insns that operate
> to the point of unification.  There are no longer any references to
> plain aa64_cacheop_access, so remove it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 53 +++++++++++++++++++++++++++------------------
>  1 file changed, 32 insertions(+), 21 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ed34d4200f..21ee9cf7de 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4301,19 +4301,6 @@ static const ARMCPRegInfo uao_reginfo = {
>      .readfn = aa64_uao_read, .writefn = aa64_uao_write
>  };
>
> -static CPAccessResult aa64_cacheop_access(CPUARMState *env,
> -                                          const ARMCPRegInfo *ri,
> -                                          bool isread)
> -{
> -    /* Cache invalidate/clean: NOP, but EL0 must UNDEF unless
> -     * SCTLR_EL1.UCI is set.
> -     */
> -    if (arm_current_el(env) == 0 && !(arm_sctlr(env, 0) & SCTLR_UCI)) {
> -        return CP_ACCESS_TRAP;
> -    }
> -    return CP_ACCESS_OK;
> -}
> -
>  static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
>                                                const ARMCPRegInfo *ri,
>                                                bool isread)
> @@ -4336,6 +4323,28 @@ static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
>      return CP_ACCESS_OK;
>  }
>
> +static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
> +                                              const ARMCPRegInfo *ri,
> +                                              bool isread)
> +{
> +    /* Cache invalidate/clean to Point of Unification... */
> +    switch (arm_current_el(env)) {
> +    case 0:
> +        /* ... EL0 must UNDEF unless SCTLR_EL1.UCI is set.  */
> +        if (!(arm_sctlr(env, 0) & SCTLR_UCI)) {
> +            return CP_ACCESS_TRAP;
> +        }
> +        break;

Again, we want to fall through here rather than breaking.

> +    case 1:
> +        /* ... EL1 must trap to EL2 if HCR_EL2.TPU is set.  */
> +        if (arm_hcr_el2_eff(env) & HCR_TPU) {
> +            return CP_ACCESS_TRAP_EL2;
> +        }
> +        break;
> +    }
> +    return CP_ACCESS_OK;
> +}

thanks
-- PMM
