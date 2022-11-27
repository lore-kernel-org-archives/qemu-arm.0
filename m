Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp8019782ejx;
        Sun, 27 Nov 2022 14:30:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf75X6U7ULTsdrCY7e/lx9thYuYQfJ4z6SHMDIbW0ZgYQOOYMZ5wUXJm8IoB2gmindDnK+Rz
X-Received: by 2002:a05:6214:1c6:b0:4ba:171b:8978 with SMTP id c6-20020a05621401c600b004ba171b8978mr28054575qvt.82.1669588251773;
        Sun, 27 Nov 2022 14:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669588251; cv=none;
        d=google.com; s=arc-20160816;
        b=YFtI317MY6Qr8mTOT8NkeaQYFZgvNMFAoest1gVu/60R7s/jGfojT1sjjTDhIP14Fr
         7czEEUMpADjsbwVF+S6RcwPnNjPNJ7EJfK0ltXSNzwL45NcTDPb/pML9OBzBc8BvzFv+
         EGcDn/6Xc5X3V4WbG63Gd5V1fTVGBO1K5GsTHccgGJIn/2Ivkf74FLlFYCIFxwxT0v3P
         wKvZVne1+mqE6JUpgHbsz3jOfySknzkSfH3Oc+YqxfKmPSPoA/HpPbj62Jq0orUK6UFN
         6s5XGaiYudqNievYym6YRosj7DAxTKMzeBcL/3GxNTACTFNjb9E+ykO+Mu936LmVWVvI
         TkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IzLELE2/eXDuGDIW1pSyUFcbsTjmOMUlxGZOw4MnXt4=;
        b=Uu7qd3v2O2Dr8neqBX9gV90vnR+ljwtbnu4vKToGtEV6NaNJY2/lRiSqRhk2JAh0hx
         0nrr1laoiWewxwWZS3wvUIPB+Ffm1Gt2kV7yThUeT2aqDC/ELimQ2BSm28uFcxDf9D7z
         W0CvXZNFfhQPKoy6RzzXMr/UIiNW6ZzXn5L0JLxuYHQKBgDjhf2RoNvHFPd4MTDDy6wc
         h08lis3pKqk2ukq1HWPfx6zQF+Lyuc0xl9nq5rKD9jZ0vUuvq3ln8VKRNa3G4IuW3adf
         9wTkDmgIc3hBRi4yy4fI1Sl1ICBKuGcLC9I5kgBQ+tyRB5N3dBqV+21hqYR84glS9oVk
         R1kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=iR1HuCLw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hr14-20020a05621423ce00b004c69e59a994si6044840qvb.162.2022.11.27.14.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Nov 2022 14:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=iR1HuCLw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozQAZ-0007Ul-6G; Sun, 27 Nov 2022 17:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ozQAV-0007TG-3M; Sun, 27 Nov 2022 17:30:35 -0500
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ozQAS-0002uM-Iq; Sun, 27 Nov 2022 17:30:33 -0500
Received: by mail-vk1-xa31.google.com with SMTP id o24so4437600vkl.9;
 Sun, 27 Nov 2022 14:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IzLELE2/eXDuGDIW1pSyUFcbsTjmOMUlxGZOw4MnXt4=;
 b=iR1HuCLw1NEH3dIEmPiavxIz3sP1GJ3BFvUaZgTwy51DKVxNBUbbhUMq2U5SRGwIcl
 zYmFouk274xwe+wo4Ok0PrgmneeJbHIBZvlpbpZ3p2OTWBIMqv2lm5v3GX0Oz5GI6Ybc
 za8VX6SHQzXNCSQgePeJh0VGas0hYEHmLzwSaCTz5BzZf+Ki66KUF9rhkrwui32tWPyp
 uciPTCeeFWXIqOxAl6AUpniYSPhJnuxnyQZmAyVbwFaAcjd9trBjRW2efrq3rnG5dhY1
 eoHH0Fe6KifDA8Yp/yBolE7WxiATk+K1FeFXz4jblGnQutLB1w1VwX2srgWTBSZp/crk
 Swew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IzLELE2/eXDuGDIW1pSyUFcbsTjmOMUlxGZOw4MnXt4=;
 b=AcTeXjLZ+w8cYtOBROmoRH2TDfJxKxpjXf9FoaNV1JHlEVs8wO7RJ783JAtOoanbaG
 DPjuvZIsb4g4N2VVbQQaJDoycCwAOcCdekzDYvOoaFX+2yUWW0DxWa4Mqp1kVkKVqi2/
 lpMfpx2XW2+kQcwc+5bnAKL2GKXQudoBDo5uzKOhYt8JVXYutN18RXZCAJCqqjWvZKvm
 5k3PNzrxXpjH0TCuDRPYxzu0TFOb3TNeDVoRpa4mx7QylEZofVKFrXbk/aSaSdam+Mn8
 QCiQrQVwh2WsEZF3PFh9fqqA+ENxB18wuHHz8BKVhAeCaRzmrmMM2j1RkeJiSQh8og1Q
 Uebg==
X-Gm-Message-State: ANoB5pn+7d7iUkqztdDooobracQrZMP+B7Yyem8FTOlaEwGbXX2BGalt
 tjt801xlu0Wv/oB97TlQbrZpUM2ZEpdx7mb9ZdU=
X-Received: by 2002:a05:6122:c97:b0:3b7:cbb8:bbf1 with SMTP id
 ba23-20020a0561220c9700b003b7cbb8bbf1mr27461531vkb.25.1669588230018; Sun, 27
 Nov 2022 14:30:30 -0800 (PST)
MIME-Version: 1.0
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <20221124115023.2437291-2-peter.maydell@linaro.org>
In-Reply-To: <20221124115023.2437291-2-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Nov 2022 08:30:03 +1000
Message-ID: <CAKmqyKPYFJ-0bQDtRAFZTrV0TOMc314Mq=LEDfkrJ84arr_WdA@mail.gmail.com>
Subject: Re: [PATCH for-8.0 01/19] hw/core/cpu-common: Convert TYPE_CPU class
 to 3-phase reset
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, 
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, 
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1yB0Q5kz6TEt

On Thu, Nov 24, 2022 at 9:57 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Convert the parent class TYPE_CPU to 3-phase reset. This
> is a necessary prerequisite to converting the subclasses.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/cpu-common.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index f9fdd46b9d7..78b5f350a00 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -116,9 +116,9 @@ void cpu_reset(CPUState *cpu)
>      trace_guest_cpu_reset(cpu);
>  }
>
> -static void cpu_common_reset(DeviceState *dev)
> +static void cpu_common_reset_hold(Object *obj)
>  {
> -    CPUState *cpu = CPU(dev);
> +    CPUState *cpu = CPU(obj);
>      CPUClass *cc = CPU_GET_CLASS(cpu);
>
>      if (qemu_loglevel_mask(CPU_LOG_RESET)) {
> @@ -259,6 +259,7 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
>  static void cpu_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>      CPUClass *k = CPU_CLASS(klass);
>
>      k->parse_features = cpu_common_parse_features;
> @@ -269,7 +270,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_CPU, dc->categories);
>      dc->realize = cpu_common_realizefn;
>      dc->unrealize = cpu_common_unrealizefn;
> -    dc->reset = cpu_common_reset;
> +    rc->phases.hold = cpu_common_reset_hold;
>      cpu_class_init_props(dc);
>      /*
>       * Reason: CPUs still need special care by board code: wiring up
> --
> 2.25.1
>
>
