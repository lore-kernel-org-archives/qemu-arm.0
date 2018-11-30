Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3818170wrt;
        Fri, 30 Nov 2018 09:18:01 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VzwuBa8Miq12zYj623RM6y+ta6mjHSUSulQeyHw36aInWXAJWX+f/I8XbtO0pKtICirASR
X-Received: by 2002:a25:814f:: with SMTP id j15-v6mr6082928ybm.516.1543598281553;
        Fri, 30 Nov 2018 09:18:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543598281; cv=none;
        d=google.com; s=arc-20160816;
        b=iP1VaZ2Z3stmpbKh4cOgr6k+IyXQkm/xKh8A9bEBHbEjwY84gOgg5iw9lBXlXfsy7w
         qo6J4UUQAHYD/W9cx0M0SD3DzfYXp4VFTEbDmMhPKGD4VWsyb3v14cfvqm2YpkZMwlMo
         MUJtEjC1VvwR0qgqLZERrh7wp/kocRvH/+xMBPg12slVmayCA//teESL7H9CgMAaCdCU
         xodaOTpKaZf+DRB64XiI/q8e5UbLl+b/CEl38Xo6QoDl4ShhHvOm7Kyt7tNfZS2M+f7u
         aEvb4qfi0o42f2QE7c9VOb1qjn6o61rK8uix9SNeAJRKWTtMAKgwjIROzQGmCePxjmEM
         cWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=DSH0a0CJv46cHVbc3DmZ1XdocNgOA9o/kz7ln7/vZOc=;
        b=FH9Klwn7Kg7diiZlPXs0/dDKfJJeE+PCzq0HsT0QxqzrL6E1CMmVyKwYkYZ4AtOQ3l
         BTQrp6MXuWf3D1h2fxsf8wffeimzd87Yozkme/WsdRWGr1NGe0rRihp3L44KgIIzqhSh
         vdNVSmCdiLygPkMvJg5+sfSTPlYioGchGZmmT1NedB6vJrSPUuAFJ8S7K2rvxkGG1E9h
         OtC7xxt2FupmeAO1CsTR0Qginku73+GuRNzJgw5A0q12LEvvsKdtuwPQtIQnrM51tPuD
         M4kGvxHEXLxCRAzI1g7iseRfjzbpRPj6r7yzLu5SUPAVtofI4fsUSsGj5CLIW4cxiCod
         PWoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MvAklUsG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i4-v6si3505050ybe.84.2018.11.30.09.18.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 09:18:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MvAklUsG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSmQS-0005tG-OF
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 12:18:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gSmO2-0004qd-PJ
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 12:15:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gSmLj-0000J3-N9
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 12:13:10 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:35252)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gSmLj-0000HE-F4
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 12:13:07 -0500
Received: by mail-pg1-x543.google.com with SMTP id s198so2778524pgs.2
	for <qemu-devel@nongnu.org>; Fri, 30 Nov 2018 09:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DSH0a0CJv46cHVbc3DmZ1XdocNgOA9o/kz7ln7/vZOc=;
	b=MvAklUsGfezbuLnR37d9wRjP0CkJR5z7DJqi6wgkadFdIHdEbeo6+HG4FKp6YWaHxf
	4TbCt4ccJlgtgRD4zEX1LpnDojVM6rZmCjpM33Z3NnTPSbY8I8DqPA13r48pGVRc2Hpr
	JxQV8X9WA+I/z6LL15v8bUsSKwR2VAlGDOShw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DSH0a0CJv46cHVbc3DmZ1XdocNgOA9o/kz7ln7/vZOc=;
	b=AKbhnu/EEhxcuUPYrlbHdmObAkJpImJFRLa415619R86wlua35yQZPWkQ4E4ENeMBF
	nBoPwqllbYDb1NLACyHCuEq4fL/F6iAQQKieSs1gz1wAeeOacQrWOw/fQ9ZAK8vjnlUv
	+YTrmj1h8rBKyNVYuKs9+X075oXZUk69HCEK/iWYeUnr7laKAnIp0oc6Y2CiHAlhxYAS
	BIR+hRcaZdXRsPEFZa7rAKyw5gfzSuSVe+ywVC4cvweA5aIjhiupMiEGwLV/nU73eQ/M
	TjmazAGkIZ2xY8QnqctEvPGbS8WW36EuRXNpnIfnrDIF/if/6XPQZEsUvDryCU05gzhD
	FPFg==
