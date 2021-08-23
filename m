Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1652955lfg;
        Mon, 23 Aug 2021 01:18:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeJ8tMEEZAWQECdvxvCYiF8BSeOrJmaEkiS9Km9J8GMiVltyCe3flI5wfrUuaUDPBpsjB2
X-Received: by 2002:a05:6e02:12a2:: with SMTP id f2mr21744549ilr.222.1629706680182;
        Mon, 23 Aug 2021 01:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629706680; cv=none;
        d=google.com; s=arc-20160816;
        b=p7OHsZR7aqVDwwJdKO5N8MQpQ+KoTcbzmytA/i7ba6vbhfWXZGG1/y+dpQB3XqkZm1
         hnuymbL+Z2HZfkzfYAImL18olU1J8BsX5eh1eD410NmDKir1y9whYAalvpcpyjAb5OQc
         44VFfOO/s5Y6wjVu2HTyFTZJ5Puh8hC2MxiUJn1OK+BehJXxT8we9MN95SlNR9dkxYjf
         xAdR8LqhagRBUgdc5HpUNnZYBoqNK5cmLzUjz6xzQExcxhsLrt5EIDsfY9OpLr2zY+15
         7y3tt57MPlquxXNxYiNcWt48M0PbdcN3Wu1BqD5kRMn46LlHk9Rv5Mx44rISNL7YopS4
         4YJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HYUJDP9yQYyEkdl6waq2l9A/E5ben0d9BvzkTQ8q64c=;
        b=yOjhCRSFySHUAWCJPj0Yvmq3mkyadnEiisDN6h1Y2lB0TaalNuJKYVbhussf0sDu3s
         rRX+GYv1oGehN5JXXGGY2vdyiCTOLW+PI4cJNVO2W/gO6XUx4ELkUUTkSJayve2wiS+x
         qtqwqCtPvhcgS4+qNTKIbnx2IRnRbKvWHQZgQIXk3rSNwbN07IhpDu5EXNlB3p9K1pbK
         id3Lb2w+osmJRigxq9qZcMtE0siTWRPZDjJHFZdiYxVmM35qphuilM+XIPKM0R3GgYFe
         pHXOfPQQfXpe0/fATjqSsXhxcPQQd4MJcTn97OP1GDRytjDyAE8r7tUXZQbT915nTysL
         s8+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nXFNYLrq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q74si8167913iod.9.2021.08.23.01.18.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 01:18:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nXFNYLrq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mI59b-0007pa-ID
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 04:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mI59R-0007pN-8k; Mon, 23 Aug 2021 04:17:49 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mI59P-0006Az-N8; Mon, 23 Aug 2021 04:17:49 -0400
Received: by mail-wr1-x432.google.com with SMTP id e5so8413452wrp.8;
 Mon, 23 Aug 2021 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HYUJDP9yQYyEkdl6waq2l9A/E5ben0d9BvzkTQ8q64c=;
 b=nXFNYLrqpBiVNBPCU98lE03zjFyHn2jlGlbfp9kWkAT+jXx8hlsGQ3uf/Pub2ubz62
 PLX+e2S22B24OE2Kc/DLe50uW4g5nhR8UHUJiinXaWwFxH2dBKMBmvfZaav+qDyV/0dY
 lGiCOaRkkdp4vdbHlE/rp9daTe1byr2bvidJKf905wne/jJWeE0rId1lwN6MhTbVsVvR
 BM6JFREAZucgyeb9zFl57lzM1LUdksfyNe9RDi4ZhyOX0geFLEyP2liyA2c25iyAaQMF
 21J9b3GTa3561MnkWvAy5RpYfZwWqv51WAIVtf8eL/A/7XncRKRfK5lj1462ZIhTetMO
 1TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HYUJDP9yQYyEkdl6waq2l9A/E5ben0d9BvzkTQ8q64c=;
 b=oOwi+F6K9T+Hiu+i3M/Ezv32GcfCc/uJ3ac0ULo9b/g4J+J72ey0Uvl+PrDATs0ona
 Ks6ckivrvapjra+1xoS+8XFV7krsAJhB3z78mUO5/F66j+E90+tj5gMLyh1h5q+pePbK
 dyiEpxXx+FJN4nLsFi/ubJKeCQW5I38nUwcoO7ljvUmHghRtux7zahcPK/GpXvIV5+Dp
 I874sZFVeh0XwPfjk2JtevoZQiv3LBXqdHY8FaQrxqk6RSN2LjQglsLyoDvLtJrblS0b
 8FNAABXH0E59ebo74SuJ6jY6ha/appmmVPKTKruSPcfX3OCIy3WUWlPKVAE6r4gAsqpd
 Ig4A==
X-Gm-Message-State: AOAM533OlMHgF8H1f7rIi5VhuQgVZKJzArho8GAiVB0AvBfwRACm4Ywk
 lL2uJY9qQbDyQ1gIs26JyK9iozndiBo=
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr12114259wrx.183.1629706665170; 
 Mon, 23 Aug 2021 01:17:45 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z19sm20902669wma.0.2021.08.23.01.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 01:17:44 -0700 (PDT)
Subject: Re: [PATCH 3/3] hw/char: cadence_uart: Move clock/reset check to
 uart_can_receive()
To: Bin Meng <bmeng.cn@gmail.com>, Damien Hedde <damien.hedde@greensocs.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3482fda3-b9fa-7b85-dd4c-d09e71f186a5@amsat.org>
Date: Mon, 23 Aug 2021 10:17:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823020813.25192-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
X-TUID: sT7Y92tS6jfZ

On 8/23/21 4:08 AM, Bin Meng wrote:
> Currently the clock/reset check is done in uart_receive(), but we
> can move the check to uart_can_receive() which is earlier.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
>  hw/char/cadence_uart.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 154be34992..7326445385 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -235,6 +235,12 @@ static void uart_parameters_setup(CadenceUARTState *s)
>  static int uart_can_receive(void *opaque)
>  {
>      CadenceUARTState *s = opaque;
> +
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return 0;
> +    }
> +
>      int ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
>      uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
>  
> @@ -358,11 +364,6 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
>      CadenceUARTState *s = opaque;
>      uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
>  
> -    /* ignore characters when unclocked or in reset */
> -    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> -        return;
> -    }
> -
>      if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
>          uart_write_rx_fifo(opaque, buf, size);
>      }
> 

Almost the same I just sent in patch #2 (minor you declare variables
mid-scope). Drop #2 and use that (or untested snippet) directly instead.
