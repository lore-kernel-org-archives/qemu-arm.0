Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1028314wrq;
        Sat, 9 Feb 2019 16:06:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbI8YKSjpcKnqII308SLulGQsBmRVCQT6xu8S01CHez1/Pdwun5L+HiLiSfPOFUFWDbl765
X-Received: by 2002:adf:ec47:: with SMTP id w7mr20306027wrn.8.1549757194651;
        Sat, 09 Feb 2019 16:06:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549757194; cv=none;
        d=google.com; s=arc-20160816;
        b=UMRpDvT293mdNzaH2J9GwRtQvykf1txxK+/LZzuIYKS+LFzkBkifYY6IAsaNcyXaB/
         GhG05CNhD+JPz3nopC2pij0Vo44+1P5ktpsGlMI9i8Bo5ut+VjSA3EhAKVHa7FpbtfqM
         6HqIJ9YCOQ8OwxHgpQMU9G2sXf+/b07l+QBVfuwfSyHV2VF8xuSrfx6hPD7WDSIXID4k
         d1f3s2Q65/JEQC1xCx3s4Dol2lAh7Mg5uEJa9hkkZKDpDiPceQYFIfiChKMH2hkaUNM3
         oEOtQDe0zqX1+ekVh7mb5z1giM3FLQBftkJmPOYyFQRhbVcctOGfOfE3bSsK8VyRzv8S
         QTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=AgVB0Mv5UXENG00u16hdrCIfOJ2OnllzReGESV4QDmM=;
        b=hSq7wYJstBqhZB24m4HCI1nKPrSiWzxOz33XRp87f+0Gtfd+GSjzH6Q01FNS0Bvxys
         XWT+x7v8aEPy6r9iRgwZijB/xT32SeFRKIMZU9R8oySS5skpZT6Qq9VV/QKKS9vIWPRX
         Too0dRDx1fytoI8ttBGDvkZSguUztwu1BFtyzLswARLNmpU8kVrSa987aA3uZxHRMJeX
         Dwc/g/eLcMFmDW5T5bWEK/nsfwFt/sFVz51szrSb9sfhOeOm0RBpDna6KqJMsOFsNIEI
         2D0mmhR73mhIUATPGEop04n/IHM5Um5In9av/vkQmAkINJ8IZ6blf2Bb1gPbdn1hF40m
         4Z7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ip50vViI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z131si4790219wmb.55.2019.02.09.16.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Feb 2019 16:06:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ip50vViI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gscdl-0005W3-LI
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 19:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gscdT-0005TW-Tw
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 19:06:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gscdS-0006Fx-Ch
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 19:06:15 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43431)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gscdR-0006FF-UJ
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 19:06:14 -0500
Received: by mail-pf1-x443.google.com with SMTP id q17so80597pfh.10
	for <qemu-arm@nongnu.org>; Sat, 09 Feb 2019 16:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=AgVB0Mv5UXENG00u16hdrCIfOJ2OnllzReGESV4QDmM=;
	b=Ip50vViIhiUf91/L2b2UJMw141hwolTCLGrlzCVCh7/TUEo5/6Qs+ZE6MDDvHqep7i
	u0VPe6HxWv1Ic2SUtHO5BUgOMQMKXswdvix3KjIivMjkRk7K3PaRLGcQxiOUzYroir6d
	QsyOevMZCdPqb52XYPbPUFG3gzMeC+6WJmAPMDYOMpVRarYRzMDpHsh96HxlkHxDiisE
	JI3e+lqTqRow6SVNDp1jwLjfNCfcoJyHo5tdTObF5yZrN1BTU+TtMWA1wwKVinjQ8xpe
	QCNPcsmvuwY31JNqlaFYP+OoL68bu6FwPDDYJN4pggibuXSq0tLcG0G3ChV9Jodp5jcE
	5Mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AgVB0Mv5UXENG00u16hdrCIfOJ2OnllzReGESV4QDmM=;
	b=p2/o/o91A6mzcktIXnciINQukTfcHDn22TlDCPmYggptQZCBCk1huAGPXNczXI17kS
	vqJ2dzpEGH/to/x8pMPQ1ZMpe1Va+fAgnwjfbYowqcxzwa98c40wIr2WMNm0MUxdPj4d
	ynxmYfJwz9dd7Hb9n+2SE8TtMt36fSB9qYlmuHkhJ7gCf/DIHU720Crq8+hBAgQPr1ff
	19IF4thSWqv+eQuuY5jys0Fu2AIhqMZiwYM/PTE2kswC84eV7aj4fXHA2qzb/zA0+t4H
	BDPzbsBYiHknwpYi1CJaDwhBY+/vinnUiuuisS28vIRGVdt3fX565RdLO4kzwwY1mlgr
	ANyg==
X-Gm-Message-State: AHQUAuaUMBAp6BsnCIQxb4ofpCuHZ8RbaWlR26KW9E+D5pHJVLcvS57X
	8MmlLOxy22EBc9+lZYMpcs6b5jtBCxE=
X-Received: by 2002:a65:424c:: with SMTP id d12mr10717691pgq.126.1549757172246;
	Sat, 09 Feb 2019 16:06:12 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	h10sm10001874pfj.89.2019.02.09.16.06.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 16:06:10 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-2-richard.henderson@linaro.org>
	<CAFEAcA9Kj5fXB6fe_hJAGbqG0ftjh9+VrqQQEy4bEQ6iFB508A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <56022fc3-4061-4f5a-bb22-e9205e2fc34d@linaro.org>
Date: Sat, 9 Feb 2019 16:06:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Kj5fXB6fe_hJAGbqG0ftjh9+VrqQQEy4bEQ6iFB508A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [PATCH 01/17] target/arm: Add MTE_ACTIVE to tb_flags
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkryz+FLKNCr

On 2/5/19 11:06 AM, Peter Maydell wrote:
> On Mon, 14 Jan 2019 at 01:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> When MTE is fully enabled, i.e. access to tags are enabled and
>> tag checks affect the PE, then arrange to perform the check
>> while stripping the TBI.
>>
>> The check is not yet implemented, just the plumbing to that point.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> @@ -0,0 +1,32 @@
>> +/*
>> + * ARM v8.5-MemTag Operations
>> + *
>> + * Copyright (c) 2019 Linaro, Ltd.
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License as published by the Free Software Foundation; either
>> + * version 2 of the License, or (at your option) any later version.
> 
> Do you mean LGPL version 2.1 here, or GPL version 2?

Exactly the same as all of the other Linaro contributed
files -- a confused mix.  ;-)

>> +uint64_t HELPER(mte_check)(CPUARMState *env, uint64_t ptr)
>> +{
>> +    /* Only unchecked implemented so far.  */
>> +    return sextract64(ptr, 0, 55);
> 
> Are you sure this is right?

Not exactly right, no.  I thought I had a fixme here, but that was the other
one you point out later.  Will fix.


r~
