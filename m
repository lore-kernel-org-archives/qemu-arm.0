Received: by 10.25.21.156 with SMTP id 28csp1813498lfv;
        Tue, 26 Jul 2016 09:42:47 -0700 (PDT)
X-Received: by 10.37.90.137 with SMTP id o131mr9161987ybb.98.1469551367745;
        Tue, 26 Jul 2016 09:42:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c144si987644qkg.51.2016.07.26.09.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 09:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS5RP-0005RO-7n
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 12:42:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bS5RK-0005RH-CD
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 12:42:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bS5RE-0007bE-BF
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 12:42:42 -0400
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:34016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bS5RE-0007bA-4I; Tue, 26 Jul 2016 12:42:36 -0400
Received: by mail-io0-x243.google.com with SMTP id g86so2451041ioj.1;
	Tue, 26 Jul 2016 09:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=3ewbOuWVAsc4Xk76YCpsyoiDer2ZpuyeeDVjfviiYqQ=;
	b=YlSqHPIpE0e9gHNKCNrDZWVL9YqROlwp5ctil+Mic2JrdrYzx3890gc7OymiSXx+P7
	GQwnt7SX7FrSdesdQjWjo5nLb8YeNFbHYnxR1pwWSyy65d91aYOaZizIN/Z5ZzS5OGSN
	zc3fy+hZMi+KRDszcsdlf5xHMitA7y6jPjQRjJ2He08Lzw5Mu5RK9AQ1NL5vOAW0vEEH
	NW1VxgaL9QmjPW1VHuAiUrpx36GgGIeZVsBIXPXrnXPBvbQEaqT/Uqols16qxtC+TdEd
	H1GetHecteYFQr48HPGR877QN2P6a1doreZXvsM7IV0WV1AVafevXCveaAALU9IsbpmX
	oVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=3ewbOuWVAsc4Xk76YCpsyoiDer2ZpuyeeDVjfviiYqQ=;
	b=G2pQYUgtr2REGEzDj+1+t3W6joAacuIQHY6sCjr/eD47l0pwiliphQ3CQEXWeEyRL3
	vUZ3dGq/11rmgKN3B0MgcLmf3ErR1QhiBXWI8rqK4tqtbv2F7ACN8YQ1obRVEb5KASze
	8G1oZi0v/dTlVCw33nmoGH8CYLEgO/zYU2SzWzKkjBAzp2TpgxaA/WwdjrCGf3KEte2+
	ixCI2ykUBG4Vp6idcWkYoxrto8Q8OexgymiY8KalI4xfiprMDyMyikoMchCmEIGBPQlh
	7Y7WXu41E/gqpuhKBN/V8mvG6254aOxTM/uL3Y04TjQyn1evq0ow7d0JcjNJYh0eVMBE
	2eqg==
X-Gm-Message-State: AEkoout8qRkNE+H4UShY0ALqC4q133VZisLTYQSNEnN7i3Hzi6CNIe7DQ1tBxDrsTiRg25IqQb6AB02GlvXn4Q==
X-Received: by 10.157.41.134 with SMTP id n6mr12336963otb.69.1469551355200;
	Tue, 26 Jul 2016 09:42:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Tue, 26 Jul 2016 09:42:05 -0700 (PDT)
In-Reply-To: <CAFEAcA_+iHZhKPFt8cYQpc0p0zM6oFBTyK2=T+7wYJzuFWYB7A@mail.gmail.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
	<0402d187c9f749701f6fe728faf3e28c6b86a74b.1469491920.git.alistair.francis@xilinx.com>
	<CAFEAcA_+iHZhKPFt8cYQpc0p0zM6oFBTyK2=T+7wYJzuFWYB7A@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 26 Jul 2016 09:42:05 -0700
X-Google-Sender-Auth: R70YV4bKzFAjPGJlK-vCyVnMcRk
Message-ID: <CAKmqyKOh3RJbkgGVHqWOws=dXrNGyGhkzzrZ6bSHyMhbHs_4ug@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/6] cadence_gem: Add support
 for screening
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
X-TUID: Dh4E+P1q6p2A

