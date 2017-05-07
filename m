Received: by 10.25.0.198 with SMTP id 189csp920301lfa;
        Sun, 7 May 2017 03:56:08 -0700 (PDT)
X-Received: by 10.55.140.65 with SMTP id o62mr21497102qkd.270.1494154568702;
        Sun, 07 May 2017 03:56:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s186si9318077qkb.12.2017.05.07.03.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 May 2017 03:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7JrC-0007vH-7A
	for alex.bennee@linaro.org; Sun, 07 May 2017 06:56:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1d7Jr7-0007v7-If
	for qemu-arm@nongnu.org; Sun, 07 May 2017 06:56:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1d7Jr4-0003tU-EH
	for qemu-arm@nongnu.org; Sun, 07 May 2017 06:56:01 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1d7Jr4-0003tQ-6h; Sun, 07 May 2017 06:55:58 -0400
Received: by mail-wm0-f66.google.com with SMTP id y10so9368746wmh.0;
	Sun, 07 May 2017 03:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=5VBM/52RPIp+q3uO0tc23J0xfOe8mQhRTwW348F3+F8=;
	b=NGvpVvk5eqD5K2DQpQqLVeCZQULiSdXclHseOJMU7K6dMJXNMMFB8UorudHJrp0CuW
	hnG8/6kJwOAXMmsqyhShdK2UQ1gW/UQ602BNTaK5wJAGAyRMYnEd0CWGAma/k6D9x26m
	odPg48XqscVrOcUJOXVEXz/neKbGs5gcsQELD7K7onMkE8XRqGj3ZLpKtfORA9yXHOaS
	Z3f/EZfe4yt0OnE/3JE8aeEA4EjJ0l8MPgRsPtIbPdzXMuPb+Z7DuWsyyTnRz8Z2uxTj
	px+Eft3cEWFvPvRA2bOUUghFCFIYATlakKEhcHkXWo6ptULnaSOZ9tuUvs3PZd5QgClt
	OR3A==
X-Gm-Message-State: AN3rC/7Yob8W6crthX+/DlFqnnlFB3or/aVFde4NSd/yTeKOgYeo0sPj
	EpMZI3vO/+wuWg==
X-Received: by 10.80.174.131 with SMTP id e3mr12451013edd.166.1494154556796;
	Sun, 07 May 2017 03:55:56 -0700 (PDT)
Received: from kozik-lap (pub082136089155.dh-hfc.datazug.ch. [82.136.89.155])
	by smtp.googlemail.com with ESMTPSA id
	w15sm829164edw.27.2017.05.07.03.55.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 07 May 2017 03:55:55 -0700 (PDT)
Date: Sun, 7 May 2017 12:55:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-ID: <20170507105553.4xoq7obdc2bjx26x@kozik-lap>
References: <20170313180432.7067-1-krzk@kernel.org>
	<20170313180432.7067-2-krzk@kernel.org>
	<cf23c2b4-c4c1-bb46-626e-a54851b25cbb@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cf23c2b4-c4c1-bb46-626e-a54851b25cbb@amsat.org>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.66
Subject: Re: [Qemu-arm] [PATCH v2 1/5] hw/intc/exynos4210_gic: Fix GIC
 memory mappings for secondary CPU
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g7dKiyoqfjki

On Mon, Mar 13, 2017 at 04:32:40PM -0300, Philippe Mathieu-Daud=C3=A9 wrote:
> On 03/13/2017 03:04 PM, Krzysztof Kozlowski wrote:
> > Recent Linux kernel (tested next-20170224) was complaining about missing
> > GIC mask and was unable to bring up secondary CPU:
> >=20
> >     [    0.000000] NR_IRQS:16 nr_irqs:16 16
> >     [    0.000000] GIC CPU mask not found - kernel will fail to boot.
> >     ...
> >     [    0.400492] smp: Bringing up secondary CPUs ...
> >     [    1.413184] CPU1: failed to boot: -110
> >     [    1.423981] smp: Brought up 1 node, 1 CPU
> >=20
> > In its instance_init() call, the Exynos GIC driver was setting GIC
> > memory mappings for each CPU, from 1 up to "num-cpu" property.  The
> > Exynos4210 machine init call on the other hand, first created Exynos GIC
> > device and then set the "num-cpu" property which was too late.  The init
> > already happened with default "num-cpu" value of 1 thus GIC mappings
> > were created only for the first CPU.
> >=20
> > Split the Exynos GIC init code into realize function so the code will
> > see updated "num-cpu" property.  This fixes the warning and brings
> > second CPU:
> >     [    0.435780] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
> >     [    0.451838] smp: Brought up 1 node, 2 CPUs
> >=20
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Beside bringing secondary CPU, this patch fixes also Software Generated
Interrupts. Without it, none of the SGIs are coming (except CPU wakeup):
  IPI0: =C2=A0 =C2=A0 =C2=A0 6281 =C2=A0CPU wakeup interrupts
  IPI1: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0Timer broadcast interrupts
  IPI2: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0Rescheduling interrupts
  IPI3: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0Function call interrupts
  IPI4: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0CPU stop interrupts
  IPI5: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0IRQ work interrupts
  IPI6: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0completion interrupts

This is pretty annoying because lack of SGIs means lack of IPIs thus for
example IRQ work cannot be executed. Without IRQ work, the kernel hangs
on power down on cpufreq shutdown because in cpufreq_dbs_governor_stop()
there is irq_work_sync() but none of irq_work interrupts were handled.

I still did not solve the issue with cpuidle (AFTR). I am trying to
implement CPU power off (needed for AFTR) but it is one-way so far (no
wakeup). Anyway the workaround is to just disable cpuidle.

Overall, what is the status of this patch? Should I resend? I can also
extend the commit description with paragraph about SGI/IPI.

Best regards,
Krzysztof

