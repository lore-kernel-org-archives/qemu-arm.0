Received: by 10.25.21.156 with SMTP id 28csp1805521lfv;
        Tue, 26 Jul 2016 09:25:10 -0700 (PDT)
X-Received: by 10.200.37.129 with SMTP id e1mr39326345qte.96.1469550310561;
        Tue, 26 Jul 2016 09:25:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t13si919277qkt.322.2016.07.26.09.25.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 09:25:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS5AL-0006UC-Vn
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 12:25:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bS58d-0005V0-EB
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 12:23:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bS58b-00037I-7L
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 12:23:23 -0400
Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242]:33215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bS58a-00036s-V6; Tue, 26 Jul 2016 12:23:21 -0400
Received: by mail-io0-x242.google.com with SMTP id y195so2371910iod.0;
	Tue, 26 Jul 2016 09:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=h3YQStQJnABMybjR7N1XZdcUNci1kRB0Qar3WSReBhQ=;
	b=K34TpFv1Ks2/Cj0+JUNMAusonn2XN7wEJ9ciuck0DDhJ0GDuLpC3DGd/Me/eIWtLvA
	HnpI6SN58EVQnCrjkjCYob7Dnm9V03Nm1zFMi1fMmUUl/ZrKWthV4aZSdbo4qf1NDCZq
	KpIXDBdxBlIUz5wFfWlaIs+QVgkJT5obxbwGzHYZVmjEF/ZR2Nw6gYdelOLEQHZzv7Q1
	gEGLIFyuotdNT2FJI3EYj0dnuuLLzPY/oMSxB6REDZ4Gqg1nqgx9iaKC8ZHMjD7ke5z3
	HOCP87t6jr4bOv/wy96O2SvFa/qsC165l3GgeDvjyo1nonQdtzD2xRz6D7OPNdt40mLG
	92ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=h3YQStQJnABMybjR7N1XZdcUNci1kRB0Qar3WSReBhQ=;
	b=iUIzOIkpCn9g8AsJYhUwt+C7s+LlVoegHoa6WaPKt8K3Eg3DdN3gfDSUIjED2jhh1V
	AdQIsnwIUMWqXM1K5BArzFSkI5ZTyAkvlO9sPbSRkMkOqj2beCMJ19HuxPG8Q4O+CLwr
	5REoc2I++NFIuwf0p/1827dBas7HFDr8payYwg881t+1DsuZIOvZwkYelDuwWzUO+lYY
	CbKME4s7PiChNujRkXcztM1cGEccDolZ+L4UbGpRTXPTOe6OfVSqVIRHWq7vZT/ePzyh
	nh80xOKzEeOivE2n7L7FcNnY7bCoqUkrDXKZ+almyuZVnttEXYW2YCrvtVR28kPHFxuO
	tLQA==
X-Gm-Message-State: AEkoout1Xpj0Mkf0T9v6gsYjxzMBoBfcUWbk3OgxdqbMNsjMeUiP3X+LWGXLLD/5ufPoJthiI2VfG1LhG0jX/g==
X-Received: by 10.157.41.134 with SMTP id n6mr12291557otb.69.1469550200049;
	Tue, 26 Jul 2016 09:23:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Tue, 26 Jul 2016 09:22:50 -0700 (PDT)
In-Reply-To: <CAFEAcA8fZF5rXKniMBaS9WQf3uCCLAFea6XhCuE2QmgwLFiYUA@mail.gmail.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
	<b270adaf1f9d2b0a4b618c8f7267ca7402c7a48c.1469491920.git.alistair.francis@xilinx.com>
	<CAFEAcA8fZF5rXKniMBaS9WQf3uCCLAFea6XhCuE2QmgwLFiYUA@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 26 Jul 2016 09:22:50 -0700
X-Google-Sender-Auth: PUHpDsw75DPznlC49OEac5lHflU
Message-ID: <CAKmqyKPhkvWKEYae4vrgpY=Q6TPCHQmOGNK8HM0r8bs86FwMZA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/6] cadence_gem: Add queue
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
X-TUID: 2Gcj1eHCUgZ3

