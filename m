Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1123808wrt;
        Fri, 12 Oct 2018 10:54:33 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60jbaKirJB3VpBQKAXVzsCTdaLRz1PJqRWncSCsxDYV5c2thEgq+cv+9dMTsoTI0F1EcEN4
X-Received: by 2002:ae9:c303:: with SMTP id n3-v6mr6686939qkg.163.1539366873848;
        Fri, 12 Oct 2018 10:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539366873; cv=none;
        d=google.com; s=arc-20160816;
        b=eqKTV7/Zro9TnSP45IBpMv1FqAtlgzcMrt4MbulNIdFOu4yn/6SNkwygsFlVKpZNJT
         tPdv+lNyryNoRodZtTNKCiBhScPX9M6oI8nJj6a8L13aBVoqA03tUutYl7mVX6K5XXnw
         BL+61+6a/gXI+pBHPBqyhLJF1Rdf5as9C/USSvFVLMLtsm3KD0UXwflpQXYPj0Ta5U21
         MM6HN8x0KlMgjevFMriFfesNLax5OYyOfRWCR2rxmdboadFqEjpHIiaK4ygfDeDoMeyJ
         XAJClWrEVkrtq3wMAHbnI1EUuTdpigXm6ndXxx+3o86tArs4IOrDEqcH7bSKFEtfcYwb
         fSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+MIRoSQljQhvDmVTDQSRwbuHAuGlIyp9xmY0yOSWbKY=;
        b=ymEaXFsqf85eGznOA91vfpJ5xHhS6tXpVyxAJT/maXQS2v3EvS/e2yYSigKDr+UQwW
         d7FIoJ7U088bQ59XGHd41E/IH3ys9wWf/HdCtHBS7O4QOpSLtLO1IhbPmiELD0rLHIG/
         2LPkgacI1lLiYoTIPAMEVpOpboZqznUBmBxiewu2nA3k1ncrwPy1G/0//QwNrOXQ9jTd
         GqTmbpMU45xEpB8qYQX/A8dGv64tZVI4ktp35as9H84DauIpERa9xb0dAv3oVureGLEd
         KkGBCc3WRkBUJXqLWy7nJId1LwOF0kdSbCLmTXpeH6Z+VKEu3f3lCJ04XkHNMJscJ8KU
         OFaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NhSySNr5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h52-v6si1755960qtb.233.2018.10.12.10.54.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 10:54:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NhSySNr5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gB1dx-0002N8-DY
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 13:54:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gB1cF-0001TT-Cg
	for qemu-devel@nongnu.org; Fri, 12 Oct 2018 13:52:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gB1cE-00010n-8U
	for qemu-devel@nongnu.org; Fri, 12 Oct 2018 13:52:47 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:34081)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gB1cD-00010O-Re; Fri, 12 Oct 2018 13:52:46 -0400
Received: by mail-lf1-x143.google.com with SMTP id y10-v6so9938917lfj.1;
	Fri, 12 Oct 2018 10:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+MIRoSQljQhvDmVTDQSRwbuHAuGlIyp9xmY0yOSWbKY=;
	b=NhSySNr5E2NMmS/aEsMEQHt4zT5/iPs/LWmnBvL8NTnPeVe5sj+593gMOwLNeD7Vcq
	lDeHuUzOtPhADm/5RAWXqmtnTdcOXNhgpdEh9VRXuhHaYeQByAJwutlGRRBZfVRMPJIP
	BNQvlacF+lt1t6NdmBDOX/hskX1bNdCXnnRCD4zOFB6GjvLZmzsoC6ZTJvwOiqUe6MVh
	YHY8HeUnOU7Naq2brPXG/Jex/Om0UR5ZgHX7IlH4gdb5O/kg1+ULRAJAsZGN+ZSy6iXz
	0DKDMWaFXUMuccyL9FkD7qIfFpq6YIfiMUbjzXa9Mm8WtguUy/yw1Tfpv3m7O3iK08qX
	qUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+MIRoSQljQhvDmVTDQSRwbuHAuGlIyp9xmY0yOSWbKY=;
	b=Dmp3XE41W8aZ9ah2VmlRvTE8MU1FTCBzsA0cOstOdY0LDw2fOBK454pxDC84XkDHck
	fU06kawmjaOSfEWON1+djq35N7ZqkhRwy86DEL2i18dJl8f0BpxtW8ghG37Vbz8rX6NL
	Ew+cA5AG3uYqw7UUg/xhiuVBoDcOwTonErJyVtlcEl07go17Di0JFSu4MV5tCqCYO7uD
	vYfzfQsNF9fu8kBjTGHqPkwoyFvWPL2mlYuKUxn2rM1BrDkn2h2xsvrGBOINaC+EVoiC
	mG+bPLRVYnpOcYDcgk541NwFrTsY9utIU4u7GRzCpHvzgRfeiyt2gLTt7k336MmnSaZp
	T0pg==
