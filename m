Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp726074lfm;
        Sun, 16 May 2021 15:47:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLBgk1kN9ayldOsgsmGPozvAK3kTqjukLS6VLRN5Sul3+/gpFWTWBncQ5GyD/aYKrifUWb
X-Received: by 2002:a05:6e02:13d3:: with SMTP id v19mr13566712ilj.168.1621205234395;
        Sun, 16 May 2021 15:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621205234; cv=none;
        d=google.com; s=arc-20160816;
        b=VE66rm3hRkO562hkHV58rwUBOWBxMOkvU6O8bNOq0MAlU+R2c+oYyaoK7R2m4Wd/FE
         W4P9/ZnNqryIn4qyaABT6cel+RxHJ9p/laQQwD39iKNaHDhX/m2kg0WgDx5j7s+PHQw2
         ZTKn6enennkQGgOjPvDp/48H5fy05khfxRnz07W1owNPIffgu43mq+R+K9/AcVnw63Z3
         zmYqfX8PKGTkv00jJyGdXjrNNdlc9sk8lCdxMWaAcbaU1ilmj3s/XeS5TqHTmXxfuiSR
         BEQmYUFgSCi6a0Jml3X8r7ZAs5O977Q6wdhbPkT7goDUrg+XCQI7gUyAMRdcwI/P8lrq
         1hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hrXTXWPZhn9oIB3MzeEglY9dwQ0r4L02q/8ExvhFZbw=;
        b=PYOADz1BUknxmT18VbUI8SfYaEnokFpoDBf/h4fARilDF/6J3+0oMWyHZIOUmxvr3c
         tbMRz49Uxubigrs7qNeRBkvW2rSQXswLw4YUYpERiWI/W6ad9sD1EYbBN1gZ2goBzEMJ
         TjGNNyybpDK/f97Z06aQciu/PkaZ/eSLu4LlkTkr/RtL6t7MidQ2Je1OLxXZsGXpytk3
         UUTwXcAnUNMhedA49FMJqFG5j47pdfyDxgXVHAIYwbYQQ4j7ESfHAqYyFEi8Ty8GNJJn
         hJ8isq6OkUlMb3yO1G2sUjucWPHP/ybt7JTzkgK4OienMRyRGktPi2fXTjb04a9zGdiB
         P1cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qxxaG+eh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si16800723ilo.83.2021.05.16.15.47.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 15:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qxxaG+eh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liPXV-0007U5-OM
	for alex.bennee@linaro.org; Sun, 16 May 2021 18:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1liPWE-0006XK-VA; Sun, 16 May 2021 18:45:54 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1liPWC-00029K-3D; Sun, 16 May 2021 18:45:54 -0400
Received: by mail-il1-x12e.google.com with SMTP id o10so3476175ilm.13;
 Sun, 16 May 2021 15:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hrXTXWPZhn9oIB3MzeEglY9dwQ0r4L02q/8ExvhFZbw=;
 b=qxxaG+ehJ9icUOcoV71MVH6cFtuY1fTqf+musbrd5cmQ9Ug4BeHZiaQ5OQ8I2yd/ok
 S3fteqHpedh8xiWTmoZhmUtZD0DuaLeCFowjgGlAAq5ymvsiPgWk/EHl+8VrsnO/1LbN
 wCrSr6aQE/wRPLL+91hQ+rqo3U2VjqZnffCGX0dkvXdPc+RIbiZMPYRUTNo7rKTILc5Q
 eKeXHtpQj3f5ZDBa40JcIE/Mvxgp6IfrGBX1Qo8BEhQip0TuwCncv4ZkOk8C2HoKKyf/
 OVfP4ce4E4ZL1M/BcxlqscmaBSa0OglV98HxlzQWcLXo3oLPwindDQOZdP7CvLpKoeux
 Awhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hrXTXWPZhn9oIB3MzeEglY9dwQ0r4L02q/8ExvhFZbw=;
 b=ZtGLKObQ4P7Y7J/9qQiAzsFRb0dLm+/4IVYBrkcYwZZmMsZW55OF1+x9Nnz/9cTaMz
 Khx6ooeYMbgoHfKtV/ks2esUUVfKbBBwNZjrfdd8yu3Jc7YTljlNcC2M7qxjoZ2x2h1Q
 eDnmAEXePIo3kTOh+4oqQ43D4GavuX24YaZu4nHkqX+s0E4tNm9cX4hDNksI9dZ4tYWk
 PNkg/9sMAuIX9YgsWeUwQWVCDNsLL1B0Cda73GT/GcO6QWAiJfxFDKhSYPBPjqgT/H+L
 T9HZgtt5zGIgXqRn5M23h+gBJP/lMBZXvgSHcOt48cpCfzO2cx4OuT/Mkpy02rtrJ1Ev
 7tXQ==
X-Gm-Message-State: AOAM530DOj3LR6dObRwGicmPmjJx/Xq3RV5rJsIzKjzyZDnojxosPGuz
 T6XGQS1/TZ6N28YZIe5bPBBC4vql8If04i1r9EA=
X-Received: by 2002:a92:c26d:: with SMTP id h13mr21674973ild.131.1621205149495; 
 Sun, 16 May 2021 15:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-7-philmd@redhat.com>
In-Reply-To: <20210515173716.358295-7-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 May 2021 08:45:23 +1000
Message-ID: <CAKmqyKMDXfDEKVE+5DLJ7SoTw5p9V4E3BCD5xFvFGQsgmaJrjA@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] hw/riscv/Kconfig: Add missing dependency
 MICROCHIP_PFSOC -> SERIAL
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jbn0JnCxpE3e

On Sun, May 16, 2021 at 3:44 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Commit a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART
> emulation") added a dependency on the SERIAL model, but forgot to
> add the Kconfig selector.
> Add the dependency to the MCHP_PFSOC_MMUART symbol to fix when
> building the MICROCHIP_PFSOC machine stand-alone:
>
>   /usr/bin/ld: libcommon.fa.p/hw_char_mchp_pfsoc_mmuart.c.o: in function =
`mchp_pfsoc_mmuart_create':
>   hw/char/mchp_pfsoc_mmuart.c:79: undefined reference to `serial_mm_init'
>
> Fixes: a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART emulatio=
n")
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/char/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/char/Kconfig b/hw/char/Kconfig
> index 4cf36ac637b..2e4f620b13e 100644
> --- a/hw/char/Kconfig
> +++ b/hw/char/Kconfig
> @@ -61,6 +61,7 @@ config AVR_USART
>
>  config MCHP_PFSOC_MMUART
>      bool
> +    select SERIAL
>
>  config SIFIVE_UART
>      bool
> --
> 2.26.3
>
>
