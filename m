Received: by 10.182.158.201 with SMTP id ww9csp1022459obb;
        Fri, 18 Dec 2015 04:07:03 -0800 (PST)
X-Received: by 10.140.106.37 with SMTP id d34mr4404184qgf.77.1450440423408;
        Fri, 18 Dec 2015 04:07:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y20si9227588qka.117.2015.12.18.04.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 04:07:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9toN-0006Lt-0P
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 07:07:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9toG-0006Gw-Jc
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:07:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9toF-0001tP-Pb
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:06:56 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:34229)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9toF-0001t3-MW
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:06:55 -0500
Received: by mail-vk0-x233.google.com with SMTP id j66so64039469vkg.1
	for <qemu-arm@nongnu.org>; Fri, 18 Dec 2015 04:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ldgNEoKObSzGox/Ek1FqtuQWEzxGqFySrpRRswT7fdc=;
	b=buK92JI5WQuzTa97BD3EGt6hogq6X61nJh4uu8z6bCeXahZMgAoNwzZOTaBjAWUUzW
	qdSqEZ4IEvQ8xyX2g/I5Po8MjLN5fy7LBlMLnUH3j84m/Ju3UqPAbM3TfTaiZgsaDbWN
	ynbKmdQVrrySG7qs5DqNNiUq6Sx4vVM8sMljk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ldgNEoKObSzGox/Ek1FqtuQWEzxGqFySrpRRswT7fdc=;
	b=U5tPzhJo48ktZec8YnITeVnSMnCYbxGksaIymr1H01hgmXYlO16YzKvjGXD3jUd0+1
	oySzQuIbZgawi1OyWIjkhmpNZcbZB9ucZ5XJJpcr+MjzmTyK2SqE5FToT01e2wzxayAm
	va6GaFY9Y/G7zqWo7FNMbB5QC7H4UF7/YP7zqiNMGMRsBpsIHbnYNuYHgoo9KOB2i9aL
	9XiVjB0wq5f9fgJs5s0qu8Js6nxrBsAaffC2SrWrW5n/QRCTTH2aBLHeMUcUYSFuH5KM
	jh9Ce516e8aJRbjvhyKISMCwARA9COBiAYVw6Sq13MgFQWlrr91P+MSLTWkpQ4muaqxR
	aWVw==
X-Gm-Message-State: ALoCoQkDD9kqLVjCuyRwILYr+1zXA/BCIsC/Vwh24MRhoJedXr4jguTAbSnvcmI+tTwUNOnmVQBY7pNB5h5CAox8RaOWP5rlnISFjq6ucNQzdGZyPyZZ7X8=
X-Received: by 10.31.194.21 with SMTP id s21mr1935525vkf.92.1450440415373;
	Fri, 18 Dec 2015 04:06:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 18 Dec 2015 04:06:36 -0800 (PST)
In-Reply-To: <1450219878-5293-8-git-send-email-drjones@redhat.com>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
	<1450219878-5293-8-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2015 12:06:36 +0000
Message-ID: <CAFEAcA-KW9pbPpz0Qx02ymSwwR60qB8e2L6-TbXS+r03kN33Nw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v3 7/9] target-arm: dump-guest-memory: add
 prfpreg notes for aarch64
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
X-TUID: MEB37U3YZ5Rk

On 15 December 2015 at 22:51, Andrew Jones <drjones@redhat.com> wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target-arm/arch_dump.c | 79 +++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 71 insertions(+), 8 deletions(-)

> +static int

We don't usually do the 'linebreak before function name' style.

> +aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f, CPUARMState *env,
> +                            int cpuid, DumpState *s)
> +{
> +    struct aarch64_note note;
> +    int ret, i;
> +
> +    aarch64_note_init(&note, s, "CORE", 5, NT_PRFPREG, sizeof(note.vfp));
> +
> +    for (i = 0; i < 64; ++i) {
> +        note.vfp.vregs[i] = cpu_to_dump64(s, float64_val(env->vfp.regs[i]));
> +    }
> +
> +    if (s->dump_info.d_endian == ELFDATA2MSB) {
> +        /* For AArch4 we must always swap the vfp.regs's 2n and 2n+1

"AArch64".

> +         * entries when generating BE notes, because even big endian
> +         * hosts use 2n+1 for the high half.
> +         */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
