Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp893139lfb;
        Fri, 22 Jan 2021 06:22:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhNtBtIE8iL331wiEkpKkeOVTNX+o2Whb62HbG32xLgS/HRDKeBuHZnf45hFwbl1q1yF8K
X-Received: by 2002:a25:3f41:: with SMTP id m62mr6108146yba.209.1611325361349;
        Fri, 22 Jan 2021 06:22:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611325361; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJILzUDNk27oG0aUcRyRXxhefIlTv0WL0FJ/rvlE6riEpLdcSHiLP+Sx46JCrjDWwK
         iKSzOJJy0iSa9VAFUwQ2w/+g4f7r4QFJqR6EIeBTO35YtmNr41FrfrphQYzsob5pPaZ9
         mRGRiijPe8CknMdqu+Doryxz3icOvngdAACJAgx11iZoqKFIF8zp9hlP2qdAMtcOJ2/S
         rFlI3d0P8Y0m/W5RMGdxRl1SzgiPWsg5TXrA/K0kpL7ivR0OYwCaOVtzvl5bjmOZefFC
         xh1xpLyBO/K1iAPUHgGScExOm9pPCmKccJjpnxd+vL8V6vxPTab42jtLBeBp4ksDbm9I
         VVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=BZr6sDNcCgeUlARkGZE2pYefUM9XfWaCmA93O5S/HHA=;
        b=It1HjfLcLs/HnHEXYiRYuUrnW8vM38yTCl9lFF6JEBJNK0fgcPdyso3UKbftmQs0Pl
         LzJmkWmA3hnkZQLylSV/QT0qfhSt83a3XNHBtiS4Qult4Upfnbk5yFIfNFmeCKgOkT8i
         0tnFeCBLGWkmJuPrNEwSzE3Jz2c4tblexkNbZg5QAkYTJoxaZu217DPEgP3qFDo2Bj+x
         1S01NpmEyyej1YuDSghFbsfHvrsJ6FQFT8goDV4N3mbpCzlbiF29vhQTBslqzyy3T3dm
         rXKVT4wu7hkSJhZc29vCc08kUAbZuIvxj+4cGQ+TYPqA86dzde2o4NigCb+0CdhFIds2
         FFOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=G0dK7tmi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si8083694ybs.490.2021.01.22.06.22.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 06:22:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=G0dK7tmi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2xKi-0007qP-Lc
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 09:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2xKM-0007ph-7E; Fri, 22 Jan 2021 09:22:18 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:34798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l2xKF-0002rB-34; Fri, 22 Jan 2021 09:22:17 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 5B35AC602E6;
 Fri, 22 Jan 2021 15:22:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611325327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BZr6sDNcCgeUlARkGZE2pYefUM9XfWaCmA93O5S/HHA=;
 b=G0dK7tmiMpwnrHC8gYBiajH/YnjnyumuiKvWDNUvjnB31N0MQNU1hrLhIJOjDpIa/DWFdY
 OrAIuq4MBJi0MnXXEq+8Wk3nZx9P1f6Mn8UvdMtTy+V/nUIiUFtMSHuf0jSNdJCYFmj8ii
 7HY9TH1lhEvMTHR+1sE2TfF/HJUEwqz5r3Xwb9GLke3diiasVKKK+iJOb8TX9pt/z1CELd
 NK2rLP6rWzqRc9zI6S8iWIgDWbuHciCkYDpreG32+y10bm65+p4CW3xfUBuLKqeshj7xXI
 N5uUQ9bkDdq7kEbbX/P/0HJjaoUOgOqKG2FT+yQUQkrE1tT6XMvE09LnjXWmgQ==
Date: Fri, 22 Jan 2021 15:22:28 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 06/25] hw/timer/cmsdk-apb-timer: Rename CMSDKAPBTIMER
 struct to CMSDKAPBTimer
