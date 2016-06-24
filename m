Received: by 10.25.21.96 with SMTP id l93csp1158106lfi;
        Fri, 24 Jun 2016 10:27:47 -0700 (PDT)
X-Received: by 10.55.176.130 with SMTP id z124mr6397599qke.55.1466789267252;
        Fri, 24 Jun 2016 10:27:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u24si5609337qki.197.2016.06.24.10.27.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 10:27:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGUtO-0003Hd-NN
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 13:27:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGUtL-0003BN-FX
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 13:27:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGUtJ-000659-D4
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 13:27:42 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:34575)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGUtI-00064z-R7
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 13:27:41 -0400
Received: by mail-vk0-x231.google.com with SMTP id c2so129423063vkg.1
	for <qemu-arm@nongnu.org>; Fri, 24 Jun 2016 10:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TQpLCfq+QN+DWH6yVtyeO/t7uL/LjOnurLBdLe/NaL4=;
	b=GJ74hg/Bk/qBkyRbJFQf+Q2yjq0uMCKeiXmB/JJaUN1ydhbDbHanen7GhnntQTsTMK
	W1Rk30vFnqlvWj9qZvKaWIrMnd8/A0yzXkcQPQhTceNVvXe5IcGD15KOlv03ja+P0h5h
	7T5Jqa78FaPsXAizq6t7gdGjh2oaLiNbQHwb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TQpLCfq+QN+DWH6yVtyeO/t7uL/LjOnurLBdLe/NaL4=;
	b=J7gUaAj0uJaHhJNgaPSenSHrcdeE0ufOeLAwSvXtj+PTsCVHWDK4pZAOPQuMfVW6gq
	SKZ4Gn+ER4VN2GeHK5dTfdTJOiBRW9fnhAmqrGWyHQsLQ2lc48r7ySshprMKc+P8EzZw
	yJJ5kD9KO+MQxjNZ5X8OGAZGfT62FgqCwQN92Jk+2OwJA82JiCn8GRxs9aGPhD+2s92b
	IasP0AUTKMiwN6AxMcEe8Ho5EKBe+5kssI1zvj0BCzuTaaA9QfJYn7GkTOgCrTNVcnok
	EJF0dQOoOErgn9mzW8e4EeUPuwrbI6pvx6IhJ1ghqjgpY75zU91NmsHvJrJUnvy/8Doy
	LQKg==
X-Gm-Message-State: ALyK8tI1UfbkU4faN6MkFujC+0+8GYiIGaCs+zmFQ72mQ+Z+JC44cJNkiAfmt3FQFwrvbrAlycN8ujZVo0zpZ9O/
X-Received: by 10.176.0.145 with SMTP id 17mr3113262uaj.103.1466789260388;
	Fri, 24 Jun 2016 10:27:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 24 Jun 2016 10:27:20 -0700 (PDT)
In-Reply-To: <20160624172223.gxbd7nsna6spflxt@hawk.localdomain>
References: <1466535515-18092-1-git-send-email-drjones@redhat.com>
	<CAFEAcA-56LUe_jYK=V-H890WVL12YuDeRSZn9FK3yReiJ4p2Hw@mail.gmail.com>
	<20160624160321.nvn5run4kmywk7kc@hawk.localdomain>
	<20160624161513.zgqxspxhdre3d67c@hawk.localdomain>
	<CAFEAcA8xQV3PJ7BgFa=ohYDGqyVEtQ9bssoB+0JkGaGJqtaK=w@mail.gmail.com>
	<20160624172223.gxbd7nsna6spflxt@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 18:27:20 +0100
Message-ID: <CAFEAcA9o57GET+mWOfrVhdRo=5a1w-AJeRPwssmJG1BcD4Ag8Q@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: gicv3: use all
 target-list bits
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
X-TUID: UN/RdScpLgs5

On 24 June 2016 at 18:22, Andrew Jones <drjones@redhat.com> wrote:
> On Fri, Jun 24, 2016 at 05:41:55PM +0100, Peter Maydell wrote:
>> KVM AArch32 is 4 CPUs per cluster:
>> http://lxr.free-electrons.com/source/arch/arm/kvm/coproc.c#L109
>
> Hmm... yes, it should use coproc.c, but here's what I get when I
> test
>
> qemu-system-aarch64 \
>   -machine virt,gic-version=2,accel=kvm \
>   -cpu host,aarch64=off \
>   -device virtio-serial-device \
>   -device virtconsole,chardev=ctd \
>   -chardev testdev,id=ctd \
>   -display none -serial stdio \
>   -kernel arm/selftest.flat \
>   -append smp -smp 8

This suggests that 32-bit-guest-on-64-bit-host and
32-bit-guest-on-32-bit-host differ...

thanks
-- PMM
