Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6039907wrt;
        Wed, 3 Oct 2018 01:52:32 -0700 (PDT)
X-Google-Smtp-Source: ACcGV624Dc7IvyvhuqHl6GZHfRO2pNqrIANwP6t+FYp0PaZNn+X35FjHl8htZxHSyEvZ4L6W/+ZE
X-Received: by 2002:a0c:f1c7:: with SMTP id u7-v6mr330676qvl.201.1538556752508;
        Wed, 03 Oct 2018 01:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538556752; cv=none;
        d=google.com; s=arc-20160816;
        b=tsvIgywDXahiv/1ZVVkjNcs27WTBkSFW1YB+nZY9/SvV5bwnxUNFki1DBpjIHL12jL
         ACS/RgaS7Je91cdjiQ4D1vmPO2iKFn2CGCO6ZF/qj6xkgOHpfVmiPmILbhe0dZqB2yn+
         XOqVOmF6g679sdX3kQBxDtoJqMDoTQAO0KzwGs3V8zzfU7ry+wW/2nGqgHQpdH+BdWXH
         OKcWoByujaqqQXWXI+E8ugaDXXRAS/HhFZrAc64RuohktAKEHhrkYuVEDvwPVgDJsgna
         4FiKzZFDqJLXknxufP9t/hjzkZGVuXxiA1qSbnby0GAEwvnFFuV7uH0fX/oNR1NaGMCd
         sf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=4HUkP81fGDQUXntYnzvPf5ICCAEUa/EpwcYz3r0Km1M=;
        b=s8PenzBy/COzRktuZabHSH70wrTveZgaSaw8ztHm3eYLb6KPPyb9QUEFZ6dWluteRJ
         PK89PtYEq7sLQ0zBkcsrRkkIC1wUAnsoZZogWEE07rHFziVt0y+km8SiawBbpvncRD7a
         skBympSUjOV/KVXOsx92293dmG8T7HUnBGATJazYgvLqd+giZEVK+uqCE8HSn//RlohN
         1szxRIuc9fgYxSUNXl1OjM07Ro2VzY4dNQ7tiKLQ2qn3WjSYwTkGgCUskCq6Nc9xd/OH
         YGglspqOezbSSlesD08Na0f12fg9DRZxpBLHXDPWWfxzFcxEul7Y1T30xXjNSQwICKCA
         keGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1-v6si496592qvm.241.2018.10.03.01.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 01:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7ctU-0007e5-3n
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 04:52:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7ctD-0007dX-A5
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 04:52:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7ct8-0001kw-MN
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 04:52:14 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36545)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7ct8-0001kQ-DT
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 04:52:10 -0400
Received: by mail-wr1-f68.google.com with SMTP id y16so5168270wrw.3
	for <qemu-devel@nongnu.org>; Wed, 03 Oct 2018 01:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4HUkP81fGDQUXntYnzvPf5ICCAEUa/EpwcYz3r0Km1M=;
	b=LRAaZy4YnFkSq9bD5ibbj6o3I8HrB9oIu/itLRuB5wUwwLAMsx6LfUOwui73Vsu606
	1zLEulcA9YUk6OkM9kjV7Ybxv778UV9ebaZYg7Bnz0c/nCGvxCkZ8bD5pSJxCOBjkLug
	1SfEqyr//2At6VA6yoF/QEyr3a5OIeIAxN0lDW8eNMT+jb6I/YvhMQG9CqMj8FdbfvHk
	B1cPoBvIDOLlTaZGDxiS4bfQInMMmSTSNuVZ4CBowSN7+XH+d5ywEYIj18lnEnCf41c4
	dgolX/aIofy/jvw6H3enQv1V5jHlJ1c4CFjRPisIofVNqkQbVV3aAtYdyhVNRD0gePIB
	BlGw==
X-Gm-Message-State: ABuFfohOMnJV4DKa+XxNiWcilXBJmRH41Lq73WQXfHA64CnYxGxjs9eL
	km2cEKTnqDJ3iZpYoYbVh+kIdA==
X-Received: by 2002:adf:f043:: with SMTP id t3-v6mr457027wro.92.1538556729365; 
	Wed, 03 Oct 2018 01:52:09 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	y125-v6sm1127974wme.12.2018.10.03.01.52.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 01:52:08 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5cd37a9e-ee75-6a98-4b9c-b659208c1118@redhat.com>
Date: Wed, 3 Oct 2018 10:52:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH 02/13] target/arm: Define new EXCP type for
 v8M stack overflows
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +UJ5tyALSy9Z

On 02/10/2018 18:35, Peter Maydell wrote:
> Define EXCP_STKOF, and arrange for it to cause us to take
> a UsageFault with CFSR.STKOF set.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/cpu.h    | 2 ++
>  target/arm/helper.c | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d2c1d005ed7..318792823b9 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -56,6 +56,7 @@
>  #define EXCP_SEMIHOST       16   /* semihosting call */
>  #define EXCP_NOCP           17   /* v7M NOCP UsageFault */
>  #define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
> +#define EXCP_STKOF          19   /* v8M STKOF UsageFault */
>  /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
>  
>  #define ARMV7M_EXCP_RESET   1
> @@ -1380,6 +1381,7 @@ FIELD(V7M_CFSR, UNDEFINSTR, 16 + 0, 1)
>  FIELD(V7M_CFSR, INVSTATE, 16 + 1, 1)
>  FIELD(V7M_CFSR, INVPC, 16 + 2, 1)
>  FIELD(V7M_CFSR, NOCP, 16 + 3, 1)
> +FIELD(V7M_CFSR, STKOF, 16 + 4, 1)
>  FIELD(V7M_CFSR, UNALIGNED, 16 + 8, 1)
>  FIELD(V7M_CFSR, DIVBYZERO, 16 + 9, 1)
>  
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6ed8631dbee..c303dc453f1 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7511,6 +7511,7 @@ static void arm_log_exception(int idx)
>              [EXCP_SEMIHOST] = "Semihosting call",
>              [EXCP_NOCP] = "v7M NOCP UsageFault",
>              [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
> +            [EXCP_STKOF] = "v8M STKOF UsageFault",
>          };
>  
>          if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
> @@ -7666,6 +7667,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
>          env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVSTATE_MASK;
>          break;
> +    case EXCP_STKOF:
> +        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
> +        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_STKOF_MASK;
> +        break;
>      case EXCP_SWI:
>          /* The PC already points to the next instruction.  */
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC, env->v7m.secure);
> 
