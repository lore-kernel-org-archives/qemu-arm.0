Received: by 10.223.150.237 with SMTP id u100csp3218906wrb;
        Mon, 6 Nov 2017 16:44:22 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Q6NOPagfg0YVMuDDAesOEcspjFtaOK8myGlG/ntB/JyCqO6jEkuYNgvg1sKhuy6uyqfTkO
X-Received: by 10.129.75.7 with SMTP id y7mr10857288ywa.130.1510015462456;
        Mon, 06 Nov 2017 16:44:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510015462; cv=none;
        d=google.com; s=arc-20160816;
        b=egrNMp8QkD3PQvBXLbrrh5dst1pbmXKmV6woPmXFkdp+zcYz0qnldbtt4TRQWZ/LWJ
         HXj8i+2O1NcMV3UEO0QfgXdpyc/IKXFJAnFLECWYgDrpmjUDOM6yoqxIs3d/Yj7MFokI
         oNKlByE1d48pMaGkuHIwcKfMV2jKgD0RLqjK32Tvn0A6IFRuPEe5O6QgWP6fzeLA6GD0
         POi+/InG7WzRUMnXZbti9gdsa1qXrxY6pYPFWR2oWFALAGsYGD+nxuQfgQ2ErN0wqDjF
         pGoFVKcaDQc/411jlYMK4HRlWodNOlBIuRx0cf2OISNg5hKpbDPANNezwCqXn7x1eo0C
         d+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=L2q4EBKmEnmEEWPV/iyel3hO4I22jRtVEt3MLNsIQNY=;
        b=g0fuv6D+urjDcNluNdBb9mVnPg3FAb4xRv675V4qCbG+esGlK0hB2Npwer9v8ewphi
         SWFdcSU9CoLIOfpAMCWa2JEYd9n/XOemVHASHY2WI3xxDBHnfQIyoxoR3XYB/dcpPCc9
         mnpTa61zpYOnITvw9F2BB/pvAJfpRx8zqeY++RZHH+q7S4rHxaPJkNqUAfJz785AuI5P
         1QSs1QBLsdu/lxCXi841P82zuvUx4K+4zVVWbox4Gjnnn/KektJHlKpTEwwC3HK345Nw
         1/AC/bKkZil6Y4NzQvYw03CYOhUWUkjXL+HYcWyD6Gwf5UvDJ8vEzEEB2UmPMCPIoV1C
         em2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Az7RgLF1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si1805ybi.175.2017.11.06.16.44.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 16:44:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Az7RgLF1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBs05-0001Ny-UJ
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 19:44:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eBrzt-0001MF-Hq
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 19:44:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eBrzs-0001Qr-K6
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 19:44:09 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:54335)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eBrzp-0001P9-Uo; Mon, 06 Nov 2017 19:44:06 -0500
Received: by mail-wm0-x242.google.com with SMTP id r68so498191wmr.3;
	Mon, 06 Nov 2017 16:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=L2q4EBKmEnmEEWPV/iyel3hO4I22jRtVEt3MLNsIQNY=;
	b=Az7RgLF1TKCGDrhmsIdBrHAEz55VMFJZmAYPvEPOOS2lp+q48/EtQPtZDYjwn/BK01
	MSq9JkvJ2PylPzKCk7jBQlZ5qw58tTTYN6dECeCOekXK9ApEZVFrhWis03nMTqZysbfS
	N71IhhUqamiSAcgenVoMvLqfIpJvPCCAUBkV45ZAyYSEKGDBneH6AfUwupRvFaf2/bb0
	q/CSI2ftc20EfbghTlP4ZcT2xn1AH5xwR468VPwyYOnAu87fJ/GDvB6+vCxP+lM22wKV
	i2bq/sBQjCcFfA7YP3gSEDALLpEmlXeV/IaoQuaDJI1jZSrmRy6XFUX1mAgHxla8erNF
	XoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=L2q4EBKmEnmEEWPV/iyel3hO4I22jRtVEt3MLNsIQNY=;
	b=LSz+pDe6gcIdEYAgI1yrnURIegmD7/C2PMSFQrig6hCqSrqcd8Ck4tHCySmfeSSFFl
	OuflZAvvw/9CXayPwUp8TGuJFxs78erKhcK9xr/9/R2ExZw2ICrqNoOAeGq9BvJ/rzaC
	gdg0t9SGuUyBOJBdFQLn9A6wgZXhggU1eXuMMHrPe3K1TcbfkoTxGRSkg0btg8QTpbj6
	YIJeyyBON8FsH4HEgafQBbfP+tH+KcvizErmJbXI9srsD127TYg9ZOkZMMINjtcPAc90
	q+Vtgo+wZPGMTfbY2dF+QgytDuXBzTAfA0TFA8C0P6m4VtZWNuxHsxLsXdCr++OhHohE
	AKrw==
