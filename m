Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp111137njb;
        Thu, 13 Mar 2025 11:35:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUI4MyMnEchAOega0LiT3Ki5aO2xlAalKRzPMX1S9eS8EipM/8vw/lGrCqVQWKwveth6JHm39p09kAQHw==@linaro.org
X-Google-Smtp-Source: AGHT+IHsxMRRLzw0Gf1OjwNgjXvcptyHQQmDTLPnjbNKHra4f22tGAUCKTOpDky1ZVArjj9KWUxh
X-Received: by 2002:ac8:5846:0:b0:476:9e30:a8aa with SMTP id d75a77b69052e-476c643e8d4mr6684931cf.38.1741890901434;
        Thu, 13 Mar 2025 11:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741890901; cv=none;
        d=google.com; s=arc-20240605;
        b=gWyIp/vR4zP39XiFe3IAkLF3OzYaCXWefHwM40ZmwYC34mUnmnfzYEzzArq9xKoyk3
         +tD4sGgBmfnQ7OPNJd0+kXSI1co0w9c2UevoamdF9fdGxsOwYTmLF8f8l2GqU/7ardOu
         sj4WSYFeocxnj6FExAfOUYyvKaYW2gyC59LSB1FCzQ7RQ+J54+9j6EMh2E1XQoX+0Nf7
         GkLoaieyY9Owi/ljOxhMveP0tR7cG3YQ3LVfyM9pCu1DKep/v0/rtZjoxoaagZS+0Ovo
         5Yns406iH0U8imUhzyZSt8epqPDT0IM4sTnWoU03ZnttUDnTS9m9HVR/lCc0d7Vl1QWZ
         ADaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=o9H+iuk78YKeVjgBFFsvFrdQ4G8MqOtnjvCrBIEMBvI=;
        fh=ftiI3uzQb593qT5FBQhdt7T0NO95yimar9117RQcoRQ=;
        b=VV38xvoSDIq6KP5/5yKTbGaQ6VYCYwgVolPnM0yHuW1uQkjVbssReyEC6TAiJB01Sq
         qx38ob9Yns3ImbiJy4xrts2RiW/wRUCjstPFFjNIVIMchoXCVHHLe57gV6VQBs2XvWbY
         6QHWt4EkxHcXiB0pD4qsNLX3UKV8kzOvvM9S/6eSP1z6WTj9x31ENcHr00Xyn7C6MWIi
         UK/nPfmuJO+U8UOTHfrTVioiGFvv4VN6LvALXm+pJOAYPEtXY+HavrhpMhxGSnOs0pYP
         FlPvLBuYys48TwEPZnZvrABVmbWdRTXT2SqFuI/zAbbUy5eDhwVkw6YCnaoI7ee/3pDz
         i7TQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=naYf+zB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb614b2bsi22221191cf.96.2025.03.13.11.35.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Mar 2025 11:35:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=naYf+zB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsnNt-00075q-Q8; Thu, 13 Mar 2025 14:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tsnNs-00075Q-5z
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 14:34:20 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tsnNp-0002Ny-8Z
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 14:34:19 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-6febbd3b75cso12485147b3.0
 for <qemu-arm@nongnu.org>; Thu, 13 Mar 2025 11:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741890856; x=1742495656; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o9H+iuk78YKeVjgBFFsvFrdQ4G8MqOtnjvCrBIEMBvI=;
 b=naYf+zB+ZFgPWSV0FEG+VldR5q4QRbwFLGWUBnly213lFKi1pcVLxyuhpoC/iVnKsp
 8vOsTILvezy4a0WCDeurXb22ZCMKfLrGg0qcZa1Nd6I6kRz2V3dYsTQeWaOtsbxozv3c
 nYJcjGA1NT77dY6PmKXB/t/HAsKnNZAt0E4ATDpY0nMvvHKCS220JPlobQ0HO/vweO8x
 uPbotoxMwp+thlO6QtFRDVdAESayjWgnwjSgXLRyk5wCz3Fndv7WwI8O01i4CbzBySL6
 eCzGHpsEbDZU9BLi+Mv+dvC7cj7o6vZCU9urkUOZypV0KeqPGhykPUSlk0cpBDGc7p63
 8PoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741890856; x=1742495656;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o9H+iuk78YKeVjgBFFsvFrdQ4G8MqOtnjvCrBIEMBvI=;
 b=GYlfCVOycalpNKJzOpzq6naLunAjabCgpNSTfL/BUY3sT0+3L+JpnKp/kF72CLYQro
 /ypDUCfFfiZV0XL6/qommeD64lRyARKwwzzsYYGL5lenwMwg7qBapKw4H2JKN0iPTRHw
 mkp+o/Gv1D9Ya6IQ9M8Dou9eWaNUDf52zV2l2ObrVLS6VIpTf0UKLsCjO33OOrbOYt8X
 d/SRNHtAtR0VjYu+MYDKj98a9rkeFBVi2sCyUWC7zZVZfzovZ1UyRHa5B4mWCAm1/nhV
 Bi86TrHLBdTir5ZqvNRw3JQE+gSqYI3lreyPfd6qyNMYOqS/cwlSfyuuXBDQhLabLbqZ
 AfgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEUj9M393M358d1uhe2kTX0PXySXFX3t7wKpo1It9fv8j/V+XNfa+L04s962xmcwE4fr4WD/ASwA==@nongnu.org
