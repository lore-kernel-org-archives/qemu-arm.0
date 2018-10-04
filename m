Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1426669wrt;
        Thu, 4 Oct 2018 15:29:36 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62iYWB8IWiXsQb/mm0hNeER0Xk5CocoP0QehA4oOWThasdkyfZt7zgnBYgZ5PAEv3ffgWsD
X-Received: by 2002:ac8:3414:: with SMTP id u20-v6mr7320690qtb.237.1538692176443;
        Thu, 04 Oct 2018 15:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538692176; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9OdBazE5WwvW/U9DgWCQu7JfblKmtBrlwvvaME/nLiefXmbOT7ouIiRNvGK817JQ6
         AJFYxbwaxqkH9qJHKQk40dbVXdX/yvQpkrMC4R4frN7Mkotf2+rPjm/goCrOr9wEja2Z
         olt4emRwXAEJtbO/KYWbDa3atmtWMDHKoQnzA0q0v1HpATHFqm/dq9n+Ocr00DknqSMe
         uJY6UTtezs9s7TGt3fEJkQDm1TsX6XZxqDpeZmW/9F1nUgNBGEX8RypMWpwJlARFDzqu
         LycFb/05jSjI0/NYruFVUWlLmlb0QR3kf2s6s/rjh3lnHZ5R6FWd1zoLbdbwpZFtDKQq
         EKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=lxPs4wDYwQZGI5KAmkEicWGP4zs2TC11rYzc9q7b2t8=;
        b=GgEazWm7lvAp2x/ORbexj9Zi5k/bupurpTGZG7UaYogpjIfAceVKFvNr/lm10BlovH
         Lh1WtSpHp9KzRxPg+Xorl3MYobZTUj5RjER2hPo8r+//1CT2mLVkjxi2cj7Zc/7dZuVC
         5wj/hYQMfrthxKEVC0vunXiW0SzwxANtzAlkGKE+zWYMaQHxaVIyYuQrz0wt7l9ofc5z
         xZ1P5pdgLfeG09nz04cYN5fpsccnUhWko39Hm/ZaRy4lXwvVNmmhmQBG7cC//37mL1jS
         vW1DPt/habW9SWtF0ThBlYgLXeCZv1wssgl/Onmey+PskTZIx8ScCAqVA29LmROpIyBM
         waWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SCl36hEF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o48-v6si784779qvh.218.2018.10.04.15.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 15:29:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SCl36hEF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8C7j-0006dd-VJ
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 18:29:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8C7c-0006dW-2z
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 18:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8C7Y-0003YI-FI
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 18:29:28 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43296)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g8C7X-0003Rj-Ha; Thu, 04 Oct 2018 18:29:24 -0400
Received: by mail-pf1-x443.google.com with SMTP id p24-v6so4058347pff.10;
	Thu, 04 Oct 2018 15:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lxPs4wDYwQZGI5KAmkEicWGP4zs2TC11rYzc9q7b2t8=;
	b=SCl36hEFfzlTtRBInHilGmUdsld3T9bz0yEw/L2ov1KqEsI50591vYkLllFsdwu+zQ
	+tTXk8BSvpUuNWCBMSned84Z248A9lXuxaR0XVFsxiQjiRilcmQyLX23sp/lpRaRx1wI
	QRoq1TqMtuhzpb9xEo3ZYreQYhPJsalnn35Fa2tb26WCmEAia1gFiIuWWL/O9EB9ibwJ
	daOYrY6uuPvnWfZam5J/rKlqTJjPDGKrqIMmZK7jSoUUXs4oCfkpeRXZ/IE+B25rSHOd
	zM0kfBezdvX6XpGULumgafTsf6FHjkz7V5EBXyZsaxox6ORbNv+bmpAsE2EepytqOTxZ
	TDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lxPs4wDYwQZGI5KAmkEicWGP4zs2TC11rYzc9q7b2t8=;
	b=ESGBoWuAgoBwFe3tjCfAtNMFLr3SRTCUaeZQeMa1c26+KG2EV1fng3I5cVvtcQXfaw
	oSyHGLg9TxDgrBFVC73ZbD5F5TCRsoO9yZ9M8NY40l0v6vOO2FS5MTuI83s+OrY+yHA0
	fDsoRxPtbwHxv+p28CJKlb48RQvpzaNAlBk/NhG9B2J3krjh4DPgXdudM+ZMmck4ly+x
	sv7s4Ui0QPdo85TKn0pId4Z/CLFNlQinpXAR0xWYz2DEIoFS7ZrW6COK2OuArAhUBC8f
	kYoWxuWdouhRh4+m4adzfq22Khz0F4keVcEl2bFdild+HG+OaDD87L0JxHh0ybLKsaco
	7mjw==
X-Gm-Message-State: ABuFfogEojqmYkWIs01beg/vlrFQzRjH32AP3txlu5N+cInKijlXtE69
	BHxIuVMXk2XPtaTWK6t+akk=
