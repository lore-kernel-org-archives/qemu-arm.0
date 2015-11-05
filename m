Received: by 10.182.105.169 with SMTP id gn9csp173760obb;
        Wed, 4 Nov 2015 16:42:34 -0800 (PST)
X-Received: by 10.31.158.193 with SMTP id h184mr4537054vke.129.1446684154928;
        Wed, 04 Nov 2015 16:42:34 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s1si2868071vke.48.2015.11.04.16.42.34
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Wed, 04 Nov 2015 16:42:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:57883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zu8dO-0006Hu-Js
	for alex.bennee@linaro.org; Wed, 04 Nov 2015 19:42:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1Zu8d2-0005zG-6C
	for qemu-devel@nongnu.org; Wed, 04 Nov 2015 19:42:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1Zu8d1-0001ze-3T
	for qemu-devel@nongnu.org; Wed, 04 Nov 2015 19:42:12 -0500
Received: from mail-ob0-x230.google.com ([2607:f8b0:4003:c01::230]:35561)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1Zu8d0-0001zV-Ui; Wed, 04 Nov 2015 19:42:11 -0500
Received: by obctp1 with SMTP id tp1so53908059obc.2;
	Wed, 04 Nov 2015 16:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=SVvYMY/ZwqZQ6YvUolXcTI6HlH1jOOwXyvdFSFdXjf8=;
	b=Q4qOFflZNk1GaZ8Dngh1Za+C2lWHRZWzMpKtiERzbnEv68AZjAa42FJX4pWv6s0DcQ
	pM26oC9IDZhh/pPAilCWfe/M1qlihB88bwP0b0yMKGxzfewmbtuntIUks4eCHAh3+EAW
	YfzUfaAC3cLRqtpnO23EUnOkqDPOPCEOl+vsZnfl4XrJTpxqXyMBopvIevhCqye9MQAK
	7pHBmbT2QE4BsvpjFEc0KwCqjmZY61glrGZ72wBReI6T+UDjX2xD1hIpUFnbDqOliKea
	tF8Afn248/BNwdgk/WeNawXPQ/mk5OuPAMIkZX3DbgIG0Y4SH3vU0MSihpwnv7qdTCfU
	bLCg==
X-Received: by 10.182.142.129 with SMTP id rw1mr2768346obb.28.1446684130290;
	Wed, 04 Nov 2015 16:42:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.228 with HTTP; Wed, 4 Nov 2015 16:41:40 -0800 (PST)
In-Reply-To: <9a9025ea65572586b50dca4e5819032e3c436d64.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
	<9a9025ea65572586b50dca4e5819032e3c436d64.1446182614.git.crosthwaite.peter@gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 4 Nov 2015 16:41:40 -0800
X-Google-Sender-Auth: NuZqPSAft_yIWD2JH-dJHTg5qyQ
Message-ID: <CAKmqyKPFZW2tcEOBuzAAMF_==SNfWVc56o+1w2T4HhO5tF9fWA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::230
Cc: robh@kernel.org, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-devel] [PATCH v2 3/5] arm: xilinx_zynq: Add linux pre-boot
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: D2M1wiA7g3Rm

On Thu, Oct 29, 2015 at 10:34 PM, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Add a Linux-specific pre-boot routine that matches the device-
> specific bootloaders behaviour. This is needed for modern Linux that
> expects the ARM PLL in SLCR to be a more even value (not 26).
>
> Cc: Alistair Francis <alistair.francis@xilinx.com>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

This looks fine to me. I haven't looked much at the other patches though.

I think a comment in the zynq_write_board_setup() function saying what
it is doing wouldn't hurt either. Basically just copying the commit
message.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
> Changed since v1:
> Left main loader address unchanged
> Added comments for SLCR_WRITE macro (PMM review)
> Convert SLCR_WRITE impl. to use movw/movt (PMM review)
> Missing "-" for device-specific
> Changed since RFC:
> Use bootloader callback to load blob.
> Change "firmware" to "board-setup" for consistency.
>
>  hw/arm/xilinx_zynq.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 9f89483..82a9db8 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -43,6 +43,45 @@ static const int dma_irqs[8] = {
>      46, 47, 48, 49, 72, 73, 74, 75
>  };
>
> +#define BOARD_SETUP_ADDR        0x100
> +
> +#define SLCR_LOCK_OFFSET        0x004
> +#define SLCR_UNLOCK_OFFSET      0x008
> +#define SLCR_ARM_PLL_OFFSET     0x100
> +
> +#define SLCR_XILINX_UNLOCK_KEY  0xdf0d
> +#define SLCR_XILINX_LOCK_KEY    0x767b
> +
> +#define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
> +                        extract32((x), 12,  4) << 16)
> +
> +/* Write immediate val to address r0 + addr. r0 should contain base offset
> + * of the SLCR block. Clobbers r1.
> + */
> +
> +#define SLCR_WRITE(addr, val) \
> +    0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16)), /* movw r1 ... */ \
> +    0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16)), /* movt r1 ... */ \
> +    0xe5801000 + (addr)
> +
> +static void zynq_write_board_setup(ARMCPU *cpu,
> +                                   const struct arm_boot_info *info)
> +{
> +    int n;
> +    uint32_t board_setup_blob[] = {
> +        0xe3a004f8, /* mov r0, #0xf8000000 */
> +        SLCR_WRITE(SLCR_UNLOCK_OFFSET, SLCR_XILINX_UNLOCK_KEY),
> +        SLCR_WRITE(SLCR_ARM_PLL_OFFSET, 0x00014008),
> +        SLCR_WRITE(SLCR_LOCK_OFFSET, SLCR_XILINX_LOCK_KEY),
> +        0xe12fff1e, /* bx lr */
> +    };
> +    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
> +        board_setup_blob[n] = tswap32(board_setup_blob[n]);
> +    }
> +    rom_add_blob_fixed("board-setup", board_setup_blob,
> +                       sizeof(board_setup_blob), BOARD_SETUP_ADDR);
> +}
> +
>  static struct arm_boot_info zynq_binfo = {};
>
>  static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
> @@ -252,6 +291,9 @@ static void zynq_init(MachineState *machine)
>      zynq_binfo.nb_cpus = 1;
>      zynq_binfo.board_id = 0xd32;
>      zynq_binfo.loader_start = 0;
> +    zynq_binfo.board_setup_addr = BOARD_SETUP_ADDR;
> +    zynq_binfo.write_board_setup = zynq_write_board_setup;
> +
>      arm_load_kernel(ARM_CPU(first_cpu), &zynq_binfo);
>  }
>
> --
> 1.9.1
>
>
