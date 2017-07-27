Received: by 10.25.44.15 with SMTP id s15csp2552925lfs;
        Thu, 27 Jul 2017 15:58:54 -0700 (PDT)
X-Received: by 10.55.168.140 with SMTP id r134mr8268724qke.204.1501196333869;
        Thu, 27 Jul 2017 15:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501196333; cv=none;
        d=google.com; s=arc-20160816;
        b=mQreTo+l4nW/NaQYJSsOpBpSqk1+bec6cUKxr1lGSea4NXv3YvXyeeNzGVT1Q4SqH8
         om49K/NqUAc3ivRfAmQ0wt0Mm6XQEkoxTM23pop7biW+/2/103+4s/gUnyTdG/SPuVol
         CYPoL0BG+jlDDCwPuwfSX5Ebv6RxfZXhd2YhRTfnnDzieUdgYxWR608IntjAyHm4bs96
         J7hxKwbxJ8nVtp6TfSe6chd+xEYh3TYQoQWzf2fBw8Exe3EHhFICWVhEYLVLiIBl5PBW
         RcCwSjZOi1FKeJ/YVDlHOJVpNZo5mqXOklqGCXyHPJYAK4vJb11+7OjHYBia9dO6hm61
         WChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:dkim-signature
         :arc-authentication-results;
        bh=J4G5M1/5zauxDG+rU2EfbCER505xtK1ry4/OYE78sIs=;
        b=qnxBNfrwqWsafAVzLfR0SpNhrzyjfdAmp+nNsovjfpQQQpVd6jOyPigbJmO8TSV5mR
         nep6thurx3+FvdmBZl7jZ8qYA0iWsZBW8c2a3eqPS6FUnUE5jTEAdPGhZ9wiZwdFQJ/E
         nerRoeXkppB5mGNTjRvxDhvr/TSkPdb5gcoG7oVcg+yhabO1JxnCnFJui1ie2b+GMUol
         GmFkudXxm1opD7oxxwmAXMhEkTgQP3tc06f9ZyvGcygKsiimb5Np8UpPPTj8vOpnS1mk
         3atD9a6a0M7+ge1Sy/c3tIQaGFK/0uFDzxAUBrnYPY/7I+LMJ+XWrEHulHPo/Sf1fehR
         tcVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=lg1o1zhp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d77si16473970qkj.125.2017.07.27.15.58.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 15:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=lg1o1zhp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dark3-0007d4-6E
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 18:58:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1darjy-0007Sr-9Z
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 18:58:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1darjx-0002E2-Gf
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 18:58:46 -0400
Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242]:35973)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1darjt-0002Bp-Bo; Thu, 27 Jul 2017 18:58:41 -0400
Received: by mail-ua0-x242.google.com with SMTP id w45so18209642uac.3;
	Thu, 27 Jul 2017 15:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=J4G5M1/5zauxDG+rU2EfbCER505xtK1ry4/OYE78sIs=;
	b=lg1o1zhpCjCii0idqjm5j4orDSPdsdvc0mDuhgj27s/t8eTlA4TBk8dUgghxuqHSfH
	1gaAlm76moYS2uzKT1AuNItKEpQ634lnPqgxbHiU7mA8B9rfxzMlpit39i2zG+1GeTdT
	mIjN3tow3QcKJNoMAZAk5zdiUKWqcV/3xaEuhLOn8gIfsqZAf7INtOWr5eth0iEyGAAW
	j0ODkFl1yencilXKv3k+gnTB54SxHWJQ5S0LQhi7GdOVq2KkftdrRw4vw6ZeF0jbDY4i
	aUB0swHdeLJgYuKQozC8tZm0PVS1fBXKRkA6jfXO3ntCVCsIfPFCcPq9fmN0tZ/LMW7c
	NgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=J4G5M1/5zauxDG+rU2EfbCER505xtK1ry4/OYE78sIs=;
	b=Yh+hV4Xl0W/6IxQTpXGY0nfRIQhogYOcTXTBuIPU8JqwcFNXhV162KAIaWkXYOeWce
	YktUt6vhk9X4Dq+YU7aYAVCOwrg1ivDD6oLyPSwsNUwWlY260aiIVB8aud16/ac/C13J
	klwEqGZiDONCPBIV9y3mVYTKdfoDdWDOIHBpWpyVax6CMe4zokf5z0CzDWrYbfrQSLol
	Xyj0IfB2B72fYSjbMKEsHWFyZTURyfg4NGO04bilLobhy98RCj/HFTPg4IYnekJ1nXt2
	gdop3cfx7i6DiSk200K4L6dXCJ56wwrrZHK2fGj71lkpLCRUVbJJ+SG9l9JCZcLiVbsN
	xsYg==
