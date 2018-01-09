Received: by 10.28.173.206 with SMTP id w197csp3751474wme;
        Tue, 9 Jan 2018 06:21:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBotlfYgAzS71ecy0uxhr7NAHxgVRdQ1reeXD5TGUZ127+w0xQlo32Yz2aL95bHdA+nc+e8oF
X-Received: by 10.13.206.4 with SMTP id q4mr13736931ywd.305.1515507662061;
        Tue, 09 Jan 2018 06:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515507662; cv=none;
        d=google.com; s=arc-20160816;
        b=GkxXWEiYYTS8ZoPT2yTNE6dIWO0gcWO5/UNjGBDiTWEfBXndAAMq3oGjIId+vUYWUe
         7YiQRq1r//gYH3tY9OeBn8uE3anTKP4pJU4RkrHV1sLmk3/JttKX7B6bw7GZKMOQ9Dwx
         0rlX0rRACd+2Jgfhmm+W1Yx2rc/3czbwva0Cu9hRbughLBactO1LvcU7IVsAa48iEN0X
         p7KQksRzQLWv1iCbUDMiznRzgqwTiXs1bqwCC61c8guUl1x+U8+hpyBTWbtN7KCcNE0n
         fqThQxmxrXWYEzpr1uqkxV1rW95+OOkg7ASkazcelswYk1zCuq9vrcYJ7hL6oxR6yNgX
         zuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=F9+8obof16kE0BbunblconFVZc1q92UvAJMFNMIKhlY=;
        b=pOJyjEa0G5y50c9xvZfdOsmFbp2pOcHbWnjA0y5mrXvwRuQa/XhR0JYEhOvr8nWKoS
         ajD7z1BI0pttjX+TQxYbOe123nutYy0IFGNNl1FYZUsbrNpI36G+Hq/svOFM+mAr0y/z
         frjNOQek73+e2rXcF/aY8aQB390eccIQhQjFmEtobznD0zB0jffE1vdDbB8UQzedMNuD
         XD5xmiK3WOImavhEGuYAsa2y/uc6WiETpVxq9soJ08apZlF3TPVCZFII/A1asIxtVzUi
         x4K3oeESzGyEq9JPkObtMWFMp4Avrkae+GyziaD3+33A4ZbWp0BjNDaSGpLxDxWMykQ0
         HQMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N1ubDMQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z14si2987866ybm.825.2018.01.09.06.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 06:21:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N1ubDMQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYulx-0007MM-H2
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 09:21:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYuln-0007Jw-8Q
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:20:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYulm-00060U-67
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:20:51 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:47065)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYulm-00060A-1q
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:20:50 -0500
Received: by mail-oi0-x243.google.com with SMTP id d124so6464746oib.13
	for <qemu-arm@nongnu.org>; Tue, 09 Jan 2018 06:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F9+8obof16kE0BbunblconFVZc1q92UvAJMFNMIKhlY=;
	b=N1ubDMQep2UkI6Vjs+fh1bVuwQrs4dXWnwfsCQEUAEXLIHJB0KIJgfalu6cAoIVr76
	7A8WSFNFfZRx8VzVCKcQPZJLHHj2MOuhfey4BYKPmQkgu6c/zOb9jcBN0iRZ2vksvMUj
	c/vXdlTKiKw583Gyw89rdlg1JicKEbtWR2zLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F9+8obof16kE0BbunblconFVZc1q92UvAJMFNMIKhlY=;
	b=j3ozUnTgyd2jQn0zzqPxH62uwWUX61F1lMtYCUdarOtOV8aIjafkSWl6YKykqH/Csn
	6IPS8/ypdWVluPpR+YEZ+a81uKdlWsAas+tn2uvVQT8DMkM/l2y9xCAkGfXX7iaLt8WI
	jLKWChfqsb7ArJBDm32ZxrBx1S2V8Sn6MQC3Erzw+lIyrkKsl7rE03KlBkZQmEbbbu8N
	ocA6ifuX8x6M12d5v61uGaRgRTCmvE6lXTJPffz+pCP38M/SHRl0WaGb3AZr62b1sFAK
	AcOJkBM6/p8UeiFSJvM9LiwiwC5IkO8XKFG7FnJ8bWW58UxC4V7GFD8Qzxg9K2KluR2H
	nefw==
X-Gm-Message-State: AKwxyteWaha92ZGdtHBcpllVioO/V++TnP60Xh3sDA7f5f2B7Rzej9kp
	xlDPfvT0PqvSQARYmn0ULLiXGZDRFNWHjVvZbEVUHA/T
