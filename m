Received: by 10.25.21.156 with SMTP id 28csp1201705lfv;
        Fri, 29 Jul 2016 00:58:26 -0700 (PDT)
X-Received: by 10.200.52.182 with SMTP id w51mr63681424qtb.90.1469779106828;
        Fri, 29 Jul 2016 00:58:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m184si11349463qkd.202.2016.07.29.00.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jul 2016 00:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bT2gc-0006mx-Bc
	for alex.bennee@linaro.org; Fri, 29 Jul 2016 03:58:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT2gY-0006mV-3w
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 03:58:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT2gW-0006Ck-5b
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 03:58:21 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:35234)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT2gV-0006CZ-QP
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 03:58:20 -0400
Received: by mail-ua0-x22f.google.com with SMTP id l32so56715644ual.2
	for <qemu-arm@nongnu.org>; Fri, 29 Jul 2016 00:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6bNEjfUS/Wq0nrCgHy1ThXRndjukud7O9cz4BcJz8wQ=;
	b=XBIAG/J6HWxzPeUqQJV04xrbz0Q/0cTaWCF/H51bJgs2Fp6EhZAdg8VRCBSm3/i3rx
	vi7stFqOpFU+ygQVLFXxmLsSXHxPnyP2dJJ5iQBrpNOvIuS1UqpJnciyPvHGisxPHLNZ
	nhrSs3/8HuEHNMIzY24TIrvYk+SikxkfWbyrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6bNEjfUS/Wq0nrCgHy1ThXRndjukud7O9cz4BcJz8wQ=;
	b=a2jWKi6Ji3wpHl/U2zTlDz5q62dAOCFTNUA4X5MGoal0I25fvQjBKdpumgai69HG6z
	m8HbrR2g7uCn3QhxFjbr01P6w5UfzyiVVXF7BG5SbVQFX/Z2phLNnviDpNUP2jWbKhzp
	RU/77nW0Pl1m6FYrDc+T9mb3fjKq6rkbMa33P57SmjD2tHaCFwLdTxqAEfmi8IoSenxa
	vYdn15IfQg8u73qLCFef7XaEUG9jNvMJZWIL/vDoH3nzUgI0dYzqjhzpVYDzkHcc1mfY
	YRCjgY0T7olH6ZX2/uaeurTq5aptkMGOUoL3b9IUjzTw1xODMKOKJj+N1FAtrR/y3QMj
	EF0g==
X-Gm-Message-State: AEkoouvrdDkm5XwuzIaDo0amLaebFgVPLvig8Di0pKzfQkO4htP1hdHN8t65yNitGmc6yr3n/3fJ+x99XPf0PqLT
X-Received: by 10.176.69.180 with SMTP id u49mr17612912uau.24.1469779098307;
	Fri, 29 Jul 2016 00:58:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Fri, 29 Jul 2016 00:57:58 -0700 (PDT)
In-Reply-To: <1469723896-28049-1-git-send-email-wei@redhat.com>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2016 08:57:58 +0100
Message-ID: <CAFEAcA_x+4KesFxPfc-B=m1BF0f-yfVg=xYQLNE-XJUiXNFh=A@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-arm] [PATCH RFC 1/1] arm64: add an option to turn on/off
 vpmu support
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FnOk64zuZkOZ

On 28 July 2016 at 17:38, Wei Huang <wei@redhat.com> wrote:
> This patch adds a pmu=[on/off] option to enable/disable vpmu support
> in guest vm. There are several reasons to justify this option. First
> vpmu can be problematic for cross-migration between different SoC as
> perf counters is architecture-dependent. It is more flexible to
> have an option to turn it on/off. Secondly it matches the -cpu pmu
> option in libivrt. This patch has been tested on both DT/ACPI modes.


What particular two systems are you trying to migrate between?
In general we don't support migrating between different CPU
types at the moment, so the PMU sholud be the same on both ends.

(If we ever do get to supporting cross-cpu-type migration
then it will probably involve a very long and detailed command
line to specify exactly a whole lot of things like pmu yes/no,
number of hw breakpoints/watchpoints, and everything else that
can differ between implementations.)

That said, I don't have any objection to making the PMU
presence controllable (especially if we have similar
control on x86).

> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -579,8 +579,9 @@ struct ARMCPU {
>      bool powered_off;
>      /* CPU has security extension */
>      bool has_el3;
> -    /* CPU has PMU (Performance Monitor Unit) */
> -    bool has_pmu;
> +
> +    /* CPU has vPMU (Performance Monitor Unit) support */
> +    bool enable_pmu;

Why rename the flag? has_foo is what we use for other features,
as you can see in the context of this bit of the patch.

>
>      /* CPU has memory protection unit */
>      bool has_mpu;

thanks
-- PMM
