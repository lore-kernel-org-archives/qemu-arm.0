Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp473248njb;
        Thu, 4 Jul 2024 02:20:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdICeKeHIwJrS3hydv9R4jSpOyXuLPa6G7gPGCFniR8Q6idl8J5qoKiaPdGFWTRCV3l5Qkwu4uC+wDkt5IZPiOhamnNAvp
X-Google-Smtp-Source: AGHT+IF1CrCNdCNu0UiHYoCeWSYZztXzS59K6x8atzA5vLPAd6P8GN8gWQHZJ9kOcPWAmTv0uaLp
X-Received: by 2002:a05:690c:ec4:b0:64a:956b:c063 with SMTP id 00721157ae682-652d8438d69mr13256577b3.39.1720084824121;
        Thu, 04 Jul 2024 02:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720084824; cv=none;
        d=google.com; s=arc-20160816;
        b=JeTxYhVyObPS5hq3uyZE3pJCo6t3t0n8WqhLSk9LFrcz55coM7xAC5OE3rOKrhZknM
         7KpQruCpZw9tZwlDRxl2Y2q4IzZUD6RfysDXJVGfRYJ5/G4p8CdVGmFFUz4hsfY0dFXQ
         CZzdbWejxTZS+PKB8F48RC7JJvYESVFI6+4GjxRsjj/bX/ks2F2zPPJ5Gbj0HeU72sOd
         oP/dWgAHB8sEIFfKdmshrUxwpssJtc/xsuxoCeosgMvp+fgERU7yku1kpcpyJ7xECCow
         HSHFK8bmIn/SX9/z/e7+JmnlXxhXRC0RYopCSJwlw7RBc3UQXi/r/wjb193rGpt8Xr9T
         ZzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=9a/IDQ3z1PPbNOMUinMqIZT9FNvLq2C44pxpw850WYs=;
        fh=99LDCLNDIGyo70K5tizYz4Wx+QKxBdnC4BaKqLN7Z0w=;
        b=tM/CdGI2ym5wFqTvrba+gAZHHsmcDT/wf7MBEGJ8+3T8UUPSTWhDb57sqKbkl1KQpC
         VvTFbuAWLdt69m4WnL8tWqsGoDqBtI382OCshw+enDWB/B8jKad0nO7PRFiQ3XV6OkFi
         6ubdE4U6Ps/eW8I+pr5aVRYUNhirsIu3g/iVbNu2QCqCPCp9gOydasbMNjyPdlkyMTMR
         vnFi68O4Jb5iFxOfqffMgVbSvJE9KzYdn7F4Q79jjk9jwoChW5hF9D7Ksv5gGEguiOlR
         1ESTNcbI5XcqVAUnKu+6gjo8PGA4XVNpNyCc3mt1bXEZHcD4XlnDltWIvc2DAeaokSe3
         Lrrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79ee480f7f9si285498685a.649.2024.07.04.02.20.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 02:20:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPIdC-00071r-Ez; Thu, 04 Jul 2024 05:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=mgHy=OE=kaod.org=clg@ozlabs.org>)
 id 1sPIdA-00071P-Hk; Thu, 04 Jul 2024 05:19:56 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=mgHy=OE=kaod.org=clg@ozlabs.org>)
 id 1sPId8-0001hO-DG; Thu, 04 Jul 2024 05:19:56 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WFB1d01m1z4x0C;
 Thu,  4 Jul 2024 19:19:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WFB1V2rr7z4wnx;
 Thu,  4 Jul 2024 19:19:42 +1000 (AEST)
Message-ID: <f4bce63e-bcb3-4d77-8c8f-629ad0d72f77@kaod.org>
Date: Thu, 4 Jul 2024 11:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] hw/net:ftgmac100: update TX and RX packet buffers
 address to 64 bits
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:Block layer core" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
 <20240704082922.1464317-5-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240704082922.1464317-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=mgHy=OE=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mqC0c+T7rPpi

