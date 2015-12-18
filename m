Received: by 10.182.158.201 with SMTP id ww9csp1018107obb;
        Fri, 18 Dec 2015 04:00:04 -0800 (PST)
X-Received: by 10.55.207.73 with SMTP id e70mr4137052qkj.77.1450440003970;
        Fri, 18 Dec 2015 04:00:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m206si15867350qhb.126.2015.12.18.04.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 04:00:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9thb-0000JT-O7
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 07:00:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9thZ-0000II-3y
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:00:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9thY-0000MM-98
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:00:01 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9thY-0000M3-5L
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:00:00 -0500
Received: by mail-vk0-x234.google.com with SMTP id j66so63943583vkg.1
	for <qemu-arm@nongnu.org>; Fri, 18 Dec 2015 03:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jGsMKnmzr4UEZtrz8cmAVnPImn1+Pe9PobpWpYTLBK0=;
	b=PDSyUJMY+XAPpMF8eBtGfkZH2mO+awSOnUJc/SnMdWzJOVa7s3aM9eVa30K3Z4GSwM
	3ySP36sKDRSdgJ/bymXz+azWMYtQsNjVQKputzpKOwGAfUyoVVYXmp+Cv9Kd+zk1JfjJ
	tDoQE6xZ33/o2u3xIvxUk7mQaMAoLvQxsXFQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jGsMKnmzr4UEZtrz8cmAVnPImn1+Pe9PobpWpYTLBK0=;
	b=JwHXaH/VsXsrsQGXp14BWBT4Q5NAu2MhPNsrbE7HsKbfm80ziYRVIk8InPOXMXrkr+
	WYK5DnBav0Ud0vZpCER6Fe8Fvu4dD7mJgD3yXF0NoR1RqmsIp4DQuyx8SiADrw+h8KvG
	yMKr8zh+Ydr+6mWGoR75rdRy1bDbm7WBqdCq1unPL1CTq81AndtY9G+CL3clQeqcMSXl
	Oh6Muq8AX2HGehkNqNEMXDHxJyRA5RhTxIzcx2neXiRhsZNlWXooSSa3k3CELu7JYdPC
	7fhb0slLylCMr4pjWMS2aJTC04kzgnb8k1huWteMrvTm0OTIVnLJHzuNRrVC8juXTR6j
	ZyEw==
X-Gm-Message-State: ALoCoQkyXDSxuL5lyx0kp9x/Pn0iaizgLINXRC4YiqwNglYJoN5XzYKaxd2msSwd1cR5aNOdeKjjk13veZY1uI5DRKmKW4mOWLXErzAVFHXYyPf5XDMuZsk=
X-Received: by 10.31.180.145 with SMTP id d139mr1653257vkf.83.1450439998499;
	Fri, 18 Dec 2015 03:59:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 18 Dec 2015 03:59:39 -0800 (PST)
In-Reply-To: <1450219878-5293-7-git-send-email-drjones@redhat.com>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
	<1450219878-5293-7-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2015 11:59:39 +0000
Message-ID: <CAFEAcA9ENDZfeNFJgJOdv+O+iPXW6Sod-1vBYAj-ViysSiXReQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v3 6/9] target-arm: support QMP
	dump-guest-memory
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
X-TUID: bp80b8VCZ/sp

On 15 December 2015 at 22:51, Andrew Jones <drjones@redhat.com> wrote:
> Add the support needed for creating prstatus elf notes. This
> allows us to use QMP dump-guest-memory.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

> +int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> +                             int cpuid, void *opaque)
> +{
> +    struct aarch64_note note;
> +    CPUARMState *env = &ARM_CPU(cs)->env;
> +    DumpState *s = opaque;
> +    uint64_t pstate, sp;
> +    int ret, i;
> +
> +    aarch64_note_init(&note, s, "CORE", 5, NT_PRSTATUS, sizeof(note.prstatus));
> +
> +    note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
> +
> +    if (!is_a64(env)) {
> +        aarch64_sync_32_to_64(env);
> +        pstate = cpsr_read(env);
> +        sp = aarch64_compat_sp(env);

I don't understand why we need to do this. If this is an
AArch64 dump then we should just treat it as an AArch64
dump, and presumably the consumer of the dump knows enough
to know what the "hypervisor view" of a CPU that's currently
in 32-bit mode is. It has to anyway to be able to figure
out where all the other registers are, so why can't it
also figure out what mode the CPU is currently in and thus
where r13 is in the xregs array?

> +    } else {
> +        pstate = pstate_read(env);
> +        sp = env->xregs[31];
> +    }

thanks
-- PMM
