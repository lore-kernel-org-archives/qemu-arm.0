Received: by 10.28.4.212 with SMTP id 203csp186841wme;
        Wed, 18 Apr 2018 07:35:32 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZr/NLP3SInVLLayIzcyvRD2nt4La7PNFYpxKLe+6Krm4zeRLFt4NgzAcTMZZFRhki1hQaIx
X-Received: by 2002:ac8:c89:: with SMTP id n9-v6mr2385998qti.362.1524062132635;
        Wed, 18 Apr 2018 07:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524062132; cv=none;
        d=google.com; s=arc-20160816;
        b=jEW7qShIGPJwy/6JoSJ5NECA6qfzXWcM+dbUxmV9EZrYzzAedYiimJ23TF14+2NJFp
         lVGyBOMnZAEmLurtGE/25Q2iu9kMj9GjgXlRI46juCCrkZLUSiF/insd8TvPh8Bg67mQ
         FrADjcDcGvR+sRfd1nYKEp9huOv7wCaFmQZ5UJ4WeCBDB+KVDFtl8L4Dj8XKQRkmr8AG
         ZN4DZGbRZhuYZbw74ZqsUYB9tCI/YvmCOI0s+AZeNRXWq/B2h2hSzyo44aXDF2Ah4Ah3
         5DnNLS6mbdFbOSrA5sZ1JXR2nJLkzgpnYwi0oHIVzW2KNA9JjVewc2NRXRwwMhVxuCQS
         /UVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=mgeX/TLhlo+Ax1gqiyiiyHHSJGIs80wZ76RSk0333qA=;
        b=ehm/nBGXlAEvH7Q9GXeccYbE7+ShZWow0YE5XxUqnpqdWzNn1DCf2HL04EQHe2xEqI
         cxk0o1lpdZDQk9bJYKNyh/OkoPt2T1/6jqY1Mc8islrFchinN2COBR0/3h8gLusO6CHv
         HXoPhMJPkv0lY2O4poLCc09Zj05CCcTuoxd+9Zvx9wsvPyPIYnOKvC9uLinPPUs6SAVo
         6jV3qUMIh0LogNNQSp8s4Buu5hnCGkqPz+nIZTK7udWOKW1j09RUBlcFVpKgtqS/AieH
         UVorn5Hk03trDWN/42ZlxYI4eHBK3Tb8NkSfdtH02Ctrbnky363UZLXHOqqA+alaDFRR
         wvpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=feszSX/6;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=BejVGc10;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s45-v6si698436qts.109.2018.04.18.07.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Apr 2018 07:35:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=feszSX/6;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=BejVGc10;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8oBI-0003GJ-3C
	for alex.bennee@linaro.org; Wed, 18 Apr 2018 10:35:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8o7f-0000Qx-2f
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 10:31:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8o7b-0005QC-70
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 10:31:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34970)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8o7a-0005PX-WD; Wed, 18 Apr 2018 10:31:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 22FAB6076C; Wed, 18 Apr 2018 14:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1524061901;
	bh=JeDsM9PqpkUkjCENheZsxg9AfNnhlZgmN/2+I9s8ftQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=feszSX/66iVszCUdq/Z1ixgcVe130lpSfKGxYST3eTi+pnkqqHvGALxCsHQtckpal
	PEpu1pAkPpqZE/jPFmRs/jF6UeaV1PuT/3GmdO/i76+TEiNlrozMJGo9bukdNf8JdH
	yWvthEGQwe72dxXVJmP7phxUMlzH5MuCoaaxiLME=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id AAC0760246;
	Wed, 18 Apr 2018 14:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1524061900;
	bh=JeDsM9PqpkUkjCENheZsxg9AfNnhlZgmN/2+I9s8ftQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BejVGc10Dn93NqIHQhv176FHIIXiaWggNA/gnhS2m+6hjpHQ0o7I2E3ReU6Dsmv6w
	UMOD6F1syJz7CRE7vxd2tm/yhV5ZnEnMXyWBIEIXEbCb2cR0NJJjQjLNKrIn38tAj3
	XCR9b/97A2qixW2Z0r9WhTexdaqmWIZnbG5scNU0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AAC0760246
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Wed, 18 Apr 2018 10:31:37 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Message-ID: <20180418143137.GR24561@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
	<1523997485-1905-22-git-send-email-alindsay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523997485-1905-22-git-send-email-alindsay@codeaurora.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v4 21/21] target/arm: Send interrupts on PMU
 counter overflow
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /XosPHV3AAGh

On Apr 17 16:38, Aaron Lindsay wrote:
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 046e37c..2efdc63 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -973,6 +986,11 @@ static uint64_t cycles_get_count(CPUARMState *env)
>  }
>  
>  #ifndef CONFIG_USER_ONLY
> +static int64_t cycles_ns_per(uint64_t cycles)
> +{
> +    return ARM_CPU_FREQ / NANOSECONDS_PER_SECOND;
> +}

This should be:
    return (ARM_CPU_FREQ / NANOSECONDS_PER_SECOND) * cycles;

This took me a while to catch because it doesn't actually affect
functional correctness, but means QEMU slows down because the timer
callback is called every ns...

> @@ -1215,13 +1259,24 @@ void pmccntr_op_start(CPUARMState *env)
>  void pmccntr_op_finish(CPUARMState *env)
>  {
>      if (pmu_counter_enabled(env, 31)) {
> -        uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
> +#ifndef CONFIG_USER_ONLY
> +        uint64_t delta = ((env->cp15.c9_pmcr & PMCRLC) ?
> +                UINT64_MAX : UINT32_MAX) - (uint32_t)env->cp15.c15_ccnt + 1;

I also shouldn't be casting to a uint32_t if PMCR.LC is set. I've fixed
these locally for the next round.

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
