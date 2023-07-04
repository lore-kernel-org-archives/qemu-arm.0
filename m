Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2999685ejy;
        Tue, 4 Jul 2023 08:57:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE5q758kDfnEKiStXhIMWOX8OuIPwyd3V3c/vb1DPUgB16MjJDhWs2wjGja/uniaqsqolx8
X-Received: by 2002:ad4:5be7:0:b0:626:15bb:f57b with SMTP id k7-20020ad45be7000000b0062615bbf57bmr15097996qvc.26.1688486270984;
        Tue, 04 Jul 2023 08:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688486270; cv=none;
        d=google.com; s=arc-20160816;
        b=UyHgD0Gt01UpBX0MZVsPrIiK8Mc93See/hACZxcTl/0JcWuyiY2PekMMqxNu3duv/2
         Cz4gAGuVXcY7j5fbqIikmoAbZEL9cq89EXXzUmXRX4jpnSmd1HaZ17F9xa8q5TBeR7Oc
         vCsViZ+YBJeQT0ny0+1Bm2vCiuk940o07IOXVuIk2v+i46vWNYnDmdM3RXltDukRStk1
         1dQ3HnqNyp7E6qi49cRmfL+N5glg6MZvy5G5Kae4wECRpCSxBXbnkZxympLnVgC3/Z6A
         FcjxOq/OwTPKilQM+gTEn4IAZztF6PHf+aUccBHri6dVZnuIMQEshv12ti6ZswYT2GEd
         MlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TQ8LXiCqh/l23yZNrjpE9MSSiltordpEW1zSioWxsEI=;
        fh=TfkJASJQZEi1u82yrjG4XvOEeKalzEvweFsBg5QB0FQ=;
        b=DuxKDQET0acYFPdP8HFO2lfu7gTvxAmqff3XqsY6mwTAlMi+t+FewK4/z0aC+FjxQz
         XBIG6Nk6vZpZ3rIfLghFyzoZWDMIkANhoBr1N9CLj1ylxVZUklYoO4uoWui8DWxMmQf8
         6zSrhUuQCLyr1LdYqBL5W/wSBPESZEOUB1zu/fxROc/nN13tiCy/1lpB+UeziPverg4A
         pMluf3wh39I35wyz+F4vnoDM+B0gmbJ//DJrFu9jC6p2LEH7YczRR6zwVDDMar8/tu28
         kQ116ae9/3UO6s+GnZi4N0xebvEKvd1+ytnkrSK7L3h+aKvSwzXyO8qSPhnLJMg837Ac
         aE0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IHvaI6QU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu2-20020ad45cc2000000b00635d95ea922si12695072qvb.587.2023.07.04.08.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 08:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IHvaI6QU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGiPR-0002lN-1c; Tue, 04 Jul 2023 11:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGiPP-0002kd-Ab
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 11:57:43 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGiPN-0000yy-MB
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 11:57:43 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso8960440e87.0
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 08:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688486260; x=1691078260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQ8LXiCqh/l23yZNrjpE9MSSiltordpEW1zSioWxsEI=;
 b=IHvaI6QUr/kc9KnPFRcKWkV0tLNbh/UjnLD0XOo9TeESrJrDv/rcSJKdePWsqsvhmU
 zOqapOVzuM0kKzndEdRlKvv0B8HBvf7W/wu1uyPN8iAq4iayndand1iHDdRQhZYYwMDL
 9/xKNcWLosbY7Waz/4uNNuauBaD3kjh3Xt+k8FWs89eWzUAgdEvi/ehyC2/GMe3Xt90M
 o3NV1TKnItNUl9Og1Bhp1Nz199bmBnEebUx1QY9hNQCwOjllb5gCg56lc4at6pm0ygeH
 3a6rkwbWTGtC/7D3Nj6ZINkcmRxkMuBg+UCDcZfY0yf69snrnKkhB0OgLR/Y+ba3nr2U
 zi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688486260; x=1691078260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQ8LXiCqh/l23yZNrjpE9MSSiltordpEW1zSioWxsEI=;
 b=CFif3mSpCLqY3vK6nj4wf3bZSmyl6n6dzc6RSQ2X2bgOeJDF3ZQNh0kVIvNU4nh+//
 s2J3Pgs0Py5RlEafpIZJe79PADITeG4QV7Qxh8dvw6RVIw7wCL4pNy2n7HPF1gIBBGHx
 jhVTW7+zKNEvYuQtVfrw4/YbSf2nS6uXdVkfyo/vsWfNpkPN/JQwKOkx1se6fgJuUtdN
 +80ObaCGmkEnOockzdyL3HCE5tfGZ+rEyPaatq7s6dhKWymmKcrTs7pHwCkctgEqY50z
 1bCpg4mMJ7WNKw3fIKjIYerQ1BrcZB5C/qPOB+z+KJnXPtwEkH5DD1o/D0kp/YpSHwI8
 9DlA==
X-Gm-Message-State: ABy/qLYq3Q9LPNpinBrmiIc8e6IcrhyZO+QmZRGol1+M0Pa0CShB//uo
 dZZv/KAXpwh/2BRxXSV9fh0SifkCHtsxNGW80cKnZQ==
X-Received: by 2002:ac2:5b5c:0:b0:4f8:5d94:2e46 with SMTP id
 i28-20020ac25b5c000000b004f85d942e46mr9754294lfp.48.1688486259959; Tue, 04
 Jul 2023 08:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230704154332.3014896-1-peter.maydell@linaro.org>
 <a96bffba-9653-95b3-4b7c-8787646f1f21@linaro.org>
In-Reply-To: <a96bffba-9653-95b3-4b7c-8787646f1f21@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jul 2023 16:57:29 +0100
Message-ID: <CAFEAcA9rqf6QmG-WWebNmeUPEsmtUCAEtr7miHWaQkk1Bner1g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Avoid over-length shift in
 arm_cpu_sve_finalize() error case
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: tOXDLa5pNkDp

On Tue, 4 Jul 2023 at 16:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 4/7/23 17:43, Peter Maydell wrote:
> > If you build QEMU with the clang sanitizer enabled, you can see it
> > fire when running the arm-cpu-features test:
> >
> > $ QTEST_QEMU_BINARY=3D./build/arm-clang/qemu-system-aarch64 ./build/arm=
-clang/tests/qtest/arm-cpu-features
> > [...]
> > ../../target/arm/cpu64.c:125:19: runtime error: shift exponent 64 is to=
o large for 64-bit type 'unsigned long long'
> > [...]
> >
> > This happens because the user can specify some incorrect SVE
> > properties that result in our calculating a max_vq of 0.  We catch
> > this and error out, but before we do that we calculate
> >
> >   vq_mask =3D MAKE_64BIT_MASK(0, max_vq);$
> >
> > and the MAKE_64BIT_MASK() call is only valid for lengths that are
> > greater than zero, so we hit the undefined behaviour.
>
> Can we fix it generically?
>
> -- >8 --
> --- a/include/qemu/bitops.h
> +++ b/include/qemu/bitops.h
> @@ -28,3 +28,3 @@
>   #define MAKE_64BIT_MASK(shift, length) \
> -    (((~0ULL) >> (64 - (length))) << (shift))
> +    ((length) ? (((~0ULL) >> (64 - (length))) << (shift)) : 0)
>
> ---

Only by introducing a conditional in the case where the length
isn't a compile time constant.
Like the extract and deposit functions, the assumption is that
you're operating on a field that actually exists and isn't
zero-width.

thanks
-- PMM
