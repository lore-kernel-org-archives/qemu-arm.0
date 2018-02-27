Received: by 10.28.71.27 with SMTP id u27csp5012081wma;
        Tue, 27 Feb 2018 08:31:24 -0800 (PST)
X-Google-Smtp-Source: AG47ELvka3Kg3snIQ3GF+Obz2jjmDYxUWtjL1q9CMFV0Xo057c/D1LMekh4C0K5pZWSVwjB0gXY/
X-Received: by 2002:a25:1603:: with SMTP id 3-v6mr7140101ybw.505.1519749084859;
        Tue, 27 Feb 2018 08:31:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519749084; cv=none;
        d=google.com; s=arc-20160816;
        b=JkF7hEu4NbImFgBSd9ddKhY3ZOfwduraubm8xL5AA5dCMrv8fA3gShirTXLPOsEwqj
         T+Q3baxMIiXaTTswSWy955pNOZ7bgu22sY/0WqARkcwYMk9undywsZCiLdgxjaj1Dn2t
         eHf5RvlX5+oOX6CNvXl6lUjlmDaN0BjL11TguEjw9De/+F8WGcjhLU/QWTjBDmYIRq6J
         2xzjyAbsXjFVhlzIvTChdxi8Uv18SoYk4ciC5k9vzFESEHis7k82xS/dqaPTvoidExo0
         fVn4bRDHm6dJ3MXCvw+TkYytGLvA0dHWAfQkkXePRIBG9LNRv8qBCtLbNd0gzrUxpNHb
         VVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=X/g7pgGAxOH1EWiAKSH6pP4JVAYJw8bZ8Nzm0a3Np0o=;
        b=Pg8tY4PMuYsUW29aEYBXdIB4RGnBmuacXyPn2gM2hG1do4d5lrwUOjZreF2Fmg30Yo
         uYR6CJChX5rp2k8lmtIr+lpfTWw7mwwE1N9L5hy+bAZ6pKXkA+fBLLxgqgODoly0fski
         a85dYbTKoq9aZOB92qJr/bpDCNzYa1yaJgmRre3momACSx17k2u+ug4DvNpIJFynEMlN
         v3bdWlPMYX7KR6FfRMTyhWO+Zg0PnIOvtrUldJr5WMkN7oun5HBjSrlP5c9nUgwLfMt5
         ndRqVLwEab7ixrNOvO97+sa1fcxqNCXbHtRifYMWtabGAXM6ruxPUj7FIVgcpDge21XG
         oKag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AJQuvSSf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1-v6si1977288ybc.114.2018.02.27.08.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 08:31:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AJQuvSSf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqiA0-0003xF-9D
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 11:31:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqi82-0002bc-Fd
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 11:29:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqi7z-0005ZW-9G
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 11:29:22 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:40843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqi7z-0005Z6-1I
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 11:29:19 -0500
Received: by mail-pg0-x241.google.com with SMTP id g2so7700080pgn.7
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 08:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=X/g7pgGAxOH1EWiAKSH6pP4JVAYJw8bZ8Nzm0a3Np0o=;
	b=AJQuvSSfgr/dPbNumyEGb6UD4sAvQ2g9/HzQI7iky1xCtQ4gganW/+QL0TshkMJZn3
	Iwof0AoAy58G89LrpdLb0sbOWa8j6zVQ4AsoGU3p0RJn6Xf1fJcumjIDmDVDaBCK0tka
	spqymmaAv+MKa8r9faKODlbUtZYs8NhGXtrds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=X/g7pgGAxOH1EWiAKSH6pP4JVAYJw8bZ8Nzm0a3Np0o=;
	b=ayfaSE0CwHyeiSHjv8IqavjsaaxWWuWMlw2+c1IgMPP28Wj1VGVW8aZlKE+cAWHPDu
	Pu8cOhzxNurGApfVZPpTXw3OsPmS15f6gOMwBUewUDXtso4K8mHLjgFSOhCUOrJ0fiHK
	cIX5NcXHEIsKnkt1Z65aR329ug0JjliOWK2JOnBXTWIRwNc/AYMKLVx9MV90/Jdy4MGR
	XwoRS2AaXOrwJQd8PpTsaMeB0TlGamX7mZRPLBIPO4m7V3HXR/ZzAqDsHvui6naEfskG
	4zJIbGFDETN0aPBU4XtA4Ev/jFGna6Hn6VOdGDQYWBtXANcGu2fKh0tMB8LHXloS5inU
	e30A==
X-Gm-Message-State: APf1xPB8m4k7NJM2SRdXHKU650pMqXCRcyWn7TJOXjMHbBQCb85U9EoY
	q0GA6jwlUjnvMyovYXjfrlRAhQ==
X-Received: by 10.99.185.84 with SMTP id v20mr12005575pgo.112.1519748957547;
	Tue, 27 Feb 2018 08:29:17 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	i4sm27681467pfa.40.2018.02.27.08.29.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 08:29:16 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-60-richard.henderson@linaro.org>
	<CAFEAcA_q6Ca5JT-850hR43sSmPinvvb6W_s0y8mVyjyaHGeFdQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <078bc887-13c8-fb16-485a-69e55c2404cd@linaro.org>
Date: Tue, 27 Feb 2018 08:29:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_q6Ca5JT-850hR43sSmPinvvb6W_s0y8mVyjyaHGeFdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 59/67] target/arm: Implement
 SVE Floating Point Multiply Indexed Group
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
X-TUID: XGF/PLeS3haj

On 02/27/2018 07:18 AM, Peter Maydell wrote:
> On 17 February 2018 at 18:23, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/helper.h        | 14 ++++++++++
>>  target/arm/translate-sve.c | 44 +++++++++++++++++++++++++++++++
>>  target/arm/vec_helper.c    | 64 ++++++++++++++++++++++++++++++++++++++++++++++
>>  target/arm/sve.decode      | 19 ++++++++++++++
>>  4 files changed, 141 insertions(+)
> 
>> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
>> index ad5c29cdd5..e711a3217d 100644
>> --- a/target/arm/vec_helper.c
>> +++ b/target/arm/vec_helper.c
>> @@ -24,6 +24,22 @@
>>  #include "fpu/softfloat.h"
>>
>>
>> +/* Note that vector data is stored in host-endian 64-bit chunks,
>> +   so addressing units smaller than that needs a host-endian fixup.  */
>> +#ifdef HOST_WORDS_BIGENDIAN
>> +#define H1(x)   ((x) ^ 7)
>> +#define H1_2(x) ((x) ^ 6)
>> +#define H1_4(x) ((x) ^ 4)
>> +#define H2(x)   ((x) ^ 3)
>> +#define H4(x)   ((x) ^ 1)
>> +#else
>> +#define H1(x)   (x)
>> +#define H1_2(x) (x)
>> +#define H1_4(x) (x)
>> +#define H2(x)   (x)
>> +#define H4(x)   (x)
>> +#endif
>> +
> 
> I wasn't expecting to see these macros here. Don't we have them already?

Not in this file.  Probably I should share these in a header...


r~

