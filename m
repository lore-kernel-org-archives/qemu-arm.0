Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5629026wrt;
        Tue, 2 Oct 2018 16:20:42 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62+aCZP/JG7vpe7XfzhKFXa2J566BGS+vmHyk3gjD9B79a4K40iunRJWmMer/EvZt9LmWO/
X-Received: by 2002:a37:48e:: with SMTP id 136-v6mr13489731qke.316.1538522442441;
        Tue, 02 Oct 2018 16:20:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538522442; cv=none;
        d=google.com; s=arc-20160816;
        b=BXJLkM58ruKBJTPiaQlpvq20GrdlsdACkjxq1eS2+bjUTI0V10b4vToXj4fVSYghM7
         PaepV3XWYYaap9CJqkrhFpHDK4ZO+G1XIKvDndgtOwi3i+tYIwmudSC0vZjDXymZgXiV
         T9V8Ip53er/YP+b1zHIFv0yYDBvzSGkG1HGW1dPWG27NZmpcmOCSIobTwXWUVNQ7j5XV
         h3u6LOzp8arRR9RU1QHqO78Y0dQ6hvrXPx2LohlNBh6n13T2K9zYdLlLKIKd+FNBa27y
         /MOD8x3l8XomDjQwGe529Nm7GyhdSi1dyiCVNS3m6nYdnGc8BVn71U0m/tezbLvdiV+o
         nmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=u3EMjY86/J1cWwlBUGhVSdyvWx2dgt11uMDcWpy32Sc=;
        b=qNsovXpveHJwo6DV5Vx12hIG6cW9EntZmnG4Eopufce1zndN/bOhIo0dPmftth4wU5
         cIsnPDogrVH8AQ2AIIWYUHmHbFpP6v7AjESJ5E1v3qjpkhOJTbG4C9b3E/YsA7d8c2Ni
         Wf7i75n0s58Jz9vS5VTwH6oIuOf4/ghxd9IrVrtVt/P3sUjlfovQjC3ntEiWsD9pJasD
         RU8Dm4gg05KX8w4ZX7DZl30ufdI8wPMO61jb8ocTkROLt0NmlDvKzQHnvJ3LbCxEANEp
         NKTc1+O5Ve+sTVFpwaoi05SQdrnkK2WFtB2p4rfGbEiQvBlqmx0yxEX2lFEh4KIHMwSR
         VNfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i2-v6si5717552qkf.293.2018.10.02.16.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 16:20:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46115 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Ty5-0003lw-OD
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 19:20:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7Tvh-0002Zl-89
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 19:18:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7ToK-0006Jt-9A
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 19:10:41 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37032)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7ToI-0006J2-DX
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 19:10:35 -0400
Received: by mail-wm1-f65.google.com with SMTP id 185-v6so3761846wmt.2
	for <qemu-devel@nongnu.org>; Tue, 02 Oct 2018 16:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=u3EMjY86/J1cWwlBUGhVSdyvWx2dgt11uMDcWpy32Sc=;
	b=Vlf5+GAd7ArjR00t0X+od7mDR96SLgM2r8yceypU6JI5pkgDxY5u4ROOo8krZ9X/WX
	4ptS8xyHt6ZpsT9E/t0AEergm78+ioyNFlaDZRR4RsXvQDLfb/jYK2zjSEk1ob9gOF+H
	kE91xpLnPXlilVtuW7kS22QTpUEBxvcJKjCZFfbCrHN8/fSMw+BCux6e8+ojdhcMY3vA
	6w+DQ8j/1e18pmZP7WW2sbcNaa+JjsRapFs9UZObyDBblok053gD97yJpdfU6+lnCsA0
	2sQAskfS+n6Yl51sFd3croT7Q7W1QJ/y9cqrpCH986ROxyyYmYzDAPokWvQJALzI/7oN
	rEvg==
X-Gm-Message-State: ABuFfogVOI/ne6ThhQDiY3ACr0On97L/2jm5jj1XgUaj++tCR+4DqUKI
	89iJTVFS9Xxj7kXe+/Gr4RUA8g==
