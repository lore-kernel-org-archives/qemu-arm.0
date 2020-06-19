Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp641446lfm;
        Fri, 19 Jun 2020 07:29:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhRqZcf6YSLHCqwqICEs0t2HZxZk+T2Mqcntdbb9tXqla7ItusLG/HR0wkxJ5Ocq7oUZtC
X-Received: by 2002:a25:606:: with SMTP id 6mr6862670ybg.308.1592576962926;
        Fri, 19 Jun 2020 07:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592576962; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQ6eUGx68w6kSo25t5wtuU1F1Z3GoOUkxF0jR4M28fEFxwAKOtVvfYj05GTaufeVor
         yt2TEUJTXB+F8GShKEBHZyC/wc7N+GdQkzUAWsLmzGg7tUMrwYZUNRu6h3AKSypDImQB
         qoVIXyvSvK7wbX9aodfCrGFTWM791IzD+J0tB3Luwg/ToiIgjDAoCps3OYimxhfiLc/c
         odUPv53igojGanrWR2C27FL8iGLOUOR0Q5MaDGiZ2lMp4oChzRIlSGnRqlTC7ziRzdCl
         lxJ30FFF7lLt1GEAzHr/cCvFdDjY9etpISp7ayMCtdKVzF37GnEP2IFqAFBS7/tI7o2C
         R+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C/u2JsRLnjfBBA/oPMPI9i9jHqou2+oqY4hgiT980OU=;
        b=Vs43djafECKqZqSb8t8sifK7l6cQzDn4o5Q0R5UHCsHmvG57v/lgUS4nBGGQqan6uA
         AKJiW3T0lb/aJ6qB0z0nYscbqGlUCctKDEiOEqv+KmRSl9VM0gHTRhsTyIy/Y4y2f6gU
         7zqj3g9JXjy1vDNeonZiUgKiOhWR+NKXyobzQi1yhxt1PmAJbK89OJDLINpjy1c3GJXR
         5HhrO8F8+1SgrIA6yr6r9okD6taPXcZm1gy6STvGV0Pe+ASBM1Bc2STGl9SC3VpLjTvV
         kz+lGjMSme683tGuMOU80IYCeqe8uyPL3iMLcUC/6OJ2cjHNLDT8YtsQ1+8BBD+ETRhB
         0nHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="S8l92pD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a143si5432055ybg.28.2020.06.19.07.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="S8l92pD/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmI1C-0000SY-AY
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmI14-0000RL-UI
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:29:14 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmI12-0007tY-4n
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:29:14 -0400
Received: by mail-ot1-x344.google.com with SMTP id 97so7427425otg.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/u2JsRLnjfBBA/oPMPI9i9jHqou2+oqY4hgiT980OU=;
 b=S8l92pD/hBGIYstZqH2eCF2swpDSSaSL626ar4Erb8GyMTdrQEffnLqqRgGJUWULtB
 h1N4e6uasgEOFHdzyAb7M9rOLv2EKmHmfcWWC9TnIDecPV3jpIinzX9Kh95sWvGHgGQt
 3SKowalgS9pp+sNo7Cpvpi63gsomb7LQQPHOCuSieHVzVMRkaHcZa9YuC0yoR+Hz8s9Z
 68aqV7jqnpDeW/maHrUlrojDTE15aQp8DzwHlx376YQ3CkQDEPPzFLKV+0inTpDgTj+u
 7Cpt3c3uYe7JPWyJ5eovz7UbVhyQNYZfp4L2WvBO/ljgdlPNvcdd81wAAmNCmq3PJS/a
 pHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/u2JsRLnjfBBA/oPMPI9i9jHqou2+oqY4hgiT980OU=;
 b=H/SscDphO7ptL1SNs5LQtF+4fnoITXtytJCNqoX/MY2Ko08wb/AEbNeUDTixFO9DT1
 mki3C9d1sW0x2+khXoiF1TFTlGVUeHvPNmiCO4PXHULaHqhwwUfpD38GzjzmoyMagntl
 P4zJP7zapf7vG9+8y9pmJZf5spUgjrZi+mfFR3SsGx4I6fpOnETM5p8PWktoeTDwNCv9
 55ymU/Ue27i9O3T8K/AfckVZhsHtRiNsj2D9Nemk0FRS3579KGWViIXuMNW+OkFwQbtA
 Js+yVtTzj4RpZF1EbfFSKuY2zQ/Qu0sbwRKz7jIKrklRcIoO8zac3rmxc+MjrHrulsGK
 B9HQ==
X-Gm-Message-State: AOAM5303MHWsrgHY2tg/7dKnUL5fId243SGqswi89CDtEudeTS1KgTNf
 uyGHC+lOFHIkT0r7dLf+DwMdvxjbK8w+OEoBD/WBgg==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr3186042oto.91.1592576950778; 
 Fri, 19 Jun 2020 07:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-41-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 15:29:00 +0100
Message-ID: <CAFEAcA8zBPh8T3J_=LAg2CNWS4nZC+iGsR053yXtd78gSoma1A@mail.gmail.com>
Subject: Re: [PATCH v7 40/42] target/arm: Cache the Tagged bit for a page in
 MemTxAttrs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ULLuaFjX/1l

On Wed, 3 Jun 2020 at 02:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This "bit" is a particular value of the page's MemAttr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v6: Test HCR_EL2.{DC,DCT}; test Stage2 attributes.
> ---
>  target/arm/helper.c | 43 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 50717afa4a..74925010ea 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10875,6 +10875,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>      uint64_t descaddrmask;
>      bool aarch64 = arm_el_is_aa64(env, el);
>      bool guarded = false;
> +    uint8_t memattr;
>
>      /* TODO: This code does not support shareability levels. */
>      if (aarch64) {
> @@ -11099,17 +11100,32 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>          txattrs->target_tlb_bit0 = true;
>      }
>
> -    if (cacheattrs != NULL) {
> +    if (mmu_idx == ARMMMUIdx_Stage2) {
> +        memattr = convert_stage2_attrs(env, extract32(attrs, 0, 4));
> +    } else {
> +        /* Index into MAIR registers for cache attributes */
> +        uint64_t mair = env->cp15.mair_el[el];
> +        memattr = extract64(mair, extract32(attrs, 0, 3) * 8, 8);
> +    }
> +
> +    /* When MTE is enabled, remember Tagged Memory in IOTLB. */
> +    if (aarch64 && cpu_isar_feature(aa64_mte, cpu)) {
>          if (mmu_idx == ARMMMUIdx_Stage2) {
> -            cacheattrs->attrs = convert_stage2_attrs(env,
> -                                                     extract32(attrs, 0, 4));
> +            /*
> +             * Require Normal, I+O Shareable, WB, NT, RA, WA (0xff).
> +             * If not, squash stage1 tagged normal setting.
> +             */
> +            if (memattr != 0xff) {
> +                txattrs->target_tlb_bit1 = false;
> +            }

Can we implement the effect of stage1+stage2 attrs on whether
the memory location is tagged in the same way it's described in
the Arm ARM, ie by combining the stage1+stage2 attrs and then
looking at the combined result to decide ? In particular, this
code works for the classic attribute-combining logic (where stage2
gets to override only in the more-like-device direction), but
when we get round to implementing ARMv8.4-S2FWB then HCR_EL2.FWB
will allow the stage2 page tables to entirely override stage1
so that we might have memory that is tagged even if stage 1's
attributes said it wasn't.

Currently we do this attribute-combining only for cacheattrs
(the combine_cacheattrs() call) but we could make that deal with
more attributes if we need them for this purpose.

thanks
-- PMM
