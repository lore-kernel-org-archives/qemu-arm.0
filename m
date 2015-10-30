Received: by 10.182.105.169 with SMTP id gn9csp102846obb;
        Fri, 30 Oct 2015 14:11:17 -0700 (PDT)
X-Received: by 10.140.102.201 with SMTP id w67mr12920228qge.82.1446239477815;
        Fri, 30 Oct 2015 14:11:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n17si7608900qgd.28.2015.10.30.14.11.17
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 30 Oct 2015 14:11:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:53165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsGxB-00081B-J8
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 17:11:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsGx9-00080v-25
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 17:11:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsGx7-00032l-Qe
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 17:11:15 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsGx7-00032X-LU
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 17:11:13 -0400
Received: by vkgy127 with SMTP id y127so55700624vkg.0
	for <qemu-arm@nongnu.org>; Fri, 30 Oct 2015 14:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=leFpLGVIGSqQR+0Q0oUOt6YeuutWTzoD7ul6hWw+kzU=;
	b=Dy9g60QStjwqJNG+D5xmzLTmmBRIsXAEXZWGIeWCrVPAbhV/4VzfhCtaKGafpKx6sH
	zMvwNhDdyDYMcAvVyLbAC8+7ubZEU15A/ygl/Q7k3IPrCzPqcK5aDA1ISlQL5tcfPSv+
	MyJy9URBUbE2e1WfQZ9KiSsvkXw2hNRAvbYFFiiLtEa9SYSjmX1+qTXevilFhUPmGNc+
	Qn8NoRVe8z5BCdjoS3G9kwD7viUhXNGGDIXWetHYv2gB+lRosP3hlwjVqR35xxJC/n8j
	FLUZBxq9fzrOvqiqLpLUglo0rmgkPmnEl80QgvxrSWqVprG3xahEcPwQxrFIWIVftlek
	tN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=leFpLGVIGSqQR+0Q0oUOt6YeuutWTzoD7ul6hWw+kzU=;
	b=ckqJhZpigfKR4z0ADkIcwJzrgxQZST3PX+O7YgE3iZTLQDbL6I+VwfN9Wycq/wP1va
	aUpYQwbB7BAL+aRDLIDY+5auy3RcXPFLd2QXcCbgbl8spK4PkdoieBmLN5HUV1bx8Q1A
	4KoSUIICtBhm7S0houn3hOtcBbE8nQpcXqxdZHqpYszDcyP8Y4q4XbtlEguFKa0+Hlii
	7e7HFy83bSrFBK0eSyX6nF/u+IeCGvZrk/SUfm7Qj6rT6iUmtPwEAfMZ4hnrLFt0O4KT
	E6GOFedlSyPsAPYJ3mreQTpLkIQzxBsjMMW3EKH3h7bvP+rLEnjqQX6k96b6TRVFfNW7
	5sPA==
X-Gm-Message-State: ALoCoQny+MFCyEC0veXL784XN4GRFbpgcF2Jm9+B0LC8r5t/QX6MktSLtwWbY85KJg2zyyjF46Bt
X-Received: by 10.31.136.144 with SMTP id k138mr6702856vkd.92.1446239473169;
	Fri, 30 Oct 2015 14:11:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 30 Oct 2015 14:10:53 -0700 (PDT)
In-Reply-To: <f017d14547e267df4421a64533230297a2225fed.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
	<f017d14547e267df4421a64533230297a2225fed.1446182614.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2015 21:10:53 +0000
Message-ID: <CAFEAcA9GyDsYY8f+G15HhrVQhRHjsMxdeo=53bNYQZOE2ScciA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-arm] [PATCH v2 5/5] arm: highbank: Implement PSCI and
	dummy monitor
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CxRjoFbTDe/p