Message-ID: <20210122142228.v3wnfzz447j5w6nj@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-7-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-7-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9zkCHYudJaPl

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> The state struct for the CMSDK APB timer device doesn't follow our
> usual naming convention of camelcase -- "CMSDK" and "APB" are both
> acronyms, but "TIMER" is not so should not be all-uppercase.
> Globally rename the struct to "CMSDKAPBTimer" (bringing it into line
> with CMSDKAPBWatchdog and CMSDKAPBDualTimer; CMSDKAPBUART remains
> as-is because "UART" is an acronym).
> 
> Commit created with:
>  perl -p -i -e 's/CMSDKAPBTIMER/CMSDKAPBTimer/g' hw/timer/cmsdk-apb-timer.c include/hw/arm/armsse.h include/hw/timer/cmsdk-apb-timer.h
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/armsse.h            |  6 +++---
>  include/hw/timer/cmsdk-apb-timer.h |  4 ++--
>  hw/timer/cmsdk-apb-timer.c         | 28 ++++++++++++++--------------
>  3 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
> index 77f86771c30..83f5e28c16e 100644
> --- a/include/hw/arm/armsse.h
> +++ b/include/hw/arm/armsse.h
> @@ -153,9 +153,9 @@ struct ARMSSE {
>      TZPPC apb_ppc0;
>      TZPPC apb_ppc1;
>      TZMPC mpc[IOTS_NUM_MPC];
> -    CMSDKAPBTIMER timer0;
> -    CMSDKAPBTIMER timer1;
> -    CMSDKAPBTIMER s32ktimer;
> +    CMSDKAPBTimer timer0;
> +    CMSDKAPBTimer timer1;
> +    CMSDKAPBTimer s32ktimer;
>      qemu_or_irq ppc_irq_orgate;
>      SplitIRQ sec_resp_splitter;
>      SplitIRQ ppc_irq_splitter[NUM_PPCS];
> diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
> index 0d80b2a48cd..baa009bb2da 100644
> --- a/include/hw/timer/cmsdk-apb-timer.h
> +++ b/include/hw/timer/cmsdk-apb-timer.h
> @@ -18,9 +18,9 @@
>  #include "qom/object.h"
>  
>  #define TYPE_CMSDK_APB_TIMER "cmsdk-apb-timer"
> -OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTIMER, CMSDK_APB_TIMER)
> +OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTimer, CMSDK_APB_TIMER)
>  
> -struct CMSDKAPBTIMER {
> +struct CMSDKAPBTimer {
>      /*< private >*/
>      SysBusDevice parent_obj;
>  
> diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
> index f85f1309f37..ae9c5422540 100644
> --- a/hw/timer/cmsdk-apb-timer.c
> +++ b/hw/timer/cmsdk-apb-timer.c
> @@ -67,14 +67,14 @@ static const int timer_id[] = {
>      0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
>  };
>  
> -static void cmsdk_apb_timer_update(CMSDKAPBTIMER *s)
> +static void cmsdk_apb_timer_update(CMSDKAPBTimer *s)
>  {
>      qemu_set_irq(s->timerint, !!(s->intstatus & R_INTSTATUS_IRQ_MASK));
>  }
>  
>  static uint64_t cmsdk_apb_timer_read(void *opaque, hwaddr offset, unsigned size)
>  {
> -    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(opaque);
> +    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
>      uint64_t r;
>  
>      switch (offset) {
> @@ -106,7 +106,7 @@ static uint64_t cmsdk_apb_timer_read(void *opaque, hwaddr offset, unsigned size)
>  static void cmsdk_apb_timer_write(void *opaque, hwaddr offset, uint64_t value,
>                                    unsigned size)
>  {
> -    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(opaque);
> +    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
>  
>      trace_cmsdk_apb_timer_write(offset, value, size);
>  
> @@ -181,7 +181,7 @@ static const MemoryRegionOps cmsdk_apb_timer_ops = {
>  
>  static void cmsdk_apb_timer_tick(void *opaque)
>  {
> -    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(opaque);
> +    CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
>  
>      if (s->ctrl & R_CTRL_IRQEN_MASK) {
>          s->intstatus |= R_INTSTATUS_IRQ_MASK;
> @@ -191,7 +191,7 @@ static void cmsdk_apb_timer_tick(void *opaque)
>  
>  static void cmsdk_apb_timer_reset(DeviceState *dev)
>  {
> -    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(dev);
> +    CMSDKAPBTimer *s = CMSDK_APB_TIMER(dev);
>  
>      trace_cmsdk_apb_timer_reset();
>      s->ctrl = 0;
> @@ -206,7 +206,7 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
>  static void cmsdk_apb_timer_init(Object *obj)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> -    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(obj);
> +    CMSDKAPBTimer *s = CMSDK_APB_TIMER(obj);
>  
>      memory_region_init_io(&s->iomem, obj, &cmsdk_apb_timer_ops,
>                            s, "cmsdk-apb-timer", 0x1000);
> @@ -216,7 +216,7 @@ static void cmsdk_apb_timer_init(Object *obj)
>  
>  static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
>  {
> -    CMSDKAPBTIMER *s = CMSDK_APB_TIMER(dev);
> +    CMSDKAPBTimer *s = CMSDK_APB_TIMER(dev);
>  
>      if (s->pclk_frq == 0) {
>          error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
> @@ -239,17 +239,17 @@ static const VMStateDescription cmsdk_apb_timer_vmstate = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
> -        VMSTATE_PTIMER(timer, CMSDKAPBTIMER),
> -        VMSTATE_UINT32(ctrl, CMSDKAPBTIMER),
> -        VMSTATE_UINT32(value, CMSDKAPBTIMER),
> -        VMSTATE_UINT32(reload, CMSDKAPBTIMER),
> -        VMSTATE_UINT32(intstatus, CMSDKAPBTIMER),
> +        VMSTATE_PTIMER(timer, CMSDKAPBTimer),
> +        VMSTATE_UINT32(ctrl, CMSDKAPBTimer),
> +        VMSTATE_UINT32(value, CMSDKAPBTimer),
> +        VMSTATE_UINT32(reload, CMSDKAPBTimer),
> +        VMSTATE_UINT32(intstatus, CMSDKAPBTimer),
>          VMSTATE_END_OF_LIST()
>      }
>  };
>  
>  static Property cmsdk_apb_timer_properties[] = {
> -    DEFINE_PROP_UINT32("pclk-frq", CMSDKAPBTIMER, pclk_frq, 0),
> +    DEFINE_PROP_UINT32("pclk-frq", CMSDKAPBTimer, pclk_frq, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -266,7 +266,7 @@ static void cmsdk_apb_timer_class_init(ObjectClass *klass, void *data)
>  static const TypeInfo cmsdk_apb_timer_info = {
>      .name = TYPE_CMSDK_APB_TIMER,
>      .parent = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(CMSDKAPBTIMER),
> +    .instance_size = sizeof(CMSDKAPBTimer),
>      .instance_init = cmsdk_apb_timer_init,
>      .class_init = cmsdk_apb_timer_class_init,
>  };
> -- 
> 2.20.1
> 

-- 
