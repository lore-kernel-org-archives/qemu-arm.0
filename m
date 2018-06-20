Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp989463wrq;
        Wed, 20 Jun 2018 09:56:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIoUabaWKjjf0ZRShrthoI4ixRwBi9drOoWSJqN0yxCuEZ7q28H/pkV96Gq4xMWefiYmpUt
X-Received: by 2002:a37:5105:: with SMTP id f5-v6mr17772357qkb.265.1529513812283;
        Wed, 20 Jun 2018 09:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529513812; cv=none;
        d=google.com; s=arc-20160816;
        b=HpPyW8Z1MxBPCbMBmlFkMMfu+CNYnQwOSo3pjkz+TuzrY4zgZv/EiexItxjRAoJLzc
         KVtkSGjjpHpJ+6fBJVsNw2d2V2sq7rdN+cUTxnwaDpIsls3W67SZdBCozBBPochziJGi
         f4azqFRtbli9HtJBsZUpTFAf64p7Q/IYeThwEeXCkPnng/HX/Lt1qo3AVoLnAdYjjVMY
         U24rVrENKxbefu10pDsVEltQMaBy+UDU/MmuI6lCV4QWyj529dE2N1liipmDMU65qS/8
         08Rb/gp1LUuBRtyV2N78EagrddnM8CGwFpJtoXPtElBzEDJ80iz45WgbBYW/j/TpfP3q
         cnHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gHFcNQ4fDvHX3vncPRi18R+Fm/tfRX2/sZzCl7h4NfA=;
        b=VDd5qPFCKSIg7LarnLeQt62sIj9cZECyzOijrZSfsLIpNw7YdVg5vsJJloMdZILyAb
         fa5O2Qo9NWgLZSHtwMqX8Vh1Q8QfQpBtwGf9mgmaRykFIECXkn061j8sayOm6zT3dgr6
         uyBgSINIdEQC+NIlIDTgntn0b7YXna+GAFyc5eqB7aILr/WO9otrhqGJOqby4i/vL+7M
         I/kXxSv7cM+VPP5eLPYaL9lEk/ASi+Bho2Ug5900plpb4sxuWLnnll0gpEgyl0vY7AXz
         CG6FsII4WL2Km3xbJ/QayQkOrTctoFJBoz7tSs6lw6qfFIyKBCewwodX3+p42OIeNYSh
         VEDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hPPPofkx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 11-v6si2735829qkh.249.2018.06.20.09.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 09:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hPPPofkx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVgPb-000635-Oi
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 12:56:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVgPQ-00062b-Pd
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:56:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVgPN-0003vf-Fi
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:56:40 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:46007)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVgPN-0003v5-AY
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:56:37 -0400
Received: by mail-ot0-x243.google.com with SMTP id a5-v6so258667otf.12
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 09:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gHFcNQ4fDvHX3vncPRi18R+Fm/tfRX2/sZzCl7h4NfA=;
	b=hPPPofkxSjfsRGEZYykMLiTxbHShNCKOl27g7ubcoCP2MfZv0pRFYs7ec7jFxhcZ75
	qty+E79oxS8VnDFgrFErB+JrNnHT8h5omvd1Lnp6ilsjX0Ezj6ntXhCt0k7LWY9MstjE
	wjuipnsubotIjc4RNb400W4+b/eYtTC+sYsXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gHFcNQ4fDvHX3vncPRi18R+Fm/tfRX2/sZzCl7h4NfA=;
	b=uCV0ZhVbUv3d5aTtkaHl63WGeSxT6WQO2iNY/2Ov1v8EoLJ/SIG4qzQPfvZyUgA3vq
	beY0DSOwCWs3/WOKVDtRviSnNWugNISrR1pQnyPztGz7WCL+/SPrUa0e3pchxm/N3Tmr
	iZ7jqcCoI7i292J1+ca4ZV93ncWoBg51ao0Ee/1lsbfoNU+69BpUAWW9VObdkYCq/wxi
	yao9m/LzYPMhDmvocar8TmEgh7lSY7Zk/K0QFmYyWB//9BBvx0n9gT3gw3tb5Texiw/1
	V7DLmrGGwEuAxem0Y4SGOtqKRYZ0XlA/OYdskpvz+HoL6pWJEf6ChCaWz4fck8FeZUHR
	mRZg==
X-Gm-Message-State: APt69E0o3cyFMRqPZcfOJUuWvti49UUVwjs2nwXvZeYFNBcOJiBMCTZ4
	7B7Ngkk/okE6A9EGXKs10Wg0UYC3zZzG8ruU8ItRRA==
X-Received: by 2002:a9d:2909:: with SMTP id
	d9-v6mr12695344otb.258.1529513796421; 
	Wed, 20 Jun 2018 09:56:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 09:56:16
	-0700 (PDT)
In-Reply-To: <1528403460-30526-3-git-send-email-gengdongjiu@huawei.com>
References: <1528403460-30526-1-git-send-email-gengdongjiu@huawei.com>
	<1528403460-30526-3-git-send-email-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 17:56:16 +0100
Message-ID: <CAFEAcA_k_-6LuMw_Av9sAvkBeb7OvvZnsppd=1aF6RYydOH=YQ@mail.gmail.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v3 RFC 2/2] target: arm: Add support for VCPU
 event states
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
Cc: qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RjYv1vU646x3

On 7 June 2018 at 21:31, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> This patch extends the qemu-kvm state sync logic with support for
> KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
> And also it can support the exception state migration.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  target/arm/cpu.h     |  5 ++++
>  target/arm/kvm64.c   | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/machine.c |  3 +++
>  3 files changed, 72 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8488273..b3d6682 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -645,6 +645,11 @@ typedef struct CPUARMState {
>      const struct arm_boot_info *boot_info;
>      /* Store GICv3CPUState to access from this struct */
>      void *gicv3state;
> +    struct {
> +        uint32_t pending;
> +        uint32_t has_esr;
> +        uint64_t esr;
> +    } serror;

What is this state? That is, what guest CPU architectural state
is it supposed to correspond to?

> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 2e28d08..5a359f4 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -695,6 +695,9 @@ const VMStateDescription vmstate_arm_cpu = {
>          VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
>          VMSTATE_UINT32(env.exception.fsr, ARMCPU),
>          VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
> +        VMSTATE_UINT32(env.serror.pending, ARMCPU),
> +        VMSTATE_UINT32(env.serror.has_esr, ARMCPU),
> +        VMSTATE_UINT64(env.serror.esr, ARMCPU),
>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
>          {

You can't just add fields like this, as it breaks migration
compatibility. If these need to be migrated then you need a
new subsection with a suitable 'needed' function controlling
whether it is present. But we should determine first
whether this really is new guest CPU state...

thanks
-- PMM
