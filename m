Received: by 10.28.71.155 with SMTP id m27csp2088173wmi;
        Thu, 12 Apr 2018 09:11:16 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49VO/+aicPh+mU1Ac4QEWBiB2wOU1WbKxCggOBMZpxnjF3+Nc8viYdP9AIo56+SpLHvKlHp
X-Received: by 10.237.50.227 with SMTP id z90mr419763qtd.14.1523549476156;
        Thu, 12 Apr 2018 09:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523549476; cv=none;
        d=google.com; s=arc-20160816;
        b=K2d64f5DEqIfSdFkscN1Ts5hA/8iR7chaGDWhHl5m73rRad71JEzvZMBuNJDtxExso
         wJHwFcrPzlQx/z8OImrJRxj5hrtT+RD2wdzI/0jAdqW1aQCrETRvWT3+uT5M/N9HcmQV
         7t4KGtFsnDaobgwzQFnVQQK/qB9+Lp3vFTjpq/gUrGKmyJESL/2k6X7xuzUsDxtIf8mi
         CszXZIO94KO/c4W7dSRMVpcXAV9V3Tvj1zRQbe5H4hoNYj/rBgCFwFdo5WUZez4UAh8p
         SP4hrAdEO3Ny/cAbn4/Vp+W1KDLfiDId6hYYZ54Qbb2lBgy0BK8RQkrbTPQzNVdlqVlx
         Dtxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YfPvOvqg1pebA3IH2cisiMpploPYY1qkROQsX3bwXwk=;
        b=LEI8dbVgEvYatpdAIdadobDNHGmqSzqz0UhBSzNtyCTw50852L5xd/4eyi826KYUtU
         Spzg6vJstTaMc0IlINUTvzGMSDiQAD8qYRanU8otx17/USNnUiJ8JrK8QaeUeZMm5S0e
         Inu8hUcK4fG/D4O7CGEYflfZ6bPlcImbm6e//h+6P0omy+kWR7Aouen6uI3PtPlV/Op6
         0cD4SCTHkQDuA1f2UXsQovhrqgP68aedqHLramHerwY4wbO3IRjM/KXJigHYYalZSpcE
         QuQ3kZjFspbKbEOZj4X7yM4fqewu3QYDvxeYyXv8wZzBAOUqK0Ac5LpkOPYqgspUZ3rV
         qssQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KQi5hSCt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m21si1778460qkm.275.2018.04.12.09.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:11:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KQi5hSCt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6eod-00029H-KP
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:11:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6eoV-00028d-Ha
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:11:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6eoU-0004hE-J8
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:11:07 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34261)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6eoU-0004h1-DT
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:11:06 -0400
Received: by mail-oi0-x244.google.com with SMTP id u141-v6so5694189oif.1
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YfPvOvqg1pebA3IH2cisiMpploPYY1qkROQsX3bwXwk=;
	b=KQi5hSCtr4+e8EvZkExt8PZtaGfhqYyyDCyIcr4v0H241VkfUpBEyGJRxhPuNgjXsY
	A8RABcv2noH2AJ9XVVAS+Ex2NFmcbsSQA+nOWFWRNm4G7EW+VKaniWDdzgfrMeRA4aHJ
	OD99vbr5R7gDtbJuZsaaor1llP3eAuNbKVIm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YfPvOvqg1pebA3IH2cisiMpploPYY1qkROQsX3bwXwk=;
	b=cDxfMNBqG91FbraEKz+SFH2hn4/De39gkIG23eK3z9fmLu740ErHZMw0RCKWVOKmqb
	efDzSYnDUx7TBwhdnHYsokWICCWdqyw9xFJXDasVLhk9yLmb6Z1HJFCEUJZnNwK4OOkq
	AGSTU3O1WklavFSUcdVdBaAwwtBWjdcQp2vps0eR0vk8XXojrxn/SMtpaUMTqu2Dkxut
	QeUG1szwqyBAdh0X4CTdEFYms9EasQ8adB3jYAnPn87a1KmatGY+xVBB4hwoKWmG+d7Q
	ToOGfxjzijZBmJI9Yz2GTKVIDINBxmY6gFBG0mdP2gm1Uhi9A9Qi/Y2fiRl0qZ6HrR3y
	4qfA==
X-Gm-Message-State: ALQs6tBLnes+/q+Yi6h7DO6RVXnZ9oEXXBWURvv1iSOekKRUiS8Dxr1s
	l6m7EMxbkaIhTYHbLpiDZuCCYTQoF8VyobtyG5jEpg==
X-Received: by 2002:aca:d455:: with SMTP id
	l82-v6mr6459952oig.102.1523549465790; 
	Thu, 12 Apr 2018 09:11:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 09:10:45
	-0700 (PDT)
In-Reply-To: <1521232280-13089-5-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-5-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 17:10:45 +0100
Message-ID: <CAFEAcA8vjBaExLH_EfbWZ3nwxksL1eY67V4gkWTmu3431Az_Hg@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3 04/22] target/arm: Treat PMCCNTR as alias
 of PMCCNTR_EL0
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
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rddxYdtIju0B

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> They share the same underlying state
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5e48982..5634561 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1318,7 +1318,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmselr),
>        .writefn = pmselr_write, .raw_writefn = raw_write, },
>      { .name = "PMCCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 0,
> -      .access = PL0_RW, .resetvalue = 0, .type = ARM_CP_IO,
> +      .access = PL0_RW, .resetvalue = 0, .type = ARM_CP_ALIAS | ARM_CP_IO,
>        .readfn = pmccntr_read, .writefn = pmccntr_write32,
>        .accessfn = pmreg_access_ccntr },
>      { .name = "PMCCNTR_EL0", .state = ARM_CP_STATE_AA64,
> --

Does this fix an observed bug (presumably migration related),
or is it just something you saw in code inspection ?
Worth noting in the commit message if the former.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
