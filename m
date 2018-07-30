Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4048446wru;
        Mon, 30 Jul 2018 10:53:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdYNdVo93RKEkK/CyC4UcPE1gFy7sMXJVEaEEqrLluS+J5nikkqObAk1Ck/wD8FjuTdBc/9
X-Received: by 2002:a0c:bd96:: with SMTP id n22-v6mr16083144qvg.187.1532973193636;
        Mon, 30 Jul 2018 10:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532973193; cv=none;
        d=google.com; s=arc-20160816;
        b=J+ReiyzO0BkzJO6250GH6UeW4LlFzUZLpnkFSrLGFZnuPy49N87rprSqMkw5sQBn9/
         zLSz4cy/+LVTvhTcJk1NXztd+OSS3EIyZ+ulpA+lAx0xWeC+X3plLApIMw3YwmG9jrAW
         2QeRNO75jaam3UqGIdqxKkcBZlvR/snQcIfbFIxqEmlcaCNWg10s/M8yO2mKUqc21/ac
         yy7/JDQVAc4TAraTL2bCVRMfZ4eQjw5dqxuDvikj3Rkw4KT7OnG/URk7Q669mEQ2s6wJ
         A4Bm/Aj1nlmITalrkUDiv0mTlo4fs93pfNOIHhghBVDZcqvMd4SHIT6/25axjCdERFPQ
         f4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6OR4FMlUynroeBXO/mcK4x2mZCUk1ZhSK8aPF4jA0fg=;
        b=HLwNJbbBEOsxTGMKi0ga90L28K1xY7n85fiM23DgEk/asDQTDODbrHv/+g8Fj402fA
         sOKKtNak3mJGs27528wuHAm6GBUSfDtIglsxrqsTINJyB0hLcRxpYNjUkhw5ocu4KxSN
         yXMRExLoY9b4iO4FzHHkFsKnpsdzNVv7aZuKntOzbUPCoyUTDOUbL294Wn48/LYdWTz1
         itLJXdmWJeasLNE6BKl1KG47PfMhLie4F6tn1L8qk6PFLn7wH56F6zWf50vkyH0wXUX3
         LMNrL2QXLiJOevXzBxlLEt0/y14RuRVrg1cYMGECVXNn0X1+q0MW9bv5e2jtTRY+TkxC
         kgnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gqm4+Bpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 48-v6si1665149qvl.72.2018.07.30.10.53.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 10:53:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gqm4+Bpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkCM5-0006xk-4Y
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 13:53:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkCLj-0006of-Ax
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:52:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkCLi-0002aO-KD
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:52:51 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:43014)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fkCLi-0002Zx-Eu
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:52:50 -0400
Received: by mail-oi0-x243.google.com with SMTP id b15-v6so22854423oib.10
	for <qemu-arm@nongnu.org>; Mon, 30 Jul 2018 10:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6OR4FMlUynroeBXO/mcK4x2mZCUk1ZhSK8aPF4jA0fg=;
	b=gqm4+BpeEBT94QBrWX4z2VT92zTJFFKNKtJWaeAbKxJ2MGHg4+Ns2THXFSbn8Ammze
	OviyZarUQ2djy8mo7tAZ4hJtutLbDK63mmYdRbrKGomKlSaTWEe4OwoGC7ftj9JVCjDB
	oDvSzqKENg88Qb8AT580vbZSZqDuggxi5hLxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6OR4FMlUynroeBXO/mcK4x2mZCUk1ZhSK8aPF4jA0fg=;
	b=CBG7bStQUWpMxRA/LsVvI89y3SvgT+GecXS8k9YeoEiV62DOd/FSF46gNS7uEpJdCS
	hnyS55D+2+7vWTefLUhm2ZzZVgfqELOd91yLW1HmUBKOJ0T7Ykvl/UA0QxOZg/R/h6HK
	6kJ9UsaWQja1O/TRn/ms31niFQIqwAZfZX9+rf0yZ38AKwpqYpTtIhyqQLfeyBFmwh6Y
	4dotR3Pv7JTwQA+8MT4bLCBedPK2fhao0LEfxM3XmOmCN1fivEKx65cCoe0RIP4GZkNg
	U1WjkwUskYdFiBeRwkJt8IMdCr8XySGnWkMopE7DmzGocmYT1aWZtn7e99pR0wG6Icxr
	V04A==
X-Gm-Message-State: AOUpUlErZepsMJgAEcDpQmYn+Ej5GZzg5BT3qWSOr5O8gnhshMCfJnCj
	SatasqNo/G09t8zT4Z9zrr98thEQOFv1heRKMJTu6A==
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr20038071oih.102.1532973169770; 
	Mon, 30 Jul 2018 10:52:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 10:52:29
	-0700 (PDT)
In-Reply-To: <20180725085944.11856-5-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-5-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 18:52:29 +0100
Message-ID: <CAFEAcA92R=_aLRSJ0Jqsir8kmcFExNUUhZgyw0PSDuSc--GD6Q@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v3 4/7] target/arm: add "cortex-m0" CPU model
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, Liviu Ionescu <ilg@livius.net>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EcqhtCqWCpUp

On 25 July 2018 at 09:59, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Define a "cortex-m0" ARMv6-M CPU model.
>
> Most of the register reset values set by other CPU models are not
> relevant for the cut-down ARMv6-M architecture.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  target/arm/cpu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 3848ef46aa..7e477c0d23 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1255,6 +1255,15 @@ static void arm11mpcore_initfn(Object *obj)
>      cpu->reset_auxcr = 1;
>  }
>
> +static void cortex_m0_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    set_feature(&cpu->env, ARM_FEATURE_V6);
> +    set_feature(&cpu->env, ARM_FEATURE_M);
> +
> +    cpu->midr = 0x410cc200;
> +}

We have all the patches for turning off not-v6M bits of
behaviour either in master or in target-arm.for-3.1 already,
right?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
