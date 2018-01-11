Received: by 10.28.173.206 with SMTP id w197csp927914wme;
        Thu, 11 Jan 2018 11:39:52 -0800 (PST)
X-Google-Smtp-Source: ACJfBosf2W/NxsBcPl082NJyWLi9OY0LgpdPLGjobBNpNXmqBRo8mUFtOfWDr2H+fypNnEPhhtBQ
X-Received: by 10.37.133.18 with SMTP id w18mr22174867ybk.463.1515699592268;
        Thu, 11 Jan 2018 11:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515699592; cv=none;
        d=google.com; s=arc-20160816;
        b=xZso0wHDrJfNYUkOx8M+utod4/q0HM/u1T7artXAg/ELX00nGXqh0Z068SaSWwgSkQ
         D19h1+9Lu7xq7s5c4c++iauYUWP2ZmhdrTW4txe70j+8qattwRYzE7+eFY1+6d9e72Kj
         lCGP6V7myrCNx+GPhxBEtGxOYWeM8tgc5WM6T2+D0+40/vZ2yUjvs/R/MBkUN9pCVlVI
         zjE8dRNeNglJTvWVnTSfGyI3YbZokDLzzU9bjO2cXTbs3BRQNEekEZzAyS9fGFL+cK8W
         i1p3hLbDl1UBMsA8vDAdUabH6MO4TnevwWUqJQ/2+3S/e6P3ewU7HAPPBFS5t4U0KreH
         HfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=oErcmhlSZtw6ZFcXS1sBwqMZZNY8VbaUY7SUiuPLrRA=;
        b=rLtKIc8c8YOpDoFkJCDCJQsFY84uEVu5uK+vRF2SK7aNCwtbZfj+RQPZLxyW8FgbAg
         S/rNkpGgdv4W7Tfmvgtttnlp+hmlXLPXT1V4aeKUM+h+dXBXsv6lg+Bu0m03kDxAZplD
         8b+ylWCbZV74CXhIEu0ScnvV0fj3DHjL3mDz1aFM7s0qQJiPGigGZ9XFY8Q2rhj6WSfp
         e9Ij2dXhEZdiDBr6V0lOIKaONMhd5ef9tAgKeLpjFYnmG45MGHveIiIkbPNY2nU7gYvP
         jurL5HOvSa+VBO9AutBuP/wyNTaIBWYNmhinYC3cv50OXIjnnTe+bLCC+F9CbqHjClWz
         dU7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PM6Hj8tT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d74si2660015ybh.694.2018.01.11.11.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 11:39:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PM6Hj8tT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZihb-000201-IG
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 14:39:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZicE-0005mb-Sn
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:34:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZicB-00084y-Q7
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:34:18 -0500
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:37490)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eZicB-00084W-KP
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:34:15 -0500
Received: by mail-pf0-x236.google.com with SMTP id p1so2430064pfh.4
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 11:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oErcmhlSZtw6ZFcXS1sBwqMZZNY8VbaUY7SUiuPLrRA=;
	b=PM6Hj8tTPvU2ai9HoMm/D8eEflJIr5GkJT1+wwfANqFZJnmPtg13Mo7eG+nGH7+epR
	CuymUxUP8rLHeDzByOnpP4BI6v4hYujv0tkb99HmXEpzywjzPMAET1UXtWQFZAmgYaWY
	4Si1gPq4PAunmk1yC8uov/qOAAdsbb6fk6y/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oErcmhlSZtw6ZFcXS1sBwqMZZNY8VbaUY7SUiuPLrRA=;
	b=TMt17k3g+T9sNnsl+FAMp77BzP2Cg0ZeR2lZ0X4gKbsEZE2yLKuRGCgy6bjmk5jYMg
	EuHO5GyK0JxdkpXs2xKRQQoNenBjSEbsWPr2pURhGIQ/Beke1rahLd86+Zqmlp7t+Swd
	ZaMDvgjgoj3uq25xoVKwqKd6hR+J7ZJOa5x044fDwGkSydgdvjQ3ubVLITMIoiBYRxJL
	V5UQLDoiUx/aBl1QXgnGCmRJeM1PhvaXgEy9EJNdeqdOlO3H4BYn7ckkux+wvdaL89s8
	Ghr/5VT5ptzobD+EKAO8i1z/ZhH16wWgQ8ohzFxGg+rPDv0Mc+R3E+xBBngtR2nM1/hg
	+ztQ==
X-Gm-Message-State: AKGB3mKUz4T4DsYdO2L2drqOswXeOHbB8I/FltKdQGg72H7Hzee6Lsm8
	iuYm5uZNQo0/BFqxEfsvSSav2UPue/E=
X-Received: by 10.84.129.1 with SMTP id 1mr23719512plb.42.1515699254305;
	Thu, 11 Jan 2018 11:34:14 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-183-164.tukw.qwest.net.
	[97.113.183.164]) by smtp.gmail.com with ESMTPSA id
	g10sm49081518pfe.77.2018.01.11.11.34.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 11:34:13 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<CAFEAcA9Qnj0G03x72BFLAYmodeBMDB=t3pz4JxUj0HvrbhkuGA@mail.gmail.com>
	<f82e02e3-40dd-8e74-6fe5-3205cdd42758@linaro.org>
	<CAFEAcA9eNzA9Yar4SC5UKWzMij0ypyXKATRqU1pVx8UTf33u7Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <833c4229-7a78-849f-c17a-bfbef4506458@linaro.org>
Date: Thu, 11 Jan 2018 11:34:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9eNzA9Yar4SC5UKWzMij0ypyXKATRqU1pVx8UTf33u7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::236
Subject: Re: [Qemu-arm] [RFC 00/23] target/arm: decode generator and initial
 sve patches
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
X-TUID: DwqWVKY+NOSt

On 01/11/2018 11:27 AM, Peter Maydell wrote:
> On 11 January 2018 at 19:23, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 01/11/2018 09:56 AM, Peter Maydell wrote:
>>> On 18 December 2017 at 17:45, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>> The most important part here, for review, is the first patch.
>>>>
>>>> I add a code generator, writen in python, which takes an input file
>>>> that describes the opcode bits and field bits of the instructions,
>>>> and outputs a function that does all of the decoding.
>>>>
>>>> The subsequent patches begin to add SVE support and also demonstrate
>>>> how I envision how both the decoder and the tcg host vector support
>>>> are to be used.  Thus, review of the direction would be appreciated
>>>> before there are another 100 patches along the same style.
>>>
>>> This doesn't apply to master -- do you have an example of
>>> what the generated code comes out like?
>>
>> That's why I gave you a link to a buildable branch on Tuesday.
> 
> tgt-arm-cplx ? I had a look at that but it seemed to be a different
> set of patches to this lot.

No, tgt-arm-sve-{1,2,3}.  All of them should build.

tgt-arm-cplx is the armv8.{1,3} stuff that's waiting on fp16 to go in.


r~
