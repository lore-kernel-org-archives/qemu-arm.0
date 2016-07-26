Received: by 10.25.21.156 with SMTP id 28csp1677471lfv;
        Tue, 26 Jul 2016 05:12:43 -0700 (PDT)
X-Received: by 10.37.205.194 with SMTP id d185mr17435332ybf.40.1469535163402;
        Tue, 26 Jul 2016 05:12:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3si265073qkh.329.2016.07.26.05.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 05:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS1E2-0007bh-JQ
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 08:12:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS13c-00068U-RZ
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 08:01:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS13b-0007Wj-DC
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 08:01:56 -0400
Received: from mail-ua0-x235.google.com ([2607:f8b0:400c:c08::235]:36101)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS13a-0007Wa-LI
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 08:01:55 -0400
Received: by mail-ua0-x235.google.com with SMTP id j59so1104813uaj.3
	for <qemu-arm@nongnu.org>; Tue, 26 Jul 2016 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z6E6gAPlyZrzfaNbmfSJtXMMkHnQGQqSQkohZcYJ8eY=;
	b=P+cdaZ8nBTOZIPCyoKikZatGN5IBxGDGdhlK58veZa2hE5ml0h01fDxzcrpznyGove
	V32CuljTniposmcJ1WufE8gx9Uw6gZMMNkq52TvX9qDXy21XHM6/eUnDQrvY66Q2fC28
	30Jj4Om9LK+b9Bwj8H5enK0xBnCfOd8x7qQX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z6E6gAPlyZrzfaNbmfSJtXMMkHnQGQqSQkohZcYJ8eY=;
	b=cqCVsRzGGOj8c9RtufWUwPnvpxiFKWp/zfhKKDzfW5HtKJ37LnafLP/VrPnvc82v3F
	Bfr2dCbOAqqafevX59PYbYgu+SxW5ZUge5iBG+bu4QMrha/AXOUCC9u04GwGoEVaBtYa
	ukMpAvSEImF8g3B37PUgz722DM/2Ldm1EjFtek8fupWfO6OM+WMlSdQw0bF8Cz8mwMlv
	KHeiXj4MJ9EsLWWfhJvzHtOxzuHVGnztuh9bbOX+prJZp+hm+1hv6XXwBnQzE64f0i2b
	oROfoiMvK/LLIbI68M3O+gbbLXtrTm9z8GrxUuzfeG812IP+0YBiDVTL6nFIz8qwDn2z
	9BIw==
X-Gm-Message-State: AEkoouvEcvk91DS0hnEjv1BL6N/fJ+Nl5y3auPpioYefANtZS9NEYF5cS/jCWpUE973eUX2/wPvV535VQd+0LPPM
X-Received: by 10.176.65.71 with SMTP id j65mr10076856uad.103.1469534513931;
	Tue, 26 Jul 2016 05:01:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Tue, 26 Jul 2016 05:01:34 -0700 (PDT)
In-Reply-To: <0402d187c9f749701f6fe728faf3e28c6b86a74b.1469491920.git.alistair.francis@xilinx.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
	<0402d187c9f749701f6fe728faf3e28c6b86a74b.1469491920.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2016 13:01:34 +0100
Message-ID: <CAFEAcA_+iHZhKPFt8cYQpc0p0zM6oFBTyK2=T+7wYJzuFWYB7A@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::235
Subject: Re: [Qemu-arm] [PATCH v2 3/6] cadence_gem: Add support for screening
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
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pe3eI3SCoGFq

