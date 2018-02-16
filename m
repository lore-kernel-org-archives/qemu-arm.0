Received: by 10.28.71.27 with SMTP id u27csp706700wma;
        Fri, 16 Feb 2018 05:39:08 -0800 (PST)
X-Google-Smtp-Source: AH8x227SsVG1Pjdxm5pWRQmM787EuI8Af2whqo9kbYxSOvFrhRpP7ZGrehkCfYNOprIAQNe4Moq6
X-Received: by 10.37.31.132 with SMTP id f126mr4677675ybf.498.1518788348595;
        Fri, 16 Feb 2018 05:39:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518788348; cv=none;
        d=google.com; s=arc-20160816;
        b=jcrDrUQ1995Zij7yjYd854dcKv6yDotqL3QI1+QLlhLcTbPaj5beYPSYO+sEAWfd3A
         wHBXYK6uq8I5IwTe7Bh1muQQkM5kShhTrvwDWfftMrbXBRVl7DkkHL9AsRoY//0LA4zy
         sbVxO/4FpXLx3e3X2KUYFpwvy7AubdwlFP9UodJbAmLdRNY6XJb44/851bB4tVduZkuV
         h227BMQokI+PKb7ZxsuKmxCIAOSpYuhPzzRtVhdr9GplFOKj9BOb6iN06eTHBka4GTHL
         JpBO6Y8XC9Lno+WxhDE5+2PRaAG3WXFCjHm1ex0gaQEepDrkvcOx/HjmCN9b/RAsuuBW
         BW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Sl0GruKqi8Nkf2H1oew1Fkt1Q2vTXuMlZfeAj672QJs=;
        b=izzWnxdexetGUWQmhDhr5vG/0lGMMqAKSQQMwynxTqukNC8kebNdzwN7mM9HAu+/hd
         U0FXYyROtgno1IiosU4Gj8gjnFPBr5eN2ifOzVSv4ynHtDjRMUGvejI8tB8sxNsHeaE+
         eWEQQGayupwpt6VZeG/02cbl7zJPQ+XNQ62nM1c7uTJ58/XWumE5SnjBY9VTz3vOnZF2
         IM5LxIPMD7jn9r8q6WiFRqBR9GE4Qs0ojsXdT9QPUSLLbOSWpJR6BVa3n52cQzIM5whx
         kiNY7AU3ZcUIpLacS+FPvuhdDt0ipIz72d0mTXbUSySO9UHuEDvKaIuUGvFWwhJrZ9Dj
         RlWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HGmSJ7bE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6si1208849ywh.707.2018.02.16.05.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Feb 2018 05:39:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HGmSJ7bE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emgEG-0002y0-2G
	for alex.bennee@linaro.org; Fri, 16 Feb 2018 08:39:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emg1L-0000c7-W8
	for qemu-devel@nongnu.org; Fri, 16 Feb 2018 08:25:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emg1H-0003mf-9Y
	for qemu-devel@nongnu.org; Fri, 16 Feb 2018 08:25:47 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:46166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emg1H-0003mK-5U; Fri, 16 Feb 2018 08:25:43 -0500
Received: by mail-qk0-x241.google.com with SMTP id t13so378968qkj.13;
	Fri, 16 Feb 2018 05:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Sl0GruKqi8Nkf2H1oew1Fkt1Q2vTXuMlZfeAj672QJs=;
	b=HGmSJ7bEwyCpDFdcqTDQZlLZpb5rSOZolsFUAHfoL2ns2ewxc872i1WBHiuxaS9Pk/
	L+hocpTjJ3uOjpCnNARA55CqBxOW9cEawYzvcQVkkBAx5MBHUAtWezKeRMygsOx96b33
	6lLDRmNHxJ+bJpa6xZgL5WwIPlrD6RDUX282I8n0RuXD6AiZ3K2PXvqpZSQ9MWwbhq/1
	sjRMhU96ChB2bzizmSzeoSKlSA6Tta5y1mvtv6Sj6I0/tlbOoFe191wonTmfHbjelVkg
	QdCncJOp/qAkZjjPLbR6s0mV8pD+yhbWi+4MLGkVzMAsYFfhVpPXT8fyWNgS3ZGl7ZXv
	5yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Sl0GruKqi8Nkf2H1oew1Fkt1Q2vTXuMlZfeAj672QJs=;
	b=UtEk6XvIPMKRi0jHiiz5/vr+o9RVpMOdPrH98l9pcqLMd4eu42Eysyiw9W8h3+zkzo
	mwvehjMdH8V/bBP7VwdQgD5JjqzSkzI4QNjyuVGHjS+bK5atOyPdW5qMqe70bEPRpjws
	VSlYAPdKkchrusPEg3w7POrnxU+VEEuCYTy7s3aM62Q5y7Vz9xJUChOzBVfdqvIsPWNn
	qvhtb8k/vh4hZ7jZOl91FbiD0RLzBXo4hC14XquZxfgXjjJxR5SVRw6m4t9Y4d+w35eJ
	MCIMWKvJgTHT+qIFlqctmPT1Sq1XA8tWwI2HcdBNa68cN0pGPwbUtj9+GlEE2pVM6lqe
	0kTQ==
