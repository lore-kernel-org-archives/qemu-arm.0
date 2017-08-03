Received: by 10.25.221.202 with SMTP id w71csp823141lfi;
        Thu, 3 Aug 2017 08:59:56 -0700 (PDT)
X-Received: by 10.200.58.199 with SMTP id x65mr2736552qte.205.1501775995978;
        Thu, 03 Aug 2017 08:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501775995; cv=none;
        d=google.com; s=arc-20160816;
        b=bxWuDiST/Tr+ebTKs8P9xJafEgEO3BvorzSUwiXM2A3c2tvmW/c2r9FVQi682SnAHE
         DWoYOIlBwoEz2LfV9051AteuFIUXhEFBuQMYQtveQrAfFkeWi+8ojYdSGOHY2ceSvTm7
         s7PAc1IzU361Ihcr3h1DVNq79ro0IEbBG8c911MAM8PkvK8Go0+mawb7mQFUzxm6ZF+8
         WbBTdXc0xQ6Rfl1hHlVXIbqeANo9dfjWDgWASTX/UXseQCrDgeDyjfTkge2bR3X66Eel
         5aPqakwcdJfSGfgjaz6VA/qz1IfmbH49ws9rJRlgvmTUM4GdSHCkwTaMdsIc5PP6EJbX
         XxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=taFnCuvqNyvEBRXjdbMXVf8MHpN7OnJaeiXURjllD78=;
        b=ononw0EIRsnSrL5Cl+kWcceKfGBS3RX1pwr7YqPKP2PI0LtlXnmG57S4yUt6rTlbap
         5ZCAwn5ZYSX2zK4bOrjoRYNb9CQxKWykyGkS/9z16fnaBmZDd6ULovXXuaUFoIrqzTuV
         MOlTTOCBGi0g03ge7bJk16AjlRDPnF7cqWzkTzrpt9lGYReGHZ9LQ1fBD9wBKrau+yRK
         soVcK9L9THgpYQVhgwfheihWPSIeEiS9gDVofijBg04mu/zmYnrXDU47XrNQHDEFUyMC
         +xIQFiU0mFvhetb1rfjI3NhsYqCnMHvfjEf97FQXEoyk4IOgkJPlec5j5VztKSsnAlmK
         9qvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=qN6+owA9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z81si29729607qkb.353.2017.08.03.08.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 08:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=qN6+owA9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddIXR-0004dF-76
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 11:59:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddIXM-0004bj-8F
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddIXJ-0001dH-0g
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:59:48 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36335)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddIXI-0001bh-KW; Thu, 03 Aug 2017 11:59:44 -0400
Received: by mail-lf0-x242.google.com with SMTP id t128so1227512lff.3;
	Thu, 03 Aug 2017 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=taFnCuvqNyvEBRXjdbMXVf8MHpN7OnJaeiXURjllD78=;
	b=qN6+owA9Jh0NzCX0T2q6X6I0yOYi+fmkRqLHFJabmZ5uJzzyMV6xcLQEldGl/Vj6UZ
	mNs8e8pvf4rZL8hzRs5KUwb2sq5O9j7wUYkmS1lx1EqlEcFVOj1YodODtcZryfz8wN9C
	Pb7OamHLbh9HM2KKsai3sQIjoUF9VKrSmj9ORkYYdZVkWkCmIGnQtF3OvrqLAgk46/IR
	MvjYlXLKd8y6R2AJLsLMyMWJ2y5ZRSlNW5ON5NpS4h+aGnmqv6OQ9E9URujTrHJH0XnW
	JfjTzoaYDmGD7T0rGIyJa1PIMTNdfQWROB+VcFPBSGxOx4qDOGWiM+x742MJoQ3uRW4i
	sEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=taFnCuvqNyvEBRXjdbMXVf8MHpN7OnJaeiXURjllD78=;
	b=mT/1awpVtovJMUS2tlxZR0OmvIT+VxHb6c6LYSMY9HnZljwKw7afxPnDm6/sLt/xVb
	lexR5nIYyuYDEPzt0brTPFIPAsyEecf3XkoO1TFaM6cdUXAZchu+7Q8O1MSM4MNPUc3S
	3MurO0MHp8RJXwhnMX0aNjUNDpXLk1O1AH7263kcLg9PctmpR+2Ab3o7oU0TZihg/tqi
	WQ7YdSueIF2A0b26yy828kQtOzmfuPflnOXKJV7oXS0uYlM7tmdr+BGVm9M+STkS/d5j
	5Cynvzm9Oi5+Ofqawl1UvD6ZHlC3ey09Hfy7GKw0ZcIW5wr8juyGc4naQnQQyJxJFsKD
	kTXA==
X-Gm-Message-State: AHYfb5juqaVCv8MoUqtlrR8F6kArx2ZTkIKqvF5dY5r0yoQE0qo3YH2l
	QJWJeAGK0DyutA==
X-Received: by 10.25.18.151 with SMTP id 23mr724515lfs.95.1501775983126;
	Thu, 03 Aug 2017 08:59:43 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 14sm455554ljv.62.2017.08.03.08.59.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 08:59:42 -0700 (PDT)
Date: Thu, 3 Aug 2017 17:59:41 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170803155941.GW4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-16-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-16-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH 15/15] nvic: Implement "user accesses
 BusFault" SCS region behaviour
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VyiSxjaHCxFA