X-Gm-Message-State: AIVw110u2aAKoHuCJwaIPG04zCEg3U+64gwXDEgUGrTQZruQ1THyXaPg
	DrXvou4ZcKXWug==
X-Received: by 10.31.199.130 with SMTP id x124mr3527095vkf.189.1501196320605; 
	Thu, 27 Jul 2017 15:58:40 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	n133sm4503180vke.42.2017.07.27.15.58.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 15:58:39 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
	<1501153150-19984-4-git-send-email-peter.maydell@linaro.org>
	<5aff6da7-4ad1-64af-6445-98b8d7520b4c@amsat.org>
Message-ID: <122bfaa5-7192-056b-541c-b5f37f871bfc@amsat.org>
Date: Thu, 27 Jul 2017 19:58:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <5aff6da7-4ad1-64af-6445-98b8d7520b4c@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::242
Subject: Re: [Qemu-arm] [PATCH for-2.10 3/5] target/arm: Rename cp15.c6_rgnr
 to pmsav7.rnr
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8sWCLDi3QMml

On 07/27/2017 07:43 PM, Philippe Mathieu-Daudé wrote:
> On 07/27/2017 07:59 AM, Peter Maydell wrote:
[...]
>> -    u32p += env->cp15.c6_rgnr;
>> +    u32p += env->pmsav7.rnr;
>>       tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
>>       *u32p = value;
>>   }
>> @@ -2447,7 +2447,7 @@ static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
>>         .readfn = pmsav7_read, .writefn = pmsav7_write, .resetfn = 
>> pmsav7_reset },
>>       { .name = "RGNR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 2, .opc2 
>> = 0,
> 
> "RGNR" -> "RNR"

Ah "RGNR" for -R and "RNR" for -M hmmm... still better keep the name 
matching the field, "rnr".

> 
>>         .access = PL1_RW,
>> -      .fieldoffset = offsetof(CPUARMState, cp15.c6_rgnr),
>> +      .fieldoffset = offsetof(CPUARMState, pmsav7.rnr),
>>         .writefn = pmsav7_rgnr_write },
> 
> pmsav7_rnr_write
> 
>>       REGINFO_SENTINEL
>>   };
>> diff --git a/target/arm/machine.c b/target/arm/machine.c
>> index 1a40469..93c1a78 100644
>> --- a/target/arm/machine.c
>> +++ b/target/arm/machine.c
>> @@ -151,7 +151,7 @@ static bool pmsav7_rgnr_vmstate_validate(void 
>> *opaque, int version_id)
> 
> pmsav7_rnr_vmstate_validate()
> 
>>   {
>>       ARMCPU *cpu = opaque;
>> -    return cpu->env.cp15.c6_rgnr < cpu->pmsav7_dregion;
>> +    return cpu->env.pmsav7.rnr < cpu->pmsav7_dregion;
>>   }
>>   static const VMStateDescription vmstate_pmsav7 = {
>>
> [...]
>          VMSTATE_VALIDATE("rgnr is valid", pmsav7_rgnr_vmstate_validate),
> 
> also this one "rnr is valid" ^^^
> 
> once fixed:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
