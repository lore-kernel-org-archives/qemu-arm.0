Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1451660ejb;
        Mon, 20 May 2024 06:44:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4GhBgC8W2YffCEiHQ0OfrS+8L3B7UOwZhyx2M9Gt95/lSto9IBwOfhCLX/UmmzWcbhIi0hhAfnm66F72lOs3iUlqnwxG6
X-Google-Smtp-Source: AGHT+IEcOjyEt8bGk445fG3Y0YVFUYZWH4Ok5hjfd/eeJh5ndJdINfhfpWypBD3tCPS3NKzA0jqI
X-Received: by 2002:aca:2412:0:b0:3c9:9379:e833 with SMTP id 5614622812f47-3c9970ba580mr31591446b6e.40.1716212659662;
        Mon, 20 May 2024 06:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716212659; cv=none;
        d=google.com; s=arc-20160816;
        b=uLMUh74PLvkH7cw2e4f9tfmWbHghwhw3F89//XmA4lPy4cu+dz+94RQ9Ou8dbUWW0M
         OUpiyMAoHGEuMii0wwIsZGT09MOQXZBHB9qfCA4pz1Vkf5+JwCUwidf3xP4vwttA9MQ2
         8lymTeixWTEN8CGIiCO0bqjf6rQ2P2t7hvk0WY9V9L80zgS56jrzAA+w4Nzsjk7zPvPN
         a/yX2KTxicVhBnFuWPbzuPh0b413zSnEre/CoAghLyCznymlBQ2zv8S/h3pZuUukQ0ou
         TVlmQYUMorxPZQ7NBBCwwqklUz2Wi59wdShuAfdFZtR1K7ilUOHMKcbYMWcN8penQiGl
         6BfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CQJ0dr6xj2U9L7Z89lH1uYRqxyd/Zt8Blr5zZkqfx7A=;
        fh=ijP119EnVLiqsZTtsIHu7rOdanx1S5LXAfE5wBlaat4=;
        b=IRm3C4KHpMSKHtqoVURBJRGTAUuO0JbXP2ZC+eCc//0y6X9FJcaT25T+LFclZ8/RuQ
         SMMZXKxNY6wh+lAZDtPtsk1H81D1zhNmpD3gfV0VLY90F8nr1zbVtYg/CiTkckNSW7B+
         flxZhQyFTFyDCZJBf9NAKkdIiO6dnXl2Bm5kHGIrHCsWdDzgSPOFn6TeO4eecrRYUCKP
         sxFzWWkNnGLb07C4Ey1Bg2RCjVCkttvlWT+UoOYY1y8mb7cDBxFj23aR+YAWd7vWrlry
         DVZaoPxIGZ0rImeXfgajcLT0YvlbRAMX/zhtuouJ00OEAvWwuOaRZFaF2U4vgHT5g7KP
         Bsrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmiFjN39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79308660111si987870085a.740.2024.05.20.06.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 06:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DmiFjN39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s93Ir-00015z-Kn; Mon, 20 May 2024 09:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s93Ip-00015G-Hx
 for qemu-arm@nongnu.org; Mon, 20 May 2024 09:43:47 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s93Im-00068w-LD
 for qemu-arm@nongnu.org; Mon, 20 May 2024 09:43:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57342829409so10362212a12.1
 for <qemu-arm@nongnu.org>; Mon, 20 May 2024 06:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716212623; x=1716817423; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CQJ0dr6xj2U9L7Z89lH1uYRqxyd/Zt8Blr5zZkqfx7A=;
 b=DmiFjN39I9ymgLgxq7C/6/mh63LBLInO5SG6pHg0lQb8sQckOFFs5m2HihI8E6PG17
 t0575TPpOunxwCeVl0235UuHPPTsSEsUnuxFs8DLvUscd9fgtOvvoCnrgoXuVtzHnvas
 FT8KE1WBnLaj2PQiT1mY2ZlZZEPTyMLr8rO83w9Q2Bfalw52MbBSIpq6IVhiZmSWeGwp
 Pp4RO9WAdnktYYzYZfi/KX7Kd9NenTqVKRNR0Zz//g0rFs8eIv803FMd8Vhc5fJkVGxD
 Hy+mzXtN2PS9x0fZJuVRcgOAjA7juxOxCjnjfu1Crg5vvAxH7kSEMKAf/ulDrH9Qlw3X
 V6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716212623; x=1716817423;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CQJ0dr6xj2U9L7Z89lH1uYRqxyd/Zt8Blr5zZkqfx7A=;
 b=UnxyfY2GLEgYSLq9M1k0StklXGOeh6XQ6Iv8OtZ8ZSNrF5NBe6I/5iIkXDnkvm0T1p
 m0Io/WZzSeWo4DugdDqNSE+xCw0Mwnki1rOb/6A36oLm7i/hVDRBWmeh4g0Vbs5y+03A
 xhtuwDJZifyQ5kcGZb4JZ5RHLAVvnb8KUX7FNhfmru8NRhB8RFODYKRciM+cqHgt0qtR
 jSlG3xvOkrOogI3InvKcPPFnRmcpf4k/t8zPossybkgL6vwUSQLhxT6lidkGBLis6UfD
 cAHW2RErjy2wsUiMWas56lLdqA6qhJqt2loxm3e+OZNUWt38lWvbWEu7hN6qalfgikch
 jnMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeTWv00kH9QURo5egfKNe8BxrosqW6ylo1X5XTbRzzDPYiRceI4csai655nTJyt+AkZNacKMKt/CAdLKiuJgBDhRcQ
X-Gm-Message-State: AOJu0YxztKc8QPxsJKbPUjpw6MvpLN4JYvU/ZFx0K38mcAoQe4BPIcWE
 3y4UJEBGzUxraN0QyoYWzUomRtHrVcIMlNar6EQoJvqgSIymBAfp9L6/5tDOuZaMk3DAKZzMDfY
 l/BJ48Ghsx3Xwn7ulhOJO9U1KDBVtCVP8KvhdIA==
X-Received: by 2002:aa7:c3c5:0:b0:574:ea61:3b00 with SMTP id
 4fb4d7f45d1cf-5752b4554a9mr6086427a12.8.1716212622776; Mon, 20 May 2024
 06:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240507130349.86851-1-sebastian.huber@embedded-brains.de>
 <20240507130349.86851-2-sebastian.huber@embedded-brains.de>
In-Reply-To: <20240507130349.86851-2-sebastian.huber@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2024 14:43:30 +0100
Message-ID: <CAFEAcA9VQZ-EinEiaTp1_tu4Xb7E4tN4rprJu40uumVUfTiLpQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/xilinx_zynq: Add cache controller
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: iySWlA5dx+8I

On Tue, 7 May 2024 at 14:04, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> The Zynq 7000 SoCs contain a CoreLink L2C-310 cache controller.  Add the
> corresponding Qemu device to the xilinx-zynq-a9 machine.
>
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> ---
>  hw/arm/xilinx_zynq.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 3190cc0b8d..078abd77bd 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -242,6 +242,7 @@ static void zynq_init(MachineState *machine)
>      busdev = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(busdev, &error_fatal);
>      sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
> +    sysbus_create_varargs("l2x0", MPCORE_PERIPHBASE + 0x2000, NULL);
>      sysbus_connect_irq(busdev, 0,
>                         qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));

If we add the cache controller to this board we also need to
update the board's entry in hw/arm/Kconfig to add a
"select PL310" line. This ensures that if the user asks
to build the zynq board type then we will also compile in
the PL310 device.

thanks
-- PMM
