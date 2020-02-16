Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4009095lfp;
        Sun, 16 Feb 2020 04:35:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqxKm2ARQ98+S15xEs/IToovI8x9Llb7JBmtqse8Fyg5Pf+vXmxD0uyt8QZyBXzSnceNQUxS
X-Received: by 2002:aed:3b14:: with SMTP id p20mr9662497qte.176.1581856507234;
        Sun, 16 Feb 2020 04:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581856507; cv=none;
        d=google.com; s=arc-20160816;
        b=fd/hfbpv4/XsGqAobT0gJeOi8BNp5bxmXDVVdj/deBupyT9hXdIPIB2BJXKtbuHy6M
         g2EeT7tcK4kDu0/Ggxr0kvwn4kgtiD4sYKu+aqRCYMvICRdL6R/PPkjCW/GXmoe8E/nJ
         385lsQKho75dE3XGcf+ysphHmMFCrqGPmvS2zcWvFkZMESgy/cuB7CfDjnfssLpBvSPf
         5fhIsIWObzllM/32fKkxsZ6RyP71MqpP3MIKfNUT1fP11B2fWoIdMn5P7Alka8E/YUCe
         WZFYmUyYwkauCpQXTwbmjjFfAxGG7jbhbhEUKSmRb/PeTwag59Xb+zYYIexrFGmOAFpA
         ZI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:message-id
         :references:in-reply-to:subject:to:from:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=1wjyJsRMMAvxTwg6+Ridnc4RS19yLD0QdkyUqT9InY8=;
        b=oXeFS+hq152ku6elhZaz0zqSWlv1IRyPQ6X1vKMCaiCGYir82HPQkHjq+tW0iLCk6C
         Hnu7v9PFoE65zIO/xf9Na+qIHBadohAQ2NgDT2hrMNSbeOFMZpcIF1+VNCNTKYkgx4AI
         6Wjs1rL4HqXthoAF29RQ6RywhiEOkG20trGm89PFRiVU7AfWm/l/FWQBb6iI1KQBMqfz
         rbPNP1IouLAPt+zlrTqYxCSZjDBPfuXFQPNemoPx2zlU/vMpW8fG4/brTsCjQ+Ff1xR2
         81kMYwbgKyjdI5omAYT9ACW5ZOfK5jsjjr6IDVXLkdqM3dd+uG2fsvayrsHOv+ymDrpv
         lMUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=NwQDR9xp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si5567622qka.332.2020.02.16.04.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 04:35:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=NwQDR9xp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:60344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3J8c-0008W2-HT
	for alex.bennee@linaro.org; Sun, 16 Feb 2020 07:35:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52448)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1j3J8P-0008Vq-Ba
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 07:34:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maz@kernel.org>) id 1j3J8O-0001wu-8E
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 07:34:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:33784)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <maz@kernel.org>)
 id 1j3J8O-0001wJ-2d; Sun, 16 Feb 2020 07:34:52 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3771D2086A;
 Sun, 16 Feb 2020 12:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581856490;
 bh=dUVIWuUXkZXPeVyYS8JoGpyzM/AfnGwDwd9B1oozeCs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NwQDR9xpWb/g1pohzbOU2Tsu3zp7noSyaG4Z+uSJF6pPe+eWssbSwQ0OtWy6oKxkU
 jN1QfM1/tGZWGDiues9HTlRh3gTbIQjXHHDj6DwDlPbHju2M0Q903VBBqBPz+IqR3S
 GybHhU00BYY63oz6BCi3SZ5l/30DDpdCeXZ0hrZQ=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1j3J8J-005et3-WE; Sun, 16 Feb 2020 12:34:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sun, 16 Feb 2020 12:34:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 1/2] target/arm: Support SError injection
In-Reply-To: <20200214055950.62477-2-gshan@redhat.com>
References: <20200214055950.62477-1-gshan@redhat.com>
 <20200214055950.62477-2-gshan@redhat.com>
Message-ID: <27b9c2a363d69911c003fcbaed958a5a@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: gshan@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, pbonzini@redhat.com,
 drjones@redhat.com, jthierry@redhat.com, eric.auger@redhat.com, aik@ozlabs.ru,
 shan.gavin@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 198.145.29.99
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, jthierry@redhat.com,
 aik@ozlabs.ru, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dTGQJwF4MUWa

Hi Gavin,

On 2020-02-14 05:59, Gavin Shan wrote:
> This supports SError injection, which will be used by "virt" board to
> simulating the behavior of NMI injection in next patch. As Peter 
> Maydell
> suggested, this adds a new interrupt (ARM_CPU_SERROR), which is 
> parallel
> to CPU_INTERRUPT_HARD. The backend depends on if kvm is enabled or not.
> kvm_vcpu_ioctl(cpu, KVM_SET_VCPU_EVENTS) is leveraged to inject SError
> or data abort to guest. When TCG is enabled, the behavior is simulated
> by injecting SError and data abort to guest.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  target/arm/cpu.c      | 69 +++++++++++++++++++++++++++++++++++--------
>  target/arm/cpu.h      | 17 ++++++-----
>  target/arm/helper.c   |  6 ++++
>  target/arm/m_helper.c |  8 +++++
>  4 files changed, 81 insertions(+), 19 deletions(-)
> 

[...]

> @@ -656,7 +682,8 @@ static void arm_cpu_set_irq(void *opaque, int irq,
> int level)
>          [ARM_CPU_IRQ] = CPU_INTERRUPT_HARD,
>          [ARM_CPU_FIQ] = CPU_INTERRUPT_FIQ,
>          [ARM_CPU_VIRQ] = CPU_INTERRUPT_VIRQ,
> -        [ARM_CPU_VFIQ] = CPU_INTERRUPT_VFIQ
> +        [ARM_CPU_VFIQ] = CPU_INTERRUPT_VFIQ,
> +        [ARM_CPU_SERROR] = CPU_INTERRUPT_SERROR,

I'm a bit concerned with this. It makes sense for a host, but doesn't
allow the SError signal to be virtualised (there should be a VSError
signal in this list that can be injected via HCR_EL2.VA, just like
VIRQ is injected by HCR_EL2.VI).

Given that people use QEMU as a development platform for hypervisors,
I'd really like this functionality to be supported from day-1.

There is also the whole RAS stuff which quite a lot of work, but let's
start at least with the full ARMv8.0 semantics.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