On 30 October 2015 at 05:35, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Firstly, enable monitor mode and PSCI, both are which are features of
> this board.
>
> In addition to PSCI, this board also uses SMC for cache maintainence
> ops. This means we need a secure monitor to catch these and nop them.
> Use the ARM boot board-setup feature to implement this. All traps to
> monitor mode implement the nop.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
> Changed since v1:
> fallthrough all of trap table to nop implementation
> use movw for table address
> leave loader at 0
> Move MVBAR (and blob to non-zero)
> Split nop implementation from MVBAR setup
> set secure boot for board
> implement NS switch in blob
> Changed since RFC:
> Use bootloader callback to load blob.
> Change "firmware" to "board-setup" for consistency.
> Tweak commit message.
>
>  hw/arm/highbank.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 56 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index be04b27..f3578a3 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -32,10 +32,55 @@
>  #define SMP_BOOT_REG            0x40
>  #define MPCORE_PERIPHBASE       0xfff10000
>
> +#define MVBAR_ADDR              0x200
> +
>  #define NIRQ_GIC                160
>
>  /* Board init.  */
>
> +/* MVBAR_ADDR is limited by precision of movw */
> +
> +QEMU_BUILD_BUG_ON(MVBAR_ADDR >= (1 << 16));
> +
> +#define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
> +                        extract32((x), 12,  4) << 16)
> +
> +static void hb_write_board_setup(ARMCPU *cpu,
> +                                 const struct arm_boot_info *info)
> +{
> +    int n;
> +    uint32_t board_setup_blob[] = {
> +        /* MVBAR_ADDR */
> +        0xe320f000, /* nop */
> +        0xe320f000, /* nop */
> +        0xe320f000, /* nop */
> +        0xe320f000, /* nop */
> +        0xe320f000, /* nop */
> +        0xe320f000, /* nop */
> +        0xe320f000, /* nop */
> +        0xe320f000, /* nop */
> +#define ERET_ADDR (MVBAR_ADDR + 8 * sizeof(uint32_t))
> +        0xe58fe008, /* save lr */
> +        0xe8dfc000, /* exception return */
> +        0,
> +        0,
> +        0, /* exception return link will end up here */
> +#define BOARD_SETUP_ADDR (ERET_ADDR + 5 * sizeof(uint32_t))
> +        0xe3000000 + ARMV7_IMM16(MVBAR_ADDR), /* movw r0, MVBAR_ADDR */
> +        0xee0c0f30, /* mcr p15, 0, r0, c12, c0, 1 - set mvbar */
> +        0xee110f11, /* mrc p15, 0, r0, c1 , c1, 0 - get scr */
> +        0xe3810001, /* orr r0, #1 - set NS */
> +        0xee010f11, /* mcr p15, 0, r0, c1 , c1, 0 - set scr */
> +        0xe1600070, /* smc - go to monitor mode to flush NS change */
> +        0xe12fff1e, /* bx lr - return to caller */
> +    };

This still confuses me. What I was expecting to see was something like:

    /* Monitor mode vector table; entry points which will only be reached
     * if the guest kernel is buggy are tight loops to avoid executing
     * random code by accident. The SMC vector entrypoint just returns,
     * making all SMC calls operate as NOPs.
     */
    0xwhatever, /* notused1: b notused1 */
    0xwhatever, /* notused2: b notused2 */
    0xwhatever, /* smc: movs pc, lr */
    0xwhatever, /* prefetch_abort: b prefetch_abort */
    0xwhatever, /* data_abort: b data_abort */
    0xwhatever, /* notused3: b notused3 */
    0xwhatever, /* irq: b irq */
    0xwhatever, /* fiq: b fiq */
    /* Entry point for reset (set via board_setup_addr) */
    [code here to set mvbar, etc]

Note that MOVS PC, LR is much simpler for exception return than RFE,
because you don't need to mess about saving the LR and SPSR to
memory in order to just read them back again. I'd have used ERET,
which has a more explanatory mnemonic, but that only exists in
CPUs with the virtualization extensions.

> +    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
> +        board_setup_blob[n] = tswap32(board_setup_blob[n]);
> +    }
> +    rom_add_blob_fixed("board-setup", board_setup_blob,
> +                       sizeof(board_setup_blob), MVBAR_ADDR);
> +}
> +
>  static void hb_write_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
>  {
>      int n;
> @@ -248,16 +293,13 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
>          cpuobj = object_new(object_class_get_name(oc));
>          cpu = ARM_CPU(cpuobj);
>
> -        /* By default A9 and A15 CPUs have EL3 enabled.  This board does not
> -         * currently support EL3 so the CPU EL3 property is disabled before
> -         * realization.
> -         */
> -        if (object_property_find(cpuobj, "has_el3", NULL)) {
> -            object_property_set_bool(cpuobj, false, "has_el3", &err);
> -            if (err) {
> -                error_report_err(err);
> -                exit(1);
> -            }
> +        object_property_set_int(cpuobj, QEMU_PSCI_CONDUIT_SMC,
> +                                "psci-conduit", &error_abort);
> +
> +        if (n) {
> +            /* Secondary CPUs start in PSCI powered-down state */
> +            object_property_set_bool(cpuobj, true,
> +                                     "start-powered-off", &error_abort);
>          }
>
>          if (object_property_find(cpuobj, "reset-cbar", NULL)) {
> @@ -378,6 +420,10 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
>      highbank_binfo.loader_start = 0;
>      highbank_binfo.write_secondary_boot = hb_write_secondary;
>      highbank_binfo.secondary_cpu_reset_hook = hb_reset_secondary;
> +    highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
> +    highbank_binfo.write_board_setup = hb_write_board_setup;
> +    highbank_binfo.secure_board_setup = true;
> +
>      arm_load_kernel(ARM_CPU(first_cpu), &highbank_binfo);

If the user hands us "-cpu something-without-el3" I think we'll
now go blithely ahead with the secure_board_setup with hilarious
consquences, where previously we'd probably at least manage to
try to boot the kernel. (You can argue that the user shouldn't
be handing us silly arguments if you like.)

thanks
-- PMM
