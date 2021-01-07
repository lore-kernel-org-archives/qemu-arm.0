Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp430002lfq;
        Thu, 7 Jan 2021 08:27:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJJug/nEQgSizeoNf84WvhFpti8azIWYMwftCIh0AwNVuCPs7rVCSBEeLEyW2cG5RHA+2A
X-Received: by 2002:a25:3206:: with SMTP id y6mr14636630yby.127.1610036824877;
        Thu, 07 Jan 2021 08:27:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610036824; cv=none;
        d=google.com; s=arc-20160816;
        b=o+drQtxwXQRlTC4bo3Pa7q+D/fq5teDsHv2aTh99rm264Ci2hZDd8c5KEE6ZoNIR0o
         C/925O50+RW+WTjpuawP9zYLBTTo9vZ8DW6rjJPTo47R0YsJQoiYBig4XkIjnufwI+nB
         Op8KCb58LXGy+AAvNvc6OAngbmeIaSzFuTg5JAshAFeqHe6oJZRZ74oF1Ym9gFkUk+Li
         ikuzI1Z4IihP77yYgyOCC4G6ubMCaKxSsHjQNuxHty/zFvzLdzEAnzE2me3zgjsZRxxi
         vJhitBLDknX9cfNvCnw1CRUsut7I862yJjhoY0ucWRckqek9K3pMa3bmVNySLwHeWvsV
         em4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oURt8cyDt5n8khhHPgTUbOfWdfzgKim0RhWxjUuNImI=;
        b=FkIHEpoOQm6mecaX5/3Q3zVePpKstvmY17JlBDX8mkAjjD1P77NFghGHN8Cw1yxGnM
         ct3mIf6lyaN3cnVSgykCUUxVLba33QhyZs9lF90MrCisERG8UFSrQ5Z63oAlgnKGaIdt
         PDf/1byKPja9OUf84+gunXusHK+ZK+swcnitJMCyopiwGsmZykq/Aosc1ANOsbiNE0Z1
         sEXx/tBBYon1hgKl9/CBxaDG4OoroMhSQEghiRSXD668uraGA7ybWeTurFZPdJWqGzRe
         /LOkmpDUqlvrGSfDdwbaWqNxUZorWafh3+/RkFdFuPha8yT6AfWgcavbD7JTey5Uvj/B
         N0cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UuwgodhE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c127si7454518yba.167.2021.01.07.08.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 08:27:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UuwgodhE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxY7s-0002zn-88
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 11:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxY75-0002zb-Jj
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:26:15 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxY74-0008H7-5v
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:26:15 -0500
Received: by mail-ed1-x52f.google.com with SMTP id h16so8294553edt.7
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 08:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oURt8cyDt5n8khhHPgTUbOfWdfzgKim0RhWxjUuNImI=;
 b=UuwgodhEhzsTNhCqzCFhxIrxkXKV0SEwZSJblv5m0B3Nh01tW+JrSq9GtKSFfjRB53
 xZKFEv6ozVEiwwQoTlZiirC6Z6MgaT1NzLpYJCLPK6Bu63nDX8tksj+DlkI/Hh8bBTy9
 LvsDcTmDVey05CH+lM3bdI5LFVkTkzEnBs3CKc+ciu3gosM5Dd9/q+X1KV8E8ufyWmKb
 Kf4ocF1ScKfQPdFk0FjNbPnZMow0p5AVqd6Jh0dc41XaJDX3CER1z73YzT4f314ePTcp
 iuzrV6zYnav5qihbsmfIvlRbqUre1wADKFwQtFHyw6KTuyNDWJ9iS/8eKHFsrynz8o0p
 IGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oURt8cyDt5n8khhHPgTUbOfWdfzgKim0RhWxjUuNImI=;
 b=nDP6WDV/eTTuc3HGeCSYp0ZduSEMbxMG8ZxLwNP831yo98v3cZJurUzdHBjjHOlyeo
 4PpZvFA4SWIREKHl7moMCgehlaBcuBDLvPUZ3bmMOaqnnDv33EIcli6Nj8ltOcuWx8Wi
 g/6lCzwv717IHiXbPUoNCHobmlS1k9U1P2KR8k2mwFxAcquTG0/97P1GPGFuIvNpSK5s
 YYsLrL03geLrgJ0K2BViWc0lWoTmICs/jai7XGYWJnPpSPujf7DEHJ32YIDgFBNoEMtv
 AN34tTH77oxW34Ck/uJc1vJ1pu7oBAKlHLGvSuJNliBb3gYRjApRuAiHrZB/6dHOD+UW
 +GjQ==
X-Gm-Message-State: AOAM531RR55BBj+6ucVJIveKPDDVB5/DrfWSiMtGWNUNqbHjUzjgGI0P
 zUhkNfwJAQ9cPcEEFwFtAm3TSuZYpNtTIw6wBIFYaQ==
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2308305eds.146.1610036772326; 
 Thu, 07 Jan 2021 08:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-15-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:26:01 +0000
Message-ID: <CAFEAcA_Wosffh-DteyDSqXdGSHMKeB87d_x5+acWw1h0xQ6xuw@mail.gmail.com>
Subject: Re: [PATCH v2 14/24] target/arm: Enforce alignment for VLD1 (all
 lanes)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: vBCmq2wtM/n7

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-neon.c.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Patch subject says "VLD1", but trans_VLD_all_lanes handles all of
the "VLDn to all lanes" insns.

> diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
> index 18d9042130..7cb89b18e0 100644
> --- a/target/arm/translate-neon.c.inc
> +++ b/target/arm/translate-neon.c.inc
> @@ -522,6 +522,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
>      int size = a->size;
>      int nregs = a->n + 1;
>      TCGv_i32 addr, tmp;
> +    MemOp mop;
>
>      if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
>          return false;
> @@ -556,12 +557,12 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
>       */
>      stride = a->t ? 2 : 1;
>      vec_size = nregs == 1 ? stride * 8 : 8;
> -
> +    mop = size | (a->a ? MO_ALIGN : 0);
>      tmp = tcg_temp_new_i32();
>      addr = tcg_temp_new_i32();
>      load_reg_var(s, addr, a->rn);
>      for (reg = 0; reg < nregs; reg++) {
> -        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), size);
> +        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
>          if ((vd & 1) && vec_size == 16) {
>              /*
>               * We cannot write 16 bytes at once because the

I think this code is correct for VLD1 (A bit means "address must
be aligned to the size of the element") and VLD3 (A bit is always 0),
but not for VLD2 (A bit means "address must be aligned to 2* size
of element") or VLD4 (A bit means "address must be aligned to 4* size",
and there is a special case for size==3 meaning "32 bits at 16-byte
alignment").

thanks
-- PMM
