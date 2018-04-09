Received: by 10.28.71.155 with SMTP id m27csp3058499wmi;
        Mon, 9 Apr 2018 15:21:09 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/zhuA8eWekZ6eLHKLuMdnbJSmQNQYMCxo1vedcrqDgqpNzmem4KsCxWnaPVAKAi6Ec/Zap
X-Received: by 10.55.172.5 with SMTP id e5mr28680738qkm.81.1523312469695;
        Mon, 09 Apr 2018 15:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523312469; cv=none;
        d=google.com; s=arc-20160816;
        b=iLCBy+rn260zu577+BqO3Hqb9nzqNEf7s7Vu6oBddHiUrFd4UzXmhSM1UsdTe4Z1l5
         hMW8BBdgcLbs4ShN8TRa38ZUs7iAlyTIB8/e2A7kcE/354z2mHQGYYRT+OJZgBDzGQlx
         ivyWKWLMKa4sHxc1fXEDVGfnKsuSaarDN8xhnvNHSoJ0IPih22nWUGJsJY0/rKye0MH5
         ETIjuk00N63SBy4+UwqvZUb2KXKZqBVCD9OTYv/wnI0dxrJrOYM3ePJcO/xsd422gxHP
         FOd40WQYL9vkrZeN/7QG74kjx9Cl2FXztjAKQlPBHzV6CFpfsurrY60cbDqAkFk4J+Vp
         szkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=2EZgVXBBRyveuUN6Fgvky3fL6kaXnnfwZhFW8jS5xN0=;
        b=osce/0cnuRH+tnwJPIJOkdXdnQ6+LK70qzqfE4reXCq9fUJbmTP9FMB6NUNJIBp0Si
         s+yY4N4SQOgQtehaHDZD8nPq3PuFcl1+ogdnel62rHtTBaj1EtkGpLI/q6yeOHXqVCG7
         60xvcb1RQQRFTZS+GKH731+aLNl+HYQjmekmrk9KgEtya8cWmatqu98/6EWF1DEF+EMe
         tSg1zIpy20aXJpjO7P0U+RkuCSqsoJCD/QTuTWyzxWbMLw5n3iHWef43vR8Lrsa9Iy/Y
         KlP3fQ/3rGFiznwsrx7Cj9ApmZ5inpALtPwQEmD17BC3B95I1bC3a3hR5GQQ0q3/QwhU
         HogA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VzAirFoj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6si356012qtb.24.2018.04.09.15.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 15:21:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VzAirFoj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5f9x-0003Ck-7V
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 18:21:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1f5f9P-0002vn-KY
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 18:20:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1f5f9O-0007YN-FH
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 18:20:35 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:34584)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1f5f9I-0007Ul-BJ; Mon, 09 Apr 2018 18:20:28 -0400
Received: by mail-pl0-x243.google.com with SMTP id y12-v6so5958836plt.1;
	Mon, 09 Apr 2018 15:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2EZgVXBBRyveuUN6Fgvky3fL6kaXnnfwZhFW8jS5xN0=;
	b=VzAirFojM+5MQba3BeH1CscQCfXUU8FPAmeM29QRAsDjp8DQNa9A46EA1dxWEGdIsK
	Hj+LBQN2u0+2XTSy4cmRGVn52OizCALq+WDbxOAJBMXpUtkBaEW97mRQneQi1uxx0ZaC
	i5t0kYff2c5BqyqkUI8RCcWO1++Fkn+GBF55b8+VkjG2UbM0y/veYz/DsdiuQ0b11fIH
	wjWh/IpumNvt3iIyduNvw+OSgxdruyo+CnQr/qycB9AiTnjS9ouFoV3DZEY/87QXV6Mq
	zhCj/ldVutIsK1k6kQwN5H8ThWOFqwYxXOrWoYOR2WyQK2CFuYPBcJs9qj7jKACj5Arj
	ovgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=2EZgVXBBRyveuUN6Fgvky3fL6kaXnnfwZhFW8jS5xN0=;
	b=KK8/764qyzBGhs0M/lFoYOSq46ln5hVcfWmp9/gt5EOcBmJwZciJPEjgE/F3ooRHD8
	d9vtmyLWMGWhe7ay+0bnUb2gp7gnyNt4A4Z96pCnw8FQjuTQ7fpozyiEPE4EcdU2SH7B
	kfiE0O3ILv54c3oxKC021woBlwmKizGTbyxAze2DEpsm7QoX/urdw5ojiTR3VOoid0Rt
	pj4kXAsjyv1D/1CHvp57zZjOJNp7JHcbE2nxRbKwX0y/VqXD2Fo0a9eZvCT0iWiiRf3j
	8YgaySzQ+YDRbihCBY/abWG/JeCtQk9D2HdKyUb/BZxBQJ5whbSj5Gzz5TpCiG/lxeq/
	Ae+g==
X-Gm-Message-State: AElRT7HQa0cC2cd40DzqVEz7aPZse3aUEmJgJIbUnsnbSvSq4oKu2Z5U
	08SPz2+taa6iuBWvke6iGnHRDlIU
X-Received: by 2002:a17:902:96a:: with SMTP id
	97-v6mr31077627plm.266.1523312426994; 
	Mon, 09 Apr 2018 15:20:26 -0700 (PDT)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.googlemail.com with ESMTPSA id
	t18sm3211689pfg.103.2018.04.09.15.20.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 15:20:26 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180409103834.11285-1-peter.maydell@linaro.org>
	<1f4f8003-09ed-b2f7-5709-6b74c0fa2f7e@twiddle.net>
	<CAFEAcA-35aH7KnFK+vkSAWf0i2oz44E-ov1eP0+TUfpOxdYxxA@mail.gmail.com>
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
Message-ID: <7c969999-7281-7f4c-5ad2-f72fde1b24c4@twiddle.net>
Date: Tue, 10 Apr 2018 08:20:21 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-35aH7KnFK+vkSAWf0i2oz44E-ov1eP0+TUfpOxdYxxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-arm] [PATCH for-2.12] target/arm: Don't corrupt
 insn_start arguments on 32-bit hosts
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
Cc: alarson@ddci.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nJiFFOEpu10N

On 04/10/2018 08:13 AM, Peter Maydell wrote:
> On 9 April 2018 at 23:09, Richard Henderson <rth@twiddle.net> wrote:
>> On 04/09/2018 08:38 PM, Peter Maydell wrote:
>>> +#if TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
>>>      tcg_set_insn_param(s->insn_start, 2, syn);
>>> +#else
>>> +    /* tcg_gen_insn_start has split every target_ulong argument to
>>> +     * op_insn_start into two 32-bit arguments, so we want the low
>>> +     * half of the 3rd argument, which is at index 4.
>>> +     */
>>> +    tcg_set_insn_param(s->insn_start, 4, syn);
>>> +#endif
>>>
>>
>> Ouch, good catch.
>>
>> I think we should fix this in tcg_set_insn_param instead,
>> as several other targets are also affected by this.
> 
> Are they? My grep didn't find anybody else using
> tcg_set_insn_param() except the gen-icount.h code,
> which isn't using target_long arguments.

Ah, the s390 code I thought I remembered is still sitting on a branch.  I shall
have to revive that for the next devel cycle...

> If we can fix it in the tcg generic code instead that
> would be nicer than an ifdef here, though.

I am working on this now.


r~

