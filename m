Received: by 10.223.197.9 with SMTP id q9csp577446wrf;
        Thu, 5 Oct 2017 06:49:14 -0700 (PDT)
X-Received: by 10.200.8.131 with SMTP id v3mr24023141qth.262.1507211354811;
        Thu, 05 Oct 2017 06:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507211354; cv=none;
        d=google.com; s=arc-20160816;
        b=cRv/Z9WqTwG6ytZO0gRTxix3nHmI1mSpDC1WGjQ8zzWTqA1Aexcqf6I99Z253ApHvk
         h00LiCGqLRe66EjuAVr+c6dJY9Je51iEAKT4hAPINtSua76iG9Egtk8Nr2EG8ZoGUvBl
         +4OXqMPxWWD+x6ChEC/80JG40SylcMC9cTsiMhgUoTqypfD6eVbh1ne/3xXcuu2mtAGS
         p92KCrvHF8mS+qXSZcB/dSufUIdM2qTc1u6G1sfrX3DCqdnzUss4dv3THeEAuc0iRYZ4
         KADdEbuGyjPpnyGTGlY81RuQY6JluzyuzHG7pO9MpYb5KyGRf/eccD78K+5NOGplwhYO
         uvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ajnkU9n/Z/8G34abtdzD9X7E4O826msNhGQ4RajrUlA=;
        b=YaKs6DKDR/jetlcjYJfu1aSF+haTEaohFnZHgBVUFQoCBuEIzz4kqd+3oDwgCiSb2U
         j1S3FuDTfFVbIaFlhsFqZcMbV/JV5HGWdBLINZJVrzqikOGRUaJXIwTach5UCL3Bz8mv
         8y1gja/+RTwMe5kvpOhA5FOEUOPgRuYl6kgapwFk1OpnHDc2OA0+JQBf8FQSBZAvL/6C
         Jw6lfFPKbDA6Da6sktlQbUDleqCg/aqzxbpZeI8ihFD9aoclGpoJ3t0MBJBkxX5RyExI
         5pLcPTzmKOTcN95OaToyDAhi1njLT8Sor4MWc94+e/ZqsVZeoofYIBQ/MDnSC9AAw6Mv
         y1Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vcJecuV5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p34si931297qtg.223.2017.10.05.06.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 06:49:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vcJecuV5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39921 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e06WY-0006OM-BB
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 09:49:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1e06WF-0006Mf-Sk
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 09:49:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1e06WE-0006PQ-Tr
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 09:48:55 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1e06WE-0006Oj-PE; Thu, 05 Oct 2017 09:48:54 -0400
Received: by mail-qt0-x241.google.com with SMTP id p15so2513657qtp.2;
	Thu, 05 Oct 2017 06:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ajnkU9n/Z/8G34abtdzD9X7E4O826msNhGQ4RajrUlA=;
	b=vcJecuV5PO3Q0LfjO1jaKsZNWtxFXDXW4OGxkUoMOJu+5ib2ydZghmMSV7M6SyemCE
	f5/nlYLHS05P0DEtXXfpgamutwzU5i+kio25WJUhUEivBlkl1XhUuYMBzk6bM1+eQoXe
	yCAkuungFsDrQ7TdYltmAzPz/9mnJ2tlY+oI4UhHmdpZTA6EO5RFPanexqwjmcBbgCsu
	rYxiYmJQJBlFDjvDSyWDXd1k2tGy1GQ4AzWsH6aFOeSn8gg6s6rO0HSj1hMVfyGT4shh
	01Go+4VdqXEvlBplJAigQGj+abUnodRFnFbIu38GGSKA0XIE03/JCgVS3OYAfKTP8a1v
	AUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ajnkU9n/Z/8G34abtdzD9X7E4O826msNhGQ4RajrUlA=;
	b=L/rVDRpBEeFzr1u13miPN3FYu+N2rjywClAb86CHXGEDk/tWsJJm0Rw+R8PRrpnULO
	81g4amVAWKJXDyaM0K2VuUXwzJQt5S15l4Tix5hxK049Uisn2I7oMV1HjfY+Jng8AEdT
	3OCdJsCmjL4E04UleF1qr8/dfm1adEG182WQWWdS6yGLoIZQbwuWKJS/O0c41jGjAc4G
	vp9UVUDuLuxm8spbxJk5yo3HbkkICIuVKRh2ijstXo+dQSHUMc3Ou/QF0B7xGEYOhGfD
	dAmXfBPTfbVC1uq42Q5Pkxzo/RnCVuDGd60xQ90k0Y6VBDjv5Q5eMyNnEPzYIwntrqO+
	puUg==