On 7/4/24 10:29 AM, Jamin Lin wrote:
> ASPEED AST2700 SOC is a 64 bits quad core CPUs (Cortex-a35)
> And the base address of dram is "0x4 00000000" which
> is 64bits address.
> 
> It have "TXDES 2" and "RXDES 2" to save the high part
> physical address of packet buffer.
> Ex: TX packet buffer address [34:0]
> The "TXDES 2" bits [18:16] which corresponds the bits [34:32]
> of the 64 bits address of the TX packet buffer address
> and "TXDES 3" bits [31:0] which corresponds the bits [31:0]
> of the 64 bits address of the TX packet buffer address.
> 
> Update TX and RX packet buffers address type to
> 64 bits for dram 64 bits address DMA support.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/net/ftgmac100.c | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 68956aeb94..80f9cd56d5 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -175,6 +175,8 @@
>   #define FTGMAC100_TXDES1_TX2FIC          (1 << 30)
>   #define FTGMAC100_TXDES1_TXIC            (1 << 31)
>   
> +#define FTGMAC100_TXDES2_TXBUF_BADR_HI(x)   (((x) >> 16) & 0x7)
> +
>   /*
>    * Receive descriptor
>    */
> @@ -208,13 +210,15 @@
>   #define FTGMAC100_RXDES1_UDP_CHKSUM_ERR  (1 << 26)
>   #define FTGMAC100_RXDES1_IP_CHKSUM_ERR   (1 << 27)
>   
> +#define FTGMAC100_RXDES2_RXBUF_BADR_HI(x)   (((x) >> 16) & 0x7)
> +
>   /*
>    * Receive and transmit Buffer Descriptor
>    */
>   typedef struct {
>       uint32_t        des0;
>       uint32_t        des1;
> -    uint32_t        des2;        /* not used by HW */
> +    uint32_t        des2;        /* used by HW 64 bits DMA */
>       uint32_t        des3;
>   } FTGMAC100Desc;
>   
> @@ -531,6 +535,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint64_t tx_ring,
>       int frame_size = 0;
>       uint8_t *ptr = s->frame;
>       uint64_t addr = tx_descriptor;
> +    uint64_t buf_addr = 0;
>       uint32_t flags = 0;
>   
>       while (1) {
> @@ -569,7 +574,12 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint64_t tx_ring,
>               len =  sizeof(s->frame) - frame_size;
>           }
>   
> -        if (dma_memory_read(&address_space_memory, bd.des3,
> +        buf_addr = bd.des3;
> +        if (s->dma64) {
> +            buf_addr = deposit64(buf_addr, 32, 32,
> +                                 FTGMAC100_TXDES2_TXBUF_BADR_HI(bd.des2));
> +        }
> +        if (dma_memory_read(&address_space_memory, buf_addr,
>                               ptr, len, MEMTXATTRS_UNSPECIFIED)) {
>               qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read packet @ 0x%x\n",
>                             __func__, bd.des3);
> @@ -1022,7 +1032,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
>       uint32_t flags = 0;
>       uint64_t addr;
>       uint32_t crc;
> -    uint32_t buf_addr;
> +    uint64_t buf_addr = 0;
>       uint8_t *crc_ptr;
>       uint32_t buf_len;
>       size_t size = len;
> @@ -1087,7 +1097,12 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
>           if (size < 4) {
>               buf_len += size - 4;
>           }
> +
>           buf_addr = bd.des3;
> +        if (s->dma64) {
> +            buf_addr = deposit64(buf_addr, 32, 32,
> +                                 FTGMAC100_RXDES2_RXBUF_BADR_HI(bd.des2));
> +        }
>           if (first && proto == ETH_P_VLAN && buf_len >= 18) {
>               bd.des1 = lduw_be_p(buf + 14) | FTGMAC100_RXDES1_VLANTAG_AVAIL;
>   

