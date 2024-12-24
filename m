Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4569861njk;
        Tue, 24 Dec 2024 01:04:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUvXbq3f1LVmfKdH5CMY9CDEsNSt2UDyFWpkRP7HPUkRSaDWmqKBA3IdRrMs+OBhifEAygK0GrQWk8OVw==@linaro.org
X-Google-Smtp-Source: AGHT+IEhzBbhvQ2tWU8dAGxwmpp5UdVzvenqpGBBd+5k2Ztkp1d84eYvJ2wLuUotAnG0fzb5Y/Ak
X-Received: by 2002:a05:620a:3915:b0:7b6:dd82:ac9c with SMTP id af79cd13be357-7b9ba6ef8a0mr2701932085a.12.1735031080511;
        Tue, 24 Dec 2024 01:04:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735031080; cv=none;
        d=google.com; s=arc-20240605;
        b=dI/bjarEXFFlv0xMH8Kdr8ruzeBA7DwngKDCP/KCEyT0I2xz7T8Je3CqMKCkq9Tdts
         wJ/3vHupx4eDBVIVrAaEATFpwdNq0P6tcESWuj1ugynVdcrLOEfsSFozBpUTwqoz3mOy
         1dZgYV6dV/NH+Obq9nQUMReq5Gx/0tUH3t/8uFMAfy/Rm4I/n+1455rvUwt4Iu4i5ifW
         5FJGjscqftp8HtR7Auv9BlA0DFGfSjAhkbxLkJ/V64naVjSRv9M+syfl01EzGqQYGBBt
         /+A71eZuJaY34nzpXcyEB5kQWPBLVrfsQ86aaYj0AzLR7nMWlfAAth2Kg0O76zNaPX5b
         6vfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LZpc8CnU6oSKDG84MCVH8xhVz73IT3gitEVwFXsqeTQ=;
        fh=ymJF4MCbMaXh33TPXA6JK3Apothz1Z88XLSqQCbQxX4=;
        b=OlmaRu4KPeRVRYsHffMZpzIERpcLSetyW7Cnb7mo5QkWQpQw0gAaEnpEIF/16JuFWZ
         MYgAfVqXbN5wgVHIy5KaTtFll2Un5LNdGlsyl01Fm6dG9I8e+Hey34ub1p+wjVYJIgMC
         4kj8w3mz5osxXd3uyQNbDle1nOtc84Hz6LmpZOixJ6MEUqyhgvPiDgBMil+ImbN+4MMW
         iwNZdv3oPwxp07xbCO/7m/f/iMXDxoBx4XninqBpeUEUd0GQ6oSJ7wH/utmMBK0kZj4v
         rjbEcMxbnZcSRsa8LwYwtPT7irFr1uEvzZPdhheuZuxJ2vGC1fIrFaV73NG7hAOn9lTw
         tKzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i4rg4//L";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4809cdsi1428117785a.222.2024.12.24.01.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Dec 2024 01:04:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i4rg4//L";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tQ0q0-0007Wg-T8; Tue, 24 Dec 2024 04:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tQ0ps-0007Vd-TT
 for qemu-devel@nongnu.org; Tue, 24 Dec 2024 04:04:21 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tQ0pp-0005f9-Fv
 for qemu-devel@nongnu.org; Tue, 24 Dec 2024 04:04:16 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso2750696f8f.0
 for <qemu-devel@nongnu.org>; Tue, 24 Dec 2024 01:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735031052; x=1735635852; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LZpc8CnU6oSKDG84MCVH8xhVz73IT3gitEVwFXsqeTQ=;
 b=i4rg4//LZA82Fh05KxH53/fGcJ0bRgc/6zGkPVcAB3PQSnPvRRuORQn64pMSy/w9WD
 euIQNGFWCVqtdf1dg/2U3Ymd8XRXUfxHezQhp8hs8gNfuRaVvjsYY/pJW+AimHnx9AH/
 vMVcIQOPdK17uzN2SGrsZfjycKUHalUqbERZl+Nhn3EN67yP8tJ//55Kfzt9QSJ1Jju8
 sjaLlq/T33gzRkZyWefyaroI9cOoRjnBQ9EgJm2bkwEtUhCnTnWkVzYyxkRRPmdHlALk
 y0BuNbpZn2wfbKhq+yKy07VQwzIHpmG4sNw46xzL5UAQM+glXngziGeQ3udPablfA2Wt
 sQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735031052; x=1735635852;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LZpc8CnU6oSKDG84MCVH8xhVz73IT3gitEVwFXsqeTQ=;
 b=s3ClK+pYfv2X56NcdXhJZi+mC+FVh8kaH2qJMKx6LskJIVkFYw5nJveCXuhTlBACF6
 TbncLZQKYUJQlO97synqEJNy4+W3iQaM0lU+gyY9/yeM697NojCAMKpIah+4dKY2WCnr
 GRT9K+ZDxAxdhOWUU6bhbsogSvn3+8FehUvqc0OXWR13Xn/IgWmoy0pPxHpwDQ/dM4hs
 h+mD1+h7US5l3N8P3n95VynW4IQWpOIhYuZI5z2tIXabGRl6yB3Fs7sC2Zdd/1ePUFYp
 gCPj8BcyUXdQ50pCw6Tl5IGEeBeGuAZDPgrY/9XRrqZEXCgAYrzVIfG2HwYLwhH9xPY8
 adQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxlFNcmPD6HJT+UszqYo29JPuPZkaiesva4uAeGCWRmxEKV2CphUgIXotfVqMgJbaWxIvleRWslEe4@nongnu.org
