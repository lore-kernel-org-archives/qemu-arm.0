Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2211840lfm;
        Fri, 17 Jul 2020 00:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrcb8WDWYf5z+GC3cxVSn9Qqr6rCo7OlxURefBPmzImFEM8MZo1D/bK5lle0Iau6Kai0f5
X-Received: by 2002:a25:3f81:: with SMTP id m123mr13478812yba.476.1594972775881;
        Fri, 17 Jul 2020 00:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594972775; cv=none;
        d=google.com; s=arc-20160816;
        b=kAWEJf4C7BGQrGglhhYmiOda/xTTgVGoXdn/4hMnexVZ/CQ5PDGrSwII28Rsq+teMa
         DkjN9GEe9Z6WHeatNqrVsEqey03G6J1PQQwXl51N8hGlqyEApFKPbkw6Ngzq1Prxr93P
         W4LCd5xiJa7DDdqrRKJlks90dQucugjcc4MlFWheWMDzHNpZi0S2ABEUfbNYzdItSE9P
         d8KbBOA2tOZChR8pLKAOwDpL4ZtETI3PTYejxtJqUlfNuyIccEGrbW1nL6ujhrVZT8OD
         +itav+sg075B2mo2gT8YY7CWZf9BdlogK21ur6Mow8oxGYIKL4eHYM15UEAf6o3WO/35
         DTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1xHSoXtLBxF7ROb27OCLzG5gXoJlGpOkqfizxTYTmPE=;
        b=IpMkf+T4TSG3ul7geI+wdYZ+3RG1cx1Y5j1ZS1/KL1RSDh7uzud1O331zhwVBZMOOw
         VlrlpyWvFiRYofzQVTFupWnREnGyFJQeGJNqP2TlI14haFmw8QCIcBTfCoEDFyvKMuP3
         YSZkwHzblOfW0IwaU6wS0Y0gI23UJ+hbV8x9ob6cza5UTsO6qGbDsbbiDFFMdxNm4oer
         tEJMvdQvKpNfk6KgTzptiArTXoJ4PLdAf6Xuh+393Ofp604ml+6zAuVQuFwsAz7rA+aB
         HV/i1GXSEra+RlRbJhwjvw0WwDznA7k2Z1WpX5AOoRnBDnm/W5Sym6plym+GhPA4xQpO
         fQ8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lHNg8TBd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c126si7422632ybb.62.2020.07.17.00.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 00:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lHNg8TBd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwLHL-0003Pn-7s
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 03:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jwLHC-0003P8-NI; Fri, 17 Jul 2020 03:59:26 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jwLHB-0004UB-3h; Fri, 17 Jul 2020 03:59:26 -0400
Received: by mail-ej1-x642.google.com with SMTP id n22so6877232ejy.3;
 Fri, 17 Jul 2020 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1xHSoXtLBxF7ROb27OCLzG5gXoJlGpOkqfizxTYTmPE=;
 b=lHNg8TBdjE5w5fvkEFpZ3tbLE5maL1EVY+WCZLuam+aphnuw+4lvELi5HmEiCWCqMR
 YmUPBIaGssVNvFM8exmNxXrch1+Mbp2l0O+T36KlEKbuTYvMaulaQKXhgQO6E1ZL2DpW
 qE4NSzVCmZkM0RugbAKUo96+8Vt8TQ1mp87JS21Sv8UVp83FaAvhm1NpXB4rAU8FkrSZ
 P5RIb/5lfqfSRf/4k9+3SIw0/0hB2lvmBRxBjxsANkN+oy07TihK1GNcHsJiHnXfIP8r
 yfoWILBpixeVKpDhWq1LbwrXJz8vDKC1bkcj4eVDSTaP2ItyITwfUTTTA3qB6Pl3KACs
 Llig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1xHSoXtLBxF7ROb27OCLzG5gXoJlGpOkqfizxTYTmPE=;
 b=JVnputJyvue8736SKYllGRYiuPmR7i8TBNnYMFrpaNths/ovtzy8Zze78nnXfiOjiB
 XNXMh8bkIScU4iAHznXkG5twW0iHAd365p0yZRpwtnMdKtgGcax0Fn3NSUHmQ0KeSA8b
 aO0HVSCk5+Wmc+ZwOcSKMhrklw060TSygDkvpmxSSP8k77l8Yk8DE6j2X/I4ZjcfWPu3
 eE+o0mI5O9dNybIrbnhE8o6fzpqRlfhblKVSta4Flc1pN3UtUrM6viUmiWSwHccS7AFT
 1AwNj9dsBwtF/LVnSYQfVBk7KNiZguvE8eVk9k15fhtMpWJV+0Ug82ZFAidUeOuokMNx
 K7dA==
