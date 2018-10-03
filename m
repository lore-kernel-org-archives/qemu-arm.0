Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6040223wrt;
        Wed, 3 Oct 2018 01:52:58 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61kt8dSw9fqrip74Za+XNDmueupXEuSzzqtSQJtNSkhS1epOX41msoeLRbjw/qh7jByLGh/
X-Received: by 2002:a37:5f85:: with SMTP id t127-v6mr321646qkb.123.1538556778687;
        Wed, 03 Oct 2018 01:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538556778; cv=none;
        d=google.com; s=arc-20160816;
        b=l4y1w2wcLt0AfJirL95LDCxPLBeZ+pWrOwZABez2C7OKkV2s+oX6ySBTpk8KQJiZqZ
         5ljurO8XhWINi98Mj5xtpzElGhEny2dNPcaNWUD9SPm+an86pFWt1TELdJcCk6J4Saj8
         0GqBdJbAcVEjPHJnYrEln0Lg6//2IEHyjMkJiD79dDDU80RWpRLGMvl6z7whXU82uQmx
         P+L+U7wwJ1NxVYlzlCEUWpTioBfXLbAi1GG5o3JZXU5jJineam1wzn6W+rnHyOZIgqQJ
         9Qx6uc+MwkRLibqpN5IHukMnNdEV8li9fLwqkUHGuyRT2LmcUp2rk3a9PHz+yq4fK5nH
         rxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=sdQs+IRl5uiRRgsO5wBFlWUU/2lAn8bRUwVpXqneMwk=;
        b=mAywassCeVGI7WSopLh7uT26TG968/YrlNK6DVG4ZcaHEMwKRtuYMwGlOAvKWBKu2v
         j75x26XuO44YTL70GQ5+r5ZQJZaieAqQWlTuhk0NHRH1QoNdRgMy0Re34rR9TUGYqNS0
         k5Oh73l9d0IPut7puBpwf6odfpVIFBl7Djrs+8XhSoxkxVabTXZF+S7iXRG1pjOtlWTh
         ST84CUb6zG1oqyTwIqZyqTTp8wWy3TRTjVBOtKUHaSY3G9VEsfLnNZ6uIXjoP9utKk9f
         nVRdtnlvdVVqd0/+wi8ji335whvI6ivM88xu15/LeDZVaL5ptSn5T+Cogk6XG9RNY3PZ
         sjAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2-v6si459676qkd.14.2018.10.03.01.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 01:52:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7ctu-0008Qa-3r
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 04:52:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7ctl-0008PR-Ez
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 04:52:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7cti-0001uA-6W
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 04:52:49 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39560)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7cth-0001to-VH
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 04:52:46 -0400
Received: by mail-wm1-f68.google.com with SMTP id q8-v6so4763207wmq.4
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 01:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sdQs+IRl5uiRRgsO5wBFlWUU/2lAn8bRUwVpXqneMwk=;
	b=Zqlqb3sFFNOznZbA4wUMu45Jz15u8CrQN+FXqigy9ZDVVBlDImTYEpbI4DgtZgnB5C
	fq897V/CWTK8fbOf/Jg2Bc9YzoRhyLMfWzLkaplqnm42/p7Ir0qCj+WRhaKp+n+ihRwd
	6Pc2734hChyYhkAUy7/Dq4OVxmae7em5OTUPy/qcLVCglSsFYMxWyfRywtN6MMbk7v8P
	2jMMCcKUHZIJsYO0kNUsSOZIWeo401Sqf64gIzlprEENubHvpp8wOIM5DV3+k/lkRVSR
	HMe+bZVn+Il2P0h/nZzOgcipjG96X+qcGdc0V79jrwB1ybYf6XyfIMXXk79DpvyGrJeh
	RGrQ==
X-Gm-Message-State: ABuFfog6nEu6Pbalnt8H7vOYIBTZV08dnsxJIf2i0RyD6kevqMYr97mi
	t7iKn/2ol0qne1wfPEJy3LnJnA==
X-Received: by 2002:a7b:c216:: with SMTP id x22-v6mr689385wmi.65.1538556764858;
	Wed, 03 Oct 2018 01:52:44 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	a5-v6sm769515wmh.8.2018.10.03.01.52.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 01:52:44 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d0d615cc-188e-ebfb-c67d-92dea9f357d0@redhat.com>
Date: Wed, 3 Oct 2018 10:52:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/13] target/arm: Move
 v7m_using_psp() to internals.h
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
X-TUID: OPOh01b5h4S1

On 02/10/2018 18:35, Peter Maydell wrote:
> We're going to want v7m_using_psp() in op_helper.c in the
> next patch, so move it from helper.c to internals.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/internals.h | 15 +++++++++++++++
>  target/arm/helper.c    | 12 ------------
>  2 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index dc9357766c9..bc4c01ccd92 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -796,4 +796,19 @@ static inline uint32_t arm_debug_exception_fsr(CPUARMState *env)
>      }
>  }
>  
> +/**
> + * v7m_using_psp: Return true if using process stack pointer
> + * Return true if the CPU is currently using the process stack
> + * pointer, or false if it is using the main stack pointer.
> + */
> +static inline bool v7m_using_psp(CPUARMState *env)
> +{
> +    /* Handler mode always uses the main stack; for thread mode
> +     * the CONTROL.SPSEL bit determines the answer.
> +     * Note that in v7M it is not possible to be in Handler mode with
> +     * CONTROL.SPSEL non-zero, but in v8M it is, so we must check both.
> +     */
> +    return !arm_v7m_is_handler_mode(env) &&
> +        env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK;
> +}
>  #endif
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c303dc453f1..ef8c244fb84 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6554,18 +6554,6 @@ pend_fault:
>      return false;
>  }
>  
> -/* Return true if we're using the process stack pointer (not the MSP) */
> -static bool v7m_using_psp(CPUARMState *env)
> -{
> -    /* Handler mode always uses the main stack; for thread mode
> -     * the CONTROL.SPSEL bit determines the answer.
> -     * Note that in v7M it is not possible to be in Handler mode with
> -     * CONTROL.SPSEL non-zero, but in v8M it is, so we must check both.
> -     */
> -    return !arm_v7m_is_handler_mode(env) &&
> -        env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK;
> -}
> -
>  /* Write to v7M CONTROL.SPSEL bit for the specified security bank.
>   * This may change the current stack pointer between Main and Process
>   * stack pointers if it is done for the CONTROL register for the current
> 