X-Gm-Message-State: ABuFfog77D+2QPfo8NyrU6zkpwYv1IjpAv9ohj2MUp+dNVPs69Zj6FoS
	QdcpmiQq/PR7Ac51Hi4gpRsuf4+tz1JzZrlUP1I=
X-Received: by 2002:a19:504e:: with SMTP id
	z14-v6mr1183731lfj.120.1539366764093; 
	Fri, 12 Oct 2018 10:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
	<20181011021931.4249-7-edgar.iglesias@gmail.com>
In-Reply-To: <20181011021931.4249-7-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Oct 2018 10:52:17 -0700
Message-ID: <CAKmqyKPZViCp6=Fv7iiNDw1xB6rf9LoF6-biK6=SpKBG1z__Tw@mail.gmail.com>
To: Edgar Iglesias <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-devel] [PATCH v2 06/12] net: cadence_gem: Add support for
 selecting the DMA MemoryRegion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Stefano Stabellini <sstabellini@kernel.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5UJRcznRaiGz

On Wed, Oct 10, 2018 at 7:27 PM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add support for selecting the Memory Region that the GEM
> will do DMA to.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/cadence_gem.c         | 59 ++++++++++++++++++++++--------------
>  include/hw/net/cadence_gem.h |  2 ++
>  2 files changed, 39 insertions(+), 22 deletions(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 759c1d71e0..a40f136285 100644
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
> +    address_space_read(&s->dma_as, s->rx_desc_addr[q], MEMTXATTRS_UNSPECIFIED,
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
> +        address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
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
> +        address_space_write(&s->dma_as, s->rx_desc_addr[q],
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
> +        address_space_read(&s->dma_as, packet_desc_addr,
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
> +            address_space_read(&s->dma_as, tx_desc_get_buffer(s, desc),
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
> +                address_space_read(&s->dma_as, s->tx_desc_addr[q],
> +                                   MEMTXATTRS_UNSPECIFIED,
> +                                   (uint8_t *)desc_first,
> +                                   sizeof(desc_first));
>                  tx_desc_set_used(desc_first);
> -                cpu_physical_memory_write(s->tx_desc_addr[q],
> -                                          (uint8_t *)desc_first,
> -                                          sizeof(desc_first));
> +                address_space_write(&s->dma_as, s->tx_desc_addr[q],
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
> +            address_space_read(&s->dma_as, packet_desc_addr,
> +                              MEMTXATTRS_UNSPECIFIED, (uint8_t *)desc,
> +                              sizeof(uint32_t) * gem_get_desc_len(s, false));
>          }
>
>          if (tx_desc_get_used(desc)) {
> @@ -1500,6 +1506,9 @@ static void gem_realize(DeviceState *dev, Error **errp)
>      CadenceGEMState *s = CADENCE_GEM(dev);
>      int i;
>
> +    address_space_init(&s->dma_as,
> +                       s->dma_mr ? s->dma_mr : get_system_memory(), "dma");
> +
>      if (s->num_priority_queues == 0 ||
>          s->num_priority_queues > MAX_PRIORITY_QUEUES) {
>          error_setg(errp, "Invalid num-priority-queues value: %" PRIx8,
> @@ -1537,6 +1546,12 @@ static void gem_init(Object *obj)
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
> index 00dbf4f72e..5426961d91 100644
> --- a/include/hw/net/cadence_gem.h
> +++ b/include/hw/net/cadence_gem.h
> @@ -45,6 +45,8 @@ typedef struct CadenceGEMState {
>
>      /*< public >*/
>      MemoryRegion iomem;
> +    MemoryRegion *dma_mr;
> +    AddressSpace dma_as;
>      NICState *nic;
>      NICConf conf;
>      qemu_irq irq[MAX_PRIORITY_QUEUES];
> --
> 2.17.1
>
>