X-Gm-Message-State: AOAM530knCcJkymfLPFB1TJx4aSrTTNcsjtkz72b4kdZtB/CpAXt4UvV
 HvQj4iEIyOg4//e7ymF84EM=
X-Received: by 2002:a17:906:1102:: with SMTP id
 h2mr7269748eja.356.1594972763113; 
 Fri, 17 Jul 2020 00:59:23 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id di20sm7630018edb.26.2020.07.17.00.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 00:59:22 -0700 (PDT)
Subject: Re: [PATCH v6 01/13] hw/misc: Add NPCM7xx System Global Control
 Registers device model
To: Havard Skinnemoen <hskinnemoen@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200717060258.1602319-1-hskinnemoen@google.com>
 <20200717060258.1602319-2-hskinnemoen@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0cd1c93-30ed-93c9-b768-01fb87d3100e@amsat.org>
Date: Fri, 17 Jul 2020 09:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200717060258.1602319-2-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: kfting@nuvoton.com, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Avi.Fishman@nuvoton.com, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gxhKLb87bSZZ

On 7/17/20 8:02 AM, Havard Skinnemoen wrote:
> Implement a device model for the System Global Control Registers in the
> NPCM730 and NPCM750 BMC SoCs.
> 
> This is primarily used to enable SMP boot (the boot ROM spins reading
> the SCRPAD register) and DDR memory initialization; other registers are
> best effort for now.
> 
> The reset values of the MDLR and PWRON registers are determined by the
> SoC variant (730 vs 750) and board straps respectively.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  include/hw/misc/npcm7xx_gcr.h |  76 ++++++++++++
>  hw/misc/npcm7xx_gcr.c         | 227 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                   |   8 ++
>  hw/arm/Kconfig                |   3 +
>  hw/misc/Makefile.objs         |   1 +
>  hw/misc/trace-events          |   4 +
>  6 files changed, 319 insertions(+)
>  create mode 100644 include/hw/misc/npcm7xx_gcr.h
>  create mode 100644 hw/misc/npcm7xx_gcr.c
...

> +static void npcm7xx_gcr_realize(DeviceState *dev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    NPCM7xxGCRState *s = NPCM7XX_GCR(dev);
> +    uint64_t dram_size;
> +    Object *obj;
> +
> +    obj = object_property_get_link(OBJECT(dev), "dram-mr", errp);
> +    if (!obj) {
> +        error_prepend(errp, "%s: required dram-mr link not found: ", __func__);
> +        return;
> +    }
> +    dram_size = memory_region_size(MEMORY_REGION(obj));
> +    if (!is_power_of_2(dram_size) ||
> +        dram_size < NPCM7XX_GCR_MIN_DRAM_SIZE ||
> +        dram_size > NPCM7XX_GCR_MAX_DRAM_SIZE) {
> +        error_setg(errp, "%s: unsupported DRAM size %" PRIu64,
> +                   __func__, dram_size);

Nitpicking if you ever have to respin, please use size_to_str() here,

> +        error_append_hint(errp,
> +                          "DRAM size must be a power of two between %" PRIu64
> +                          " and %" PRIu64 " MiB, inclusive.\n",
> +                          NPCM7XX_GCR_MIN_DRAM_SIZE / MiB,
> +                          NPCM7XX_GCR_MAX_DRAM_SIZE / MiB);

and here.

> +        return;
> +    }
> +
> +    /* Power-on reset value */
> +    s->reset_intcr3 = 0x00001002;
> +
> +    /*
> +     * The GMMAP (Graphics Memory Map) field is used by u-boot to detect the
> +     * DRAM size, and is normally initialized by the boot block as part of DRAM
> +     * training. However, since we don't have a complete emulation of the
> +     * memory controller and try to make it look like it has already been
> +     * initialized, the boot block will skip this initialization, and we need
> +     * to make sure this field is set correctly up front.
> +     *
> +     * WARNING: some versions of u-boot only looks at bits 8 and 9, so 2 GiB of
> +     * DRAM will be interpreted as 128 MiB.
> +     *
> +     * https://github.com/Nuvoton-Israel/u-boot/blob/2aef993bd2aafeb5408dbaad0f3ce099ee40c4aa/board/nuvoton/poleg/poleg.c#L244
> +     */
> +    s->reset_intcr3 |= ctz64(dram_size / NPCM7XX_GCR_MIN_DRAM_SIZE) << 8;

Nice :)

> +}
[...]
