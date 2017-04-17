Received: by 10.25.0.144 with SMTP id 138csp1119847lfa;
        Sun, 16 Apr 2017 20:44:38 -0700 (PDT)
X-Received: by 10.200.53.156 with SMTP id k28mr7338662qtb.202.1492400678378;
        Sun, 16 Apr 2017 20:44:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m33si9676536qtd.94.2017.04.16.20.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Apr 2017 20:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34665 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1czxaf-00086I-TV
	for alex.bennee@linaro.org; Sun, 16 Apr 2017 23:44:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxaZ-00085J-B8
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:44:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxaY-0003Fl-DG
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:44:31 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34617)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxaU-0003FB-29; Sun, 16 Apr 2017 23:44:26 -0400
Received: by mail-qt0-x244.google.com with SMTP id y33so3230121qta.1;
	Sun, 16 Apr 2017 20:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=xfNCoYC7qwitey0gwZO1RyZ38X46/FOPpgLFVwD+wSU=;
	b=u9O6bMKIxbuiotEC/TMWqvhAW1Oe0qzN5SqU62xSsr+XvcifQiUJZqXJ7cOV8BSbtB
	KVWF/yo9Y4bDFtmzVK8zi5p0oE682Hgb5vDoHgXE90lVj9d4jaukp1bOIcl1wXQCIAj6
	jJZ0ylMmQ8aj75/XZAomXzJ/+C6/Zi0/oV3cq+KHk0yC9f73b1HabluOrfABz95R4qGE
	YX5B5jPt9t4TydmMWLnKAr6Hv2lD7aHMt5O4Y7OGqTjt+CCzxJ68b706X0gGMjp60/MT
	4SF03QMcES/eOD+jfz+KYWUeJhSCAt1IrstZ+6ZvKW2S+6HO5OaDQz2j4OOU6/3U1gcT
	kpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=xfNCoYC7qwitey0gwZO1RyZ38X46/FOPpgLFVwD+wSU=;
	b=nZMzRgnqCRX47jlUvzS2vvDGjSogD6tkvv4+4rH3v6QkJv8wYJk+pm638dpZc6vJVC
	X/GVEV1ZgrdmaCqkKcMAlTaCMfh5OZxiZd/+ZIaUdCuFlIoIBk7kEcZ3JLm4bopD8aCF
	IMAsYoanDfIHDcKA7MzcjPjrkZrDyyhw7PKuzXqvcXAV+JZdK5JpZxizF4SG/N1RSlO1
	d9LY+HyKbWbAAVHd2w3As0D93plBXXtW/gCbh288/eqe6fBVhWGvgG7WU6niTq6QUDi9
	LGFFOlObjkSbBnnn2PBcUygRb9+Y4R+k8iISh+Nbzq+BahYEiNogNMLpK4R/P9FNlfmj
	nySQ==
X-Gm-Message-State: AN3rC/5W+x26ez6lrYQWK38inlPt+Vfw4RWwL/xMLaWqJDiSFeggJa11
	p5F6IiuPmZJobQ==
X-Received: by 10.200.46.239 with SMTP id i44mr8051257qta.261.1492400665144;
	Sun, 16 Apr 2017 20:44:25 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	y196sm6402974qkb.0.2017.04.16.20.44.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Apr 2017 20:44:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
	<1487262963-11519-9-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7d200ef8-b4d7-f7e4-c0af-f0f741ff7a0f@amsat.org>
Date: Mon, 17 Apr 2017 00:44:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1487262963-11519-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH v2 08/13] armv7m: Simpler and faster
 exception start
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
X-TUID: k0sj3fdKJR+l

On 02/16/2017 01:35 PM, Peter Maydell wrote:
> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> All the places in armv7m_cpu_do_interrupt() which pend an
> exception in the NVIC are doing so for synchronous
> exceptions. We know that we will always take some
> exception in this case, so we can just acknowledge it
> immediately, rather than returning and then immediately
> being called again because the NVIC has raised its outbound
> IRQ line.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: tweaked commit message; added DEBUG to the set of
> exceptions we handle immediately, since it is synchronous
> when it results from the BKPT instruction]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 050d8df..1844852 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6109,22 +6109,22 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>      case EXCP_UDEF:
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>          env->v7m.cfsr |= R_V7M_CFSR_UNDEFINSTR_MASK;
> -        return;
> +        break;
>      case EXCP_NOCP:
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>          env->v7m.cfsr |= R_V7M_CFSR_NOCP_MASK;
> -        return;
> +        break;
>      case EXCP_SWI:
>          /* The PC already points to the next instruction.  */
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC);
> -        return;
> +        break;
>      case EXCP_PREFETCH_ABORT:
>      case EXCP_DATA_ABORT:
>          /* TODO: if we implemented the MPU registers, this is where we
>           * should set the MMFAR, etc from exception.fsr and exception.vaddress.
>           */
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
> -        return;
> +        break;
>      case EXCP_BKPT:
>          if (semihosting_enabled()) {
>              int nr;
> @@ -6139,9 +6139,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>              }
>          }
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG);
> -        return;
> +        break;
>      case EXCP_IRQ:
> -        armv7m_nvic_acknowledge_irq(env->nvic);
>          break;
>      case EXCP_EXCEPTION_EXIT:
>          do_v7m_exception_exit(env);
> @@ -6151,6 +6150,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          return; /* Never happens.  Keep compiler happy.  */
>      }
>
> +    armv7m_nvic_acknowledge_irq(env->nvic);
> +
> +    qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
> +
>      /* Align stack pointer if the guest wants that */
>      if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
>          env->regs[13] -= 4;
>
