Received: by 10.25.77.65 with SMTP id a62csp616238lfb;
        Fri, 3 Feb 2017 05:31:22 -0800 (PST)
X-Received: by 10.237.57.201 with SMTP id m67mr13375369qte.181.1486128682790;
        Fri, 03 Feb 2017 05:31:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g57si19235809qta.157.2017.02.03.05.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Feb 2017 05:31:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cZdxS-0004c6-A5
	for alex.bennee@linaro.org; Fri, 03 Feb 2017 08:31:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZdxG-0004ZX-Kz
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:31:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZdxC-0007NO-TH
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:31:10 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:38127)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cZdxC-0007Ma-N7
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 08:31:06 -0500
Received: by mail-wm0-x22a.google.com with SMTP id r141so27791904wmg.1
	for <qemu-arm@nongnu.org>; Fri, 03 Feb 2017 05:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3hlOyygyJcXVXbYSkF9d5q1zCBo8GLf5pACF/8gLjgQ=;
	b=BlC4pdPNDPlKhM10EQBDu/StGDKABgV+Xfqf+1eIrZzSrPfJTyI35R1jfUnMjO0dYy
	CoIJqztDNHFyyYFy00IgGawB1mPH51BL4h5ixeDUFqo/ThGVVLV/9VfthnP9aPXjxNGc
	ts1JA3EJTYkDXjpZg3+J+INmSZKfOatShv9y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3hlOyygyJcXVXbYSkF9d5q1zCBo8GLf5pACF/8gLjgQ=;
	b=GVL9G2mUg1EZgeuIfUm/q6bDRq2IZhW+khd0I4Hzv1a4pWo/H2rC2U7u7Kb6jfkiJR
	368NFJBsixOst2gb/+2QnseqSpADmiJo0moRvAsfQMIKfAnFARMZA/Z1/3CJ4a79sUxD
	pb+l6wETqRFKj0YShscnxII3FMyeZfCjY2xQ7T0jP58HQClT9xKWvOjIiEAuxrBsIfwV
	l1SRsgnCS0qQRIHi3jIAi8zvoZW9t14fsamk7gb1M+nUpz9VLVBazLJNJpF6zGxdD9Mt
	Xrqg0ike8krRY3WX6dboFehqPI3kysPhGKQain+3lCyW0KIwZNNSuxWf7pzrAR/wGq44
	D7wQ==
X-Gm-Message-State: AIkVDXKs148dZEmNbXOQHsbSiaPrAUq/D0h2L4klTHm8WY0MXhzUuNQ+CXTI6oWyzzM5hD2HBKQ97tMizTAGxyo9
X-Received: by 10.223.136.152 with SMTP id f24mr12052876wrf.187.1486128664999; 
	Fri, 03 Feb 2017 05:31:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 05:30:44 -0800 (PST)
In-Reply-To: <1485875745-27741-5-git-send-email-wei@redhat.com>
References: <1485875745-27741-1-git-send-email-wei@redhat.com>
	<1485875745-27741-5-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 13:30:44 +0000
Message-ID: <CAFEAcA8-Lt4z1uiN9dcuak3-hA3d_1fL7+iL2dOm9msrrq69NA@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-arm] [PATCH V2 4/5] target-arm: Add support for PMU
 register PMINTENSET_EL1
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QuPrPuNZLQwH

On 31 January 2017 at 15:15, Wei Huang <wei@redhat.com> wrote:
> This patch adds access support for PMINTENSET_EL1.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  target/arm/cpu.h    |  2 +-
>  target/arm/helper.c | 10 +++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index ce02044..42aaea9 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -310,7 +310,7 @@ typedef struct CPUARMState {
>          uint64_t c9_pmxevtyper; /* perf monitor event type */
>          uint32_t c9_pmuserenr; /* perf monitor user enable */
>          uint64_t c9_pmselr; /* perf monitor counter selection register */
> -        uint32_t c9_pminten; /* perf monitor interrupt enables */
> +        uint64_t c9_pminten; /* perf monitor interrupt enables */
>          union { /* Memory attribute redirection */
>              struct {
>  #ifdef HOST_WORDS_BIGENDIAN
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6b8460a..b028042 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1272,9 +1272,17 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .writefn = pmuserenr_write, .raw_writefn = raw_write },
>      { .name = "PMINTENSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 1,
>        .access = PL1_RW, .accessfn = access_tpm,
> -      .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
> +      .type = ARM_CP_ALIAS,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pminten),
>        .resetvalue = 0,
>        .writefn = pmintenset_write, .raw_writefn = raw_write },
> +    { .name = "PMINTENSET_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 1,
> +      .access = PL1_RW, .accessfn = access_tpm,
> +      .type = ARM_CP_IO,
> +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
> +      .writefn = pmintenset_write, .raw_writefn = raw_write,
> +      .resetvalue = 0x0 },
>      { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
>        .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),

Add PMINTENCLR_EL1 as well, please.

thanks
-- PMM
