Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1416690wrt;
        Thu, 4 Oct 2018 15:16:49 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62LDa67H+VL/cdnsUeu7D6WvCtp22RCcCPc+pzHrVWzyN30EeXlDxQ+lFXr+GriX3scHsEm
X-Received: by 2002:a0c:87ba:: with SMTP id 55-v6mr7070188qvj.202.1538691409523;
        Thu, 04 Oct 2018 15:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538691409; cv=none;
        d=google.com; s=arc-20160816;
        b=MAR5GvPaxvzn7yNBL+dpjr6q9LdZDh4dgaQwLfOp3ez05NIYWQPh111Xjx+Kh01f4x
         KwIGU9o816R784i+hswtvlV8phAT98wfDLSVy4vJpZ4fiA9G8R2OSGCLbbIaD1hAlDcE
         WA52PMMhYHjE/brDhA+N0Te8nsOCrwNgidcAtdNDuLUd9RnSaVDRBTBgrIBDkgvA1RjT
         lYm9JWmSlj+I/o8nJdwc0fS7frwoHVm5YN+ApIb2bdaMPpuY6YqOs3l7ofLJ6uF3HYAL
         m/VPf90FTHD0jcJq1r7EUZqEctHz8erjPI2FAn0hdjNKB3afbD2ItZhOTKcxIf3puBKq
         W2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=8lOnpWSnrDvKCEzXXu7NCTffDS7EvK/itvHzx2JvguA=;
        b=rsIiRMBqdgzEVuJJ3nOeFEn7QEaGajb6Y3EP30zY6yCE/wli4kxuYXjbhU1QONNs0Y
         RBwI7YzUPbkTiQ/CO0rGAFO5766g0xJlWwijpB2wQCda0OSrqh6tuic1CGI9TcE4BiH0
         DSnxMguXJ7GJn2hETtB989gRJx7TZR7IumgXA83dohytOs8Y11KqaNBFJf3sFQ9HjSgB
         dR1nfumNM+lLXk9K4P5dUqvo9z+lZV50pdwRnLLOHmBYLSemFEEWJOlf8A6ZaJdq7+U/
         yMV9M8wVbRDRfvkTvbntHb/KDrhblfteqvZZ1Yuf218szEyoWCjtQS2uToLCuj8C/Q5p
         s6rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Rw5D7zwJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3-v6si898838qtg.273.2018.10.04.15.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 15:16:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Rw5D7zwJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8BvN-00012q-1T
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 18:16:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8Bv9-0000z3-CA
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 18:16:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8Bv6-0006ZZ-6n
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 18:16:35 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g8Bv4-0006X2-1h; Thu, 04 Oct 2018 18:16:32 -0400
Received: by mail-pl1-x643.google.com with SMTP id s4-v6so5838715plp.0;
	Thu, 04 Oct 2018 15:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8lOnpWSnrDvKCEzXXu7NCTffDS7EvK/itvHzx2JvguA=;
	b=Rw5D7zwJcHgS2C6XZiVo/3zC9K4ZwHXFQZBtUfKqHf1oM6q7WOQuZBq0H8l6fSAQhE
	08aFAuZqlfM86QH5CNFRKGAykffZ9F9+uV3+uuTiVEBIUv2j1aGTSFB/LsLj9TXdpD6E
	TU+lQwxuvZqxEsMIXsIme5C0JEVhqlisQFS17ChYYukh7SHk5yf/4hwJrMN3r4UJBCN9
	/sZh4edVVYbNlvsDMcuRjdQgBLS5UU2KPkxPzx/iYtq4ie8jF/ucgNn8/fNxV/Q8aa2L
	2VseBOyniMgJG0x16AgP/UsXTNBvw1lKs2RYaGvg4e93FNau4YUMaZRkv/ysBQd0RwKo
	vJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8lOnpWSnrDvKCEzXXu7NCTffDS7EvK/itvHzx2JvguA=;
	b=PtF8MZjSmJktDEepcQWr0yZQBlLdj14dFybmq61jQJTuobQYCoPEasLNtsdJ6QRlYN
	SqMhee10C2Q8ZqDNhq1g1s1OqbCZ4aLBcrJaJ5a1EOOoUyI/sR+1jJoq+3C5/wT0UiXD
	tv+zSKbMQxcF0u/HSWF4h3vKfapDCzIVJfCJrK7jt8Zi0nasvwU4TyTo2qwIKwIUO+Dq
	Z2enT454aeDis+5JcngS+9CzXKkqqhgWIxtV1vTg5kegBm5tI8ClVeO4jJXEGiUVeZ1n
	0xwjVE0BE4h5Bv6/lqzUOnykgenghv5LU6VC2wdRoiol/J4O65Hgf1cQO8520BNTcX/a
	GoEA==
