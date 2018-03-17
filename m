Received: by 10.28.91.67 with SMTP id p64csp83725wmb;
        Fri, 16 Mar 2018 17:02:22 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuBM/tBNFvuHgcOHfp9rnGapp10ZsXfRM3U+/YRnlqQzW8gpf2us82FquqFQSbjPHfdiUjR
X-Received: by 10.55.103.15 with SMTP id b15mr5791563qkc.58.1521244942170;
        Fri, 16 Mar 2018 17:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521244942; cv=none;
        d=google.com; s=arc-20160816;
        b=LjuzQGBeaI9hkju7wVqttbOSpc2SUCe+K73+96ZHKv9eGY9mRsrOXIW1cW6eLrtjwV
         lTJr/GWMK1F1j2APyOEdVXoXXN6aNh3quoDl8rLhfR8lIcQqv/s5bSTwptAroEynOUEz
         FfRU1Gr9iinDe52x8UO/RbywkJ7slVG3dA5bNE5P9IybadBcthyUwBtaetw1q3pJVwJn
         K6Ys690yOT/qvWqXCfTTMNyV74iSf3AK1V/IEnCgSp78AZ1PmrZkRgtkxsqXemX8OjzW
         N9/ZKC1Q02eWDsilH2Hvyrn7Xdz6JFrBUIq2URZL2RdoUkjT7wv6yev1ecWcuE18J+BP
         qslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=w4kAFA7SGKeN/oshuBiuHc3DBQ9+5olYWWvSEZ5HTig=;
        b=DCLS22VIYazX4evxeWsCGFKa334hA1XgP69r0sTIwplO09vFrWDfN+eg3uFtX90XNh
         diga27szQMfYQHr77lRxThMQ9VSo3E5twrw1piVa/y663cfQOczfDWdnRmnTQ1+yRQiY
         z/VqvJ5QSodanX0Sl8bHljNj7uNTfVWNsfC4A+i3Cs/95W7a1H5YiZaQBAq85+S3kCz5
         KoWpCZS1WukMuO54+ti3tYEzWNo684NUdUXP17vlg9RmLZKag0UCcKUpivQ3zlqVp6tu
         h2nmdgmeyNnYGmnU6csG8EPyDKEqcKtHJELSU//bBaEZOw40Z2TAR6w1RIl5Y68I0dir
         Ji8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=GbSbfS5N;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Z1hjWrF9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h124si2789373qkd.396.2018.03.16.17.02.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 17:02:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=GbSbfS5N;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Z1hjWrF9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewzIj-0008S1-Om
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 20:02:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1ewzIY-0008Rf-OC
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 20:02:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1ewzIU-0003ZC-K0
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 20:02:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33260)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1ewzIU-0003YI-Ao; Fri, 16 Mar 2018 20:02:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id DEFF0607A2; Sat, 17 Mar 2018 00:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521244924;
	bh=zL/GGnXJVZcjS6ZJcczYL1eHyiuk30CJ052LFLUeJ60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GbSbfS5NR+83Mulou1QfCG//bjjNVpR7IvMIyst+OCg9Ab4FKfuyBMEQPI6XHRPxc
	eKCPyFFXed0J4Sir5cMkheOsZ6eNB8dI4NHzJmL/8z05UohbwXUjfwLxRdhngHpKqm
	Wq9F0UGAQSLK1sT7ltVmFBWj3kvVrAEqfl9rReMc=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 0661E60A50;
	Sat, 17 Mar 2018 00:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521244918;
	bh=zL/GGnXJVZcjS6ZJcczYL1eHyiuk30CJ052LFLUeJ60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1hjWrF90vJtsYfT/VhxDbRwYUsHPApBP+vHhBmBOHDtGvMweVk5C+pib7trUHsA3
	F6sAeyNFRlCh2urzDSZ9eF64H7SadQdwO7cjybJByVfedhXNfQOHz+vgBsKos34f7V
	dw9/fLpYQMmtGYhcBNnPHopq/kEvkQnzOFxUY/oo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0661E60A50
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Fri, 16 Mar 2018 20:01:52 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-devel@nongnu.org
Message-ID: <20180317000151.GA24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<152123390250.78.14000079057958081515@71c20359a636>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152123390250.78.14000079057958081515@71c20359a636>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 00/22] More fully implement
 ARM PMUv3
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
Cc: peter.maydell@linaro.org, famz@redhat.com, digantd@codeaurora.org,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org, mspradli@codeaurora.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZSIIZDK7q04q

My apologies for the below style issues - I've already fixed them up for
v4...

-Aaron

