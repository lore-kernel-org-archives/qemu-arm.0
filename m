Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4539785wrg;
        Thu, 6 Jun 2019 07:24:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwboCdjLZYQLWL6lIMevyUCrSEC8jh8epZGnR6jekJIMhauACMhlvdug45wZMGWZ1+kdnDH
X-Received: by 2002:ac8:2906:: with SMTP id y6mr20295986qty.138.1559831066622;
        Thu, 06 Jun 2019 07:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559831066; cv=none;
        d=google.com; s=arc-20160816;
        b=AC4a1lNxgw0Svctai/0h+pQ5/xOY9GXIuRZUzq3yJtSgYaZWFx3jCjF0cmTUpKwwml
         qopWBEO9RAgN625eLDWMQ3HCO7ztC76W84xvB65fA7yv3ma9lOypAesHeM1L0IeZGRrf
         kdtA7CbM3coLjDmYOFEKXpu9O9PH1WTL7Z1xkxdU0hFClrmrWT+YoIZ3YKxgpSaogLQQ
         WZJAcwEVXwToXL0m5/Twkx7XDgtn0PJPgmHxeHOjQ48+ZmeL6rfEDWRs201CZ9zLNW+I
         D7QzLNso0SGOTXSubn9eGBOgdBu+mn+1b8vhef61okcvR5KxULCHh1RjJWu5ce66Gg2r
         OEkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=9HWynlXTySzrdPJ8cjfhtf4d8AhaQcIVfaAvSs/ASKk=;
        b=B0ztoOPo6hNtruq7scQXe3vIE5t3/EAJzBQ47NUgL9ISi6EroO13lM2dllCQToSvVv
         lL61MpXbMlMCG+4CX/Ggk3Ag8pk09jR3ZxM19khXKQuN2gIWgvIE1Km/DtM5hlmRsGR1
         1SP6wwehficohcpz5xr9My0mZnz8aga39kOkc9AF4xtwGgWvBfw9C730G1PhUOaQDHPN
         rarbdSLpXupULGf4aTT0wa3Og53a+jJWbwbmE/6GcKJ83GXrltNsd2WieLcHd5LMPaMh
         eeRwTguDUU7/AaSpUzugsns0qzRWoKPybu5ac3obTSyuGMePyy7picabOxS928eU0Lew
         DlNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SGNNnhnk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n25si1053727qtn.192.2019.06.06.07.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 07:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SGNNnhnk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYtJa-0005aD-2X
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 10:24:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYtJP-0005a4-M2
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 10:24:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYtJO-0008In-HR
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 10:24:15 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:41294)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hYtJO-0008Fq-Cm
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 10:24:14 -0400
Received: by mail-ot1-x336.google.com with SMTP id 107so2102874otj.8
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9HWynlXTySzrdPJ8cjfhtf4d8AhaQcIVfaAvSs/ASKk=;
	b=SGNNnhnk/tE1OXfhrCGiFZu8BpJeUt4XvmXPIZHZ/caJYCwBVGm1WcsB+MQNYOmwtW
	280dBOzfawJEunNHyJgZOGAh9b0v7lro3JG81cWk1omdAO+VQ7ARkX+HfL/jP5E9UNnD
	ZWQhqXUtl7uHC+8ADwBqWISuUGr+v7g0bVQKENFI/v3EQ5xS04Md7HqUV/lOwxmhKMuo
	Sfs/WBAISmPqwwvkyXSv/rk2r3NYuXA9lMuaz2c1bDh4EqOSHEO3r0vNDJovvqGAZZpf
	5QdCXxo1N0sxcsPvvpHUXIo5R0mOmtAPSfhYhKD+mSdHalGa0gjZkKeuQBLv+fyukafN
	AvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9HWynlXTySzrdPJ8cjfhtf4d8AhaQcIVfaAvSs/ASKk=;
	b=EDX6CvfbS2RjG+mOSKREnakb0LfqZfMNJOfp75AKkkcuUeBKsthVvRDRR4n6IPHdnr
	Pmgkz9eonwq1dIl//S+eszbfnglNa8KOuyNqk1xDP8WRKhOdpPkPrvTd8MBoXdCKc1ZN
	/swZGqNIg2u+39EFgh7bWvoCDuVGLrO3fnGn6707YhoTFnJhGr2HATZpx/yey3zYLEIv
	4CzrBqKY0I+/N5SfEZeuhgtJJOTLSvJQA3k0kzEliIkq22SI+NL1cASVqjX88L9aKRDF
	W+WbTxDGCJ7UWLDvjZdU7VKPPbgWmR9nQnBwQSGmxRqTxF4BuCGQrFMWWG7BHiK68NQh
	WZNA==
X-Gm-Message-State: APjAAAVLHRO8XVejrllrw3s8uRTw6OnKkJaHC4mzcgCPvAK5g/K1FfUv
	kmmQhhAvTw57moq82mPa8Kww8vyimhZvUQ==
X-Received: by 2002:a9d:7c8f:: with SMTP id q15mr2357000otn.24.1559831052958; 
	Thu, 06 Jun 2019 07:24:12 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86])
	by smtp.gmail.com with ESMTPSA id b9sm645437oti.43.2019.06.06.07.24.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 07:24:12 -0700 (PDT)
To: Dave Martin <Dave.Martin@arm.com>
References: <20190605205706.569-1-richard.henderson@linaro.org>
	<20190605205706.569-7-richard.henderson@linaro.org>
	<20190606102141.GB28398@e103592.cambridge.arm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <234bbba7-550a-9183-4bd4-6d0f75c8dbf1@linaro.org>
Date: Thu, 6 Jun 2019 09:24:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606102141.GB28398@e103592.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::336
Subject: Re: [Qemu-arm] [PATCH v6 6/6] tests/tcg/aarch64: Add bti smoke test
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f9XJhqNcyCE8

On 6/6/19 5:21 AM, Dave Martin wrote:
>> +/*
>> + * Create the PT_NOTE that will enable BTI in the page tables.
>> + * This will be created by the compiler with -mbranch-protection=standard,
>> + * but as of 2019-03-29, this is has not been committed to gcc mainline.
>> + * This will probably be in GCC10.
> 
> FYI, GCC9 has it.

Thanks.

>> + */
>> +asm(".section .note.gnu.property,\"a\"\n\
>> +	.align	3\n\
>> +	.long	4\n\
>> +        .long	16\n\
>> +        .long	5\n\
>> +        .string	\"GNU\"\n\
>> +	.long	0xc0000000\n\
>> +	.long	4\n\
>> +	.long	1\n\
>> +        .align  3\n\
>> +	.previous");
> 
> Note, this won't be enough to generate the PT_GNU_PROPERTY entry in the
> program header table using older tools.
> 
> This may be work-round-able with a linker script, but I haven't looked
> into it.

Yes, a linker script can create such an entry.

>> +AARCH64_TESTS += bti-1
>> +bti-1: LDFLAGS += -nostartfiles -nodefaultlibs -nostdlib
>> +
> 
> Doesn't -nostdlib imply -nodefaultlibs and -nostartfiles?

I don't believe so, but I'll double-check.


r~