On 26 July 2016 at 01:12, Alistair Francis <alistair.francis@xilinx.com> wrote:
> The Cadence GEM hardware allows incoming data to be 'screened' based on some
> register values. Add support for these screens.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> V2:
>  - Initial commit
>
>  hw/net/cadence_gem.c         | 151 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/net/cadence_gem.h |   2 +
>  2 files changed, 153 insertions(+)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index deae122..d38bc1e 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -26,6 +26,7 @@
>  #include <zlib.h> /* For crc32 */
>
>  #include "hw/net/cadence_gem.h"
> +#include "qemu/log.h"
>  #include "net/checksum.h"
>
>  #ifdef CADENCE_GEM_ERR_DEBUG
> @@ -141,6 +142,37 @@
>  #define GEM_DESCONF6      (0x00000294/4)
>  #define GEM_DESCONF7      (0x00000298/4)
>
> +#define GEM_SCREENING_TYPE1_REGISTER_0  (0x00000500 / 4)
> +
> +#define GEM_ST1R_UDP_PORT_MATCH_ENABLE  (1 << 29)
> +#define GEM_ST1R_DSTC_ENABLE            (1 << 28)
> +#define GEM_ST1R_UDP_PORT_MATCH_SHIFT   (12)
> +#define GEM_ST1R_UDP_PORT_MATCH_WIDTH   (27 - GEM_ST1R_UDP_PORT_MATCH_SHIFT + 1)
> +#define GEM_ST1R_DSTC_MATCH_SHIFT       (4)
> +#define GEM_ST1R_DSTC_MATCH_WIDTH       (11 - GEM_ST1R_DSTC_MATCH_SHIFT + 1)
> +#define GEM_ST1R_QUEUE_SHIFT            (0)
> +#define GEM_ST1R_QUEUE_WIDTH            (3 - GEM_ST1R_QUEUE_SHIFT + 1)
> +
> +#define GEM_SCREENING_TYPE2_REGISTER_0  (0x00000540 / 4)
> +
> +#define GEM_ST2R_COMPARE_A_ENABLE       (1 << 18)
> +#define GEM_ST2R_COMPARE_A_SHIFT        (13)
> +#define GEM_ST2R_COMPARE_WIDTH          (17 - GEM_ST2R_COMPARE_A_SHIFT + 1)
> +#define GEM_ST2R_ETHERTYPE_ENABLE       (1 << 12)
> +#define GEM_ST2R_ETHERTYPE_INDEX_SHIFT  (9)
> +#define GEM_ST2R_ETHERTYPE_INDEX_WIDTH  (11 - GEM_ST2R_ETHERTYPE_INDEX_SHIFT \
> +                                            + 1)
> +#define GEM_ST2R_QUEUE_SHIFT            (0)
> +#define GEM_ST2R_QUEUE_WIDTH            (3 - GEM_ST2R_QUEUE_SHIFT + 1)
> +
> +#define GEM_SCREENING_TYPE2_ETHERTYPE_REG_0     (0x000006e0 / 4)
> +#define GEM_TYPE2_COMPARE_0_WORD_0              (0x00000700 / 4)
> +
> +#define GEM_T2CW1_COMPARE_OFFSET_SHIFT  (7)
> +#define GEM_T2CW1_COMPARE_OFFSET_WIDTH  (8 - GEM_T2CW1_COMPARE_OFFSET_SHIFT + 1)
> +#define GEM_T2CW1_OFFSET_VALUE_SHIFT    (0)
> +#define GEM_T2CW1_OFFSET_VALUE_WIDTH    (6 - GEM_T2CW1_OFFSET_VALUE_SHIFT + 1)
> +
>  /*****************************************/
>  #define GEM_NWCTRL_TXSTART     0x00000200 /* Transmit Enable */
>  #define GEM_NWCTRL_TXENA       0x00000008 /* Transmit Enable */
> @@ -601,6 +633,121 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
>      return GEM_RX_REJECT;
>  }
>
> +/* Figure out which queue the recieved data should be sent to */

"received"

> +static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr)

Nothing seems to call this -- this probably results in a complaint
about an unused function if you build at this point in the series
(possibly only with optimisation on).

Do we need to also pass in the length of the rxbuf to avoid
reading beyond the end of short packets?

