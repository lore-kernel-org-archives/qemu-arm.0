Received: by 10.223.197.9 with SMTP id q9csp4626012wrf;
        Tue, 17 Oct 2017 06:54:08 -0700 (PDT)
X-Received: by 10.200.43.120 with SMTP id 53mr20165063qtv.127.1508248448501;
        Tue, 17 Oct 2017 06:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508248448; cv=none;
        d=google.com; s=arc-20160816;
        b=A5itZqjxzyeulWmJfTXoTWBMtCc9/9usHtIm6YkeMcPieicwS8kc1aIgLkui+5o1rl
         4yBnDmGYW6Kqn23ORwnkvmnD0IQCJayzPANxnXEqrv0NxDce03i+rZvkUWv9k5Dnaa3C
         keAp9GnNi7YnwKftHmZYFtf5yj87gOyjm4EXF7MXAuY7xFCQF6Mn8SzH+NbHzBisNvIw
         Rjpqi3S2ykYzIWgJ1uVWXRobiFsguY08Ln5weErDENSoi7a0vLP1JNNP2OuUFx0UX4hX
         gT+EHon9JeNplhNyav87s4e1Rj6Vp1N8cF5vfPCpFm6UUUAuyRUWV+zGTJCA4Y06R+CH
         9otQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=WG9Kks5NB5w1lWsnyzLyYZeGAARS/uMnlRNkmogQcqk=;
        b=X+6yfKfugERpChF7JscMMdyaIdJW7sPPMrcWNfguQ6UnsgVl2hY8gq1R1LFkcTXKpI
         oq5dleGbA1hTyFqLov+5mfpcVAVxHizsmt2ybH3H7z4yrFKRR2fUfDobLdw3ysmQ/SjK
         Fglk6NYhH1Qjr/7Nv367ZkRcVxWcsaJJNwGB0cwVadWZ+QK0dXPAvqjJ88zoq9EvHc7D
         Dj7fr74DVif+0UpqN5USy1xMtXBHHnPXJLH7LGPHPZbfRtRGWPOa1Z/YpLgBj/kXHzcj
         JIqVCkjZ70Mh5h7DDB7k88WazqpVWYHuXfCHSiR9lH4pctS438EJEXH+yvr/Gf+UesqS
         bVag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k0aBkQkU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a4si2550316qkc.153.2017.10.17.06.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 06:54:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k0aBkQkU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39555 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4SJq-0004pk-7r
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 09:54:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4SIR-00044G-9s
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 09:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4SIQ-0006p3-1K
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 09:52:39 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:54417)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4SIP-0006mi-PZ
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 09:52:37 -0400
Received: by mail-wm0-x230.google.com with SMTP id i124so4114398wmf.3
	for <qemu-devel@nongnu.org>; Tue, 17 Oct 2017 06:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WG9Kks5NB5w1lWsnyzLyYZeGAARS/uMnlRNkmogQcqk=;
	b=k0aBkQkUdGPMhaXtOT91K+q6k08D2u9hlzrBG2Ig/P0/53h7YXWSKSGwGVNSg78EYz
	o3DUTHihFSdMkXtD9kYoJR2r7lzXgWP5znvex9W/khtrTr+wN1V7kyGbsJrUbjeO81Mp
	vh97J2XwO0YuyMP3AFA+pWe4uxqnjTenVsaMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WG9Kks5NB5w1lWsnyzLyYZeGAARS/uMnlRNkmogQcqk=;
	b=lwz+gtOA8TQiruZXD7NUVPKr+l1Hye7ScmEd3SQl2xXMUEKCGvPi81GfT/gJGuqTj2
	5uMgLg42cWPj8uyehRiaieerO7cbItFsjQ8+fTi05Bl5hOUOf747Kpnry5lh4OwJPNnc
	grhNSJhyDMoxCsPRGyeKRoH+eT1rVeDmx0My3fPhJzM8u71Y1omvc23v0vUgajKBOn4o
	h6LOFZueSfBGUo4SeBBIMieNzgYGv0P2DVlvcSUWoyZol2TB4EMJpCOOuwxip9eXO7Hd
	RyXiuCQGQeWgWBSIDqFhMwTLB2zXORxy2d70gW0A+ia196enEhR7wVPRzD9yPFNfkkYi
	GreA==
X-Gm-Message-State: AMCzsaUol61DUEZG3sWL+L/wX4Nir5D9jUqeCmtZgAaI7jjlia4CGFxQ
	+qEMiY6+n/9PI2Hq8hxyqLJHIsnKC2IN3mYMRo/VSw==
X-Google-Smtp-Source: ABhQp+T8e7S4+XEPEcpSxPJEo9YJk5NMkXP+HbkYqhV0/i3nj+5Y8mWIec937jIfPWO4r1/9C0gBHqMlqmrJDCC5aK4=
X-Received: by 10.28.236.203 with SMTP id h72mr3973184wmi.147.1508248356550;
	Tue, 17 Oct 2017 06:52:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 06:52:15 -0700 (PDT)
In-Reply-To: <1506737310-21880-6-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-6-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 14:52:15 +0100
Message-ID: <CAFEAcA8iTXQC6JtimEwS1ZpU5TYc3XyfSnX=W2J2orJ25ugpZA@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-devel] [PATCH 05/13] target/arm: Allow AArch32 access for
 PMCCFILTR
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
Cc: Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G527iHLItdsU

On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Also fix the existing bitmask for writes.

"Also" in a commit message can often be translated as
"This should really go in a separate commit, but" :-)

> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 54070a3..fcc2fcf 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1059,10 +1059,25 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                              uint64_t value)
>  {
>      pmccntr_sync(env);
> -    env->cp15.pmccfiltr_el0 = value & 0x7E000000;
> +    env->cp15.pmccfiltr_el0 = value & 0xfc000000;
>      pmccntr_sync(env);
>  }
>
> +static void pmccfiltr_write_a32(CPUARMState *env, const ARMCPRegInfo *ri,
> +                            uint64_t value)
> +{
> +    pmccntr_sync(env);
> +    env->cp15.pmccfiltr_el0 = (env->cp15.pmccfiltr_el0 & 0x04000000) |
> +        (value & 0xf8000000); /* M is not visible in AArch32 */

I think the comment would look better on its own line.

> +    pmccntr_sync(env);
> +}

I think we could probably benefit from defining constants for
the bit names in this register.

> +
> +static uint64_t pmccfiltr_read_a32(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    /* M is not visible in AArch32 */
> +    return env->cp15.pmccfiltr_el0 & 0xf8000000;
> +}
> +
>  static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                              uint64_t value)
>  {
> @@ -1280,6 +1295,12 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .type = ARM_CP_IO,
>        .readfn = pmccntr_read, .writefn = pmccntr_write, },
>  #endif
> +    { .name = "PMCCFILTR", .cp = 15, .opc1 = 0, .crn = 14, .crm = 15, .opc2 = 7,
> +      .writefn = pmccfiltr_write_a32, .readfn = pmccfiltr_read_a32,
> +      .access = PL0_RW, .accessfn = pmreg_access,
> +      .type = ARM_CP_ALIAS,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.pmccfiltr_el0),
> +      .resetvalue = 0, },
>      { .name = "PMCCFILTR_EL0", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 15, .opc2 = 7,
>        .writefn = pmccfiltr_write,

If you're defining both a .readfn and a .writefn for a register
you don't need to provide a .fieldoffset.

thanks
-- PMM