X-Gm-Message-State: AHPjjUiuvy5zqz8dVbANCH5S+gktr3r7dIruvs33xQUNpDD1RkY+o/bf
	zpZ5o7o6z++9EdjB5J0/tyjDfTMI
X-Google-Smtp-Source: AOwi7QBSpkdvewljf0wynsoXmSyldbx6ERgg+zrApJLNa4S0cQ/WMghtp90td6oO8zQwTiV3lwivFQ==
X-Received: by 10.129.177.69 with SMTP id p66mr20290073ywh.232.1507211333805; 
	Thu, 05 Oct 2017 06:48:53 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.googlemail.com with ESMTPSA id
	o77sm6414162ywd.78.2017.10.05.06.48.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 06:48:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170708025030.15845-1-rth@twiddle.net>
	<20170708025030.15845-3-rth@twiddle.net>
	<CAFEAcA9mSQnJCDzPOvf4PsBHx0kPB7CFCLC3AdDv9G0EHrEXXg@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <c9fdb06e-301f-0dd5-be0d-ad48865d029c@twiddle.net>
Date: Thu, 5 Oct 2017 09:48:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9mSQnJCDzPOvf4PsBHx0kPB7CFCLC3AdDv9G0EHrEXXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] linux-user: Tidy and
 enforce reserved_va initialization
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 07qc7qtc+i1j

On 10/03/2017 12:24 PM, Peter Maydell wrote:
> On 8 July 2017 at 03:50, Richard Henderson <rth@twiddle.net> wrote:
>> We had a check using TARGET_VIRT_ADDR_SPACE_BITS to make sure
>> that the allocation coming in from the command-line option was
>> not too large, but that didn't include target-specific knowledge
>> about other restrictions on user-space.
>>
>> Remove several target-specific hacks in linux-user/main.c.
>>
>> For MIPS and Nios, we can replace them with proper adjustments
>> to the respective target's TARGET_VIRT_ADDR_SPACE_BITS definition.
>>
>> For ARM, we had no existing ifdef but I suspect that the current
>> default value of 0xf7000000 was chosen with this in mind.  Define
>> a workable value in linux-user/arm/, and also document why the
>> special case is required.
>>
>> Signed-off-by: Richard Henderson <rth@twiddle.net>
>> ---
>>  linux-user/arm/target_cpu.h |  4 ++++
>>  target/mips/mips-defs.h     |  6 +++++-
>>  target/nios2/cpu.h          |  6 +++++-
>>  linux-user/main.c           | 38 +++++++++++++++++++++++++-------------
>>  4 files changed, 39 insertions(+), 15 deletions(-)
>>
>> diff --git a/linux-user/arm/target_cpu.h b/linux-user/arm/target_cpu.h
>> index d888219..c4f79eb 100644
>> --- a/linux-user/arm/target_cpu.h
>> +++ b/linux-user/arm/target_cpu.h
>> @@ -19,6 +19,10 @@
>>  #ifndef ARM_TARGET_CPU_H
>>  #define ARM_TARGET_CPU_H
>>
>> +/* We need to be able to map the commpage.
>> +   See validate_guest_space in linux-user/elfload.c.  */
>> +#define MAX_RESERVED_VA  0xfff00000ul
>> +
> 
> This should be 0xffff0000, but you'll need the bugfix patch I just sent
> out first.
> 
> (Why "UL" ? That's usually a wrong choice compared to either U or ULL.)

Because that matches the type of

+unsigned long reserved_va = MAX_RESERVED_VA;

Which, arguably, should be uintptr_t or size_t something instead, but that
would certainly be for a different patch.

If you prefer, since this is a 32-bit value, I could trim the define to U and
still be correct.


r~
