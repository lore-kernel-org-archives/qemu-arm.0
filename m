Received: by 10.182.158.201 with SMTP id ww9csp379425obb;
        Thu, 17 Dec 2015 05:26:18 -0800 (PST)
X-Received: by 10.55.16.205 with SMTP id 74mr70620419qkq.15.1450358778585;
        Thu, 17 Dec 2015 05:26:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f11si11325460qga.87.2015.12.17.05.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 05:26:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:53607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9YZW-0004eF-8f
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 08:26:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9YZT-0004dt-Iu
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 08:26:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9YZS-0005rw-Ld
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 08:26:15 -0500
Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234]:36610)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9YZS-0005rK-HY
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 08:26:14 -0500
Received: by mail-ob0-x234.google.com with SMTP id no2so56564610obc.3
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 05:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0vdItsK7gqZxXoD22KRjvvVmcKLcL6fSy2AbhpmCtDI=;
	b=Ebr5kmBbVyFQV6gVbLisOv8rpVZwxPyr0cxtRS+51c31+QUlKJJiZwKMifrcK7PPox
	t31uYntbAUlMkb5z+ZQHUSr2YIPC93anMCqGumfNajwJfA9l5IrcyhJ60DNIOuqnPLnV
	9ezRFK273IP8c+3hLQyLGiKbBq1dn89yN7lkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0vdItsK7gqZxXoD22KRjvvVmcKLcL6fSy2AbhpmCtDI=;
	b=OL0b8+vRm+08tDZubre4F9J8Ti0AuFGisuslxYYbST0ijP3lZTeTf04OXlLSADbMf+
	e+JN2gUN0t7RLfpsjGJebboF6ABd3c6Q974wTbRaS+t1tGsjhrXc6XecDab7e82e923a
	k/1sMWzq63hJoG0qlCTFO/5j2T1S2F6sSNp0vb0JNd0sjrzX89pVOeSUCMl7JT8W8r/H
	2HJ3KIP270vqWPPIDRRq+2pC9hVJY8DTWsNAqDbWvOuYIm3ckQCXmWf7u0XitKBMvP0f
	cdcBoNaazyNIUiL2kii5kqEjNxxTHZiwf8G8xX7hUPAYCw17LTaEBDQFYsPxsesmmR/f
	pCgg==
X-Gm-Message-State: ALoCoQkEo1bd4bcyWqzczs8ytz9EarsfW4wTGt64dhAqaUbjJt3RcblAUqjgwqHTvNXWfqRjFfxNXoerVNb593hgznf1jM77DaIkMwUK4YCGxkHO7UUrQHI=
X-Received: by 10.182.19.131 with SMTP id f3mr40348412obe.26.1450358773023;
	Thu, 17 Dec 2015 05:26:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.52.97 with HTTP; Thu, 17 Dec 2015 05:25:53 -0800 (PST)
In-Reply-To: <1449101933-24928-4-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-4-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 13:25:53 +0000
Message-ID: <CAFEAcA--3_zaVHzhF5e5SEJ2avcOKVdwitu0iBXLwb9B6z073g@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::234
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 03/26] armv7m: Explicit error for bad
	vector table
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AQ0oxHs8Tkb2

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Give an explicit error and abort when a load
> from VECBASE fails.  Otherwise would likely
> jump to 0, which for v7-m holds the reset stack
> pointer address.
> ---
>  target-arm/helper.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 2c631e3..7b76f32 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5414,6 +5414,25 @@ static void do_v7m_exception_exit(CPUARMState *env)
>         pointer.  */
>  }
>
> +static
> +uint32_t arm_v7m_load_vector(ARMCPU *cpu)
> +
> +{
> +    CPUState *cs = &cpu->parent_obj;

This isn't the right way to cast to the base class of a QOM object.
You want:
   CPUState *cs = CPU(cpu);

> +    CPUARMState *env = &cpu->env;
> +    MemTxResult result;
> +    hwaddr vec = env->v7m.vecbase + env->v7m.exception * 4;
> +    uint32_t addr;
> +
> +    addr = address_space_ldl(cs->as, vec,
> +                             MEMTXATTRS_UNSPECIFIED, &result);
> +    if (result != MEMTX_OK) {

We could use a comment here:
   /* Architecturally this should cause a HardFault setting HSFR.VECTTBL,
    * which would then be immediately followed by our failing to load
    * the entry vector for that HardFault, which is a Lockup case.
    * Since we don't model Lockup, we just report this guest error
    * via cpu_abort().
    */

> +        cpu_abort(cs, "Failed to read from exception vector table "
> +                  "entry %08x\n", (unsigned)vec);
> +    }
> +    return addr;
> +}
> +
>  void arm_v7m_cpu_do_interrupt(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> @@ -5495,7 +5514,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>      /* Clear IT bits */
>      env->condexec_bits = 0;
>      env->regs[14] = lr;
> -    addr = ldl_phys(cs->as, env->v7m.vecbase + env->v7m.exception * 4);
> +    addr = arm_v7m_load_vector(cpu);
>      env->regs[15] = addr & 0xfffffffe;
>      env->thumb = addr & 1;
>  }

The rest of this patch looks OK though.

thanks
-- PMM