X-Gm-Message-State: AOJu0YyBuXxcnNA7/Cj4Hzj0LnBrnlWlOmEtveApHjPlEdT7g/rx7T+x
 P8iOg9t21jzwnUciNmExRPgtxNmpU2DAqqyVH2GaZ/HbuM2sOMTv0Mi79+E8OSArMAU+2DiDpaP
 L5IJfAY6XdnTsn0CpilZZOijUXXxo7yjQQH0WSarQgkcwn1q7
X-Gm-Gg: ASbGncsCtMSX6ookFUNTBqgIuaxSlPbiiaFUv1WhH2AP7j2T66HXa4ULUzGJzjgmdGN
 I419c6huaZYO7NI2dMImYMt1GlK/VJ6zgV26qRddpcozEqMEjwltkHB8VvrlISbnbHfFU9LUKF9
 greeA3Vt46h491c3Um/A5U9TkfBgo=
X-Received: by 2002:a05:6902:722:b0:e5b:1710:d3d0 with SMTP id
 3f1490d57ef6-e63f3c024b4mr623465276.43.1741890855676; Thu, 13 Mar 2025
 11:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250313-clr-v1-1-2cc49df40fe9@daynix.com>
In-Reply-To: <20250313-clr-v1-1-2cc49df40fe9@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Mar 2025 18:34:03 +0000
X-Gm-Features: AQ5f1Jq2saxJY6yu_EC_VJuK2i0doYJvXf6GOi9MV3Z2IlLMLFAxTUgrN4TwgZQ
Message-ID: <CAFEAcA9pu_Y8Ki6TFznViO1UCqqSgHgn2ZKQjbcoKVob3qF5dg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Define raw write for PMU CLR registers
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, devel@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0ATdoK+dVhJ8

On Thu, 13 Mar 2025 at 07:16, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> PMCNTENCLR_EL0 and PMINTENCLR_EL1 clears written bits so we need an
> alternative raw write functions, which will be used to copy KVM kernel
> coprocessor state into userspace.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  target/arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f0ead22937bf..30883cd3a989 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1907,7 +1907,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .fgt = FGT_PMCNTEN,
>        .type = ARM_CP_ALIAS | ARM_CP_IO,
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
> -      .writefn = pmcntenclr_write },
> +      .writefn = pmcntenclr_write,
> +      .raw_writefn = raw_write },
>      { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
>        .access = PL0_RW, .type = ARM_CP_IO,
>        .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
> @@ -2033,7 +2034,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .fgt = FGT_PMINTEN,
>        .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
> -      .writefn = pmintenclr_write },
> +      .writefn = pmintenclr_write,
> +      .raw_writefn = raw_write },
>      { .name = "CCSIDR", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 0,
>        .access = PL1_R,

Hmm, looking more closely at this, I think this second one should
not need a raw_writefn, because it's marked as ARM_CP_NO_RAW
(meaning nothing should try to do a raw write to it).

And the first one is marked ARM_CP_ALIAS, so I'm not
sure why we would be using it in KVM register sync:
add_cpreg_to_list() skips ARM_CP_ALIAS (and ARM_CP_NO_RAW)
registers when we construct the cpreg_tuples[] array that
defines which sysregs we sync to and from KVM.

(We should arguably be consistent about our usage of the
NO_RAW flag between the pmintenclr and pmcntenclr registers.)

thanks
-- PMM
