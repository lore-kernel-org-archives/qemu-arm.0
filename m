Received: by 10.25.44.15 with SMTP id s15csp3529193lfs;
        Mon, 10 Jul 2017 08:11:50 -0700 (PDT)
X-Received: by 10.28.20.67 with SMTP id 64mr913622wmu.60.1499699510618;
        Mon, 10 Jul 2017 08:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499699510; cv=none;
        d=google.com; s=arc-20160816;
        b=MC+H2dARIUfMB4VXTbRg3p5KoOIqfs/m5Uq3tyfZTRGtTAMJ69XRFiyPrhu5Cexhro
         b3kTHVA+W2+S6aK/RPov91fxtXEVOCTiWZz0WCkVPexkLHlB0aDnapqy8UICj6/WFHqP
         y65wkhqz5UFnFKEDVXlTmJruv5DjmlR5D58PDYzpCWikkYBo8DbbvlzwROsw+yfVPqVJ
         lfT5oj8PV1oxDrOrGKfQbUfzjOnqsDKxW71NXiMU4bvLn1fGjfss0LmifeOdVIyoJMNi
         6Alywn/+VkC3NH/EHxR/hWVgTlcHeJpMwM/A0EwQDI0SzkkB+F4cyDLGikIf6gd1fnv4
         KoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Q4esUgPqfu1J8ijvRJyWXPf1tao5GyJTjcGeC/EERa8=;
        b=o1X0qqYu50l+JwFq32otY+qSr+2r7PDzlsEWX4N638hnej8iq1ym5i7rcE+cXIOd2U
         IYOU2KyRV73Yz0QQesNibkOWGmjPzXEKsKcNOrkxVhGXl5/pinACowb79pp4LxscFj0m
         f70St7UpXDXBVeengUyWq/JUqTfgz7JErP3NRG1MMRLloyaF+2CdbCU6v9lAbB7bdQyb
         IehqmFOtLbT3O3GZKsIv9eBqdPNyoPdjZLAb6oCF2I8RanG5H/jTRINLjTE+zIYkutx7
         XbQJVW9nIuARTh/MM+K7OdwWqtQUyNHFZD2p2oe5g2inikqVLnjcollMEoInkRvpxRsM
         +iqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=ahx3uHK1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::234 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x234.google.com (mail-wr0-x234.google.com. [2a00:1450:400c:c0c::234])
        by mx.google.com with ESMTPS id k44si8163345wrc.19.2017.07.10.08.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 08:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::234 as permitted sender) client-ip=2a00:1450:400c:c0c::234;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=ahx3uHK1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::234 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x234.google.com with SMTP id c11so142768288wrc.3
        for <alex.bennee@linaro.org>; Mon, 10 Jul 2017 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Q4esUgPqfu1J8ijvRJyWXPf1tao5GyJTjcGeC/EERa8=;
        b=ahx3uHK12u28a/NtBYKVGc7bdZgIYAfdiRCeuafFv0vV/liZBufvBuY7U0pJIjtR+I
         2dNow4cclFN+hF+TG0kuTr2qA2PhR/I23WxsB1ZAVzo86GlicA8OjEHwDN4PVTYZqsKD
         GwdvNmtMZ7OV5n6qSIfTmEq+0ejoX4qF4TSiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Q4esUgPqfu1J8ijvRJyWXPf1tao5GyJTjcGeC/EERa8=;
        b=a28fCcEg39zJHrkNy4aFiahqjmAsCWmy73EJ6g/GjkZwtwAY3hRfXpc45SfjBJu1cq
         xhbrt2iY4Wyqxfdyn06cSk1qo64jjTstfxlgtOixCZgn3K0Eb4FqoD046q57tGffbGrv
         2VzAqLT3iXxYbCN457qOR4cr/gKlWQTz8H+04Qd8mO1vWhSI/82VF3liFwRc/hsC2GJY
         9rBXvgAT09YhBJ+vtep4vN/lpIhk+sTvGwX5iK1vjTm3+3DXTtu25PKxCNRHzwjkSWE3
         y5eSNUE8nRDCQtRazpb5eZJvcMRWowJBfxVDtmqNTT1Y+ZE7DJDdQg33D/Zscbz4A4Rx
         UzZQ==
X-Gm-Message-State: AIVw113OkxVPgpPUm8rgFfwlO9/UCzZMCJ1WNthMvif6PTz3HGZx0MIu
	1sf88pXv00FMXKTOajuOYaJsHaYBreO8JUs=
X-Received: by 10.223.172.67 with SMTP id v61mr8295639wrc.112.1499699510303;
 Mon, 10 Jul 2017 08:11:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Mon, 10 Jul 2017 08:11:29 -0700 (PDT)
In-Reply-To: <1498830302-19274-3-git-send-email-edgar.iglesias@gmail.com>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com> <1498830302-19274-3-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jul 2017 16:11:29 +0100
Message-ID: <CAFEAcA-dssYnbZjuWTjBta1aK3iL3pyRKh5Qs4hFh=bPONgnTA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target-arm: Extend PAR format determination
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 9Ey5ajdxpNgW

On 30 June 2017 at 14:45, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Extend PAR format determination to handle more cases.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target/arm/helper.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index fd1027e..6a1fffe 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2345,12 +2345,40 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>      uint32_t fsr;
>      bool ret;
>      uint64_t par64;
> +    bool format64 = false;
>      MemTxAttrs attrs = {};
>      ARMMMUFaultInfo fi = {};
>
>      ret = get_phys_addr(env, value, access_type, mmu_idx,
>                          &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
> -    if (extended_addresses_enabled(env)) {
> +
> +    if (is_a64(env)) {
> +        format64 = true;
> +    } else if (arm_feature(env, ARM_FEATURE_LPAE)) {
> +        /*
> +         * ATS1Cxx:
> +         * * TTBCR.EAE determines whether the result is returned using the
> +         *   32-bit or the 64-bit PAR format
> +         * * Instructions executed in Hyp mode always use the 64bit format
> +         *
> +         * ATS1S2NSOxx uses the 64bit format if any of the following is true:
> +         * * The Non-secure TTBCR.EAE bit is set to 1
> +         * * The implementation includes EL2, and the value of HCR.VM is 1
> +         *
> +         * ATS1Hx always uses the 64bit format (not supported yet).
> +         */
> +        format64 = regime_using_lpae_format(env, mmu_idx);
> +
> +        if (arm_feature(env, ARM_FEATURE_EL2)) {
> +            if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
> +                format64 |= env->cp15.hcr_el2 & HCR_VM;
> +            } else {
> +                format64 |= arm_current_el(env) == 2;
> +            }
> +        }
> +    }

So this kind of worries me, because what it's coded as is "determine
whether architecturally we should be returning a 64-bit or 32-bit
PAR format", but what the code below it uses the format64 flag for is
"manipulate whatever PAR we got handed back by get_phys_addr()".
So we have two separate bits of code that are both choosing
32 vs 64 bit PAR (the code in this patch, and the logic inside
get_phys_addr()), and they have to come to the same conclusion
or we'll silently mangle the PAR. It seems like it would be
better to either have get_phys_addr() explicitly tell us what kind
of format it is returning to us, or to have the caller tell it
what kind of PAR it needs.

PS: on the subject of virtualization, I notice there's a comment
a bit later on in do_ats_write() that says
    /* Note that S2WLK and FSTAGE are always zero, because we don't
     * implement virtualization and therefore there can't be a stage 2
     * fault.
     */
so we'll need to address that too at some point...

thanks
-- PMM
