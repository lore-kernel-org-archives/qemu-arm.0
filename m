Received: by 10.25.44.15 with SMTP id s15csp672606lfs;
        Fri, 28 Jul 2017 10:05:36 -0700 (PDT)
X-Received: by 10.55.53.2 with SMTP id c2mr11399019qka.41.1501261536401;
        Fri, 28 Jul 2017 10:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501261536; cv=none;
        d=google.com; s=arc-20160816;
        b=t3vuQ0mA0DKBlcKIQKHgo0F0tB2CoJg2zGGKmRaa6U8yT/d2Y1bJEX3qKCRlw8NAgS
         4kwGakKj247nJawmgNUJB7Dfo4UQGXL1pnHRjZs11sxKxV3pQ1WNd0rtz581o9F4u/zg
         7Z9I8/V9BsDfIrsyvnBd7GtyStXuONgoXCumjhNuu5ELw7JMtEGjGZEbbFO7Lk6IEKp6
         AZ73gWz19KnxYnuwoF1FroDDtRXjpX+HcUEv7JwNaq7jQQdWbcMfE/npMvgImr83wjjc
         yQxB87/jIdirrRSS+IScFW9mCfoq0M80z4zDeKiD9I20wC7wulJ2Ye/zXHNUSRtTQYfS
         bYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=FwAdjZF3/9Sqh00xbikFewy81MP3nYtk5j6E5uIanAA=;
        b=fyB/kDkaudCcP3C4GqmDUvYqeDHwX0OPqaH0l7e9ZQ47DyG6wpNPjplC3ZEUYSizSf
         GaOxC6sElkLJTXP7PcnHluCpShUWdB/Y/x4RMY3FyqTi9aGZCUpoH0FnzPzvo2kWPwkL
         YmN0gI/cLSEJ+zZjsABoxXucLxMdKbdYmnK2MuTaHpSYc8NuqWDlRO3fuY2Ld8RyswSt
         0jW3E6Ikx4yKhRGdPpVlD2YXtAho3Oya9nDdy7f0KTjHCT2iwgZ82p0uzy4KoCzBSIUU
         5xMfpDaRsE17G8MLqo2dQKj5AMHhoFF1M0t6rcJAqDvJOxBuhPSSIGFzPq1M6/T6hPVH
         fpuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=hHCDwY8M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g128si17991465qkf.465.2017.07.28.10.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Jul 2017 10:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=hHCDwY8M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1db8hh-0003er-JS
	for alex.bennee@linaro.org; Fri, 28 Jul 2017 13:05:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1db8fR-0000it-De
	for qemu-devel@nongnu.org; Fri, 28 Jul 2017 13:03:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1db8fN-0002R0-DP
	for qemu-devel@nongnu.org; Fri, 28 Jul 2017 13:03:13 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:36697)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1db8fN-0002Qe-A6; Fri, 28 Jul 2017 13:03:09 -0400
Received: by mail-qt0-x231.google.com with SMTP id v29so61866134qtv.3;
	Fri, 28 Jul 2017 10:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=FwAdjZF3/9Sqh00xbikFewy81MP3nYtk5j6E5uIanAA=;
	b=hHCDwY8MHAmWaVxG5I2gSkSBvGSmMvMrI4m4ioMeQOet8nGyJALwkm+4zUmkaJ3rNn
	vni/PuB8rBPpDdr/sHHgtbvUWi+jb5PswpDr/cox3loOjojCr7gCQ+BlZks+jG8KLPdc
	8fkarUGOVgvuHHcGm4XtmOquQV/RM+c1qDa+Cvr0OYVsm6A7bTGovvKxuX5ymwliRjKF
	g3i1kzQKaNj6Ba00Q9nv84ib0h7Prth7RwgzrNSaxq+NvN8PNVXRWJww9Xx7TUQ7DD1L
	zjPwULT248KGcq8ck1mBXye3Hut5u/UH20BroElB/EdDTsGItFntIUEKlDi+QOGHVwBu
	sbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FwAdjZF3/9Sqh00xbikFewy81MP3nYtk5j6E5uIanAA=;
	b=pJ+gK+XepJxRqOyILJFMPcQa2wO+84vXItJFY4ht/5XtgPdmww5+8LFPSVT1XTEUsv
	pD0x/IYZGXmN29blZN/3aMK7hJ7GRigdxDKHzC4WU/UPCziWyHddzANZZH7uJhs2Qkka
	UxLDXHc61tJJ54P6Dfn1DubqYcHXgVHb+0N6xOIvsbT89XiiR8aiAmlKHIsElTMMPXoX
	e4TT40DcOpzGyfZGau9H51uTLrbEk5ZMcKirnO3ZK7hBpwea6fupXLAbuaV2DaBSGio8
	ledBKJtkMZXqxe6ZVmY8RMoKcOUWKb0+y8w59yYFYu5cE0thu4KxwqfjPzdGAOj2BZtp
	7MBA==
X-Gm-Message-State: AIVw110qfvOFYuSspWEY9v1QhRf8xtFHsbUqu+Eci7EtlcE//rvjqQ38
	CM4ltCVk41XGT1fRDJY8UQ==
X-Received: by 10.200.41.247 with SMTP id 52mr1758877qtt.0.1501261388601;
	Fri, 28 Jul 2017 10:03:08 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	b42sm17472266qkb.17.2017.07.28.10.03.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 10:03:07 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
	<1501153150-19984-4-git-send-email-peter.maydell@linaro.org>
	<5aff6da7-4ad1-64af-6445-98b8d7520b4c@amsat.org>
	<122bfaa5-7192-056b-541c-b5f37f871bfc@amsat.org>
	<CAFEAcA-D4puOE5qPOGEd9mEdQFVqpA16997ZmHf4C5Nq_gEnAg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <22d5a43a-53fe-27df-656b-d17fc187e404@amsat.org>
Date: Fri, 28 Jul 2017 14:03:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-D4puOE5qPOGEd9mEdQFVqpA16997ZmHf4C5Nq_gEnAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH for-2.10 3/5] target/arm: Rename
 cp15.c6_rgnr to pmsav7.rnr
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rIa/jnbR+IBr

On 07/28/2017 05:42 AM, Peter Maydell wrote:
> On 27 July 2017 at 23:58, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 07/27/2017 07:43 PM, Philippe Mathieu-Daudé wrote:
>>>
>>> On 07/27/2017 07:59 AM, Peter Maydell wrote:
>>
>> [...]
>>>>
>>>> -    u32p += env->cp15.c6_rgnr;
>>>> +    u32p += env->pmsav7.rnr;
>>>>        tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
>>>>        *u32p = value;
>>>>    }
>>>> @@ -2447,7 +2447,7 @@ static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
>>>>          .readfn = pmsav7_read, .writefn = pmsav7_write, .resetfn =
>>>> pmsav7_reset },
>>>>        { .name = "RGNR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 2, .opc2 =
>>>> 0,
>>>
>>>
>>> "RGNR" -> "RNR"
>>
>>
>> Ah "RGNR" for -R and "RNR" for -M hmmm... still better keep the name
>> matching the field, "rnr".
> 
> It's a bit awkward, yes -- we're going to get a mismatch one way
> or the other.
> 
> In this patch I wanted only to change the field name, not
> anything else (it's already a bit borderline for 2.10).

Fine by me for what's worth. So either ways:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> thanks
> -- PMM
> 
