Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp626380ejx;
        Thu, 3 Nov 2022 06:20:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6GvpY5fBhYOXMpN1eJWQVIgj1NWqQ5UtI+yqo5Z2YbNBpH/jfo1hlRuYEPy3a2vDMwqduy
X-Received: by 2002:a37:54c4:0:b0:6f8:a038:31d2 with SMTP id i187-20020a3754c4000000b006f8a03831d2mr21202362qkb.297.1667481640717;
        Thu, 03 Nov 2022 06:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667481640; cv=none;
        d=google.com; s=arc-20160816;
        b=ug9nIdU7JjMXgYg0kuOiWdo5rvgyR8cOW+Izf1LEi2Ilwh2sGWUiIM3uo6niEYrmi6
         HvaDJjI19VY9D4eQH+IWKpUWqfE1IP+rsXVSw35OzICaPTXnD3wl7TCVWEQTmRiGMBy2
         AhFlj0Qvwj4St2i6F5lB6hOgu5o8Io2alcI1mTerZPvup5YxLptuv3zbFBAfopIeXZMT
         WuH4B54ojL1Ca+gwICMVbvuddR+QLERAQrjHkG36dR6URA0UfVy78iAtY7BRf/INeZ71
         SHXAUbcorPz/icqTIpMaSCJHJdVV1U+HXSf4gpC2S0Ya2K5HJpR13X+CnwWUCRA0PwsD
         6vCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ezwB6d/NfOuXPPN2TYdCBqEADrtBcpsZHstC0C/etBM=;
        b=b1q3eQjbpmD22MUBMWTYixvmYrNoJOmRCs5w1kJAy9Kp36fqvG5y/5hIsUPTstZ8Rg
         UGOLeS9eiX7oIpEOmsGMYzwNd5bQPSuGrDZzDPrJ/7FMZ2WbGJg0rwhlOt/ESXqtRo1Q
         1QpJDsgxUn28ufT6eqElmZ6wdNdxe/AM4inogL6teNaBDyZzWNSs+iYXBDHFEzXV7s62
         6i7yt9i1vThtleB4zpIZwvPr5RoCUjSzwonCEfEa127yruv6eLgg6fupkeV8KU0Cm6ov
         XNWCPe73kg4Wu8pep7qXoavaRaHpcS26k7VO7X5aFZaOBAYI8Mokqd/EMWuTRyCfO3dN
         8fWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSGwG1nn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl7-20020ad45e87000000b004bb96cb4e6fsi411230qvb.95.2022.11.03.06.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Nov 2022 06:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSGwG1nn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oqa91-0007Cy-Fy; Thu, 03 Nov 2022 09:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqa8P-00077F-28
 for qemu-arm@nongnu.org; Thu, 03 Nov 2022 09:20:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqa8L-0006zy-6c
 for qemu-arm@nongnu.org; Thu, 03 Nov 2022 09:19:52 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso5135476pjg.5
 for <qemu-arm@nongnu.org>; Thu, 03 Nov 2022 06:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ezwB6d/NfOuXPPN2TYdCBqEADrtBcpsZHstC0C/etBM=;
 b=vSGwG1nnivneckyOD9e+3CaijpCxbubs4RKwNtqAcgGyO9TN22VpUV9PH2HEa3H4D8
 o4q2xGAP1PGafP7noBN/AhlZDUzFzoFuEL7neoVU4RkDeQuXQmxbY+Hp4Le2NpECUs2x
 EjMW66u5jgRtwzIcIqmfwnPBMvW/Bus5OTNzEKj9bOyFseLjKoA/YGg87h8ecXgS7UYP
 vpvSG4bYdK+fFnpzGgduhv8KlorupMcdkt4bsmaetD6vdRGQ+13iRQBCv+aTX/bHhGam
 ePutM9yzF52nJlQu5E7fKdOuXnmqMvKvLxciWfZSGOfLfB+B1ii+PdgXO8J++7gz2Jeu
 DPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ezwB6d/NfOuXPPN2TYdCBqEADrtBcpsZHstC0C/etBM=;
 b=BfDCJ04yRLkPicxrTDkBxn/uYCY468aDqb5TFBNl122vpxqbxL6UKCiv3HAhuhG4hH
 aDffhqoytmqMCTzNAS31P+du21f5CvAT/FjAs8FKm0JbfHROCyQs03u7Wrw1BndgftVw
 57tqnXdMWu5Osb9SrHb7G9u+QR9dIsppLr80B6vaWEq1BqfHUYdSOcRgLiDNV2LW02gm
 u8VQPzkzp9XEU1V+zxQU1Y5mzMHiOEAv+GD6MMv9AzgU0XFELE5vq7Y5Iegmv5M1ZwLw
 9VtKahT1vzES4P+oG1AkvxFhH/JHVGgOCCxLPef87T0Vn6ujxv2Qhd2UgtEnmn+8A7eP
 pn3Q==
X-Gm-Message-State: ACrzQf2WZU38gDFKEfIkTLxAw2anKt3wFhpz/4+lK58PhOgTcQSaxUky
 gyNVsYrwme/P3/buVeZjfRYkE4Z2C7ciSMSrkCPYGA==
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr30189892plb.60.1667481587866; Thu, 03
 Nov 2022 06:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221102054706.1015830-1-richard.henderson@linaro.org>
In-Reply-To: <20221102054706.1015830-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Nov 2022 13:19:36 +0000
Message-ID: <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Two fixes for secure ptw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Kr0VGbTSedU0

On Wed, 2 Nov 2022 at 05:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reversed the sense of non-secure in get_phys_addr_lpae,
> and failed to initialize attrs.secure for ARMMMUIdx_Phys_S.
>
> Fixes: 48da29e4 ("target/arm: Add ptw_idx to S1Translate")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1293
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 58a7bbda50..df3573f150 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1357,7 +1357,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      descaddr |= (address >> (stride * (4 - level))) & indexmask;
>      descaddr &= ~7ULL;
>      nstable = extract32(tableattrs, 4, 1);
> -    if (!nstable) {
> +    if (nstable) {
>          /*
>           * Stage2_S -> Stage2 or Phys_S -> Phys_NS
>           * Assert that the non-secure idx are even, and relative order.
> @@ -2671,6 +2671,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>      bool is_secure = ptw->in_secure;
>      ARMMMUIdx s1_mmu_idx;
>
> +    /*
> +     * The page table entries may downgrade secure to non-secure, but
> +     * cannot upgrade an non-secure translation regime's attributes
> +     * to secure.
> +     */
> +    result->f.attrs.secure = is_secure;
> +
>      switch (mmu_idx) {
>      case ARMMMUIdx_Phys_S:
>      case ARMMMUIdx_Phys_NS:
> @@ -2712,12 +2719,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>          break;
>      }
>
> -    /*
> -     * The page table entries may downgrade secure to non-secure, but
> -     * cannot upgrade an non-secure translation regime's attributes
> -     * to secure.
> -     */
> -    result->f.attrs.secure = is_secure;
>      result->f.attrs.user = regime_is_user(env, mmu_idx);

Do we also need to move this setting of attrs.user ?
get_phys_addr_disabled() doesn't set that either.

thanks
-- PMM
