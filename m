Received: by 10.25.205.13 with SMTP id d13csp507144lfg;
        Tue, 17 Jan 2017 05:52:44 -0800 (PST)
X-Received: by 10.55.198.129 with SMTP id s1mr38021347qkl.268.1484661164181;
        Tue, 17 Jan 2017 05:52:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o16si16619600qto.270.2017.01.17.05.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 05:52:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTUBl-0006ZN-HM
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 08:52:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTU8e-0004Eg-VX
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 08:49:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cTU8e-0003bT-Bt
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 08:49:29 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33675)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cTU8e-0003ai-8D
	for qemu-arm@nongnu.org; Tue, 17 Jan 2017 08:49:28 -0500
Received: by mail-vk0-x22c.google.com with SMTP id k127so46798891vke.0
	for <qemu-arm@nongnu.org>; Tue, 17 Jan 2017 05:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qmuku8cyui285obZM/cpZuHNqrZcO+6wfag5wi815sE=;
	b=eOu/UPw8SZHnBPK7yCD8H4xNYpWO748WBQLdZ2sLowrkLfM2tEC31Zw79ZgKb/BRuN
	aeQAK0envvE1+ViDwfQtS5r7/hEFtM5rhwhQ6+cF2rVhy9NodMIqShNHUe9E5QZ1n0+d
	WknSzcLB81FUJO5D1a76MBBrnP/V4/aHLzBVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qmuku8cyui285obZM/cpZuHNqrZcO+6wfag5wi815sE=;
	b=MJIZ8itDIpmXgY+n815IZAZg25jH7FCLRpK8OxBnxY/Mb12y0SUNq+/J3jNF+8o6uy
	WXq5/ReKht/q6+X9sab241TMM/4Q/HC8w7zb/6LvGHAnzfCtkpgUeU3c9x00N1tK2Lz/
	D4Uq4lrCuLXCEiFW8sS5V+HTxUUmM50c0tQbRbqv6JzN8SjDLnfGneHPfA2wIcfKfqqx
	2FpDFaZ0f7VPZ6wSxdrR8JvtliCw22xpn8mT1PNXAdV2Oi6H/eD465Om45x99uVTTYxT
	xEQFYpBbEtvBs8pIyzqNCClyixzkWryghUrzwgaNc18Il512+FrIeUYlvNVqt109eQqC
	rKGw==
X-Gm-Message-State: AIkVDXKGTV8lJabcLNk5WIgdo/aoVuXlb/MX2ORkKPCQta/o8HVy7GgJ4fnXD2RN7XM2oMq/w4so0B7MyTpCWIAv
X-Received: by 10.31.28.193 with SMTP id c184mr17826431vkc.173.1484660967553; 
	Tue, 17 Jan 2017 05:49:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 17 Jan 2017 05:49:07 -0800 (PST)
In-Reply-To: <1484204658-28058-5-git-send-email-wei@redhat.com>
References: <1484204658-28058-1-git-send-email-wei@redhat.com>
	<1484204658-28058-5-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2017 13:49:07 +0000
Message-ID: <CAFEAcA8Scivg0rd9+vUpXAuT-NDAwsD92pn9X9jxm5rNw49Jpw@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [PATCH V1 4/4] target-arm: Hook up TCG vPMU with CPU
 pmu option
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
X-TUID: 6IlUEfdap21W

On 12 January 2017 at 07:04, Wei Huang <wei@redhat.com> wrote:
> Remove the checking of kvm_enabled(). With this, .pmu option can also
> control vPMU under TCG mode.
>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  target/arm/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f5cb30a..2f87a4b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -692,7 +692,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->id_aa64pfr0 &= ~0xf000;
>      }
>
> -    if (!cpu->has_pmu || !kvm_enabled()) {
> +    if (!cpu->has_pmu) {
>          cpu->has_pmu = false;
>          unset_feature(env, ARM_FEATURE_PMU);
>      }

I notice that the ARM_FEATURE_PMU bit doesn't seem to control whether
we actually provide the TCG PMU registers, so this patch is OK but
doesn't actually change the behaviour of the emulated cpu AFAICT.

Don't we now need to remove the hack where we mask out the PMUVer field
of ID_AA64DFR1_EL1 ?

thanks
-- PMM
