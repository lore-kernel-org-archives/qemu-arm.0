Received: by 10.28.4.212 with SMTP id 203csp179833wme;
        Fri, 4 May 2018 08:56:14 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpW0Hx7QfYvtejXUJ5MyBRJeztRcqcwjWHnnItwr9UqkM9tx5IwwhcytoWz1Dj/fZQNYR2I
X-Received: by 2002:aed:3ead:: with SMTP id n42-v6mr24360772qtf.56.1525449374864;
        Fri, 04 May 2018 08:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525449374; cv=none;
        d=google.com; s=arc-20160816;
        b=WkRp3w0Kka0oik+L9V6amfCmXkCA1NXvWZZfyB0F42ErfUBSlcMst2JHE5C7tfAeAf
         3zQAbQCr9KxalOr/cqo35s9oyVZ3KSjn+cgmXNUbdGA/DNZ5wlLUU0CwjZ0PIMG76rgx
         bSuzyLLWBT5eDtHfTViuEE9aVu/qE9Bf41JVNGTOossVxGsgImL3LOztaXtbM3fOX7Gh
         L8zLyiO/KiXAa+I3ArvEDTSxt+qcJ1iBSZR1jVsaKsmxSa/H4G91NJEPuJI2tNxSNDi4
         OvvZhBSocHsBQVEvSySgFf5zzmQodxZfF5m/QrfeeqWl2wfLWVrKTwQAK73TkQmbY4sQ
         7wPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=2VgQlPTGyUTR5Dp/fxpJ8qmGNE6nOOX5+J+ILbW3egY=;
        b=uZ0k4jGuvx54+TBFWKx4OajPAiNUwFpjNF74DCOgZwVXmP7w/Y1AFPWbkLd3I7pL2P
         q9TsMvEVx5et3fOIg3YmhE7SaeOKqw4fnvfU7iYMncmt5898yBksAEoHv3NDOkIplqkl
         T6b3p8tE0zcIU4Hmkp2t1eCQDYdbDs10YG+Ow0Tczc8mb7ODYiQV3xShdJyJ0oW++JeL
         Myb2SlXPkK2E3fEnrBjfqApWjdIIk1xJ8VURnp4tdd2qYraneHWGGmaD99ZzTNeXPAvP
         QzRSUy2PTDL9m9rwWONO4iUFfuD/D714PVwnt5f+zVxXedZmhmxSTcTIQtQqmoF3btuG
         Xv/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uDy5Jp3V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v54-v6si9125756qvc.174.2018.05.04.08.56.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 08:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uDy5Jp3V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEd4A-0008G6-At
	for alex.bennee@linaro.org; Fri, 04 May 2018 11:56:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fEd3j-00081t-Rh
	for qemu-arm@nongnu.org; Fri, 04 May 2018 11:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fEd3i-0006yK-Pu
	for qemu-arm@nongnu.org; Fri, 04 May 2018 11:55:47 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:43584)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fEd3c-0006oZ-Au; Fri, 04 May 2018 11:55:40 -0400
Received: by mail-pg0-x244.google.com with SMTP id k11-v6so14603367pgo.10;
	Fri, 04 May 2018 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2VgQlPTGyUTR5Dp/fxpJ8qmGNE6nOOX5+J+ILbW3egY=;
	b=uDy5Jp3VY0cEtI7V0HnHsJTzCju8ydy7IrqGnpH5tm9fJxmG7KWO5JOsjydBuw/ESK
	ewP7wh6BGJFLauRHMZcsNQoTLpf0NwZ0LU9w7JX7jVP0/EhkSvxsGXQI5DN3y04w7j23
	3Wx5eTjW2k4N0lVH6DtJ9ljFIV6eHnR5+3OofR02+gWG1QCAzLcYnMNjIiXt2HC9Oe/P
	HgO4rOblqkRC5Azh9UmMInCJlhJGXsoWacR8gwr5r3iS5YHTacidMAYHd9ei2uOMm/GN
	NQMcN7BgvowIK5vs6qyDjqBzVArItQrt54h2wunyM6VFL3jv2KtMCMA2jjkDPInUJcOV
	zqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=2VgQlPTGyUTR5Dp/fxpJ8qmGNE6nOOX5+J+ILbW3egY=;
	b=uFgIItQfvOj8iomq9ySljKN9m1E21Ijl9Fvmvb26VP0Q10irEgkQHxO22xhMxw5v5a
	IsdCoD4f16QDF6cMtHY63bUm9hsn8GskbE+GYwL/KZv7OBX3H+bDQfmwSnWgU49pcOEc
	cLCFbVMy0UECC4vv1qe+R5aqP/NdBFBePz1MNil8GJ0/orxq3jWfUyQ4g6tN6/rlOXyp
	t9o54jjsDqvqsxgCvjj78n7aMBcxsv20D5dl4TyvMnO9DnlecGuXWJeF8t3ROpfA1Y8q
	/ghqlriVl9dOvcfK2wUXUHQAyISVFJlxS3OpWoQcprdx/IaU2VRvhIQwG3J4dNXs1cmi
	Qevw==