X-Gm-Message-State: AA+aEWaY2tajFx/YJSUD+CO3h4VsHEuaqoEefhS3KkRi3wqZT+lRI7yd
	heJ638H1KXd4QvVqHz4muKrSsQ==
X-Received: by 2002:a62:c42:: with SMTP id u63mr6279102pfi.73.1543597985662;
	Fri, 30 Nov 2018 09:13:05 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	x12sm6344215pgr.55.2018.11.30.09.13.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Nov 2018 09:13:04 -0800 (PST)
To: Aaron Lindsay <aaron@os.amperecomputing.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-14-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d6fde9c7-b72e-ae9d-817b-71c3d6369dbc@linaro.org>
Date: Fri, 30 Nov 2018 09:13:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181120212553.8480-14-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-devel] [PATCH v8 13/13] target/arm: Send interrupts on
 PMU counter overflow
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>,
	SM-Aaron Lindsay <alindsay@os.amperecomputing.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e4Kutmtw1CQR

On 11/20/18 1:26 PM, Aaron Lindsay wrote:
> Setup a QEMUTimer to get a callback when we expect counters to next
> overflow and trigger an interrupt at that time.
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> Signed-off-by: Aaron Lindsay <alindsay@os.amperecomputing.com>
> ---
>  target/arm/cpu.c    |  12 +++++
>  target/arm/cpu.h    |   7 +++
>  target/arm/helper.c | 126 +++++++++++++++++++++++++++++++++++++++++---
>  3 files changed, 139 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 208a08e867..7311a48e3c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -827,6 +827,13 @@ static void arm_cpu_finalizefn(Object *obj)
>          QLIST_REMOVE(hook, node);
>          g_free(hook);
>      }
> +#ifndef CONFIG_USER_ONLY
> +    if (arm_feature(&cpu->env, ARM_FEATURE_PMU) && cpu->pmu_timer) {

No need for two tests here.  Just check cpu->pmu_timer.
(If it's set for any reason it should be freed, surely.)

> @@ -1305,7 +1338,18 @@ void pmccntr_op_start(CPUARMState *env)
>              eff_cycles /= 64;
>          }
>  
> -        env->cp15.c15_ccnt = eff_cycles - env->cp15.c15_ccnt_delta;
> +        uint64_t new_pmccntr = eff_cycles - env->cp15.c15_ccnt_delta;
> +
> +        unsigned int overflow_bit = (env->cp15.c9_pmcr & PMCRLC) ? 63 : 31;
> +        uint64_t overflow_mask = (uint64_t)1 << overflow_bit;
> +        if (!(new_pmccntr & overflow_mask) &&
> +                (env->cp15.c15_ccnt & overflow_mask)) {

Fyi, this expression is

    env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask

> +            env->cp15.c9_pmovsr |= (1 << 31);
> +            new_pmccntr &= ~overflow_mask;

Why this line?  You just checked that overflow_mask was unset in new_pmccntr above.

> @@ -1318,13 +1362,28 @@ void pmccntr_op_start(CPUARMState *env)
>  void pmccntr_op_finish(CPUARMState *env)
>  {
>      if (pmu_counter_enabled(env, 31)) {
> -        uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
> +#ifndef CONFIG_USER_ONLY
> +        uint64_t delta;
> +        if (env->cp15.c9_pmcr & PMCRLC) {
> +            delta = UINT64_MAX - env->cp15.c15_ccnt + 1;
> +        } else {
> +            delta = UINT32_MAX - (uint32_t)env->cp15.c15_ccnt + 1;
> +        }

FWIW, this is the same as

    delta = -env->cp15.c15_ccnt;
    if (!(env->cp15.c9_pmcr & PMCRLC)) {
        delta = (uint32_t)delta;
    }


r~
