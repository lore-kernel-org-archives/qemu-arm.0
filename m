Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp480425wrw;
        Fri, 16 Nov 2018 06:54:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5dzqtlHvZ0QBpeS09LEtAwtwz7wyU1USMsktQ/wLDg9PeMAaGdHrPgo+2PLkSWvzs+kG+xP
X-Received: by 2002:ac8:3437:: with SMTP id u52mr10070776qtb.237.1542380041415;
        Fri, 16 Nov 2018 06:54:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542380041; cv=none;
        d=google.com; s=arc-20160816;
        b=cwKdueu6MCB0WlFhP7PLHwArEId2nfWXNRe8f5ZRpO8oXv9oRjVEMpkxqTq/pS+URF
         1e/QAUju9ks2vNZHUOR8QmzJhExFMXEAaxS3YO2xgp206GQrG7+aLu/WljA4ar9sdQJK
         ZYFTep2gn7YWfPsrtHIFiyzh7f6F/1KR8RfSwdOtWrR51tK/nMxOQe/HLY+4n3u/fl5l
         sMxlMGRZAe9Sodxm6C0xPPaflMKg+ymZrpQQmMhuDoFdRFhIPrX957/IQTs+AqYK0G9A
         FxLRMHecesNLm/2vh8vluN88dKVZQgPRt8e3uiR015yE8uwCidWBRUUctZgVb55ajHx0
         Wllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=htg5J+nhsfyy2EhYucYcuw1bDPSt0ZcFkCWHGQTPnuQ=;
        b=fiNDm87FjTOD/5eN3ddE7IN3CTUAy0Ym2rBUxRvO0338Zf73JPfo+w6ZeU2kfCYrNS
         OGt7NjrJixHz0Oom6OW0YjzdXW4lNvc8oMc052fAw3xBf34SyTzpowI05CHYl3r6ZzGC
         ZS9W/waAWzwp7OW+M60XubfZsQ8cPTLZDuqRzHnY+TPHgA6TsXci7moyBF+8ZXvzRzPJ
         HPC0nOd1TZgE2bkHxPY7SJx1YNfE+KVVMzESeyLeKgDbh56sAHvn/OgZqmdZp/I4Nhvc
         U93IhF1Efuh+/J9zQk5R9DX9pYWKZZiybqAb7HGSE83cUcZ3PiG9VMlOk8+Zzg4A0KhM
         pvaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XZbi4JsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t22si7826162qtq.46.2018.11.16.06.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 06:54:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XZbi4JsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNfVQ-0008Lq-Ow
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 09:54:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfVE-0008Ka-0S
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:53:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNfVC-0006lY-0l
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:53:47 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNfV8-0006fQ-8j
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 09:53:44 -0500
Received: by mail-oi1-x241.google.com with SMTP id h25so1507965oig.1
	for <qemu-arm@nongnu.org>; Fri, 16 Nov 2018 06:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=htg5J+nhsfyy2EhYucYcuw1bDPSt0ZcFkCWHGQTPnuQ=;
	b=XZbi4JsTcYix2MX3g6wZ+tHeN3Yk553u8isZNtE2V4rfXG6G+4MiuIshHFDjhSdaPY
	RQvojiujVZM1+g0TOPkouvegE7L1rsPBc1eJ/aVtXqjXbzwNfuHIGOvenuADLxGwaL0p
	GPXgkANFfHZDp0Q5mYb8bEsClM1nbCQuOmVtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=htg5J+nhsfyy2EhYucYcuw1bDPSt0ZcFkCWHGQTPnuQ=;
	b=V+iq8gB933xO3JmI3UuhuxtpOCPQ4e22Vx7DuyyFraQyEVa6y2y6A65b1nIFqeKLIx
	V/MrnDI2xLUVubNQdk+BWAePC+yc7da5ou0BoDFkKoZClvcLCEX41XU/LTrLuiNBGp0c
	2zT+lAV1+RzXGO2qlob5SnUDvTyBgP4iqTQTPb3zRiyr5jaxl++MTLsKdU/pA27MXTVZ
	C9ITkRddK1Q8UFhJC+PJUv9cK6GJC2D/sHcG7E/yotPeoplAD107H878M4ZhuKXeMKIK
	TBgnYJAPRe0rfb7GqatLHrV0+zh4mmVGaxF480lQUsRN5OqGm4U2hrhI4UuASWldUx98
	h0dQ==
X-Gm-Message-State: AGRZ1gIX1bwPgsu/zKzmLqf0V9YH//yTcPPmjGT0XlLPewH2hgluUG1m
	QU1i7o7i8amqMHZ+5rS9nFY/6kpeIKPwDbvBR9Csnw==
X-Received: by 2002:aca:fd12:: with SMTP id
	b18-v6mr1156995oii.337.1542380017471; 
	Fri, 16 Nov 2018 06:53:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 16 Nov 2018 06:53:16
	-0800 (PST)
In-Reply-To: <20181105185046.2802-4-aaron@os.amperecomputing.com>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-4-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Nov 2018 14:53:16 +0000
Message-ID: <CAFEAcA9va2QarkMFPWNMf43u_GRDoajM-=E0dwinVEgaqRgjHQ@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v7 03/12] target/arm: Swap PMU values
 before/after migrations
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F7gBtU7jpaf1

On 5 November 2018 at 18:51, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
> Because of the PMU's design, many register accesses have side effects
> which are inter-related, meaning that the normal method of saving CP
> registers can result in inconsistent state. These side-effects are
> largely handled in pmu_op_start/finish functions which can be called
> before and after the state is saved/restored. By doing this and adding
> raw read/write functions for the affected registers, we avoid
> migration-related inconsistencies.
>
> Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>

> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -604,6 +604,8 @@ static int cpu_pre_save(void *opaque)
>  {
>      ARMCPU *cpu = opaque;
>
> +    pmu_op_start(&cpu->env);
> +
>      if (kvm_enabled()) {
>          if (!write_kvmstate_to_list(cpu)) {
>              /* This should never fail */
> @@ -625,6 +627,20 @@ static int cpu_pre_save(void *opaque)
>      return 0;
>  }
>
> +static int cpu_post_save(void *opaque)
> +{
> +    ARMCPU *cpu = opaque;
> +    pmu_op_finish(&cpu->env);
> +    return 0;
> +}
> +
> +static int cpu_pre_load(void *opaque)
> +{
> +    ARMCPU *cpu = opaque;
> +    pmu_op_start(&cpu->env);
> +    return 0;
> +}
> +
>  static int cpu_post_load(void *opaque, int version_id)
>  {
>      ARMCPU *cpu = opaque;
> @@ -672,6 +688,8 @@ static int cpu_post_load(void *opaque, int version_id)
>      hw_breakpoint_update_all(cpu);
>      hw_watchpoint_update_all(cpu);
>
> +    pmu_op_finish(&cpu->env);
> +
>      return 0;
>  }

This will end up calling pmu_op_start() and pmu_op_finish()
even if the guest is running KVM and we're not using the
TCG code. Is that what you intended?

thanks
-- PMM
