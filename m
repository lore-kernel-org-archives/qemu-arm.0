Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6161809lfg;
        Thu, 4 Mar 2021 03:41:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjcHU3HyQBW3NscwcsTpe95YoDHA9164To+ufjWAAFTC2+JO8L/C9NhiYrE0RTUgLk6AvS
X-Received: by 2002:a92:1e12:: with SMTP id e18mr3595013ile.270.1614858083719;
        Thu, 04 Mar 2021 03:41:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614858083; cv=none;
        d=google.com; s=arc-20160816;
        b=dOTG06IS1xuKjJ2MXw94DkocOZuZX+Vu7Jx7mPy1ZYUlqLYF6GQLKnnzvvWoMOikkt
         GqYui04ospLQTtAJjKGtIWXpOD2HYuqMCZWiwcEG1kyl2T+cZ1qCu6PezCZJx/FF3RXN
         sGMs3RcDiSplx4mi97ai0UpXjFxzf4l97Lqp+N4+LNB+QMqnAOAfgUFECS3rV1OSPxcB
         7DI4erE1f9GVDAxTxNwuQdXqSyDI5fzZG78M2FFCGlCQhZgY0tQHCLf0QaXfDIXlt7NK
         sw7gBvBKPTSgcY0eA9CE0VQogfWTDdVDuyZWMgBhTcP4hnTg6spOYB2Hfl+lTj5tuvMY
         CVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pc5OZ/q6ft25WXrEaV90BsKQ6D6IusnYR/G4yIr/FJc=;
        b=peUQSt+5Us9hovxS18QbT93tyBIaoURrYXn/UkktZzmGCuJduRtTvDDgdfT6GB0Rvd
         jsPSuLWjocHTZeqKwHVIgywuF0zvNGt8XYoYp53AyYHhZnZx0+G18px+u/VIxAkHeHX9
         Yfm68mMQNvJeUiP6Xisi326CqMor+J8upLZgAoCJscUxub83iYFWTb4kBuZaAW5+t7Af
         wtyoXBsW4Ai2Lxr/OS+A+tnWYuBZZxjLVoBZuqKcGZOkp7et1FrxuLwvb5C4FxJetBA7
         NrEAyu2Gv3Q2un/THD+fpxwZPimijHE5DaO041K+yKgsaj2xvPCWOrMmpI2SlIxaFV+t
         +7tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tCZDG4v3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22si16602144jao.25.2021.03.04.03.41.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 03:41:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tCZDG4v3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHmM4-0001J8-L1
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 06:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHmLg-0001EW-L6
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 06:40:56 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHmLb-0006PU-Kz
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 06:40:56 -0500
Received: by mail-ed1-x530.google.com with SMTP id m9so5824875edd.5
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 03:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pc5OZ/q6ft25WXrEaV90BsKQ6D6IusnYR/G4yIr/FJc=;
 b=tCZDG4v3bbQ5Hyf2dA6Cg2aBK3qcoMLP8e4Hsm4W8T4ry7NuHDZNjaW4c/sDLiD8Zv
 QaSFu9PXDV+v1sjIViRY6ejjvGAtvlu5pt/fRufD2nqNHHCK6cDgAXlVw0NWrJ6bQZkY
 tPzRnnZFWtmbmXXoACAUEIzcucj6e5imCJJfQDmsZp1KZoD8MxdTMy6E7MwpST93uebF
 KVFxVgzqG6GMu9ORRqk+qAm/M+EGYnGpXpFkpSiOUCdNrqUk4d6V4LhZ9eOcfDfUJJhC
 E/hitOrH7mRDR43wekTF5ldg2Uf1AjaS8mNcAczG12GiiWdVHXA0C8+My5kco+6BlQY3
 LJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pc5OZ/q6ft25WXrEaV90BsKQ6D6IusnYR/G4yIr/FJc=;
 b=f3AX093tXAy5kM1TehB1v0+Ck0D83PwqTDNHMneeQp5qceF8dgHafEZZ4QHnFfkvKw
 KC324AkrHPRrwm3b3mxteBXZmQEbuZs1e7StGhSthxK3QvV3gsP8JCn+OdijBsbLzSjj
 fejdci87lrGiQ8yWPIwOCF18zG0u2FLnjIsHVrK9pjT3A44pr8wRsE/no7JXr5vVjg3l
 ks6dsCTYBUos5wglagd3w4E1yOIIfM55j5HBqpl0LiAo/Rx3z5Qs1snSYSZPhoHSmo5D
 EBtScVy7c/UkeZOFPAu9jZI+9tfvQOxBNvj1/IRj5ju9S2dqLQ8qlWLOxSBEuGlDW6Bj
 QePA==
X-Gm-Message-State: AOAM532AV9frLtWXO89aqg1Kw1Lo7NhgeMFqnR49RMW8wHP/j0m0rGwi
 ug/FTCh2tAKn8FXdIfGH7Xsr+xKTSTgAkIkZtIe8+Q==
X-Received: by 2002:a50:d307:: with SMTP id g7mr3824082edh.204.1614858050044; 
 Thu, 04 Mar 2021 03:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-9-f4bug@amsat.org>
In-Reply-To: <20210205144345.2068758-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Mar 2021 11:40:34 +0000
Message-ID: <CAFEAcA9TxOuA=PkD=0zUfHBEdDpYT=EUsgCUjuM5_=b-xK8sZQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] hw/arm/virt: Restrict 32-bit CPUs to TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Andrew Jones <drjones@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XbmPmLzU7pwe

On Fri, 5 Feb 2021 at 14:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Support for ARMv7 has been dropped in commit 82bf7ae84ce
> ("target/arm: Remove KVM support for 32-bit Arm hosts").
> Restrict the 32-bit CPUs to --enable-tcg builds.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f5e4a6ec914..ab6300650f9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -197,8 +197,10 @@ static const int a15irqmap[] =3D {
>  };
>
>  static const char *valid_cpus[] =3D {
> +#ifdef CONFIG_TCG
>      ARM_CPU_TYPE_NAME("cortex-a7"),
>      ARM_CPU_TYPE_NAME("cortex-a15"),
> +#endif /* CONFIG_TCG */
>  #ifdef TARGET_AARCH64
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),

How painful would it be to just have it check whether the
CPU type is present in the executable, rather than hard-coding an ifdef ?

I think that if you try to run the virt board with command line
arguments that (implicitly or explicitly) mean you've asked for
a CPU which isn't present in the QEMU executable, it should give
an error rather than silently selecting something else.

thanks
-- PMM
