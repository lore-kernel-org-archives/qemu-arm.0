Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1178808wrt;
        Wed, 17 Oct 2018 12:34:59 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61Aa1qcyW8XriRtj3jV1o4ttUx8Q4rMHamc6qp0Owc3FW4t7+0QEev66u7JDwPl1BSBJ/m2
X-Received: by 2002:a37:c603:: with SMTP id b3-v6mr25766765qkj.176.1539804899142;
        Wed, 17 Oct 2018 12:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539804899; cv=none;
        d=google.com; s=arc-20160816;
        b=hu4N3Wa2IEeIjahYQgYByCittklaz4Iv7vvaPb97wxlCCUx7gyK8bsWA3rGIqzUSh5
         Acqitsp1ZuHeFpF0A3umG02aBwVmm9JUORuceyIrBPd6xm3Lz2hr0uy67RiIKKWDotR8
         nEb8pqSAW5T0JKvz5VYy/NuX2aFowDaG3z79VqEVHch0m58AxHxWrdeiOic0WuSDJo/1
         8LEx2wTF9E4/E5wVVGT3xtbq+Rf1XJThVY0Skg86Stw7zGW34Z1rZzLffQntlU0x6Ddc
         qLqllibhRgHAvTuwzeRTfQafUlsmRmaVwvAow7z23dblyDje1HWqVCuqsdMxE0II+SCg
         R5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=uFG5SS8+Ir6RW1iAff2+JRB8mBSoUQEfHveaHezHhDY=;
        b=BYmH6xiKI5KvKecyLA38jqTx2yAxTfJZL2qBhzRWJ3/uqMMosJwroMMlOH6Kxpmu2b
         X30rb8Dwi0LdkUmwrCh+et7qUBobiufeMkHSgrGzyYY1NT7NF0sGW9zEtoxVF3QVDCqv
         gmbU8gWmzi4cXi0t2dORb35S4gJhych1f3hf0PmJxKoRH6ucdlivCeBiWK0W2qhNlmkc
         Laax74RkK7EctjIH9kziKznAGZ/MDSl97Vv4W85G68W8RlL/kKJXI/rOYsuRRHIQDSB3
         IZMV7Z69+4Scs0ncZIuZJCl2kvnVji6aLYw3fbsZ0nHWuR1NRpnOmwGEqVeIsU5kxLN6
         U3Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TceAg5Y+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t63-v6si2413048qkc.113.2018.10.17.12.34.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 12:34:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TceAg5Y+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCras-0004Nq-L7
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 15:34:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCrag-0004Ms-Us
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 15:34:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCrac-0002CI-Sk
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 15:34:46 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45408)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCrac-0002Bj-Gn
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 15:34:42 -0400
Received: by mail-pf1-x444.google.com with SMTP id u12-v6so13656065pfn.12
	for <qemu-arm@nongnu.org>; Wed, 17 Oct 2018 12:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=uFG5SS8+Ir6RW1iAff2+JRB8mBSoUQEfHveaHezHhDY=;
	b=TceAg5Y+iRPEoJvUoPvA+uCQI7vF3lVYwSU5hA7nL+J1sQIo9xvUagmGci8Ed9LIwf
	QmfN9r1F4/NJqOMzDewgpv8QWqvkTrGMdyzRVWhkh5y31U0PdypSV6rOSaI0FsGHr11o
	lqMXAep0iLmvU9kOD4Pk0e7TH657G3OU3oSBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uFG5SS8+Ir6RW1iAff2+JRB8mBSoUQEfHveaHezHhDY=;
	b=cHXvwkGP7Y4C0h/MFk9WH2jIUi9yP1mXlVJZ0854h4OlgtrjLyp3JlOAYhh1agockN
	Iq/fSffU1NQmYLlncfcLdYUPfIpOKDLMP0jPlsaVPdWxt9W73Ays66tadpgPknDuQpEz
	bAwx1yNfmcm/ChJocxroehu5ksL9EzG7K4JaU/aTHnggC5knMggAaA9TZ2/LI6Hv+rrs
	DytQ2LDka3QhDJ3LEuB/BQnjTK4Idv2NIabprnsFO2zO2YQXSAFRN3bFHy0G5qtFNnfT
	uDllPVZF823mVDE+WnCQhH+i4a0bWWQgjMSjrraAAGwmVIiv0ILyxCqHhoB/QW57aRg8
	k/cw==
X-Gm-Message-State: ABuFfohDR1ZmV0H+4kys3wA6dSVNp9DR6xg7xHko7/A3sZH3gSRYX5+P
	9kcPuMfFfQ+jAN2lYazdrsv3Aw==
X-Received: by 2002:a62:11cb:: with SMTP id
	72-v6mr27422736pfr.120.1539804880808; 
	Wed, 17 Oct 2018 12:34:40 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	r23-v6sm20351525pfh.79.2018.10.17.12.34.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 12:34:39 -0700 (PDT)
To: Aaron Lindsay <Aaron@os.amperecomputing.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-13-aclindsa@gmail.com>
	<0fdcad4a-c8b5-3309-d2ce-f9be901ec52a@linaro.org>
	<20181017192013.GA25905@quinoa.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <31f327f4-42ee-55fc-596d-97d935803867@linaro.org>
Date: Wed, 17 Oct 2018 12:34:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181017192013.GA25905@quinoa.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 12/14] target/arm: PMU: Set
 PMCR.N to 4
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
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eiWm4d5hoIwW

On 10/17/18 12:20 PM, Aaron Lindsay wrote:
> On Oct 16 17:09, Richard Henderson wrote:
>> On 10/10/18 1:37 PM, Aaron Lindsay wrote:
>>> This both advertises that we support four counters and enables them
>>> because the pmu_num_counters() reads this value from PMCR.
>>>
>>> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
>>> ---
>>>  target/arm/helper.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> It looks like this should have been folded into patch 10,
>> or patch 10 split to include the code changes that go with
>> these comment changes.
> 
> By setting PMCR.N to 4, this commit is what causes all the previous
> implementation of non-PMCCNTR counters to become usable by the guest -
> both because the OS can now detect their presence in PMCR, and because
> the system registers used to setup/access the counters are gated on
> pmu_num_counters(), which uses PMCR.N to determine if a counter is
> implemented.

But e.g.

> @@ -5412,8 +5412,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>      }
>      if (arm_feature(env, ARM_FEATURE_V7)) {
>          /* v7 performance monitor control register: same implementor
> -         * field as main ID register, and we implement only the cycle
> -         * count register.
> +         * field as main ID register, and we implement four counters in
> +         * addition to the cycle count register.
>           */
>          unsigned int i, pmcrn = 4;
>          ARMCPRegInfo pmcr = {

clearly belongs with the previous patch, since pmcrn is already 4.

> @@ -1706,7 +1706,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .access = PL1_W, .type = ARM_CP_NOP },
>      /* Performance monitors are implementation defined in v7,
>       * but with an ARM recommended set of registers, which we
> -     * follow (although we don't actually implement any counters)
> +     * follow.
>       *
>       * Performance registers fall into three categories:
>       *  (a) always UNDEF in PL0, RW in PL1 (PMINTENSET, PMINTENCLR)

And this is out of date as well, and probably belonged elsewhere.
Which leaves only

> @@ -5430,7 +5430,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              .access = PL0_RW, .accessfn = pmreg_access,
>              .type = ARM_CP_IO,
>              .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
> -            .resetvalue = cpu->midr & 0xff000000,
> +            .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT),
>              .writefn = pmcr_write, .raw_writefn = raw_write,
>          };

which suggests that this one line belonged to the patch that set pmcrn in the
first place.


r~