X-Gm-Message-State: ALQs6tATD7gEgUkAsPpk5R1aF+1VdowbWcMM8KsP4k9S/zh0NL2v4Pmt
	U42ezU6iNc7ftLLh0/ZktD0V1/1A
X-Received: by 2002:a63:6012:: with SMTP id
	u18-v6mr17777289pgb.284.1525449338747; 
	Fri, 04 May 2018 08:55:38 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.googlemail.com with ESMTPSA id
	i72sm12501016pfe.22.2018.05.04.08.55.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 08:55:38 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180504153431.5169-1-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
	xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
	n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
	rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
	Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
	n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
	AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
	cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
	Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
	eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
	LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
	Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
	94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
	86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
	I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
	VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
	+PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
	AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
	Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
	prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
	/E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
	jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
	VcROBqvtH3ecaIL9iw==
Message-ID: <780abdaa-a20f-d82d-fc3c-5df111887cd9@twiddle.net>
Date: Fri, 4 May 2018 08:55:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180504153431.5169-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-arm] [PATCH] tcg/i386: Fix dup_vec in non-AVX2 codepath
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
Cc: qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rruARUmP40+Y

On 05/04/2018 08:34 AM, Peter Maydell wrote:
> The VPUNPCKLD* instructions are all "non-destructive source",
> indicated by "NDS" in the encoding string in the x86 ISA manual.
> This means that they take two source operands, one of which is
> encoded in the VEX.vvvv field. We were incorrectly treating them
> as if they were destructive-source and passing 0 as the 'v'
> argument of tcg_out_vex_modrm(). This meant we were always
> using %xmm0 as one of the source operands, causing incorrect
> results if the register allocator happened to want to use
> something else. For instance the input AArch64 insn:
>  DUP v26.16b, w21
> which becomes TCG IR ops:
>  dup_vec v128,e8,tmp2,x21
>  st_vec v128,e8,tmp2,env,$0xa40
> was assembled to:
> 0x607c568c:  c4 c1 7a 7e 86 e8 00 00  vmovq    0xe8(%r14), %xmm0
> 0x607c5694:  00
> 0x607c5695:  c5 f9 60 c8              vpunpcklbw %xmm0, %xmm0, %xmm1
> 0x607c5699:  c5 f9 61 c9              vpunpcklwd %xmm1, %xmm0, %xmm1
> 0x607c569d:  c5 f9 70 c9 00           vpshufd  $0, %xmm1, %xmm1
> 0x607c56a2:  c4 c1 7a 7f 8e 40 0a 00  vmovdqu  %xmm1, 0xa40(%r14)
> 0x607c56aa:  00
> 
> when the vpunpcklwd insn should be "%xmm1, %xmm1, %xmm1".
> This resulted in our incorrectly setting the output vector to
> q26=0000320000003200:0000320000003200
> when given an input of x21 == 0000000002803200
> rather than the expected all-zeroes.

Oops.  Apparently I don't do enough testing on older machines.

> Pass the correct source register number to tcg_out_vex_modrm()
> for these insns.
> 
> Fixes: 770c2fc7bb70804a
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tcg/i386/tcg-target.inc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to tcg-next, thanks.


r~