On Tue, Jul 26, 2016 at 5:06 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 26 July 2016 at 01:12, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>
>> There is a indentation error in this patch in the gem_transmit function.
>> I have written it like that to make it easier to see the changes. It is
>> fixed in the next patch.
>>
>> V2:
>>  - Use the new screening function
>>  - Update interrupt generation
>>  - Increase vmstate to 3.0
>>
>>  hw/net/cadence_gem.c         | 180 ++++++++++++++++++++++++++++++++-----------
>>  include/hw/net/cadence_gem.h |   2 +-
>>  2 files changed, 135 insertions(+), 47 deletions(-)
>>
>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>> index d38bc1e..28c2ddb 100644
>> --- a/hw/net/cadence_gem.c
>> +++ b/hw/net/cadence_gem.c
>> @@ -142,6 +142,30 @@
>>  #define GEM_DESCONF6      (0x00000294/4)
>>  #define GEM_DESCONF7      (0x00000298/4)
>>
>> +#define GEM_INT_Q1_STATUS               (0x00000400 / 4)
>> +#define GEM_INT_Q1_MASK                 (0x00000640 / 4)
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
>>  #define GEM_SCREENING_TYPE1_REGISTER_0  (0x00000500 / 4)
>>
>>  #define GEM_ST1R_UDP_PORT_MATCH_ENABLE  (1 << 29)
>> @@ -316,9 +340,9 @@ static inline unsigned tx_desc_get_length(unsigned *desc)
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
>> @@ -448,6 +472,7 @@ static void phy_update_link(CadenceGEMState *s)
>>  static int gem_can_receive(NetClientState *nc)
>>  {
>>      CadenceGEMState *s;
>> +    int i;
>>
>>      s = qemu_get_nic_opaque(nc);
>>
>> @@ -460,18 +485,20 @@ static int gem_can_receive(NetClientState *nc)
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
>> @@ -482,9 +509,20 @@ static int gem_can_receive(NetClientState *nc)
>>   */
>>  static void gem_update_int_status(CadenceGEMState *s)
>>  {
>> -    if (s->regs[GEM_ISR]) {
>> -        DB_PRINT("asserting int. (0x%08x)\n", s->regs[GEM_ISR]);
>> +    int i;
>> +
>> +    if (!s->num_priority_queues && s->regs[GEM_ISR]) {
>
> Other parts of the code assume that num_priority_queues can't
> be zero (ie that the smallest case is "one priority queue").
> Either they're wrong or this is.

This is, I have updated it and fixed everything else.

Thanks,

Alistair

>
>> +        /* No priority queues, just trigger the interrupt */
>> +        DB_PRINT("asserting int.\n", i);
>>          qemu_set_irq(s->irq[0], 1);
>> +        return;
>> +    }
>> +
>> +    for (i = 0; i < s->num_priority_queues; ++i) {
>> +        if (s->regs[GEM_INT_Q1_STATUS + i]) {
>> +            DB_PRINT("asserting int. (q=%d)\n", i);
>> +            qemu_set_irq(s->irq[i], 1);
>> +        }
>>      }
>>  }
>>
>> @@ -748,17 +786,17 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr)
>>      return 0;
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
>> +    if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
>>          DB_PRINT("descriptor 0x%x owned by sw.\n",
>> -                 (unsigned)s->rx_desc_addr[0]);
>> +                 (unsigned)s->rx_desc_addr[q]);
>>          s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
>>          s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
>>          /* Handle interrupt consequences */
>> @@ -779,6 +817,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>>      uint8_t   *rxbuf_ptr;
>>      bool first_desc = true;
>>      int maf;
>> +    int q = 0;
>>
>>      s = qemu_get_nic_opaque(nc);
>>
>> @@ -857,6 +896,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>>
>>      DB_PRINT("config bufsize: %d packet size: %ld\n", rxbufsize, size);
>>
>> +    /* Find which queue we are targetting */
>> +    q = get_queue_from_screen(s, rxbuf_ptr);
>> +
>>      while (bytes_to_copy) {
>>          /* Do nothing if receive is not enabled. */
>>          if (!gem_can_receive(nc)) {
>> @@ -865,10 +907,10 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>>          }
>>
>>          DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
>> -                rx_desc_get_buffer(s->rx_desc[0]));
>> +                rx_desc_get_buffer(s->rx_desc[q]));
>>
>>          /* Copy packet data to emulated DMA buffer */
>> -        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc[0]) +
>> +        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc[q]) +
>>                                                                   rxbuf_offset,
>>                                    rxbuf_ptr, MIN(bytes_to_copy, rxbufsize));
>>          rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
>> @@ -876,47 +918,48 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
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
>> -        cpu_physical_memory_write(s->rx_desc_addr[0],
>> -                                  (uint8_t *)s->rx_desc[0],
>> -                                  sizeof(s->rx_desc[0]));
>> +        cpu_physical_memory_write(s->rx_desc_addr[q],
>> +                                  (uint8_t *)s->rx_desc[q],
>> +                                  sizeof(s->rx_desc[q]));
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
>> @@ -988,6 +1031,7 @@ static void gem_transmit(CadenceGEMState *s)
>>      uint8_t     tx_packet[2048];
>>      uint8_t     *p;
>>      unsigned    total_bytes;
>> +    int8_t q;
>
> Why int8_t here but int earlier?
>
>>
>>      /* Do nothing if transmit is not enabled. */
>>      if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
>> @@ -1003,8 +1047,9 @@ static void gem_transmit(CadenceGEMState *s)
>>      p = tx_packet;
>>      total_bytes = 0;
>>
>> +    for (q = s->num_priority_queues - 1; q >= 0; q--) {
>>      /* read current descriptor */
>> -    packet_desc_addr = s->tx_desc_addr[0];
>> +    packet_desc_addr = s->tx_desc_addr[q];
>
> (This is an example of code which assumes num_priority_queues is at least 1.)
>
>>
>>      DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
>>      cpu_physical_memory_read(packet_desc_addr,
>> @@ -1016,7 +1061,7 @@ static void gem_transmit(CadenceGEMState *s)
>>          if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
>>              return;
>>          }
>> -        print_gem_tx_desc(desc);
>> +        print_gem_tx_desc(desc, q);
>>
>>          /* The real hardware would eat this (and possibly crash).
>>           * For QEMU let's lend a helping hand.
>> @@ -1051,22 +1096,28 @@ static void gem_transmit(CadenceGEMState *s)
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
>>
>> +            /* Update queue interrupt status */
>> +            if (s->num_priority_queues) {
>> +                s->regs[GEM_INT_Q1_STATUS + q] |=
>> +                        GEM_INT_TXCMPL & ~(s->regs[GEM_INT_Q1_MASK + q]);
>> +            }
>> +
>>              /* Handle interrupt consequences */
>>              gem_update_int_status(s);
>>
>> @@ -1108,6 +1159,7 @@ static void gem_transmit(CadenceGEMState *s)
>>          s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
>>          gem_update_int_status(s);
>>      }
>> +    }
>>  }
>>
>>  static void gem_phy_reset(CadenceGEMState *s)
>> @@ -1214,7 +1266,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
>>  {
>>      CadenceGEMState *s;
>>      uint32_t retval;
>> -
>> +    int i;
>>      s = (CadenceGEMState *)opaque;
>>
>>      offset >>= 2;
>> @@ -1224,8 +1276,10 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
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
>> @@ -1250,6 +1304,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
>>      retval &= ~(s->regs_wo[offset]);
>>
>>      DB_PRINT("0x%08x\n", retval);
>> +    gem_update_int_status(s);
>>      return retval;
>>  }
>>
>> @@ -1262,6 +1317,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
>>  {
>>      CadenceGEMState *s = (CadenceGEMState *)opaque;
>>      uint32_t readonly;
>> +    int i;
>>
>>      DB_PRINT("offset: 0x%04x write: 0x%08x ", (unsigned)offset, (unsigned)val);
>>      offset >>= 2;
>> @@ -1281,14 +1337,18 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
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
>> @@ -1301,9 +1361,15 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
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
>> @@ -1311,10 +1377,26 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
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
>> @@ -1351,8 +1433,11 @@ static const MemoryRegionOps gem_ops = {
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
>> @@ -1366,8 +1451,11 @@ static NetClientInfo net_gem_info = {
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
>> @@ -1391,8 +1479,8 @@ static void gem_init(Object *obj)
>>
>>  static const VMStateDescription vmstate_cadence_gem = {
>>      .name = "cadence_gem",
>> -    .version_id = 2,
>> -    .minimum_version_id = 3,
>> +    .version_id = 3,
>> +    .minimum_version_id = 0,
>
> Something odd has happened here -- the minimum_version_id is wrong.
>
>>      .fields = (VMStateField[]) {
>>          VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
>>          VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
>> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
>> index f2f78c0..47a1661 100644
>> --- a/include/hw/net/cadence_gem.h
>> +++ b/include/hw/net/cadence_gem.h
>> @@ -30,7 +30,7 @@
>>  #include "net/net.h"
>>  #include "hw/sysbus.h"
>>
>> -#define CADENCE_GEM_MAXREG        (0x00000640/4) /* Last valid GEM address */
>> +#define CADENCE_GEM_MAXREG        (0x00000800 / 4) /* Last valid GEM address */
>>
>>  #define MAX_PRIORITY_QUEUES             8
>
> thanks
> -- PMM
>
