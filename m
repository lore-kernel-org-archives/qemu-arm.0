Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp921627wrt;
        Fri, 5 Oct 2018 15:36:16 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60th/NXie9O3FXxOeN7Aka3zUSGD1H2PEGNPGmjwJ2TOZvZ52lqS47N7SKG7psnACkuw10j
X-Received: by 2002:aed:252e:: with SMTP id v43-v6mr11246036qtc.211.1538778976867;
        Fri, 05 Oct 2018 15:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538778976; cv=none;
        d=google.com; s=arc-20160816;
        b=Xq+xUS4+vbn1ivxOmUJCGtSsVE1tlE7UstO4012KPMjk4/8rxHBraCaOZRMgz9iAYA
         qgVi904u0choDJxwxfTSKTMo+5Vgag2qMS1y6ErDs9qUqXgzIhe0Pe6+p7LXO5HGWQZV
         6mwE+LtYojJdZ8kK8Wq5G0uzVpfWAS4cGExSqihiJ3tyL+eOLkCgnYn6LFBBrcpzdbjv
         +Xo9MK7Q/EkiF5XSQNFOY/quUw7nHJdFLs0yEigrsubYRi1h1gvhnze/IqVg46AxqeEc
         CBJ6TlPXvg5AABGWWfrUB385M20GI9QVPjvVisWNtTpjGqnHy0LKuLPvRv1c+C92k7Xs
         eGRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=pFCSAVnt3/a6cw3CncWSQjJiS0+O++G+4k+6kI98PW0=;
        b=1G/KFcTGQ/hP2/WPRIxloY4DWQ8jrZb3tN+uKcjmWtmYUeIGVZ9RoA875YVXHRon6g
         +9VN5FJt9P3ElYO49Hu7lBzIoMRf8OhiUN3o7YNIF3kSY8yS+ipx6uL3q9AILp5b6rGJ
         Jn9s3SCGD7BD1abkZuYKtEHSZqKcguJp/LR6V7yMNzcjYpeOmqtjMprRcFi5QA8werVh
         FTmzw+waquC8Oou2K6uSJiUgzCYb3dnG7NmPUlnROLazcitW6Jr7dqSc9hzEGgXeMlWb
         6O//+8tgikBEsz1x8r2T6rsDtggkWLG88IVmF58878Btjh8ZVVdn3n/Z1r3GvRa2MF65
         31NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OgGo+5P9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j126-v6si1845636qkf.403.2018.10.05.15.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 15:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OgGo+5P9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8Yhk-0004XQ-Am
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 18:36:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8YhZ-0004XF-RM
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 18:36:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8YhW-0006Wx-LK
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 18:36:05 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36088)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g8YhW-0006U6-B8; Fri, 05 Oct 2018 18:36:02 -0400
Received: by mail-pg1-x543.google.com with SMTP id f18-v6so5323648pgv.3;
	Fri, 05 Oct 2018 15:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pFCSAVnt3/a6cw3CncWSQjJiS0+O++G+4k+6kI98PW0=;
	b=OgGo+5P9QeDzFsKLl4cKnkiTJWKpBhpGsA1I4u/B7oB15m9XNo162fT6NIxKcES0vH
	My1yHyx67tQEDvM0t2rI3r3fkRlZuKtm8s8y7QkXpLZtKqwKMxxh8Uz0CNH0qNPana4D
	/XuzS2hBlN8qHH0usHe1Uh4i8D1n2AuWGcF4CDIM7EKZUYVShJtgmEumBSqglxwLBVn0
	L6A/C9RMYFTJfOfxX1JmpmK4USf9+2C0gogBYzV1kjtTt6LSCX5lG+edVcgesmwF21df
	QSDQSyS+TBcK++bYDwkWojlA5hvUQUW2/tC6ha9HSeqgJ65mYKL0Gh6iPdLei6TI+qsg
	IjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pFCSAVnt3/a6cw3CncWSQjJiS0+O++G+4k+6kI98PW0=;
	b=pXHwBN4IM5gdNShHwBSvuBuOFzzUgy8a+MEov/6Ax0u7IO4K8jWUcOVlUgn5rMPCRE
	wX/Gin4/YnHmeOHBw4WjTdkx2W37rifDjf5yisLpSxZow8q/OAW/8OMv12uV9YoFwurl
	D3TS3b/IZCFjts+4YIyDM9+g36RSBd2Lkgzd0BhWvXPUrWY/C0JASt4QQhBE7uF0ycWn
	DFX8Ec1NhYZvepGEW8oSBErgGG1qHm80Olsl5izrPVP661VAASMDBoZEtJzlWQNlGGDA
	IMBf7qZR20xp0CdKtEBNYOs64uSwsKnsBHEc65GFrk4N333YvmGB5IGaPo646vxOLeLJ
	s7Cw==
