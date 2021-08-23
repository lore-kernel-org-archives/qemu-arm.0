Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1651404lfg;
        Mon, 23 Aug 2021 01:15:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy88Oln6dZKSb3kjtNdlSbAEKHiGDSDCuMWjIY7U8vkiXb/cTOxYHT149jLdsWoTm6pg0RH
X-Received: by 2002:a92:4b01:: with SMTP id m1mr20623514ilg.50.1629706527521;
        Mon, 23 Aug 2021 01:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629706527; cv=none;
        d=google.com; s=arc-20160816;
        b=gZRj7ZyAuYe4Csr9pRlnuplW8thD7w4XR8TrIYZTor1RKRzyUeakycui2VankgNJDG
         6aZy5/CrbdPn7+mKPqFCiF3Y3zo1JFwFZE/UBdTpi0IyBoGJHdwVb7vDq/FtIRwlLEhs
         Y2rgBanYKr/Xpan79uURqlmU5jqqzvt9+lp7K9ALexU4ioCUZslev1GtQOBvM1QBwaDb
         p9Pup+UAlpfceEF7PdINzIdOiZ6TAk+6/jlawWCzbcXId68JR/DMZP7G3jjUB+13rfjB
         qy2j1WJyLrQUw64clZu8KOkWi8DCULr+5/T+L08pymucfW/gJZu0Cp1KVHdr0LQpHiME
         colQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Rp12FW45nIspOLay8wQfl4Zclw/0iR2DP8wCqptWEA8=;
        b=q4c6zA/lUFaUGmRyi+PouXD0aFAetd0NOcYKSM43DLsf6P8rFTdgXWAhHRUnijiUNe
         jq00RrZjAe0XjntPBcfDw0N37EaNlWcBIaZBgl94ZpW6bPsxKTWGG3T28KLuMZapvKiC
         FKYwNbjGdXJLc9UxNUbuGqNWY/UdKq+24yQn+DVZTNXh4ZKgtTIhd5xWtreQxVWFQzNw
         s2uYlOTfdXmmtRtx8bhdg1ChLdWydG7ie5y1MPVhYNXamIQ58bednPM5Dj8i13rrzX6o
         lWWsnfxeGLbXaQkAzw3kMAzl8pbZkmKqVxwzFkR9MlXv0HKBzB12hlGiWOgWIPQTDaMv
         WkYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aAz8oI8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si13586272iob.28.2021.08.23.01.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 01:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aAz8oI8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mI578-0004aZ-RZ
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 04:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mI56f-0004aJ-B1; Mon, 23 Aug 2021 04:14:57 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mI56d-0003nX-OC; Mon, 23 Aug 2021 04:14:57 -0400
Received: by mail-wr1-x431.google.com with SMTP id d26so4629704wrc.0;
 Mon, 23 Aug 2021 01:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rp12FW45nIspOLay8wQfl4Zclw/0iR2DP8wCqptWEA8=;
 b=aAz8oI8KJ904Sp+i6dO3Beb7AH8L0f1geLE8SLz+xS5hEUcCfshcxSnHWI48V9ZN9b
 RyQ41WCYCwk83uXSHi6K6SrmouyjLJBDt4+qpicygw7fkzf87ieetntJO8mpi2Yokr5y
 oPjbYjcpO2JpZv4MQf0swx2la5Qy9TG6NRF2A1MkWzhbYm1XGwsjijv2yHoqrSR7wnmv
 7G8et8+nhejZ2+ObhH7e1wqN3Q76ZFuc/MU0w+draX9dphOV0FD9e/TlBThYBM2z1sg4
 90ziqKiUNkcXRaoQ/oGffxgoruWjQjYvbSHlgccst74ZVRyt85hEOy+OR2xVMy/VZmDY
 9hTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rp12FW45nIspOLay8wQfl4Zclw/0iR2DP8wCqptWEA8=;
 b=LZqvMYFbtefSsoj8Ymq8aFAESOstO7xWzlYO3HLtJs1rgTCmYUrf5QmwPZabDsYgWq
 c/TBzG5cpp4jHlldvh+YQwjGvGy08mengqIa+UKiriw94UBTx4B7xuj7IQAda+CxwAXG
 KbFJZzVlSr5zbCSHd917s9EqHX2cYjujOsv6L6crTwztYfwPsCMy2ovRMmeBGjTq2+pj
 /uF9NwjdLlykNZCc8asMmOj3Qi2nNyoXR0dcMt3sHK65el7fjH18SFFctJh5oMWSkorg
 qvnEazcO9qaoh3pcm4zade/YNAgebO+Z/W06PUC4JoqVKydoUbe9S/tiZa+qa0Iqtmc+
 gT7A==
X-Gm-Message-State: AOAM532UHoTveE0kYeVyeJeIoCOfyh3dg/qCv4nm5O8QbHaX/PE/o6zr
 xGQ2brdQrgo3ExcCgulq2KuR0B6LerM=
X-Received: by 2002:adf:f0c2:: with SMTP id x2mr11938079wro.107.1629706491624; 
 Mon, 23 Aug 2021 01:14:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a133sm17591232wme.5.2021.08.23.01.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 01:14:50 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
To: Bin Meng <bmeng.cn@gmail.com>, Damien Hedde <damien.hedde@greensocs.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-3-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7997927e-3a66-aa0e-6099-f1efe3cbb9ee@amsat.org>
Date: Mon, 23 Aug 2021 10:14:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823020813.25192-3-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.959,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gRoBwoqfXK+g

On 8/23/21 4:08 AM, Bin Meng wrote:
> At present when input clock is disabled, any character transmitted
> to tx fifo can still show on the serial line, which is wrong.
> 
> Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  hw/char/cadence_uart.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index b4b5e8a3ee..154be34992 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
>  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
>                                 int size)
>  {
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return;
> +    }

Incorrect handler?

-- >8 --
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index b4b5e8a3ee0..4f096222f52 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -235,8 +235,16 @@ static void uart_parameters_setup(CadenceUARTState *s)
 static int uart_can_receive(void *opaque)
 {
     CadenceUARTState *s = opaque;
-    int ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
-    uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
+    int ret;
+    uint32_t ch_mode;
+
+    /* ignore characters when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return 0;
+    }
+
+    ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
+    ch_mode = s->r[R_MR] & UART_MR_CHMODE;

     if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
         ret = MIN(ret, CADENCE_UART_RX_FIFO_SIZE - s->rx_count);
---
