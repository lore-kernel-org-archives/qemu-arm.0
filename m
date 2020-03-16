Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp332542lfe;
        Mon, 16 Mar 2020 10:22:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvMy5otnIlBxsdDcNEf9lGvIjWYfMchzBaRYxaPZie5mC2Nyoz0RqmUMFUdsKoeB4r8KbaK
X-Received: by 2002:ad4:41c4:: with SMTP id a4mr803433qvq.133.1584379336466;
        Mon, 16 Mar 2020 10:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584379336; cv=none;
        d=google.com; s=arc-20160816;
        b=eyTIrlwvgDoysFW4at8r/lVuiZwI1yCImQSLza7hHnMhMZ20wrNMBqNAki79A7jgsl
         N6VvI5w3D/kxyN260Uv9mqj6TG0dji/1ijAwdf07842VYRKlG+NvIEK+5ZowCA1eLqcD
         1oMLoOCB4E6g1PHVnCYM7oSGkpXzUjag65MSmdql0fij05i8OYb0jV6ZFMBEcLbcN9mx
         pxjTL7BN2lPHxh79607n6jh9I8PrMaIIgT675L4HSsyIUyAmyDKxGLgLCgD0ui5GrNvk
         zbSR5OffhsDqi3nl409OPcc8LSKwd4TeXFZPh/kY85qmjOcSpDYn9tdtw3CV6GwCvXq5
         pehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QY+2OTb9MtqR8dUS65wKid5CTkKHyVlGBNUsDgaEhho=;
        b=gNkTD1tWzQrtyQWiZeMF7t2bGm4NYovVA0pJdCzrq3+WglOTNmAC3PI+/gVoNkDuke
         PtPxZFoxXb6wgCggtvWKUdUUxh5zGFCA960/itH3BCQC+UTUonmoiLshak1wgoBmMF93
         vg33kaxT9ftXcI0hnt+PIYjJFmL+P80vbyUQG8Z9CoT5d8VLLNlNOUEPEDEkdqYOtbEj
         ztvb6QYW61dQ/nxwvkbLKybNR0YK/UMieTY8+l776ZguUO730uYbKM7OSTi2E527KElx
         hNITiEW1JnHuq9KMkASBhFEF82+Ujmu4LN7Dlpyv1hkTXdnXuXPwmABPWTC7F6Z319WL
         9xuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mQyc7ztP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si157165qtb.179.2020.03.16.10.22.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 10:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mQyc7ztP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDtRN-0000JF-2W
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 13:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrq8-0002ji-9F
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 11:39:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrq7-00032x-6C
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 11:39:40 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38561)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jDrq7-00031q-0l
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 11:39:39 -0400
Received: by mail-ot1-x342.google.com with SMTP id t28so15639414ott.5
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2020 08:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QY+2OTb9MtqR8dUS65wKid5CTkKHyVlGBNUsDgaEhho=;
 b=mQyc7ztP/hyXeViBYmkn0Bq8YywvRqacuV7dFmrekRLjD1YoWVHelUsamUdNOwbWJu
 libKIWV9wJFflpOcVxEGjuY0GgLlvWKjS+Hbohvq9veacQ3gFa2TkzGKklbDmADThxpL
 GB1g+Ug0YI0n/WdfixNVcnmPwBQYHLkw6n1B44y5l1xF78YbgDEu+gU+hJyZXa0DiNTL
 aA+2Mnl7x9p6ElyK0kNtPbyOIbtUX0wBgj6umXxSfkdZzo5zuBdvd9WgPY9hNJmdlAnz
 8Zhn4KHdG5NZ+bycf4IbBoeF+qCSL5XovMZ+MG6vwhSpofV7lPnewdTMLLtISK5iMm1/
 UbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QY+2OTb9MtqR8dUS65wKid5CTkKHyVlGBNUsDgaEhho=;
 b=PXYTTnLjvSHFwQxkDMnmI8yBAsPvncoccgx3Yfe99Xs4Q/vBKb8BL6AS9j5v78pG2q
 mLQKrzTe7UHfU/hEcaZPVd/+q9iHlrQU9Ok3Nm7ByllmiNtVpQuEUXykRHcHsYQhdsH6
 b0+qk+q7YeMApTUibYgKmqAV2nDmI0yh8kWfA/E8kKYyKKGgp4e4cudGU1aJUxrWG7Ca
 LNcK9qIm1x/jz1UyeT+2pVsjCxo3DK8ZM6K0jolqFBhDCp+qc/Vih5hqn5HGz4OYvF18
 IikD0+VpmqFtZQn9xXJBDkCmY3KD236X4NJqnmDZA82nw4L7UBy0bwyDnDyEYHFHLaD5
 Q6yg==
