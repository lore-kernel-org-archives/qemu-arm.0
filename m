Received: by 10.25.21.156 with SMTP id 28csp1409033lfv;
        Mon, 25 Jul 2016 16:02:08 -0700 (PDT)
X-Received: by 10.200.45.235 with SMTP id q40mr32988148qta.34.1469487728396;
        Mon, 25 Jul 2016 16:02:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n185si19250659qkd.242.2016.07.25.16.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 16:02:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRosx-0001wH-OI
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 19:02:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bRosq-0001tI-6h
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 19:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bRosn-0007b6-6r
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 19:01:59 -0400
Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242]:35640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bRosm-0007b0-V7; Mon, 25 Jul 2016 19:01:57 -0400
Received: by mail-io0-x242.google.com with SMTP id q83so13194325iod.2;
	Mon, 25 Jul 2016 16:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=6wSOJsGdVmXp2+gOaPLX7+pnN2W59e1L//O6NGFFbVM=;
	b=y/70aAk2+0rg23XFFfzodSa80KGF3CBa47aKB4mjjQq2sNIL0Xl7DHTaudtsp350Ta
	9FHsygAPEFLXX3hGHv31eY+SHfLZnLL9XJkBMUko69Axz+DoMwfW1f2G9Tm/7r3/LnJY
	bUCQ6MR5uiQuwc5GyHqTWREv6oF5fD7KsKBlMhkV/cgxlAFX39vGmREl6gqK8qvxiTFo
	OrFtF59VWa596C8M0ifJKlhYFph97rZ8Juu+Z2f9t6BCENKOHP5geMVwXMG29CBIQZO3
	1+UL3KzLXPmrF7nxxUKmn1n8vIDn1WT1bG+sR7qpOlXIyYc+FjRsriP1UddOLkW9T7qB
	A/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=6wSOJsGdVmXp2+gOaPLX7+pnN2W59e1L//O6NGFFbVM=;
	b=Y9eBtaTLQPJARTFREn+9TsAPeR35FMErrIpSgTQ/0ibtUTEi4Ip6VDk+VgF+sOe9kQ
	tzgAuKHg7KpbVyF/9azJ9zYPYBviGLEv4BMMyaIqiz3Q2VVZaHSNTvKg+A4/tnw4zOSW
	xPHWBhcq7Tu5hP0n8t0GdDiRkJx1KpPf4BiVf6bbwVKEp9I/qxdB4c02WcO3iMGy+VpZ
	nXsUpJmqAArIM6HROvuTyOm0lFTd1reMcBux3T1fBfyKkQTKbSEHfPqYh1Q3CaKmhi1E
	xlwb6etXHh6CH1nAr7BX1n18u4SG4ejYf7p46fMSmLAZYrmBb8144+Md6C7/yxmn4/BO
	AWWg==
X-Gm-Message-State: AEkooutJEJx276SfM1J1ldhU3lT2kzJDtcnupwN1PudYVa5XjVgMopnA6aqCj6XjFl5aQknVlcKm4UBItx9Eug==
X-Received: by 10.202.206.66 with SMTP id e63mr9791068oig.136.1469487715987;
	Mon, 25 Jul 2016 16:01:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Mon, 25 Jul 2016 16:01:26 -0700 (PDT)
In-Reply-To: <CAFEAcA8Q3FDbXCTV7QcPOEH3sSFt2nQEpKVs9AnZqQkZABYDCw@mail.gmail.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
	<161fe9fe925378d8a22bd772ccdc8cdafeb0bc19.1468279072.git.alistair.francis@xilinx.com>
	<CAFEAcA8Q3FDbXCTV7QcPOEH3sSFt2nQEpKVs9AnZqQkZABYDCw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 25 Jul 2016 16:01:26 -0700
X-Google-Sender-Auth: IW9yytzfriWUehAjpNpfuizBQPc
Message-ID: <CAKmqyKOc_E86h8bBu4C9KpOCuUtygu4hnM3fqUE5iBnjMEL2Pg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 3/5] cadence_gem: Add queue
 support
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lp0QXnOuALYx

