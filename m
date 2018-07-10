Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3874435wrq;
        Tue, 10 Jul 2018 11:28:08 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd/YgZVs3SdSHScH4kjJLW9Wfi1UwEmmqX6hahKchcGquZJ6b1nJA5CMaouy7qd/sWwKGpV
X-Received: by 2002:aed:22ae:: with SMTP id p43-v6mr24035776qtc.393.1531247287913;
        Tue, 10 Jul 2018 11:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531247287; cv=none;
        d=google.com; s=arc-20160816;
        b=tPcqlczS0nbcmy8LsPV32hJhwtNdm6JdtpZGFlwdNQQJ9knihjMG3qUjC2HUGQQBGV
         Ct9ZxB5MCBCX/rhTrKHR0uz364f//XHM/6/FyUQW0QnIVytjPdqaDxvr/GwdyQj9itGc
         6E1eJHahHWFmOF56Au1ymZ1Eg6N/DLc9RZIovGt8snqxTImKvvdweTKE35XcGo1E0q3o
         orsf5VgixUn9Co1uf739RmV2ZJneWlkqlAVugtPB/luzJkqepWRn9A0B4cGtEFW7TZDy
         tMVVJxdAnkKEjIAYOt/Gf3ZclwUvR5oPw3F7+n0kCEX7PMe9lw0rx/88FYiSl0XhWfgf
         HCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=mkV8FanCdVjSGbRGB7DLr8i42MBXM/6w5T3N2x1ryaE=;
        b=fOGTMcAey4Pchih/Apj5dNI71+M7bOWPIVfvmoZs2lO1T8I9STrNG+eppW+QULzdZj
         Y5YI+XbGG8DBGWxWrLvisrdAN6xaFWMT0VpwVqhJRfj3POVmwuABDA1w+Zi/YxLJYMY0
         lIlTzZbf2F8h9ChxoNq84nTdbzR4Wqi/SPhSSKwEZz3x9a74l692K3SqrqL2+SJCaT0v
         lrJgTgj+RsIvUsnLeUgzFt7h5pMEdPk8I95zwg8FrMgV7PnZwJ2nsB5H942uxNrgZyDF
         tLi0Kc7CzG/PIvo189hilzfk3W8SFOhjHSBWD356UvMpKNXAa3NBk6K7jBAslfUsojoj
         WPBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nry+htNW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a6-v6si1641791qke.260.2018.07.10.11.28.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 11:28:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nry+htNW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcxMt-0002Fe-D8
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 14:28:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxMi-0002ED-GQ
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 14:27:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxMh-0002Sz-NS
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 14:27:56 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39015)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fcxMd-0002QL-AU; Tue, 10 Jul 2018 14:27:51 -0400
Received: by mail-pg1-x542.google.com with SMTP id n2-v6so2223558pgq.6;
	Tue, 10 Jul 2018 11:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mkV8FanCdVjSGbRGB7DLr8i42MBXM/6w5T3N2x1ryaE=;
	b=nry+htNWX5cLAAfX7mvS/NK0B2bFx9Sf2w7Eq5twiV4VqZzR8QB0+DlRXtGbkED8yX
	ogcqs/WsFqvsu38sHbGBjO4RY8A3nXDgXSNhVOfDhe1Z8qjhQcd02FlK4+kkOr1NtJPT
	a+/8LlCWc+10QUQ0x3n9s/tE3tHnUv0myFTaPP4sWqsdshmnFs9ysNPVic5uFUOlqjAM
	gppS8Py08ySpLLvAeLZv6mc4wOB/JpoDMZZZ/HrU59wtYXIF5iwukADR/eW4Yg6Cn9cw
	afZTdJ5sJD/e/cNfUDXx5Yvgf36R2k5VbM4QqacRE12Oz/YYk6A5Hc+dwa0tJAKeeC2A
	ZCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=mkV8FanCdVjSGbRGB7DLr8i42MBXM/6w5T3N2x1ryaE=;
	b=C+lMzqXNhYffiebOH5rwy/XpNO0Y+4ecRVc3e20aNYeYZXLToE0xU10QNBCIAcspEY
	yhfYqMWJqKJcZ4QyfJUcHQr/aQeAQBxhnckAuD1Sq+5G6JnxSuwX8q/W7mBYRSZmk9JA
	9DU7jPonekzzNNjPLheVGP7Vlh0uCOncvtEQhBktRti8SJT2i2bH9iaP88kmnLBkAUgQ
	tzmRsF2qEBF8tYzucimVjS/g5eS59MU2u505Nn8sH60pzNKIueliDz7GqSm0q2Mb3qay
	5FjZuyA8JfmPoL3+PILwL9aGNn6MuWFesyni5LRsDaFpeMxXvTDnj6z5awAMLfZxXXLd
	bj1A==
X-Gm-Message-State: APt69E0ZCOaQ09/k2JdbYdpKQJeHkagc/1qTS0Tq+izxFJAcIWSqvfqB
	2ssY6JaM2iVSoVH43VChqqQ=
X-Received: by 2002:a62:3cd7:: with SMTP id
	b84-v6mr27015785pfk.183.1531247270205; 
	Tue, 10 Jul 2018 11:27:50 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.googlemail.com with ESMTPSA id
	y3-v6sm37704318pgr.44.2018.07.10.11.27.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 11:27:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-4-peter.maydell@linaro.org>
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
Message-ID: <e24ed93f-e386-ec00-0d83-1bd5b68db0e0@twiddle.net>
Date: Tue, 10 Jul 2018 11:27:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [PATCH 3/6] accel/tcg: Handle get_page_addr_code()
 returning -1 in tb_check_watchpoint()
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
X-TUID: T9xEVzwbDtzW

On 07/10/2018 09:00 AM, Peter Maydell wrote:
> When we support execution from non-RAM MMIO regions, get_page_addr_code()
> will return -1 to indicate that there is no RAM at the requested address.
> Handle this in tb_check_watchpoint() -- if the exception happened for a
> PC which doesn't correspond to RAM then there is no need to invalidate
> any TBs, because the one-instruction TB will not have been cached.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  accel/tcg/translate-all.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

