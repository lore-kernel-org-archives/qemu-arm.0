Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp835678wrq;
        Wed, 6 Jun 2018 06:39:19 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK6q+tqOwdeKOHBgUJWB4se0pzhUWHy2npCDYrGuqzETpog3L+4J+8VhB4v/Xf1SO3VOKgz
X-Received: by 2002:a0c:d7c9:: with SMTP id g9-v6mr2623803qvj.161.1528292359855;
        Wed, 06 Jun 2018 06:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528292359; cv=none;
        d=google.com; s=arc-20160816;
        b=OAdaoueNDMurAvorM3GbUlZKRvCg2/qpHXCpowJFj+d9dTlTOafmbaa6C0xMfsf0ck
         pMWUNv9kQ3QwZw0KdL/vGnU0q9dvK9Df3JM/XwUXYwm96VB3oLWaIzHimZarpGKvUsFu
         NEfyG4vHF4HzTM/FhKcFOCMAIqxoIBvV4J0k+knhCO097bSjoXJgbBUd6de1i55RQTMO
         sCQMY8mtxJrI2N//iD27/7tnINjkQhzdC0L11+HXre1o+tGteldsZypCINIAh5lCk0be
         eqyJIGnohTBCJpb+45muPDL6PmUGe/aWaFQ/nmPMcy7GxjJ/2MgQXWq1pnv4ie0/uqq4
         OVDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=wuQL1zBOvsja16VGwfLXUIxaKYvZzG8H+xrX2omR318=;
        b=GZI6gO67WU1TTmfiBhP66YNmhqodmRc56bSL0FTIAZX8h3h7nVNjgVAluJ7i9oHaeK
         x8gR534EEeUKUZhNqpAJjlh0LAapukuuRoIj+O0DUAuLtWItZ0a0XH7nhRh5d8Bvoco9
         CoLTaXoYzqOArCkjDEnxES52pTIlAUYzAOPFmQKgu3mo+Hj54TVvbs4xmSohbgFr35bn
         th5ygbTrfpsAB8lR+a2Sv5qi8ZV3HHj1RvPFBbdpkOp8TC6AWf2GCB1XKCB1xDb/hzA1
         PUN131SOT/tVZtkq7SdYQUXa42HQ2pIkcp4Izz4ax6VUGV0JnwKf7iVgQPXAcUYIhCOE
         M5mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i6I48sHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 44-v6si5693572qte.76.2018.06.06.06.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 06:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i6I48sHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQYel-0005TU-F0
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 09:39:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQYec-0005TN-6T
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 09:39:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQYeZ-0006au-8V
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 09:39:10 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:44614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQYeZ-0006an-3A; Wed, 06 Jun 2018 09:39:07 -0400
Received: by mail-qt0-x243.google.com with SMTP id l33-v6so6310613qta.11;
	Wed, 06 Jun 2018 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wuQL1zBOvsja16VGwfLXUIxaKYvZzG8H+xrX2omR318=;
	b=i6I48sHwNPXu7LNDqUaF1u8BAwEu+GtOqweyBxs0UYEMxfObrDEmI6sMTmG3TLesBo
	6M/mZ3kMVejBY+efIjyY4fnrUwKluo8Hto6a+Y8gUlnapcW9pJ27QFkICqASAE9ENAgx
	wNOnw3wrJURvduUgwUWFzzPVXfrWsvmwwkJ8BMm1UOP+pnMSy9+hVEovY3mEWoBhaucT
	h6zaBgoy8982cq0KjUPfDDDLHY0PgONSDRmnHazpkDLStEsFzk4p2rUiUxfNcL0w1yDy
	Y1blYwKTCXuAq1FrUX2BMOzxyJhqAsb2/01KxDVjMOUxsalXZnNxsFuH0P9qf6deaZRN
	25Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wuQL1zBOvsja16VGwfLXUIxaKYvZzG8H+xrX2omR318=;
	b=rd4OIliy66/coBBBFCTpB35AjyGIByq8T+inBYn4+fYmWI9cIgiB5n8Pj2Hi0MNAr5
	FV3DqDnIDUabxZ/fOd5Rd7Srch8zUCt46dz2+CObbGnukXDcyVMbxXngF2pft1Td9rF1
	CPrGNDaPrpmo7E64xA0LPD0ZCh8S5fhAEpDZGGcOesybnjfaz3gxSIwEh03aSgFTbKpX
	8QL4F+PiNknHP8Fg/2w3j1RUhQv7lV2gae6HOZBvuM/KZo16q7b8bVrEi5KZbKXEbdxt
	tU6xzUbQK+9/b7XZ9RUOkhS9TO1ufmes2gZyUAZyxp9EKtjdFj0bgbSlhF88oGqApsBK
	1GTA==