On Mon, Jul 25, 2016 at 8:46 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>
>> There is a indentation error in this patch in the gem_transmit function.
>> I have written it like that to make it easier to see the changes. It is
>> fixed in the next patch.
>>
>>  hw/net/cadence_gem.c         | 157 ++++++++++++++++++++++++++++++++-----------
>>  include/hw/net/cadence_gem.h |   2 +-
>>  2 files changed, 118 insertions(+), 41 deletions(-)
>>
>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>> index 2dabad5..c80e833 100644
>> --- a/hw/net/cadence_gem.c
>> +++ b/hw/net/cadence_gem.c
>> @@ -141,6 +141,29 @@
>>  #define GEM_DESCONF6      (0x00000294/4)
>>  #define GEM_DESCONF7      (0x00000298/4)
>>
>> +#define GEM_INT_Q1_STATUS               (0x00000400 / 4)
>> +
>> +#define GEM_TRANSMIT_Q1_PTR             (0x00000440 / 4)
>> +#define GEM_TRANSMIT_Q15_PTR            (GEM_TRANSMIT_Q1_PTR + 14)
>> +
>> +#define GEM_RECEIVE_Q1_PTR              (0x00000480 / 4)
>> +#define GEM_RECEIVE_Q15_PTR             (GEM_RECEIVE_Q1_PTR + 14)
>> +
>> +#define GEM_INT_Q1_ENABLE               (0x00000600 / 4)
>> +#define GEM_INT_Q7_ENABLE               (GEM_INT_Q1_ENABLE + 6)
>> +#define GEM_INT_Q8_ENABLE               (0x00000660 / 4)
>> +#define GEM_INT_Q15_ENABLE              (GEM_INT_Q8_ENABLE + 7)
>> +
>> +#define GEM_INT_Q1_DISABLE              (0x00000620 / 4)
>> +#define GEM_INT_Q7_DISABLE              (GEM_INT_Q1_DISABLE + 6)
>> +#define GEM_INT_Q8_DISABLE              (0x00000680 / 4)
>> +#define GEM_INT_Q15_DISABLE             (GEM_INT_Q8_DISABLE + 7)
>> +
>> +#define GEM_INT_Q1_MASK                 (0x00000640 / 4)
>> +#define GEM_INT_Q7_MASK                 (GEM_INT_Q1_MASK + 6)
>> +#define GEM_INT_Q8_MASK                 (0x000006A0 / 4)
>> +#define GEM_INT_Q15_MASK                (GEM_INT_Q8_MASK + 7)
>> +
>>  /*****************************************/
>>  #define GEM_NWCTRL_TXSTART     0x00000200 /* Transmit Enable */
>>  #define GEM_NWCTRL_TXENA       0x00000008 /* Transmit Enable */
>> @@ -284,9 +307,9 @@ static inline unsigned tx_desc_get_length(unsigned *desc)
>>      return desc[1] & DESC_1_LENGTH;
>>  }
>>
>> -static inline void print_gem_tx_desc(unsigned *desc)
>> +static inline void print_gem_tx_desc(unsigned *desc, uint8_t queue)
>>  {
>> -    DB_PRINT("TXDESC:\n");
>> +    DB_PRINT("TXDESC (queue %" PRId8 "):\n", queue);
>>      DB_PRINT("bufaddr: 0x%08x\n", *desc);
>>      DB_PRINT("used_hw: %d\n", tx_desc_get_used(desc));
>>      DB_PRINT("wrap:    %d\n", tx_desc_get_wrap(desc));
>> @@ -416,6 +439,7 @@ static void phy_update_link(CadenceGEMState *s)
>>  static int gem_can_receive(NetClientState *nc)
>>  {
>>      CadenceGEMState *s;
>> +    int i;
>>
>>      s = qemu_get_nic_opaque(nc);
>>
>> @@ -428,18 +452,20 @@ static int gem_can_receive(NetClientState *nc)
>>          return 0;
>>      }
>>
>> -    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
>> -        if (s->can_rx_state != 2) {
>> -            s->can_rx_state = 2;
>> -            DB_PRINT("can't receive - busy buffer descriptor 0x%x\n",
>> -                     s->rx_desc_addr[0]);
>> +    for (i = 0; i < s->num_priority_queues; i++) {
>> +        if (rx_desc_get_ownership(s->rx_desc[i]) == 1) {
>> +            if (s->can_rx_state != 2) {
>> +                s->can_rx_state = 2;
>> +                DB_PRINT("can't receive - busy buffer descriptor (q%d) 0x%x\n",
>> +                         i, s->rx_desc_addr[i]);
>> +             }
>> +            return 0;
>>          }
>> -        return 0;
>>      }
>>
>>      if (s->can_rx_state != 0) {
>>          s->can_rx_state = 0;
>> -        DB_PRINT("can receive 0x%x\n", s->rx_desc_addr[0]);
>> +        DB_PRINT("can receive\n");
>>      }
>>      return 1;
>>  }
>> @@ -450,9 +476,16 @@ static int gem_can_receive(NetClientState *nc)
>>   */
>>  static void gem_update_int_status(CadenceGEMState *s)
>>  {
>> -    if (s->regs[GEM_ISR]) {
>> -        DB_PRINT("asserting int. (0x%08x)\n", s->regs[GEM_ISR]);
>> -        qemu_set_irq(s->irq[0], 1);
>> +    int i;
>> +
>> +    for (i = 0; i < s->num_priority_queues; ++i) {
>> +        /* There seems to be no sane way to see which queue triggered the
>> +         * interrupt.
>> +         */
>> +        if (s->regs[GEM_ISR]) {
>> +            DB_PRINT("asserting int. q=%d)\n", i);
>> +            qemu_set_irq(s->irq[i], 1);
>
> I don't understand this. The hardware surely can't trigger
> every IRQ line simultaneously and identically ?

Yeah, this is wrong, I have updated it.

>
>> +        }
>>      }
>>  }
>>
>> @@ -601,17 +634,18 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
>>      return GEM_RX_REJECT;
>>  }
>>
>> -static void gem_get_rx_desc(CadenceGEMState *s)
>> +static void gem_get_rx_desc(CadenceGEMState *s, int q)
>>  {
>> -    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[0]);
>> +    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
>>      /* read current descriptor */
>>      cpu_physical_memory_read(s->rx_desc_addr[0],
>>                               (uint8_t *)s->rx_desc[0], sizeof(s->rx_desc[0]));
>>
>>      /* Descriptor owned by software ? */
>> -    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
>> +    if (rx_desc_get_ownership(s->rx_desc[q]) == 1 &&
>> +            s->num_priority_queues == 1) {
>
> Why only if num_priority_queues is 1? (This is one of those "looks
> a bit odd, is the h/w really like this?" questions; it could be right.)

Another weird thing, fixed.

>
>>          DB_PRINT("descriptor 0x%x owned by sw.\n",
>> -                 (unsigned)s->rx_desc_addr[0]);
>> +                 (unsigned)s->rx_desc_addr[q]);
>>          s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
>>          s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
>>          /* Handle interrupt consequences */
>> @@ -632,6 +666,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>>      uint8_t   *rxbuf_ptr;
>>      bool first_desc = true;
>>      int maf;
>> +    int q = 0;
>
> Shouldn't we be doing something for each queue, rather than just
> having a variable that's always 0?

Woops, I missed out on the screening logic. Added it in.

>
>>
>>      s = qemu_get_nic_opaque(nc);
>>
>> @@ -729,31 +764,31 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>>
>>          /* Update the descriptor.  */
>>          if (first_desc) {
>> -            rx_desc_set_sof(s->rx_desc[0]);
>> +            rx_desc_set_sof(s->rx_desc[q]);
>>              first_desc = false;
>>          }
>>          if (bytes_to_copy == 0) {
>> -            rx_desc_set_eof(s->rx_desc[0]);
>> -            rx_desc_set_length(s->rx_desc[0], size);
>> +            rx_desc_set_eof(s->rx_desc[q]);
>> +            rx_desc_set_length(s->rx_desc[q], size);
>>          }
>> -        rx_desc_set_ownership(s->rx_desc[0]);
>> +        rx_desc_set_ownership(s->rx_desc[q]);
>>
>>          switch (maf) {
>>          case GEM_RX_PROMISCUOUS_ACCEPT:
>>              break;
>>          case GEM_RX_BROADCAST_ACCEPT:
>> -            rx_desc_set_broadcast(s->rx_desc[0]);
>> +            rx_desc_set_broadcast(s->rx_desc[q]);
>>              break;
>>          case GEM_RX_UNICAST_HASH_ACCEPT:
>> -            rx_desc_set_unicast_hash(s->rx_desc[0]);
>> +            rx_desc_set_unicast_hash(s->rx_desc[q]);
>>              break;
>>          case GEM_RX_MULTICAST_HASH_ACCEPT:
>> -            rx_desc_set_multicast_hash(s->rx_desc[0]);
>> +            rx_desc_set_multicast_hash(s->rx_desc[q]);
>>              break;
>>          case GEM_RX_REJECT:
>>              abort();
>>          default: /* SAR */
>> -            rx_desc_set_sar(s->rx_desc[0], maf);
>> +            rx_desc_set_sar(s->rx_desc[q], maf);
>>          }
>>
>>          /* Descriptor write-back.  */
>> @@ -762,14 +797,15 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>>                                    sizeof(s->rx_desc[0]));
>>
>>          /* Next descriptor */
>> -        if (rx_desc_get_wrap(s->rx_desc[0])) {
>> +        if (rx_desc_get_wrap(s->rx_desc[q])) {
>>              DB_PRINT("wrapping RX descriptor list\n");
>>              s->rx_desc_addr[0] = s->regs[GEM_RXQBASE];
>>          } else {
>>              DB_PRINT("incrementing RX descriptor list\n");
>>              s->rx_desc_addr[0] += 8;
>>          }
>> -        gem_get_rx_desc(s);
>> +
>> +        gem_get_rx_desc(s, q);
>>      }
>>
>>      /* Count it */
>> @@ -841,6 +877,7 @@ static void gem_transmit(CadenceGEMState *s)
>>      uint8_t     tx_packet[2048];
>>      uint8_t     *p;
>>      unsigned    total_bytes;
>> +    int8_t q;
>
> Why int8_t here but int everywhere else?

No reason, it's an int now.

>
>>
>>      /* Do nothing if transmit is not enabled. */
>>      if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
>> @@ -856,8 +893,9 @@ static void gem_transmit(CadenceGEMState *s)
>>      p = tx_packet;
>>      total_bytes = 0;
>>
>> +    for (q = s->num_priority_queues - 1; q >= 0; q--) {
>>      /* read current descriptor */
>> -    packet_desc_addr = s->tx_desc_addr[0];
>> +    packet_desc_addr = s->tx_desc_addr[q];
>>
>>      DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
>>      cpu_physical_memory_read(packet_desc_addr,
>> @@ -869,7 +907,7 @@ static void gem_transmit(CadenceGEMState *s)
>>          if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
>>              return;
>>          }
>> -        print_gem_tx_desc(desc);
>> +        print_gem_tx_desc(desc, q);
>>
>>          /* The real hardware would eat this (and possibly crash).
>>           * For QEMU let's lend a helping hand.
>> @@ -904,18 +942,18 @@ static void gem_transmit(CadenceGEMState *s)
>>              /* Modify the 1st descriptor of this packet to be owned by
>>               * the processor.
>>               */
>> -            cpu_physical_memory_read(s->tx_desc_addr[0], (uint8_t *)desc_first,
>> +            cpu_physical_memory_read(s->tx_desc_addr[q], (uint8_t *)desc_first,
>>                                       sizeof(desc_first));
>>              tx_desc_set_used(desc_first);
>> -            cpu_physical_memory_write(s->tx_desc_addr[0], (uint8_t *)desc_first,
>> +            cpu_physical_memory_write(s->tx_desc_addr[q], (uint8_t *)desc_first,
>>                                        sizeof(desc_first));
>>              /* Advance the hardware current descriptor past this packet */
>>              if (tx_desc_get_wrap(desc)) {
>> -                s->tx_desc_addr[0] = s->regs[GEM_TXQBASE];
>> +                s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
>>              } else {
>> -                s->tx_desc_addr[0] = packet_desc_addr + 8;
>> +                s->tx_desc_addr[q] = packet_desc_addr + 8;
>>              }
>> -            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[0]);
>> +            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
>>
>>              s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
>>              s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
>> @@ -961,6 +999,7 @@ static void gem_transmit(CadenceGEMState *s)
>>          s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
>>          gem_update_int_status(s);
>>      }
>> +    }
>>  }
>>
>>  static void gem_phy_reset(CadenceGEMState *s)
>> @@ -1067,7 +1106,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
>>  {
>>      CadenceGEMState *s;
>>      uint32_t retval;
>> -
>> +    int i;
>>      s = (CadenceGEMState *)opaque;
>>
>>      offset >>= 2;
>> @@ -1077,8 +1116,10 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
>>
>>      switch (offset) {
>>      case GEM_ISR:
>> -        DB_PRINT("lowering irq on ISR read\n");
>> -        qemu_set_irq(s->irq[0], 0);
>> +        DB_PRINT("lowering irqs on ISR read\n");
>> +        for (i = 0; i < s->num_priority_queues; ++i) {
>> +            qemu_set_irq(s->irq[i], 0);
>> +        }
>>          break;
>>      case GEM_PHYMNTNC:
>>          if (retval & GEM_PHYMNTNC_OP_R) {
>> @@ -1103,6 +1144,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
>>      retval &= ~(s->regs_wo[offset]);
>>
>>      DB_PRINT("0x%08x\n", retval);
>> +    gem_update_int_status(s);
>>      return retval;
>>  }
>>
>> @@ -1115,6 +1157,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
>>  {
>>      CadenceGEMState *s = (CadenceGEMState *)opaque;
>>      uint32_t readonly;
>> +    int i;
>>
>>      DB_PRINT("offset: 0x%04x write: 0x%08x ", (unsigned)offset, (unsigned)val);
>>      offset >>= 2;
>> @@ -1134,14 +1177,18 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
>>      switch (offset) {
>>      case GEM_NWCTRL:
>>          if (val & GEM_NWCTRL_RXENA) {
>> -            gem_get_rx_desc(s);
>> +            for (i = 0; i < s->num_priority_queues; ++i) {
>> +                gem_get_rx_desc(s, i);
>> +            }
>>          }
>>          if (val & GEM_NWCTRL_TXSTART) {
>>              gem_transmit(s);
>>          }
>>          if (!(val & GEM_NWCTRL_TXENA)) {
>>              /* Reset to start of Q when transmit disabled. */
>> -            s->tx_desc_addr[0] = s->regs[GEM_TXQBASE];
>> +            for (i = 0; i < s->num_priority_queues; i++) {
>> +                s->tx_desc_addr[i] = s->regs[GEM_TXQBASE];
>> +            }
>>          }
>>          if (gem_can_receive(qemu_get_queue(s->nic))) {
>>              qemu_flush_queued_packets(qemu_get_queue(s->nic));
>> @@ -1154,9 +1201,15 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
>>      case GEM_RXQBASE:
>>          s->rx_desc_addr[0] = val;
>>          break;
>> +    case GEM_RECEIVE_Q1_PTR ... GEM_RECEIVE_Q15_PTR:
>> +        s->rx_desc_addr[offset - GEM_RECEIVE_Q1_PTR + 1] = val;
>> +        break;
>>      case GEM_TXQBASE:
>>          s->tx_desc_addr[0] = val;
>>          break;
>> +    case GEM_TRANSMIT_Q1_PTR ... GEM_TRANSMIT_Q15_PTR:
>> +        s->tx_desc_addr[offset - GEM_TRANSMIT_Q1_PTR + 1] = val;
>> +        break;
>>      case GEM_RXSTATUS:
>>          gem_update_int_status(s);
>>          break;
>> @@ -1164,10 +1217,26 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
>>          s->regs[GEM_IMR] &= ~val;
>>          gem_update_int_status(s);
>>          break;
>> +    case GEM_INT_Q1_ENABLE ... GEM_INT_Q7_ENABLE:
>> +        s->regs[GEM_INT_Q1_MASK + offset - GEM_INT_Q1_ENABLE] &= ~val;
>> +        gem_update_int_status(s);
>> +        break;
>> +    case GEM_INT_Q8_ENABLE ... GEM_INT_Q15_ENABLE:
>> +        s->regs[GEM_INT_Q8_MASK + offset - GEM_INT_Q8_ENABLE] &= ~val;
>> +        gem_update_int_status(s);
>> +        break;
>>      case GEM_IDR:
>>          s->regs[GEM_IMR] |= val;
>>          gem_update_int_status(s);
>>          break;
>> +    case GEM_INT_Q1_DISABLE ... GEM_INT_Q7_DISABLE:
>> +        s->regs[GEM_INT_Q1_MASK + offset - GEM_INT_Q1_DISABLE] |= val;
>> +        gem_update_int_status(s);
>> +        break;
>> +    case GEM_INT_Q8_DISABLE ... GEM_INT_Q15_DISABLE:
>> +        s->regs[GEM_INT_Q8_MASK + offset - GEM_INT_Q8_DISABLE] |= val;
>> +        gem_update_int_status(s);
>> +        break;
>>      case GEM_SPADDR1LO:
>>      case GEM_SPADDR2LO:
>>      case GEM_SPADDR3LO:
>> @@ -1204,8 +1273,11 @@ static const MemoryRegionOps gem_ops = {
>>
>>  static void gem_set_link(NetClientState *nc)
>>  {
>> +    CadenceGEMState *s = qemu_get_nic_opaque(nc);
>> +
>>      DB_PRINT("\n");
>> -    phy_update_link(qemu_get_nic_opaque(nc));
>> +    phy_update_link(s);
>> +    gem_update_int_status(s);
>>  }
>>
>>  static NetClientInfo net_gem_info = {
>> @@ -1219,8 +1291,11 @@ static NetClientInfo net_gem_info = {
>>  static void gem_realize(DeviceState *dev, Error **errp)
>>  {
>>      CadenceGEMState *s = CADENCE_GEM(dev);
>> +    int i;
>>
>> -    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[0]);
>> +    for (i = 0; i < s->num_priority_queues; ++i) {
>> +        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[i]);
>> +    }
>>
>>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
>>
>> @@ -1260,6 +1335,8 @@ static const VMStateDescription vmstate_cadence_gem = {
>>
>>  static Property gem_properties[] = {
>>      DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
>> +    DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
>> +                      num_priority_queues, 1),
>
> This should go in the same patch as adding the field to the
> CadenceGEMState struct (don't care whether you move the prop
> define or the field addition).

Agreed, I have moved it to an earlier patch.

>
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>
>> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
>> index 77e0582..60b3ab0 100644
>> --- a/include/hw/net/cadence_gem.h
>> +++ b/include/hw/net/cadence_gem.h
>> @@ -30,7 +30,7 @@
>>  #include "net/net.h"
>>  #include "hw/sysbus.h"
>>
>> -#define CADENCE_GEM_MAXREG        (0x00000640/4) /* Last valid GEM address */
>> +#define CADENCE_GEM_MAXREG        (0x00000800 / 4) /* Last valid GEM address */
>
> Changing this define changes the migration format (because it
> has an array of this size in it) so you need a version bump.

Done

Thanks,

Alistair

>
>>  #define MAX_PRIORITY_QUEUES             8
>>
>> --
>> 2.7.4
>
> thanks
> -- PMM
>