X-Gm-Message-State: ANhLgQ2D37OH+VxLku1UMZHCTuYL4dpnr3oUcFOK7OtKV22VeYQV1iCu
 PY4VSH0/FhKqiyelJTpQXEkfaY5VF3Qo3EfNOLymcQ==
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr14088916otm.91.1584373178312; 
 Mon, 16 Mar 2020 08:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200313161506.8834-1-linux@roeck-us.net>
In-Reply-To: <20200313161506.8834-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 15:39:27 +0000
Message-ID: <CAFEAcA-63OJfcnjE0V4W5a0R2tq_t0oRL7dre_WY_We0Jz9KoA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/fsl-imx7: Instantiate apbh_dma and ocotp as
 unimplemented devices
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PUyKVA9P77f2

On Fri, 13 Mar 2020 at 16:15, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Instantiating apbh_dma and ocotp as unimplemented devices prevents crashes
> when booting Linux.
>
> apbh_dma:
>
> [   14.046518] Unhandled fault: external abort on non-linefetch (0x808) at 0xd0852008
> [   14.047287] pgd = (ptrval)
> [   14.047607] [d0852008] *pgd=8b028811, *pte=33000653, *ppte=33000453
> [   14.050074] Internal error: : 808 [#1] SMP ARM
> ...
> [   14.077029] [<c0856530>] (stmp_clear_poll_bit) from [<c0856580>] (stmp_reset_block+0x10/0xb8)
> [   14.077642] [<c0856580>] (stmp_reset_block) from [<c1a9655c>] (mxs_dma_probe+0x1f4/0x370)
> [   14.078158] [<c1a9655c>] (mxs_dma_probe) from [<c0b6a7e8>] (platform_drv_probe+0x48/0x98)
> [   14.078641] [<c0b6a7e8>] (platform_drv_probe) from [<c0b685c4>] (really_probe+0x228/0x2d0)
>
> ocotp:
>
> [   71.286109] Unhandled fault: external abort on non-linefetch (0x008) at 0xd0ff0000
> [   71.287891] pgd = (ptrval)
> [   71.288449] [d0ff0000] *pgd=8b497811, *pte=30350653, *ppte=30350453
> [   71.291389] Internal error: : 8 [#1] SMP ARM
> [   71.292302] Modules linked in:
> [   71.293583] CPU: 0 PID: 112 Comm: kworker/0:3 Not tainted 5.0.0-10153-g065b6c4c913d-dirty #2
> [   71.294148] Hardware name: Freescale i.MX7 Dual (Device Tree)
> [   71.296728] Workqueue: events deferred_probe_work_func
> [   71.297740] PC is at imx_ocotp_read+0x68/0x180
> [   71.298154] LR is at mark_held_locks+0x48/0x74
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/fsl-imx7.c         | 11 +++++++++++
>  include/hw/arm/fsl-imx7.h |  6 ++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> index 119b281a50..a17136f83c 100644
> --- a/hw/arm/fsl-imx7.c
> +++ b/hw/arm/fsl-imx7.c
> @@ -459,6 +459,17 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
>       */
>      create_unimplemented_device("sdma", FSL_IMX7_SDMA_ADDR, FSL_IMX7_SDMA_SIZE);
>
> +    /*
> +     * OCOTP
> +     */
> +    create_unimplemented_device("octop", FSL_IMX7_OCOTP_ADDR,
> +                                FSL_IMX7_OCOTP_SIZE);

"octop" or "ocotp" ?


thanks
-- PMM
