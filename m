Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1350203lfb;
        Mon, 19 Apr 2021 10:08:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdUzmH3MvRFppIeWoH0baId73k7txT5qN3EIMnr5TsZTYRGpLKt+lop3/urlunE2HqKoWk
X-Received: by 2002:a5d:8441:: with SMTP id w1mr14719339ior.210.1618852136833;
        Mon, 19 Apr 2021 10:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618852136; cv=none;
        d=google.com; s=arc-20160816;
        b=hfd3jZqef30kYJbqXS00x1b4/Wx+iDE2zUV+MgGdLowl1I44ZO7c2+hagnsQ7qhzW2
         E6/Oyf8eMQwd5sGN5+MSZDpdbpmHsOE6pAW2pO/yxjqYPuKWJytVFjB6ZVEPZ2h0Its6
         3RZSLgskfUkgzaA41Fgzxpkan0po8W63eZsxfwahk9/qot+BmSsAz/Am9HqrpxFMRxfj
         15XoEPGCUZESn8S0b4UrPU4hTX2x3Hk0Y03eASELFOJzkgbYTmuk1we4+L75PprEfJOw
         XMrHNQ5aeP/0pp9llTLYzZMXeGaLeqUTfPUbxAQmyamLAEKHBzOXo5cHCnbQ7AP/Tyuc
         iOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oAn9amGfCH83/LG4t5Tb6rivYO6zkUaCgSw8hnnqvxs=;
        b=daigme5LTRIGud30gtpvc6aargmizzP0wFYfBQzz9eCrG9bTjskIo/BfJpV0CLWN5j
         XclIRnh3lBxN0FHQzkXzILmdjvbcn4QCGjTbCJk1AfFcCZKGrzLr3VO5JwGD5w99bERL
         3QoU5yQcddMsqQilYNOTRX4vykLVM0HNZID8hIIMQPoP9gHCQMi4GWB3Ew+OP7LCbPKB
         rnpb4gFPUKj8uWKj56nKm8PQqawnS9mgZLv3cGh5sfiJWjevZmkISytFSSVreddtqDi1
         1y/b8fVhJfmsh/uIlzRV/bkl2MGEG5wem3glRcbcB9RccbMByaQ6v5zGqVF3Spf9ebVN
         j8XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L4A7nczM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i26si5680377ioj.39.2021.04.19.10.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 10:08:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L4A7nczM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYXOK-0000cI-3W
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 13:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXNA-0007SY-0L
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:07:44 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXN2-0005ZH-Jc
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:07:43 -0400
Received: by mail-ej1-x62c.google.com with SMTP id w3so54106614ejc.4
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 10:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oAn9amGfCH83/LG4t5Tb6rivYO6zkUaCgSw8hnnqvxs=;
 b=L4A7nczM8upmsFsVmZoN7bDaV1lILmMMl4YMXCWusj6+rgLwG5nvVCqfuiFhwi8UPi
 k6wGLaNnv38nfzPgVJQyT2PpniOBTVkWIz4Mxl6wb1sH/r3C6eNx5e70Ab0E4eOWMcw9
 QOA/U2jSiFuCo5gPwCSC743+OS6MCpaxKONmZqEuaqWqtWr6MRQnQMdVCZDhVGjjdV4p
 KlZe/fx4wbLK210ZG/g+h55RVZwkIaAKRO8RMG43A/BD4FiCW5IOn13MJ5/jwiJxUMwV
 PZOk/tFuxCwGVYbzkF6t8CNzm5BrP7EdAHrQ9ruWaVhsEtSzSC4hx90APBRAjXjEBflO
 VN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oAn9amGfCH83/LG4t5Tb6rivYO6zkUaCgSw8hnnqvxs=;
 b=ACiEN+dehqyMljCgJYsPoSai7SaUkqn3p4vsynFcBAlcG164W1gj5leTpgfWV39vh6
 GRYKzcrQtLCgrchkZAdsE/Ncqqj4BlMosiXOYUmInnXqyzXT8ujb3G57mvttTLnhoESr
 GW/Q/m4J7KSfPZpIn57eBSAzx60tjx/t96QiifCeAd59A22FYABLNlxX0+9gnjmXy9FF
 byJBM3hIz9uimftT1M45ZfUeKEZxGrdBj3tJqK6laMsUKTBtuUr3NrPghw1OJfLgLSmM
 CSNxaiETqeaBX8YarlqfuM5h1l/3/ugOdG4mhmRtRoefK/Fa+v7jGl26JBbKagamQIHb
 uWdg==
X-Gm-Message-State: AOAM533Wq45COGzh7bmPfaWcHzFyrWMscQQJARfbkgTgN8xBAW3QL/JJ
 k41D0PuQjqt09U05wrmDiLip7ZLnmXfA81Ivo+3AohfYIXE=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr23050887ejh.4.1618852053982; 
 Mon, 19 Apr 2021 10:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-6-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:06:42 +0100
Message-ID: <CAFEAcA9x_bZw5KfSOjgwqV0my5gbSUOtO4yVgA3ruykaDqdHiw@mail.gmail.com>
Subject: Re: [PATCH v4 05/30] target/arm: Introduce CPUARMTBFlags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: aTCwstqutgnN

On Fri, 16 Apr 2021 at 20:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for splitting tb->flags across multiple
> fields, introduce a structure to hold the value(s).
> So far this only migrates the one uint32_t and fixes
> all of the places that require adjustment to match.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 26 +++++++++++---------
>  target/arm/translate.h     | 11 +++++++++
>  target/arm/helper.c        | 50 +++++++++++++++++++++-----------------
>  target/arm/translate-a64.c |  2 +-
>  target/arm/translate.c     |  7 +++---
>  5 files changed, 59 insertions(+), 37 deletions(-)

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2769e6fd35..9070b773a9 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -12984,8 +12984,9 @@ ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
>  }
>  #endif
>
> -static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
> -                                      ARMMMUIdx mmu_idx, uint32_t flags)
> +static CPUARMTBFlags
> +rebuild_hflags_common(CPUARMState *env, int fp_el,
> +                      ARMMMUIdx mmu_idx, CPUARMTBFlags flags)

QEMU coding style doesn't generally put a newline before the function
name (here and below).

>  {
>      DP_TBFLAG_ANY(flags, FPEXC_EL, fp_el);
>      DP_TBFLAG_ANY(flags, MMUIDX, arm_to_core_mmu_idx(mmu_idx));

> @@ -13228,6 +13232,7 @@ void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
>      int el = arm_current_el(env);
>      int fp_el = fp_exception_el(env, el);
>      ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
> +
>      env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
>  }
>

Stray whitespace change.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
