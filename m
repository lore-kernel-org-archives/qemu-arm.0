Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1129857wrm;
        Thu, 17 Oct 2019 08:47:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxYsV6kUENxZseOf91txrReLKYB2saGWSulbYWhOLvmUlVvRZQ9pTYAjao2Q42daTuLHtXC
X-Received: by 2002:a17:906:5a98:: with SMTP id l24mr4231411ejq.40.1571327224689;
        Thu, 17 Oct 2019 08:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571327224; cv=none;
        d=google.com; s=arc-20160816;
        b=OvV8HTAMYsAVqN72Om1rGVpo8+xQaHwSDH8nz+HbSJZ5yXzi51NtVPt8T2N2kp+fH4
         /j1MMB8yu79vc2/bLefz+xh+RWcp6t0lBlxZ0ka9qDtBQUPEivetOwM4cMKIW/UjVxp8
         TMj+30gog6ZBugJYacCumt6UvGh/7y35emjFZ639VVYlzYHxN01Bs2ODuYuFwKVIxA7U
         9LK12Wkgbh0U04gF9TZXVBoiodF9aa7l4XQ0g8pboPGm3WcvaNb6nL3jRGgRPI3lzjAQ
         xDk4ugUemSXtj4NB1EmlKfZMeF1N1vr0e7iVn4Ya3a9PXdf9oDJzhA+uepY1Qf8hsYcf
         zYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=uMdAiWip7KyhYWmFEHqoUDP8uaHMYKFRgJSe/YWHELs=;
        b=uw/oKXr/kQ4zoH3VZC78pc5gP1HkFX5JYccN895qT5FXsnHGh+97Hd4G1q+PhcYkkk
         giii+UQ/mCqOQu2352kkolT2SmrF6CSuReRyIeb5cSZ321G/fOKPz0/diJrTORus9mBy
         4CM47RqeaqKePXdpfrZghDu4Z+0n7/IKmFmssWdHH7bpPAXemgzbylCdCwk3O6yWz7wh
         anodN9YGbQbLWdEgal4Q9RmUOVfcNaK3btgF3Zx8kdm5Ir1G5YU4imQ3CMDfxiZnQwHi
         P6VyAz0FgeR0WiW2EKMczlOERXnHLylljshp4BiqDhDdiz1Dp3KbLfZ1qMYrHukKeK1d
         Esng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si1945632ede.118.2019.10.17.08.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 08:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL7zT-0008Ry-DW
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 11:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iL7D8-0005CI-6g
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 10:57:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iL7D6-0003AX-VJ
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 10:57:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47124)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iL7D6-00039Y-NO
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 10:57:04 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 70B0B2A09A1
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 14:57:03 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id r21so1176909wme.5
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 07:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uMdAiWip7KyhYWmFEHqoUDP8uaHMYKFRgJSe/YWHELs=;
 b=nmrmTKHw8u7nD+gFVb+02xMqNsp+kcN8EY0CQAHn5tQI/FLDFEhTGL4QcQNEPifwbn
 0KvL/ykl+QxZTdamXNqUYsYIainrKF0HrnM3jsUmIHtOjSN5pcllWBnOCl97AYg+sOex
 VAxCYJ9nFkRKEAC7SPaBd4je7GNoRWryWfCUyi69cESUUF2WuKCB8Eb1kETqdEqcGhQT
 fxcG1Cmb2+QMGMoF6DSwR/hwJEZ99YkaOC0251nimmLIJlEWokQlkGUo0nNt52FBY+KP
 ypCH8+Bya5//95F+vnfMkbqYnSEhkaofiIUFH+qGUYaEDNTs8BHxqRqgcYwNTfy60txG
 Mw/A==
X-Gm-Message-State: APjAAAX40WGhk67hVtpwK72xX4bEojPlCGk3BEmkA8fh5ib+d3ZxylHX
 Ru5ng484U0JeCeWOFzKX+dVyuu9HC1GgvT76Uje10iIqPTDVze4jXpcxQIEI08MU4bIunck8bJj
 V1sbnxPKUTMFC
X-Received: by 2002:adf:f342:: with SMTP id e2mr3636564wrp.61.1571324222153;
 Thu, 17 Oct 2019 07:57:02 -0700 (PDT)
X-Received: by 2002:adf:f342:: with SMTP id e2mr3636535wrp.61.1571324221921;
 Thu, 17 Oct 2019 07:57:01 -0700 (PDT)
Received: from [192.168.50.32] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id h63sm3543106wmf.15.2019.10.17.07.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2019 07:57:01 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/timer/xilinx_timer.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20191017132122.4402-1-peter.maydell@linaro.org>
 <20191017132122.4402-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cabcec27-c6a7-6ea7-e933-589f2385c137@redhat.com>
Date: Thu, 17 Oct 2019 16:56:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191017132122.4402-3-peter.maydell@linaro.org>
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
X-TUID: J4Jg5oZw57bj

Hi Peter,

On 10/17/19 3:21 PM, Peter Maydell wrote:
> Switch the xilinx_timer code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/timer/xilinx_timer.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
> index 92dbff304d9..7191ea54f58 100644
> --- a/hw/timer/xilinx_timer.c
> +++ b/hw/timer/xilinx_timer.c
> @@ -28,7 +28,6 @@
>   #include "hw/ptimer.h"
>   #include "hw/qdev-properties.h"
>   #include "qemu/log.h"
> -#include "qemu/main-loop.h"
>   #include "qemu/module.h"
>   
>   #define D(x)
> @@ -52,7 +51,6 @@
>   
>   struct xlx_timer
>   {
> -    QEMUBH *bh;
>       ptimer_state *ptimer;
>       void *parent;
>       int nr; /* for debug.  */
> @@ -134,6 +132,7 @@ timer_read(void *opaque, hwaddr addr, unsigned int size)
>       return r;
>   }
>   
> +/* Must be called inside ptimer transaction block */
>   static void timer_enable(struct xlx_timer *xt)
>   {
>       uint64_t count;
> @@ -174,8 +173,11 @@ timer_write(void *opaque, hwaddr addr,
>                   value &= ~TCSR_TINT;
>   
>               xt->regs[addr] = value & 0x7ff;
> -            if (value & TCSR_ENT)
> +            if (value & TCSR_ENT) {
> +                ptimer_transaction_begin(xt->ptimer);
>                   timer_enable(xt);
> +                ptimer_transaction_commit(xt->ptimer);

Why not move these inside timer_enable()?

> +            }
>               break;
>    
>           default:
> @@ -220,9 +222,10 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
>   
>           xt->parent = t;
>           xt->nr = i;
> -        xt->bh = qemu_bh_new(timer_hit, xt);
> -        xt->ptimer = ptimer_init_with_bh(xt->bh, PTIMER_POLICY_DEFAULT);
> +        xt->ptimer = ptimer_init(timer_hit, xt, PTIMER_POLICY_DEFAULT);
> +        ptimer_transaction_begin(xt->ptimer);
>           ptimer_set_freq(xt->ptimer, t->freq_hz);
> +        ptimer_transaction_commit(xt->ptimer);
>       }
>   
>       memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, "xlnx.xps-timer",
> 
