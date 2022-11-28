Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp8857701ejx;
        Mon, 28 Nov 2022 11:01:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7X96RHfzCoz8/fdD43CLcrTsOT+saj+DfTcdYkb8Q8Wu4i7m4WEpY1Wa1LnKH+MBOynUdN
X-Received: by 2002:a02:cba6:0:b0:375:a360:a130 with SMTP id v6-20020a02cba6000000b00375a360a130mr24950293jap.307.1669662105475;
        Mon, 28 Nov 2022 11:01:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669662105; cv=none;
        d=google.com; s=arc-20160816;
        b=kJPP54siWHAFsjgTCfoywk12SiZKFKDafc4Pb21JlRCpcFRZ9bJSg/mrMtrCNFmcwI
         LO0+iusktunrKe49QV2O9cb0WIG1QvYHgfGesesq5FpDCqdnfUDeOwuwjAI+cDVWaB53
         4redYD2Yul80O+oZxl6/eLAb9pP+TyBYaQKC8rR4Do9rAjNF0lCHnadMayfjRMv2FCAL
         d7t+kAiESQhEvON6i6LhpO2a6OnHEH49UNUGFWFQqDrfTfLXoUDtMfgtLMkxhSoQX8QJ
         T2EUNVG7m1ZvxMSyFhVfEwg3j8Wr4K0PPAUM2b1wy9F6LnVihpMeR+aZK0pLYeVTVkf4
         WkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=UuCfN3zIawo4UhZS22BBvX/R1rHFOrnnMNUz0XIZq68=;
        b=JaVaUqBObPIZOsl2WGXelf7at77umJJyBz1E02MA07zmM/SimIvZhko7cAvBvEyVfS
         I3zxMxgXHdT0lqmC997tpDMgG9JhxDfXMj2adS1YqbOzLUv6ydXqapJJctGteXRJ7pjR
         wwOp/fviOOkSw8b4FHINRy/icnxgKp9BuD2vli5jhoX7jTf0PrSzv2ILL8obo8Nfj23x
         WIcNKN1TZ/IVhgRtHJ1Zc11VnlwmomKqdoWeBLc9gb1aid9d7q5LUxaCNCoo9UyW6Yjz
         O50qZQbCUSCuB98sqdmqFNurmLQr/cbPwpRmlIof8+1ZcQ10Fw+tQgg08Hznfy+ZiKX2
         Se1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IZA9HmPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22-20020ab02016000000b00418e7a35531si3338723uak.64.2022.11.28.11.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Nov 2022 11:01:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IZA9HmPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ozjNr-0005Al-OH; Mon, 28 Nov 2022 14:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ozjNp-0005AT-KP
 for qemu-arm@nongnu.org; Mon, 28 Nov 2022 14:01:38 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ozjNn-0004wa-O7
 for qemu-arm@nongnu.org; Mon, 28 Nov 2022 14:01:37 -0500
Received: by mail-pg1-x52c.google.com with SMTP id w37so5630251pga.5
 for <qemu-arm@nongnu.org>; Mon, 28 Nov 2022 11:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UuCfN3zIawo4UhZS22BBvX/R1rHFOrnnMNUz0XIZq68=;
 b=IZA9HmPzhVEQO5YkRpHH/P8HpQRq9ekSGo0gUxLjCRde5iGvcI9tRmu8DU8dtAMJIk
 CmExGZOMC/NtAX2/pRI5RFZenEBeoVbw9xsK+IhEylF3W+XeA67mpC+Iv6V2CiiUi9iH
 gPuiV/k2l9fYuixQStjgUy6JepEpPxdSfqoq39rk0ffpGPdWikBchI9agsZs0TV628Ut
 8T1aZFaBqifiZiUQGLJWUUaEpvxADYJerZcuaIwL4UmCg6wEFlCtmkfIL9gP39lYgCLc
 cr0bk+HFD9jtLpqjQGVFhTV5K98hT5gPE6uMSllMRdvuk3CSCn34chbHCcigbPpYhDel
 41Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UuCfN3zIawo4UhZS22BBvX/R1rHFOrnnMNUz0XIZq68=;
 b=sgjV+oxR0rqCQrNLQsz6UXM404LRdvWqK3udFrKs3EV1+cBwCl7en8JVZD82kWReZh
 fUPeGWMJjeSm87kxgWsONShRH5vIuty2RyRFYM4BBUvvUb+YSxfhuArZRA9KMO9FB7A8
 EcyMUO8v6FEvrl7qTb0HAdPNrplSDQ3N8dlMvgBM3ViXih8x5OUsCA0JMLGs0Evkt1gc
 wR2V9jxWnnsRi7SLz5uWSpHWlYv8TuW9YvpdbXqxsahV+sa04Q0Q4iS8VLH4V4PgKUak
 r4S9jd2Rg4MIllVNZZgWjfh6EUxStsW5xRHWzXBXFLUC/KSTwkUQwEzf0sVjOT84gSoN
 Pp2g==
X-Gm-Message-State: ANoB5pkCJ+yHFRiwnx+xs2WSs20TB9G+sTH+svllVteEptR8QisfkZlm
 kGfWbJpwIIn4k6L9/4yvY/a/OTOLBraMGqUpGrnmWQ==
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr29017064pgl.231.1669662094131; Mon, 28
 Nov 2022 11:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com>
In-Reply-To: <20221108023542.17557-1-schspa@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Nov 2022 19:01:22 +0000
Message-ID: <CAFEAcA_EgkndLQs=1KtXHuvVPLGs9RzHWL3QWG4CWCjbNfipQw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bB5DS90XBIUI

On Tue, 8 Nov 2022 at 02:35, Schspa Shi <schspa@gmail.com> wrote:
>
> We use 32bit value for linux,initrd-[start/end], when we have
> loader_start > 4GB, there will be a wrong initrd_start passed
> to the kernel, and the kernel will report the following warning

> To fix it, we can change it to u64 type.
>
> Signed-off-by: Schspa Shi <schspa@gmail.com>
> ---
>  hw/arm/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 57efb61ee419..da719a4f8874 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -638,14 +638,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      }
>
>      if (binfo->initrd_size) {
> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
> +        rc = qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-start",
>                                     binfo->initrd_start);
>          if (rc < 0) {
>              fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
>              goto fail;
>          }
>
> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
> +        rc = qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-end",
>                                     binfo->initrd_start + binfo->initrd_size);
>          if (rc < 0) {
>              fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");

Hi; the device-tree folks got back to me a bit late on this one,
but apparently the intention is that these fields should be
of a size that matches the #address-cells (and they'll fix the
schema docs to say that at some point). Some future kernel
or dtb-schema-check might warn about this, and also since it is
what u-boot does:
https://github.com/u-boot/u-boot/blob/218e2c45af83f2cb7b1374b9023b4ced6eb0bb77/common/fdt_support.c#L248
following that same approach is the safest thing in terms of not
breaking existing code.

I think that to do this in QEMU we just need to call

   qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-start",
                                acells, binfo->initrd_start);

and similarly for initrd-end.

Would you mind doing a respin and test of this patch that works
that way?

thanks
-- PMM