X-Gm-Message-State: APf1xPBfGI3EGAML/5u1mhxBkphHdtCso+su+LtzP5SzM4j6kRVCNboe
	cWLsLxFkycrq6bP4GQiVanYih1pC
X-Received: by 10.55.22.144 with SMTP id 16mr9242760qkw.11.1518787542417;
	Fri, 16 Feb 2018 05:25:42 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	i186sm7397378qke.86.2018.02.16.05.25.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Feb 2018 05:25:41 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180215182421.23788-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <118274a7-3fc2-3245-55fb-5ddfde7b4f59@amsat.org>
Date: Fri, 16 Feb 2018 10:25:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180215182421.23788-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] target/arm: Fix register
 definitions for VMIDR and VMPIDR
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fi/DuLvZR9In

On 02/15/2018 03:24 PM, Peter Maydell wrote:
> The register definitions for VMIDR and VMPIDR have separate
> reginfo structs for the AArch32 and AArch64 registers. However
> the 32-bit versions are wrong:
>  * they use offsetof instead of offsetoflow32 to mark where
>    the 32-bit value lives in the uint64_t CPU state field

Maybe we can replace all offsetof() by offsetof64() and forbid the use
of offsetof() in this file, this will make A32 endian/alignment errors
more apparent.

>  * they don't mark themselves as ARM_CP_ALIAS
> 
> In particular this means that if you try to use an Arm guest CPU
> which enables EL2 on a big-endian host it will assert at reset:
>  target/arm/cpu.c:114: cp_reg_check_reset: Assertion `oldvalue == newvalue' failed.
> 
> because the reset of the 32-bit register writes to the top
> half of the uint64_t.
> 
> Correct the errors in the structures.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is necessary for 'make check' to pass on big endian
> systems with the 'raspi3' board enabled, which is the
> first board which has an EL2-enabled-by-default CPU.
> ---
>  target/arm/helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index e7586fcf6c..e27957df38 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5068,8 +5068,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              { .name = "VPIDR", .state = ARM_CP_STATE_AA32,
>                .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
>                .access = PL2_RW, .accessfn = access_el3_aa32ns,
> -              .resetvalue = cpu->midr,
> -              .fieldoffset = offsetof(CPUARMState, cp15.vpidr_el2) },
> +              .resetvalue = cpu->midr, .type = ARM_CP_ALIAS,
> +              .fieldoffset = offsetoflow32(CPUARMState, cp15.vpidr_el2) },
>              { .name = "VPIDR_EL2", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
>                .access = PL2_RW, .resetvalue = cpu->midr,
> @@ -5077,8 +5077,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              { .name = "VMPIDR", .state = ARM_CP_STATE_AA32,
>                .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
>                .access = PL2_RW, .accessfn = access_el3_aa32ns,
> -              .resetvalue = vmpidr_def,
> -              .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
> +              .resetvalue = vmpidr_def, .type = ARM_CP_ALIAS,
> +              .fieldoffset = offsetoflow32(CPUARMState, cp15.vmpidr_el2) },
>              { .name = "VMPIDR_EL2", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
>                .access = PL2_RW,
> 

After enjoying scrolling a 6666p specs,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
