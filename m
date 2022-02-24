Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp934410lfq;
        Thu, 24 Feb 2022 05:33:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydAkRGGMCwA91L5zBZbmvmzNxnqJtvhSQhMRcSnEIHNkPjo7DlTUV7MJnCmTMYO0YCbEEv
X-Received: by 2002:a17:906:22cf:b0:6cd:2c02:45fc with SMTP id q15-20020a17090622cf00b006cd2c0245fcmr2334833eja.295.1645709588620;
        Thu, 24 Feb 2022 05:33:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645709588; cv=none;
        d=google.com; s=arc-20160816;
        b=rsufNTRSIE7hOrBI6/jc4VSfjHn6QamFBeCBFLikQvLJtW1BtA4cUvjEl2j7t3Kf5e
         4i7jSVQMrf9k0f32DdqL7aS2I+o7VFl3M8v9GhHdff+FCjCz7/e8I7fNRBED8WKfOtme
         VxF5gJjoxOXHWgOOVI+7AEaHNpGPa25Kia45IAlt3lrieQxVCP/XKFhL4ZlyscniYsOw
         kar9KObfsvmeEkcWF1Zt5f4fPMfVLJQYTjxhexcYbhcAaIdl7rHj1SikYeKa1PGitrX9
         MyHz6e8vsY37UBW/i3gUGwEicuqiPwOdJJh+BI005V0J3OxvmDhH5t03XpFVT9ZweXkT
         tifQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=2oR3jzkZF1FuTCdkP1d7JXrysRcu+SsDR6/8Luarz0U=;
        b=ZOAaKBKUt0LAiKhE3msVUxvtVUiPKDq5u51SKCpbHx3vxSUkVEP5GKE8u4ISy6vXgV
         NwEY6fJfflCMANKVtgCubWrbpf6WMS399VRLvAlVNTLVVKaU0jCuUyTvfnhLdqjnaNXX
         QBeMxCUKIuX227UzPr7h/f8gQ2o9UN4LINJuMmcneG29GAmDcaKV1usCxIBsSl8q/U6R
         EhpRiy6WC0XddVMRbg9bsYM3z9O6S6ZuoNx6ap8HpG3aDKtyRFYEeEJ8dxOs7wztoOjP
         svq74/MAWI6yDIX0jkkpJMcCvX7/MGBE2WrnvcWvsi0lG4xa8HkZYV462+5Alp4UGro1
         LoLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PrRPm7fA;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id u7si1573537eju.755.2022.02.24.05.33.08;
        Thu, 24 Feb 2022 05:33:08 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PrRPm7fA;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbiBXNdg (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Thu, 24 Feb 2022 08:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235058AbiBXNdf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 24 Feb 2022 08:33:35 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47329178687
        for <kvm@vger.kernel.org>; Thu, 24 Feb 2022 05:33:05 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2d66f95f1d1so25866287b3.0
        for <kvm@vger.kernel.org>; Thu, 24 Feb 2022 05:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2oR3jzkZF1FuTCdkP1d7JXrysRcu+SsDR6/8Luarz0U=;
        b=PrRPm7fAuyTg06LTBnrcrsqUBKoiRV8VM8NAOR3gG+5DLfT4rIBtve85Jdlaz1RUI7
         H7YLNvUNOtIO2SGXrudoaXRz+UtcS6ZqRHOKwdaDb5IkRzotRO6onju4RCEUwRfOdYc3
         tdPp0sM2d+bUQ8Sa0gc07Y7n/qEmq9ixqXbKjFUr99IeU4NIj+SFDsNXkyewEUI7aOTx
         P7VfiyCaQX8mAlFod22V06QQYEO1HhdL14Ld0Z9Ra+1ZqFSKImNGkxl3XaIjLGFKQ/di
         qclQE3sCzFXmMG2ZCmIg1ApN8agpz6FNPjUuVwhcQPfqQgqVCoC8TgczC98S57KmWEHN
         tJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2oR3jzkZF1FuTCdkP1d7JXrysRcu+SsDR6/8Luarz0U=;
        b=gauWh5X4wMMQS0vJH9Q8AsA9VaFppgbc6ULTUwfKgJdwwr9xU2Kbu3dJu2OG6+gfCq
         noXKNsZzL6xEmYt53gqBRsDYeYmbZPPJNVWjlz1d6+Nf1vOO1Eh73OWqS/DhIwGoE15z
         yOdtbiHJn6ANfEKC5AOzVVlw3UdU7x9CDJ7XFA3J0anK/6ri8UR0nKmxzZw3v2y4iUU3
         9WfBPbK9AQcmBqHWhYhfDvL9BDRREvbn10ji/fPCTSLcfXmkY229TI9LjNXLScWwGmDG
         UQnhv2RRdsEbOS2KJcdSBLRS4DzAghLHifqLA6RYu6IGQWy5iWF3ncZU3PTDAs6g+q7P
         i1Yg==
X-Gm-Message-State: AOAM5314rjYDSaxyGXVdOk6OAys5mbK+4DstO4GyrVqrWIZSy092pha7
        PHYlRYZp3hiQt9r8W3e275QJNxV8Q1xVBPA/ymEnwA==
X-Received: by 2002:a05:690c:314:b0:2d6:b95b:bf41 with SMTP id
 bg20-20020a05690c031400b002d6b95bbf41mr2316666ywb.64.1645709584519; Thu, 24
 Feb 2022 05:33:04 -0800 (PST)
MIME-Version: 1.0
References: <20220213035753.34577-1-akihiko.odaki@gmail.com> <CAFEAcA8_VgsR=Bcn1wxxaLotxQH3sumYMt1=3NxwHcdQFLPYqA@mail.gmail.com>
In-Reply-To: <CAFEAcA8_VgsR=Bcn1wxxaLotxQH3sumYMt1=3NxwHcdQFLPYqA@mail.gmail.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 24 Feb 2022 13:32:53 +0000
Message-ID: <CAFEAcA9vbaQ+3XHNDtN79b=Y36M8q5WH9yTxXOX-zt+wh5qQow@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0
To:     Akihiko Odaki <akihiko.odaki@gmail.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: auA/IvhvErS7

On Thu, 24 Feb 2022 at 13:25, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 13 Feb 2022 at 03:58, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >
> > Support the latest PSCI on TCG and HVF. A 64-bit function called from
> > AArch32 now returns NOT_SUPPORTED, which is necessary to adhere to SMC
> > Calling Convention 1.0. It is still not compliant with SMCCC 1.3 since
> > they do not implement mandatory functions.
>
> >  /* PSCI v0.2 return values used by TCG emulation of PSCI */
> >
> >  /* No Trusted OS migration to worry about when offlining CPUs */
> >  #define QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED        2
> >
> > -/* We implement version 0.2 only */
> > -#define QEMU_PSCI_0_2_RET_VERSION_0_2                       2
> > +#define QEMU_PSCI_VERSION_0_1                     0x00001
> > +#define QEMU_PSCI_VERSION_0_2                     0x00002
> > +#define QEMU_PSCI_VERSION_1_1                     0x10001
>
> Just noticed that there's a minor issue with this change -- it
> deletes the definition of QEMU_PSCI_0_2_RET_VERSION_0_2, but
> it is still used below:
>
> >
> >  MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
> >  MISMATCH_CHECK(QEMU_PSCI_0_2_RET_VERSION_0_2,
>
> here ^^  which means that this breaks compilation on Arm hosts.
>
> I'll squash in the fix:
>
> --- a/target/arm/kvm-consts.h
> +++ b/target/arm/kvm-consts.h
> @@ -98,8 +98,11 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES,
> PSCI_1_0_FN_PSCI_FEATURES);
>  #define QEMU_PSCI_VERSION_1_1                     0x10001
>
>  MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
> -MISMATCH_CHECK(QEMU_PSCI_0_2_RET_VERSION_0_2,
> +/* We don't bother to check every possible version value */
> +MISMATCH_CHECK(QEMU_PSCI_VERSION_0_2,
>                 (PSCI_VERSION_MAJOR(0) | PSCI_VERSION_MINOR(2)));
> +MISMATCH_CHECK(QEMU_PSCI_VERSION_1_1,
> +               (PSCI_VERSION_MAJOR(1) | PSCI_VERSION_MINOR(1)));

Ha, turns out the existing check line was wrong : it ORs together
the major and minor, which only works if the major happens to be 0.
Actually working lines:

MISMATCH_CHECK(QEMU_PSCI_VERSION_0_2, PSCI_VERSION(0, 2));
MISMATCH_CHECK(QEMU_PSCI_VERSION_1_1, PSCI_VERSION(1, 1));

-- PMM
