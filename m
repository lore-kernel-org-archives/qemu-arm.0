Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3309255ejc;
        Wed, 15 Nov 2023 23:25:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGI/OGv3645RA1Ep1gWzhSlbB0xAE/VVQAJZjNOZSVwU540JSw8zoC6HFki23l4badsiNgG
X-Received: by 2002:a05:620a:27d4:b0:76f:8c6:a537 with SMTP id i20-20020a05620a27d400b0076f08c6a537mr8446306qkp.77.1700119524406;
        Wed, 15 Nov 2023 23:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700119524; cv=none;
        d=google.com; s=arc-20160816;
        b=D9MPIfqm9dAKrvvtC+DBrjt8BCHt8Mqr4dw/bTqYNZu+GRdEZSqZq0D6N57q/Nj3Ix
         lMGZHXyZJyzW5kffbYL8BVs2UtAfIjEQo8qgZ9i2xJCCkC+hB+9rwPnpo+ZA/W9Pa557
         2uF4AqgRIGhKlvAQwPHBaoTUhP8tNUmbii8VaAmsRgWw/D2qnNs0NKT+y1j8red1qQ+N
         20sH+DGx8WQJ4EPvq3RqzdC+f0ZIpI2fO2m+LH8+IP6yQ8prGFHKGjvRIxu94paq7g9S
         xhNOYoF5Pomyi3npTlSPwfawLYli1YPLhdAps1FRm7RU8lTskUDJhvC2YWwHdprxhcHB
         4hVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9Jw6fAaO8aPY2GrW3I/fm74DvqQUUQuYMx2Cw5e4KTA=;
        fh=6vqG7cGNO6LmokQUY3ba+tX6Asv8siBuykh7rn+T4Kc=;
        b=cfxoWZuP636xenwD2DuQnzU6LP4Trq38JIznWLE8EAOK1nQm7/iuRHkvjMykErh8pJ
         JEQF7X9EgL0999KQj9JbbAIczimuEUBL/3wN15kbpOMNWgsC2IB+VedGdfObURS/k74s
         H+q4uCCzyCZWuXqvp/Vsv/x/dP9WIoVUTZXAAGSkO0c1WGgTvBFoMbcEz6o/ScDbz0Xc
         c8F76rvx160DabXU0MgZwKttYBxnocAPP+F5zdn1NjrHh1aDRDQ2x/kDPwm8Zd/UiphD
         A/Et9wPQiJfM8FDKFa81OfgvSGCYvqZEkbWKsQbaHxbF73lnhGgxRqW4J034IcB6c0jO
         dYWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cufaug0E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15-20020a05620a24cf00b00778b8c8d2fcsi10687437qkn.716.2023.11.15.23.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 23:25:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cufaug0E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3WkT-0003rz-SM; Thu, 16 Nov 2023 02:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3WkS-0003rk-71
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:25:12 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3WkQ-0002Sd-Bt
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 02:25:11 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32f87b1c725so374456f8f.3
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 23:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700119509; x=1700724309; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Jw6fAaO8aPY2GrW3I/fm74DvqQUUQuYMx2Cw5e4KTA=;
 b=Cufaug0E2xulqxkUsQpg45Ta7gF1t+z7Z9KVKfAZH8VjdZ/ApDpOKjVEqRq4bZjvru
 sCZhlX97wmga5V+2fpA2SWfVyUwses35f+QMc0uALSH7BCSUWWENDlm58nQqyYSX2aD8
 8GtI/+4JUP2JEclLbM027fjpmy6ZB8/1EnYFnI2JYmZBmVgZOWNT0rNrn+29Z9oNGcx3
 +h2kVaRfT/Re+xEp1RCD2kvYxVx6jr7taHGvvFLNm8yASVzt+tv3p9KoCO3qWDX4+56M
 VqOtpIAfTCnsYEsL/R4MXo4YH3tSxznRGoRYy990nx13jcOiuz3qf+sJHy0DHy2YvNhg
 QVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700119509; x=1700724309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Jw6fAaO8aPY2GrW3I/fm74DvqQUUQuYMx2Cw5e4KTA=;
 b=Lze57fEqM3hYT/3eC7jGBEmJlTfKAaa7aViz/q+dU2hxC5pdGpFQmf3cRQ5bWoQZYf
 iLN8/X5Fys5GGlztY86DCkg55hbrSDkVYPynLki5aDBQLB+VXvrD4Qaw7RuTVRCU3CS/
 Y7mVnumaucF0etWmBednPY9DYze/AdYjL4qi+9M3MCOWWMWNwE7PH5TcZRVZmGkesMnc
 y3586aoLXF8tzrO9qvcA2KVgijaYMdz14XWgfjOsuaWgLGDhIF01mVmKQdzi7Z6W4Hbv
 JDoIRd1HLKtIIYxb6ppWc6cUhh/m8T2GvtlID9IV6lUBliLb8HUWVGAN+2DN6Q3NNgVX
 WbbQ==
