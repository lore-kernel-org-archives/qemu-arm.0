Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp175685lfm;
        Thu, 27 May 2021 02:35:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3HOPBLB2I5eYAeHhZwYss3yzXc5nVDy7LZ6tmNuFPjRQqSN3/22QhSGcjFIXlQPtOn7Xb
X-Received: by 2002:a5d:9c9a:: with SMTP id p26mr2144349iop.94.1622108133529;
        Thu, 27 May 2021 02:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622108133; cv=none;
        d=google.com; s=arc-20160816;
        b=VFPHy167PGf05e1oXAzAA03tRYeaB0LtQfepDE5c6l7Tx7IsC/LncNocy72zwDkYnk
         hxMzatwCMp8edqy3fjYv7kZggLTTI5Uv3aOS5BsTBYy5Wt2C+UJhJdRbaVlgyHvKk1vO
         LH5BtOVlbiWUinnUmdjhafG92cnOoog3HmXItIYIzOudC/pgXlncMRnUjy/7WrwII31q
         MW8JBNR6DMlGzsQABfghKTG99dVcG9CWdJ8znNkhdQ1s+ZAOYlVcZU8c4tgp0yXH8a5X
         LMssyaJZZUEy2knVMTaORe1f7GmJCC+lNbP4XTvhSI50TeGf+/joDE7kAJ0jm97Vx8Jt
         aJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XSlFPWnITwgvY9GnhEgvfFmGNKC3hwkREGHbhIhW9qA=;
        b=oo7HPQa2ANQOg8uIyXDlqL9FIfOXFY/AHSJ9BHHKGKTd2nlAkJELKvNoRlwk6U1CoV
         9ZCKxwcXSoYjgQ0frGMBESZWQvLncMuEJ31MTyUH3OYYHp7J1CMHX2J2NwcrZR1qrAbe
         0pfRJWOo1KYR4b2XwNLlbhitPkvqGSGuGsXBJ2fZCLDOBKBllRLG8Bcw9X7+PQj8kxOK
         +rD41/SWgxK3KT5Bqjy5BhD4NHTdcr8RhYT8QSs86QenxeZlTAWmcZdLQXQEC/D0r+i+
         tqz/P7rqCrUJups9YDxeiRUe54FwsLgoeEgNeTy/QLF4yCvAuGpLU9G656d8IC+V+AKY
         VVyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Wlx5o/Nj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10si1923231ilv.99.2021.05.27.02.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 02:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Wlx5o/Nj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmCQO-0000du-ST
	for alex.bennee@linaro.org; Thu, 27 May 2021 05:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCPC-0007kZ-Nt
 for qemu-arm@nongnu.org; Thu, 27 May 2021 05:34:18 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCP8-0007OP-Iu
 for qemu-arm@nongnu.org; Thu, 27 May 2021 05:34:18 -0400
Received: by mail-ed1-x52e.google.com with SMTP id j10so63180edw.8
 for <qemu-arm@nongnu.org>; Thu, 27 May 2021 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XSlFPWnITwgvY9GnhEgvfFmGNKC3hwkREGHbhIhW9qA=;
 b=Wlx5o/Nj1pJneYGARWdzPEB3+SM5ij3OOj/KGZIIZxrlk3upKS4Wv1DdTcs9XBuxl8
 lzyX1KDynywvMinf6km3j3lNCONkiJtbDpvGmWxFG1ZPNB62J0KpDvQ7JTga2RwjRNRc
 q+Mrij4u0KHxS7D9/cLHe6pYnQdvvwa14WNeH3WepXMMP0mS66ZqBHEozhNlhlQF89l+
 aHq+Ql8no+my4WjpuwhaZ1CLAfE7pMSxCqHt1RK283k986lcPeRGztyCf8zT7l+7mcuG
 TdU6IavLM7+USjH4HMRMky1SDngS+I+sUSDKPMtHvquMyvZMlCHvnL1/OKlTtIdMVwUd
 W4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XSlFPWnITwgvY9GnhEgvfFmGNKC3hwkREGHbhIhW9qA=;
 b=nPm9vkGnl3/aL/piB4HBZurh9D0qtuRLLiZBwAGH4JM9ZPGN3jlQWp0QoSAht3FM3Z
 mRMQPpVu5C0uFJKPR23mrocFkH8vBxh0epuVxaV75ZAwqge3hqhtD74IUXdB65KKCo+E
 TO8lQZTwy1z0ZHr5mFdopla250dIxnphUFBBTbqXYvB8pfXRQJ9eoJUG8uKVySp7kr55
 pvbyAmQgCGxlnK7IyM+dsCstiBGtQog4mx0cMA6Oo5GCW2jpppYxTVyp9ZhbkMaUYD+2
 GL4Iiz8WGqyofZOgPvJavihahJyixFiPnhkZXegW293BBFvzsnbo4m3/C3/qmVBvmwxz
 bEYw==
X-Gm-Message-State: AOAM531/VmO+sMn2BitNqxswGHAuyzozG3ZUjUIHhlhj84j/b4MYYUYF
 RcgjWxkpzO9LE/0Trtg6lIAr4wvbD50kjP3Drq/1Zg==
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr3148634edz.146.1622108053126; 
 Thu, 27 May 2021 02:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194704.764241-1-venture@google.com>
 <20210518194704.764241-2-venture@google.com>
In-Reply-To: <20210518194704.764241-2-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 10:33:47 +0100
Message-ID: <CAFEAcA-WMC4OkzkyvH-wabcLsjThjZikLMxO5O9ALGknoY3=jg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm: add quanta-gbs-bmc machine
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, Brandon Kim <brandonkim@google.com>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jX0fIkD3GhDc

On Tue, 18 May 2021 at 20:54, Patrick Venture <venture@google.com> wrote:
>
> Adds initial quanta-gbs-bmc machine support.
>
> Tested: Boots to userspace.
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Brandon Kim <brandonkim@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index d4553e3786..34a214fe79 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -29,6 +29,7 @@
>
>  #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
>  #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
> +#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff /* TODO: Get real values. */

Any chance you could fix this TODO ? If it's not fixed now before
the code goes in it seems unlikely that it'll ever be fixed -- you're
probably in the best position to know the right value...

>  static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
>
> @@ -268,6 +269,22 @@ static void quanta_gsj_init(MachineState *machine)
>      npcm7xx_load_kernel(machine, soc);
>  }
>
> +static void quanta_gbs_init(MachineState *machine)
> +{
> +    NPCM7xxState *soc;
> +
> +    soc = npcm7xx_create_soc(machine, QUANTA_GBS_POWER_ON_STRAPS);
> +    npcm7xx_connect_dram(soc, machine->ram);
> +    qdev_realize(DEVICE(soc), NULL, &error_fatal);
> +
> +    npcm7xx_load_bootrom(machine, soc);
> +
> +    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
> +                          drive_get(IF_MTD, 0, 0));
> +
> +    npcm7xx_load_kernel(machine, soc);
> +}
> +
>  static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
>  {
>      NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
> @@ -316,6 +333,18 @@ static void gsj_machine_class_init(ObjectClass *oc, void *data)
>      mc->default_ram_size = 512 * MiB;
>  };
>
> +static void gbs_bmc_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
> +
> +    mc->desc = "Quanta GBS (Cortex A9)";

"Cortex-A9", with a hyphen.


thanks
-- PMM
