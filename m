Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5748216wru;
        Mon, 23 Jul 2018 07:57:39 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc8YVe74YU5oh84C7y3XDhAkDwZtV7CTFF9kJl+4XV3JpMkr0mi/81eu8/o3HiJw6fuOoeC
X-Received: by 2002:a37:9486:: with SMTP id w128-v6mr11745447qkd.362.1532357859678;
        Mon, 23 Jul 2018 07:57:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532357859; cv=none;
        d=google.com; s=arc-20160816;
        b=BzhsmKzhY9eenf1Mcq2esmuArs1N/Ujqfid/xab13XGKKnF+eijeYXzx4smDlnTsU5
         4OUlalX72jSjaIVx79oTaICeWDOg1EOS0CCjZO8I0Rc2FC54+yUA9E/m9VngttyZ2XjD
         wRyCUnebDQSuh/jrcdjDUckgoF/S7/LDBDTJW6XzBR406BegSLx+RjYPlLzGdt9gcE1J
         pc089TwXZ205MfgPzPKLh8Kmp/8XoJQiCZkDjsSmtaCY+0ox0jvZTcEzx9/5HBl33yOs
         loiQoCjRHQo85nTVeyyrQydW4ZocQie7DCU5O5tmn9bKEqN9GRotZ9T5F9gjCVyFbi4M
         B9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=TDibaV2EgjnjaHJMUw+C6WS3CO7sYR58mCzxeBRqTK0=;
        b=sLiTzDoz0G0NpyHxDGMi74Kg9ggTtqhtSN5vBizOBCYrMyZDCFRW6NmTjyl/naT4hA
         avkX7Uy6X8RBHLjqvQMc8lX4NGsJrNTYg7RrgdF5rB55Yv3Hk1cx0I6p3RgPTTQUQf2f
         628ViJz+8egZxHwLcGgAW4W+zqllNBPOYrETWZ7JUpkb++40trqOyDkBzIDD9PgEOTYv
         6IdOUIhKnQEvdzi2S31rblw8bL1N5Qq/v9mKZuMnTZriQwPffudFPhmvd1gBfgGcUEPb
         jO64QEOqqfVoSYQyIQ9hs/QpN06rof0UmS9Q8O0SivwH3OJR95OQ1X1UUruWgi4zci9x
         up+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19-v6si9568776qtr.222.2018.07.23.07.57.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 07:57:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhcHL-0006Iv-6T
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 10:57:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fhcHB-0006HI-Gq
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 10:57:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fhcH8-0000Uz-HB
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 10:57:29 -0400
Received: from 18.mo1.mail-out.ovh.net ([46.105.35.72]:45672)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fhcH8-0000UQ-9p
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 10:57:26 -0400
Received: from player759.ha.ovh.net (unknown [10.109.143.72])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 90AF811570A
	for <qemu-arm@nongnu.org>; Mon, 23 Jul 2018 16:57:24 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id B6C2A6400B1;
	Mon, 23 Jul 2018 16:57:09 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ce2458db-7b97-1672-48cf-b88c24d93157@kaod.org>
Date: Mon, 23 Jul 2018 16:57:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17064983417194449869
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrjedvgdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.35.72
Subject: Re: [Qemu-arm] [PATCH 0/6] accel/tcg: Support execution from MMIO
 and small MMU regions
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
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aJVWePSRAI2u

On 07/10/2018 06:00 PM, Peter Maydell wrote:
> This series adds support to TCG for executing from MMIO regions
> and small MMU regions. The basic principle is that if get_page_addr_code()
> finds that the region is not backed by a full page of RAM then it
> returns -1, and tb_gen_code() then generates a non-cached TB
> containing a single instruction. Execution from these regions
> thus performs the instruction fetch every time, ensuring that we
> get the read-from-MMIO and check-small-MMU-region permissions
> checks right.
> 
> This means that the code path for "generate bus fault for failing
> to load an instruction" no longer goes through get_page_addr_code(),
> but instead via each target's translate code and its calls to
> the cpu_ld*_code() or similar functions. Patch 1 makes sure we
> can distinguish insn fetches from data loads when generating the
> bus fault exceptions. (Aside: I have assumed that all cpu_ld*_code()
> loads should trigger iside faults rather than dside. Hopefully this
> is true...)
> 
> Patches 2 and 3 make trivial fixes to various callers of
> get_page_addr_code(); patch 4 does the work of generating our
> single-insn TBs. Patch 5 can then remove all the code that
> (mis)handles MMIO regions from get_page_addr_code(). Finally
> patch 6 drops the target/arm workarounds for not having support
> for executing from small MPU regions.
> 
> Note for the Xilinx folks: this patchset makes the mmio-exec
> testcase for running from the SPI flash pass. Cedric: you might
> like to test the aspeed image you had that relies on execution
> from an MMIO region too.

I have added a memory region alias at 0x0 on the memory region where
the first flash device is mapped and all aspeed machines, palmetto, 
romulus, witherspoon booted fine. 

More or less 4MB of data access is generated and the slowdown is hardly 
noticeable, around one second on a laptop.

I wonder if I should add a bool option to the machine to activate
or not the feature ?

Thanks,

C. 

> The diffstat is pretty satisfying for a patchset that adds
> a feature, but it actually undersells it: this code renders the
> hw/misc/mmio_interface.c and the mmio_ptr related code in memory.c
> and the xilinx-spips device all obsolete, so there are another
> couple of hundred lines of code to be deleted there. I opted not
> to include that in this patchset, for ease of review.
> 
> NB: I tested this with icount, but there are potentially
> some weird things that could happen with interactions between
> icount's io-recompile and execution from an MMIO device
> that returns different instructions each time it's read.
> 
> thanks
> -- PMM
> 
> 
> Peter Maydell (6):
>   accel/tcg: Pass read access type through to io_readx()
>   accel/tcg: Handle get_page_addr_code() returning -1 in hashtable
>     lookups
>   accel/tcg: Handle get_page_addr_code() returning -1 in
>     tb_check_watchpoint()
>   accel/tcg: tb_gen_code(): Create single-insn TB for execution from
>     non-RAM
>   accel/tcg: Return -1 for execution from MMIO regions in
>     get_page_addr_code()
>   target/arm: Allow execution from small regions
> 
>  accel/tcg/softmmu_template.h |  11 ++--
>  include/qom/cpu.h            |   6 +++
>  accel/tcg/cpu-exec.c         |   3 ++
>  accel/tcg/cputlb.c           | 100 +++++------------------------------
>  accel/tcg/translate-all.c    |  23 +++++++-
>  memory.c                     |   3 +-
>  target/arm/helper.c          |  23 --------
>  7 files changed, 52 insertions(+), 117 deletions(-)
> 

