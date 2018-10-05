Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp950068wrt;
        Fri, 5 Oct 2018 16:14:35 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61Hu9dW3UHlLXpgTYN3woe4eQxzSYC2k2eHtv7UWRYNQ72PjVJkxyZHqEDifDv9q2nSKsjJ
X-Received: by 2002:a37:6d41:: with SMTP id i62-v6mr11145943qkc.237.1538781275874;
        Fri, 05 Oct 2018 16:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538781275; cv=none;
        d=google.com; s=arc-20160816;
        b=Q/QWd2ZYOIKAUBRt37SYRYBbAUlK0TRovCQTMGeZUuYjXXruc5m7IxVEJUEDMog1Ns
         FQoHYaDJvivApFKmJPcQq2CsvDbFnPZJ3TYBdQC82GoBp8FsxwuQclTp7enOCzsy/xMg
         pnyCWT1MGAMkzyDAmfSP3sgD2e2EjHamJTogkHpbQuaTgvvNd3XaCRxxBNzzyEE74dv9
         2H0HTmRdC0daDkCG29we9pjcvreps30N5RRjhiGH4JfNvscNB5XfNdYIW6bYCfVNyTu6
         W4UWP8YuBkgg/UiiqI5kL1Jr7KQmC7TEtPjQ+BO6nbD4RZVr05TlxkXX+j4ioMDxR7Ey
         Nbdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=PRcHiUalzU6VG4k1eRy8XHjGZaNq4v9ZJtllNV8Iblc=;
        b=ag5DoG5WRdqsQ4S0ZN8fH4V5mKOyf8B5TZ9Gas+mMEsRpEIbMEbt+7+DZcXXlDPfvR
         yYid4OuvCfnj2alI2yvj6s+Dfcm2MJz+sCC1D3P6Hf5OdSyB5Av2d50Pc10Xj89AIEIl
         3BVNHv9GzMsi/tIIJhYeKqGvauBwLcTTSoum86E61D974hNkCxe9RldjeQ25JqPFpAvR
         4t2SAY+bjf+o4lqU1/RDzoGvIr5nidQTM075+o3S0kbw1hh+aQn1xR3aAcNINmafhWgz
         Xr87MznKQkdPTZQDRClHhGKh5DtfM5gsMcNLbaCPodEDRmQ3qx0fDCxo7kMyHPYMoEhr
         /xsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w52-v6si457961qtw.377.2018.10.05.16.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 16:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8ZIp-0005HS-Bd
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 19:14:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8ZIc-0005Gq-S8
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 19:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8ZIZ-0005hu-MU
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 19:14:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38319)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g8ZIZ-0005gD-CS
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 19:14:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id a13-v6so15032156wrt.5
	for <qemu-arm@nongnu.org>; Fri, 05 Oct 2018 16:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PRcHiUalzU6VG4k1eRy8XHjGZaNq4v9ZJtllNV8Iblc=;
	b=o5arej6WXgthlCam6KgyxvJTwVcjjGj5wd+Dcn1vh4dDwt9ewaZfSPayrsNEoQ1tv2
	Vx0FTKgafsEyDgmLlPoQZYvJaZIY/WIYlygFBNxPWnHkD0577UipkY4Egn780QqbJwnP
	ImBdNAtpJC/ezl1trskiQQgcep7LN8dxZNYfJeYR/mvoVIR0SD15fp/kLckDPTaT34ND
	vXPaxUX3wqNMW3v6b2Z1l8X+mMGiX3yrnDijXp87FQ44z133UHUzwdFmToEnh0mcKKhr
	bFD7XQ4uofXB6X9SSdPn9KRA6mN2us7378T9lTVOMpEZZR6GKmjEI0+Qn9BHz+tIkbDI
	WJHw==
X-Gm-Message-State: ABuFfojwbb8N+J+ncLiYWYuBPqj4Lcdwgr3+7JQaaucPrJbIvXrrRjEX
	Wf8GvkxT2xdQzICv+1Bh5iZEnw==