X-Gm-Message-State: APt69E0MZGJTDLE1gmE3/rvuHdRZpUkfySkNKUA+rEaP1eGbKvDiHAw7
	E++pGLSp/4+LD0XbbNT7h9M=
X-Received: by 2002:a0c:a892:: with SMTP id
	x18-v6mr2654908qva.118.1528292346575; 
	Wed, 06 Jun 2018 06:39:06 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	j89-v6sm6538954qtb.14.2018.06.06.06.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 06:39:06 -0700 (PDT)
To: luc.michel@greensocs.com, qemu-devel@nongnu.org
References: <20180606093101.30518-1-luc.michel@greensocs.com>
	<20180606093101.30518-3-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3a8833a6-6d8b-0288-b32f-63eeb0af1520@amsat.org>
Date: Wed, 6 Jun 2018 10:39:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180606093101.30518-3-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH 2/6] intc/arm_gic: Remove some dead code and
 put some functions static
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L49C2yPSu+rh

On 06/06/2018 06:30 AM, luc.michel@greensocs.com wrote:
> From: Luc MICHEL <luc.michel@greensocs.com>
> 
> Some functions are now only used in arm_gic.c, put them static. Some of
> them where only used by the NVIC implementation and are not used
> anymore, so remove them.
> 
> Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/arm_gic.c      | 23 ++---------------------
>  hw/intc/gic_internal.h |  4 ----
>  2 files changed, 2 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 141f3e7a48..679b19fb94 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -71,7 +71,7 @@ static inline bool gic_has_groups(GICState *s)
>  
>  /* TODO: Many places that call this routine could be optimized.  */
>  /* Update interrupt status after enabled or pending bits have been changed.  */
> -void gic_update(GICState *s)
> +static void gic_update(GICState *s)
>  {
>      int best_irq;
>      int best_prio;
> @@ -137,19 +137,6 @@ void gic_update(GICState *s)
>      }
>  }
>  
> -void gic_set_pending_private(GICState *s, int cpu, int irq)
> -{
> -    int cm = 1 << cpu;
> -
> -    if (gic_test_pending(s, irq, cm)) {
> -        return;
> -    }
> -
> -    DPRINTF("Set %d pending cpu %d\n", irq, cpu);
> -    GIC_DIST_SET_PENDING(irq, cm);
> -    gic_update(s);
> -}
> -
>  static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
>                                   int cm, int target)
>  {
> @@ -565,7 +552,7 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>      GIC_DIST_CLEAR_ACTIVE(irq, cm);
>  }
>  
> -void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
> +static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>  {
>      int cm = 1 << cpu;
>      int group;
> @@ -1418,12 +1405,6 @@ static const MemoryRegionOps gic_cpu_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> -/* This function is used by nvic model */
> -void gic_init_irqs_and_distributor(GICState *s)
> -{
> -    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops);
> -}
> -
>  static void arm_gic_realize(DeviceState *dev, Error **errp)
>  {
>      /* Device instance realize function for the GIC sysbus device */
> diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
> index 6f8d242904..a2075a94db 100644
> --- a/hw/intc/gic_internal.h
> +++ b/hw/intc/gic_internal.h
> @@ -75,11 +75,7 @@
>  /* The special cases for the revision property: */
>  #define REV_11MPCORE 0
>  
> -void gic_set_pending_private(GICState *s, int cpu, int irq);
>  uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs);
> -void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs);
> -void gic_update(GICState *s);
> -void gic_init_irqs_and_distributor(GICState *s);
>  void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
>                             MemTxAttrs attrs);
>  
> 
