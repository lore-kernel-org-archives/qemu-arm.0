Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3877403wrq;
        Tue, 10 Jul 2018 11:31:08 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdFHiPs3yG3kZLAW4q3P8U1SQrzQtAw6lP/uKTe44PULypEEWxgN9PchjBoJY4RXxR/oPH5
X-Received: by 2002:a37:7c41:: with SMTP id x62-v6mr4543021qkc.52.1531247468256;
        Tue, 10 Jul 2018 11:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531247468; cv=none;
        d=google.com; s=arc-20160816;
        b=EhINnBYmM5wbmWl/tnyOF89fgHoAKEwoYkPL5TVnNp72hXjsTjzOXrpYtTJWF4g4l/
         LEneboLPI9grxU/cYSiPDJ5BwN8GuEhdriakpRb6qWMycKP6d7JE73nU2w51ex2EDI40
         eTr2MyAesOm0wwC/p8LeKrcUu4klLdo30jScbVVOaFz/vFpQPU7DO4XUN1z16LoPCio1
         DYwhBq8rDPNHV8n5Sl65qcAT4UChKVAt7L0scbvyqtyoZOWPGq+3I8pfndYShHsWQu8T
         pYCFZYIrZU1J9gvd+vtascEiai7yWkTvcgLcpBn+lFcDjAgn3gF6pXrLELx0Qp1HjhwE
         Xdiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=pY3y9Lww4L72tEeVeNZV89oq6N7Q16w/OCSvzCW4tuU=;
        b=IWz+hxRkx3MzwuPjpZaAa49C6hUCSqzinVaAOJQ3ehaAopXzPyl+npTw6CEFNFgdEi
         G+ycL7A5G7vdjJ1FAZGc87ys0RUExPjCxUiyvG7gsW9rMmPS818dKoLGptOilG3USHuH
         qVzQRv3SJp6dnBly4A8bJD3hxOSuiq9LpZNy2KuThGr/XwwyGRzGOClo+ivZxxcPtIe8
         CS2tCStXfUz6MzD2QAE14bBvoeFWsX/uXgJa17LxuIS2va+jhNZZfD3QXX9eOdBnrfqd
         QupaPCIJU4zozE9062lNV6FSvAvQJNFJNwpEth5Em5eXDZEWI7qTIS1oWUR5exTq+kmd
         vDmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i2SxmxbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j11-v6si429635qtf.169.2018.07.10.11.31.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 11:31:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i2SxmxbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcxPn-0004dx-NP
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 14:31:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxPX-0004cV-U5
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 14:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fcxPX-0003ou-2j
	for qemu-arm@nongnu.org; Tue, 10 Jul 2018 14:30:51 -0400
Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a]:42274)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fcxPS-0003lF-JZ; Tue, 10 Jul 2018 14:30:46 -0400
Received: by mail-pf0-x22a.google.com with SMTP id l9-v6so5031870pff.9;
	Tue, 10 Jul 2018 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pY3y9Lww4L72tEeVeNZV89oq6N7Q16w/OCSvzCW4tuU=;
	b=i2SxmxbYKJxPeHVHwPPmu3ucpcTrRXanE8fbmf9Ocll94uZphABZeh8mnxtOwg3f/i
	NIpAqOjPzr5ouZuGaqpBXFtswvO7SSI487Q712lLb3c18CP7HUqSwbdzFd3moU5vjvYB
	LH0FezeC7SXJPDDPS6PBKH2O7VNIUr+fl7u8oBSK9lbMdzGccPLJ+c1LOyRKvD9Hm5Bt
	g2p7Q5NRE32131f2wVFmlKNGUDp7BKzhF5VJNXLJ88UYW38EeyhhmJZAfYF6puArCb6a
	HDagQBlwJtUe8j6+0czyFxfEkf5H3/BDtskIR9kJMwiM88yl9At8BntX3r6FDYAZzlqD
	PusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=pY3y9Lww4L72tEeVeNZV89oq6N7Q16w/OCSvzCW4tuU=;
	b=iRZk6R6yMhfskKMgAQKDtxhOttD12571Iv9cO9YTERvh76IkrzTcen5xc9mO6YHXwi
	N1Pc3LaLFiIRsFV+bxr3U1mQudTvX89nyKuTI55gqe8WiGjZBgYPkOvHV384gVy+vzQg
	tDPfCCdKZ45fARCy/HHkATipzi2XCEWvMOsJUiIz99A0aSOvTACdEtf/fjFfgiP4agC0
	U39DKRMzHSbb+XqqP9eUDzJsbiMXYR16IKyyPL+nCHjFizb5XztEzFvSD3j5rtHlp0Ug
	C4+Hab5pUjflxEdjIpgXGIhHffW6k4Rd3M9oQUW6JMbTQX0/Xwcfn6zn3+u/JswowvNE
	3Zdw==
X-Gm-Message-State: APt69E2VD5tHZnDbfoHc1rf0zrjQtOEHsb9dS0aDN6I9tin4+GHiu+DV
	bipOgr4E1QsTMLel4jijEEk=
X-Received: by 2002:a63:2a0b:: with SMTP id
	q11-v6mr16947413pgq.36.1531247445536; 
	Tue, 10 Jul 2018 11:30:45 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.googlemail.com with ESMTPSA id
	b67-v6sm56597348pfd.74.2018.07.10.11.30.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 11:30:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-5-peter.maydell@linaro.org>
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
Message-ID: <fb6279a8-26b4-66c8-57da-4882e0121e76@twiddle.net>
Date: Tue, 10 Jul 2018 11:30:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22a
Subject: Re: [Qemu-arm] [PATCH 4/6] accel/tcg: tb_gen_code(): Create
 single-insn TB for execution from non-RAM
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
X-TUID: MDezLP2BiJkM

On 07/10/2018 09:00 AM, Peter Maydell wrote:
> If get_page_addr_code() returns -1, this indicates that there is no RAM
> page we can read a full TB from. Instead we must create a TB which
> contains a single instruction and which we do not cache, so it is
> executed only once.
> 
> Since this means we can now have TBs which are not in any page list,
> we also need to make tb_phys_invalidate() handle them (by not trying
> to remove them from a nonexistent page list).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  accel/tcg/translate-all.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

