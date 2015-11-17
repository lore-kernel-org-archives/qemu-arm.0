Received: by 10.182.158.201 with SMTP id ww9csp863050obb;
        Tue, 17 Nov 2015 09:33:28 -0800 (PST)
X-Received: by 10.129.159.7 with SMTP id w7mr648440ywg.70.1447781608777;
        Tue, 17 Nov 2015 09:33:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o64si27381964ywo.214.2015.11.17.09.33.28
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 09:33:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:59910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zyk8G-0007Ar-9S
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 12:33:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zyk8E-00078o-Ju
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:33:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zyk8D-0003gY-Jy
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:33:26 -0500
Received: from mail-yk0-x229.google.com ([2607:f8b0:4002:c07::229]:35067)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zyk8D-0003gN-Ga
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 12:33:25 -0500
Received: by ykba77 with SMTP id a77so18122642ykb.2
	for <qemu-arm@nongnu.org>; Tue, 17 Nov 2015 09:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gFk6/nUiJaCwNmA2C7SngxurUHVTxYEUCq1Sa46Y1aU=;
	b=Gu1iX5+GLqju78dPU4y+BG8HNpNcX7XauhdNWt08LjbSDHPei1xUfk4/jN7PVrmIOz
	emlCdfGAttHDFxga1D9TvTyAD+uD2dftbsda8MEk+lC3AGQC7gei7yW85xXiAlbVmn+n
	dumWnPp/CfGgwlMQr5ynZmS3sfCt7wGboWbGSWKDCd7m9f3nBLgcL95/lSPyqTPyXmTR
	AcQA+uDXCm32Rxgmhq7frrK9FW1qdwK1gfrJu7Pm482qeQuFjFKDZYfQyuAiVpg00DEH
	+BDXOYW5cgg6ue9I1vswCaVHpGAX/Cdq65Vj1eSzIHp55KA1nQDuNay7MyM2QK62BCUm
	zKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gFk6/nUiJaCwNmA2C7SngxurUHVTxYEUCq1Sa46Y1aU=;
	b=TsKwZu517bVXhhHQ+RBGEa+jYYkATk5hkbiKggv2fyigevaPPc2OVZTxzZ27Tafd6x
	BJvpo5j3VUNTRyHoRKtNQjxi1b0h/UOWe+K8j1ZPEN2L/HSE0kxmsaTvmVVIenD0RwMx
	+bpLIv2KC26p1hxftgh0172eEShM0KhoHaeMQDF9OE8+FzrD5FhRxOk4KHu4mlLPe/wB
	ndYDos2C2dv4HDic3/M0kl7LoJweHh6U3AgDIFh85PVmpaWyQF8h5KsX0BoA9XWwoWAo
	bMvWc9MOul5EZtX61CzFlBeFK+oROsfDy9XYVbIYXUiVz+tV+AHBnIXQVLS88e9n1jtA
	UqAQ==
X-Gm-Message-State: ALoCoQljLdoWASs79huRVAaRxrnzEfrGlSQmUa5El1wZRLPfTPOj/k3B9cgvt6Cgb5g/sb5sGXJm
X-Received: by 10.129.57.68 with SMTP id g65mr12449655ywa.105.1447781605122;
	Tue, 17 Nov 2015 09:33:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 17 Nov 2015 09:33:05 -0800 (PST)
In-Reply-To: <1447031505-12477-5-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-5-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2015 17:33:05 +0000
Message-ID: <CAFEAcA-yuKpZzEV1T1VMOU1HPbspTHP8PsSw80=UPr7mw2aBjw@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::229
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 04/18] armv7m: Explicit error for bad vector
	table
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
X-TUID: kZ5mNnCuj3Zc

On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Give an explicit error and abort when a load
> from VECBASE fails.  Otherwise would likely
> jump to 0, which for v7-m holds the reset stack
> pointer address.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> ---
>  target-arm/helper.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 4178400..1d7ac43 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5496,7 +5496,17 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>      /* Clear IT bits */
>      env->condexec_bits = 0;
>      env->regs[14] = lr;
> -    addr = ldl_phys(cs->as, env->v7m.vecbase + env->v7m.exception * 4);
> +    {
> +        MemTxResult result;
> +        addr = address_space_ldl(cs->as,
> +                                 env->v7m.vecbase + env->v7m.exception * 4,
> +                                 MEMTXATTRS_UNSPECIFIED, &result);
> +        if (result != MEMTX_OK) {
> +            cpu_abort(cs, "Failed to read from exception vector table "
> +                      "entry %08x\n",
> +                      env->v7m.vecbase + env->v7m.exception * 4);
> +        }
> +    }

The behaviour on a failed vector table read is actually architecturally
specified: we should take a nested exception (escalated to HardFault).
If it happens while we're trying to take a HardFault in the first place
then we go into Lockup (where the CPU sits around repeatedly trying
to execute an instruction at 0xFFFFFFFE; it is technically possible
to get back out of Lockup by taking an NMI or a system reset).

That said, trying to get nested exceptions and priority escalation
right is fairly involved, and implementing lockup is both involved
and an exercise in pointlessness. So I think this code is an
improvement overall. I would suggest some small changes, though:

(1) factor this out into its own function, something like:
static uint32_t v7m_read_vector(CPUARMState *env, int excnum)
so the calling code can just do
   addr = v7m_read_vector(env, env->v7m.exception);
(2) use a local variable for "env->v7m.vecbase + excnum * 4"
rather than calculating it twice

thanks
-- PMM