On Tue, Jul 26, 2016 at 5:01 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 26 July 2016 at 01:12, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> The Cadence GEM hardware allows incoming data to be 'screened' based on some
>> register values. Add support for these screens.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>> V2:
>>  - Initial commit
>>
>>  hw/net/cadence_gem.c         | 151 +++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/net/cadence_gem.h |   2 +
>>  2 files changed, 153 insertions(+)
>>
>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>> index deae122..d38bc1e 100644
>> --- a/hw/net/cadence_gem.c
>> +++ b/hw/net/cadence_gem.c
>> @@ -26,6 +26,7 @@
>>  #include <zlib.h> /* For crc32 */
>>
>>  #include "hw/net/cadence_gem.h"
>> +#include "qemu/log.h"
>>  #include "net/checksum.h"
>>
>>  #ifdef CADENCE_GEM_ERR_DEBUG
>> @@ -141,6 +142,37 @@
>>  #define GEM_DESCONF6      (0x00000294/4)
>>  #define GEM_DESCONF7      (0x00000298/4)
>>
>> +#define GEM_SCREENING_TYPE1_REGISTER_0  (0x00000500 / 4)
>> +
>> +#define GEM_ST1R_UDP_PORT_MATCH_ENABLE  (1 << 29)
>> +#define GEM_ST1R_DSTC_ENABLE            (1 << 28)
>> +#define GEM_ST1R_UDP_PORT_MATCH_SHIFT   (12)
>> +#define GEM_ST1R_UDP_PORT_MATCH_WIDTH   (27 - GEM_ST1R_UDP_PORT_MATCH_SHIFT + 1)
>> +#define GEM_ST1R_DSTC_MATCH_SHIFT       (4)
>> +#define GEM_ST1R_DSTC_MATCH_WIDTH       (11 - GEM_ST1R_DSTC_MATCH_SHIFT + 1)
>> +#define GEM_ST1R_QUEUE_SHIFT            (0)
>> +#define GEM_ST1R_QUEUE_WIDTH            (3 - GEM_ST1R_QUEUE_SHIFT + 1)
>> +
>> +#define GEM_SCREENING_TYPE2_REGISTER_0  (0x00000540 / 4)
>> +
>> +#define GEM_ST2R_COMPARE_A_ENABLE       (1 << 18)
>> +#define GEM_ST2R_COMPARE_A_SHIFT        (13)
>> +#define GEM_ST2R_COMPARE_WIDTH          (17 - GEM_ST2R_COMPARE_A_SHIFT + 1)
>> +#define GEM_ST2R_ETHERTYPE_ENABLE       (1 << 12)
>> +#define GEM_ST2R_ETHERTYPE_INDEX_SHIFT  (9)
>> +#define GEM_ST2R_ETHERTYPE_INDEX_WIDTH  (11 - GEM_ST2R_ETHERTYPE_INDEX_SHIFT \
>> +                                            + 1)
>> +#define GEM_ST2R_QUEUE_SHIFT            (0)
>> +#define GEM_ST2R_QUEUE_WIDTH            (3 - GEM_ST2R_QUEUE_SHIFT + 1)
>> +
>> +#define GEM_SCREENING_TYPE2_ETHERTYPE_REG_0     (0x000006e0 / 4)
>> +#define GEM_TYPE2_COMPARE_0_WORD_0              (0x00000700 / 4)
>> +
>> +#define GEM_T2CW1_COMPARE_OFFSET_SHIFT  (7)
>> +#define GEM_T2CW1_COMPARE_OFFSET_WIDTH  (8 - GEM_T2CW1_COMPARE_OFFSET_SHIFT + 1)
>> +#define GEM_T2CW1_OFFSET_VALUE_SHIFT    (0)
>> +#define GEM_T2CW1_OFFSET_VALUE_WIDTH    (6 - GEM_T2CW1_OFFSET_VALUE_SHIFT + 1)
>> +
>>  /*****************************************/
>>  #define GEM_NWCTRL_TXSTART     0x00000200 /* Transmit Enable */
>>  #define GEM_NWCTRL_TXENA       0x00000008 /* Transmit Enable */
>> @@ -601,6 +633,121 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
>>      return GEM_RX_REJECT;
>>  }
>>
>> +/* Figure out which queue the recieved data should be sent to */
>
> "received"

