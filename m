Received: by 10.80.166.35 with SMTP id d32csp116247edc;
        Tue, 11 Oct 2016 10:38:57 -0700 (PDT)
X-Received: by 10.55.167.66 with SMTP id q63mr4212908qke.61.1476207530529;
        Tue, 11 Oct 2016 10:38:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z14si1950842qtb.103.2016.10.11.10.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 10:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu10n-0001b5-2E
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 13:38:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bu10e-0001Yw-Rq
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:38:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bu10d-0005mZ-LE
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:38:36 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bu10d-0005mF-Eq
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 13:38:35 -0400
Received: by mail-vk0-x236.google.com with SMTP id 2so27213896vkb.3
	for <qemu-arm@nongnu.org>; Tue, 11 Oct 2016 10:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8YQuMj732oLCk4BhPTfDOkux2GTJ3hVfFX+kGSJTdN0=;
	b=Z11XYPnLDXlpkaXGnjwl7pPJOSITyWojFXpaVWfvj+7vBCHWagWoIEdLU209yoYIHC
	U0QYjwN42PIbxK+X9Yn5wkHLkc/+KYlj34jmEeFMWTX/ZA3TWmeQ+oTm0jh8GadJL1tr
	bmC+UlvnbSmu8daq4OyX95P3NYqLFG6CzlfxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8YQuMj732oLCk4BhPTfDOkux2GTJ3hVfFX+kGSJTdN0=;
	b=Vv/DX7Tpr0/DZyCTgh7WgI0a/hRF5W/fH34xyZ9wfIUlf2CRZ06jkJNGp9gFmtvXcB
	CxGbbBe40RbNAK+iwnzMVRKe6DdyzM0ZZgqgDIWsC4p9vG3/wWaoOqtbNDytMb8fqHFX
	6T2wBdbMtyuz05r2ggZ/CdKSTlBty98wE7STpyLyyJZdAGgqyfQ7hm4/uUfduI7z01WD
	2Pqwd/msGTk8D5EXVYoOMcEYNY+dKjOrqMvOo2F9J1Jg3q66z4DJn12zMvRR3T7cc2sR
	MvGQ/oMXc1/M2933ujZVWdQnsvmRMmiY562ZFFD/5do0uKR/2vUM6fgieTcStHVZ589h
	6PRQ==
X-Gm-Message-State: AA6/9Rml2Z1qB7NjoHU/ObnYSg0jQlYWwriunxJUDm9T+Ge9nf609vDcbsreudNyxBXpncwXU1rOO5mTs/TQfzoW
X-Received: by 10.31.165.74 with SMTP id o71mr4167032vke.95.1476207514938;
	Tue, 11 Oct 2016 10:38:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 11 Oct 2016 10:38:14 -0700 (PDT)
In-Reply-To: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
References: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Oct 2016 18:38:14 +0100
Message-ID: <CAFEAcA8Y1BcZqS=FQBi+UOv_6TpuVQGpK-XjRYuDk+hV0zZRxg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [PATCH v3 0/7] Runtime pagesize computation
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
Cc: Patch Tracking <patches@linaro.org>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uZeFkUfkPtkw

Oops, I messed up Paolo's email address sending this.
Sorry about that...

thanks
-- PMM

On 11 October 2016 at 18:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> (I posted version 2 way back in June...)
>
> The basic idea here is that:
>  * the target CPU implementation has to opt into variable page size
>    by defining TARGET_PAGE_BITS_VARY, and then calling
>    set_preferred_target_page_bits() in its realize function
>    with whatever the CPU as instantiated actually requires
>  * the machine also has to opt in, by specifying a new MachineClass
>    field which states the value they guarantee will be no greater
>    than the preferred page size for any CPU they create
>  * we finalize the decision about page size in cpu_exec_init_all()
>    (and then later attempts to create CPUs which can't cope with
>    that decision are failed)
>
> I would ideally have liked to finalize things much later, but
> this is in practice hugely difficult because so many things
> (in particular all the address space/memory system code)
> assume the target page size is known.
>
> Note that setting minimum_page-bits for a machine is a migration
> compatibility break (the RAM migration format assumes both sides
> have the same idea of a page size). In v3 I have included a
> patch which adds the target-page-bits to the migration stream
> so that you get a reasonably nice error message if you try
> to migrate between source and destination which disagree about
> the page size.
>
> This could in theory be extended to the user-mode binaries,
> but for the moment I have just required them to define a
> fixed TARGET_PAGE_BITS.
>
>
> Patches 1-3 have been reviewed, so 4-7 are the interesting
> ones.
>
> REQUEST FOR TESTING/PERFORMANCE BENCHMARKING:
>
> I have only very lightly tested these and haven't attempted
> to measure performance at all. Further testing and
> benchmarking reports are therefore welcome.
>
> In particular I would like to know how much of an
> effect on TCG performance the assert() in the definition
> of TARGET_PAGE_BITS has, so comparisons of all three configs:
>  * before this patchset (ie TARGET_PAGE_BITS compile time const)
>  * with this patchset (with assert in TARGET_PAGE_BITS)
>  * this patchset, but with the assert commented out
>
>
> Changes v2->v3:
>  * rebased
>  * added new patch to migrate the page size if it's not the default
>  * virt-2.7 and earlier machines stick with the old
>    default page size to avoid a compat break
>  * in patch 3, v_l1_size is pulled into a local when we're
>    using it as a loop upper bound
>
> thanks
> -- PMM
>
>
> Peter Maydell (4):
>   cpu: Support a target CPU having a variable page size
>   migration/savevm.c: migrate non-default page size
>   target-arm: Make page size a runtime setting
>   hw/arm/virt: Set minimum_page_bits to 12
>
> Vijaya Kumar K (3):
>   migration: Remove static allocation of xzblre cache buffer
>   exec.c: Remove static allocation of sub_section of sub_page
>   translate-all.c: Compute L1 page table properties at runtime
>
>  exec.c                 | 47 ++++++++++++++++++++++++++++++---
>  hw/arm/virt.c          |  4 +++
>  include/exec/cpu-all.h |  9 +++++++
>  include/hw/boards.h    |  7 +++++
>  include/qemu-common.h  | 12 +++++++++
>  migration/ram.c        |  4 ++-
>  migration/savevm.c     | 49 ++++++++++++++++++++++++++++++++++
>  target-arm/cpu.c       | 24 +++++++++++++++++
>  target-arm/cpu.h       |  9 ++++---
>  translate-all.c        | 71 ++++++++++++++++++++++++++++++++------------------
>  vl.c                   | 10 +++++++
>  11 files changed, 213 insertions(+), 33 deletions(-)