On Mar 16 13:58, no-reply@patchew.org wrote:
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 1521232280-13089-1-git-send-email-alindsay@codeaurora.org
> Subject: [Qemu-devel] [PATCH v3 00/22] More fully implement ARM PMUv3
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> 
> BASE=base
> n=1
> total=$(git log --oneline $BASE.. | wc -l)
> failed=0
> 
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> 
> commits="$(git log --format=%H --reverse $BASE..)"
> for c in $commits; do
>     echo "Checking PATCH $n/$total: $(git log -n 1 --format=%s $c)..."
>     if ! git show $c --format=email | ./scripts/checkpatch.pl --mailback -; then
>         failed=1
>         echo
>     fi
>     n=$((n+1))
> done
> 
> exit $failed
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]               patchew/1521232280-13089-1-git-send-email-alindsay@codeaurora.org -> patchew/1521232280-13089-1-git-send-email-alindsay@codeaurora.org
> Switched to a new branch 'test'
> d81791b184 target/arm: Implement PMSWINC
> 512124d018 target/arm: PMU: Set PMCR.N to 4
> b748e97306 target/arm: PMU: Add instruction and cycle events
> 7e46a77f89 target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
> 82cffef855 target/arm: Add array for supported PMU events, generate PMCEID[01]
> d635021d0a target/arm: Split arm_ccnt_enabled into generic pmu_counter_enabled
> 3e1b438deb target/arm: Implement PMOVSSET
> c13c832988 target/arm: Add ARM_FEATURE_V7VE for v7 Virtualization Extensions
> 9c80af4d82 target/arm: Make PMOVSCLR 64 bits wide
> 8ffbcd3dd8 target/arm: Allow AArch32 access for PMCCFILTR
> 7dc4ec9715 target/arm: Filter cycle counter based on PMCCFILTR_EL0
> f1e40f9fff target/arm: Fix bitmask for PMCCFILTR writes
> eb142b42b4 target/arm: Allow EL change hooks to do IO
> d37186abdd target/arm: Add pre-EL change hooks
> ae12e161da target/arm: Support multiple EL change hooks
> 9bfa99805d target/arm: Fetch GICv3 state directly from CPUARMState
> 881bee5e96 target/arm: Mask PMU register writes based on PMCR_EL0.N
> 890ad6472b target/arm: Reorganize PMCCNTR read, write, sync
> 922eec023b target/arm: Treat PMCCNTR as alias of PMCCNTR_EL0
> 5b1ce33c0b target/arm: Check PMCNTEN for whether PMCCNTR is enabled
> 2ecb09ae04 target/arm: A15 PMCEID0 initialization style nit
> 0f26a1568a target/arm: A53: Initialize PMCEID[01]
> 
> === OUTPUT BEGIN ===
> Checking PATCH 1/22: target/arm: A53: Initialize PMCEID[01]...
> Checking PATCH 2/22: target/arm: A15 PMCEID0 initialization style nit...
> Checking PATCH 3/22: target/arm: Check PMCNTEN for whether PMCCNTR is enabled...
> Checking PATCH 4/22: target/arm: Treat PMCCNTR as alias of PMCCNTR_EL0...
> Checking PATCH 5/22: target/arm: Reorganize PMCCNTR read, write, sync...
> Checking PATCH 6/22: target/arm: Mask PMU register writes based on PMCR_EL0.N...
> Checking PATCH 7/22: target/arm: Fetch GICv3 state directly from CPUARMState...
> Checking PATCH 8/22: target/arm: Support multiple EL change hooks...
> ERROR: space prohibited between function name and open parenthesis '('
> #26: FILE: target/arm/cpu.c:62:
> +    entry = g_malloc0(sizeof (*entry));
> 
> total: 1 errors, 0 warnings, 87 lines checked
> 
> Your patch has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> Checking PATCH 9/22: target/arm: Add pre-EL change hooks...
> ERROR: space prohibited between function name and open parenthesis '('
> #26: FILE: target/arm/cpu.c:62:
> +    entry = g_malloc0(sizeof (*entry));
> 
> total: 1 errors, 0 warnings, 110 lines checked
> 
> Your patch has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> Checking PATCH 10/22: target/arm: Allow EL change hooks to do IO...
> Checking PATCH 11/22: target/arm: Fix bitmask for PMCCFILTR writes...
> Checking PATCH 12/22: target/arm: Filter cycle counter based on PMCCFILTR_EL0...
> Checking PATCH 13/22: target/arm: Allow AArch32 access for PMCCFILTR...
> Checking PATCH 14/22: target/arm: Make PMOVSCLR 64 bits wide...
> Checking PATCH 15/22: target/arm: Add ARM_FEATURE_V7VE for v7 Virtualization Extensions...
> Checking PATCH 16/22: target/arm: Implement PMOVSSET...
> WARNING: line over 80 characters
> #39: FILE: target/arm/helper.c:1417:
> +      .access = PL0_RW, .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
> 
> total: 0 errors, 1 warnings, 59 lines checked
> 
> Your patch has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> Checking PATCH 17/22: target/arm: Split arm_ccnt_enabled into generic pmu_counter_enabled...
> Checking PATCH 18/22: target/arm: Add array for supported PMU events, generate PMCEID[01]...
> Checking PATCH 19/22: target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER...
> Checking PATCH 20/22: target/arm: PMU: Add instruction and cycle events...
> Checking PATCH 21/22: target/arm: PMU: Set PMCR.N to 4...
> Checking PATCH 22/22: target/arm: Implement PMSWINC...
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> ---
> Email generated automatically by Patchew [http://patchew.org/].
> Please send your feedback to patchew-devel@freelists.org

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
