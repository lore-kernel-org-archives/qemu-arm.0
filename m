Received: by 10.28.91.67 with SMTP id p64csp3240413wmb;
        Mon, 19 Mar 2018 18:04:17 -0700 (PDT)
X-Google-Smtp-Source: AG47ELurE7An/d6DRORZNwndGG9FOsPljII1Q61ot2wN2ePlN1iVkYAwXvsj9ZwPElSpByCmCtkV
X-Received: by 10.55.42.32 with SMTP id q32mr20792480qkh.297.1521507856977;
        Mon, 19 Mar 2018 18:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521507856; cv=none;
        d=google.com; s=arc-20160816;
        b=1BdvirtsvsaY58HpSi3kDuAP7QJXWRDaoYwPclaxB3nqD5hTRea5EYDHGx894U+ucQ
         Zh77xqOgGz3HbS4vW7FvNHgtw6vot79zThgvzV+14A3JSbwZfEwh3tir5wfWX/3XN5gk
         g8FxRhLTqWWcoweo4jGISdbZqjVvW8UbAlj8Cyqw+Lh0VCMRpTprbh0hTcOEFJu0yIcl
         z4gAk3abSpmbySgqosyazcdVt5sIghX8Oikv1JeVF9FwIJQ2vKb7qRv7S4RwzstRkhNh
         Iqn/H5gnFQKwNa6nTu31Xws82Wy0nFNxnwETyCpzZavU6EGHcJo9xVC0ivPda94vmw8z
         JGbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=IgbzU7/E2AMl1IHJDudOuBaxjfSdTNPazm7HeBRHcPQ=;
        b=vACaewym+t+5fSPIZH4RfJfZLeyHqA00+9q7bNkDChANgM10R2UeXuYCQAKzE0LOs6
         WPKxUFgOcO3++BGlAlCQmtkib8Y3eWWH/+Fz3gVLUcpa6FP47koBmEeWZDt2Kw3KYrus
         Ju9sqHOyiOUjNUFIAoVHhJitYExwzX/CciTX/pGyTEdwlxAwetUSoJdHxLqXNYwTATQk
         n6TmjoO795o+jtJA4nJO4trUMuUBOs8l96SvVmbcyALp9MUQrlmhDYRrG3MyIWKWrb0K
         /qSTSlZCkCiRVOHJPGeFVb2rp4+R4jHqbfPCjvELenC3Dgg4ZZ+Ojue8xxf4RZX2x0gc
         Rn7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=m/0xivii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d9si324911qtj.347.2018.03.19.18.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 18:04:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=m/0xivii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ey5hI-00082O-F0
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 21:04:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ey5hA-00081i-0z
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 21:04:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ey5h9-0006Ts-85
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 21:04:08 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:55929)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ey5h4-0006Qz-2z; Mon, 19 Mar 2018 21:04:02 -0400
Received: by mail-wm0-x243.google.com with SMTP id t7so314026wmh.5;
	Mon, 19 Mar 2018 18:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IgbzU7/E2AMl1IHJDudOuBaxjfSdTNPazm7HeBRHcPQ=;
	b=m/0xiviilb6zoLTtm+yVlV73AbMQnlUunr821scI+bwUT7RJVNgtbfCF/fNqP1KMKG
	oVha52kwe1e1FhBi7L+/ELSrZUb8FwWkmRjB2x6CdIq4D1iF+Rk/l0lfmYevNbFGxAig
	OV6Opp8Gi5MeEl1ypRpDq1d/HGR3vJBF0B1YKpI0DaQNtjRFUvFcyvvUA6MmfDH4HzRp
	fOXiDpUPPwd0J1omgkW7MK8XuOAnhRzt02n5eL+mnOVvyeRgNEHtGJH4NVvDWluNxJ6v
	xv3VRP3v9eo8tFtX/SaA2y0sHvsx2qwAYs8PRVoSZV6Cts6TYn0PVUVvhPtc6nnCad5Q
	XzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=IgbzU7/E2AMl1IHJDudOuBaxjfSdTNPazm7HeBRHcPQ=;
	b=bbOkOTHZSM/3r0a6gOmC0j+jx2L0JAL+f2RK2IQbdZ04mQNOWFhgjLK9IwpUhQHPQK
	VFI2AUaByrmH5HSfjE7Zi/4G3Pt4GrGztYc+elBO+zbvGeqzyoJVHzL9IRqKYXxtN9qR
	z1NV6KW9HId8kTxi8y0ZCuU9LDZZZVZlojYnG5xOB817vKhNL13YCVIvHPBMt0ffMbob
	STMIqPVTEi4UHFqFtFGFed/WAU8aFg/xV2hC/1kc/u94DlDfHL6nq+wcAM3wLubOxOEY
	r8nz3fIWULP7p4hoV2+uu43IOV+EpCDY3v+dW4uAEEkxz+7b/rTXhlkxyRUahgtqc7NV
	08Ww==