X-Gm-Message-State: ABuFfohK/4rhm6xmqaSfaY0iRETGYC/VYyYiw6X183g/yFc5VsvdfvGl
	7HLkjclHM1WZW1HJoa/FDos=
X-Received: by 2002:a62:4ec9:: with SMTP id
	c192-v6mr13875945pfb.221.1538778961030; 
	Fri, 05 Oct 2018 15:36:01 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	5-v6sm22053776pgt.83.2018.10.05.15.35.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 15:35:59 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
From: Alistair <alistair23@gmail.com>
Message-ID: <1732b6b4-d943-a690-b554-e84c1e74b897@gmail.com>
Date: Fri, 5 Oct 2018 15:35:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 06/12] net: cadence_gem: Add
 support for selecting the DMA MemoryRegion
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
X-TUID: eVV7nRcFFxyK

On 10/03/2018 08:07 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add support for selecting the Memory Region that the GEM
> will do DMA to.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   hw/net/cadence_gem.c         | 63 ++++++++++++++++++++++++++++----------------
>   include/hw/net/cadence_gem.h |  2 ++
>   2 files changed, 43 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 759c1d7..ab02515 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -28,6 +28,7 @@
>   #include "hw/net/cadence_gem.h"
>   #include "qapi/error.h"
>   #include "qemu/log.h"
> +#include "sysemu/dma.h"
>   #include "net/checksum.h"
>   
>   #ifdef CADENCE_GEM_ERR_DEBUG
> @@ -835,9 +836,9 @@ static void gem_get_rx_desc(CadenceGEMState *s, int q)
>   {
>       DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
>       /* read current descriptor */
> -    cpu_physical_memory_read(s->rx_desc_addr[q],
> -                             (uint8_t *)s->rx_desc[q],
> -                             sizeof(uint32_t) * gem_get_desc_len(s, true));
> +    address_space_read(s->dma_as, s->rx_desc_addr[q], MEMTXATTRS_UNSPECIFIED,
> +                       (uint8_t *)s->rx_desc[q],
> +                       sizeof(uint32_t) * gem_get_desc_len(s, true));
>   
>       /* Descriptor owned by software ? */
>       if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
> @@ -956,10 +957,10 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>                   rx_desc_get_buffer(s->rx_desc[q]));
>   
>           /* Copy packet data to emulated DMA buffer */
> -        cpu_physical_memory_write(rx_desc_get_buffer(s, s->rx_desc[q]) +
> +        address_space_write(s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
>                                                                     rxbuf_offset,
> -                                  rxbuf_ptr,
> -                                  MIN(bytes_to_copy, rxbufsize));
> +                            MEMTXATTRS_UNSPECIFIED, rxbuf_ptr,
> +                            MIN(bytes_to_copy, rxbufsize));
>           rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
>           bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
>   
> @@ -993,9 +994,10 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>           }
>   
>           /* Descriptor write-back.  */
> -        cpu_physical_memory_write(s->rx_desc_addr[q],
> -                                  (uint8_t *)s->rx_desc[q],
> -                                  sizeof(uint32_t) * gem_get_desc_len(s, true));
> +        address_space_write(s->dma_as, s->rx_desc_addr[q],
> +                            MEMTXATTRS_UNSPECIFIED,
> +                            (uint8_t *)s->rx_desc[q],
> +                            sizeof(uint32_t) * gem_get_desc_len(s, true));
>   
>           /* Next descriptor */
>           if (rx_desc_get_wrap(s->rx_desc[q])) {
> @@ -1099,9 +1101,9 @@ static void gem_transmit(CadenceGEMState *s)
>           packet_desc_addr = s->tx_desc_addr[q];
>   
>           DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
> -        cpu_physical_memory_read(packet_desc_addr,
> -                                 (uint8_t *)desc,
> -                                 sizeof(uint32_t) * gem_get_desc_len(s, false));
> +        address_space_read(s->dma_as, packet_desc_addr,
> +                           MEMTXATTRS_UNSPECIFIED, (uint8_t *)desc,
> +                           sizeof(uint32_t) * gem_get_desc_len(s, false));
>           /* Handle all descriptors owned by hardware */
>           while (tx_desc_get_used(desc) == 0) {
>   
> @@ -1133,8 +1135,9 @@ static void gem_transmit(CadenceGEMState *s)
>               /* Gather this fragment of the packet from "dma memory" to our
>                * contig buffer.
>                */
> -            cpu_physical_memory_read(tx_desc_get_buffer(s, desc), p,
> -                                     tx_desc_get_length(desc));
> +            address_space_read(s->dma_as, tx_desc_get_buffer(s, desc),
> +                               MEMTXATTRS_UNSPECIFIED,
> +                               p, tx_desc_get_length(desc));
>               p += tx_desc_get_length(desc);
>               total_bytes += tx_desc_get_length(desc);
>   
> @@ -1145,13 +1148,15 @@ static void gem_transmit(CadenceGEMState *s)
>                   /* Modify the 1st descriptor of this packet to be owned by
>                    * the processor.
>                    */
> -                cpu_physical_memory_read(s->tx_desc_addr[q],
> -                                         (uint8_t *)desc_first,
> -                                         sizeof(desc_first));
> +                address_space_read(s->dma_as, s->tx_desc_addr[q],
> +                                   MEMTXATTRS_UNSPECIFIED,
> +                                   (uint8_t *)desc_first,
> +                                   sizeof(desc_first));
>                   tx_desc_set_used(desc_first);
> -                cpu_physical_memory_write(s->tx_desc_addr[q],
> -                                          (uint8_t *)desc_first,
> -                                          sizeof(desc_first));
> +                address_space_write(s->dma_as, s->tx_desc_addr[q],
> +                                  MEMTXATTRS_UNSPECIFIED,
> +                                  (uint8_t *)desc_first,
> +                                   sizeof(desc_first));
>                   /* Advance the hardware current descriptor past this packet */
>                   if (tx_desc_get_wrap(desc)) {
>                       s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
> @@ -1204,8 +1209,9 @@ static void gem_transmit(CadenceGEMState *s)
>                   packet_desc_addr += 4 * gem_get_desc_len(s, false);
>               }
>               DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
> -            cpu_physical_memory_read(packet_desc_addr, (uint8_t *)desc,
> -                                sizeof(uint32_t) * gem_get_desc_len(s, false));
> +            address_space_read(s->dma_as, packet_desc_addr,
> +                              MEMTXATTRS_UNSPECIFIED, (uint8_t *)desc,
> +                              sizeof(uint32_t) * gem_get_desc_len(s, false));
>           }
>   
>           if (tx_desc_get_used(desc)) {
> @@ -1500,6 +1506,13 @@ static void gem_realize(DeviceState *dev, Error **errp)
>       CadenceGEMState *s = CADENCE_GEM(dev);
>       int i;
>   
> +    if (s->dma_mr) {
> +        s->dma_as = g_malloc0(sizeof(AddressSpace));
> +        address_space_init(s->dma_as, s->dma_mr, NULL);
> +    } else {
> +        s->dma_as = &address_space_memory;
> +    }
> +
>       if (s->num_priority_queues == 0 ||
>           s->num_priority_queues > MAX_PRIORITY_QUEUES) {
>           error_setg(errp, "Invalid num-priority-queues value: %" PRIx8,
> @@ -1537,6 +1550,12 @@ static void gem_init(Object *obj)
>                             "enet", sizeof(s->regs));
>   
>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
> +
> +    object_property_add_link(obj, "dma", TYPE_MEMORY_REGION,
> +                             (Object **)&s->dma_mr,
> +                             qdev_prop_allow_set_link_before_realize,
> +                             OBJ_PROP_LINK_STRONG,
> +                             &error_abort);
>   }
>   
>   static const VMStateDescription vmstate_cadence_gem = {
> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
> index 00dbf4f..c8f0751 100644
> --- a/include/hw/net/cadence_gem.h
> +++ b/include/hw/net/cadence_gem.h
> @@ -45,6 +45,8 @@ typedef struct CadenceGEMState {
>   
>       /*< public >*/
>       MemoryRegion iomem;
> +    MemoryRegion *dma_mr;
> +    AddressSpace *dma_as;
>       NICState *nic;
>       NICConf conf;
>       qemu_irq irq[MAX_PRIORITY_QUEUES];
> 
