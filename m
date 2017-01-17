Received: by 10.25.205.13 with SMTP id d13csp504649lfg;
        Tue, 17 Jan 2017 05:46:25 -0800 (PST)
X-Received: by 10.200.36.178 with SMTP id s47mr28690569qts.98.1484660785595;
        Tue, 17 Jan 2017 05:46:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s57si16612291qte.204.2017.01.17.05.46.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 05:46:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTU5e-0001gB-W8
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 08:46:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTU4N-00015i-MU
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 08:46:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTU3S-0007yW-KO
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 08:45:03 -0500
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:33029)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cTU3S-0007y1-EQ
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 08:44:06 -0500
Received: by mail-ua0-x236.google.com with SMTP id i68so102793310uad.0
	for <qemu-arm@nongnu.org>; Tue, 17 Jan 2017 05:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lHn77fH191MWG37YHHfd+Oh36/dqdo1JBxHKNsXasHk=;
	b=cvW6/KvsdW02gf2X58qASVPuUDA+pyXhLBPROTz8cwmPCWtaX7ONHwJe4kMqHZJi7H
	5EkteYdOvNo+iDfMA2DrHxpBQN9sV7UmYgrPN1+sR9zeGy1eZSu0cik2FKtuyhVH0UYT
	wcAJ++JCT3HvtxOOjF/ieb4YIE0gmf8SGtXnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lHn77fH191MWG37YHHfd+Oh36/dqdo1JBxHKNsXasHk=;
	b=tG2l94fY10NqlVMzh04Rz3Q+QIZtjo/dFXquL79b9L8p/5jVGxI1ylR4DFN1ucun84
	dN7LRwCl6A91mFk6LPc6VdWLC5KnPgNFBaYQagOySIH3HAodmgheJZspwG0iEJo63I+P
	cpbhVkYc/rzLu2QiWuS/dQtDzqxZxyxuunYbcOhfaPbfHSh4+/aNYGGv0ejso4fKKdCA
	pHuB0Ze2ehLUxlFlOAvRPn0HYv7D8DPHs9wuNIiYW5wf994uMnfqU/gdoVqYARShT3rK
	5kyItbChVReexHC79lILbuhlofr4SmsNSl+9aIEFhvsfxz+mij3iKkwrYWU8Tihbkk3Y
	SO0g==
X-Gm-Message-State: AIkVDXL5bHxJD1UCZnJ+1B8GKHeSe6lX/q4hlQw2tpJAYLh+RbnwOMxkth0F1MM89YcDrAhMTJUxCBru4EwaQr4n
X-Received: by 10.176.91.86 with SMTP id v22mr2283529uae.175.1484660645780;
	Tue, 17 Jan 2017 05:44:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 17 Jan 2017 05:43:45 -0800 (PST)
In-Reply-To: <1484204658-28058-3-git-send-email-wei@redhat.com>
References: <1484204658-28058-1-git-send-email-wei@redhat.com>
	<1484204658-28058-3-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2017 13:43:45 +0000
Message-ID: <CAFEAcA-DAbCj67g8K+zvAPf_m4V2cP2L9ZJM=Vu7gjdkd+4OvA@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-arm] [PATCH V1 2/4] target-arm: Add support for AArch64
 PMU register PMXEVTYPER_EL0
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
X-TUID: B9rMeO+ksDZS

On 12 January 2017 at 07:04, Wei Huang <wei@redhat.com> wrote:
> In order to support Linux perf, which uses PMXEVTYPER register,
> this patch adds access support for PMXEVTYPER_EL0.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  target/arm/helper.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 71adb0f..9044a33 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1233,10 +1233,17 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, cp15.pmccfiltr_el0),
>        .resetvalue = 0, },
>      { .name = "PMXEVTYPER", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 1,
> -      .access = PL0_RW,
> +      .access = PL0_RW, .type = ARM_CP_ALIAS,
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmxevtyper),
>        .accessfn = pmreg_access, .writefn = pmxevtyper_write,
>        .raw_writefn = raw_write },
> +    { .name = "PMXEVTYPER_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 1,
> +      .access = PL0_RW, .accessfn = pmreg_access,
> +      .type = ARM_CP_IO,

Why is this marked as ARM_CP_IO ?

> +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmxevtyper),
> +      .writefn = pmxevtyper_write, .raw_writefn = raw_write,
> +      .resetvalue = 0x0 },

As with patch 1, the c9_pmxevtyper field needs to become a uint64_t
so you can use it in a 64-bit regdef.
(Also the semantics of PMXEVTYPER need to change, see comments on
patch 1.)

>      /* Unimplemented, RAZ/WI. */
>      { .name = "PMXEVCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 2,
>        .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,

thanks
-- PMM
