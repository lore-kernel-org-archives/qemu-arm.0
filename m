Received: by 10.28.91.67 with SMTP id p64csp1871763wmb;
        Thu, 1 Mar 2018 06:07:57 -0800 (PST)
X-Google-Smtp-Source: AG47ELtqakCPYoByVl2biZupZEDz6IXNDW7sSwoQ0MtrxvYxz3dI9XBAQ/5pHO1SuMI4Eh2MyBmm
X-Received: by 2002:a25:bf8c:: with SMTP id l12-v6mr1126145ybk.7.1519913277485;
        Thu, 01 Mar 2018 06:07:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519913277; cv=none;
        d=google.com; s=arc-20160816;
        b=sUtJy/wr3wOMYCZ5tSdj/l5BCrdqMCk7kDZMbFOJuhD73wtjob5mcuJ2XRrgT2nPCI
         Y5FFr2NM8qYZPi/huSr9vfbp6wr0CwYO+x7zqXD44OJxzmmA0pxdOKyhfrX8JPv/LTe2
         zCqi4EIM9d9WsfGS/m0iqdA5INv8Acyr7YYImCo+HhqU9ibaXxL9lN8UdvvAAoOvcU38
         /50X777jDdZbabrivijLc72skB8ybuti/MsO9hbVhWRHIdLs5334QiLaGkA7WdvzNSZl
         6tTTKDBHrebX9Zb+9KjTIUvbc9/F96ZwvYeCctxsekJheFdXhHzuQnhaX7r3Lc81yfUm
         oJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=44i8mQGka7tzgoGgJJ3Xt99A73xAxYEXXE8f79Tle5g=;
        b=yjhNSEFFrLwe/uH1fQYPZlNdF6GbkUguncRoPF4rycjyPoeBDliFjhWmpQQwEvibWW
         Ee5eSUWXh0LcOfglqyqHi69RvGh7te/rQj7/SxF8aoqGE5M0JSJMBdu88WtHWsZSTvlI
         vppx554dz6dgUxPgX66Fj5rdEtJLs/O84Pk4+MOmvvas32xfkUIP3G6mEGM+Fq/PY4t+
         MUXHLJQ8ipbwGkFBRp+fAhGJdy5ZH9c11Ac4JGc1kE8AS21t7sVpSKawuqYcCspOyqfI
         NriwGBR0/eyjWwTTAIHtNZ9Rc+q+2/EBqRxvRQjsDOUHuJOb8IMuHc1se4Pu4xSw+3R5
         zBWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M4INTqu9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s65si642638ywe.750.2018.03.01.06.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 06:07:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M4INTqu9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erOsG-0001Aw-TT
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 09:07:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOs3-000190-M2
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:07:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOs2-0002po-P5
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:07:43 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erOs2-0002pb-KL
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 09:07:42 -0500
Received: by mail-oi0-x241.google.com with SMTP id u73so4547132oie.3
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 06:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=44i8mQGka7tzgoGgJJ3Xt99A73xAxYEXXE8f79Tle5g=;
	b=M4INTqu9fClRe1nX0wkpwqGfhWUAo/jCE73NCXperNGL0fAyOFpdgAOLntbWJtojda
	O4pRpP4UgeV8+i4j+HyAS1/hwmReNCxbhDEOa72+4ISYjvqPBj73qO0yVAeJr6XiNyjX
	L0QDAFvLrB7qbhpk6nrsUx8lXQE10r7nMPjO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=44i8mQGka7tzgoGgJJ3Xt99A73xAxYEXXE8f79Tle5g=;
	b=KTOk0H4pKqvTtAz/KuKdpt9TwMI8j3JxsegDtz2YHv9Ytu7hjv/bbs28SZMVLruofN
	rJjI5JnYcODzCizXkfvwpTZwKq3VW+qLr2/FxeUS6tPVpXAIUZg/AHFHXjiKWDT/C8pw
	O2+RHmdjI+uyPHgriiBvsGuF0jgtBjTHAP6PrzJ8PGoL6hvN3Ru4u1VTe7i7uY/wBLFh
	CvSZZld0j3bQvasLjpwomgINBkfzXg5kV8Kluyu9G+Zv1yg7Y6zBhuRZOBUD9OtkwjCz
	TIpN2XTBJfMzw9bb8EKNpQ20eGDymPg/O0yR/35jUkRcntGVkn4M+ERHyyuHT7k3R0B7
	yyJw==
X-Gm-Message-State: APf1xPAMPO4Wv33kD6UU8GkkpVWv865gILUeUcVUGEwEtiyyagP0ewce
	kDohgghDAlT7hDr657QQ4i1ftgMzzZPYX/RDB1WRAw==
X-Received: by 10.202.90.138 with SMTP id o132mr1172018oib.11.1519913261903;
	Thu, 01 Mar 2018 06:07:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 06:07:21 -0800 (PST)
In-Reply-To: <20180228193125.20577-16-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 14:07:21 +0000
Message-ID: <CAFEAcA_K6caDuE0FBGZKsENHJ--DZoe_w-38CJ+RXE=574MrHA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 15/16] target/arm: Decode t32
 simd 3reg and 2reg_scalar extension
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
X-TUID: EtYlp3HDpQTT

On 28 February 2018 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Happily, the bits are in the same places compared to a32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 3ad8b4031c..ba6ab7d287 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10774,7 +10774,19 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                                 default_exception_el(s));
>              break;
>          }
> -        if (((insn >> 24) & 3) == 3) {
> +        if ((insn & 0xfe000a00) == 0xfc000800
> +            && arm_dc_feature(s, ARM_FEATURE_V8)) {
> +            /* The Thumb2 and ARM encodings are identical.  */
> +            if (disas_neon_insn_3same_ext(s, insn)) {
> +                goto illegal_op;
> +            }
> +        } else if ((insn & 0xff000a00) == 0xfe000800
> +                   && arm_dc_feature(s, ARM_FEATURE_V8)) {
> +            /* The Thumb2 and ARM encodings are identical.  */
> +            if (disas_neon_insn_2reg_scalar_ext(s, insn)) {
> +                goto illegal_op;
> +            }
> +        } else if (((insn >> 24) & 3) == 3) {
>              /* Translate into the equivalent ARM encoding.  */
>              insn = (insn & 0xe2ffffff) | ((insn & (1 << 28)) >> 4) | (1 << 28);
>              if (disas_neon_data_insn(s, insn)) {
> --
> 2.14.3

Oh, here they are. If you mention "Thumb decode will be added in
a subsequent commit" in a commit message it helps to avoid confusing
reviewers...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
