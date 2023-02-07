Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5411977ejb;
        Tue, 7 Feb 2023 06:27:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/F2T1dVTSouOHygykvyPIX9GV6lxj+R8LbwTLHTNGoRVyhoJSlCq7lPNZ93XMSMqaLvzKu
X-Received: by 2002:a05:622a:2c7:b0:3ba:2722:e8d7 with SMTP id a7-20020a05622a02c700b003ba2722e8d7mr5343076qtx.7.1675780024506;
        Tue, 07 Feb 2023 06:27:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675780024; cv=none;
        d=google.com; s=arc-20160816;
        b=GqU1b1bsagsxqdJXCl7KZllKYAXQfslUPv+eGnut/2HcNsszRy46swzs6lYhyfqBaq
         a/eVkmsaMTCA+5mklXM3Wj8/ScgXFj1D5HewQ0mkaUDg9UBlVPRGwG0+eKqELBLX9a48
         4S47QW3VbpKHg8LnEajbBOzpahaaoMMfMnxBs7PKPSVK23CyKIYT6HOykreEkp8nsBrU
         W3jONkYGvBayV0DHDSVpyMkE8JAjdTP/Dmpn9Qnsr6q7USKsvBAmdoDQ5iDSZw+whUNo
         Vo1rwHWyVAU3WoqqacMECxgczDfji4+EvG4d8gszx0xjDlfxt4Vpu6F8FgGNyuz0CMYU
         tH1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Fxv71ohYTRmu/fBnYyOPmbcm4hm27+TzCHKQssLCMK0=;
        b=G1H2A08FXKF+2uQhhR8PdkAvDMowGxh09GLeo2qx2D/9yL7raztgAMQNk9gpXzlUTc
         CFj2+g6wzBVxnQpi6SSzhyTltQgSXV0Mn/6wj6I9SmAuVPLbMUqD6gliWfKGbGSkgGAf
         X4cmUztB5sP/vi2nST2Q3VTWPWvBD7RAjT7sZB8sH4d3onaOOybgXfJfKW2ocmaehJ2N
         PdlyD8u5MqmrsjdfwSykgCuZ6ZdpYZngl64Xuv7xvybkS6/YUhkPKp2mfrJRS/41Ckr2
         yvVo4EkQG0or2vz3q6NQdv58GErmpLLrhdsfv+N6JfqILYAp2ahiBmHTSfe2mlKBKhTI
         Ak3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsshjF56;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do28-20020a05620a2b1c00b00706adfc6feesi10568543qkb.599.2023.02.07.06.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 06:27:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsshjF56;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPOvx-00018p-1x; Tue, 07 Feb 2023 09:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOvu-0000xM-M9
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 09:26:54 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOvs-0006Ta-UR
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 09:26:54 -0500
Received: by mail-pf1-x42c.google.com with SMTP id b1so258450pft.1
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 06:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Fxv71ohYTRmu/fBnYyOPmbcm4hm27+TzCHKQssLCMK0=;
 b=HsshjF56g0SC3T/y3pdixulN2tMaSavwKLtGp2GsTDaSwX/+9V0VRx4tbnLd8GDegr
 E/43wOYYVmGJYQc16z1NVebPIw5AOlby31xPrYbdvFy0USOImlnJ9dUfysyZLBlgV6wx
 rZl4oI4JEN9pht6FRFAVVdKh2raPO7PYYwLZXZeQ8vB30G1zc+NTSE+k0r5Kt7CWEeFB
 IyKzVR75jer+qcudDD4/d6MGGYxiAbSPSnJwUaxP9KcX0YUzWq2JYD7mSgGWHfvi2sri
 aqmHJvnJswrbd3nxfkOxFA9XYkzO5gD2MSo/uYIFmUMGk1c9lxR2s+NGByzF3tgcqY/q
 bs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fxv71ohYTRmu/fBnYyOPmbcm4hm27+TzCHKQssLCMK0=;
 b=A9umd6ExMoZMhumEU72dSnUn740uJoHe0nOdy0IRigqSNQDlizwsSksLoELEi31l5S
 igsePuqyiCM2kw0MGA5PpVOM83IHfx2C1ugANHZgr5ipuvKT9+irRmjAmmGRGON0rnvj
 ouPWd7x90mo1JgB05vo67GPuVlbhFlWTToR7PQDhJvvx8Qsffi3lVOBzSWfD9HqqVjhV
 kXLg2nqxJZ0Lqt7+87iRtufvB6hrRDMigomGIYUYRtw654NyqTDLnaWTroXPJ1mFQZUB
 V6dO3EQTiTAwlqULSkcP45z1VMtoAGpNVgw5rf6b6UfYWglBJl+2ilDPhJXovw0zRc6A
 qmzw==
X-Gm-Message-State: AO0yUKVor2jkvBXB8+XBbHUYOqof42AkCpuZ1Cy0fv/e8WqdoZ6PRLWk
 YqebDaYz4W5zOwTpWAvuleRMSOPyxZ7Vw8jawMzobA==
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr814453pfb.48.1675780010143; Tue, 07
 Feb 2023 06:26:50 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-2-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:26:38 +0000
Message-ID: <CAFEAcA_-XkpZDGWXFnKny5A19-KUnZPaoPwi-N9EeyPjaDxJBg@mail.gmail.com>
Subject: Re: [PATCH 01/22] target/arm: Fix pmsav8 stage2 secure parameter
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
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
X-TUID: nSWgwE6yG1Ye

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have computed the security state for the stage2 lookup
> into s2walk_secure -- use it.

We've computed *something* into s2walk_secure, but it
doesn't make much sense for PMSAv8 because the VSTCR_EL2
and VTCR_EL2 registers don't exist there. s2walk_secure
also doesn't sound like something we should be using,
because in PMSAv8 there is no "stage 2 walk" being done (there
are no page tables to walk) -- we just use the information in
the EL2 MPU registers.

I think what we want to be passing to get_phys_addr_pmsav8()
is ipa_secure. It's a bit moot, of course, since PMSAv8 doesn't
have TrustZone and for PMSAv8-32 the security state is always
NonSecure. (For PMSAv8-64 it is always Secure, though...)
This means that ipa == address and ipa_secure == is_secure,
since the stage 1 MPU can't change either the address or the
security state. Passing both ipa and ipa_secure to the stage2
call means we're being consistent, I guess.

> Fixes: fca45e3467f ("target/arm: Add PMSAv8r functionality")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 57f3615a66..b0f8c59767 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2727,7 +2727,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>
>      if (arm_feature(env, ARM_FEATURE_PMSA)) {
>          ret = get_phys_addr_pmsav8(env, ipa, access_type,
> -                                   ptw->in_mmu_idx, is_secure, result, fi);
> +                                   ptw->in_mmu_idx, s2walk_secure, result, fi);
>      } else {
>          ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
>                                   is_el0, result, fi);
> --
> 2.34.1

thanks
-- PMM
