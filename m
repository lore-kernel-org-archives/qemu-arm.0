Received: by 10.28.71.27 with SMTP id u27csp4834794wma;
        Tue, 27 Feb 2018 05:41:13 -0800 (PST)
X-Google-Smtp-Source: AG47ELsVpLL/OwUpVk8rVgV0W/J0BayIbRHHvRoyuKdv2Cjj8CEgh6Dm7N0wha6p2ZSKqmA1BK2H
X-Received: by 10.13.196.69 with SMTP id g66mr9577527ywd.134.1519738873586;
        Tue, 27 Feb 2018 05:41:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519738873; cv=none;
        d=google.com; s=arc-20160816;
        b=f+rYGtL1QNDPrt08aLBftbMnuTbyzh/m6jwHh6yed176IjwRkEjogJt+ilVh/2LAte
         amQIXiB6gw3nwPB7cSy+XGOfekBaFnUlXvD1pa1nlDUEuD7NKrhEQ6t4W82B+fvIWj94
         JfL5GJIbdOHEKXQWZ3fNJWIJ7sLNIiW0aI3qPT0EBY9vnzxr3MjJsnZF9qHrUluk5g0k
         Z1w0g3MGBUPXbLJGURJL45mCgPGA6vwiQaUO1wZSyUlwhuL4hWHNKF7cTOdAN/ivkeuw
         iux8MK2KBid/4MYwsXnWb3nUuRQoVixXrd//XntJhmbpwjmIJrwUSO8Lu1NwW7YBofwx
         j+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=iG30BQaXAGEqLSDxV1GhXPT63qz5CuBaqK3ADfI5mbw=;
        b=0FGRdFXiM1+bz7qT8Q/HZx8MQdKiiODVK3yAG1Mnn/H5ik9b6YHlIPtIIl7xMTYHob
         CgsBy/awuXydxA1sUGiyu2XXkUvZz2yM/QpmsEL+s239IDRCfWpcJuP8p/m9uA4zS/cl
         Jt6YkyQEpUtJvFBJPF4NHzN7vQPcYi/LnPe6obBVJw2eI6zNVYsb6tliZU4fHJC+cfLO
         +zzS3dXUbhyVUzCmmVEne0Inv211FY3MgkXc/AoKCX33SM95ZsKM57dcDztY2dX0nqIN
         fOFyBxoEBDY5ydD/vHrlxetAAv1kUGoxj7M9uU42LiUikX+2WU28RqUJa/sAt7LfXNfD
         NKwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XH7FmRR+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p76-v6si1917452yba.333.2018.02.27.05.41.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 05:41:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XH7FmRR+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37189 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqfVI-00054p-WD
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 08:41:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfQu-0001ER-5m
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:36:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqfQt-0007Cm-5u
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:36:40 -0500
Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e]:38182)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqfQt-0007Br-09
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 08:36:39 -0500
Received: by mail-ot0-x22e.google.com with SMTP id 95so3777461ote.5
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 05:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iG30BQaXAGEqLSDxV1GhXPT63qz5CuBaqK3ADfI5mbw=;
	b=XH7FmRR+hMERwj/3MEcTZ/paOce37cqx78pigk7Bxs2E2n4m0Lv5+IgIQWy26+OtjX
	1yRJBe7fgSp0YVpms0VW1AjS3ZHOhzbO58/it7rNfEJRQxxvQExTXJkZp/QA2WJmBl6F
	4lHkSkIwMKAKAomhc2IGtvlQStU3Qx5Znc53g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iG30BQaXAGEqLSDxV1GhXPT63qz5CuBaqK3ADfI5mbw=;
	b=NN0p4xbQM6pLH+p3TCkzdOsAQHCM176cI9Foj3YF6Ux2SOoaQsE7kAas86cPvIDKA6
	5kSOjjzapAzQrPqKquP3r9Sn4w1iCdaGF1nzMQeX4Q/lss19MdAAVFJ6tMzA+H4fnDbL
	63DIWxFgwUygbOLY4En1SBrgzVIaIWRMLvU4FZGjIndznmwYppApN6joVxVByJzAloIb
	Lsz0Y48osYb4ZYkeLwIrijqJszY2320mRm18kFQdC0IY9+D77f5/sP9hXyxZubcjE99q
	yxab8ausb0WzfGOOA5y8ftZ1NeIuulestOhiZ4z1EZAYk5mjmU03H8fsirHDonvl95kI
	xeEA==
X-Gm-Message-State: APf1xPBTn3Elv6iYDnp0Phf/gmUsFMjsHdjBqHDok2MgZDUNMpRDUtWe
	4M51Ep2Oa99wClyA4yUSUyvQkBvfpzLhpyfFepATXQ==
X-Received: by 10.157.72.231 with SMTP id a36mr10598831otj.308.1519738598338; 
	Tue, 27 Feb 2018 05:36:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 05:36:17 -0800 (PST)
In-Reply-To: <20180217182323.25885-47-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 13:36:17 +0000
Message-ID: <CAFEAcA8e_Co6raEiq876ByLnkin1Vbv4-Xa6krGG1MRgbVCuzg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22e
Subject: Re: [Qemu-arm] [PATCH v2 46/67] target/arm: Implement SVE load and
 broadcast quadword
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f57lcGI5nZNr

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  9 ++++++++
>  2 files changed, 60 insertions(+)

> +static void trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a, uint32_t insn)
> +{
> +    TCGv_i64 addr;
> +    int msz = dtype_msz(a->dtype);
> +
> +    if (a->rm == 31) {
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
> +    addr = new_tmp_a64(s);
> +    tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), msz);
> +    tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
> +    do_ldrq(s, a->rd, a->pg, addr, msz);
> +}
> +
> +static void trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a, uint32_t insn)
> +{
> +    TCGv_i64 addr = new_tmp_a64(s);
> +
> +    tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 16);

It confused me initially here that the calculation of the offset
for the +immediate and the +scalar cases isn't the same, but that
is indeed what the architecture does. Maybe
       /* Unlike LD1RQ_zprr, offset scaling is constant rather
        * than based on msz.
        */
?

> +    do_ldrq(s, a->rd, a->pg, addr, dtype_msz(a->dtype));
> +}
>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
