Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1447946wru;
        Mon, 16 Jul 2018 05:30:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfQnWnNe2/fMb0wDpocPq1lwlezDdIDDqgZupQM6Bs2aTEoUvF7O/nKC+tnvWCq0Gma0joU
X-Received: by 2002:a37:4c85:: with SMTP id z127-v6mr14333902qka.302.1531744254495;
        Mon, 16 Jul 2018 05:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531744254; cv=none;
        d=google.com; s=arc-20160816;
        b=aqW+i6svuNMHJSqU8F6kAEukRhhhciuMO3yXuYD3ygMFZEs4QkiaWFZ7AjzGtvRHff
         T0uwU0+8azxP8GzB029nW0MW0LtN4GZY68tVq9nlafgVfCdTe6mAZlGUIxw683LgqwfX
         IbpDKXAOnGq05hrhlrAFjfwnp1sy9JmHT4HCFLIQ7EyPwIGkW3Ntc2YyF4YvnjojcDP+
         WaRJr+/HDMSQ8G/ql+JCUZO+r0GDVAno9FrU/H4lDvz4b9yaHtNb8diKjYJZOrc6sylg
         VnDSHuCg/3qfEyNhhRU1qnDNsraypGN8dWa6Zn/AzGStppW6NjcxLdFNroTVeIuJBbM6
         iryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=EQ2XACR0HAyTzOKpJlC8idCI+28Ys+/kzI37CBE6el8=;
        b=LAbiXYBVJ+9wPZMxAzvIk5kIui8izz7qwMypSzcOxY10M9OsBPVz5NX8KA+CMEA8kP
         fBQ0sO9xsuigPhphq4ZksV1J63FUXZMpjkiuAlB1n2nmD03bBnIGnzoEU+AXT8cTfgZ8
         WyaTL8gIkUAfTUc11+9q1hyR8bPH2uW61q0YOTfSfOmAbZ9oVBPcIBTkosWdisWdpVBQ
         uGhcU/Z7J81tYzBttr2HolKOEDx4/MsE1K64UYMTAD88uzxObLgXGpIpOflnrDGkv5C8
         0JluZT1CqcRrNVpG1uUlvXo3T3uF/zAa3yz8sJjrFcINoYhOOCRYAq6ShAmS9loQyav3
         8N7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p1-v6si4116646qvn.128.2018.07.16.05.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 05:30:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff2eU-0000T3-1D
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 08:30:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1ff2eK-0000Sw-Ee
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1ff2eE-000466-9G
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 08:30:44 -0400
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:57068
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1ff2eD-00045Q-RQ; Mon, 16 Jul 2018 08:30:38 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id C2701818D7;
	Mon, 16 Jul 2018 14:30:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWtm2E0WqYDC; Mon, 16 Jul 2018 14:30:35 +0200 (CEST)
Received: from localhost.localdomain (unknown [46.218.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id ACAFB81850;
	Mon, 16 Jul 2018 14:30:34 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <e9073530-a6ef-0e93-dcef-f3c3e91df01f@adacore.com>
Date: Mon, 16 Jul 2018 14:30:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
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
Cc: patches@linaro.org, "Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UkLwoNIIAO+W

Hi Peter,

Nice! Thanks for that.

A little question though.. What will happen in the case where the
CPU start executing code at random place because of eg: a badly
configured kernel?

Seeing the patch 5 I guess it will really execute stuff.. So
maybe this is less user-friendly?

Cheers,
Fred

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
> 
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
>    accel/tcg: Pass read access type through to io_readx()
>    accel/tcg: Handle get_page_addr_code() returning -1 in hashtable
>      lookups
>    accel/tcg: Handle get_page_addr_code() returning -1 in
>      tb_check_watchpoint()
>    accel/tcg: tb_gen_code(): Create single-insn TB for execution from
>      non-RAM
>    accel/tcg: Return -1 for execution from MMIO regions in
>      get_page_addr_code()
>    target/arm: Allow execution from small regions
> 
>   accel/tcg/softmmu_template.h |  11 ++--
>   include/qom/cpu.h            |   6 +++
>   accel/tcg/cpu-exec.c         |   3 ++
>   accel/tcg/cputlb.c           | 100 +++++------------------------------
>   accel/tcg/translate-all.c    |  23 +++++++-
>   memory.c                     |   3 +-
>   target/arm/helper.c          |  23 --------
>   7 files changed, 52 insertions(+), 117 deletions(-)
> 
