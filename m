Received: by 10.28.71.27 with SMTP id u27csp869511wma;
        Fri, 23 Feb 2018 09:47:03 -0800 (PST)
X-Google-Smtp-Source: AH8x225f8gUaYTbb9yJ7P1EK1SSTtJA4uaXNE62lKcBzlLCNQt83MhHHI39uWNP4ONvvJ7IN24HC
X-Received: by 10.129.85.16 with SMTP id j16mr1696554ywb.52.1519408023645;
        Fri, 23 Feb 2018 09:47:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519408023; cv=none;
        d=google.com; s=arc-20160816;
        b=j36BruUjqOeObY1S+pVYHv1j3IdBkRALBaqcoClNo9yBzL0MXfvaGJPvI8XehpCUzq
         py7/ju/LV+hDMmSvOfN/iTrVCo4hj36M86pMiFlm/zXyKYNgiV7hS8WLdSRLk1+Nejxy
         loiLvYFxKDGIjtqZRWFIJiySFcWvjqO+riQGkwc80SZque5acAlHElTq1Zc+js15f0LM
         Tm6Z+Rc3EAsPvVWIPSOX3ok1sU1MVxxK7Cp+ezswPx4fbDbgePzodIIbMlHEIA6I5sz+
         cu0jv+K8qhCH3QYuYOup7WqTDna0+X5fDv9YFjQS+94QoTzmFx8sBevjtfKFpnDohTFw
         XK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=kFEGmgxF6/Ol5LcXTq386IofdbIlimEYFIc0FLedT2o=;
        b=IXJrstWRyOhzk26qXhKIP7pyJKvn7HzbHpBYkuYvy857hRtvp/uFlGCm6K5s1pov+9
         HFUkfXWsI/pPVnU6X1ODzwS8U/AQRx43PDQFGsNKMOAZTLv5jnaiSV2ftLbKLsuii1pp
         WzuZdetXflBsBPMaVaiRH7XnFabwWMZGl+HX8x7clJaHiknvfLceGSERHiuFR3r9JBHE
         yimCn3kKwgenUtBtf3JT4K3dJLTEERSV9NvHrDoosTGErMh/9fkv/0nRrizc5t+2d95m
         GB7n55Z1G0amZTUzmc92UXX+jokVcsplTWxB1zJtyQVLtnE60COleuRbPOGk4SKxkdXX
         t9Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j6hYD4Ab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j129si475053ywe.80.2018.02.23.09.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 09:47:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j6hYD4Ab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epHR1-00063V-4y
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 12:47:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epHQu-00061Y-1E
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:46:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epHQq-0000Jr-Fv
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:46:56 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:35664)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epHQq-0000Ha-AF
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:46:52 -0500
Received: by mail-pg0-x243.google.com with SMTP id l131so3624722pga.2
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 09:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kFEGmgxF6/Ol5LcXTq386IofdbIlimEYFIc0FLedT2o=;
	b=j6hYD4Ab8D69rrzH65kAUvDm9RaF67GiLt8Y9U+C7QBnQXdtwxHasXrWmPmSGQm7pP
	zKV9TrcIJXpBoKO7v0XE6TZtFhWJaWJ8D3u/Mte3QaXn2/Eh4vLSo22P6ZKmElpDKtn2
	Yi5X9WW2KZooZRQE5BcB/c+esybfAAo5RbppI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kFEGmgxF6/Ol5LcXTq386IofdbIlimEYFIc0FLedT2o=;
	b=DT1xwIQi615m780kjic61JytPweMu7b3GMPiCNL/fBS/2MZ8zbu0njktJuWriUPTHy
	obFdOILgI4bNKPKR4PxhotQWrNqaeTtw3q2436eFuLeLEVcf+ule2CQXQoVYC7hJ3Ci5
	pOx6ae7SUKognggwzjWEk7+kiOWDc2lxbA2b0fCczMLFDM4lCvaNooBPb0rGEOyd1YAm
	SdxiXO++nXTZzYnYQuBJAJKrBCwSjkOcQREm4Ysa23SLZxDQz4yijx/4t3TwUa1tzNFX
	0yYYTwQXhPLl2eMzfqLO+LxdnUDY5VGdbmNKQS5ynocfolXBvhloWV4skzDtAJROGQdr
	trRg==
X-Gm-Message-State: APf1xPAun41PGEyWbCFhWUjkpjdql+B9uVv24odeSEIJekByJEj/cnEt
	3O58cQhH5JfMEmyLXZ9Q9YeyBVV4T5A=
X-Received: by 10.99.170.10 with SMTP id e10mr1981674pgf.92.1519408009949;
	Fri, 23 Feb 2018 09:46:49 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k195sm4415954pgc.61.2018.02.23.09.46.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 09:46:48 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-27-richard.henderson@linaro.org>
	<CAFEAcA8UWBemOXvu7-Dt5CMv7VHSTNp4fGSKPnnHT2UfNryOHw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3956498-6020-7c30-d97e-841c280cc40a@linaro.org>
Date: Fri, 23 Feb 2018 09:46:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UWBemOXvu7-Dt5CMv7VHSTNp4fGSKPnnHT2UfNryOHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: Re: [Qemu-arm] [PATCH v2 26/67] target/arm: Implement SVE Permute -
 Extract Group
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
X-TUID: 8/DSmHHCMbQg

On 02/23/2018 06:24 AM, Peter Maydell wrote:
> On 17 February 2018 at 18:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/helper-sve.h    |  2 ++
>>  target/arm/sve_helper.c    | 81 ++++++++++++++++++++++++++++++++++++++++++++++
>>  target/arm/translate-sve.c | 29 +++++++++++++++++
>>  target/arm/sve.decode      |  9 +++++-
>>  4 files changed, 120 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
>> index 79493ab647..94f4356ce9 100644
>> --- a/target/arm/helper-sve.h
>> +++ b/target/arm/helper-sve.h
>> @@ -414,6 +414,8 @@ DEF_HELPER_FLAGS_4(sve_cpy_z_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
>>  DEF_HELPER_FLAGS_4(sve_cpy_z_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
>>  DEF_HELPER_FLAGS_4(sve_cpy_z_d, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
>>
>> +DEF_HELPER_FLAGS_4(sve_ext, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>> +
>>  DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>>  DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>>  DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
>> index 6a95d1ec48..fb3f54300b 100644
>> --- a/target/arm/sve_helper.c
>> +++ b/target/arm/sve_helper.c
>> @@ -1469,3 +1469,84 @@ void HELPER(sve_cpy_z_d)(void *vd, void *vg, uint64_t val, uint32_t desc)
>>          d[i] = (pg[H1(i)] & 1 ? val : 0);
>>      }
>>  }
>> +
>> +/* Big-endian hosts need to frob the byte indicies.  If the copy
>> + * happens to be 8-byte aligned, then no frobbing necessary.
>> + */
> 
> Have you run risu tests with a big endian host?

Some, early on.  It's probably time to do it again.

Running those tests was why I dropped the ZIP/UZP/TRN patches from the host
vector support patch set.  Supporting those endian agnostic is incompatible
with our "pdp-endian-like" storage of vectors for ARM -- we would have to put
the vectors in full host-endian order for that.

In the meantime, the frobbing within helpers does work.


r~
