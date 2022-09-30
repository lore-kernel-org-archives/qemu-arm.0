Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1782776ocs;
        Fri, 30 Sep 2022 08:00:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6RT/1lagv7yTzuRYGNBQIEen6x6YUSOm0QkK+pYs4dpuHkidnShNKUDfpkpBbN2glfxcyY
X-Received: by 2002:a05:6214:4118:b0:4ac:ae43:4074 with SMTP id kc24-20020a056214411800b004acae434074mr6880713qvb.13.1664550043996;
        Fri, 30 Sep 2022 08:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664550043; cv=none;
        d=google.com; s=arc-20160816;
        b=sqQAGCXyPntqPgntW7OpMZFCpU+h5ubn7Q1fzchAQcDVERA9WMDqhWWj4bh39ovfjx
         5scRaGT6tlRyuOWLpZGPjlntCr3NqYj0229n7wBeF5od+CuflJVg/TVO3S5gWr3p4N0+
         rJupElG7THpzzgaZM8HL50MBw8OOljw55Pvgb0gzaszdIjUHhbdlUYEWegRql7GEYccs
         YwjDu6Q2OdIz2Wxz7Ts4nS1BWVy/9szCHi7EgEqsWQLvjPyAR1zr7sWq8x1VCrvMyreS
         by2O/+Ehdy1jo5DRY7aCtU/SnjbZJNKE8FJkaA7ZeKvKKDKVjViuhSeB7rvzdeD+Tfcq
         I3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=bOYfDtEjsJLqGJBkSSWfJ+JKnScp9u7nkxs98B+gPL0=;
        b=RFiZVHklwvyqqOrikndZAazjeJpuubJRt71JpJC+6G9U6P2t5m24m55P3CmfMBBTzI
         H1Ajxn0cROhQ0LrH2UutTLFkwEgeKBmOhUn5yT4/p2N3nuixRT5dKyuOPfBwDQcS4fww
         t/MoHfmjJjZRp48wS6naW6ziLsy/7eUMcT+/xzatqsIj2h3Hxd1X6lmPwg6jXpRLYWFG
         5XB12fKgZSKhoCVGdtO8oYSH5qD8wvGF9onxxDIFLqLnWM611MjVGUBCrwT/wIxMZWME
         ykLq65iHRJRZKUbjzW5+m8T1Ix6E/2c9SFlWCBEBWe8KWVgFg0e76VfW8sfhc9IIil3R
         Z2rA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a0562140c6900b004ad040f974asi1167404qvj.67.2022.09.30.08.00.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 08:00:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeHVK-0006vs-G9
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 11:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oeHUU-0006sb-AW
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 10:59:50 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:53241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oeHUR-0004DI-Pt
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 10:59:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.66])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4870F2BFD3;
 Fri, 30 Sep 2022 14:59:41 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 30 Sep
 2022 16:59:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003290681a6-2b22-418f-9b4b-2fc7677945f8,
 A23DC664A2347F08C02F66A015DE38D73296DB41) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <229f555d-5f69-1c40-c65d-552a0ed8a39d@kaod.org>
Date: Fri, 30 Sep 2022 16:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
 <CAFEAcA831iWjFSYt3UrKT0zA1MBfJn5BVSpEbVrOWj3Yw6yn_Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA831iWjFSYt3UrKT0zA1MBfJn5BVSpEbVrOWj3Yw6yn_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: bb5a9dfa-7ab8-4321-9f34-d55784dcb86f
X-Ovh-Tracer-Id: 314407551175068454
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegrnhgurhgvfiesrghjrdhiugdrrghupdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JQaZvI3PXw+T

On 9/29/22 13:44, Peter Maydell wrote:
> On Wed, 28 Sept 2022 at 17:47, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> As the Cortex A7 MPCore Technical reference says :
>>
>>    "When FPU option is selected without NEON, the FPU is VFPv4-D16 and
>>    uses 16 double-precision registers. When the FPU is implemented with
>>    NEON, the FPU is VFPv4-D32 and uses 32 double-precision registers.
>>    This register bank is shared with NEON."
>>
>> Modify the mvfr0 register value of the cortex A7 to advertise only 16
>> registers when NEON is not available, and not 32 registers.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   target/arm/cpu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 7ec3281da9aa..01dc74c32add 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1684,6 +1684,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>           cpu->isar.id_isar6 = u;
>>
>>           if (!arm_feature(env, ARM_FEATURE_M)) {
>> +            u = cpu->isar.mvfr0;
>> +            u = FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
>> +            cpu->isar.mvfr0 = u;
>> +
> 
> Architecturally, Neon implies that you must have 32 dp registers,
> but not having Neon does not imply that you must only have 16.
> In particular, the Cortex-A15 always implements VFPv4-D32
> whether Neon is enabled or not.
> 
> If you want to be able to turn off D32 and restrict to 16
> registers, I think you need to add a separate property to
> control that.

Something like "vfp-d16" ?

Thanks,

C.