X-Received: by 2002:a63:27c1:: with SMTP id
	n184-v6mr7586282pgn.278.1538692160341; 
	Thu, 04 Oct 2018 15:29:20 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	j14-v6sm6126230pgh.52.2018.10.04.15.29.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 15:29:19 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-6-git-send-email-edgar.iglesias@gmail.com>
From: Alistair <alistair23@gmail.com>
Message-ID: <321c2419-2692-fc6d-1884-43b97eb32c0d@gmail.com>
Date: Thu, 4 Oct 2018 15:29:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1538579266-8389-6-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 05/12] net: cadence_gem: Add
 support for extended descriptors
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
X-TUID: s818y4MXqrwn

On 10/03/2018 08:07 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add support for extended descriptors with optional 64bit
> addressing and timestamping. QEMU will not yet provide
> timestamps (always leaving the valid timestamp bit as zero).
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   hw/net/cadence_gem.c         | 69 ++++++++++++++++++++++++++++++++------------
>   include/hw/net/cadence_gem.h |  2 +-
>   2 files changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 4d769b0..759c1d7 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -207,6 +207,9 @@
>   #define GEM_NWCFG_BCAST_REJ    0x00000020 /* Reject broadcast packets */
>   #define GEM_NWCFG_PROMISC      0x00000010 /* Accept all packets */
>   
> +#define GEM_DMACFG_ADDR_64B    (1U << 30)
> +#define GEM_DMACFG_TX_BD_EXT   (1U << 29)
> +#define GEM_DMACFG_RX_BD_EXT   (1U << 28)
>   #define GEM_DMACFG_RBUFSZ_M    0x00FF0000 /* DMA RX Buffer Size mask */
>   #define GEM_DMACFG_RBUFSZ_S    16         /* DMA RX Buffer Size shift */
>   #define GEM_DMACFG_RBUFSZ_MUL  64         /* DMA RX Buffer Size multiplier */
> @@ -302,9 +305,14 @@
>   
>   #define GEM_MODID_VALUE 0x00020118
>   
> -static inline unsigned tx_desc_get_buffer(uint32_t *desc)
> +static inline uint64_t tx_desc_get_buffer(CadenceGEMState *s, uint32_t *desc)
>   {
> -    return desc[0];
> +    uint64_t ret = desc[0];
> +
> +    if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
> +        ret |= (uint64_t)desc[2] << 32;
> +    }
> +    return ret;
>   }
>   
>   static inline unsigned tx_desc_get_used(uint32_t *desc)
> @@ -347,9 +355,30 @@ static inline void print_gem_tx_desc(uint32_t *desc, uint8_t queue)
>       DB_PRINT("length:  %d\n", tx_desc_get_length(desc));
>   }
>   
> -static inline unsigned rx_desc_get_buffer(uint32_t *desc)
> +static inline uint64_t rx_desc_get_buffer(CadenceGEMState *s, uint32_t *desc)
>   {
> -    return desc[0] & ~0x3UL;
> +    uint64_t ret = desc[0] & ~0x3UL;
> +
> +    if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
> +        ret |= (uint64_t)desc[2] << 32;
> +    }
> +    return ret;
> +}
> +
> +static inline int gem_get_desc_len(CadenceGEMState *s, bool rx_n_tx)
> +{
> +    int ret = 2;
> +
> +    if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
> +        ret += 2;
> +    }
> +    if (s->regs[GEM_DMACFG] & (rx_n_tx ? GEM_DMACFG_RX_BD_EXT
> +                                       : GEM_DMACFG_TX_BD_EXT)) {
> +        ret += 2;
> +    }
> +
> +    assert(ret <= DESC_MAX_NUM_WORDS);
> +    return ret;
>   }
>   
>   static inline unsigned rx_desc_get_wrap(uint32_t *desc)
> @@ -419,7 +448,7 @@ static void gem_init_register_masks(CadenceGEMState *s)
>       memset(&s->regs_ro[0], 0, sizeof(s->regs_ro));
>       s->regs_ro[GEM_NWCTRL]   = 0xFFF80000;
>       s->regs_ro[GEM_NWSTATUS] = 0xFFFFFFFF;
> -    s->regs_ro[GEM_DMACFG]   = 0xFE00F000;
> +    s->regs_ro[GEM_DMACFG]   = 0x8E00F000;
>       s->regs_ro[GEM_TXSTATUS] = 0xFFFFFE08;
>       s->regs_ro[GEM_RXQBASE]  = 0x00000003;
>       s->regs_ro[GEM_TXQBASE]  = 0x00000003;
> @@ -807,7 +836,8 @@ static void gem_get_rx_desc(CadenceGEMState *s, int q)
>       DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
>       /* read current descriptor */
>       cpu_physical_memory_read(s->rx_desc_addr[q],
> -                             (uint8_t *)s->rx_desc[q], sizeof(s->rx_desc[q]));
> +                             (uint8_t *)s->rx_desc[q],
> +                             sizeof(uint32_t) * gem_get_desc_len(s, true));
>   
>       /* Descriptor owned by software ? */
>       if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
> @@ -926,9 +956,10 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>                   rx_desc_get_buffer(s->rx_desc[q]));
>   
>           /* Copy packet data to emulated DMA buffer */
> -        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc[q]) +
> -                                                                 rxbuf_offset,
> -                                  rxbuf_ptr, MIN(bytes_to_copy, rxbufsize));
> +        cpu_physical_memory_write(rx_desc_get_buffer(s, s->rx_desc[q]) +
> +                                                                  rxbuf_offset,
> +                                  rxbuf_ptr,
> +                                  MIN(bytes_to_copy, rxbufsize));
>           rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
>           bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
>   
> @@ -964,7 +995,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>           /* Descriptor write-back.  */
>           cpu_physical_memory_write(s->rx_desc_addr[q],
>                                     (uint8_t *)s->rx_desc[q],
> -                                  sizeof(s->rx_desc[q]));
> +                                  sizeof(uint32_t) * gem_get_desc_len(s, true));
>   
>           /* Next descriptor */
>           if (rx_desc_get_wrap(s->rx_desc[q])) {
> @@ -972,7 +1003,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>               s->rx_desc_addr[q] = s->regs[GEM_RXQBASE];
>           } else {
>               DB_PRINT("incrementing RX descriptor list\n");
> -            s->rx_desc_addr[q] += 8;
> +            s->rx_desc_addr[q] += 4 * gem_get_desc_len(s, true);
>           }
>   
>           gem_get_rx_desc(s, q);
> @@ -1069,7 +1100,8 @@ static void gem_transmit(CadenceGEMState *s)
>   
>           DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
>           cpu_physical_memory_read(packet_desc_addr,
> -                                 (uint8_t *)desc, sizeof(desc));
> +                                 (uint8_t *)desc,
> +                                 sizeof(uint32_t) * gem_get_desc_len(s, false));
>           /* Handle all descriptors owned by hardware */
>           while (tx_desc_get_used(desc) == 0) {
>   
> @@ -1082,7 +1114,7 @@ static void gem_transmit(CadenceGEMState *s)
>               /* The real hardware would eat this (and possibly crash).
>                * For QEMU let's lend a helping hand.
>                */
> -            if ((tx_desc_get_buffer(desc) == 0) ||
> +            if ((tx_desc_get_buffer(s, desc) == 0) ||
>                   (tx_desc_get_length(desc) == 0)) {
>                   DB_PRINT("Invalid TX descriptor @ 0x%x\n",
>                            (unsigned)packet_desc_addr);
> @@ -1101,7 +1133,7 @@ static void gem_transmit(CadenceGEMState *s)
>               /* Gather this fragment of the packet from "dma memory" to our
>                * contig buffer.
>                */
> -            cpu_physical_memory_read(tx_desc_get_buffer(desc), p,
> +            cpu_physical_memory_read(tx_desc_get_buffer(s, desc), p,
>                                        tx_desc_get_length(desc));
>               p += tx_desc_get_length(desc);
>               total_bytes += tx_desc_get_length(desc);
> @@ -1124,7 +1156,8 @@ static void gem_transmit(CadenceGEMState *s)
>                   if (tx_desc_get_wrap(desc)) {
>                       s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
>                   } else {
> -                    s->tx_desc_addr[q] = packet_desc_addr + 8;
> +                    s->tx_desc_addr[q] = packet_desc_addr +
> +                                         4 * gem_get_desc_len(s, false);
>                   }
>                   DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
>   
> @@ -1168,11 +1201,11 @@ static void gem_transmit(CadenceGEMState *s)
>                   tx_desc_set_last(desc);
>                   packet_desc_addr = s->regs[GEM_TXQBASE];
>               } else {
> -                packet_desc_addr += 8;
> +                packet_desc_addr += 4 * gem_get_desc_len(s, false);
>               }
>               DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
> -            cpu_physical_memory_read(packet_desc_addr,
> -                                     (uint8_t *)desc, sizeof(desc));
> +            cpu_physical_memory_read(packet_desc_addr, (uint8_t *)desc,
> +                                sizeof(uint32_t) * gem_get_desc_len(s, false));
>           }
>   
>           if (tx_desc_get_used(desc)) {
> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
> index b33ef65..00dbf4f 100644
> --- a/include/hw/net/cadence_gem.h
> +++ b/include/hw/net/cadence_gem.h
> @@ -33,7 +33,7 @@
>   #define CADENCE_GEM_MAXREG        (0x00000800 / 4) /* Last valid GEM address */
>   
>   /* Max number of words in a DMA descriptor.  */
> -#define DESC_MAX_NUM_WORDS              2
> +#define DESC_MAX_NUM_WORDS              6
>   
>   #define MAX_PRIORITY_QUEUES             8
>   #define MAX_TYPE1_SCREENERS             16
> 
