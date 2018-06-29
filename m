Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp993266wrq;
        Fri, 29 Jun 2018 10:42:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpctKfGA2jLl+H3aPjTV+WuntZ537mQz87ELNaXcOCKGjhWhO3szhQaHtRnGrotm8zy0xsID
X-Received: by 2002:a0c:fa82:: with SMTP id o2-v6mr2033043qvn.181.1530294121320;
        Fri, 29 Jun 2018 10:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530294121; cv=none;
        d=google.com; s=arc-20160816;
        b=DvxDRsmxddwI1Ga+tAPNiLXyIvRtWPk1Kn7rE6N7VJnB9eNb/vKj8C7m0TX84J4Kka
         T2lPtvL7cWfoW1xbThX2nEX0dBbX3wXmPyjKHNVj12OLU5z5yB5ngFKY3pnLVJqsRLS8
         yv1oyp06j8govuTlE8McpvajiWsWYXyC0WfSC7UQA37njIi6afdtpgGVCVOBJ+/7Rmnw
         vK+GK/tp4lsAlHNAdTKQfdc7TGiRZTmdRwL82wlfsmfHYri6jxEZfGAkbds7hBZOZPEn
         QPqG0uWhdk/rCd2BdvCWjVgtcyCFf1Y8qckwnbaysUHKYFub4T0YVdKZlrQVMh5cU0vu
         wXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=tmEfe4FnE6xogikfJPkWWuZRoTGHcohl8+ET+IS6i40=;
        b=kuoAR2A6TDEyl4Ul9JrWOxazmKfJUvQSBCu59atrZAZlsqH5TPYQHFFMi/iOGZQri1
         STQpYGKqpD1YoBfxkx9HWrCtuhODJLoQz4fRvy/6lSTAxZuN/cihFE0irGsh4tmvijnp
         CQ3MABoYqIvNaYmr1pBiBt5DpXpNJ3vSWHG5b1wpWI5/AfnC50DhHhNRMfwxBfo3zqh6
         SNc74vMSTGjMvnemfcWCiPHw7URrCp/2gBOVi8nI9vrd7pNeqi4FuqOR61AOcBW9Nkz/
         YQ5WvenGigPHe7B+RlA3emjkvXPmykt/D42crAVYjA1kppd7ZSh3zN1TNv/JdJhHcIMe
         v8eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p46CSZbX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x45-v6si3922612qtk.32.2018.06.29.10.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 10:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p46CSZbX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYxPE-0002qO-Ps
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 13:42:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fYxNe-00020v-BB
	for qemu-devel@nongnu.org; Fri, 29 Jun 2018 13:40:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fYxNd-0003CT-J3
	for qemu-devel@nongnu.org; Fri, 29 Jun 2018 13:40:22 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:38512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fYxNc-0003Am-Uz; Fri, 29 Jun 2018 13:40:21 -0400
Received: by mail-pf0-x241.google.com with SMTP id j17-v6so4534386pfn.5;
	Fri, 29 Jun 2018 10:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tmEfe4FnE6xogikfJPkWWuZRoTGHcohl8+ET+IS6i40=;
	b=p46CSZbX35ySotv+fofvG/xFgotIeRFcsOW7B4Fao3+lpwYziF0gINRvtYlY1eSO6h
	xPTIjI6ngb/db0hEVcDUVM7YZ1D+ps1LmAMKbyRN5GSX1hmbLhbfulzV0F9wj5NQtbBY
	G8ezv+hdBla2oTqe4MhmV03V+9csmeWCXMmQvuAWGSHEk120sOh0YpJzHLnOarTEj+R9
	/4fmca2LTWbm2L8IwpyroS1wCI1SSA6KUYquqA72r/YK5a4kK1+8ssGAfr5UoGlwp+is
	zOEY0SbzimVTXSOKK+X+mKQZHgIkzaSR7veUza0Si/33hMVNXsSHZsvUJRQF7/XhaWvT
	BKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=tmEfe4FnE6xogikfJPkWWuZRoTGHcohl8+ET+IS6i40=;
	b=cQamN8eEMQt4MY8Wns75QM71Y5XM1n8nIwSrPkL1aSK/xtqbZR16268eUh4U5j4S/b
	c7RgpZbocTDzfOQgDnNv/a6wtOMf93Dw4maIF4ZBKKW4oJFHJBdbxPIX9EVNeX4Wj7c+
	KEDCyi/Zi63x5UeSuT97qN3DPCZYCZEoix23Zhek/tAaYS1LxYZKuWFynjtbknwbPWeZ
	A7qa9igRixlv/TWWTPEQQspDfknSzXMP+/+9p1BfDX0PLrmPYIViyumWk2XX9ak77kxu
	LerpZTFhTvPxZ1ectr2axr5azQ5BYVgEIl9BXNaTqrRILQB8yMQigdsJwQI7ff/mpFn8
	6Whw==
X-Gm-Message-State: APt69E1fAqf1b84Y7QYDvPUqiliDc3HkeMKvJ4QtclgAYaokkr7bGDjO
	7b6H1zyeB4dW5i2VMgCBfEI=
X-Received: by 2002:a65:66d7:: with SMTP id
	c23-v6mr9593442pgw.427.1530294019896; 
	Fri, 29 Jun 2018 10:40:19 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.googlemail.com with ESMTPSA id
	14-v6sm20722202pgc.63.2018.06.29.10.40.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 10:40:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180629161731.16239-1-peter.maydell@linaro.org>
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
Message-ID: <c337edff-5d16-4add-f534-dc0f52a2d420@twiddle.net>
Date: Fri, 29 Jun 2018 10:40:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180629161731.16239-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-devel] [PATCH for-3.0] accel/tcg: Don't treat invalid TLB
 entries as needing recheck
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
Cc: Laurent Vivier <laurent@vivier.eu>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jz/CAErxHmrk

On 06/29/2018 09:17 AM, Peter Maydell wrote:
> In get_page_addr_code() when we check whether the TLB entry
> is marked as TLB_RECHECK, we should not go down that code
> path if the TLB entry is not valid at all (ie the TLB_INVALID
> bit is set).
> 
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This fixes the abort that Laurent was seeing with his m68k test case.


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Also, queued to tcg-next.


r~
