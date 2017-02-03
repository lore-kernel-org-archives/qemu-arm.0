Received: by 10.25.77.65 with SMTP id a62csp615373lfb;
        Fri, 3 Feb 2017 05:29:27 -0800 (PST)
X-Received: by 10.55.65.136 with SMTP id o130mr12941260qka.168.1486128567750;
        Fri, 03 Feb 2017 05:29:27 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m48si19252612qtb.102.2017.02.03.05.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Feb 2017 05:29:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cZdvb-0003Lb-8d
	for alex.bennee@linaro.org; Fri, 03 Feb 2017 08:29:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZduj-0002xW-JL
	for qemu-devel@nongnu.org; Fri, 03 Feb 2017 08:28:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZdui-0005Lg-R9
	for qemu-devel@nongnu.org; Fri, 03 Feb 2017 08:28:33 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:36670)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cZdui-0005L7-KK
	for qemu-devel@nongnu.org; Fri, 03 Feb 2017 08:28:32 -0500
Received: by mail-wm0-x234.google.com with SMTP id c85so28971923wmi.1
	for <qemu-devel@nongnu.org>; Fri, 03 Feb 2017 05:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZuFE66DWBfNPvSEhNRth9RdSZjJx15xBfYaAjBxTLIc=;
	b=kylCVvQ39ozfdgzNFrZtrRdFuhy5UcNMRZj9DDGtVILznrRiR6jme4oPzeJ3qFsRl5
	PSVUK7ZM1WA2z1xpKQH2GMCMLJRWr4eAPaqKgQPIKVkPUkxzatyvq9daghOOMgGyIh0/
	mvuSzoYZOACxxciX17aV/2muIxCPrUEw1MOUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZuFE66DWBfNPvSEhNRth9RdSZjJx15xBfYaAjBxTLIc=;
	b=ncpTfNM5ymdZihCC5gg6DtaSn3pkXOzeUz2CHf+6qNhu+YUl2jTE4zW4Wk5m/HPqHM
	TYpOHkSpAVCNlYq3eC+SWepKtCgdwO3ix6/dSMs+7laYFSGU0H/I5VQ0j4dq4uYCrAoS
	8WFNOZ3CdnxZZpOElJXdiR/ZqXPJc+oiy4SZCSoG6jsnp+o0koPWHDrP4+kO5nt6oAG7
	Gf9bLCnLV3zl8n+3TUrlN9duWLTT+oGSB/1lsgudqJZuF4cbmBrzyFQ167pcHE4oPlrA
	TUale2UJ/lygm/K5/O5zfjopCLrioHk6QK7GJCQHHDVlxD95D7B3+lXtDtuaDKVmYVG/
	Dl3g==
X-Gm-Message-State: AIkVDXK6dgDuGYSU9jZL/F5/1sP3piQ2hk8ky+otHuDEIfoiVwBP0psuVv4e8lXnBgMSBpsg3L2bAlKrz19wVbTS
X-Received: by 10.223.142.131 with SMTP id q3mr12080694wrb.195.1486128511523; 
	Fri, 03 Feb 2017 05:28:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 05:28:11 -0800 (PST)
In-Reply-To: <1485875745-27741-4-git-send-email-wei@redhat.com>
References: <1485875745-27741-1-git-send-email-wei@redhat.com>
	<1485875745-27741-4-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 13:28:11 +0000
Message-ID: <CAFEAcA-UpfQExDL3uk5SGh4KOwuFXrpkV6sBhbBqKAJHs+wnVg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-devel] [PATCH V2 3/5] target-arm: Add support for PMU
 register PMXEVCNTR_EL0
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mwGz9VoU+Su+

On 31 January 2017 at 15:15, Wei Huang <wei@redhat.com> wrote:
> To make PMU register support complete, this patch adds support for
> PMXEVCNTR_EL0.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  target/arm/helper.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c8620d9..6b8460a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1255,6 +1255,10 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>      { .name = "PMXEVCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 2,
>        .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
>        .accessfn = pmreg_access },
> +    { .name = "PMXEVCNTR_EL0", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 2,
> +      .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
> +      .accessfn = pmreg_access },

We don't need to do this, because we're already spec-compliant.
Since we only support the cycle counter, accesses to PMXEVCNTR
are always CONSTRAINED UNPREDICTABLE and "accesses UNDEF" is
a permitted choice, which is what we do at the moment.
('Accesses are RAZ/WI' are also a permitted choice.)

Is there a reason you've opted for the RAZ/WI here?

thanks
-- PMM
