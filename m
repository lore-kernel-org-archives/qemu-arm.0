Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3870974wrq;
        Tue, 10 Jul 2018 11:24:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpecpycPF+TmWZUQ2C6lzzZzxhM92DWalr7ygkYFnYH301ew+zfeYdeNy6FAdXd0AGf3vj+d
X-Received: by 2002:ac8:2a8f:: with SMTP id b15-v6mr24315411qta.405.1531247051959;
        Tue, 10 Jul 2018 11:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531247051; cv=none;
        d=google.com; s=arc-20160816;
        b=buoXZjlhlpSoMt30ZfO0nsiw/6c5qFXUKE9QZf8KSnSQwQ5St8mYS9QLJvDbIEtcrF
         RQyUGFUJkIzgPNF3rjS23ramOscYkGIpnzvg0npizXQDMJK1fYK945wXqCzW7ukx7drT
         KeXFGnoc6LRrmml4vugCWZjC6jwYrlQMYFdns4kKYyvBVJ1s7BcibG2LmzgDhAe6F0xS
         Qo7Kbt24W78Hv7KY5nuv1QJFeZo/Bm/ahJMaTCyRq2Oz7ijkKeNcyX3nj3VMn8m0o3zS
         Rxuh0ik8Ef3guQZG/899kAG4EU14dVB3M+Alsik69CKwCmq3lz4S7KtdLHQLbhhhL2IA
         gZxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Mrw5HZk5W6K4u96ztK28Z7sCHJSHp8xNBsaQ60Q8j0M=;
        b=YEs8lL58kFQ7CZPD47643u2cmQF/Z6aLE9flU15VgxDF20rMfhKJnhO63Xe2eue9kI
         W986aU9b52O6v6u142XCtk2EHb658RlWydIhB/aIN5RFCNC393awXGUTaX1yv/yLff3E
         ybnR5Qt88rhpPU4cpJNUbUZDJG6gwZESvqBTL/Ld/R7McRkn03uSjPsOLVEm7ZXTBd/9
         gGKtQnyvNkBozckmWZOxtwveULUst4zoZKBVQv2JdsBns/moT2YxexZOXWmsA4oHcYoN
         TtF5X9RUFL1n2ZTqDb1VlaZeiCuHrBovzrv/6AWc20qSA7tqsWM9KmtOtn5ESkh1y+sA
         i0JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=m55SAeym;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j127-v6si649570qkc.175.2018.07.10.11.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 11:24:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=m55SAeym;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcxJ5-00016v-Fc
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 14:24:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxIw-00015D-7a
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 14:24:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxIv-00018v-DZ
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 14:24:02 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:46800)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fcxIq-00017c-V5; Tue, 10 Jul 2018 14:23:57 -0400
Received: by mail-pf0-x241.google.com with SMTP id l123-v6so16641020pfl.13;
	Tue, 10 Jul 2018 11:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Mrw5HZk5W6K4u96ztK28Z7sCHJSHp8xNBsaQ60Q8j0M=;
	b=m55SAeymYX1lfnKTiQaKe4kBJcqCBKCoJHXEkyhT5M45xVamKDYLb0BcZeWcmG3nVt
	af9z29CyaeLYuSrwiGgLtlIp2+n3QZGftciNOBqY7jZbzt+FQ9sUi9j6yzQXFoLRBYo3
	1XRwVZb0MWhrdAC7UW/37xydgUOeh69TzLw/RmoMIJL6cn5FHbu6fBKdxPjbhZ4qHQEG
	r/gZgjImuHh1mWJh5QdYVptxAyAgipLcOpOknn52mVNTD5RD5P1vzM+va1fmiLUfI4O4
	8If1lOzAkcN3KecoMjkP2zjLHyiwFVYeaeh4uvpQrhv87gzxYiSkyRH6FO0RemIWsSiI
	AWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Mrw5HZk5W6K4u96ztK28Z7sCHJSHp8xNBsaQ60Q8j0M=;
	b=CrgQ0ke0GCV3W21a28cvB1d18YOozPBg38QpC5sXExu7vvDENZFueN1CqnCHRPL1kV
	FBwyHAu/iuQBotP6oG2ChYbRXonKAR9tDfCJFJert8EGPGAqmbDMpbsZwzwH5YiuNZas
	J+mhjFdH2sYDmECfxGsB6BB8WjxCWA+WkbAYWz+9Z+qAHZZewKHFcSiu2EWFkToVAIXP
	/LjyySZqZKS31YDhY4xYjwCS8drT8ZvG29nnaMtYgw6gK9dVHBEhPvUryjHN3Zep2yra
	VyB5SxdFX5IixONArrL0R7hHu+oHjJ9X9geGfqvs9lA+rsdqyx3UnGK1YQzz3oXBvJpx
	wnjA==
X-Gm-Message-State: APt69E0UOnPkUcdmGFAtv+nGK0Zgl2KS50u7MD7GQkwI52IxxS6uqCTP
	RAHNge1P/nIq1dhWpNrtIus=
X-Received: by 2002:a62:fc4b:: with SMTP id
	e72-v6mr12403174pfh.168.1531247035976; 
	Tue, 10 Jul 2018 11:23:55 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.googlemail.com with ESMTPSA id
	f3-v6sm28247035pfn.149.2018.07.10.11.23.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 11:23:55 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-3-peter.maydell@linaro.org>
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
Message-ID: <5582b918-6583-30f3-fa84-2b03353a2f09@twiddle.net>
Date: Tue, 10 Jul 2018 11:23:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [PATCH 2/6] accel/tcg: Handle get_page_addr_code()
 returning -1 in hashtable lookups
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
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I0UrXsnIcGD7

On 07/10/2018 09:00 AM, Peter Maydell wrote:
> When we support execution from non-RAM MMIO regions, get_page_addr_code()
> will return -1 to indicate that there is no RAM at the requested address.
> Handle this in the cpu-exec TB hashtable lookup code, treating it as
> "no match found".
> 
> Note that the call to get_page_addr_code() in tb_lookup_cmp() needs
> no changes -- a return of -1 will already correctly result in the
> function returning false.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

