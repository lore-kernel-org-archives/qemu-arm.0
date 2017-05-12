Received: by 10.25.0.6 with SMTP id 6csp36941lfa;
        Thu, 11 May 2017 19:49:32 -0700 (PDT)
X-Received: by 10.55.18.141 with SMTP id 13mr1723887qks.135.1494557372151;
        Thu, 11 May 2017 19:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494557372; cv=none;
        d=google.com; s=arc-20160816;
        b=oOq4TW4wvFE5/z6cslDQ0TpCy0Vkh0k6snamgmmpSJpnxC52dlOMYSVQbT4cjaaFok
         wOJder1sJzXdo70gVMchH5ur2eFscIddOfeuZ8Wq3cFotqAuqIkBOVqM3BfvH/MHlrf0
         nP67QBo60BzS9bFjdXXmitvqgA3/pGxu9A8FTtlph0DXv5+pHis+kzy6ikrfT52zjF0z
         Nsmb8QDbM53H792YQ28Z5NxJRdRrz9d2N5FMovWCKKr0zbZoRcQG2YFYmpV5Wf7fQhGG
         okXs7ERAGHp5U7gGGz+nWYGy+FBkmiEGNvtVghoxLxs69nIC9bYDXIFlHd80hhpA5Lv4
         gAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=r0OfsaIblmfI5HSUVOeGv+ZQxWWR3z2gMnBIz9uJob8=;
        b=ZyWIpfHbHBuLIO5taDuwnj/snU2PpdaR8KMYfTEukxfbAVDGy2/Mtrj9Iz5ou71522
         FB/SMN/SK5Cy93rOSlp+ZCcVkfNPrGUaqm069JXqCP5HFF2kd2K5sIyirc5nRdKM5bt7
         YTcbs8cJrhZeyHAuewVW4UUMMmnWtu3MKXiM/49ZgMKaSmcl0OxDFC7lM2QQejzlNyuc
         kU70h68nW2xun5zHO1gVXrgkIW1DI1X6fgr6LviQhr/olEmgq3Km8XApXriICYUnnrjP
         IRbB2MROnCYw0dz57YnTAeAam54PqHNKjfzMjOxT9MVeiwqpxEnLRhZFwqLczOgORDjw
         hhWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l33si2037937qtf.206.2017.05.11.19.49.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 19:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d90e3-0005sl-KS
	for alex.bennee@linaro.org; Thu, 11 May 2017 22:49:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d90dz-0005se-PY
	for qemu-arm@nongnu.org; Thu, 11 May 2017 22:49:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d90du-0001xD-RI
	for qemu-arm@nongnu.org; Thu, 11 May 2017 22:49:27 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:32818)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d90du-0001wr-Me; Thu, 11 May 2017 22:49:22 -0400
Received: by mail-qk0-x244.google.com with SMTP id o85so6236081qkh.0;
	Thu, 11 May 2017 19:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=r0OfsaIblmfI5HSUVOeGv+ZQxWWR3z2gMnBIz9uJob8=;
	b=drmbDQSh86zhA8MnXnJ8Lp6ChwwsXZVg3o/LefTj4eHqmyFLQgw6TRc1Qug62wtH3h
	tOfgrpJOFyrYO7wqucFVWs2CjhOklYVXCPGNdx5BW491E3HCfc7G4NvM8oP/BTco2nKk
	TnVWOmYxNT3Qabgto/xVAmMtHyHjJuCgLG59MptF1YuBlIuYpp7d6qtMl+KSsyO7yZ8C
	BgHujGo1W46Y3MCVMKa0t2M9vCMW20UCWacikeD1ODmRZP+Y5otgt10lVb622QRnJys1
	z8Ck6TX30h3wspil3R/NPbuEuXfoTBwPwc6stEIPtg7xzZQeW3GV08q8ibgInpTOrPWS
	h4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=r0OfsaIblmfI5HSUVOeGv+ZQxWWR3z2gMnBIz9uJob8=;
	b=guJnfSSvXX2aWnwsohzznrUEUqVi08kIVEyzH2A3zC0MdP2K0dpFK+vHHz1NjyzgkP
	Re4gq4vL0kdIfj+sezP1EgEQw9z8XnmYQTva2I+Xv+1NCisqtZfMnQNbX8q0rxKwCSEa
	fYf9566RzlyFMtTWdwmO7L/85Rq4uiLw9EcebpEtu9720kvfGE4VZ7Ku0nb2UAK5ctMo
	+GguWJ1aUUpCzFCvfz5YGB69NfqcZp+pjbosuSdxF+DzZQ1T0y2CHcPfSDhXKCv09ev7
	JdFe3c4EKs/pE6f+wJv0wZqa5Xp1jHVveMWcfKGUDtqm7/DeECuBj+8RROfwis6DIG2/
	WMJQ==
X-Gm-Message-State: AODbwcBNxbfnBCxXD/JNAXrP/DpTLOJrVR1JAKYAqNWDpX63/wpAz4ub
	WFPkLe1cTmQt9Q==
X-Received: by 10.55.39.131 with SMTP id n125mr1712436qkn.215.1494557362072;
	Thu, 11 May 2017 19:49:22 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	g32sm1476024qtc.19.2017.05.11.19.49.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 May 2017 19:49:21 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org
References: <20170510200535.13268-1-f4bug@amsat.org>
	<20170510200535.13268-3-f4bug@amsat.org>
	<5a888274-0687-16ef-79d0-2c5ba9513164@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5393d0ff-03f6-395a-bcdf-fa9565ca471e@amsat.org>
Date: Thu, 11 May 2017 23:49:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <5a888274-0687-16ef-79d0-2c5ba9513164@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/8] target/arm: optimize
 smul_dual() and neon_trn_u8() using extract op
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xNZ5d2ux4yl6

Hi Eric,

On 05/10/2017 05:15 PM, Eric Blake wrote:
> On 05/10/2017 03:05 PM, Philippe Mathieu-Daudé wrote:
>> Applied using Coccinelle script.
>
> Thinking forward a year - if I want to reproduce this (to see if other
> instances have crept in), I have to dig up a mail archive to learn the
> formula you used.  Better is to list your coccinelle command line
> directly in the commit message, so that reproducing the fix involves
> less effort.  Same comment applies throughout the series.
>
> For reference, see how I did it in commit de6e7951.

Ok!

In the cover I used cocci spatch directly thru a unofficial docker image 
which I have no idea it will be around in a year...
I'll let the docker example in the cover and add the spatch command in 
the commits.

Regards,

Phil.
