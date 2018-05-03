Received: by 10.28.4.212 with SMTP id 203csp1977893wme;
        Thu, 3 May 2018 07:35:04 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqK/FKTvSTIlDmGeOrZOPZmK6wHSpc87w8pcolOWXvb5pwaV4Q3Wt45WKzHG/hNU7tw9Nj4
X-Received: by 2002:a0c:b4c1:: with SMTP id h1-v6mr19880847qvf.87.1525358104535;
        Thu, 03 May 2018 07:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525358104; cv=none;
        d=google.com; s=arc-20160816;
        b=hNrKVMABVIjZsNkVe2M6ht8VfW87GJzoxQOmoNUqJMWmrmc9/Ee2o5wr4HP0MpLOES
         7m3wigrGCBUwVjVG8aW2oZRuW779H8REgEtHsXSqJ6U19tOjst5CON0gEIkPjrSizT4P
         g0fWKz2GrSXjv34liip8eMaHuE4Q3ak5rQeriGtC51g1fBQ552sil9V8sJ7yqeTkx8pa
         Si6i14aHyJ5PxmQFZsfSWtLk3W3mNevbRF3yhTnUpBNurKLP86UjB5qPugXjK+ZnYO9d
         DDjGlV18dFcw1EQRNx5ixgdAZ7y3JqeBeG5Ij4koTMDU516pR2CN26ibBg3sPV3icULy
         ZeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=FkJ+rkZh/mT+WCvSiyxpmjJff+xVxSlHGTd4TpK3iLU=;
        b=vv8sNRnj650tjZP/GhMA7/h/kZyoY1yyF6uJKoOjPBj6/vIejvPdVLJ1TS2n3RM7qE
         hE6D+jRAhXdlzR9eUrPYBpbRUogCg5x/LWymQ580MlBX5I2IcTlVWkvF8g0w5Z3NtILI
         Odl+wUjVwIXFWlnN6WET9xCYuypaivYVMTpTCtSNhk9pm+SDpw1ZlXBhhOGWSaAxl5Sb
         pvQPRNyt2uCP6NJuWMomaXW31PwSSedrd0T8EGA9HCA7YRRbT2RneX8Gu4Uqce+ml6Ia
         WstYBiHCqPaGBMUXOKGAp9SQKzUNk5mG8xFvvbo5A43/c+mJa84Iq0qOwY0FWkwGqgyn
         N0wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si12232840qkl.97.2018.05.03.07.35.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 07:35:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEFK1-0008Fq-HI
	for alex.bennee@linaro.org; Thu, 03 May 2018 10:35:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1fEFJX-0008Ed-5r
	for qemu-devel@nongnu.org; Thu, 03 May 2018 10:34:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1fEFJW-0008QB-7Z
	for qemu-devel@nongnu.org; Thu, 03 May 2018 10:34:31 -0400
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:38348
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1fEFJT-0008Mt-MV; Thu, 03 May 2018 10:34:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 404088152A;
	Thu,  3 May 2018 16:34:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GRxooFPlNie5; Thu,  3 May 2018 16:34:25 +0200 (CEST)
Received: from localhost.localdomain (unknown [10.10.8.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id B35908139C;
	Thu,  3 May 2018 16:34:23 +0200 (CEST)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20180503115620.10596-1-edgar.iglesias@gmail.com>
	<20180503115620.10596-2-edgar.iglesias@gmail.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <5af8086a-4ec6-f3fc-f8d4-8aab33f1cf78@adacore.com>
Date: Thu, 3 May 2018 16:34:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180503115620.10596-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: Re: [Qemu-devel] [PATCH v1 1/2] target-arm: Add the Cortex-R5F
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
	alistair@alistair23.me, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J/HCD7EybsX7



On 05/03/2018 01:56 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add the Cortex-R5F with the optional FPU enabled.
> 

Seems ok to me.

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   target/arm/cpu.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d175c5e94f..7a7035c037 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1341,6 +1341,14 @@ static void cortex_r5_initfn(Object *obj)
>       define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
>   }
>   
> +static void cortex_r5f_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cortex_r5_initfn(obj);
> +    set_feature(&cpu->env, ARM_FEATURE_VFP3);
> +}
> +
>   static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
>       { .name = "L2LOCKDOWN", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 0,
>         .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> @@ -1801,6 +1809,7 @@ static const ARMCPUInfo arm_cpus[] = {
>       { .name = "cortex-m33",  .initfn = cortex_m33_initfn,
>                                .class_init = arm_v7m_class_init },
>       { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
> +    { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
>       { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
>       { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
>       { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
> 
