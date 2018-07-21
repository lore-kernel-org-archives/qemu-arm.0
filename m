Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4080048wru;
        Sat, 21 Jul 2018 12:48:08 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfG3R627n6cC43ybLV8CjO4KNO+KoAG/oSkiloCo4x0vQO5FDsTWt4lottCVix6Wf0Mk3T5
X-Received: by 2002:a0c:a482:: with SMTP id x2-v6mr5982643qvx.76.1532202488534;
        Sat, 21 Jul 2018 12:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532202488; cv=none;
        d=google.com; s=arc-20160816;
        b=uY7OE+Nxngi+I43ykgYAzQ/B6kVCngXaFsMfMlFz+7nQmTA3KocgJ1gdt5VjpHxf4z
         ATuiWxODjhdCly68cWT9yrBEe8TWwaKTpH+0I1xHCt3Rs+Q4E34qc2RdAImwSi1udanX
         0t+r1IBvMvMfNAnCZyt6SMtuaTUQjNTOxD00DjkWE6Y1Yh3Ua9bYdd3vwWl+la1Srwrm
         Hj2xZggAwPgsAEMyibASsrapeo0oLAtW4NdmxCQBSslQppgWKCVQed36VCpkeaagLHcr
         pb6EZ12FJG9usPnztiTE414a+Z1FAYtVHRzSAtnh76XNxKNEiKjkwuQ4+P/zOFXJlOMD
         L6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=h22/mToY0eqMF4AdlRYCioDMoLL9gRmL0Y/wVpCFqDM=;
        b=Cmi1CMkqhuHUwoubISo5xVGmbh6QtbmkTE5KORCFWCUKCd/xIeVDEd0ePar3bupLmY
         eeRZlJlrBlib3kEeLd4ily2SyISWHVVetMO9UFmcyzd2RX2HWfZh+MIwV7ysh73XbmtC
         PS/ckfBtEPAS0kutPWGzP8WvsIO1JB44910RkJeCJomkgIdvpccUKyeKFFhCOouXhlsD
         X/D264A31+xbAcYemZZgXrP1tsDrxc5Kys9et5gQas4WtN+H2NA7NqPH0N3LRuK1DmSO
         VNnM4ljZahfJxpNhREzTXZs7OpfjUg5e8wczXtutuMW9oB3tO0iVI1E87reiK0DvIz3M
         AKLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XlaXLYXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7-v6si388672qkc.281.2018.07.21.12.48.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Jul 2018 12:48:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XlaXLYXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgxrM-0006cx-1G
	for alex.bennee@linaro.org; Sat, 21 Jul 2018 15:48:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fgxrC-0006bz-DS
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 15:47:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fgxrB-000567-7o
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 15:47:58 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33803)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fgxr4-00054q-GA; Sat, 21 Jul 2018 15:47:50 -0400
Received: by mail-vk0-x22a.google.com with SMTP id l143-v6so7578056vke.1;
	Sat, 21 Jul 2018 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=h22/mToY0eqMF4AdlRYCioDMoLL9gRmL0Y/wVpCFqDM=;
	b=XlaXLYXlq7mJbxGICyREsHfdoRd1JGb4Vqh7M6LuWihi+Lp5hNYtPxiGJLc7wmCEki
	hnibLiciYIyTOxHiLfcj6efGMPxGnGINzIK9fZyTypNDPVIfq5/HQrW8YqeosrCh3z/f
	ZFFGli+qVdod5alWUn4bKF0eRqU9ODymqgQ2Kx3FRWVf6WJONF14RnYjkcW80NhUQOXo
	DhSkBz6COPmRiV4DhfAblqFRI4YvCYioGnW+L+zP9aBuJP0B1SG+/6V1rkzqxpfWguwH
	4bKFdkrRdnr7uWl68z4iXopnxQVUEuKBBLQc7ayG1aus8F2DCT5/FEV0vkIxts5m4/Yz
	NWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=h22/mToY0eqMF4AdlRYCioDMoLL9gRmL0Y/wVpCFqDM=;
	b=t3QuwS3KITpejugGz8WKb4w7g11tAMvQ21tq0FYH3DGVxcFVi8/PVrgouekVdET1Nb
	sYjs8BMo3F/m3asiXNHsiidhmDJvuGIfisDWbttPHkk4RCKqlr+GmgA91xKKfLZjf8B5
	pH/tTmlrTuNlKQXYwg+XgvjfC/Wzz3Ff/1lT6uSvZjQcQXJodiULQ/OCqHNv0VtbUMOa
	XoACOZPzxYdlz/ZPpaB+c02QjLY2GQ6xH4GXWBg+lhUX7VaJjIeRXnGXuT/EMptG8gb1
	AJj78xOofdMO076fugPj56D/4CtLBov7kK6yk5kuvit8bGbacJy8YGNfs8AEBwBTb1kf
	XEvg==
X-Gm-Message-State: AOUpUlEBtlMhoaw2zFHQNPahCm2xpEaCkZKKqwZPxIG0uPRdo+1NZLe/
	uiyhYOW8beja33P4lw7o6qI=
