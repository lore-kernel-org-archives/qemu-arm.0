Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1287870ocs;
        Thu, 29 Sep 2022 13:57:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5btG8nwz4tLt4YUFKweGvwN77+7B1IlPAGqSJXAeGP+5GosWM5nirO7GXkW6O+IRW0Gj5m
X-Received: by 2002:a0c:e354:0:b0:4af:94f1:524c with SMTP id a20-20020a0ce354000000b004af94f1524cmr4150545qvm.71.1664485070249;
        Thu, 29 Sep 2022 13:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664485070; cv=none;
        d=google.com; s=arc-20160816;
        b=lCqAXhQOY3spyHzxMT/1y5HpAXTNWwhOUG+TytAZHk0Z00x0QZEyU50MeetPwtUdVX
         YXME+BDpMd7OSANORYWOxUeAkU/BvSLly/w+Hif3CvxSJpi1ty4uGKAQoxXi3/7LapK2
         co6ej1RanQhMdS4jjx6zczOE0HhMtEBLryOMxq8y0lys/kWlsBpayOiGO7CQP0JAwJL1
         k4AOuRYDkRjNEs0jis7Tz03irDAW0KSPDURBxCWRr19yGFyll7l/Q2cG6kL6KJ4fPwUX
         nJcapjBPYqC1lMmW8+Y4CTyKw5RIymvcTEcwP8uzkVgIsDbWsU1CjgXKPWpxdWdNCANK
         lI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :date:dkim-signature;
        bh=3nuy2M7kTTu1J6pk2mDaPDD4tI7TpqU1voN2QcbJJXs=;
        b=lQwNe/m+Fbkq4H5RsZ8G1L+2Rt73C3Q6wt7A0Y2l+QqdD/W//UNp06nlXJvwJkPrPr
         PrlXPFrxWLv6bcvM/vaWNjk92gIBi6e2JxDIL63stgkj31UIo7lV4eKrn+mA9oVGsL/X
         /qTWrIRRihbVrWBoa5CE2JYHwE7AFj9tzkehWWvrH93MfF6FD2OYZ0YPEUu9DQqLyS45
         e2A/CdB0Wyv59YKqsWddlKnA1YRKLeltLUS9UMeLp49Ib5LRU1OYHcZv9iGFEjCfJEZC
         wJoO3Ones7jYH3/aLVMSFqiFXJXuO6iT2m1XCIcq6BxQy9Nx6MUH9NXkWI/tSqCxaV8d
         M6TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@zx2c4.com header.s=20210105 header.b=TF1MRtd+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv13-20020a056214240d00b00496e945f3b0si136003qvb.305.2022.09.29.13.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 13:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@zx2c4.com header.s=20210105 header.b=TF1MRtd+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:37926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oe0bN-00080a-Rj
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 16:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org>)
 id 1oe0b5-00080N-LZ; Thu, 29 Sep 2022 16:57:31 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:44476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org>)
 id 1oe0b3-0005Aa-LJ; Thu, 29 Sep 2022 16:57:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE6DE614DB;
 Thu, 29 Sep 2022 20:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EFEC433C1;
 Thu, 29 Sep 2022 20:57:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=zx2c4.com header.i=@zx2c4.com header.b="TF1MRtd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664485045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QZq0c/MN1dTHZqJYvQQeKzJCy+jRUMqF9RLa0Ov6gus=;
 b=TF1MRtd+RFfo5ntOjuLA9GgKoIIx6iWKrcuKcWaUpxaIbsw3ErzLpCIPIelgVH+tebscrY
 Dq0bOj/LRvubY10DD+2FAqVBDtWbfBGICvbAtexxmsV5ILJ2qgWorHhkdDSam5iK43k+18
 ipKxyTUvZ/mksc2yoy/DLUjSRtP6Tu0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 974f9b60
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 29 Sep 2022 20:57:24 +0000 (UTC)
Date: Thu, 29 Sep 2022 22:57:22 +0200
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] arm: re-randomize rng-seed on reboot
Message-ID: <YzYGsjlGBwh4Hi78@zx2c4.com>
References: <20220927160742.1773167-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220927160742.1773167-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  "Jason A. Donenfeld" <Jason@zx2c4.com>
From:  "Jason A. Donenfeld" via <qemu-arm@nongnu.org>
X-TUID: 6YuYs4NidKZn

Hi Peter,

On Tue, Sep 27, 2022 at 06:07:42PM +0200, Jason A. Donenfeld wrote:
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Since the FDT is in
> the ROM region at this point, we add a hook right after the ROM has been
> added, so that we have a pointer to that copy of the FDT. When the
> reboot happens, we then look for RNG seeds and replace their contents
> with new random data.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Just FYI, I'm waiting for your feedback on this approach, first, before
I add a similar thing for other architectures (at which point perhaps
rerandomize_fdt_seeds will be moved into device_tree.c or something).

Jason

> ---
>  hw/arm/boot.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ada2717f76..2836db4abb 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -25,6 +25,7 @@
>  #include "qemu/config-file.h"
>  #include "qemu/option.h"
>  #include "qemu/units.h"
> +#include "qemu/guest-random.h"
>  
>  /* Kernel boot protocol is specified in the kernel docs
>   * Documentation/arm/Booting and Documentation/arm64/booting.txt
> @@ -529,6 +530,26 @@ static void fdt_add_psci_node(void *fdt)
>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
>  }
>  
> +static void rerandomize_fdt_seeds(void *fdt)
> +{
> +    int noffset, poffset, len;
> +    const char *name;
> +    uint8_t *data;
> +
> +    for (noffset = fdt_next_node(fdt, 0, NULL);
> +         noffset >= 0;
> +         noffset = fdt_next_node(fdt, noffset, NULL)) {
> +        for (poffset = fdt_first_property_offset(fdt, noffset);
> +             poffset >= 0;
> +             poffset = fdt_next_property_offset(fdt, poffset)) {
> +            data = (uint8_t *)fdt_getprop_by_offset(fdt, poffset, &name, &len);
> +            if (!data || strcmp(name, "rng-seed"))
> +                continue;
> +            qemu_guest_getrandom_nofail(data, len);
> +        }
> +    }
> +}
> +
>  int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>                   hwaddr addr_limit, AddressSpace *as, MachineState *ms)
>  {
> @@ -683,6 +704,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>       * the DTB is copied again upon reset, even if addr points into RAM.
>       */
>      rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
> +    qemu_register_reset(rerandomize_fdt_seeds, rom_ptr_for_as(as, addr, size));
>  
>      g_free(fdt);
>  
> -- 
> 2.37.3
> 
> 