X-Gm-Message-State: AJaThX6HYMQRluMnAIpfmyDT5E934p6RPsmy18iRaKydRjpX50Q3VPPw
	YBR9CyaaTDPiER/PZK7BFN0TaiGvpOHb6GvPwzU=
X-Received: by 10.28.206.142 with SMTP id e136mr10666wmg.27.1510015444844;
	Mon, 06 Nov 2017 16:44:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Mon, 6 Nov 2017 16:43:34 -0800 (PST)
In-Reply-To: <20171106201332.GA2152@flamenco>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
	<20171106201332.GA2152@flamenco>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 6 Nov 2017 16:43:34 -0800
X-Google-Sender-Auth: zLdbnYvtSCL9mXTEb3CMGcKdzNM
Message-ID: <CAKmqyKO41gHX1Y0+rq8wMygf+ZoZLvOJPzqhfviPsgbDGHecsQ@mail.gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw: add .min_cpus and
 .default_cpus fields to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hOfSb6BFgVLP

On Mon, Nov 6, 2017 at 12:13 PM, Emilio G. Cota <cota@braap.org> wrote:
> On Mon, Nov 06, 2017 at 12:10:22 -0200, Eduardo Habkost wrote:
>> IMO, initialization state doesn't belong to CPUClass.  We already
>> have a single accelerator object in MachineState::accelerator,
>> and tcg_initialized could be moved to a AccelState::initialized
>> field.
>
> I don't know how to cleanly get AccelState from a CPUClass pointer
> (as I said I'm not familiar with object code / qom) -- suggestions
> welcome! The best I could come up in the limited time I have for
> this is to use a static bool, as shown below.
>
>
> ---8<---
>
> Subject: [PATCH] qom: move CPUClass.tcg_initialize to a global
>
> 55c3cee ("qom: Introduce CPUClass.tcg_initialize", 2017-10-24)
> introduces a per-CPUClass bool that we check so that the target CPU
> is initialized for TCG only once. This works well except when
> we end up creating more than one CPUClass, in which case we end
> up incorrectly initializing TCG more than once, i.e. once for
> each CPUClass.
>
> This can be replicated with:
>   $ aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -smp 6 \
>       -global driver=xlnx,,zynqmp,property=has_rpu,value=on
> In this case the class name of the "RPUs" is prefixed by "cortex-r5-",
> whereas the "regular" CPUs are prefixed by "cortex-a53-". This
> results in two CPUClass instances being created.
>
> Fix it by introducing a static variable, so that only the first
> target CPU being initialized will initialize the target-dependent
> part of TCG, regardless of CPUClass instances.
>
> Fixes: 55c3ceef61fcf06fc98ddc752b7cce788ce7680b
> Signed-off-by: Emilio G. Cota <cota@braap.org>

This works great for me, is this ok to be applied?

Thanks,
Alistair

> ---
>  exec.c            | 5 +++--
>  include/qom/cpu.h | 1 -
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/exec.c b/exec.c
> index 97a24a8..8b579c0 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -792,11 +792,12 @@ void cpu_exec_initfn(CPUState *cpu)
>  void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cpu);
> +    static bool tcg_target_initialized;
>
>      cpu_list_add(cpu);
>
> -    if (tcg_enabled() && !cc->tcg_initialized) {
> -        cc->tcg_initialized = true;
> +    if (tcg_enabled() && !tcg_target_initialized) {
> +        tcg_target_initialized = true;
>          cc->tcg_initialize();
>      }
>
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index fa4b0c9..c2fa151 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -209,7 +209,6 @@ typedef struct CPUClass {
>      /* Keep non-pointer data at the end to minimize holes.  */
>      int gdb_num_core_regs;
>      bool gdb_stop_before_watchpoint;
> -    bool tcg_initialized;
>  } CPUClass;
>
>  #ifdef HOST_WORDS_BIGENDIAN
> --
> 2.7.4
>
>
