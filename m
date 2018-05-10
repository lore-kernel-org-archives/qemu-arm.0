Received: by 10.28.4.212 with SMTP id 203csp1317319wme;
        Thu, 10 May 2018 11:00:32 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZov7e7c6X9LQK5syvVPEljS1A1CPYeEcPF6+16hvpFPiU3BFnO/JZwpz0mIdPKWXSW0SYmP
X-Received: by 2002:ae9:ed8c:: with SMTP id c134-v6mr2148636qkg.323.1525975231856;
        Thu, 10 May 2018 11:00:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525975231; cv=none;
        d=google.com; s=arc-20160816;
        b=ltl+zVVMSYVG07hKUJiQLdhi9LsL5eeprzrQsQjgv0LDGeGtrz7XO9b4MvyYRBOvzj
         ewnGICuCQCcRz16WzuWTnJEYpNZr74PfXLu2N0AHs+CkpdIEwejwmAz3VfKLY894y9QI
         jad2qyWLjEJbCH7QB7exeYvlxwd/biQF3i2QsTU8R6ltWBNmlMmrGfb6nkA/Mv5kPMoc
         Ov6zDe1wzwUAizMWcKtZNFmzH7+26r7kf76vcCo7qTKwwMFdXwae9Xx8/Iiw0v4EHE9I
         2V6+e00t3lW7uQ0aDsiqpSXcUZ/c14Y4l70SEP3+25PyjaFAiFY+Do+8CZ5gMx2NWLnT
         p10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=rkO3l92A/UWb0kDq3TQCevydgtIVy8V33UG2eqPEnk8=;
        b=QArDDaRB31EN/xeseLV4WrLjSuOlYT2nqpGPnwW0yVT2Pg6S/sJxEMGAKW6wiwxcP4
         bLacduahtd970/4KpNyAZDusrPehHrCcOsnJ9TE65KA97WenIy2Vlx26wjwWDfFV5HcD
         w682HI7TgeR59Gc3AjSYOFSKkp90gA+VkN1mi0JiYP4XVdAg6ZpnN256hn2SDirWwL26
         jI4Mx2mPtVxQhyrTY1hJNo9C0tM0LqNJyVNtx5V19zM4ZlSPxfHf7yXfhPjRZfshXLXE
         kaQ/EvA+FYDibKyTmIvv9bBtLWhN916VlISPIN12bh39/ccfc/wms71hHTSgflihuRiW
         /ppg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cu5FjqyN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z13-v6si1299380qtb.231.2018.05.10.11.00.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 May 2018 11:00:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cu5FjqyN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGprj-0005vx-9R
	for alex.bennee@linaro.org; Thu, 10 May 2018 14:00:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGpr2-0005Qp-1G
	for qemu-devel@nongnu.org; Thu, 10 May 2018 13:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGpr1-0002KR-8y
	for qemu-devel@nongnu.org; Thu, 10 May 2018 13:59:48 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:34362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGpqw-0002Io-QH; Thu, 10 May 2018 13:59:42 -0400
Received: by mail-qt0-x242.google.com with SMTP id m5-v6so3712789qti.1;
	Thu, 10 May 2018 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rkO3l92A/UWb0kDq3TQCevydgtIVy8V33UG2eqPEnk8=;
	b=Cu5FjqyN6rOpayBNb6W/CKKZcYRjYagdfyxKaSJYBrpQCQ02Sa7dUmPevERRwW7j+N
	M0Devu2vmaupuEdmkKA6JS/7J6LkY/bR4/zspf0hHeSi+ioM5H+2MsGYXQEbAj/1oBBG
	cKjiVeiY2Fy84fCpritl1fgaI05vQ0wa+06MdR2APBEt2df/7GHb1fYpsxvT7Qrb6E7S
	MT0nAy75u86cD8sPUTxEhgQA4uBjh/nXFJ5Ng7Y5qHAkqG4QtwL+7NW5eXdOmLxEqrR/
	bZs5cwX3NprtOihZQyq0Kp1MJG7LPxEFOEfgs25ogs5kd70FaUDGMd51H5cjq6kIY8/i
	1sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=rkO3l92A/UWb0kDq3TQCevydgtIVy8V33UG2eqPEnk8=;
	b=t1WDLuAXg06D2w/ty6ESnezvzYk5fU3LSk/D+NzNIcG8PLskH/g3FX1LUGLIBsvI1Z
	SZCFicpW1Nb4Clf5yN8D4bcutavuhCqDkZt3U5ilIpAv3IiPkOiTfAYB6ABOwlp8RbKq
	TxZC0F1gcwGKYOlA15qDcZSoxnYuymbd+Si9RygAtigbIXHJcZyGRL/Xdys5yn3RWbXE
	dQ0e+eV3FBMVO5VKRwrBqd5kGzzBLyWOM58PeFQu8yzfIbA2AxsOyBPZ6K8oJZkCJW0N
	cqPAm8FcksQjdZjPEbedavC/dqZ8oR7irfp9/JRofJ8/iJcjXiieofZYdAi4a+f+sG7j
	d+yg==
X-Gm-Message-State: ALKqPwfsStHJSrEUSYTVtarx71dw7uIwsgTkX+cSo4mmNPnIkr81WaJW
	1OUQ7i28NKcTM9wpiCRNkmEKvmkA
X-Received: by 2002:ac8:7350:: with SMTP id
	q16-v6mr2468754qtp.132.1525975181921; 
	Thu, 10 May 2018 10:59:41 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	p25-v6sm1035369qte.83.2018.05.10.10.59.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 10:59:41 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20180503115620.10596-1-edgar.iglesias@gmail.com>
	<20180503115620.10596-2-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c598019a-b635-bc36-84d3-f87bbb69c4b6@amsat.org>
Date: Thu, 10 May 2018 14:59:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180503115620.10596-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v1 1/2] target-arm: Add the
 Cortex-R5F
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
	alistair@alistair23.me, frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C2sciJAu2Hnh

On 05/03/2018 08:56 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add the Cortex-R5F with the optional FPU enabled.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d175c5e94f..7a7035c037 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1341,6 +1341,14 @@ static void cortex_r5_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
>  }
>  
> +static void cortex_r5f_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cortex_r5_initfn(obj);
> +    set_feature(&cpu->env, ARM_FEATURE_VFP3);
> +}
> +
>  static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
>      { .name = "L2LOCKDOWN", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 0,
>        .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> @@ -1801,6 +1809,7 @@ static const ARMCPUInfo arm_cpus[] = {
>      { .name = "cortex-m33",  .initfn = cortex_m33_initfn,
>                               .class_init = arm_v7m_class_init },
>      { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
> +    { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
>      { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
>      { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
>      { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
> 
