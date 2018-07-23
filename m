Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5765241wru;
        Mon, 23 Jul 2018 08:12:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe19F/KRk6F4XGtHUO3Q7trlYZVYggczMfRXRypgMp8JbxT0l6dW+fyBJmHUi6IT6Pa6sbo
X-Received: by 2002:ac8:3872:: with SMTP id r47-v6mr12409244qtb.69.1532358725038;
        Mon, 23 Jul 2018 08:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532358725; cv=none;
        d=google.com; s=arc-20160816;
        b=tQdTNp7WcGHWVRKs+/mkKdVDeWwuS1GY47BoenwkyN5Z0hemRDPvZWk7DGOdX29SMn
         aE8B2HNqIjwkdPfcOrLzCDEGSG8ekgiYemgcURiSUvMeyFPrdObYQYol3b+mDc0CnSDe
         OhoNKiQyf53IhCePJ6SuooVaYIQdz45guiKchYIcdt6n78u1MkOH0quRKNktDLrX+ptk
         92UYPi0qIGysHVBCoqB45haZlPVSJfn3zoWO2ZiogFsZGBhK5+3RBxMgTNAoy6ctwZgV
         s1xTSgA9PFtvro2mimDoJXxly40YeN87dqfWfOtFZ3iDPmF+NHaUT13waW6E2Cd9l1if
         H/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=yhJpo4cYI1Wn4TmS0THRTT9tp1YB5Qkplg5TWhL5Y/Q=;
        b=u+rrxOdf7yh/IHxY35Z42cL9LzCFTqwpYavkMRmj/SkQwoZq8VcE0tyY9kmW/k5wDO
         LULlhxzir5kBp5naTLhADVqrQAb7xlkun60GBfqyU+c9l/2u7OalIMDUllydBOCVkMBh
         9seuC4F99U5Mpkn+ys71nFSf7J4OBLoEia+lbg3lQr/jr5gumiShBAKjJUh1xHTKp4Y3
         5ea1NIN1UZcBaIuwotQcnpefXXXnUdnxCGhOJhcMrFH5xm3fdCLkO5xjW6fQFl2VfmyR
         +v53lSstB6n4aNW5M/r+dvPi5Aqu8RwAaBquXm/VA9x0uSgTYKI4w9xP0JO1OF8fhL5O
         VdXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x16-v6si513721qtp.76.2018.07.23.08.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 08:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhcVI-000487-HW
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 11:12:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fhcV3-00045q-HF
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 11:11:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fhcV0-0000fp-A5
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 11:11:49 -0400
Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]:45680)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fhcV0-0000em-3h
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 11:11:46 -0400
Received: from player697.ha.ovh.net (unknown [10.109.143.72])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 48BEF135BBC
	for <qemu-arm@nongnu.org>; Mon, 23 Jul 2018 17:11:44 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player697.ha.ovh.net (Postfix) with ESMTPSA id AC95D4800CE;
	Mon, 23 Jul 2018 17:11:31 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1efa0007-efeb-3ead-28ad-09479084d0ba@kaod.org>
Date: Mon, 23 Jul 2018 17:11:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17307051893800995789
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrjedvgdekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.52.147
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
X-TUID: H2KYwN/wwLXF

On 07/10/2018 06:00 PM, Peter Maydell wrote:
> This series adds support to TCG for executing from MMIO regions
> and small MMU regions. The basic principle is that if get_page_addr_cod=
e()
> finds that the region is not backed by a full page of RAM then it
> returns -1, and tb_gen_code() then generates a non-cached TB
> containing a single instruction. Execution from these regions
> thus performs the instruction fetch every time, ensuring that we
> get the read-from-MMIO and check-small-MMU-region permissions
> checks right.
>=20
> This means that the code path for "generate bus fault for failing
> to load an instruction" no longer goes through get_page_addr_code(),
> but instead via each target's translate code and its calls to
> the cpu_ld*_code() or similar functions. Patch 1 makes sure we
> can distinguish insn fetches from data loads when generating the
> bus fault exceptions. (Aside: I have assumed that all cpu_ld*_code()
> loads should trigger iside faults rather than dside. Hopefully this
> is true...)
>=20
> Patches 2 and 3 make trivial fixes to various callers of
> get_page_addr_code(); patch 4 does the work of generating our
> single-insn TBs. Patch 5 can then remove all the code that
> (mis)handles MMIO regions from get_page_addr_code(). Finally
> patch 6 drops the target/arm workarounds for not having support
> for executing from small MPU regions.
>=20
> Note for the Xilinx folks: this patchset makes the mmio-exec
> testcase for running from the SPI flash pass. Cedric: you might
> like to test the aspeed image you had that relies on execution
> from an MMIO region too.


For the series,

Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

>=20
> The diffstat is pretty satisfying for a patchset that adds
> a feature, but it actually undersells it: this code renders the
> hw/misc/mmio_interface.c and the mmio_ptr related code in memory.c
> and the xilinx-spips device all obsolete, so there are another
> couple of hundred lines of code to be deleted there. I opted not
> to include that in this patchset, for ease of review.
>=20
> NB: I tested this with icount, but there are potentially
> some weird things that could happen with interactions between
> icount's io-recompile and execution from an MMIO device
> that returns different instructions each time it's read.
>=20
> thanks
> -- PMM
>=20
>=20
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
>=20
>  accel/tcg/softmmu_template.h |  11 ++--
>  include/qom/cpu.h            |   6 +++
>  accel/tcg/cpu-exec.c         |   3 ++
>  accel/tcg/cputlb.c           | 100 +++++------------------------------
>  accel/tcg/translate-all.c    |  23 +++++++-
>  memory.c                     |   3 +-
>  target/arm/helper.c          |  23 --------
>  7 files changed, 52 insertions(+), 117 deletions(-)
>=20

