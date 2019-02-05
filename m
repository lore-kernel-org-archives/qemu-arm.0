Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4793992wrt;
        Tue, 5 Feb 2019 05:57:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iabs3ygc21ebX6G8xqFD/MA/Naw6mY16m7siKLbvmwvMOfqXj8qtJ2AePTYxV5+6aDIPxYO
X-Received: by 2002:a25:60c4:: with SMTP id u187mr3858564ybb.420.1549375025356;
        Tue, 05 Feb 2019 05:57:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549375025; cv=none;
        d=google.com; s=arc-20160816;
        b=nUb1+4wuY1ElpetWMmbJKTZgtnqRRnApmEnYw1VW+6KrK0V+SyC427X87vkGJ2GhPS
         lVrQyDNDfVqgJbeXf9COLR7mS4uVDINPZ8H7ditTniXIQXai5xre3bXqxBq3QQZ70IBZ
         6ohHtosyUmD8IaT0oV74DBTr0t8s+k5AF9uU611vSf/Ffh3T//g0TdlpzxTrUqNfO8Le
         JOCAXn4fyxNQLFlhu5PwCJ8iLr+Dt0kzR46ZezMhBXBGhaZneD5AK/tnXYzt8u00XTmq
         8S5tzMWrCB/8PAYEP2TawsPvt5BTeMWY1NOC6N7HWxZUoj9A5z5e8wycxLvO8vP6j3nL
         vrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tQRO0O1vQsqmi5m5JpZiaOigQ36uiZpclmJTSocRb+I=;
        b=fg7fHka9ed9OQjvyKT45BS25QNKOgxOfYphV2zVbLJKECdL20UZy2Tpc4XzsAr501w
         YMEVi79H16H8Ks6ovYqyImKrz0DAxwlfJncfe67uXGvDppGz2VNx/ghEmFVv/9bzQ3Ng
         4qsy+ShgWXAH+MzPQL7avSgcrwN+KAMYkUWYUk34aATKVyE4g1vD8VS1DCmdIXprB2F6
         cwzo4Jv6IG678oU+o6XW9I8WXZMeRUN4RMrJbjOZujThGZXCbKoxDOJSGJbW6KTvNuS3
         sfk0qtOeJV4joZ6hs1YfDLWymRIDWUpsB+GpispT8bSZXBHiot7kei+blirLlKnZVCb4
         Qv4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H+5a99AO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si1850457ybl.108.2019.02.05.05.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 05:57:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H+5a99AO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:60735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr1Dk-0007vN-Se
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 08:57:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1gr1Da-0007ub-MW
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:56:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1gr1DZ-000093-LH
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:56:54 -0500
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143]:54488)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1gr1DZ-00008n-EY; Tue, 05 Feb 2019 08:56:53 -0500
Received: by mail-it1-x143.google.com with SMTP id i145so8497908ita.4;
	Tue, 05 Feb 2019 05:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tQRO0O1vQsqmi5m5JpZiaOigQ36uiZpclmJTSocRb+I=;
	b=H+5a99AOOpNm7ALhvfapFTifzO4XgBV2xDOY3QlOAXf6rZPQmvLpLTkAg4pLoQt2UN
	Ga0HqcF/Z4g+WYDcB/vN1EnD9AI3MVswEc3hg4okIXzYD8DrEFawTJX2gdcbaKH3DPCV
	XamsscMPHPi2/oaxiMq9G3OKqLVz2rrQkBPAbJEmVMhWx5BpNXU7qVzodKMYS+45q4mE
	qbaVn4eC8rb/8/2JgHVB43cZi8H/6RQ66Usoaz4RSFjjj1MtJyWhSsMa72VP2npJU4dQ
	bCiIC+Z6aG5lBY3YvXKmKN94l3iFxqVAsL9xYGaAMWLgRRJAZXtn6D1yFpyWKMUmhMnP
	5rTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tQRO0O1vQsqmi5m5JpZiaOigQ36uiZpclmJTSocRb+I=;
	b=umqohI7prikzRDoZ6kHPYHrxjDJpQp7IWbrWBSdtPE4OYfvkX0fn+mTg/Qh7In3q0n
	HHoIzDDdvo5VSbC/HmjRhiaGzZOqrbxRV763veYtlCEnvA8IJi3Hfhr15ibQiCRfWLFE
	r8aqDtIxIV8ksnsRBFrDFl/2A/Iog7H0/YIsIx0YrMDHXJKAfXNnNCU2I/ei2IsU0grP
	tdft+FHud7sLo8Qj+2IUq+qccTKeMwPvBW2DGzkeN+v7qRY7/S3rYMA0QvugJLbSxDXZ
	K2fslMrqUL+VxMNmQafjpcMSvZwH8uGJKyvPV8N3dexncuztf3snaF06tVk06393uT8R
	ldIA==
X-Gm-Message-State: AHQUAubjo4dcUXHL6eORfvwj7MHu6Vv8RhhncY1keQSVlZ652d7snqmF
	kYOzdVaK0oe+qMEP01NHxck4hGhr7vjnAf7a0jA=
X-Received: by 2002:a6b:7301:: with SMTP id e1mr2874974ioh.45.1549375012163;
	Tue, 05 Feb 2019 05:56:52 -0800 (PST)
MIME-Version: 1.0
References: <20190205135129.19338-1-aaron@os.amperecomputing.com>
In-Reply-To: <20190205135129.19338-1-aaron@os.amperecomputing.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 5 Feb 2019 14:56:41 +0100
Message-ID: <CABoDooMLoo7X=L7X642TKNZFKnrY9S1xtHDSKGthR3mfVuyiAg@mail.gmail.com>
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::143
Subject: Re: [Qemu-arm] [PATCH] target/arm: Fix CRn to be 14 for
 PMEVTYPER/PMEVCNTR
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
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5rTUajBm3fUV

On Tue, Feb 5, 2019 at 2:51 PM Aaron Lindsay OS
<aaron@os.amperecomputing.com> wrote:
>
> This bug was introduced in:
>     commit 5ecdd3e47cadae83a62dc92b472f1fe163b56f59
>     target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d070879894..ec2d17093c 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5855,25 +5855,25 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              char *pmevtyper_name = g_strdup_printf("PMEVTYPER%d", i);
>              char *pmevtyper_el0_name = g_strdup_printf("PMEVTYPER%d_EL0", i);
>              ARMCPRegInfo pmev_regs[] = {
> -                { .name = pmevcntr_name, .cp = 15, .crn = 15,
> +                { .name = pmevcntr_name, .cp = 15, .crn = 14,
>                    .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
>                    .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
>                    .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
>                    .accessfn = pmreg_access },
>                  { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
> -                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 8 | (3 & (i >> 3)),
> +                  .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 8 | (3 & (i >> 3)),
>                    .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
>                    .type = ARM_CP_IO,
>                    .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
>                    .raw_readfn = pmevcntr_rawread,
>                    .raw_writefn = pmevcntr_rawwrite },
> -                { .name = pmevtyper_name, .cp = 15, .crn = 15,
> +                { .name = pmevtyper_name, .cp = 15, .crn = 14,
>                    .crm = 12 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
>                    .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
>                    .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
>                    .accessfn = pmreg_access },
>                  { .name = pmevtyper_el0_name, .state = ARM_CP_STATE_AA64,
> -                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 12 | (3 & (i >> 3)),
> +                  .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 12 | (3 & (i >> 3)),
>                    .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
>                    .type = ARM_CP_IO,
>                    .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
> --
> 2.20.1
>
