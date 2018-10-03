Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp24245wrt;
        Wed, 3 Oct 2018 13:00:56 -0700 (PDT)
X-Google-Smtp-Source: ACcGV607kykzL4bL019KDzmbUgTX0N8OE62VwitBoVnme+jJNV+6DTZQRR50hhwnKWZ7htzM5Cye
X-Received: by 2002:ac8:60d0:: with SMTP id i16-v6mr2630486qtm.249.1538596856837;
        Wed, 03 Oct 2018 13:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538596856; cv=none;
        d=google.com; s=arc-20160816;
        b=CYO4jw6Z9nVbP6ai7eNGX8w/Y0MyXUutWPAgI8JnDi4orFu1bP8iJgMRxGoj0fO9eN
         k+rpQv3hW15WzFJe4IUJ6wDtkUwONVrSvMzZU2t1op6GUVTmA7AcgkOavxK549SJYTxX
         QGVNCCfhBLKnVxxg9zpMmfpJdzHHoRsgGKsxLLjXoKQdfilZrLE7ofCXzQ3FlnHwg3py
         eCEfgBAFB51iJtvkxR0ZCO9logGHguv3z47jFzgho21dtzVJSs6rBjPvuFNsoqJpGLBX
         YdicOLC1IOFErT5SKjJ2zha09cyhBkfggCm6EQkfrFJ9O5+DKQ799IkLo9edBMOzmXKu
         Jw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=26fKZhznioRO4c2tHNQYFeks1gTgokE7V3kJkQD/daA=;
        b=bHA3o/u8bt9ZTNizb5oVaa+vyvM91mAW4d1FRvbiwOg44boiOuLSeTBIFPdDubtmsn
         shYS1R4Ir2CnjpvTvp+a62INJ+G90NbTAAnEj7n+0cQcz/GwQ07AiLBG1dGHUba4WeBe
         /NhsEAgpBp4d9wktt+FkizX9AXK6tWTaEma8sp8Kz+hzXKNguc6ZXgilhuqYREBGE1v+
         57PFjk+4UBRcdhHRJxVQLfx5tSArzH89nq9RQFHRjMZY3tDvV0OJc0BicWgOFwlxZ+CB
         /bVhXNqVGwHM71gcoMnlEI/RsLgnigWZpV/7d28IpMrb9PcVKjR1Fi1BnfdC+XIucF83
         zNUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=huZUTn1i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j18-v6si1508757qth.332.2018.10.03.13.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 13:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=huZUTn1i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nKK-0008JI-Ci
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 16:00:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nK6-0008Hd-JG
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:00:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nK2-0004M0-Ef
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:00:42 -0400
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:36174)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7nK1-0004CQ-Ca
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:00:38 -0400
Received: by mail-it1-x144.google.com with SMTP id c85-v6so10787795itd.1
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 13:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=26fKZhznioRO4c2tHNQYFeks1gTgokE7V3kJkQD/daA=;
	b=huZUTn1i194eldpkx+StiXdswXnl8KwkOJzVof3mfulbLzEdiH6Kt4+5UJhZWo1al6
	bHtIOT7uDPHGSJJ8m9ZBZ61QdHHFT3CbovYFlXDeLwkyJrdJHXvdZxrx9KSashdbpI6p
	Gcru5f9IY56oRQlwvVrOJmfyEnrYQ9kaGWT/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=26fKZhznioRO4c2tHNQYFeks1gTgokE7V3kJkQD/daA=;
	b=kwgfFU/LP3rEWzDeybN25Z7vVQXGL8VUT9GMjmpIK/WzAz/chbbHx8n1dEO15+lwX6
	4rp3FI3LA/PrZgnFXdpQ61DhZKLTKxkMQftYIluFsdpdYnJ10aKpw8vVilJUwpfM4KJp
	/8ahgr3Q/Q8Gg+ssLFtxU4YjjuP3oVpNW4lJbEbT5tOwAYsnjxaVdTbol/uRaxILK9Au
	doYkU6z/peTxbMd/PdibcaQxKtk9g5tM/Rf+LJELOb1zRN0QiHwX/iHQpjF1CV4CO/Si
	LCeWCLooaGnbq1ABB81Z6Q2CrjoHy/FcOSkaeEE4HJXVbtb7T40fs+eKqnNmBEH8PJzK
	EnLw==
X-Gm-Message-State: ABuFfogz4fxavOPQC9Mym7Ua+T2k2ICvWAmQAwGFAKNInmFv+KayzA5v
	gZ+lJA0ygFlUdcJ13uplbnK7+g==
X-Received: by 2002:a02:b56c:: with SMTP id
	z41-v6mr2479108jaj.133.1538596812193; 
	Wed, 03 Oct 2018 13:00:12 -0700 (PDT)
Received: from cloudburst.twiddle.net ([172.56.13.153])
	by smtp.gmail.com with ESMTPSA id
	b94-v6sm1252927itd.2.2018.10.03.13.00.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 13:00:11 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e70755b0-b09b-f324-45fd-e64663bc9aae@linaro.org>
Date: Wed, 3 Oct 2018 15:00:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/13] target/arm: Add v8M stack
 checks on ADD/SUB/MOV of SP
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1UDij6qjZXfK

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Add code to insert calls to a helper function to do the stack
> limit checking when we handle these forms of instruction
> that write to SP:
>  * ADD (SP plus immediate)
>  * ADD (SP plus register)
>  * SUB (SP minus immediate)
>  * SUB (SP minus register)
>  * MOV (register)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h    |  2 ++
>  target/arm/internals.h | 14 ++++++++
>  target/arm/op_helper.c | 19 ++++++++++
>  target/arm/translate.c | 80 +++++++++++++++++++++++++++++++++++++-----
>  4 files changed, 106 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
