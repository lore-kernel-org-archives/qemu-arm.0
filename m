Received: by 10.28.71.27 with SMTP id u27csp1048368wma;
        Fri, 26 Jan 2018 11:04:00 -0800 (PST)
X-Google-Smtp-Source: AH8x224aecrv1oJxMxIr/YeqyJXxiq8q+sEfP9qyADJN+LfP+eug6pc06QNWh16s50GEVfZQ74UF
X-Received: by 10.37.81.200 with SMTP id f191mr11668207ybb.143.1516993440005;
        Fri, 26 Jan 2018 11:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516993440; cv=none;
        d=google.com; s=arc-20160816;
        b=GsVIXfhHxW7cjW1vY668hBylh85J2AksnNJYoIkvbZjP4ZdSHaI+wN0Hmg+AVOlWgj
         Cuy4X9szTlZRMv0fZRaGu/javPenLBAf/uUBhqbMQkdHNOGnNsxnXbcae1rHKQ+isqPx
         YX9d9e0SFQitC2EQw6n/osSsg9y+Hv0V9T/VKISUGJa3w7uaDEccy7SH2Nd7nyb7MiAc
         rg77JYY/ZZgYMkaxqahue6GbzOLU7St4hWFB2FfFyouchb3V5Q9Qj4BgUIjUzAKL2dH5
         op24IPvbCEI53mzfD6fJFfbx9OiffRH5APcmfxI22QOO9VwQA2ugOj5tJL/GG+nZGfeb
         KzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=8Dz1M2X+no5h5Vzk/k3Zg+o6ODC09UJ4GHbyUKfPDFw=;
        b=kXuQedgbOUDJ/lGSQvuKT+t0ehdudlGDEPQicAaw+NQa6itM7xm+gPIcGUFqQ4nc2j
         HySD+T3X719/H5rQoETJfE2/8ORghNH/ObLowfDCsBn/3or1q9o5EtTkfnRQlkZLcaho
         KOEF0qg6BzlfQGahXx4auEwGH2LTV3gKXq1EXmUb9g6pcBK/OdTWiZCrjGJLNL/tJJpb
         NCkb0uiByrT0hGwEPKKo/wJ7ZoGxtco9r1VXCB6pz11RhMMge3LimQny7Cz5TIonwxUt
         SgxpbrDGV6IXps3/geUQ3PqcKIoszB7wG6KBOymo/AoW1qTjSo8+sxz1T6Fz8jFtpy3B
         mkfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OFE+6Nyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k143si3794164ybk.435.2018.01.26.11.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 11:03:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OFE+6Nyd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef9I7-0001tY-HJ
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 14:03:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ef9Hy-0001su-KO
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 14:03:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ef9Hv-0002b8-OJ
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 14:03:50 -0500
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:42300)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ef9Hv-0002af-Ho
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 14:03:47 -0500
Received: by mail-pf0-x236.google.com with SMTP id b25so854648pfd.9
	for <qemu-arm@nongnu.org>; Fri, 26 Jan 2018 11:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8Dz1M2X+no5h5Vzk/k3Zg+o6ODC09UJ4GHbyUKfPDFw=;
	b=OFE+6Nydv36UFDxAekOBDyh5JSwxaQyqdEBpods4r9FzGCg/KASMg3mvvNKPO6ul5f
	FtW25rAyV8Qy5unOhonrcwI6aMog70AJTVhR7zVCa82CB0u29KlpK2a0Oo5PAe9hn8w+
	TpgVMwjL7E6fxaSB0NpOsy4S2ygLE7tU/73Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8Dz1M2X+no5h5Vzk/k3Zg+o6ODC09UJ4GHbyUKfPDFw=;
	b=R3UifpzWUbPYFYm293vSq8w5t7QQ77cyu1bB5ua6Nmmp+lMEK31iL1Q93dD51bpFdY
	jyuB+n8Io/3NFixVOC1wpXE0s6m1NYIZraR5ca8pBDwmZebavr6AzWMgtWuYlU6GbgrK
	yZ2xpWmM3XVZc1z2jczBCohqYH7M6dASYEY/Ruv8TgiOZWmyGsxiSBqtdMXJBtA93dmJ
	qSYDMboiAv6U4HlAYNhtHsTHZJKCRcv8k4rrXJKNzGxtNEO6qYYldaq7cp3dzVCnRsc+
	MHz7vcQmv0sdHMCmZ7FLxFg3Z87N05/ijjV/8IVFEzKE1zj6WRH8Xz3/4tzluiZt9oLE
	dcSg==
X-Gm-Message-State: AKwxyteRNKWGRpZwwDctQaAKFq1/mAJoiw6YhlKdxZtJmFJEnIVj4R97
	IKFl96M3Pu2iLFNw8dwfTT3ZRjxzLN4=
X-Received: by 10.101.91.140 with SMTP id i12mr15752618pgr.297.1516993426168; 
	Fri, 26 Jan 2018 11:03:46 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	e185sm21947752pfg.155.2018.01.26.11.03.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 11:03:45 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-10-richard.henderson@linaro.org>
	<CAFEAcA9Dmdh+u7AZHhjEkS3zc6i4yf+Eo1-NuksgVdo1cqmKFQ@mail.gmail.com>
	<707306d7-8ee4-ab6b-2154-290647a72779@linaro.org>
	<CAFEAcA9PGHMPeATRHESeUEWaU17OpVw99p-+U9KzOPaitSgEGQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <161aba52-a937-2481-23a5-0bd2d589e23e@linaro.org>
Date: Fri, 26 Jan 2018 11:03:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9PGHMPeATRHESeUEWaU17OpVw99p-+U9KzOPaitSgEGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::236
Subject: Re: [Qemu-arm] [PATCH v2 09/11] target/arm: Decode aa64 armv8.3
 fcmla
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
X-TUID: wpj/iyQ8ReAJ

On 01/26/2018 02:07 AM, Peter Maydell wrote:
>> The SVE pseudocode for the same operation is clearer than that in the main ARM
>> ARM, and is nearer to what I used:
>>
>>   for e = 0 to elements-1
>>     if ElemP[mask, e, esize] == '1' then
>>         pair = e - (e MOD 2);  // index of first element in pair
>>         addend = Elem[result, e, esize];
>>         if IsEven(e) then  // real part
>>             // realD = realA [+-] flip ? (imagN * imagM) : (realN * realM)
>>             element1 = Elem[operand1, pair + flip, esize];
>>             element2 = Elem[operand2, pair + flip, esize];
>>             if neg_real then element2 = FPNeg(element2);
>>         else  // imaginary part
>>             // imagD = imagA [+-] flip ? (imagN * realM) : (realN * imagM)
>>             element1 = Elem[operand1, pair + flip, esize];
>>             element2 = Elem[operand2, pair + (1 - flip), esize];
>>             if neg_imag then element2 = FPNeg(element2);
>>         Elem[result, e, esize] = FPMulAdd(addend, element1, element2, FPCR);
>>
>> In my version, e0/e1 are element1/element2 (real) and e2/e3 are
>> element1/element2 (imag).
> 
> Thanks. Could we use the same indexing (1/2/3/4) as the final Arm ARM
> pseudocode?

Done.


r~

