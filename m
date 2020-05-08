Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp199067lfb;
        Fri, 8 May 2020 07:27:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypL3K0TC3HrA5TfHjjRxINJq7iknX2y7jB6vjTL8h/HZ/zxv2E8SzL58TNsIj1hbZcFWDlCk
X-Received: by 2002:aed:3eca:: with SMTP id o10mr3230214qtf.30.1588948074168;
        Fri, 08 May 2020 07:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588948074; cv=none;
        d=google.com; s=arc-20160816;
        b=YKV4Nz4e5k6PKCramWECRx9ZgjG0qmY8pkHZzGOO52knahi1+s/Wqz+vNCR78Y+xCd
         4Xp+V5m6R919+ejegHCdt3OnEJ5NAJVzy4FGc9+MFrePPsNv7vQDB7ayJl2sR2LxqmqN
         CuqZPqU06Atx1tvPx3oXQdlTePY95/SmoA/wKXY/3fjeAd1/ehZNLZCxcH3Dqni/uqzE
         PWdFdkDibnZcqYsd6Rz0GOToPw5ctILu1+QqLmIsfFjIYXcXqZjMq3J2XzOO2FL72GwW
         QqriBZnbPPa1mvK5HohBGQneMPi+fLEy+1uDH09O5NDZlICAPE+pA4JNFrLz//CAocX/
         3HQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=I+BnMn7J0g+EwwV6X8OR+tON6FeitcEVGwVgZPNroSU=;
        b=DPkQ/2wFrIHYX8QXxi8C5NeB6esBq+FahxBYKTWllOxOs2PG5mV1c3mITTtq3lMFRI
         vfxlzVRdTuiwzSZPwz5Pm/KK8QnkRHvzFjmrIRnYj6EE0v+mir3epTRP5SLm82xBZ865
         JGHApvalZ1KmH0D2xIO9j558/XQWBL2LWkf5sV2D8NL0mSabR12Z7S7ocq+BKV5NaRjW
         B2fac2w5g6/7iP1wpQRz7KKPQO4/KAUp9VM1p3MZj60TdlHclhEPP4roUcugKnWqXxva
         cCyld/tIEc5s4dkGPZT8OG/KISWdFTPYVa+w/CHUCWWiO1PRv9XeKJ/6wyBb4nIvWrPe
         DzZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 201si1145842qkj.249.2020.05.08.07.27.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 07:27:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX3yj-0002Q3-JN
	for alex.bennee@linaro.org; Fri, 08 May 2020 10:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jX3ya-0002Pd-8S
 for qemu-arm@nongnu.org; Fri, 08 May 2020 10:27:44 -0400
Received: from 5.mo2.mail-out.ovh.net ([87.98.181.248]:38134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jX3yZ-00010e-6M
 for qemu-arm@nongnu.org; Fri, 08 May 2020 10:27:43 -0400
Received: from player728.ha.ovh.net (unknown [10.108.54.119])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id AE1671D5F25
 for <qemu-arm@nongnu.org>; Fri,  8 May 2020 16:27:40 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 7F23C12133DD4;
 Fri,  8 May 2020 14:27:33 +0000 (UTC)
Subject: Re: [PATCH v3] aspeed: Add boot stub for smp booting
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20200504081953.245912-1-joel@jms.id.au>
 <CACPK8XfTg1OucOEeiUE711_+-Pz4daYCrPmKFDTj25keeM8aMQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3e8500ab-929b-a3f0-f8b6-fcf8ea5c1306@kaod.org>
Date: Fri, 8 May 2020 16:27:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfTg1OucOEeiUE711_+-Pz4daYCrPmKFDTj25keeM8aMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7808115856730393408
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrkeefgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedvkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=87.98.181.248; envelope-from=clg@kaod.org;
 helo=5.mo2.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 10:27:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CXq56m87hZUf

On 5/8/20 8:52 AM, Joel Stanley wrote:
> On Mon, 4 May 2020 at 08:20, Joel Stanley <joel@jms.id.au> wrote:
> ...
> 
>> v3: Use WFI instead of WFE
>> v2: test for number of CPUs
> 
>> +static void aspeed_write_smpboot(ARMCPU *cpu,
>> +                                 const struct arm_boot_info *info)
>> +{
>> +    static const uint32_t poll_mailbox_ready[] = {
>> +        /*
>> +         * r2 = per-cpu go sign value
>> +         * r1 = AST_SMP_MBOX_FIELD_ENTRY
>> +         * r0 = AST_SMP_MBOX_FIELD_GOSIGN
>> +         */
>> +        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
>> +        0xe21000ff,  /* ands    r0, r0, #255          */
>> +        0xe59f201c,  /* ldr     r2, [pc, #28]         */
>> +        0xe1822000,  /* orr     r2, r2, r0            */
>> +
>> +        0xe59f1018,  /* ldr     r1, [pc, #24]         */
>> +        0xe59f0018,  /* ldr     r0, [pc, #24]         */
>> +
>> +        0xe320f003,  /* wfi                           */
> 
> I was wrong, wfi does not work in this case. I must have made a
> mistake when testing.
> 
> Cédric, can you please confirm my testing is correct? I was using
> today's linux next, but anything newer than Linux 5.4 should have the
> same result.

Indeed, with OpenBMC kernel v5.4.32-260-g7dc9442bbe7d and wfi (patch v3), 
    
    [    0.045214] smp: Bringing up secondary CPUs ...
    [    1.178127] CPU1: failed to come online
    [    1.187309] smp: Brought up 1 node, 1 CPU
    [    1.187590] SMP: Total of 1 processors activated (2250.00 BogoMIPS).
    [    1.187786] CPU: All CPU(s) started in HYP mode.
    [    1.187850] CPU: Virtualization extensions available.

When using wfe (patch v2),

    [    0.091092] smp: Bringing up secondary CPUs ...
    [    0.096628] smp: Brought up 1 node, 2 CPUs
    [    0.096718] SMP: Total of 2 processors activated (4500.00 BogoMIPS).
    [    0.096768] CPU: All CPU(s) started in HYP mode.
    [    0.096785] CPU: Virtualization extensions available.


Cheers,

C.

