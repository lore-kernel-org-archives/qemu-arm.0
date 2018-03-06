Received: by 10.28.91.67 with SMTP id p64csp3705685wmb;
        Tue, 6 Mar 2018 04:59:17 -0800 (PST)
X-Received: by 10.157.87.121 with SMTP id x54mr12397514oti.289.1520341156902;
        Tue, 06 Mar 2018 04:59:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520341156; cv=none;
        d=google.com; s=arc-20160816;
        b=D4v5S47wcdhPQJnIHEDBEQWK1hEXbOfM4qOytalnzLNi/aRAhlTOq2gN1MNLwWsYiu
         mXh68cEJFFUqa23aZBW1UyPtOMsQ+PY0wqmb73UgSs0zSQVfIUlN2f/SHY7fcU710g6t
         /VEbXf3y1SiuQuxBoWzuXUZrP7Co893wTJyrGGWjEjL4wEJC0Jw3Syii79dF4NJeiJDy
         rxjCnzlS02Xv8JFEbTjIVCwkEBahc6/laHSjBrJi9Risd4iZb+4ay12U5iov2+lw2MFu
         3KR78tkmy9+/klSnM11Z09W83RfQjAU1iXwdR9qQUmHkRi/U+B2j2CZKHfiHUSrKVNZz
         JKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Of9VRWU1U1rgNWXj93MDR2rkNXEo61PFuSGFC57tqgg=;
        b=gFEhDMW4Vf0QfHi+dfzlbt50d8PHyXeXWkHqlHdxQ/9CteYagzgthFzQjx42yVIucb
         CsvIXlgFYpqGCtGZeDDsJ+zoh+sQfI3UBmnfgVN471ryDKf2GpS9Q1uCoBN1+RaajJRL
         Z6XmxrXP26flKkCbSGhcfTwkw90lO03ogF1UTi5/Je37Iq0RHVRyroXsyHUeBAwGRfoo
         6ELum7r2cUfLjm3IwcXYiQm/6+KidCNXu+AgwhCiqwVSUPpUSE6LtBrnupTZXZwbkau2
         XmaGndAUag+UKH0zC+HNCSDygPyJQEc4oPt8w9wqe2y+HAaDe7mqTt93HtBzmCuPY6y/
         rwEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LeS+3hIN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c4sor5946846otf.166.2018.03.06.04.59.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Mar 2018 04:59:16 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LeS+3hIN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Of9VRWU1U1rgNWXj93MDR2rkNXEo61PFuSGFC57tqgg=;
        b=LeS+3hINQQbNRchzA89SFiCrGh5JJtCEqR6NXeFyuW4IKa7BlWimINpYtfC6OoJOG1
         mcIxY5OKMP4/vScZesiVfD4DrdKODzak51jP0C0lWw+vst4vlEnmhiFJRz081OZc0gmf
         lxuGO1lKFJrbYQGClYzat4QwTyNid5SjoaU60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Of9VRWU1U1rgNWXj93MDR2rkNXEo61PFuSGFC57tqgg=;
        b=pE2C+N1nRSbdEI6P37XhOWJ38u2r6FZ6pusOb8UmaeQNvij5DYPi6cGNFV+FRhISPZ
         EtwhZuJEGNYnA1TlB1LeNdRnctVA+WXhgnYWoC4p0NIP3EG5eRDAecKSNA3nDaXGgqCN
         9k6y5ljacX0FzcJCflptlNWr7tS+FvYi2u8gWnp9i+Qj4G6be5vaByaY/GdH80vMfKOE
         LchmZ8ikcEmBFYeT0BH71eaEO76EooFbtxWHeY1icZ3q3jEjTCSlIgsCGIl5z87gYhaO
         ZFMuBeEeckEbYvARIR7v1/tGN0zohxZhkw3G30rB0xLY2jfr+ZewTHqYGTB+Lpf9fX2L
         wxrw==
X-Gm-Message-State: AElRT7FSiAKpSLrtc+rao5nd2pnYw7jDbhev2wJ2W7/n/737lkIMKBs3
	0YWA//GNlH5DImowmFZnSqlpnzmFmS0KUCROs1XhpauFlDE=
X-Google-Smtp-Source: AG47ELviQbvjPDPpYii1KBpl2zpCHHLJBHkEMLtuKBH1KkQQEJsTeE53FF4FyXEbZk8XLTFV5sg1pW+kV+80LnJPzhc=
X-Received: by 10.157.69.152 with SMTP id x24mr12197668ote.126.1520341156159;
 Tue, 06 Mar 2018 04:59:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 6 Mar 2018 04:58:55 -0800 (PST)
In-Reply-To: <87a7vltmka.fsf@linaro.org>
References: <20180303143823.27055-1-richard.henderson@linaro.org>
 <20180303143823.27055-2-richard.henderson@linaro.org> <87a7vltmka.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Mar 2018 12:58:55 +0000
Message-ID: <CAFEAcA8hNzeCSe2DNwUfzeKOSonHY5uoc31m68F2YQsvcyjJLQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 1/5] linux-user: Implement
 aarch64 PR_SVE_SET/GET_VL
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WyyMPltGDJ5o

On 6 March 2018 at 12:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> As an implementation choice, widening VL has zeroed the
>> previously inaccessible portion of the sve registers.
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

>> +                int old_vq =3D (env->vfp.zcr_el[1] & 0xf) + 1;
>> +                int vq =3D MAX(arg2 / 16, 1);
>> +
>> +                if (vq < old_vq) {
>> +                    aarch64_sve_narrow_vq(env, vq);
>> +                }
>> +                env->vfp.zcr_el[1] =3D vq - 1;
>
> It seems odd not to have setting this inside cpu64.c. Won't a similar
> manipulation need to be made for system mode? I'd keep all the logic
> together in aarch64_sve_narrow_vq (or maybe call it aarch64_sve_set_vq
> and pass it the current exception level).

I think I asked Richard to put it into linux-user because it was
in target/arm in an earlier version of this series. The manipulation
that's happening here is kind of linux-specific (if it were for
system mode we'd need to think about ZCR_EL2 and ZCR_EL3 as well),
and the analogy is with cpu_set_tls/cpu_get_tls which are in
linux-user/arm/target_cpu.h.

NB: I've already put this series in target-arm.next -- do you want
me to drop them ? (That would mean they won't go in 2.12, given
RTH is away.)

thanks
-- PMM
