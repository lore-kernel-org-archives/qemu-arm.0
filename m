Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp788282wrt;
        Fri, 7 Dec 2018 10:01:01 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XgABKFxrlgG3oZS0KlMplUoMP/JSrKWhRQC1MI/cZ6gd9bxpDxcJSC70POq+eCt5lEogOb
X-Received: by 2002:a0c:f0c2:: with SMTP id d2mr2946406qvl.123.1544205660999;
        Fri, 07 Dec 2018 10:01:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544205660; cv=none;
        d=google.com; s=arc-20160816;
        b=Fu3lnxM/dNsgZo95+ho4oGZ1oY7pa8l/WGyDrLdRCa2yL0y/Ie9aS1x+ehqVsZNTmD
         1buyHTszWamLXaVvvrdhy5BMedrtkDNqHyMx5Kro+lVZr195fIsJIuBMh3sLGDRwIbMj
         FzIRnXcr04VEd4BAWMhYcBv2hnKiH39uVClsyD00Su70lFplry2cnZGIuHEqAXA2EG00
         8UwzcR/nlnmb715v9S8f1bX27B5pLNn5ofrKgXEV1iAMuN+g+GF4jm3Cf86tNZZ0tuVF
         SN9LdaNCupOIUXAE14wgXocIVRCQRdeOLQPZpx+V2bhGKyVSNTevJxT4GBlS8LnwJ613
         prHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Mo7exnO7Zik9iqesvjvLiyPar1Wn9+fsaM8GpMn4cRA=;
        b=ucPnX+2uVT1cp6T1KUrQ9uMDm/eC8fEEsL1MtZeeOc5trTt4l2GiU94nmtqXGDw/LS
         fWxYr4nzHBIcHCdpA0Z5FzePf2ML2XY3Sw5GPVj4VY16wIUTZ672HP47jxuFzE8Iq+ZB
         XrIq25voaP6ScM98z6pHCRO1acczgPNOyO/d5GK+6hg7ERBMhRKvhwtRbPbwX6wrJpEv
         RLV8dqadqx5ZIpgEtcNDDKhIXqNlmmbG4t9K/C0iNrGWCkSPaPrQXRoyV1Nnq4Ik10Xb
         e37MGmsNEIU0FUsmSmNwfdUmmoYnnvQS1v2QrJtA3QKrgYiNTO9o8uj4yMUAIHkuM0mY
         CkuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YwpMQtkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f3si2508905qtb.373.2018.12.07.10.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 10:01:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YwpMQtkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVKQu-0003Vs-GM
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 13:01:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gVKQf-0003Um-WA
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 13:00:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gVKQc-0001Sc-P3
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 13:00:45 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43728)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gVKQc-0001Rr-If
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 13:00:42 -0500
Received: by mail-ot1-x343.google.com with SMTP id a11so4578032otr.10
	for <qemu-arm@nongnu.org>; Fri, 07 Dec 2018 10:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Mo7exnO7Zik9iqesvjvLiyPar1Wn9+fsaM8GpMn4cRA=;
	b=YwpMQtkEw96HThupxTzMhpL6HrNn+kLxWeEbJCzmOzkX/q2KkACswzjR2RI/DPxaZu
	m/badLZnGzk9osh91F+N3r910XL8Z0PuT5/fVQzp13YwAIk5SsbZA9Q30k+jhfnI939u
	xqF7iSUzDneNYl5prqXzJslnX4eiDPFir3wew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Mo7exnO7Zik9iqesvjvLiyPar1Wn9+fsaM8GpMn4cRA=;
	b=Si/7ObCnr4c2EYfACAIvXubWhgqPlHVdmDjMW/uZ848chhJMmSSmOlkK33OIVdFf31
	fAr6p1+eVE6pYX9yk6guI9L6VCeL63w36+Z0J2ejTcnI4cqR+cgVIgUkYDeYUnXKAIYp
	CBJ6c4GCuZWKLTfD7NSn+90Vea8d622U9zYAzbQgzuGpV2Ba/JvNoSmheeMyrGr4oafw
	+wli2jKJGgJ4gCBWMErHyw8Iy8n+1TX2OwujvsAmjh6LxXtMBOvrvBPX66mji3X3Nz/V
	ZFTonRu9oeFxENvAStd6MwJmiPrJokLTecrgztrIBVaUBf42ax2xIVlZh/+Z3TIzGrjx
	C1ZQ==
X-Gm-Message-State: AA+aEWbHFImRNm610OmrqSsXboOZvuD0A0qHI7FqYQs4FPhWebqp2/xB
	PEfDWvfwdoMGDqPpaAVcBMH6vQ==
X-Received: by 2002:a9d:6546:: with SMTP id q6mr2188497otl.288.1544205641253; 
	Fri, 07 Dec 2018 10:00:41 -0800 (PST)
Received: from cloudburst.twiddle.net (172.189-204-159.bestel.com.mx.
	[189.204.159.172])
	by smtp.gmail.com with ESMTPSA id z7sm1711297otm.63.2018.12.07.10.00.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Dec 2018 10:00:40 -0800 (PST)
To: Aaron Lindsay <aaron@os.amperecomputing.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181205134243.4791-1-aaron@os.amperecomputing.com>
	<20181205134243.4791-9-aaron@os.amperecomputing.com>
	<20181205153242.GE5549@quinoa.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <75ec3369-0f1c-0ea7-1fc5-9e2263f6f86e@linaro.org>
Date: Fri, 7 Dec 2018 12:00:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181205153242.GE5549@quinoa.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v9 08/14] target/arm: Make PMCEID[01]_EL0 64
 bit registers, add PMCEID[23]
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A72HBxg7yYVN

On 12/5/18 9:32 AM, Aaron Lindsay wrote:
> On Dec 05 08:43, Aaron Lindsay wrote:
>> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
>> ---
>>  target/arm/cpu.h    |  4 ++--
>>  target/arm/helper.c | 18 ++++++++++++++++--
>>  2 files changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 304e6e47b3..4216fe22db 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -837,8 +837,8 @@ struct ARMCPU {
>>      uint32_t id_pfr0;
>>      uint32_t id_pfr1;
>>      uint32_t id_dfr0;
>> -    uint32_t pmceid0;
>> -    uint32_t pmceid1;
>> +    uint64_t pmceid0;
>> +    uint64_t pmceid1;
>>      uint32_t id_afr0;
>>      uint32_t id_mmfr0;
>>      uint32_t id_mmfr1;
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 71be6fb578..fb6939e99c 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -5256,6 +5256,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>>      } else {
>>          define_arm_cp_regs(cpu, not_v7_cp_reginfo);
>>      }
>> +    if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >= 4) {
> 
> After further discussion on my last version, this should be
> 
> if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >= 4 &&
> 	FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) != 0xf) {
> 
> to guard against defining these registers for implementation-defined
> PMUs.

When id fields define values like 0b1111, that is a hint that the field should
be interpreted as signed, and you should still use a >= comparison.  (See
D12.1.4, Principles of the ID scheme for fields in ID registers.)

A patch adding

#define FIELD_EX32S(storage, reg, field)                                   \
    sextract32((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
               R_ ## reg ## _ ## field ## _LENGTH)
#define FIELD_EX64S(storage, reg, field)                                   \
    sextract64((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
               R_ ## reg ## _ ## field ## _LENGTH)

to include/hw/registerfields.h would be welcome and appropriate, I think.


r~
