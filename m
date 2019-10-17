Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1134521wrm;
        Thu, 17 Oct 2019 08:50:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMukl8PkwDOkU5uFiyF39XWxRMsJaFduVWxqpFeuPWOCMdnrQ/DVVQZwRMGtM9/vIbIbjK
X-Received: by 2002:a17:906:1651:: with SMTP id n17mr4120252ejd.220.1571327435744;
        Thu, 17 Oct 2019 08:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571327435; cv=none;
        d=google.com; s=arc-20160816;
        b=kV+vWUwW35ASrBjcOAvQ/3O9KVucjJcN5Ny2q3B7k+eJYxxW52UXJr2baFqz0c34m2
         Lw94FZe6BYZYuSEXMZOfYSRlT3tOemVNiAW85Ns5FN99T81XSOM6vNjcRN4LVrfLX51f
         wy4ZabvIoCIKGcZPwZ61aC5UqQuxu9uyDUyddMT/MUadT8034ev62SOK5Kof9zYxm56g
         LwSLvVxgG2TglXpAdOdRieddWb4xOBeJa0tVoDDaH7W5t8NbKH+6POCvCYcy6NAud2hy
         q1s8K7t2f8/k53uteeQpGRYVtYNSEqWZqVWQXeFH85dJVaj55v9aqPQiX74MjeUybGgh
         eG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=xiOnFR8zeJSyvv//++lhxYz9K3RkXaCChwBO1zVkPGg=;
        b=KnZvqfyZ82s5b4AMMVTwr+EElFNju6mLyu3MK8BqfdMIpIjYPMYr1aDr2i8LPV5Zu+
         nXSgTfZZx26pmcT8SOXmK6pXMupPBgmFdyhj3yFj9DA3vrotyloNJmt2dkhDuOfPWIlP
         QI89Rq7OT6ZLEyWgon88h6TseZZFGmtZPIVtOVDHepA2rl3AEixQP51V4VeNTwzDaEMj
         r9e9KpT9BB4stTgoaXwBd4cqzgoLVSvvhY2gYW4HgRwnd7wtYcssMbwT7PBumfsKH8O5
         /si5xkFdgRsfwo5RUsgWc8s9rAXRdQBx/oU9+liQFjPlDmBXG0zBPvVAkwRmyA/D1Jy5
         6w4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si1597779ejw.231.2019.10.17.08.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 08:50:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL82s-0004UD-2Y
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 11:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iL7HU-0002ZV-Io
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 11:01:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iL7HT-0005UE-9i
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 11:01:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8083)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iL7HS-0005Sq-UU
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 11:01:35 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A781B757CC
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 15:01:32 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id v8so232383wrt.16
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 08:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xiOnFR8zeJSyvv//++lhxYz9K3RkXaCChwBO1zVkPGg=;
 b=MAIkVqzIIZl+CLKUp6TQDDJfd05dnL8Hm2CDUd1/Il4jUsrtctBf9ZWz4nP0JTaJvv
 LnFLAYEtGUDTmsIJsHDV4UqiWX2NhAVI5R8s/4EVnSV+QBJb4nak1RIspg0Mw1e3sbOj
 SKPCmVotvz3PFvaU3P/o9LstkF4A2RyZ/pZ4uHfEolNk2tN78USDYkQEaiCPg7TEao8k
 hUoDqAfMTsl7DGEgZ/Unfvd/Gwl09YEzLhmNL2uqWaIEP3/k8QquuRO57OLOYEEsI6g4
 51kdVI/JjgH3sAUoe9J57bJcfhEJcw6aLH7u0+3hrnCZ0Q4fa2ZdhEXQir6hZfpN0p9F
 rgsw==
X-Gm-Message-State: APjAAAU3nDIDbssxhAP5TORWz/mfB3s8Aug5WFe4Sem0IEUdrhHuKXw+
 WeCttiHzFpshbzYLLSzynBRLhHPi4ZwPnKvLl5UxAQGjem/lI7L0IOcpjudEnaIYBW3cO+oaNSJ
 X8jDmH2hOlSZX
X-Received: by 2002:a5d:43c3:: with SMTP id v3mr2405949wrr.41.1571324491346;
 Thu, 17 Oct 2019 08:01:31 -0700 (PDT)
X-Received: by 2002:a5d:43c3:: with SMTP id v3mr2405905wrr.41.1571324491113;
 Thu, 17 Oct 2019 08:01:31 -0700 (PDT)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id 3sm2325311wmo.22.2019.10.17.08.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 08:01:30 -0700 (PDT)
Subject: Re: [PATCH 3/3] hw/dma/xilinx_axidma.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20191017132122.4402-1-peter.maydell@linaro.org>
 <20191017132122.4402-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d9e7dd55-01e5-d852-bbab-84f5209abb6f@redhat.com>
Date: Thu, 17 Oct 2019 17:01:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191017132122.4402-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tjDFv9k81yrb

Hi Peter,

On 10/17/19 3:21 PM, Peter Maydell wrote:
> Switch the xilinx_axidma code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/dma/xilinx_axidma.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index e035d1f7504..fb3a978e282 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -31,7 +31,6 @@
>   #include "hw/ptimer.h"
>   #include "hw/qdev-properties.h"
>   #include "qemu/log.h"
> -#include "qemu/main-loop.h"
>   #include "qemu/module.h"
>   
>   #include "hw/stream.h"
> @@ -104,7 +103,6 @@ enum {
>   };
>   
>   struct Stream {
> -    QEMUBH *bh;
>       ptimer_state *ptimer;
>       qemu_irq irq;
>   
> @@ -242,6 +240,7 @@ static void stream_complete(struct Stream *s)
>       unsigned int comp_delay;
>   
>       /* Start the delayed timer.  */
> +    ptimer_transaction_begin(s->ptimer);
>       comp_delay = s->regs[R_DMACR] >> 24;
>       if (comp_delay) {
>           ptimer_stop(s->ptimer);
> @@ -255,6 +254,7 @@ static void stream_complete(struct Stream *s)
>           s->regs[R_DMASR] |= DMASR_IOC_IRQ;
>           stream_reload_complete_cnt(s);
>       }
> +    ptimer_transaction_commit(s->ptimer);

I'd restrict the transaction here within the if() statement:

-- >8 --
@@ -244,9 +244,11 @@ static void stream_complete(struct Stream *s)
      /* Start the delayed timer.  */
      comp_delay = s->regs[R_DMACR] >> 24;
      if (comp_delay) {
+        ptimer_transaction_begin(s->ptimer);
          ptimer_stop(s->ptimer);
          ptimer_set_count(s->ptimer, comp_delay);
          ptimer_run(s->ptimer, 1);
+        ptimer_transaction_commit(s->ptimer);
      }

      s->complete_cnt--;
---

>   }
>   
>   static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
> @@ -551,9 +551,10 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
>           struct Stream *st = &s->streams[i];
>   
>           st->nr = i;
> -        st->bh = qemu_bh_new(timer_hit, st);
> -        st->ptimer = ptimer_init_with_bh(st->bh, PTIMER_POLICY_DEFAULT);
> +        st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_DEFAULT);
> +        ptimer_transaction_begin(st->ptimer);
>           ptimer_set_freq(st->ptimer, s->freqhz);
> +        ptimer_transaction_commit(st->ptimer);
>       }
>       return;
>   
> 
