Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp605971wrt;
        Tue, 20 Nov 2018 06:10:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vy4yubmUgQDnLCccFhnylHOHlXb3u9KQzeJHfygE7sI6rcoArfmXcEDqJ9jo15z6LbQ4at
X-Received: by 2002:a25:ad11:: with SMTP id y17-v6mr1839752ybi.341.1542723009472;
        Tue, 20 Nov 2018 06:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542723009; cv=none;
        d=google.com; s=arc-20160816;
        b=i4QjY3qEua3ue415yRIfR1+/E6sTmGArwGxrUFmzPegbrjpj97vQQUCn5sbCUqqYuu
         nVwJwD0adBrP1xRiegPAdo5zXV8IuH2kmozoyasJQiFQ7BumDN5ZxlXvYWi6YTLzd651
         WTHecnatidxcnq+ooj2vpzHTL/WB5RScwNvWGP8B/SteyQaha4teoqUhUlJHI9LY6GXh
         f4u89ihBJOUPhWu7U84qlFzpbnRTv/Ei6A3pQPRyvo2jTUHId5T11HGe6ORgwsSa5WSv
         /I35jrMxuuovowTr+9kPVbh7q+FWAs8oepE8+k3inPgyb5bVGci3vzZaGAunbzVIz2JN
         Z6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=K4by+bRKLEUQKntWXk+MM6PcAz4zHjdyYhug3vcfanc=;
        b=ImoitDfj++sAVXQeDdA1bVNs1HtM2zXuoIYGqelDtlEJ4USPwO9DAaviaIzVZHJSPf
         HLNqvXV9mJrCnEiUC+vp6sYjtqIB00AbeLLRmQbNSzG9/tQfNq/EjuudDO+FlprGlrqo
         hidMlyc4y4Qv7DUTTvAv58DBq35XR/NH4x0cCpKMjH3N2zFDfmfuAwEkV2TCr8aC072f
         IPRwbLpSGe7f024OusnFaiY9ZLrVBYUzD/0I7ImAlueNkFJMUcvXO5ym7lcBmw36hsEW
         y7jGbflsnu2Zagz/7FZUz67TSI0rCyyZ1MkZr2g/J8oKnfNQorLgjubKl5n4wc55jpmT
         4UPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HRxJsKss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6-v6si25569975ybq.288.2018.11.20.06.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 06:10:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HRxJsKss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP6jA-0005CG-Qo
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 09:10:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6is-00057J-8e
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:09:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6im-0005cf-49
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:09:50 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gP6il-0005bR-VA
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:09:44 -0500
Received: by mail-ot1-x344.google.com with SMTP id k98so1755183otk.3
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 06:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=K4by+bRKLEUQKntWXk+MM6PcAz4zHjdyYhug3vcfanc=;
	b=HRxJsKssCiC6OHjssKqMEq5SZlcBf6OC0gQ4hB4rq7JlAOZ6dhLsm6kWGKIpVNp/nZ
	L57pe1tfk8dwIA7nH27XmFvVGk4QgydW76AZHQdon2D5+eaKLAzx0txPd3K6nsjtrXo4
	VCxL9lIkqC1Ds9xPnpkFu+Qg9UY7pLyBqduQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=K4by+bRKLEUQKntWXk+MM6PcAz4zHjdyYhug3vcfanc=;
	b=SZyabKgWJorKYX6/ETAl+BQXIpJEWHMzWGklrZHq4YkeHE4y5LjFDVnFPvzftF9aSs
	+vJL5RKbMxwODAYjbjWxi/NDavjKxLgCF45giwJY5HSklCb0QN3ZDRcHVzNAczbXo2hj
	9EUWbn5G1DufKYD/VLiBhWps7635YcwTyVGNjKpwjeED8wzIN9sXepPbFRfXLSxM8Rwj
	zIzPBFCjnKl6kozP36t7MLABb2ksbQiwVUdMysr5+vjWHMRPNZdllqREW33/YPDYpIzU
	7wanQyU25iAA2JjezdQkrTf94dYLPXOkkizlK2z7VWYZbnWYctZrYMRJfy3YbkCQGO+S
	3pMA==
X-Gm-Message-State: AA+aEWa21UfhqoDm5MlXqljwZjUM3IhCu0DjA4akH9kZ3bsPzNC3IyMg
	Lgzq7U0P/IRlyO90di2IUG5WErhsSVOHHAcfFeMoVA==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr1315077oth.317.1542722982654; 
	Tue, 20 Nov 2018 06:09:42 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 06:09:22
	-0800 (PST)
In-Reply-To: <20181113165247.4806-12-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-12-sameo@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 14:09:22 +0000
Message-ID: <CAFEAcA_9JNW0bVcSVVgiAm8E-=FA0Vi9+XyrnO5oE95HdyZepw@mail.gmail.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 11/13] target: arm: Define TCG dependent
 functions when TCG is enabled
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f9ktc+EcD5gF

On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
> do_interrupt, do_unaligned_access, do_transaction_failed and debug_excp
> are only relevant in the TCG context, so we should not define them
> when TCG is disabled.
>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> ---
>  target/arm/cpu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 60411f6bfe..fb2e5d430e 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1444,7 +1444,7 @@ static void arm_v7m_class_init(ObjectClass *oc, voi=
d *data)
>  {
>      CPUClass *cc =3D CPU_CLASS(oc);
>
> -#ifndef CONFIG_USER_ONLY
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>      cc->do_interrupt =3D arm_v7m_cpu_do_interrupt;
>  #endif
>
> @@ -2061,9 +2061,14 @@ static void arm_cpu_class_init(ObjectClass *oc, vo=
id *data)
>  #ifdef CONFIG_USER_ONLY
>      cc->handle_mmu_fault =3D arm_cpu_handle_mmu_fault;
>  #else
> +
> +#ifdef CONFIG_TCG
>      cc->do_interrupt =3D arm_cpu_do_interrupt;

As noted on an earlier patch, this breaks KVM injection of
interrupts into the guest.

>      cc->do_unaligned_access =3D arm_cpu_do_unaligned_access;
>      cc->do_transaction_failed =3D arm_cpu_do_transaction_failed;
> +    cc->debug_excp_handler =3D arm_debug_excp_handler;
> +#endif

thanks
-- PMM