X-Gm-Message-State: AElRT7Hq+aWzaKPH6jiiPkhlQhUrl24i0pU8FrLYdwDmHST1e18R8mHO
	/sugA7bZfPurZaxOp0Zwjog=
X-Received: by 10.80.187.14 with SMTP id y14mr14899559ede.26.1521507840838;
	Mon, 19 Mar 2018 18:04:00 -0700 (PDT)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id l91sm895086edl.4.2018.03.19.18.03.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 18:04:00 -0700 (PDT)
To: Aaron Lindsay <alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-2-git-send-email-alindsay@codeaurora.org>
	<aeacd6da-0f45-f871-9a0a-2c8a524db510@amsat.org>
	<20180319203509.GD24561@codeaurora.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3e12e8ef-e5ee-d690-7d01-c074b6145566@amsat.org>
Date: Tue, 20 Mar 2018 02:03:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180319203509.GD24561@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [PATCH v3 01/22] target/arm: A53: Initialize
 PMCEID[01]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QpxdEmLVlwID

On 03/19/2018 09:35 PM, Aaron Lindsay wrote:
> On Mar 18 23:35, Philippe Mathieu-Daudé wrote:
>> Hi Aaron,
>>
>> On 03/16/2018 09:30 PM, Aaron Lindsay wrote:
>>> A53 advertises ARM_FEATURE_PMU, but wasn't initializing pmceid[01].
>>> pmceid[01] are already being initialized to zero for both A15 and A57.
>>>
>>> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
>>> ---
>>>  target/arm/cpu64.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>>> index 991d764..8c4db31 100644
>>> --- a/target/arm/cpu64.c
>>> +++ b/target/arm/cpu64.c
>>> @@ -201,6 +201,8 @@ static void aarch64_a53_initfn(Object *obj)
>>>      cpu->id_isar5 = 0x00011121;
>>>      cpu->id_aa64pfr0 = 0x00002222;
>>>      cpu->id_aa64dfr0 = 0x10305106;
>>> +    cpu->pmceid0 = 0x00000000;
>>> +    cpu->pmceid1 = 0x00000000;
>>>      cpu->id_aa64isar0 = 0x00011120;
>>>      cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
>>>      cpu->dbgdidr = 0x3516d000;
>>>
>>
>> Maybe we can move this at a single place in arm_cpu_post_init():
>>
>>     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
>>         cpu->pmceid0 = 0x00000000;
>>         cpu->pmceid1 = 0x00000000;
>>     }
> 
> I like consolidating the initialization - though I think it can go in
> arm_cpu_realizefn() with the preexisting PMU-related id_aa64dfr0
> initialization since it is constant once you've chosen a type of
> processor. One of the other patches in this set actually already adds
> some PMCEID initialization there based on PMCR.N.

Indeed, arm_cpu_realizefn() is a good place.
