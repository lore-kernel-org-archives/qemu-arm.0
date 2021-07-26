Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2743047lfc;
        Mon, 26 Jul 2021 03:59:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2vMPEDBfAQj4qZJIGhUnRtxysGSEuqpWU6SaMQssLP3HYAjP94p15ObWjTqazPUPGgwHT
X-Received: by 2002:a05:620a:16b2:: with SMTP id s18mr16973437qkj.446.1627297140852;
        Mon, 26 Jul 2021 03:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627297140; cv=none;
        d=google.com; s=arc-20160816;
        b=TOAig0wejRjsGjMsNYs525T5B+YEDPQkptynXL3cxUK+brlaQpdoL2LYZhBfxWn9xp
         RDvHr2wor9EyHpbjlqSoB+2n9qcdQmdLrp4wTWEFKjeecJnji7ZEj1fKqjGXVN2q8YR/
         oQRCGpYntzNqAa8m3VhfdqZZ1E+RfBuHf0znsBoBEY/JG6Vxsq4Nu7OaP2qXATH6hfUy
         8TvyWalleh4Gx/NcehB4mJVkjrGT34Bc1zjFXKORhGjili+iaYK0ng4rB77WBRiYvNly
         sLT3yDUcQEIt2cMTauFlmt03QvfIqvt+sLtraUuUKutflf5Pxq6p9osgVS77UT9oNWCJ
         MDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8SwKjOO8BjFaUhzND46a8R8MOCw0txwo5331iV6iddE=;
        b=U6F3KMjg5aQzQ83RGNEURTd99PvQTgnnaIEIPjMLU6xzBXF75vI4ID3TxC5HYu+xtK
         mqZbNx2rtFU1rklaO/IubwRP+GqsboyCPBh7OOIj7y6O73rpKh+8IkOTNcq7173enjVI
         fwZ6Ahu25w6gVgw+Rwl1mT9mfmJ1Cx2o6MhSmVsan43DN0mAqGh42TUDhqqiP4tJVxby
         f8wp/enNtcLMBI/hTmrAveGA24cShgqbkZ//7qZ/XsrzOMlTOmudAxBshn5K5BAd6P69
         /DSj4Ylo02KfQNfNj2PFWzPDXBGpuHQ3G9uKWlYamRe4vREXA3Ih2plmfnUYvZeB7K7P
         o8HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eglba7Gf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si26796183qvc.85.2021.07.26.03.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 03:59:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eglba7Gf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m7yK4-0003bN-73
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 06:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7yIx-0002Ln-Al
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:57:51 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7yIv-0006z9-OL
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:57:51 -0400
Received: by mail-ej1-x62b.google.com with SMTP id v21so15878425ejg.1
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 03:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8SwKjOO8BjFaUhzND46a8R8MOCw0txwo5331iV6iddE=;
 b=eglba7GfqIaR9TTttvYEAaL/EdgGJEWQY7ebQvx6t8TosjhJfmm3JRxN4E+oSDEImo
 vuUs/pT411EpaKaD9WiH7fVLr4eCxHrhny3F1OZ+sUENybkNODBK2VVWxO1P4Juv/Tce
 yCPIaUKXdH+JSUmm+NH3lCik5+lPE5rmLT0/Yv+1rjyHVCn9GrIqOzZ4amwd5MpXNYzd
 ZnVk0tcvuJoeF7bTzJmxo6ZpOpPyra+OLYMgDqWfDwCsQqTKKB3sv9CSOzoWXMwU//wd
 5OeJWfFpg9aSroFnxdnMQ6tV1Q6hN67ex0VsobTl5qEjlHnJAcYV3I4ep4CpwZKjC3Tj
 MmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8SwKjOO8BjFaUhzND46a8R8MOCw0txwo5331iV6iddE=;
 b=ssdet5aOBCzZhcr2yrNaQphpt2IgRDWVe8EtiETl0EbpPGeT+F5AUiSEJRQD53QZ/j
 nYqEeNLkyvbHog0g0Jsq6BwpE+JvXQLj6hPBLdrBuNOrH4VoBoJ0Y1+7f0Rb5kzyKyhF
 8IXPeVTl4SCC0ZeX2cfDKULVH0RPsmQuaRskyoReQAifSkqsVdFD3LhArGEr9UOgX1dQ
 zxmDUzXylwOwy/RdlzRbc2egZQXa7Jn0qZR1Gf0ovY2BbnxfL52SE/HiOQ0VTbjDc1ag
 FJPGAl7MhuF3lkMfvWr22FKq1zktzecpmJjEFjo1dUlS7dHlZLE4acnYGvFj2MmSHQ/e
 lfjg==
X-Gm-Message-State: AOAM533bHYdzdHYPRL10rsrfK34msmEGlC3I9iu4NaLODkTYIBv6Y9Lo
 HO0MT+gHM2YHpdTPqlJqTTqXJPZVpduBwhFEDP5U9Q==
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr16323358ejc.4.1627297067576; 
 Mon, 26 Jul 2021 03:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <20210723203344.968563-2-richard.henderson@linaro.org>
In-Reply-To: <20210723203344.968563-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 11:57:05 +0100
Message-ID: <CAFEAcA_EVQQWN-pzBEr8NVsN0RXftJF29coz-hM7xQYwA=N5Hw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/arm: Correctly bound length in
 sve_zcr_get_valid_len
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8pQhZ+MLVnl7

On Fri, 23 Jul 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Currently, our only caller is sve_zcr_len_for_el, which has
> already masked the length extracted from ZCR_ELx, so the
> masking done here is a nop.  But we will shortly have uses
> from other locations, where the length will be unmasked.
>
> Saturate the length to ARM_MAX_VQ instead of truncating to
> the low 4 bits.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
