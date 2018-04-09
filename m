Received: by 10.28.71.155 with SMTP id m27csp3050394wmi;
        Mon, 9 Apr 2018 15:10:23 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/anDEFwf7K00SvnOA72BbZFMYZ2aQ+tWg/KWzgeZXKPSyCdiwNQ0V1NVHmPygRWzpq2uds
X-Received: by 10.55.226.1 with SMTP id g1mr34223676qki.47.1523311823624;
        Mon, 09 Apr 2018 15:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523311823; cv=none;
        d=google.com; s=arc-20160816;
        b=C1uSqZ7L7r8eHtbxMpaPTaed915kVpA4OrK5IEgduFLmyUEu3/EWNfNOKUJP9ces3z
         l8I9+3WgGWU+c5ljwuXvuGAHDl0QL7J2e62jSi7nU5sbCpboxWFO8XyRlFmmUPTYaypO
         QUsn6NvuymrNlxvnGszfBlLpPWZNziy5r1XvlyYSUjRsH+f8FlMUuf4xX7hjLfW9PYGi
         JQ8TSPXtSphtKyLFS90V0vpyedxGzWzyegBmxfZ3HJQYh0L1s8O4lUjUZ9cKgiaG8NwE
         EE0R9aoltrIzb6cN7Qn1xtAqjunySrFQZjipDODY13PJpDOGQWUrcXqowNvN54SebXwZ
         QKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=SUFZ0a2B9s2/4pqcKuc1UxYusPV5kFRQ4SFMJBnk9T8=;
        b=BdKT75URonOXLbOBicl0Nq+aXFAKYcWHw5oyOgxfMXhluvE42Z85EmMQ4nDQ4lKmdY
         Uudy9+Dxu7ErFH4y4m4AHLqvgX2CZsMiohvQ6YT25w+TRsMjJnpFr/xh8BF6SBTC/TMl
         95TcbCpsePsPqc+a3JrmrJVNBMVLPU2bERunGkFg3K1k9HlsJvxGkM74CSo1sawZw5wL
         qQtGvdL+jDImJ/SH268/0ziEmDl3vLDzCxun9sGu6iQqbGMyrUjf51skovnJJttd62Zo
         YPb/Fu8dteBNe/S9rKKm2z9irkmFilFxtLtT/rpyWBn0ARL0dCEqyYGc6aPu4aRunSOn
         Xyew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TgOETNku;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4si1461643qtg.26.2018.04.09.15.10.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 15:10:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TgOETNku;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42591 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5ezX-0006WD-5a
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 18:10:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1f5eyO-0005nl-F3
	for qemu-devel@nongnu.org; Mon, 09 Apr 2018 18:09:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1f5eyN-0001RS-Mh
	for qemu-devel@nongnu.org; Mon, 09 Apr 2018 18:09:12 -0400
Received: from mail-pf0-x234.google.com ([2607:f8b0:400e:c00::234]:35785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1f5eyL-0001QY-Sf; Mon, 09 Apr 2018 18:09:10 -0400
Received: by mail-pf0-x234.google.com with SMTP id u86so6554744pfd.2;
	Mon, 09 Apr 2018 15:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SUFZ0a2B9s2/4pqcKuc1UxYusPV5kFRQ4SFMJBnk9T8=;
	b=TgOETNkuzBvvbY0yUGnlznwto2YINqoSMI7L1gmKYbufSRn5wXyZ7w7svuUYiFzEa9
	gAsiCpaiYN4cQSUONQLwdRbIPmwLLMx27D6lpvrzZI99V/gsZvY+1GdsARR4ttYf63gs
	C9hUMWbMylaURLRqm5aOIfsOVsCDV7zA/vWqA+8gVEhJCFnP/Mg9N0KWFji7viMmNDIu
	eqIVcX8USw6K7xW8kis/sch8L6V8KabhZY6Wt9zUi6DoUNqmiBDPAWzQMvazUn73i2V3
	su5jB1/bKFbGBZiFg1UQta4fUsGHhQGsAcPxODKNkGVxOYfhZfDJhaWY3FDJp4SQNvgh
	r6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=SUFZ0a2B9s2/4pqcKuc1UxYusPV5kFRQ4SFMJBnk9T8=;
	b=XpLYDvfX8rYM0ZMWEW6ILRxO69b0wcqBgClOQ+ChEFhtZFAjfl24gHDgYN7P1OJAy2
	rCb689G/LLEBgqckYQBCODLqutGpTOHADaLUU9f0ruRu9eEiO72N1DS7ynR40u0CtVSf
	kj8C/TnoOtElOu8A7a66TH+w2kTQUChKOPu878QoTM1ri1sJfmSsGi6e1Wg3pnEKaDc1
	nLWsUFZtQlkpXGx9uehgIOb8Iun7NWuTiFfbbNDnxGfcgIXRFnlfLVBkxQOVjDBFAsXl
	Q3kCp0YX96DWGtDc2OK8Ps7RdKjj/EBCAycFQ5B9Ew0h4wl0eKLdWq6oepKdjzUJqEno
	5R2Q==
X-Gm-Message-State: ALQs6tDNOiuzNUpzizFS/uEOmbcBOYentMEvcjybMCuP7o+VQny36U+m
	654oCEPPd4WczDSiRa6PHCrvy8at
X-Received: by 10.98.32.199 with SMTP id m68mr543478pfj.218.1523311748564;
	Mon, 09 Apr 2018 15:09:08 -0700 (PDT)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.googlemail.com with ESMTPSA id
	d8sm2348389pfh.177.2018.04.09.15.09.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 15:09:07 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180409103834.11285-1-peter.maydell@linaro.org>
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
Message-ID: <1f4f8003-09ed-b2f7-5709-6b74c0fa2f7e@twiddle.net>
Date: Tue, 10 Apr 2018 08:09:02 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180409103834.11285-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::234
Subject: Re: [Qemu-devel] [PATCH for-2.12] target/arm: Don't corrupt
 insn_start arguments on 32-bit hosts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alarson@ddci.com, qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iyi+ovHWVK6+

On 04/09/2018 08:38 PM, Peter Maydell wrote:
> +#if TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
>      tcg_set_insn_param(s->insn_start, 2, syn);
> +#else
> +    /* tcg_gen_insn_start has split every target_ulong argument to
> +     * op_insn_start into two 32-bit arguments, so we want the low
> +     * half of the 3rd argument, which is at index 4.
> +     */
> +    tcg_set_insn_param(s->insn_start, 4, syn);
> +#endif
>   

Ouch, good catch.

I think we should fix this in tcg_set_insn_param instead,
as several other targets are also affected by this.


r~
