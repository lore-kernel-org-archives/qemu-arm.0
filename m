Received: by 10.25.0.144 with SMTP id 138csp1119546lfa;
        Sun, 16 Apr 2017 20:42:56 -0700 (PDT)
X-Received: by 10.200.34.39 with SMTP id o36mr8066333qto.189.1492400576064;
        Sun, 16 Apr 2017 20:42:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x26si9657669qtc.283.2017.04.16.20.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Apr 2017 20:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1czxZ1-0007T0-Hc
	for alex.bennee@linaro.org; Sun, 16 Apr 2017 23:42:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxYu-0007RJ-4B
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:42:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxYt-0002St-5V
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:42:48 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxYo-0002PT-Lg; Sun, 16 Apr 2017 23:42:42 -0400
Received: by mail-qt0-x242.google.com with SMTP id c45so17308346qtb.0;
	Sun, 16 Apr 2017 20:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=/sebbqQ7Xi3VgPxPGQy6MBz89uaQqG8VlhT83tPdn0E=;
	b=qoI/rmumaLjE/Xgx+yrctc9D9EjY6dgSPMxFCJgS6QykxySmLGjNOQOzxcJc7WS5Cf
	/84iGE5E0opGxl0WCx+XBfeGHIQXsyY9WE6+vtZv/LR9/7J5mOJCE7gS8zcs4n7pC7Ey
	PoOA+Ryhae29zvjFOxwUrB8zqWu6kfcTriAqxFBDjEp3338kjLTWJFIUy32/LAGPWLVz
	iOPTaw1xOvVoR2lXvnQd7sc18CWOnuMZXhaxEuZaV4gXF1gx48LP44tz+spx3FXkTo60
	ce6JmYoL2ZMfOiHGpxxw6cIqdiSBV7QWushnkZhe7qz4HlnM0JjVCtpS77zmDvwEu2EC
	ULdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=/sebbqQ7Xi3VgPxPGQy6MBz89uaQqG8VlhT83tPdn0E=;
	b=F099EIC5Uz9qYkNoJYxdEV6nFnqyPmati664bzw7RqaiaGSVmI3Vdfx59/8UMLx6jR
	bg3mleHbQkT9L8CJJtzbi792b1RR+3tFZ10LT6p13m6XXr0HIvjqIoymdrgkEJBcY7Sr
	hVh+Oodkv7fg0k9EJpv2tXx6NqMeNVDyplhIEQXC5vKnJ/Av2739PBV/rP9okgOcuqxP
	QwPFoPzn3FVOUeB2qhUSzQhHz+nPjcadlp/WuS7r5/dYayuaxZrPeGb3jlQkVJdx9TTQ
	GmfDvzyJV+N/O6AraiLSyOknEabG6NQy5L98nnCZOSZ7mQdr2BpdV+90ABxo6et74Yx5
	2vXA==
X-Gm-Message-State: AN3rC/7ff7xPlaD6/JRx3wnEn811T2KnqA+GjQ+pN2oyjQ/V7hNZLHKp
	Wlm6fFC4tXIt8g==
X-Received: by 10.237.47.164 with SMTP id m33mr7357693qtd.231.1492400562046;
	Sun, 16 Apr 2017 20:42:42 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	n195sm6393898qke.28.2017.04.16.20.42.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Apr 2017 20:42:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
	<1487262963-11519-8-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <11d3c186-205b-d917-4e4f-884656ee417b@amsat.org>
Date: Mon, 17 Apr 2017 00:42:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1487262963-11519-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH v2 07/13] armv7m: Remove unused
 armv7m_nvic_acknowledge_irq() return value
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: miAdS5mOivXw

On 02/16/2017 01:35 PM, Peter Maydell wrote:
> Having armv7m_nvic_acknowledge_irq() return the new value of
> env->v7m.exception and its one caller assign the return value
> back to env->v7m.exception is pointless. Just make the return
> type void instead.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.h      | 2 +-
>  hw/intc/armv7m_nvic.c | 4 +---
>  target/arm/helper.c   | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 53299fa..ab46c0c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1351,7 +1351,7 @@ static inline bool armv7m_nvic_can_take_pending_exception(void *opaque)
>  }
>  #endif
>  void armv7m_nvic_set_pending(void *opaque, int irq);
> -int armv7m_nvic_acknowledge_irq(void *opaque);
> +void armv7m_nvic_acknowledge_irq(void *opaque);
>  void armv7m_nvic_complete_irq(void *opaque, int irq);
>
>  /* Interface for defining coprocessor registers.
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index d9b9a43..010bf92 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -412,7 +412,7 @@ void armv7m_nvic_set_pending(void *opaque, int irq)
>  }
>
>  /* Make pending IRQ active.  */
> -int armv7m_nvic_acknowledge_irq(void *opaque)
> +void armv7m_nvic_acknowledge_irq(void *opaque)
>  {
>      NVICState *s = (NVICState *)opaque;
>      CPUARMState *env = &s->cpu->env;
> @@ -439,8 +439,6 @@ int armv7m_nvic_acknowledge_irq(void *opaque)
>      env->v7m.exception = s->vectpending;
>
>      nvic_irq_update(s);
> -
> -    return env->v7m.exception;
>  }
>
>  void armv7m_nvic_complete_irq(void *opaque, int irq)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index bac1718..050d8df 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6141,7 +6141,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG);
>          return;
>      case EXCP_IRQ:
> -        env->v7m.exception = armv7m_nvic_acknowledge_irq(env->nvic);
> +        armv7m_nvic_acknowledge_irq(env->nvic);
>          break;
>      case EXCP_EXCEPTION_EXIT:
>          do_v7m_exception_exit(env);
>