> +{
> +    uint32_t reg;
> +    bool matched, mismatched;
> +    int i, j;
> +
> +    for (i = 0; i < s->num_type1_screeners; i++) {
> +        reg = s->regs[GEM_SCREENING_TYPE1_REGISTER_0 + i];
> +        matched = false;
> +        mismatched = false;
> +
> +        /* Screening is based on UDP Port */
> +        if (reg & GEM_ST1R_UDP_PORT_MATCH_ENABLE) {
> +            uint16_t udp_port = rxbuf_ptr[14 + 22] << 8 | rxbuf_ptr[14 + 23];
> +            if (udp_port == extract32(reg, GEM_ST1R_UDP_PORT_MATCH_SHIFT,
> +                                           GEM_ST1R_UDP_PORT_MATCH_WIDTH)) {
> +                matched = true;
> +            } else {
> +                mismatched = true;
> +            }
> +        }
> +
> +        /* Screening is based on DS/TC */
> +        if (reg & GEM_ST1R_DSTC_ENABLE) {
> +            uint16_t dscp = rxbuf_ptr[14 + 1];

Why uint16_t if we're only reading one byte?

> +            if (dscp == extract32(reg, GEM_ST1R_DSTC_MATCH_SHIFT,
> +                                       GEM_ST1R_DSTC_MATCH_WIDTH)) {
> +                matched = true;
> +            } else {
> +                mismatched = true;
> +            }
> +        }
> +
> +        if (matched && !mismatched) {
> +            return extract32(reg, GEM_ST1R_QUEUE_SHIFT, GEM_ST1R_QUEUE_WIDTH);
> +        }
> +    }
> +
> +    for (i = 0; i < s->num_type2_screeners; i++) {
> +        reg = s->regs[GEM_SCREENING_TYPE2_REGISTER_0 + i];
> +        matched = false;
> +        mismatched = false;
> +
> +        if (reg & GEM_ST2R_ETHERTYPE_ENABLE) {
> +            uint16_t type = rxbuf_ptr[12] << 8 | rxbuf_ptr[13];
> +            int et_idx = extract32(reg, GEM_ST2R_ETHERTYPE_INDEX_SHIFT,
> +                                        GEM_ST2R_ETHERTYPE_INDEX_WIDTH);
> +
> +            if (et_idx > s->num_type2_screeners) {
> +                qemu_log_mask(LOG_GUEST_ERROR, "Out of range ethertype "
> +                              "register index: %d\n", et_idx);
> +            }
> +            if (type == s->regs[GEM_SCREENING_TYPE2_ETHERTYPE_REG_0 +
> +                                et_idx]) {
> +                matched = true;
> +            } else {
> +                mismatched = true;
> +            }
> +        }
> +
> +        /* Compare A, B, C */
> +        for (j = 0; j < 3; j++) {
> +            uint32_t cr0, cr1, mask;
> +            uint16_t rx_cmp;
> +            int offset;
> +            int cr_idx = extract32(reg, GEM_ST2R_COMPARE_A_SHIFT + j * 6,
> +                                        GEM_ST2R_COMPARE_WIDTH);
> +
> +            if (!(reg & (GEM_ST2R_COMPARE_A_ENABLE << (j * 6)))) {
> +                continue;
> +            }
> +            if (cr_idx > s->num_type2_screeners) {
> +                qemu_log_mask(LOG_GUEST_ERROR, "Out of range compare "
> +                              "register index: %d\n", cr_idx);
> +            }
> +
> +            cr0 = s->regs[GEM_TYPE2_COMPARE_0_WORD_0 + cr_idx * 2];
> +            cr1 = s->regs[GEM_TYPE2_COMPARE_0_WORD_0 + cr_idx * 2 + 1];
> +            offset = extract32(cr1, GEM_T2CW1_OFFSET_VALUE_SHIFT,
> +                                    GEM_T2CW1_OFFSET_VALUE_WIDTH);
> +
> +            switch (extract32(cr1, GEM_T2CW1_COMPARE_OFFSET_SHIFT,
> +                                   GEM_T2CW1_COMPARE_OFFSET_WIDTH)) {

You pulled this out into 'offset' so you can just switch (offset).

> +            case (3): /* Skip UDP header */

You don't need brackets around the constants in case labels.

> +                qemu_log_mask(LOG_UNIMP, "TCP compare offsets"
> +                              "unimplemented - assuming UDP\n");
> +                offset += 8;
> +                /* Fallthrough */
> +            case (2): /* skip the IP header */
> +                offset += 20;
> +                /* Fallthrough */
> +            case (1): /* Count from after the ethertype */
> +                offset += 14;

'break' here would be a good idea.

What should happen for case 0? Guest error?

> +            }
> +
> +            rx_cmp = rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
> +            mask = extract32(cr0, 0, 16);
> +
> +            if ((rx_cmp & mask) == (extract32(cr0, 16, 16) & mask)) {
> +                matched = true;
> +            } else {
> +                mismatched = true;
> +            }
> +        }
> +
> +        if (matched && !mismatched) {
> +            return extract32(reg, GEM_ST2R_QUEUE_SHIFT, GEM_ST2R_QUEUE_WIDTH);
> +        }
> +    }
> +
> +    /* We made it here, assume it's queue 0 */
> +    return 0;
> +}
> +
>  static void gem_get_rx_desc(CadenceGEMState *s)
>  {
>      DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[0]);
> @@ -1263,6 +1410,10 @@ static Property gem_properties[] = {
>      DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
>      DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
>                        num_priority_queues, 1),
> +    DEFINE_PROP_UINT8("num-type1-screeners", CadenceGEMState,
> +                      num_type1_screeners, 4),
> +    DEFINE_PROP_UINT8("num-type2-screeners", CadenceGEMState,
> +                      num_type2_screeners, 4),

realize() should sanity check the properties aren't set too large.

>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
> index 77e0582..f2f78c0 100644
> --- a/include/hw/net/cadence_gem.h
> +++ b/include/hw/net/cadence_gem.h
> @@ -46,6 +46,8 @@ typedef struct CadenceGEMState {
>
>      /* Static properties */
>      uint8_t num_priority_queues;
> +    uint8_t num_type1_screeners;
> +    uint8_t num_type2_screeners;
>
>      /* GEM registers backing store */
>      uint32_t regs[CADENCE_GEM_MAXREG];
> --
> 2.7.4

thanks
-- PMM