X-Gm-Message-State: ABuFfohw4m1nlQDU5w+4rQMau3FPfPunnchGmqXpg8HEYkBJNBpl+WEn
	/dX2j8aoNFLiqec4b5DpTxk=
X-Received: by 2002:a17:902:ac8e:: with SMTP id
	h14-v6mr8417387plr.300.1538691388042; 
	Thu, 04 Oct 2018 15:16:28 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8839826pfl.126.2018.10.04.15.16.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 15:16:26 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-4-git-send-email-edgar.iglesias@gmail.com>
From: Alistair <alistair23@gmail.com>
Message-ID: <2d5363ed-9385-f637-eabe-a2e786e40c57@gmail.com>
Date: Thu, 4 Oct 2018 15:16:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1538579266-8389-4-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 03/12] net: cadence_gem: Use
 uint32_t for 32bit descriptor words
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jVWYjPRePvjI

On 10/03/2018 08:07 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Use uint32_t instead of unsigned to describe 32bit descriptor words.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   hw/net/cadence_gem.c         | 42 +++++++++++++++++++++---------------------
>   include/hw/net/cadence_gem.h |  2 +-
>   2 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 901c173..31f3fe0 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -302,42 +302,42 @@
>   
>   #define GEM_MODID_VALUE 0x00020118
>   
> -static inline unsigned tx_desc_get_buffer(unsigned *desc)
> +static inline unsigned tx_desc_get_buffer(uint32_t *desc)
>   {
>       return desc[0];
>   }
>   
> -static inline unsigned tx_desc_get_used(unsigned *desc)
> +static inline unsigned tx_desc_get_used(uint32_t *desc)
>   {
>       return (desc[1] & DESC_1_USED) ? 1 : 0;
>   }
>   
> -static inline void tx_desc_set_used(unsigned *desc)
> +static inline void tx_desc_set_used(uint32_t *desc)
>   {
>       desc[1] |= DESC_1_USED;
>   }
>   
> -static inline unsigned tx_desc_get_wrap(unsigned *desc)
> +static inline unsigned tx_desc_get_wrap(uint32_t *desc)
>   {
>       return (desc[1] & DESC_1_TX_WRAP) ? 1 : 0;
>   }
>   
> -static inline unsigned tx_desc_get_last(unsigned *desc)
> +static inline unsigned tx_desc_get_last(uint32_t *desc)
>   {
>       return (desc[1] & DESC_1_TX_LAST) ? 1 : 0;
>   }
>   
> -static inline void tx_desc_set_last(unsigned *desc)
> +static inline void tx_desc_set_last(uint32_t *desc)
>   {
>       desc[1] |= DESC_1_TX_LAST;
>   }
>   
> -static inline unsigned tx_desc_get_length(unsigned *desc)
> +static inline unsigned tx_desc_get_length(uint32_t *desc)
>   {
>       return desc[1] & DESC_1_LENGTH;
>   }
>   
> -static inline void print_gem_tx_desc(unsigned *desc, uint8_t queue)
> +static inline void print_gem_tx_desc(uint32_t *desc, uint8_t queue)
>   {
>       DB_PRINT("TXDESC (queue %" PRId8 "):\n", queue);
>       DB_PRINT("bufaddr: 0x%08x\n", *desc);
> @@ -347,58 +347,58 @@ static inline void print_gem_tx_desc(unsigned *desc, uint8_t queue)
>       DB_PRINT("length:  %d\n", tx_desc_get_length(desc));
>   }
>   
> -static inline unsigned rx_desc_get_buffer(unsigned *desc)
> +static inline unsigned rx_desc_get_buffer(uint32_t *desc)
>   {
>       return desc[0] & ~0x3UL;
>   }
>   
> -static inline unsigned rx_desc_get_wrap(unsigned *desc)
> +static inline unsigned rx_desc_get_wrap(uint32_t *desc)
>   {
>       return desc[0] & DESC_0_RX_WRAP ? 1 : 0;
>   }
>   
> -static inline unsigned rx_desc_get_ownership(unsigned *desc)
> +static inline unsigned rx_desc_get_ownership(uint32_t *desc)
>   {
>       return desc[0] & DESC_0_RX_OWNERSHIP ? 1 : 0;
>   }
>   
> -static inline void rx_desc_set_ownership(unsigned *desc)
> +static inline void rx_desc_set_ownership(uint32_t *desc)
>   {
>       desc[0] |= DESC_0_RX_OWNERSHIP;
>   }
>   
> -static inline void rx_desc_set_sof(unsigned *desc)
> +static inline void rx_desc_set_sof(uint32_t *desc)
>   {
>       desc[1] |= DESC_1_RX_SOF;
>   }
>   
> -static inline void rx_desc_set_eof(unsigned *desc)
> +static inline void rx_desc_set_eof(uint32_t *desc)
>   {
>       desc[1] |= DESC_1_RX_EOF;
>   }
>   
> -static inline void rx_desc_set_length(unsigned *desc, unsigned len)
> +static inline void rx_desc_set_length(uint32_t *desc, unsigned len)
>   {
>       desc[1] &= ~DESC_1_LENGTH;
>       desc[1] |= len;
>   }
>   
> -static inline void rx_desc_set_broadcast(unsigned *desc)
> +static inline void rx_desc_set_broadcast(uint32_t *desc)
>   {
>       desc[1] |= R_DESC_1_RX_BROADCAST;
>   }
>   
> -static inline void rx_desc_set_unicast_hash(unsigned *desc)
> +static inline void rx_desc_set_unicast_hash(uint32_t *desc)
>   {
>       desc[1] |= R_DESC_1_RX_UNICAST_HASH;
>   }
>   
> -static inline void rx_desc_set_multicast_hash(unsigned *desc)
> +static inline void rx_desc_set_multicast_hash(uint32_t *desc)
>   {
>       desc[1] |= R_DESC_1_RX_MULTICAST_HASH;
>   }
>   
> -static inline void rx_desc_set_sar(unsigned *desc, int sar_idx)
> +static inline void rx_desc_set_sar(uint32_t *desc, int sar_idx)
>   {
>       desc[1] = deposit32(desc[1], R_DESC_1_RX_SAR_SHIFT, R_DESC_1_RX_SAR_LENGTH,
>                           sar_idx);
> @@ -1042,7 +1042,7 @@ static void gem_transmit_updatestats(CadenceGEMState *s, const uint8_t *packet,
>    */
>   static void gem_transmit(CadenceGEMState *s)
>   {
> -    unsigned    desc[2];
> +    uint32_t desc[2];
>       hwaddr packet_desc_addr;
>       uint8_t     tx_packet[2048];
>       uint8_t     *p;
> @@ -1108,7 +1108,7 @@ static void gem_transmit(CadenceGEMState *s)
>   
>               /* Last descriptor for this packet; hand the whole thing off */
>               if (tx_desc_get_last(desc)) {
> -                unsigned    desc_first[2];
> +                uint32_t desc_first[2];
>   
>                   /* Modify the 1st descriptor of this packet to be owned by
>                    * the processor.
> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
> index 35de622..633d564 100644
> --- a/include/hw/net/cadence_gem.h
> +++ b/include/hw/net/cadence_gem.h
> @@ -74,7 +74,7 @@ typedef struct CadenceGEMState {
>   
>       uint8_t can_rx_state; /* Debug only */
>   
> -    unsigned rx_desc[MAX_PRIORITY_QUEUES][2];
> +    uint32_t rx_desc[MAX_PRIORITY_QUEUES][2];
>   
>       bool sar_active[4];
>   } CadenceGEMState;
> 