X-Received: by 10.202.173.84 with SMTP id w81mr908198oie.299.1515507648912;
	Tue, 09 Jan 2018 06:20:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 06:20:28 -0800 (PST)
In-Reply-To: <1512742372-31517-1-git-send-email-peter.maydell@linaro.org>
References: <1512742372-31517-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2018 14:20:28 +0000
Message-ID: <CAFEAcA9WWy06hAu6_SCQR5M3GJ-H5zBjgPBiposFeonCp6Ei0g@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH] hw/intc/armv7m: Support byte and halfword
 accesses to CFSR
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
Cc: Andy Gross <andy.gross@linaro.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JWL9ie+vfHVQ

Ping for code review?

thanks
-- PMM

On 8 December 2017 at 14:12, Peter Maydell <peter.maydell@linaro.org> wrote:
> The Configurable Fault Status Register for ARMv7M and v8M is
> supposed to be byte and halfword accessible, but we were only
> implementing word accesses. Add support for the other access
> sizes, which are used by the Zephyr RTOS.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reported-by: Andy Gross <andy.gross@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 38 ++++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 5d9c883..dc8e2f1 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -896,13 +896,6 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
>              val |= (1 << 8);
>          }
>          return val;
> -    case 0xd28: /* Configurable Fault Status.  */
> -        /* The BFSR bits [15:8] are shared between security states
> -         * and we store them in the NS copy
> -         */
> -        val = cpu->env.v7m.cfsr[attrs.secure];
> -        val |= cpu->env.v7m.cfsr[M_REG_NS] & R_V7M_CFSR_BFSR_MASK;
> -        return val;
>      case 0xd2c: /* Hard Fault Status.  */
>          return cpu->env.v7m.hfsr;
>      case 0xd30: /* Debug Fault Status.  */
> @@ -1280,15 +1273,6 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
>          s->vectors[ARMV7M_EXCP_DEBUG].active = (value & (1 << 8)) != 0;
>          nvic_irq_update(s);
>          break;
> -    case 0xd28: /* Configurable Fault Status.  */
> -        cpu->env.v7m.cfsr[attrs.secure] &= ~value; /* W1C */
> -        if (attrs.secure) {
> -            /* The BFSR bits [15:8] are shared between security states
> -             * and we store them in the NS copy.
> -             */
> -            cpu->env.v7m.cfsr[M_REG_NS] &= ~(value & R_V7M_CFSR_BFSR_MASK);
> -        }
> -        break;
>      case 0xd2c: /* Hard Fault Status.  */
>          cpu->env.v7m.hfsr &= ~value; /* W1C */
>          break;
> @@ -1667,6 +1651,14 @@ static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
>              val = deposit32(val, i * 8, 8, get_prio(s, hdlidx, sbank));
>          }
>          break;
> +    case 0xd28 ... 0xd2b: /* Configurable Fault Status (CFSR) */
> +        /* The BFSR bits [15:8] are shared between security states
> +         * and we store them in the NS copy
> +         */
> +        val = s->cpu->env.v7m.cfsr[attrs.secure];
> +        val |= s->cpu->env.v7m.cfsr[M_REG_NS] & R_V7M_CFSR_BFSR_MASK;
> +        val = extract32(val, (offset - 0xd28) * 8, size * 8);
> +        break;
>      case 0xfe0 ... 0xfff: /* ID.  */
>          if (offset & 3) {
>              val = 0;
> @@ -1765,6 +1757,20 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
>          }
>          nvic_irq_update(s);
>          return MEMTX_OK;
> +    case 0xd28 ... 0xd2b: /* Configurable Fault Status (CFSR) */
> +        /* All bits are W1C, so construct 32 bit value with 0s in
> +         * the parts not written by the access size
> +         */
> +        value <<= ((offset - 0xd28) * 8);
> +
> +        s->cpu->env.v7m.cfsr[attrs.secure] &= ~value;
> +        if (attrs.secure) {
> +            /* The BFSR bits [15:8] are shared between security states
> +             * and we store them in the NS copy.
> +             */
> +            s->cpu->env.v7m.cfsr[M_REG_NS] &= ~(value & R_V7M_CFSR_BFSR_MASK);
> +        }
> +        return MEMTX_OK;
>      }
>      if (size == 4) {
>          nvic_writel(s, offset, value, attrs);
> --
> 2.7.4