On Wed, Aug 02, 2017 at 05:44:01PM +0100, Peter Maydell wrote:
> The ARMv7M architecture specifies that most of the addresses in the
> PPB region (which includes the NVIC, systick and system registers)
> are not accessible to unprivileged accesses, which should
> BusFault with a few exceptions:
>  * the STIR is configurably user-accessible
>  * the ITM (which we don't implement at all) is always
>    user-accessible
> 
> Implement this by switching the register access functions
> to the _with_attrs scheme that lets us distinguish user
> mode accesses.
> 
> This allows us to pull the handling of the CCR.USERSETMPEND
> flag up to the level where we can make it generate a BusFault
> as it should for non-permitted accesses.
> 
> Note that until the core ARM CPU code implements turning
> MEMTX_ERROR into a BusFault the registers will continue to
> act as RAZ/WI to user accesses.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  hw/intc/armv7m_nvic.c | 58 ++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 41 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 5a18025..bbfe2d5 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -733,11 +733,8 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>      }
>      case 0xf00: /* Software Triggered Interrupt Register */
>      {
> -        /* user mode can only write to STIR if CCR.USERSETMPEND permits it */
>          int excnum = (value & 0x1ff) + NVIC_FIRST_IRQ;
> -        if (excnum < s->num_irq &&
> -            (arm_current_el(&cpu->env) ||
> -             (cpu->env.v7m.ccr & R_V7M_CCR_USERSETMPEND_MASK))) {
> +        if (excnum < s->num_irq) {
>              armv7m_nvic_set_pending(s, excnum);
>          }
>          break;
> @@ -748,14 +745,32 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>      }
>  }
>  
> -static uint64_t nvic_sysreg_read(void *opaque, hwaddr addr,
> -                                 unsigned size)
> +static bool nvic_user_access_ok(NVICState *s, hwaddr offset)
> +{
> +    /* Return true if unprivileged access to this register is permitted. */
> +    switch (offset) {
> +    case 0xf00: /* STIR: accessible only if CCR.USERSETMPEND permits */
> +        return s->cpu->env.v7m.ccr & R_V7M_CCR_USERSETMPEND_MASK;
> +    default:
> +        /* All other user accesses cause a BusFault unconditionally */
> +        return false;
> +    }
> +}
> +
> +static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
> +                                    uint64_t *data, unsigned size,
> +                                    MemTxAttrs attrs)
>  {
>      NVICState *s = (NVICState *)opaque;
>      uint32_t offset = addr;
>      unsigned i, startvec, end;
>      uint32_t val;
>  
> +    if (attrs.user && !nvic_user_access_ok(s, addr)) {
> +        /* Generate BusFault for unprivileged accesses */
> +        return MEMTX_ERROR;
> +    }
> +
>      switch (offset) {
>      /* reads of set and clear both return the status */
>      case 0x100 ... 0x13f: /* NVIC Set enable */
> @@ -826,11 +841,13 @@ static uint64_t nvic_sysreg_read(void *opaque, hwaddr addr,
>      }
>  
>      trace_nvic_sysreg_read(addr, val, size);
> -    return val;
> +    *data = val;
> +    return MEMTX_OK;
>  }
>  
> -static void nvic_sysreg_write(void *opaque, hwaddr addr,
> -                              uint64_t value, unsigned size)
> +static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
> +                                     uint64_t value, unsigned size,
> +                                     MemTxAttrs attrs)
>  {
>      NVICState *s = (NVICState *)opaque;
>      uint32_t offset = addr;
> @@ -839,6 +856,11 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
>  
>      trace_nvic_sysreg_write(addr, value, size);
>  
> +    if (attrs.user && !nvic_user_access_ok(s, addr)) {
> +        /* Generate BusFault for unprivileged accesses */
> +        return MEMTX_ERROR;
> +    }
> +
>      switch (offset) {
>      case 0x100 ... 0x13f: /* NVIC Set enable */
>          offset += 0x80;
> @@ -853,7 +875,7 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
>              }
>          }
>          nvic_irq_update(s);
> -        return;
> +        return MEMTX_OK;
>      case 0x200 ... 0x23f: /* NVIC Set pend */
>          /* the special logic in armv7m_nvic_set_pending()
>           * is not needed since IRQs are never escalated
> @@ -870,9 +892,9 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
>              }
>          }
>          nvic_irq_update(s);
> -        return;
> +        return MEMTX_OK;
>      case 0x300 ... 0x33f: /* NVIC Active */
> -        return; /* R/O */
> +        return MEMTX_OK; /* R/O */
>      case 0x400 ... 0x5ef: /* NVIC Priority */
>          startvec = 8 * (offset - 0x400) + NVIC_FIRST_IRQ; /* vector # */
>  
> @@ -880,26 +902,28 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
>              set_prio(s, startvec + i, (value >> (i * 8)) & 0xff);
>          }
>          nvic_irq_update(s);
> -        return;
> +        return MEMTX_OK;
>      case 0xd18 ... 0xd23: /* System Handler Priority.  */
>          for (i = 0; i < size; i++) {
>              unsigned hdlidx = (offset - 0xd14) + i;
>              set_prio(s, hdlidx, (value >> (i * 8)) & 0xff);
>          }
>          nvic_irq_update(s);
> -        return;
> +        return MEMTX_OK;
>      }
>      if (size == 4) {
>          nvic_writel(s, offset, value);
> -        return;
> +        return MEMTX_OK;
>      }
>      qemu_log_mask(LOG_GUEST_ERROR,
>                    "NVIC: Bad write of size %d at offset 0x%x\n", size, offset);
> +    /* This is UNPREDICTABLE; treat as RAZ/WI */
> +    return MEMTX_OK;
>  }
>  
>  static const MemoryRegionOps nvic_sysreg_ops = {
> -    .read = nvic_sysreg_read,
> -    .write = nvic_sysreg_write,
> +    .read_with_attrs = nvic_sysreg_read,
> +    .write_with_attrs = nvic_sysreg_write,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> -- 
> 2.7.4
> 
> 