Fixed.

>
>> +static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr)
>
> Nothing seems to call this -- this probably results in a complaint
> about an unused function if you build at this point in the series
> (possibly only with optimisation on).

There is a warning about this. I wasn't sure what the position on
warnings in between patch a series was. I can squash this into the
next patch, I was just worried that the patch was getting a little
big.

What do you think?

>
> Do we need to also pass in the length of the rxbuf to avoid
> reading beyond the end of short packets?

That is probably a good idea.

>
>> +{
>> +    uint32_t reg;
>> +    bool matched, mismatched;
>> +    int i, j;
>> +
>> +    for (i = 0; i < s->num_type1_screeners; i++) {
>> +        reg = s->regs[GEM_SCREENING_TYPE1_REGISTER_0 + i];
>> +        matched = false;
>> +        mismatched = false;
>> +
>> +        /* Screening is based on UDP Port */
>> +        if (reg & GEM_ST1R_UDP_PORT_MATCH_ENABLE) {
>> +            uint16_t udp_port = rxbuf_ptr[14 + 22] << 8 | rxbuf_ptr[14 + 23];
>> +            if (udp_port == extract32(reg, GEM_ST1R_UDP_PORT_MATCH_SHIFT,
>> +                                           GEM_ST1R_UDP_PORT_MATCH_WIDTH)) {
>> +                matched = true;
>> +            } else {
>> +                mismatched = true;
>> +            }
>> +        }
>> +
>> +        /* Screening is based on DS/TC */
>> +        if (reg & GEM_ST1R_DSTC_ENABLE) {
>> +            uint16_t dscp = rxbuf_ptr[14 + 1];
>
> Why uint16_t if we're only reading one byte?

Good point, fixed.

>
>> +            if (dscp == extract32(reg, GEM_ST1R_DSTC_MATCH_SHIFT,
>> +                                       GEM_ST1R_DSTC_MATCH_WIDTH)) {
>> +                matched = true;
>> +            } else {
>> +                mismatched = true;
>> +            }
>> +        }
>> +
>> +        if (matched && !mismatched) {
>> +            return extract32(reg, GEM_ST1R_QUEUE_SHIFT, GEM_ST1R_QUEUE_WIDTH);
>> +        }
>> +    }
>> +
>> +    for (i = 0; i < s->num_type2_screeners; i++) {
>> +        reg = s->regs[GEM_SCREENING_TYPE2_REGISTER_0 + i];
>> +        matched = false;
>> +        mismatched = false;
>> +
>> +        if (reg & GEM_ST2R_ETHERTYPE_ENABLE) {
>> +            uint16_t type = rxbuf_ptr[12] << 8 | rxbuf_ptr[13];
>> +            int et_idx = extract32(reg, GEM_ST2R_ETHERTYPE_INDEX_SHIFT,
>> +                                        GEM_ST2R_ETHERTYPE_INDEX_WIDTH);
>> +
>> +            if (et_idx > s->num_type2_screeners) {
>> +                qemu_log_mask(LOG_GUEST_ERROR, "Out of range ethertype "
>> +                              "register index: %d\n", et_idx);
>> +            }
>> +            if (type == s->regs[GEM_SCREENING_TYPE2_ETHERTYPE_REG_0 +
>> +                                et_idx]) {
>> +                matched = true;
>> +            } else {
>> +                mismatched = true;
>> +            }
>> +        }
>> +
>> +        /* Compare A, B, C */
>> +        for (j = 0; j < 3; j++) {
>> +            uint32_t cr0, cr1, mask;
>> +            uint16_t rx_cmp;
>> +            int offset;
>> +            int cr_idx = extract32(reg, GEM_ST2R_COMPARE_A_SHIFT + j * 6,
>> +                                        GEM_ST2R_COMPARE_WIDTH);
>> +
>> +            if (!(reg & (GEM_ST2R_COMPARE_A_ENABLE << (j * 6)))) {
>> +                continue;
>> +            }
>> +            if (cr_idx > s->num_type2_screeners) {
>> +                qemu_log_mask(LOG_GUEST_ERROR, "Out of range compare "
>> +                              "register index: %d\n", cr_idx);
>> +            }
>> +
>> +            cr0 = s->regs[GEM_TYPE2_COMPARE_0_WORD_0 + cr_idx * 2];
>> +            cr1 = s->regs[GEM_TYPE2_COMPARE_0_WORD_0 + cr_idx * 2 + 1];
>> +            offset = extract32(cr1, GEM_T2CW1_OFFSET_VALUE_SHIFT,
>> +                                    GEM_T2CW1_OFFSET_VALUE_WIDTH);
>> +
>> +            switch (extract32(cr1, GEM_T2CW1_COMPARE_OFFSET_SHIFT,
>> +                                   GEM_T2CW1_COMPARE_OFFSET_WIDTH)) {
>
> You pulled this out into 'offset' so you can just switch (offset).

They are actually different.

>
>> +            case (3): /* Skip UDP header */
>
> You don't need brackets around the constants in case labels.

Fixed

>
>> +                qemu_log_mask(LOG_UNIMP, "TCP compare offsets"
>> +                              "unimplemented - assuming UDP\n");
>> +                offset += 8;
>> +                /* Fallthrough */
>> +            case (2): /* skip the IP header */
>> +                offset += 20;
>> +                /* Fallthrough */
>> +            case (1): /* Count from after the ethertype */
>> +                offset += 14;
>
> 'break' here would be a good idea.
>
> What should happen for case 0? Guest error?

No change to offset. I added a case for it.

>
>> +            }
>> +
>> +            rx_cmp = rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
>> +            mask = extract32(cr0, 0, 16);
>> +
>> +            if ((rx_cmp & mask) == (extract32(cr0, 16, 16) & mask)) {
>> +                matched = true;
>> +            } else {
>> +                mismatched = true;
>> +            }
>> +        }
>> +
>> +        if (matched && !mismatched) {
>> +            return extract32(reg, GEM_ST2R_QUEUE_SHIFT, GEM_ST2R_QUEUE_WIDTH);
>> +        }
>> +    }
>> +
>> +    /* We made it here, assume it's queue 0 */
>> +    return 0;
>> +}
>> +
>>  static void gem_get_rx_desc(CadenceGEMState *s)
>>  {
>>      DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[0]);
>> @@ -1263,6 +1410,10 @@ static Property gem_properties[] = {
>>      DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
>>      DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
>>                        num_priority_queues, 1),
>> +    DEFINE_PROP_UINT8("num-type1-screeners", CadenceGEMState,
>> +                      num_type1_screeners, 4),
>> +    DEFINE_PROP_UINT8("num-type2-screeners", CadenceGEMState,
>> +                      num_type2_screeners, 4),
>
> realize() should sanity check the properties aren't set too large.

Ok, adding it.

Thanks,

Alistair

>
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>
>> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
>> index 77e0582..f2f78c0 100644
>> --- a/include/hw/net/cadence_gem.h
>> +++ b/include/hw/net/cadence_gem.h
>> @@ -46,6 +46,8 @@ typedef struct CadenceGEMState {
>>
>>      /* Static properties */
>>      uint8_t num_priority_queues;
>> +    uint8_t num_type1_screeners;
>> +    uint8_t num_type2_screeners;
>>
>>      /* GEM registers backing store */
>>      uint32_t regs[CADENCE_GEM_MAXREG];
>> --
>> 2.7.4
>
> thanks
> -- PMM
>