X-Received: by 2002:a1c:845:: with SMTP id 66-v6mr3462457wmi.61.1538521832295; 
	Tue, 02 Oct 2018 16:10:32 -0700 (PDT)
Received: from [192.168.2.51] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	l67-v6sm5288935wma.20.2018.10.02.16.10.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 16:10:31 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<20181002142443.30976-8-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7621d3ab-7cfe-0dca-bc0e-dad913052b25@redhat.com>
Date: Wed, 3 Oct 2018 01:10:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002142443.30976-8-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH v5 7/9] hw/misc/zynq_slcr: add clock
 generation for uarts
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, konrad@adacore.com,
	luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YwOnlgZxEYYl

Hi Damien,

On 10/2/18 4:24 PM, Damien Hedde wrote:
> Add 2 clock outputs for each uart (uart0 & 1):
> + the reference clock
> + the bus interface clock
> 
> The clock frequencies are computed using the internal pll & uart configuration
> registers.
> 
> All clocks depend on the main input clock (ps_clk), which is hard-coded
> to 33.33MHz (zcu102 evaluation board frequency and frequency specified
> in Xilinx's device tree file)

What about adding in zynq_init:

    ClockOut *ps_clk = qdev_init_clock_out(DEVICE(machine), "ps_clk");
    clock_set_frequency(ps_clk, PS_REF_CLK_FREQUENCY);

and later:

    qdev_connect_clock(slcr, "ps_clk",
                       DEVICE(machine), "ps_clk_in", &error_abort);

That would be a more complete example of clock tree.

> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/misc/zynq_slcr.c | 125 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index baa13d1316..0b599ebd97 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -33,6 +33,8 @@
>          } \
>      } while (0)
>  
> +#define INPUT_PS_REF_CLK_FREQUENCY (33333333)
> +
>  #define XILINX_LOCK_KEY 0x767b
>  #define XILINX_UNLOCK_KEY 0xdf0d
>  
> @@ -44,15 +46,27 @@ REG32(LOCKSTA, 0x00c)
>  REG32(ARM_PLL_CTRL, 0x100)
>  REG32(DDR_PLL_CTRL, 0x104)
>  REG32(IO_PLL_CTRL, 0x108)
> +/* fields for [ARM|DDR|IO_PLL]_CTRL registers */
> +    FIELD(xxx_PLL_CTRL, PLL_RESET, 0, 1)
> +    FIELD(xxx_PLL_CTRL, PLL_PWRDWN, 1, 1)
> +    FIELD(xxx_PLL_CTRL, PLL_BYPASS_QUAL, 3, 1)
> +    FIELD(xxx_PLL_CTRL, PLL_BYPASS_FORCE, 4, 1)
> +    FIELD(xxx_PLL_CTRL, PLL_FPDIV, 12, 7)
>  REG32(PLL_STATUS, 0x10c)
>  REG32(ARM_PLL_CFG, 0x110)
>  REG32(DDR_PLL_CFG, 0x114)
>  REG32(IO_PLL_CFG, 0x118)
>  
>  REG32(ARM_CLK_CTRL, 0x120)
> +    FIELD(ARM_CLK_CTRL, SRCSEL,  4, 2)
> +    FIELD(ARM_CLK_CTRL, DIVISOR, 8, 6)
> +    FIELD(ARM_CLK_CTRL, CPU_1XCLKACT, 27, 1)
> +    FIELD(ARM_CLK_CTRL, CPU_PERI_CLKACT, 28, 1)
>  REG32(DDR_CLK_CTRL, 0x124)
>  REG32(DCI_CLK_CTRL, 0x128)
>  REG32(APER_CLK_CTRL, 0x12c)
> +    FIELD(APER_CLK_CTRL, UART0_CPU1XCLKACT, 20, 1)
> +    FIELD(APER_CLK_CTRL, UART1_CPU1XCLKACT, 21, 1)
>  REG32(USB0_CLK_CTRL, 0x130)
>  REG32(USB1_CLK_CTRL, 0x134)
>  REG32(GEM0_RCLK_CTRL, 0x138)
> @@ -63,12 +77,19 @@ REG32(SMC_CLK_CTRL, 0x148)
>  REG32(LQSPI_CLK_CTRL, 0x14c)
>  REG32(SDIO_CLK_CTRL, 0x150)
>  REG32(UART_CLK_CTRL, 0x154)
> +    FIELD(UART_CLK_CTRL, CLKACT0, 0, 1)
> +    FIELD(UART_CLK_CTRL, CLKACT1, 1, 1)
> +    FIELD(UART_CLK_CTRL, SRCSEL,  4, 2)
> +    FIELD(UART_CLK_CTRL, DIVISOR, 8, 6)
>  REG32(SPI_CLK_CTRL, 0x158)
>  REG32(CAN_CLK_CTRL, 0x15c)
>  REG32(CAN_MIOCLK_CTRL, 0x160)
>  REG32(DBG_CLK_CTRL, 0x164)
>  REG32(PCAP_CLK_CTRL, 0x168)
>  REG32(TOPSW_CLK_CTRL, 0x16c)
> +/* common fields to lots of *_CLK_CTRL registers */
> +    FIELD(xxx_CLK_CTRL, SRCSEL,  4, 2)
> +    FIELD(xxx_CLK_CTRL, DIVISOR, 8, 6)
>  
>  #define FPGA_CTRL_REGS(n, start) \
>      REG32(FPGA ## n ## _CLK_CTRL, (start)) \
> @@ -178,8 +199,92 @@ typedef struct ZynqSLCRState {
>      MemoryRegion iomem;
>  
>      uint32_t regs[ZYNQ_SLCR_NUM_REGS];
> +
> +    ClockOut *uart0_amba_clk;
> +    ClockOut *uart1_amba_clk;
> +    ClockOut *uart0_ref_clk;
> +    ClockOut *uart1_ref_clk;
>  } ZynqSLCRState;
>  
> +/*
> + * return the output frequency of ARM/DDR/IO pll
> + * using input frequency and PLL_CTRL register
> + */
> +static uint64_t zynq_slcr_compute_pll(uint64_t input, uint32_t ctrl_reg)
> +{
> +    uint32_t mult = ((ctrl_reg & R_xxx_PLL_CTRL_PLL_FPDIV_MASK) >>
> +            R_xxx_PLL_CTRL_PLL_FPDIV_SHIFT);
> +
> +    /* first, check if pll is bypassed */
> +    if (ctrl_reg & R_xxx_PLL_CTRL_PLL_BYPASS_FORCE_MASK) {
> +        return input;
> +    }
> +
> +    /* is pll disabled ? */
> +    if (ctrl_reg & (R_xxx_PLL_CTRL_PLL_RESET_MASK |
> +                    R_xxx_PLL_CTRL_PLL_PWRDWN_MASK)) {
> +        return 0;
> +    }
> +
> +    return input * mult;
> +}
> +
> +/*
> + * return the output frequency of a clock given:
> + * + the pll's frequencies in an array corresponding to mux's indexes
> + * + the register xxx_CLK_CTRL value
> + * + enable bit index in ctrl register
> + *
> + * This function make the assumption that ctrl_reg value is organized as follow:
> + * + bits[13:8] clock divisor
> + * + bits[5:4]  clock mux selector (index in array)
> + * + bits[index] clock enable
> + */
> +static uint64_t zynq_slcr_compute_clock(const uint64_t plls[],
> +                                        uint32_t ctrl_reg,
> +                                        unsigned index)
> +{
> +    uint32_t divisor = FIELD_EX32(ctrl_reg, xxx_CLK_CTRL, DIVISOR);
> +    uint32_t srcsel = FIELD_EX32(ctrl_reg, xxx_CLK_CTRL, SRCSEL);
> +
> +    if ((ctrl_reg & (1u << index)) == 0) {
> +        return 0;
> +    }
> +
> +    return plls[srcsel] / (divisor ? divisor : 1u);
> +}
> +
> +#define ZYNQ_CLOCK(_state, _plls, _reg, _enable_field) \
> +    zynq_slcr_compute_clock((_plls), (_state)->regs[R_ ## _reg], \
> +            R_ ## _reg ## _ ## _enable_field ## _SHIFT)
> +#define ZYNQ_GATE(_state, _clk, _reg, _field) \
> +    (ARRAY_FIELD_EX32((_state)->regs, _reg, _field) ? (_clk) : 0)
> +
> +static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
> +{
> +    uint64_t ps_clk = INPUT_PS_REF_CLK_FREQUENCY;
> +    uint64_t io_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_IO_PLL_CTRL]);
> +    uint64_t arm_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_ARM_PLL_CTRL]);
> +    uint64_t ddr_pll = zynq_slcr_compute_pll(ps_clk, s->regs[R_DDR_PLL_CTRL]);
> +    uint64_t cpu_mux[4] = {arm_pll, arm_pll, ddr_pll, io_pll};
> +    uint64_t uart_mux[4] = {io_pll, io_pll, arm_pll, ddr_pll};
> +    uint64_t cpu1x_clk;
> +
> +    /* compute uartX amba clocks */
> +    cpu1x_clk = ZYNQ_CLOCK(s, cpu_mux, ARM_CLK_CTRL, CPU_PERI_CLKACT);
> +    cpu1x_clk = ZYNQ_GATE(s, cpu1x_clk, ARM_CLK_CTRL, CPU_1XCLKACT);
> +    clock_set_frequency(s->uart0_amba_clk,
> +            ZYNQ_GATE(s, cpu1x_clk, APER_CLK_CTRL, UART0_CPU1XCLKACT));
> +    clock_set_frequency(s->uart1_amba_clk,
> +            ZYNQ_GATE(s, cpu1x_clk, APER_CLK_CTRL, UART1_CPU1XCLKACT));
> +
> +    /* compute uartX ref clocks */
> +    clock_set_frequency(s->uart0_ref_clk,
> +            ZYNQ_CLOCK(s, uart_mux, UART_CLK_CTRL, CLKACT0));
> +    clock_set_frequency(s->uart1_ref_clk,
> +            ZYNQ_CLOCK(s, uart_mux, UART_CLK_CTRL, CLKACT1));
> +}
> +
>  static void zynq_slcr_reset(DeviceState *d)
>  {
>      ZynqSLCRState *s = ZYNQ_SLCR(d);
> @@ -274,6 +379,8 @@ static void zynq_slcr_reset(DeviceState *d)
>      s->regs[R_DDRIOB + 4] = s->regs[R_DDRIOB + 5] = s->regs[R_DDRIOB + 6]
>                            = 0x00000e00;
>      s->regs[R_DDRIOB + 12] = 0x00000021;
> +
> +    zynq_slcr_compute_clocks(s);
>  }
>  
>  
> @@ -408,6 +515,14 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
>              qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>          }
>          break;
> +    case R_IO_PLL_CTRL:
> +    case R_ARM_PLL_CTRL:
> +    case R_DDR_PLL_CTRL:
> +    case R_ARM_CLK_CTRL:
> +    case R_APER_CLK_CTRL:
> +    case R_UART_CLK_CTRL:
> +        zynq_slcr_compute_clocks(s);
> +        break;
>      }
>  }
>  
> @@ -417,6 +532,14 @@ static const MemoryRegionOps slcr_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> +static const ClockPortInitArray zynq_slcr_clocks = {
> +    QDEV_CLOCK_OUT(ZynqSLCRState, uart0_amba_clk),
> +    QDEV_CLOCK_OUT(ZynqSLCRState, uart1_amba_clk),
> +    QDEV_CLOCK_OUT(ZynqSLCRState, uart0_ref_clk),
> +    QDEV_CLOCK_OUT(ZynqSLCRState, uart1_ref_clk),
> +    QDEV_CLOCK_END,
> +};
> +
>  static void zynq_slcr_init(Object *obj)
>  {
>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
> @@ -424,6 +547,8 @@ static void zynq_slcr_init(Object *obj)
>      memory_region_init_io(&s->iomem, obj, &slcr_ops, s, "slcr",
>                            ZYNQ_SLCR_MMIO_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
> +
> +    qdev_init_clocks(DEVICE(obj), zynq_slcr_clocks);
>  }
>  
>  static const VMStateDescription vmstate_zynq_slcr = {
> 
