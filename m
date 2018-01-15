Received: by 10.28.173.206 with SMTP id w197csp3009300wme;
        Mon, 15 Jan 2018 10:04:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBotAISSp6nB6pcYGEuE54mrcnV3zFdxPROigEKgiTn+cQBEmT65U7ygAL9gPr6+4UIYGZrQ+
X-Received: by 10.37.202.137 with SMTP id a131mr5142113ybg.198.1516039464002;
        Mon, 15 Jan 2018 10:04:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516039463; cv=none;
        d=google.com; s=arc-20160816;
        b=pA9tNyw7aEdaTFf36negS9iMUT6YsFwGC/t4VDFU3kOH2DPjAtIzxoCx8SiGoeVnmN
         AtgmAYroB/M+WBDy3HM/QdyxEUadzc4Uck9cVBiz/AvBFjNScGZ/bao9S+8QSnS9KYqu
         t72/ZgJ/7P3aiNDEFlGLihy1GFXSt7dd9pI0AzlmHaa9X6r3xr0ZHFuXHZCpPZDrMKOY
         cdxkKRqtquhX3RNLr8PIA7dgOYOOZVe3FTIFuR+HrVPrAd5EsoMi0qzc0rr14vj5Eez2
         OFC6EzX4nc4Y7d0bCJq+sAhWGhbIt0lX3W5bZh74nfwuomsnQf/zhjBoxyWe2tpqUD1i
         WsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=My+85OrRwFjqBMk/2oNFEuSAcxfV3Sr3e2hTsHdoalQ=;
        b=mYCuTUGE+rzgWj4CYGIPRh3XiI8FEfV7MjVRqEKid1Z6uKE/NBs8ow00w+tf04eyGx
         NcMhGXPqt5Zb+1Bk2UlgetywtiS/tg3jfp1fbaggUUS3iLOZsIJmULPjEYrZvrhTa7tM
         oYmscKtjMfSrKBN8iRk4EYQEUqF5+9eiAxp7bOElu9I/zY1o7AYUGmJuUJAboR0tHxKx
         j838mzQx38JoAKaM8IFs5PfjMC9L9zaW9mpHYMbgivRsBaAZO/ywP8yUWWl344Csj/N+
         Yp0sSQ1NKy5sFckoCeilokPy64D3HEnJ5MPQdh10pZ8gomtLLog3uOpuh42PRTwxER0E
         ERTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IAqdjwSS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d140si40830ybh.508.2018.01.15.10.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 10:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IAqdjwSS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb97P-0001h5-H5
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 13:04:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eb96H-0001G4-0P
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 13:03:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eb96D-0005xY-TR
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 13:03:13 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:33397)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eb96D-0005x4-Nb
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 13:03:09 -0500
Received: by mail-pg0-x242.google.com with SMTP id i196so8315888pgd.0
	for <qemu-devel@nongnu.org>; Mon, 15 Jan 2018 10:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=My+85OrRwFjqBMk/2oNFEuSAcxfV3Sr3e2hTsHdoalQ=;
	b=IAqdjwSSlGrGycKhnN+g3R8T1hnQCqhcbWqzGOphxX53tXbho0tJLHf80WpPemvG3j
	XDmbMQ7DFZ4WT4c7w6A6goij/jnYf5tZiBC/lgDY2vcPhIO7YvPK1ZaiG6uTYdP45Tw6
	8jWDhSwbkTeH4gQhzQV4+qCW83tvvAn1mlcwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=My+85OrRwFjqBMk/2oNFEuSAcxfV3Sr3e2hTsHdoalQ=;
	b=MDdFIfGI/F866sZs+oCSsYWUxlyehE/MPGskrMiswmr42K9WN1gQe2PufwCYVQmFxD
	PPShgUc5onBIIiFU69bXWS+yg3j73sMmJxWt+Ts2Ul5I21K4TLtHr1DazxiNuSqGYCE1
	Was3U7g3y8j6uM8L4CUsz3NC71qYq84VgoiieBXMoPwXJ4tqev+HbtgLfoIo1diUr/Me
	QFV3+d3tNm32l8tmOBDyLYE54xp0+P/CrXgMaSFkfjJOZf64PEnO3wGqaBYIEi29FkOX
	8d38EoSpvFAxisVvx9pY+A8qbqrAd8Aej9nNHC7IKnpIkWxMVDW/a+JuaLj+mMpf2Mme
	2g0g==
X-Gm-Message-State: AKwxytfjFHVRYd0NNCZDp2k845vhH+DPK7BMTKawNmRuXyxgj660rbV4
	JkXhhUGqV9hbZ5YlaeUhAqex0w==
X-Received: by 10.99.128.66 with SMTP id j63mr18012677pgd.254.1516039388704;
	Mon, 15 Jan 2018 10:03:08 -0800 (PST)
Received: from cloudburst.twiddle.net (24-181-135-57.dhcp.knwc.wa.charter.com.
	[24.181.135.57])
	by smtp.gmail.com with ESMTPSA id e12sm222982pgq.8.2018.01.15.10.03.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 10:03:07 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-8-richard.henderson@linaro.org>
	<CAFEAcA-NAGcEba2ik__xirZxrtbNw4wsiWDtiqsLfLdG4jyKpw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a0be836-f3f9-69dc-6b19-859317f869fc@linaro.org>
Date: Mon, 15 Jan 2018 10:03:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-NAGcEba2ik__xirZxrtbNw4wsiWDtiqsLfLdG4jyKpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-devel] [PATCH v2 07/11] target/arm: Add
 ARM_FEATURE_V8_FCMA
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LUhW5Wxg+zeL

On 01/15/2018 09:53 AM, Peter Maydell wrote:
> On 18 December 2017 at 17:24, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Enable it for the "any" CPU used by *-linux-user.
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/cpu.h     | 1 +
>>  linux-user/elfload.c | 1 +
>>  target/arm/cpu.c     | 1 +
>>  target/arm/cpu64.c   | 1 +
>>  4 files changed, 4 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index e047756b80..7a705a09a1 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -1353,6 +1353,7 @@ enum arm_features {
>>      ARM_FEATURE_JAZELLE, /* has (trivial) Jazelle implementation */
>>      ARM_FEATURE_V8_1_SIMD, /* has ARMv8.1-SIMD */
>>      ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
>> +    ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
> 
> This is a bit inconsistent. If we're going with the architectural
> feature names this is "ARMv8.3-CompNum", so ARM_FEATURE_V8_3_COMPNUM.
> If we're going with the ID_AA64ISARn_EL1 field names then
> ARM_FEATURE_V8_1_SIMD should be ARM_FEATURE_V8_RDM...

You preferred ASIMDRDM earlier.  Does this mean you prefer V8_RDM?

I hadn't noticed I was being inconsistent as to whence I drew my names.  Gimme
your preferred names and I'll use 'em.


r~
