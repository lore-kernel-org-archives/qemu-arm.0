Received: by 10.28.71.27 with SMTP id u27csp1015725wma;
        Fri, 23 Feb 2018 12:21:20 -0800 (PST)
X-Google-Smtp-Source: AG47ELs0BZ5KjIiM4zdfPOrg66bWRFoVQ1D7gni0ngLZAtpB+AzYPMrhyfGtlEBThF33Bbu2iyoo
X-Received: by 10.129.75.214 with SMTP id y205mr1239119ywa.257.1519417280882;
        Fri, 23 Feb 2018 12:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519417280; cv=none;
        d=google.com; s=arc-20160816;
        b=WEIaoEotX0LGLpJUPNkGEzXmEbJZzp7fCEf8QHZwYOAtE3lbFn5TkiocE5qOP9h4tc
         mDkRRqVfzlyVwuXXYGPh+CXAywR8CTXcD8iq84IqWANavLWHPboD/atMpYOgkg9rfzJm
         2knqjrRDLYCuFYvjIXQCMtMVHaFTesDAOjMtdqJkIJ34UyaUctiGzTz+qYeocQiG2lYf
         fyIwl+OwmxR/nR3ZOL4DGRNux4/fK2SD/kV+YXStnqeW9i0YIaNFL8q7dFdxcDIUActA
         FPEbt8Kyg3S0upsZN/wDtMzM58MQxN5DwG9B19TqT+stIoJwgMSxGWuzYyn2xQ4RO7fJ
         Zzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=UygIoAIk3Cq1wG3Iju29ukatSMC7bGzNBiOoR7ora7g=;
        b=le4SX9ouX41zp2uvKql33fjZsHThV0sEDmpBYnysekJATvIERiM2aFRe7CuAyOK3a+
         KcKJ0iKyx3UQ2KBPApRJhdWmdwvHcDSCIOj8VPNQt91zLql7Wai2C8AmfVzu3by8MAhB
         JsKYQ8HTyt8Z7L9UPbzjACai+2rrsso192/6U0lm0PyW0K3eg3q1LLXHrlvrSLis4SIi
         lULxTgbyv+k4BziF2p77QsnOLumDZQsc3rx20yDozxVpv1fi+/UYhWIBiYE180Fi2qwW
         QfJ+jpIwMYdjyDq1FSX43ehyh60HNiCTJTdALjB5DnuTwA6AcHVaiYHdAo77eegiUb2m
         mUXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RCn8Tco7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o62-v6si539160yba.771.2018.02.23.12.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 12:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RCn8Tco7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epJqK-0002Uw-9j
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 15:21:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epJq8-0002Tw-QR
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:21:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epJq5-0000Ub-0V
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:21:08 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:37519)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epJq4-0000UH-R0
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:21:04 -0500
Received: by mail-pg0-x241.google.com with SMTP id y26so3772688pgv.4
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 12:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UygIoAIk3Cq1wG3Iju29ukatSMC7bGzNBiOoR7ora7g=;
	b=RCn8Tco7C140K5MIIpULBH6KEMGHmQeHuXjqShBM+sTniYRYsqgkfttaNTZHARHZMt
	HNgjd736cveWsrd6X1JuzMa/J3wmOsJNq66nWqUWE1kKlkyGykS8KuROlXLKJ3xBitlH
	GPKIR50wXhwLJDuzYS3X5PIVH1E7iyRIQ67go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UygIoAIk3Cq1wG3Iju29ukatSMC7bGzNBiOoR7ora7g=;
	b=mI5tjZoRX1zwnWCw+zQn5A1yfTGOU+VGDDOoXJRQUPHEBDqZ7760OIKNM+t0WIjElg
	6MiIaGx/SdpbFK7XmzeUlcZRo9HhXCWlot8p3deGBp3BRMonvUyMOKxcbcFns4z6eIj4
	8hHEfhsq4Ig0BZf4x562qLLTgCa5xzxHxZn3PGlDS0VeNLmwIxhkpfhsRCbilsqMhDW4
	MZG09HGt8or5ZXOaIJp2Q+zVtYow066fYSgwjjNg9n0AcFho+4S5azniudFCVIo6UpZE
	jAg/gdN4YJrqIFutTO/7al4VFFOkR7WY+acrAxN8ee7BeLeTJ7fh3QTMrCrEVRvw3C7t
	1rZA==
X-Gm-Message-State: APf1xPAEOYXyMEjKoR/prlPR8zK3Sb1hpbg9ohWuAQ1VgiTzs9s+Ei4m
	LzAowGR9ijroY61R4hHeKBp3L5utvkY=
X-Received: by 10.98.7.129 with SMTP id 1mr2884396pfh.133.1519417263400;
	Fri, 23 Feb 2018 12:21:03 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	l19sm5456112pgn.31.2018.02.23.12.21.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 12:21:02 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-34-richard.henderson@linaro.org>
	<CAFEAcA_RcXrciEx5BG=XoW=ygCQJ-QOVFJ8fNEW=BNCX3PFENQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64c7eb2a-5e28-ef52-d97a-6964951f956c@linaro.org>
Date: Fri, 23 Feb 2018 12:21:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_RcXrciEx5BG=XoW=ygCQJ-QOVFJ8fNEW=BNCX3PFENQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [PATCH v2 33/67] target/arm: Implement SVE reverse
 within elements
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
X-TUID: 9ZG9g2jtYN6N

On 02/23/2018 07:50 AM, Peter Maydell wrote:
> On 17 February 2018 at 18:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/helper-sve.h    | 14 ++++++++++++++
>>  target/arm/sve_helper.c    | 41 ++++++++++++++++++++++++++++++++++-------
>>  target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
>>  target/arm/sve.decode      |  7 +++++++
>>  4 files changed, 93 insertions(+), 7 deletions(-)
> 
>> +/* Swap 16-bit words within a 32-bit word.  */
>> +static inline uint32_t hswap32(uint32_t h)
>> +{
>> +    return rol32(h, 16);
>> +}
>> +
>> +/* Swap 16-bit words within a 64-bit word.  */
>> +static inline uint64_t hswap64(uint64_t h)
>> +{
>> +    uint64_t m = 0x0000ffff0000ffffull;
>> +    h = rol64(h, 32);
>> +    return ((h & m) << 16) | ((h >> 16) & m);
>> +}
>> +
>> +/* Swap 32-bit words within a 64-bit word.  */
>> +static inline uint64_t wswap64(uint64_t h)
>> +{
>> +    return rol64(h, 32);
>> +}
>> +
> 
> Were there cases in earlier patches that could have used these? I forget.

No, the earlier patches dealt with bits not bytes.

> I guess they're not useful enough to be worth putting in bswap.h.

Probably not.

>> -static inline uint64_t hswap64(uint64_t h)
>> -{
>> -    uint64_t m = 0x0000ffff0000ffffull;
>> -    h = rol64(h, 32);
>> -    return ((h & m) << 16) | ((h >> 16) & m);
>> -}
>> -
> 
> Better to put the function in the right place to start with.

Oops, yes.


r~

