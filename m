Received: by 10.25.0.6 with SMTP id 6csp396346lfa;
        Fri, 12 May 2017 12:38:48 -0700 (PDT)
X-Received: by 10.55.209.3 with SMTP id s3mr5170164qki.256.1494617928653;
        Fri, 12 May 2017 12:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494617928; cv=none;
        d=google.com; s=arc-20160816;
        b=JEzdlHZb9zaSRNHwx5ksiv7mhVfBVEQnH12AfNp+ZRVGb3fXTisduMzNzHbXjUNSHL
         VrRXo8lnrRk644muXKLZFuSj1fT/iSP/jHlKyMb/mVg1P2DiuMAa3R9ETFZB5xIKnn7R
         7EvAb9AnpBRir6emAGmfJrUw0ni/2cGZdH+1ts7oZiYWbLRKc6mtdHVhd6wcFTVvJhIl
         VGEYRp5dR4GA36fr2YoXhd8TlkVErocG4bmFXMUmnv2jwlFmaqwZi5eN4xjDsm1M2qRd
         sYDrueVpTXumrPpq5gv52YPBiOeWiVqy3tHlbTfY1n0jMDZjDlh5NnhI6FrWDIybnA96
         MS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ouLktLHAJc9IZsMX4/J6HSt41nypB1DpR8qmX0zD2qc=;
        b=IBAQPO4Z7NUk2jJGuawbr6VwEGlLUBRc+Da+S/GCHgE4TTAx0x0ZrrsHYrtvQQz+Xd
         deD2SDljoSi1zkGU1kXqzTEzjmM4CRmA+jEB0T5Izs9ymNLrKzajv3oJgmzi8WZrFqFm
         JXkIyzqOyhlm87qwI0Zdt7J+7t6S3sByS3K/mBuALnHDlEw8nCAX0uFa0wFpsuWMsHYX
         BjWSVMmaWkSZa5IlD8mHlIaFu59LUtfl6NkQVhfl2ViTanTXv1Oqwndyn4zTi56T1ww4
         szQ8S1QbvuolYaVb6KJTn2qaAc2Jb6SwsGL2U8tGu46ZT9wqUPCbWEBO1wCjyFZzkUwo
         /TDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i129si4182110qkd.260.2017.05.12.12.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 May 2017 12:38:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9GOj-0008Mz-Uc
	for alex.bennee@linaro.org; Fri, 12 May 2017 15:38:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1d9GOf-0008Ll-SP
	for qemu-arm@nongnu.org; Fri, 12 May 2017 15:38:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1d9GOf-0005QW-6j
	for qemu-arm@nongnu.org; Fri, 12 May 2017 15:38:41 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36175)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1d9GOf-0005QP-2d; Fri, 12 May 2017 15:38:41 -0400
Received: by mail-qk0-x242.google.com with SMTP id y128so9122737qka.3;
	Fri, 12 May 2017 12:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ouLktLHAJc9IZsMX4/J6HSt41nypB1DpR8qmX0zD2qc=;
	b=DRDPGCKfmrVJVmm8AyXtiYiHET8v17RdqO96OFIFFAXPcg0nRxClYMkJCblepn0/LW
	Id+HEnbKXOQPNTpsEobzgoUfqtbIy34ljNces17I+PZnbukxdBZdrT9goVvtRfQBvv2l
	1MjUUmX4c/dYLytFWxhQt4lFnXSXSBIppclHBQ5ZVJfZKYoafa5EdgDE0JU7cjEw5MYv
	fJOFq2soG92fkB0STeNLhHKGHK75lo5rj5u/NAuXFlrqQXfNNc+zsJ5YxcOFBVq5vNfI
	RXT8EkRohzX0FmkeCozrbP/G7wzcDrjV4bjIdiJ6d8+2OmHG5KQoEZck5u8bL2YajHii
	zx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ouLktLHAJc9IZsMX4/J6HSt41nypB1DpR8qmX0zD2qc=;
	b=ou1046Vpqyx8/7q7k9oGYqNxRjFeUp1AVi2Jcbimq9P+uBt2IE9u8clhg4lVI3kBM/
	em4zIvhjG/LYGQkU+E6CXDWMKSyw7jt9VoiuFkOu9RVOCA3XNOO9N5nOqmZyWZeROwvR
	roaCFB4y42eP+ubqmJIKLkyh8+2235CORiydWKXXSj6F6XRFzp5Yd4SF1j17656IZm8q
	Pattf2QY+Nidr/o8nuYIOFDt2cTBg6jyCsCN368W+vNQnMX9t2yWAfc40knrM4gLi4ST
	Nu5y8Xg5PpsRYseNvSWmPsoLtycXfSpCaX+xqiImOuEI0tBXhjBYQvlJJksBykJahMoq
	cCVQ==
X-Gm-Message-State: AODbwcB1aetQm455dlEJc0dYZEJvTLnaC2YMeTcWSsulSdHKgArG2TvJ
	ZC3s9Yk0tuqM3A==
X-Received: by 10.55.165.85 with SMTP id o82mr5018652qke.82.1494617920442;
	Fri, 12 May 2017 12:38:40 -0700 (PDT)
Received: from bigtime.twiddle.net ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
	by smtp.googlemail.com with ESMTPSA id
	q5sm2906918qtb.52.2017.05.12.12.38.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 12:38:39 -0700 (PDT)
To: Aurelien Jarno <aurelien@aurel32.net>
References: <20170512033543.6789-1-f4bug@amsat.org>
	<20170512033543.6789-3-f4bug@amsat.org>
	<f447c23f-f63c-f3bb-a1b9-f63e5aff4063@twiddle.net>
	<20170512182132.jdw4g2pd5gvf2dti@aurel32.net>
	<aaa04be5-78d6-311b-609b-d02f18e9ef96@twiddle.net>
	<20170512192252.hgtpgqfn5vtba362@aurel32.net>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <6c18b1e3-cc1b-ed98-bb2b-8eacaa719aee@twiddle.net>
Date: Fri, 12 May 2017 12:38:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170512192252.hgtpgqfn5vtba362@aurel32.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH v3 2/5] target/arm: optimize rev16() using
 extract op
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eeqzq/igW7Pn

On 05/12/2017 12:22 PM, Aurelien Jarno wrote:
> On 2017-05-12 12:05, Richard Henderson wrote:
>> On 05/12/2017 11:21 AM, Aurelien Jarno wrote:
>>> +    uint64_t mask1 = sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff;
>>> +    uint64_t mask2 = sf ? 0xff00ff00ff00ff00ull : 0xff00ff00;
>>> +
>>> +    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
>>> +    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, mask1);
>>> +    tcg_gen_shli_i64(tcg_rd, tcg_rn, 8);
>>> +    tcg_gen_andi_i64(tcg_rd, tcg_rd, mask2);
>>
>> It would probably be better to use a single mask, since they're not free to
>> instantiate in a register.  So e.g.
>>
>>    TCGv mask = tcg_const_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
>>    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
>>    tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
>>    tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
>>    tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
> 
> Indeed that improves things a bit for sf=1. For sf=0 though the
> constant is never loaded into a register, it is passed to the and
> instructions as an immediate.
> 
For x86 (and sometimes s390) it isn't, but it certainly would be for all other 
hosts.


r~
