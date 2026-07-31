Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC14C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 11:15:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wplDJ-0000Kh-0a; Fri, 31 Jul 2026 07:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wplDH-0000KL-I7
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 07:15:39 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wplDE-0001BE-Ax
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 07:15:38 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-6688acd1a51so1081795d50.3
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 04:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785496534; cv=none;
 d=google.com; s=arc-20260327;
 b=dB7AF+K6z5rIiChbXz2uJUCzyZlh6XoBGktpo6dPAVMZQ5dmqS3HeeMezjcOFQn94I
 xLfW1vGj8EGqi4CFnHx45qB8UwWqrimtuqgKESSMXEbPleyniBFv5mDebjENWQptjjfw
 qxff+6T6+92dtI/9H/TeTDqzs5T2P/qxNjCsvEoiwWAWG6xMXG68DBJQBZaX27q320az
 f7BqtZZzo5ugILqM7ael02UGulWlFOJKHuD2uwsuS0uI5d1fNWuwkxJ9cdSdMeuP1j50
 hFOL7c2he1qWtLakWOHkdMHnz/rPLa4JV4gCWDA1Iozi2jlnb0MyDqAWjaQcQQ7bBROh
 kUWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zXFbAPEIomg84gCkIGAVnHi0vMeB7bxnsVA6omErrGs=;
 fh=3WlC7I9BgZrpsE4Lppeuuamn2It8uGjFy/b8/sg7jy4=;
 b=P0K0tzd0t14RSRaFDfJchvYQ4d56fj/kC3+P3NjkI4/ur5ujVlSzU2bfU3EO6beRGv
 t/Z+moAZLk+/wzvCQ0At23xWm+4ElDgLI6xcI1x8q8DlLmIYnDwK4Xl48FnBzdRXbRSW
 q4z/r96HLKuYL7Dc44kDYlSkpt6TW3a8S0q0W1NK55WTaxofdVlunk7gs4H7IBPsz/KI
 wH7RkqXxCTIWfyydfctg6wZjSw60z7eT14I+ImtfsbPcyH78Jk7EiOesolXSnt/axcoR
 IMgMzJ0Khp4Tp4JvO0YvMsgID5K7USv1khue5QYkOIV1IDVxdPbBtxfzp1ZXgTJsUQCW
 /OlQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785496534; x=1786101334; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zXFbAPEIomg84gCkIGAVnHi0vMeB7bxnsVA6omErrGs=;
 b=iiCQRv5KNBa7lhjccHB2X5Bi4/TOsgTyrdr7L0lD2QpzCqIHSquauQJl1rB7c8QPpB
 PqbGR6TMDNJwgXmmowNpz0V5V5dzEoM3dxrId/ZB/6ci2+SmKne0cpD1OvMaReznt73G
 y67u/L1VnfAlHaq8kcB9NrhxvqDOvknnNu9W8y2zqCsrIJBgT2EQDmF2LHaAmH3iK+b7
 BIsK34x84M6Kz3Y3L9NI8193oLimNcH0MOkZtnIAqQwkwlIT1FbEmrA2JLvZReT4kilp
 3+w8hR/r/9IryJAkywGBtMEv/DirTWujJ8m2q3cFlgKERs4Miof1bg4XsABTsLuEymJ1
 tYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785496534; x=1786101334;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zXFbAPEIomg84gCkIGAVnHi0vMeB7bxnsVA6omErrGs=;
 b=b2CxDYPNEEKRy6YRIeyO7k9VZzFG5KP7acPoe4RlduO6udRrdS5oWY5rvWoYi1Hr2o
 sJ/4GNdiZWHH2JWuAB//NopHJDdscD7Ox5Ql5/hvP1WJTY3D9YqVFIiUJhseJwVPK7Pm
 /w1ATagJXZLxie7tKlUphDdLeuRanuimzB2UF+/kuZTDBbP7u3qOv0H/ELVZIkakuZP9
 EmdQ269x2IFM5HCFQI4+4gTrNMw0ohgCiR2uJpO5XRT3dbMQcSAQP549aPXlslFYq1eW
 ybUsvgB7pQeIk8QPPFVuuD5VGnUys+ljs32ZBEeFuNRyQ2FmBdPMcdI+uBt3sdvGODd6
 8qGQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpPOOUcuYVVlMAVYDHEv+Tk26LZGcLBdfWgi1rTwjrhaoFxhvyxqmLEh399xC7SrajNAbGW1G64xQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz/1NTrtBMdupPA+zQ4DNsCsL+UKuAN0kpQN8vwA6CzY2tc5e8D
 pRLiCk8JvWhTWKbvWkSvJT/lMeD22Kx/5YJLvfw4tSUGKfgvwgpR1BVCK06wR1GOAFyKZ3uTN5h
 jL3mkRi4u+yb//6A7qwc/3K9WrW8gV1MAJLpsdcskiA==
