Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6817204wrv;
        Wed, 7 Aug 2019 10:27:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5/ur9Qc10IOfiwn+ynAII2BFQQgBt+jSzU5MYjPJADZ+BvhIavt5+wxTXkEDijNU7VAcb
X-Received: by 2002:ac8:31ba:: with SMTP id h55mr9309964qte.363.1565198866034;
        Wed, 07 Aug 2019 10:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565198866; cv=none;
        d=google.com; s=arc-20160816;
        b=MNcQi9K8lk4LS51LSuP2AZ9EefdCf/xCmI+iYQ7Xc10AwFn1G9m5jSyNL3/pcVQSL9
         cVD+ZMvm+mdJWiRy4pxwx8Ngx4uToXhpQNzy06ZkYzqAqL5sEiFFPqvUSRSSUQAsJU7X
         FI7G5QFzmvoSzC+s0Ha9+3421+qfPnFwcZFdZdu98lDZNaW1mMHlcPVkpbAShLK7vO8g
         dw+Ye62y+t1h8P+XS3YovpVDmU3dh81I1f+SPp8yTSHpcl8Q6hnFFTH2kGgoiJMnGvGD
         6QpZ4/lZtjOBDowekr10YNdSdWTnPV5oyRcs+2nXdNfVonAzgJzK0uvX30wRUWPJVHeB
         lA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AHdOn7vFi2h++gG3kKrp+8meZRPHwwmLn9Dt/7//sJo=;
        b=gMi9BnxRyUmeSpoz5KNGdv3kkkRTK4m4MCVjgqH+ATvF5GBMa6V7o12/+8+d1JHDTm
         9GaDrXRAxATBd21ExCKps60U9Q8Z9NSA8lGwOLNkAv9ci1y5jJdFSQqU1Ehrms3gm8Jk
         0+uUm7fkCimJkIEkwX74ph87GCkmLGaYNlTyHMzU6NbgFc7IK+mP0XmperHTZws+RKz7
         2a7KCUH1RPhvyzJBP5nPhvFc4WIQKCkPaY3DNsKRTNES7LMualPLFtK3sAhxpCrDgsmV
         gwwMZNfhZoG3AjtuLgtbcoq2HAX/jGtP9UgtALzCw0PmJvcb+CVbscfCwiPU/uXWSWfv
         Py2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="JJMmGeE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s77si4041000qke.29.2019.08.07.10.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 10:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="JJMmGeE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvPiz-0004PT-KR
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 13:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54765)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvPit-0004Or-68
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvPis-0003EG-3Z
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:27:39 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40370)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvPir-0003DY-TE
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:27:38 -0400
Received: by mail-ot1-x343.google.com with SMTP id l15so50188753oth.7
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 10:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AHdOn7vFi2h++gG3kKrp+8meZRPHwwmLn9Dt/7//sJo=;
 b=JJMmGeE/Xe81+uVR1YItaVDeRa20wwlm1Va4/XnOoVzu2+9YwKP8K0xDGqdGjFKfan
 JVs2FUnsUMXoAaR+caeviE+ZD00DJxDU8YrXEz53RTI/1pjCYWAUxZEgwEzInriyMt9t
 9ntFRnctFFVG1cao4Ouyb3Z2GVuU4o3EUJVQ/QVsd5IEIULRqYOgPtJuCAScdGHAuNFw
 LAuF9XFisDp5D/WYde2Fn+Mji0LM4dWOXJvaFCn1GheRDmklEvrgEXLoj5lrkmDrmfq4
 XmfDQS9kktlZ45Z6lbsIhRzFgKp+tPGx+53q3rkSgM1EyxA5ih2QkUYRiovggSupiED/
 Ng0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AHdOn7vFi2h++gG3kKrp+8meZRPHwwmLn9Dt/7//sJo=;
 b=fw9vE1jQv4zGVRP7yEJXaUQYQ34C+YH++MGQ9IUyKkujHA1ZB2JA/OidrT/u/keZqs
 Te9uNCpROBX+zBUaoCJBVHX0yWVjbpZjwLWQgreR7YyYO8StY7JYV3+bJp/67YF/smgG
 HWhH0wn/zGvFhCBxVlSjz7A9QojRnxiBNgRVJQUV+5SoLa3WHWQVv0PgArGH0tOxQZOT
 12FxY+heU7qrkZbIUM161OcTrdcj0c5PjHos88zLHphVbUNw6rLOW6QOXUYUOpyTEX7N
 sfYxNyOXJG6OUpwFGFj+OnuWdio/thKuwTN5J61iNSju3lC8e3pl/QMhZsMjACpWJsYr
 fD0g==
X-Gm-Message-State: APjAAAUc5VB5eLrDqlXlru5hT89iUPygieq91ojZAYEWZSoxbfvmhkkL
 cWYCXCPKBhkn3lsGh9zyGmPnpAOtOhrktT0z8Lrv5g==
X-Received: by 2002:a05:6808:d4:: with SMTP id
 t20mr731905oic.170.1565198857134; 
 Wed, 07 Aug 2019 10:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190807045335.1361-1-richard.henderson@linaro.org>
 <20190807045335.1361-4-richard.henderson@linaro.org>
In-Reply-To: <20190807045335.1361-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 18:27:26 +0100
Message-ID: <CAFEAcA_MFg1_gpaT5+X71s8r5SYZFTizdXs2vQ_6mLooP7E+kg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 03/11] target/arm: Introduce read_pc
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
X-TUID: Q2fH7YZ6H3V+

On Wed, 7 Aug 2019 at 05:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We currently have 3 different ways of computing the architectural
> value of "PC" as seen in the ARM ARM.
>
> The value of s->pc has been incremented past the current insn,
> but that is all.  Thus for a32, PC = s->pc + 4; for t32, PC = s->pc;
> for t16, PC = s->pc + 2.  These differing computations make it
> impossible at present to unify the various code paths.
>
> With the newly introduced s->pc_curr, we can compute the correct
> value for all cases, using the formula given in the ARM ARM.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 59 ++++++++++++++++--------------------------
>  1 file changed, 23 insertions(+), 36 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 59e35aafbf..61933865d5 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -196,17 +196,17 @@ static inline void store_cpu_offset(TCGv_i32 var, int offset)
>  #define store_cpu_field(var, name) \
>      store_cpu_offset(var, offsetof(CPUARMState, name))
>
> +/* The architectural value of PC.  */
> +static uint32_t read_pc(DisasContext *s)
> +{
> +    return s->pc_curr + (s->thumb ? 4 : 8);
> +}
> +
>  /* Set a variable to the value of a CPU register.  */
>  static void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
>  {
>      if (reg == 15) {
> -        uint32_t addr;
> -        /* normally, since we updated PC, we need only to add one insn */
> -        if (s->thumb)
> -            addr = (long)s->pc + 2;
> -        else
> -            addr = (long)s->pc + 4;
> -        tcg_gen_movi_i32(var, addr);
> +        tcg_gen_movi_i32(var, read_pc(s));

So previously:
 * for A32 we would return s->pc + 4, which is the same as s->pc_curr + 8
 * for T16 we would return s->pc + 2, which is the same as s->pc_curr + 4
 * for T32 we would return s->pc + 2 -- but that's not the same as
   s->pc_curr + 4, it's s->pc_curr + 6...

Since s->pc_curr + 4 is the right architectural answer, are we
fixing a bug here? Or are all the places where T32 code calls
this function UNPREDICTABLE for the reg == 15 case ?

thanks
-- PMM