X-Received: by 2002:a1f:4482:: with SMTP id
	r124-v6mr4186306vka.93.1532202469551; 
	Sat, 21 Jul 2018 12:47:49 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	11-v6sm1631819vki.55.2018.07.21.12.47.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jul 2018 12:47:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180720145647.8810-1-peter.maydell@linaro.org>
	<20180720145647.8810-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <2c98b143-8b32-6095-3e6d-8987f8473e5c@amsat.org>
Date: Sat, 21 Jul 2018 16:47:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180720145647.8810-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-arm] [PATCH 1/4] target/arm: Improve exception-taken
 logging
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
X-TUID: 0rPMUxz314D2

On 07/20/2018 11:56 AM, Peter Maydell wrote:
> Improve the exception-taken logging by logging in
> v7m_exception_taken() the exception we're going to take
> and whether it is secure/nonsecure.
> 
> This requires us to move logging at many callsites from after the
> call to before it, so that the logging appears in a sensible order.
> 
> (This will make tail-chaining produce more useful logs; for the
> current callers of v7m_exception_taken() we know which exception

Thanks for this cleanup.

> we're going to take, so custom log messages at the callsite sufficed;
> for tail-chaining only v7m_exception_taken() knows the exception
> number that we're going to tail-chain to.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6f5bb198c3b..3ec6114599b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6840,6 +6840,8 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
>      bool push_failed = false;
>  
>      armv7m_nvic_get_pending_irq_info(env->nvic, &exc, &targets_secure);
> +    qemu_log_mask(CPU_LOG_INT, "...taking pending %s exception %d\n",
> +                  targets_secure ? "secure" : "nonsecure", exc);
>  
>      if (arm_feature(env, ARM_FEATURE_V8)) {
>          if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
> @@ -6913,12 +6915,15 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
>           * we might now want to take a different exception which
>           * targets a different security state, so try again from the top.
>           */
> +        qemu_log_mask(CPU_LOG_INT,
> +                      "...derived exception on callee-saves register stacking");
>          v7m_exception_taken(cpu, lr, true, true);
>          return;
>      }
>  
>      if (!arm_v7m_load_vector(cpu, exc, targets_secure, &addr)) {
>          /* Vector load failed: derived exception */
> +        qemu_log_mask(CPU_LOG_INT, "...derived exception on vector table load");
>          v7m_exception_taken(cpu, lr, true, true);
>          return;
>      }
> @@ -7129,9 +7134,9 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>      if (sfault) {
>          env->v7m.sfsr |= R_V7M_SFSR_INVER_MASK;
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
> -        v7m_exception_taken(cpu, excret, true, false);
>          qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
>                        "stackframe: failed EXC_RETURN.ES validity check\n");
> +        v7m_exception_taken(cpu, excret, true, false);
>          return;
>      }
>  
> @@ -7141,9 +7146,9 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>           */
>          env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
> -        v7m_exception_taken(cpu, excret, true, false);
>          qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
>                        "stackframe: failed exception return integrity check\n");
> +        v7m_exception_taken(cpu, excret, true, false);
>          return;
>      }
>  
> @@ -7198,10 +7203,10 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>                  /* Take a SecureFault on the current stack */
>                  env->v7m.sfsr |= R_V7M_SFSR_INVIS_MASK;
>                  armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
> -                v7m_exception_taken(cpu, excret, true, false);
>                  qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
>                                "stackframe: failed exception return integrity "
>                                "signature check\n");
> +                v7m_exception_taken(cpu, excret, true, false);
>                  return;
>              }
>  
> @@ -7234,6 +7239,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>              /* v7m_stack_read() pended a fault, so take it (as a tail
>               * chained exception on the same stack frame)
>               */
> +            qemu_log_mask(CPU_LOG_INT, "...derived exception on unstacking\n");
>              v7m_exception_taken(cpu, excret, true, false);
>              return;
>          }
> @@ -7270,10 +7276,10 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>                  armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
>                                          env->v7m.secure);
>                  env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
> -                v7m_exception_taken(cpu, excret, true, false);
>                  qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
>                                "stackframe: failed exception return integrity "
>                                "check\n");
> +                v7m_exception_taken(cpu, excret, true, false);
>                  return;
>              }
>          }
> @@ -7309,9 +7315,9 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, false);
>          env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
>          ignore_stackfaults = v7m_push_stack(cpu);
> -        v7m_exception_taken(cpu, excret, false, ignore_stackfaults);
>          qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new stackframe: "
>                        "failed exception return integrity check\n");
> +        v7m_exception_taken(cpu, excret, false, ignore_stackfaults);
>          return;
>      }
>  
> @@ -7727,7 +7733,6 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>  
>      ignore_stackfaults = v7m_push_stack(cpu);
>      v7m_exception_taken(cpu, lr, false, ignore_stackfaults);
> -    qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
>  }
>  
>  /* Function used to synchronize QEMU's AArch64 register set with AArch32
> 