X-Gm-Message-State: AOJu0YyCtFzxm40cegkVAgDUsPNeabWpSc8KH8nL6KUOXc8eOkpFs425
 F0Q1Wq+OH2KQFSiBb9zf5Ug6DEW50fNBoHacoM9W/8qsu/6RUNiqqaZNNbffdeo=
X-Gm-Gg: ASbGncsss1fVMn9eH/FYHZtoj23EYmrQ/9uE9p0KZUeA0S0qtYm2+qxfpSFUYzmlutD
 XTBIU8qL3Btv2cVOa45c7Rx3IA5vJp5ZZFnxuXUioz5JzE7eLfudWyRlVURZW4PTnpV62TQWCMe
 BgRl3lImNjRdNStziPQaajBPizrrIxMddjsJ6LXUjpP5w/rlmn9aVLluM1EI+K8ygfCGRvZvjHk
 dROaCa/B+YHpQL/sXVjENRn35YjKFb1OFvUhagupwdwUusYHq/4mHcUv253mPsGvlA=
X-Received: by 2002:a05:6000:2ae:b0:382:450c:2607 with SMTP id
 ffacd0b85a97d-38a221f3392mr12272620f8f.4.1735031051195; 
 Tue, 24 Dec 2024 01:04:11 -0800 (PST)
Received: from [192.168.1.117] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8ac974sm13520889f8f.91.2024.12.24.01.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2024 01:04:10 -0800 (PST)
Message-ID: <61cff220-b0f9-4924-80f1-13e6eccbf465@linaro.org>
Date: Tue, 24 Dec 2024 10:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] hw/timer/aspeed: Support different memory region
 ops
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241216075353.1308043-1-jamin_lin@aspeedtech.com>
 <20241216075353.1308043-2-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241216075353.1308043-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /UH7Oz/zgo3q

Hi Jamin,

On 16/12/24 08:53, Jamin Lin via wrote:
> It set "aspeed_timer_ops" struct which containing read and write callbacks
> to be used when I/O is performed on the TIMER region.
> 
> Besides, in the previous design of ASPEED SOCs, the timer registers address
> space are contiguous.
> 
> ex: TMC00-TMC0C are used for TIMER0.
> ex: TMC10-TMC1C are used for TIMER1.
> ex: TMC80-TMC8C are used for TIMER7.
> 
> The TMC30 is a control register and TMC34 is an interrupt status register for
> TIMER0-TIMER7.
> 
> However, the register set have a significant change in AST2700. The TMC00-TMC3C
> are used for TIMER0 and TMC40-TMC7C are used for TIMER1. In additional,
> TMC20-TMC3C and TMC60-TMC7C are reserved registers for TIMER0 and TIMER1,
> respectively.
> 
> Besides, each TIMER has their own control and interrupt status register.
> In other words, users are able to set control and interrupt status for TIMER0
> in one register. Both aspeed_timer_read and aspeed_timer_write callback
> functions are not compatible AST2700.
> 
> Introduce a new "const MemoryRegionOps *" attribute in AspeedTIMERClass and use
> it in aspeed_timer_realize function.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/timer/aspeed_timer.c         | 7 ++++++-
>   include/hw/timer/aspeed_timer.h | 1 +
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 149f7cc5a6..970bf1d79d 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -606,6 +606,7 @@ static void aspeed_timer_realize(DeviceState *dev, Error **errp)
>       int i;
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>       AspeedTimerCtrlState *s = ASPEED_TIMER(dev);
> +    AspeedTimerClass *atc = ASPEED_TIMER_GET_CLASS(s);
>   
>       assert(s->scu);
>   
> @@ -613,7 +614,7 @@ static void aspeed_timer_realize(DeviceState *dev, Error **errp)
>           aspeed_init_one_timer(s, i);
>           sysbus_init_irq(sbd, &s->timers[i].irq);
>       }
> -    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_timer_ops, s,
> +    memory_region_init_io(&s->iomem, OBJECT(s), atc->reg_ops, s,
>                             TYPE_ASPEED_TIMER, 0x1000);
>       sysbus_init_mmio(sbd, &s->iomem);
>   }
> @@ -708,6 +709,7 @@ static void aspeed_2400_timer_class_init(ObjectClass *klass, void *data)
>       dc->desc = "ASPEED 2400 Timer";
>       awc->read = aspeed_2400_timer_read;
>       awc->write = aspeed_2400_timer_write;
> +    awc->reg_ops = &aspeed_timer_ops;

Simpler (and safer) to initialize a common field once,
in the parent class, timer_class_init(). Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   }
>   
>   static const TypeInfo aspeed_2400_timer_info = {
> @@ -724,6 +726,7 @@ static void aspeed_2500_timer_class_init(ObjectClass *klass, void *data)
>       dc->desc = "ASPEED 2500 Timer";
>       awc->read = aspeed_2500_timer_read;
>       awc->write = aspeed_2500_timer_write;
> +    awc->reg_ops = &aspeed_timer_ops;
>   }