X-Gm-Message-State: AOJu0YxKmTb1Hesa7FX/sIaYEoR44Roe0J72MT2Gsjiq1jlhUKo3vVqo
 upMc/rKmKFsx4e4nHSPm110Elg==
X-Received: by 2002:a5d:47a8:0:b0:323:1d6a:3952 with SMTP id
 8-20020a5d47a8000000b003231d6a3952mr13133258wrb.4.1700119508660; 
 Wed, 15 Nov 2023 23:25:08 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d48c1000000b0032fdcbfb093sm12592668wrs.81.2023.11.15.23.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:25:08 -0800 (PST)
Message-ID: <bd08361d-cb43-4ee5-9fbc-534d1349c56c@linaro.org>
Date: Thu, 16 Nov 2023 08:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2? 3/6] hw/arm/stm32f100: Report error when
 incorrect CPU is used
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 Tyrone Ting <kfting@nuvoton.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Hao Wu <wuhaotsh@google.com>, Felipe Balbi <balbi@kernel.org>,
 Gavin Shan <gshan@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair@alistair23.me>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20231115232154.4515-1-philmd@linaro.org>
 <20231115232154.4515-4-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231115232154.4515-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: D0zcyJzw24IM

On 16/11/23 00:21, Philippe Mathieu-Daudé wrote:
> The 'stm32vldiscovery' machine ignores the CPU type requested by
> the command line. This might confuse users, since the following
> will create a machine with a Cortex-M3 CPU:
> 
>    $ qemu-system-aarch64 -M stm32vldiscovery -cpu neoverse-n1
> 
> Set the MachineClass::valid_cpu_types field (introduced in commit
> c9cf636d48 "machine: Add a valid_cpu_types property").
> Remove the now unused MachineClass::default_cpu_type field.
> 
> We now get:
> 
>    $ qemu-system-aarch64 -M stm32vldiscovery -cpu neoverse-n1
>    qemu-system-aarch64: Invalid CPU type: neoverse-n1-arm-cpu
>    The valid types are: cortex-m3-arm-cpu

With [2] from cover applied, this becomes:

      $ qemu-system-aarch64 -M stm32vldiscovery -cpu neoverse-n1 -S
      qemu-system-aarch64: Invalid CPU type: neoverse-n1
      The valid types are: cortex-m3

> Since the SoC family can only use Cortex-M3 CPUs, hard-code the
> CPU type name at the SoC level, removing the QOM property
> entirely.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/stm32f100_soc.h | 4 ----
>   hw/arm/stm32f100_soc.c         | 9 ++-------
>   hw/arm/stm32vldiscovery.c      | 7 ++++++-
>   3 files changed, 8 insertions(+), 12 deletions(-)

[2] 
https://lore.kernel.org/qemu-devel/20231114235628.534334-1-gshan@redhat.com/
