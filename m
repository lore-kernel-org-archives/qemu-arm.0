Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7181279wrw;
        Thu, 15 Nov 2018 08:03:16 -0800 (PST)
X-Google-Smtp-Source: AJdET5doKo6UdFLvQGPHEpGWyXEp7SARqa1kZhy/WrjEZ21iLiIbXB/Xnq9chanK7g8r05LsANmY
X-Received: by 2002:ac8:2577:: with SMTP id 52-v6mr6176173qtn.88.1542297796068;
        Thu, 15 Nov 2018 08:03:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542297796; cv=none;
        d=google.com; s=arc-20160816;
        b=g+FJqW7yvYXpLO3mddibv4HGb19t42d3AuzyXQfxbFvif2twG4IGw6DY7kaEUv8Qca
         sb2v2AAgik/7ddYZE7PcoHaXcW/a/WU0j5dFEH/J+QLWhPhYoeuyM3iNP2a7OPxp/cPr
         RZLy0URxOj0/cPzGiEsGOE1jdHvPlja2gYPtt0XDuDXKvwoi6LXRn9zON/kPc2Ps3XIQ
         H6497PBiczf9MNa2ftKL+2vtqANarWxek2cnb+dFkXWXBycf9lO5GjV3I8qk9KdLXXCT
         kxaEUk8D33TyaHdax7lUFyqbBjcWYP4wAFZuimCAv5vrC6aJacJ7mhEn1HnnJBLSPwWE
         9xJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=UmSKfuHKAL2ZcZD8RR+XcvKPteZ3FnVumBoucm5SQe0=;
        b=MJ4/esMScUw1x8ZRlCUfBYBzyoW5n+Zs9J+v+6Wph4hxYVlxeyvqC/BhHi0bFG4S3s
         Z8YM1xLXSqK1yxOhu0mfJ3uSisj4MWbYx+8RwozzRs1WfTRmM6og1ZkOKWXL2r5nrTP+
         IYvTWQudTJWJJQhAnKEKjLZLwR7hlStbhT1q2H78pwi87gb9pWnELH/W8WY/Kvp/y1lB
         vPfbmkl1i3+QE0+MHY/sTE3XBG2YIXtKZWjTeieSPmlbt67z8uHaENMdjCULViu4sLs4
         69YL9B2njtQH/LpTJeGxdU5JyQyAziiSt04Os6SuppjQDLkLP4Sq6kruehUHxI6HMI/e
         iejA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h3I7VHyo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g132si4383006qkb.57.2018.11.15.08.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 08:03:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h3I7VHyo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNK6t-0003kv-GI
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 11:03:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gNK56-000394-S2
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 11:01:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1gNK4s-0000yG-TC
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 11:01:17 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33329)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1gNK4m-0000ts-6k; Thu, 15 Nov 2018 11:01:06 -0500
Received: by mail-wm1-x343.google.com with SMTP id f19-v6so16187339wmb.0;
	Thu, 15 Nov 2018 08:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UmSKfuHKAL2ZcZD8RR+XcvKPteZ3FnVumBoucm5SQe0=;
	b=h3I7VHyoMv90iibr9nOQY3P+qqzrhgurSlJ+xCpkVphvKkwRb3i3/3H2CF+3GYXcZL
	OvwoAdA+j7HNgFuX7THHMD2oYNDppjBYgZyl+QSuxBq/uQQhTQaGHgKQ+jyvEr+MkPBv
	x/dHm8VSWQkuqvZKDopL+7L2hGLY4uIu1RioITnY8nbAk7tZKBZqbRJE7oCKrhRHmH9B
	FttX5TQFe99FmnlMYtofSIcnAfQrgrws2E1HhXS7y2REOfa4eyGy5KUtDtZe3MLZ9PXT
	4YaEs605SMF3l8dBCzdT1lPpm3bQMTlEInqLyk3XqUEmzqCHwhBKhA9RtwCFq6RR9mvW
	6QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=UmSKfuHKAL2ZcZD8RR+XcvKPteZ3FnVumBoucm5SQe0=;
	b=q6DOuUSDp06jGyZnrsinZWOtrltYIKeFruLiu9y6THj9U+YxbpP6a5wyCOqQ4cYtVn
	5XicXcrAypAxbTu2P2xz3QExWvm1klDgMhl6fBRxfd5c0+wFR+q119AWfzgeuH/kHTbu
	AtgICx4NSGmMzIP1kf60IaFQ1vk9kdmVMAXNSQbauDVZceclMTS/0wwSF6Gp8c2knhhc
	8eesIJmleFf1hVlrfy+lYTRFBWVtQnFZxeezYuFecyPCx2mMlQwBPud62Ji0qkR9IB4b
	YaTtQ1mX3WZMdQiW/ceVyIJZQdYFUoY0MrGewS7xPx7qx9GnOrmdSmmSClhe7Lps615F
	Ppfw==
X-Gm-Message-State: AGRZ1gJraab7dhopL/H8OaRSH+RmNyRRmXmjuiMr4iXvP8q1A7B4Q3Wp
	+4cWsowPcVOAuXkGDJPMfro=
X-Received: by 2002:a7b:ca53:: with SMTP id
	m19-v6mr5764204wml.47.1542297662313; 
	Thu, 15 Nov 2018 08:01:02 -0800 (PST)
Received: from cloudburst.twiddle.net
	(57.red-213-99-142.dynamicip.rima-tde.net. [213.99.142.57])
	by smtp.googlemail.com with ESMTPSA id
	127sm8922842wmb.4.2018.11.15.08.01.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 08:01:01 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-6-peter.maydell@linaro.org>
	<3ac12d41-2095-f0ad-db1b-0e3ceea8f44e@redhat.com>
	<7e05e89a-6eec-257d-03af-78a2d2b60628@twiddle.net>
	<CAFEAcA-cE1cBe3BAxMRbdNjtHde3XGf842rqdc8gV8bN7WHNHQ@mail.gmail.com>
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
Message-ID: <243861e9-322f-bbab-4206-70ccd815edfb@twiddle.net>
Date: Thu, 15 Nov 2018 17:00:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-cE1cBe3BAxMRbdNjtHde3XGf842rqdc8gV8bN7WHNHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 5/6] accel/tcg: Return -1 for execution
 from MMIO regions in get_page_addr_code()
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
Cc: Thomas Huth <thuth@redhat.com>, "patches@linaro.org" <patches@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6V4hRVUBGZkz

On 11/15/18 2:53 PM, Peter Maydell wrote:
>>      switch (offset) {
>> -    case 0x0000 ... 0xc000:
>> +    case 0x0000 ... 0xbfff:
>>          return lduw_le_p(s->boot[0] + addr);
>>
>>      case 0xf000:       /* Manufacturer ID */
>>
>> as the memory segment has size 0xc000.
> 
> Presumably it should be ... 0xbffe, since we are
> doing a 16-bit load ?

Ah, true.

> Yeah, I'll put together a patch which makes it use the qemu_log
> facilities rather than fprintf() and hw_error(). With that
> plus the case statement fix then QEMU correctly just sits there
> as the guest execution races through memory...

Excellent, thanks.


r~
