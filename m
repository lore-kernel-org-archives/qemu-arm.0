Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2071818lfg;
        Sat, 13 Mar 2021 04:06:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxypGhy/zlaV2GVIyyx8MFWdEUB5X346si1NNhdQmD6pTiCySX4s9ENa3xPwWpU7VjfB2rT
X-Received: by 2002:a02:ccb2:: with SMTP id t18mr3067767jap.123.1615637170122;
        Sat, 13 Mar 2021 04:06:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615637170; cv=none;
        d=google.com; s=arc-20160816;
        b=gvfjxio+mGThgDIEljMC+EUq4NfkEtGPfsqKOSGlOBSNL1emaEyrMrEoCgm/TOj/mX
         kqhB2mllv1QjMSpQGi4I7AKvcETj/765rBGe+/Qs3DytubcP/j+2QcgB1gjnC+OXIHOI
         ZbQ2EPwYoIiBufdNBtchSaDDBYEiuzqcECEdpeFo0LuSNgJxZzHzcxnfq7bndS2ohclk
         jr/wURX02650T3Pxh2U5go7tzTPMcHFrkYha6ZLPVIdMJDWTvffnoV73l6v5qoCzdfbX
         UGuOQn2ZZ8+lZh9OZtEOQei9ZusnRy6kCjZxxtv6yzV/7mZhZUAYmy+E8GsJlmpW6uYI
         YOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=d2nGmJdMKrwUglykE9F7Do6A+XD+fVg3xp8oTIR6Q9Q=;
        b=bpTda9vc+FsDvL/yRyprYxaLnj140qJOR5hCOKIBiYQG0hgJi3tJ/26rciW4YpGy79
         A6NIRGCx/2VKOKm0xiyfz8A763OSNKQJSlE7ZRfLEQzHe6zafbTMC0pOjp1bg/nNxNXp
         z60/tg90gZ2sSgifPy6zv9wsa5/hLJ6wBKBgW+EY0MONzfe3UHmWbxcHB63WWTzBQ2/J
         zcNn7hFrEmgaIMynGjvCGF51GHmYk9kxVdhHc58jTBSesGKji0QsfCsDnd8ZLtfhuXd6
         dUI5RhgBJbz/YLLDuz+ozRA16V8JXtsjJfrxT9xor6XKHI1vd2b2DgmuphudP+wl5Ngw
         cSBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mh1s5doP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n26si7303900jam.115.2021.03.13.04.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Mar 2021 04:06:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mh1s5doP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lL31y-00053V-JW
	for alex.bennee@linaro.org; Sat, 13 Mar 2021 07:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL31j-0004zK-Em; Sat, 13 Mar 2021 07:05:51 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL31i-00076z-0J; Sat, 13 Mar 2021 07:05:51 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a18so6192411wrc.13;
 Sat, 13 Mar 2021 04:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d2nGmJdMKrwUglykE9F7Do6A+XD+fVg3xp8oTIR6Q9Q=;
 b=Mh1s5doP1loOJYQQsNZd/+YjyYk9/5MvRFI5/TqCgnLTQVKWaVl4+OGNHatEn3EzTW
 WTYrQiWujBNO3A7lns0EYdB1a1yBmMI8sZa8vdQz9iOVfL1gGAdHYLdgbnZ5/MQWY0Z3
 aoT4sTnczyIQ0djBig3ERs6XyHJxdQQcEbTlL+3Ud64Mn9sD9M5NMwcyWA/SWeJveOJW
 OLU2zl+Tn5gG+Mu/7C3tXuSGIvIQAoZR4fecILgaXIh1n5S2rU0GoHvHZwtzyKV1r+mP
 /GqKpb56WhgUZKhBmaBZgkeg/o0ZKDXVM4Fzm0h6lMJ5X2bV0ePT/zWq+i+BOkjjtAPH
 SUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d2nGmJdMKrwUglykE9F7Do6A+XD+fVg3xp8oTIR6Q9Q=;
 b=gc7xoYbQfADynjjyGFzAYjRtQ9xpCaBIaj6mFPKVbl/qNoxwcCKCsGYt/OMCCSuRF+
 qUxtkn0YyT08ctv5LGSxGDTPsiW6DYSZbe2OKS1AgbMjZplCN4opDN2FGr6AfOtsV5k8
 pNTBpGtmwYpgfLZ8hp+hruoqjnw3/bnHyzyajnp5RAJkt6Utm9qWRVngNCxmkfEcdSdk
 FwHJNcqU1ywxb1JD4p3SlKJxun4xsLor4v2siNa0iOv4oX3wtLdose1pOkRju6/AQ/Aq
 0COEChYwDlEHf7twBb/OsaZfE6V5Fm5Bdsz6EFQbhqgm2Y2nuxK1CyErPKkpK4meE61u
 ZkGw==
X-Gm-Message-State: AOAM532rnHKfGyGRrQxRkzvxuyD5ClYEMYZlapND7ZgzkqQmOMNVCB4K
 iXKMiqgenTle//aB8Dy2NIBnBXGJYrK/UQ==
X-Received: by 2002:adf:f78f:: with SMTP id q15mr18297691wrp.383.1615637147878; 
 Sat, 13 Mar 2021 04:05:47 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o13sm14420327wro.15.2021.03.13.04.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 04:05:47 -0800 (PST)
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Do not sysbus-map mmio flash region
 directly, use alias
To: qemu-devel@nongnu.org
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4a812dc9-b448-0b8f-6a66-95cb96acdc17@amsat.org>
Date: Sat, 13 Mar 2021 13:05:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312182851.1922972-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8LtIq5yT6gBF

Incorrect subject prefix, should be "hw/ssi/aspeed_smc"

On 3/12/21 7:28 PM, Philippe Mathieu-Daudé wrote:
> The flash mmio region is exposed as an AddressSpace.
> AddressSpaces must not be sysbus-mapped, therefore map
> the region using an alias.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/ssi/aspeed_smc.h | 1 +
>  hw/ssi/aspeed_smc.c         | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 16c03fe64f3..e3c96cecbd8 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -84,6 +84,7 @@ struct AspeedSMCState {
>  
>      MemoryRegion mmio;
>      MemoryRegion mmio_flash;
> +    MemoryRegion mmio_flash_alias;
>  
>      qemu_irq irq;
>      int irqline;
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 16addee4dc8..aa26578bdac 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -1386,7 +1386,9 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>      memory_region_init_io(&s->mmio_flash, OBJECT(s),
>                            &aspeed_smc_flash_default_ops, s, name,
>                            s->ctrl->flash_window_size);
> -    sysbus_init_mmio(sbd, &s->mmio_flash);
> +    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s), name,
> +                             &s->mmio_flash, 0, s->ctrl->flash_window_size);
> +    sysbus_init_mmio(sbd, &s->mmio_flash_alias);
>  
>      s->flashes = g_new0(AspeedSMCFlash, s->ctrl->max_peripherals);