X-Received: by 2002:adf:db8e:: with SMTP id
	u14-v6mr9936993wri.217.1538781258226; 
	Fri, 05 Oct 2018 16:14:18 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	20-v6sm4317222wml.10.2018.10.05.16.14.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 16:14:17 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, alistair@alistair23.me
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0ed94c1e-4c58-d1ac-6ceb-c851cc089cec@redhat.com>
Date: Sat, 6 Oct 2018 01:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
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
	frasse.iglesias@gmail.com, richard.henderson@linaro.org,
	frederic.konrad@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFGqGcm+vZcO

Hi Edgar,

On 03/10/2018 17:07, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add support for selecting the Memory Region that the GEM
> will do DMA to.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/net/cadence_gem.c         | 63 ++++++++++++++++++++++++++++----------------
>  include/hw/net/cadence_gem.h |  2 ++
>  2 files changed, 43 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 759c1d7..ab02515 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -28,6 +28,7 @@
>  #include "hw/net/cadence_gem.h"
>  #include "qapi/error.h"
>  #include "qemu/log.h"
> +#include "sysemu/dma.h"
>  #include "net/checksum.h"
>  
>  #ifdef CADENCE_GEM_ERR_DEBUG
> @@ -835,9 +836,9 @@ static void gem_get_rx_desc(CadenceGEMState *s, int q)
>  {
>      DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
>      /* read current descriptor */
> -    cpu_physical_memory_read(s->rx_desc_addr[q],
> -                             (uint8_t *)s->rx_desc[q],
> -                             sizeof(uint32_t) * gem_get_desc_len(s, true));
> +    address_space_read(s->dma_as, s->rx_desc_addr[q], MEMTXATTRS_UNSPECIFIED,
> +                       (uint8_t *)s->rx_desc[q],
> +                       sizeof(uint32_t) * gem_get_desc_len(s, true));
>  
>      /* Descriptor owned by software ? */
>      if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
> @@ -956,10 +957,10 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>                  rx_desc_get_buffer(s->rx_desc[q]));
>  
>          /* Copy packet data to emulated DMA buffer */
> -        cpu_physical_memory_write(rx_desc_get_buffer(s, s->rx_desc[q]) +
> +        address_space_write(s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
>                                                                    rxbuf_offset,
> -                                  rxbuf_ptr,
> -                                  MIN(bytes_to_copy, rxbufsize));
> +                            MEMTXATTRS_UNSPECIFIED, rxbuf_ptr,
> +                            MIN(bytes_to_copy, rxbufsize));
>          rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
>          bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
>  
> @@ -993,9 +994,10 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>          }
>  
>          /* Descriptor write-back.  */
> -        cpu_physical_memory_write(s->rx_desc_addr[q],
> -                                  (uint8_t *)s->rx_desc[q],
> -                                  sizeof(uint32_t) * gem_get_desc_len(s, true));
> +        address_space_write(s->dma_as, s->rx_desc_addr[q],
> +                            MEMTXATTRS_UNSPECIFIED,
> +                            (uint8_t *)s->rx_desc[q],
> +                            sizeof(uint32_t) * gem_get_desc_len(s, true));
>  
>          /* Next descriptor */
>          if (rx_desc_get_wrap(s->rx_desc[q])) {
> @@ -1099,9 +1101,9 @@ static void gem_transmit(CadenceGEMState *s)
>          packet_desc_addr = s->tx_desc_addr[q];
>  
>          DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
> -        cpu_physical_memory_read(packet_desc_addr,
> -                                 (uint8_t *)desc,
> -                                 sizeof(uint32_t) * gem_get_desc_len(s, false));
> +        address_space_read(s->dma_as, packet_desc_addr,
> +                           MEMTXATTRS_UNSPECIFIED, (uint8_t *)desc,
> +                           sizeof(uint32_t) * gem_get_desc_len(s, false));
>          /* Handle all descriptors owned by hardware */
>          while (tx_desc_get_used(desc) == 0) {
>  
> @@ -1133,8 +1135,9 @@ static void gem_transmit(CadenceGEMState *s)
>              /* Gather this fragment of the packet from "dma memory" to our
>               * contig buffer.
>               */
> -            cpu_physical_memory_read(tx_desc_get_buffer(s, desc), p,
> -                                     tx_desc_get_length(desc));
> +            address_space_read(s->dma_as, tx_desc_get_buffer(s, desc),
> +                               MEMTXATTRS_UNSPECIFIED,
> +                               p, tx_desc_get_length(desc));
>              p += tx_desc_get_length(desc);
>              total_bytes += tx_desc_get_length(desc);
>  
> @@ -1145,13 +1148,15 @@ static void gem_transmit(CadenceGEMState *s)
>                  /* Modify the 1st descriptor of this packet to be owned by
>                   * the processor.
>                   */
> -                cpu_physical_memory_read(s->tx_desc_addr[q],
> -                                         (uint8_t *)desc_first,
> -                                         sizeof(desc_first));
> +                address_space_read(s->dma_as, s->tx_desc_addr[q],
> +                                   MEMTXATTRS_UNSPECIFIED,
> +                                   (uint8_t *)desc_first,
> +                                   sizeof(desc_first));
>                  tx_desc_set_used(desc_first);
> -                cpu_physical_memory_write(s->tx_desc_addr[q],
> -                                          (uint8_t *)desc_first,
> -                                          sizeof(desc_first));
> +                address_space_write(s->dma_as, s->tx_desc_addr[q],
> +                                  MEMTXATTRS_UNSPECIFIED,
> +                                  (uint8_t *)desc_first,
> +                                   sizeof(desc_first));
>                  /* Advance the hardware current descriptor past this packet */
>                  if (tx_desc_get_wrap(desc)) {
>                      s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
> @@ -1204,8 +1209,9 @@ static void gem_transmit(CadenceGEMState *s)
>                  packet_desc_addr += 4 * gem_get_desc_len(s, false);
>              }
>              DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
> -            cpu_physical_memory_read(packet_desc_addr, (uint8_t *)desc,
> -                                sizeof(uint32_t) * gem_get_desc_len(s, false));
> +            address_space_read(s->dma_as, packet_desc_addr,
> +                              MEMTXATTRS_UNSPECIFIED, (uint8_t *)desc,
> +                              sizeof(uint32_t) * gem_get_desc_len(s, false));
>          }
>  
>          if (tx_desc_get_used(desc)) {
> @@ -1500,6 +1506,13 @@ static void gem_realize(DeviceState *dev, Error **errp)
>      CadenceGEMState *s = CADENCE_GEM(dev);
>      int i;
>  
> +    if (s->dma_mr) {
> +        s->dma_as = g_malloc0(sizeof(AddressSpace));
> +        address_space_init(s->dma_as, s->dma_mr, NULL);
> +    } else {
> +        s->dma_as = &address_space_memory;
> +    }

This is not the first time I see this if() block.

Should we consider refactor it?

Anyway:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


> +
>      if (s->num_priority_queues == 0 ||
>          s->num_priority_queues > MAX_PRIORITY_QUEUES) {
>          error_setg(errp, "Invalid num-priority-queues value: %" PRIx8,
> @@ -1537,6 +1550,12 @@ static void gem_init(Object *obj)
>                            "enet", sizeof(s->regs));
>  
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
> +
> +    object_property_add_link(obj, "dma", TYPE_MEMORY_REGION,
> +                             (Object **)&s->dma_mr,
> +                             qdev_prop_allow_set_link_before_realize,
> +                             OBJ_PROP_LINK_STRONG,
> +                             &error_abort);
>  }
>  
>  static const VMStateDescription vmstate_cadence_gem = {
> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
> index 00dbf4f..c8f0751 100644
> --- a/include/hw/net/cadence_gem.h
> +++ b/include/hw/net/cadence_gem.h
> @@ -45,6 +45,8 @@ typedef struct CadenceGEMState {
>  
>      /*< public >*/
>      MemoryRegion iomem;
> +    MemoryRegion *dma_mr;
> +    AddressSpace *dma_as;
>      NICState *nic;
>      NICConf conf;
>      qemu_irq irq[MAX_PRIORITY_QUEUES];
> 