X-Gm-Gg: AR+sD102bMHvLijAFoK2vlh3IYamP687j2mw1PMP9xwwz36Ir3hNy2+ZEG2x3C+XNNF
 0R0Dw78yiIohg++pn0jDLXoOu3GXRBZL7fC/F8zHwzNj8SlduPmrcSZGU8viA5q4DT9Rw2pZem/
 QXc0Z539LiT9xTN6WSuzUcMMxrcVQWfTiGh7vnjRq225oz8zkqtFEOM1KW0LZl1yNn+4j/lhXIL
 vhMoaXQr6E7jd8mak3JzY4kVzTRgkZ9ke+Cy7Ay0QCtipcO61IQrhKLn8JltclP+IQJmRivJuiN
 00z4XtivMYkoRGMAMB09urVi1H2wgdYTePZYOoPIB10ii5jcaaOCHkmOs5ODS83ZkUooQetkcMo
 ciDAR+dUVzBKaPmwX8IyEd5pZyUhD
X-Received: by 2002:a05:690e:138b:b0:667:9e0d:24ab with SMTP id
 956f58d0204a3-6694a0b9d33mr566664d50.36.1785496519225; Fri, 31 Jul 2026
 04:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260723233605.805-1-simonxhy0404@gmail.com>
 <20260723233605.805-3-simonxhy0404@gmail.com>
In-Reply-To: <20260723233605.805-3-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 12:15:07 +0100
X-Gm-Features: AUfX_mxtEf66yTQsa41Lhs9ODf9hm7uQRQvDXKcUg1GlFPxZsGj6dYqP6aLAY5o
Message-ID: <CAFEAcA-1PZ5=tKEk-A65WQUKjGP0P3PvFKFCxFbiEQEq+ohvxQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/arm/armsse: add Arm Corstone SSE-310
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 24 Jul 2026 at 00:36, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add Arm Corstone SSE-310 model.
> - Include new NPU power policy unit and configuration interface in device
> list as unimplemented devices.
> - sys_version and iidr values from the "SSE-310 with M85 and U55 FPGA"
> documentation for the mps3-an555.
> - Refractor comments and code pertaining to both the SSE-300 and SSE-310.
> - Add support for SSE-310 in the iotkit files.
> - Add SSE-310 PIDR and CIDR registers according to the SSE-310 TRM.
>
> Arm Corstone SSE-310 TRM:
> https://developer.arm.com/documentation/102778/0000/
>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---
>  hw/arm/armsse.c                 | 208 +++++++++++++++++++++++++++++++-
>  hw/misc/iotkit-secctl.c         |  18 +++
>  hw/misc/iotkit-sysctl.c         |  60 +++++++--
>  hw/misc/iotkit-sysinfo.c        |  12 +-
>  include/hw/arm/armsse-version.h |   2 +
>  include/hw/arm/armsse.h         |   1 +
>  6 files changed, 287 insertions(+), 14 deletions(-)

I would prefer if we split this patch up into smaller pieces.
Adding the secctl handling, the sysctl handling, sysinfo, and
the main armsse support itself are all pieces that are easier to
review separately. If you'd split this patch up I would have
been able to mark some of the subpatches as reviewed already.

> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index ddb210c895..1847c73322 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -26,7 +26,7 @@
>  #include "hw/core/qdev-clock.h"
>
>  /*
> - * The SSE-300 puts some devices in different places to the
> + * The SSE-300 and SSE-310 put some devices in different places to the
>   * SSE-200 (and original IoTKit). We use an array of these structs
>   * to define how each variant lays out these devices. (Parts of the
>   * SoC that are the same for all variants aren't handled via these
> @@ -118,6 +118,18 @@ static const Property sse300_properties[] = {
>      DEFINE_PROP_UINT32("CPU0_MPU_S", ARMSSE, cpu_mpu_s[0], 8),
>  };
>
> +static const Property sse310_properties[] = {
> +    DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
> +    DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 21),
> +    DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
> +    DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
> +    DEFINE_PROP_BOOL("CPU0_DSP", ARMSSE, cpu_dsp[0], true),
> +    DEFINE_PROP_UINT32("CPU0_MPU_NS", ARMSSE, cpu_mpu_ns[0], 8),
> +    DEFINE_PROP_UINT32("CPU0_MPU_S", ARMSSE, cpu_mpu_s[0], 8),
> +};
> +
>  static const ARMSSEDeviceInfo iotkit_devices[] = {
>      {
>          .name = "timer0",
> @@ -480,6 +492,146 @@ static const ARMSSEDeviceInfo sse300_devices[] = {
>      }
>  };
>
> +static const ARMSSEDeviceInfo sse310_devices[] = {
> +    {

This is a very long block of data about the SSE310 devices
which is almost but not quite identical to the existing one
for SSE300. It would be easier to review if your commit message
stated which devices are new in the SSE310 memory map and
which have moved compared to the SSE300.

> +        .name = "timer0",
> +        .type = TYPE_SSE_TIMER,
> +        .index = 0,
> +        .addr = 0x48000000,
> +        .ppc = 0,
> +        .ppc_port = 0,
> +        .irq = 3,
> +    },

> +    {
> +        .name = "s32ktimer",
> +        .type = TYPE_CMSDK_APB_TIMER,
> +        .index = 0,
> +        .addr = 0x4802f000,
> +        .ppc = 1,
> +        .ppc_port = 0,
> +        .irq = 2,
> +        .slowclk = true,
> +    },
> +    {
> +        .name = "s32kwatchdog",
> +        .type = TYPE_CMSDK_APB_WATCHDOG,
> +        .index = 0,
> +        .addr = 0x5802e000,

This is different to what we set for SSE-300, and it looks
like that's a bug in the SSE-300 implementation. This is
the "SLOWCLK Watchdog", and both the SSE-300 and SSE-310
docs list it as being only in the Secure access region
(0x58....), and not in the NS region (0x48...). We should
fix the SSE-300 bug.

> +        .ppc = NO_PPC,
> +        .irq = NMI_0,
> +        .slowclk = true,
> +    },

> diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
> index dff89c677f..e6b1fe5d32 100644
> --- a/hw/misc/iotkit-sysctl.c
> +++ b/hw/misc/iotkit-sysctl.c

> @@ -193,6 +204,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
>              break;
>          case ARMSSE_SSE300:
>              /* In SSE300 this is reserved (for INITSVTOR2) */
> +        case ARMSSE_SSE310:

For this and the others similar, you should put the two "case" lines
together, and update the comment.

>              goto bad_offset;
>          default:
>              g_assert_not_reached();

As well as all the registers that are the same as SSE300, the
SSE310 has one extra register in the sysctl block: PPUINTSTAT, at
offset 0x128. We don't implement the PPUs in QEMU, but we should at
least implement this register as RAZ with a LOG_UNIMP log if the guest
tries to read it.

> diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
> index 19f089e6ee..21e161bdc2 100644
> --- a/hw/misc/iotkit-sysinfo.c
> +++ b/hw/misc/iotkit-sysinfo.c
> @@ -58,6 +58,12 @@ static const int sysinfo_sse300_id[] = {
>      0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
>  };
>
> +static const int sysinfo_sse310_id[] = {
> +    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
> +    0x58, 0xb8, 0x2b, 0x00, /* PID0..PID3 */
> +    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
> +};
> +
>  static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
>                                      unsigned size)
>  {
> @@ -68,13 +74,13 @@ static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
>      case A_SYS_VERSION:
>          r = s->sys_version;
>          break;
> -
>      case A_SYS_CONFIG:
>          r = s->sys_config;
>          break;
>      case A_SYS_CONFIG1:
>          switch (s->sse_version) {
>          case ARMSSE_SSE300:
> +        case ARMSSE_SSE310:
>              return 0;
>              break;
>          default:
> @@ -84,6 +90,7 @@ static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
>      case A_IIDR:
>          switch (s->sse_version) {
>          case ARMSSE_SSE300:
> +        case ARMSSE_SSE310:
>              return s->iidr;
>              break;
>          default:
> @@ -95,6 +102,9 @@ static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
>          case ARMSSE_SSE300:
>              r = sysinfo_sse300_id[(offset - A_PID4) / 4];
>              break;
> +        case ARMSSE_SSE310:
> +            r = sysinfo_sse310_id[(offset - A_PID4) / 4];
> +            break;
>          default:
>              r = sysinfo_id[(offset - A_PID4) / 4];
>              break;

As well as these changes to sysinfo, which are all fine, the SSE310
has an extra SYS_CONFIG2 register which the SSE300 does not. We
can hardwire it to "return 0" like we do for SYS_CONFIG1,
because the only interesting field in it is "is there an NPU
present", which for us is always "no".

> diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
> index bdf2d4db8e..d0dcba1fbb 100644
> --- a/include/hw/arm/armsse.h
> +++ b/include/hw/arm/armsse.h
> @@ -127,6 +127,7 @@ OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
>  #define TYPE_IOTKIT "iotkit"
>  #define TYPE_SSE200 "sse-200"
>  #define TYPE_SSE300 "sse-300"
> +#define TYPE_SSE310 "sse-310"

There's a comment at the top of this file starting "Currently we model:"
which documents what we implement. We should add SSE-310 to that.
(I forgot to do this for SSE-300, unfortunately.)

thanks
-- PMM

