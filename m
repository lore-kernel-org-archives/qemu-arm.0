Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3091679njj;
        Tue, 6 May 2025 05:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZkpy5CYd1k47SW/XUnTE8fCddMi4GEFH8zeeL9UC+VfnTaW5WNdYlFs7WzyJtyko9amFWN8wFrnVHuw==@linaro.org
X-Google-Smtp-Source: AGHT+IERxt0kM7l3YXmlNp4z5xjToBe1Bu343zCHPciYs7Io/06gfqP8W6WZVe2fSJP6yiBw1CLJ
X-Received: by 2002:a05:622a:480c:b0:48d:7cb6:c625 with SMTP id d75a77b69052e-48dff3e282amr189496931cf.4.1746535984593;
        Tue, 06 May 2025 05:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746535984; cv=none;
        d=google.com; s=arc-20240605;
        b=fxHAzIJq97QK2cuw954/QhCrwiMFvFHCqf4BczvABqp+qs1nGE4zbR35L+ISicU9Ln
         9G6879R5W7yFqxI5YjJoxEdOv9w/orXLsx+nXcI5Vcz5hOa8WZYSVAZ2rW+jz/VuKOyh
         qNt5DNuAud5jqPJ2PimgCSWoob1xB/Lt96gYQiWEMIq9QLR3P1vYai/+WEQ2GZf+5hF/
         iiDqrVfS9/lNtOl9XJz+DcMLiwJidCK9dXFywvic3NDtdUWYo4eYLIk0QypRoiE4F0BG
         Meiyo/x9i/6+jBtzXnEmgu2/wo9f7bjMGQTw6ftWPVVV32BRGwCxUc8LLxnwEH0kl7g4
         rcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cb6iqQOiZucx8C9pqxlck8bfdMm0/Ogu0GGyiwP3/1U=;
        fh=1l8H8GsLLi/aJo7hKQiNJel+MxDj2MTZ3RhDlXstTpU=;
        b=UdcJY/Of61oLGznrw0xSC/HV7NI196YQ/C21KbHPbW5QHzkZnD+ojnupAxOnwE7qrv
         rWcVs24NUedQSjuZHb6NCzK4twd4LfHNT3epe2HW28m1oGCDJVmCtmWjrKaOCoixzWlD
         UUw1hw5sHOfeiNF+hdp/6qyXzpuUjc2vh0ARV4teLE4O31EGvDWqWavh8RQn8YevUNRV
         j+fk5Dl1/wfyby2iWl49XtF+2cYWqxHj/7zUmdTG00Vtf2XeGiGCZq+m84YnU4aSMNG5
         RPGSg2d7vglyB9oA1WK5/AWIxgBOG6dwvoHCC3af/oPx376QKBUfW1aWxHm67Lf4YyES
         nWSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O0GVIvzb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b98247e05si116344161cf.267.2025.05.06.05.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 05:53:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O0GVIvzb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCHmd-0001GN-Mb; Tue, 06 May 2025 08:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCHmX-0001FO-Q9
 for qemu-arm@nongnu.org; Tue, 06 May 2025 08:52:22 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCHmV-0003JI-Jl
 for qemu-arm@nongnu.org; Tue, 06 May 2025 08:52:21 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e740a09eb00so5049257276.0
 for <qemu-arm@nongnu.org>; Tue, 06 May 2025 05:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746535938; x=1747140738; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cb6iqQOiZucx8C9pqxlck8bfdMm0/Ogu0GGyiwP3/1U=;
 b=O0GVIvzbFVuxNpxhdYWC+MiS2+vL/lHiTgMdrg6QkphVpsSasC4PaRNHbPovJwq4hu
 V1+hOuIvNH3ZHhKji115Jp24wlOnut+kAfU4zJrrNopy8K+D8LbO3TWxjckFpRuBsSXO
 YbDkVmgDwaCAKwxALiZtyrAopX8OGdW2KitG2R/6AmfXI+Qo5kMD2CRCeBty6qNH6VmE
 Y5+M898taFzUyNzF5MGjkToHExoOIXc5dZRKLTBSk8eJF4fvwuS1zyse0ebPA6oQBhKw
 N2ACuBrhonRJu32G7manDxg8hZ9jZMS+5nyDbosS0M2vrFyIefZ5tiiVD/NHs+0+8QsR
 dVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746535938; x=1747140738;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cb6iqQOiZucx8C9pqxlck8bfdMm0/Ogu0GGyiwP3/1U=;
 b=n/qW1Vc/aYtSlWTf+LHKHdjZqTswSyoxV5Z8U4KIAtiiTbYRX3LAIbu0uUiySzFSX5
 0sThjFJzIxhU4a70Xf+cjStXQmuDc3pvqNQZodtEthghJb48oZVSrU+ebai4gI/ZU5x4
 NzTcMGpTIlir7LVXjPUMXPwdgSd3bl7mtINIbk0CEkC6jaT8O63PVGNxk6S/wOlhdV+z
 bNzPVoW70FRs8BzxyAOT3CyyTdiHtVaw9n3/x+bqp65rs58/D8QBqHDyZbzBw8GZoMq9
 qhuXw6E9k7i59Ec80mRUql13c64Hao9fnu478CMISruW/WjRRulINbUrdxSfcgD3Wg9x
 NaPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViFeUPhXkaK/6f+ptmx3bIVYgnf7TonbLxtXjByxrVyiQeybnlwU1ArMGJvBOSrOKjuqQ+26o9Zw==@nongnu.org
X-Gm-Message-State: AOJu0Yxyt7uBi4417fFARnCrEe0fa811qYUKomlb3voJ0uoPSuDhbJBh
 bVEaYcAz2y9XsJSTxD1mTTMX8Ch+95ENO4ScWo+ofaCsELJyznF6hMt69q3qIyMhKJHyJE5lXje
 7MM5tnQ9TARhjesnCwv+rLV6PRVyBjQusH7m6BA==
X-Gm-Gg: ASbGncvBuuHy12pqBlVjAYHgxZSJHN30em5OcICqfvVjgBxdNYXt0lIZaYEGn2x38ZB
 zocg4fBeiw7RTFbBhOpiKtMGNPEoDDGixAcAlmS53hhGDDMLkNp86zQm86pMZrXJvFyui1mE1tn
 xJrjkov39uF/Z2K0Ik3T/l8MNTQjfwOhYJ/Q==
X-Received: by 2002:a05:6902:158c:b0:e73:30bd:49b5 with SMTP id
 3f1490d57ef6-e757d0c2240mr14899436276.7.1746535937885; Tue, 06 May 2025
 05:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250418091208.1888768-1-timlee660101@gmail.com>
In-Reply-To: <20250418091208.1888768-1-timlee660101@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 May 2025 13:52:05 +0100
X-Gm-Features: ATxdqUFgVS9PFCSXBwpEgIg3HwtrSkk_YSOhtxVmbhc7IKgXj9F1u0c4gOO4USA
Message-ID: <CAFEAcA_O1B7oXbK3RHLvSJHZaMSM-aVG_CD9Y7dH0OpAs7sibg@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: Add qtest for NPCM8XX PSPI module
To: Tim Lee <timlee660101@gmail.com>
Cc: farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 wuhaotsh@google.com, kfting@nuvoton.com, chli30@nuvoton.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: /yH+h3QFs59s

On Fri, 18 Apr 2025 at 10:12, Tim Lee <timlee660101@gmail.com> wrote:
>
> - Created qtest to check initialization of registers in PSPI Module
> - Implemented test into Build File
>
> Tested:
> ./build/tests/qtest/npcm8xx-pspi_test
>
> Signed-off-by: Tim Lee <timlee660101@gmail.com>
> ---
>  MAINTAINERS                     |   1 +
>  tests/qtest/meson.build         |   3 +
>  tests/qtest/npcm8xx_pspi-test.c | 104 ++++++++++++++++++++++++++++++++
>  3 files changed, 108 insertions(+)
>  create mode 100644 tests/qtest/npcm8xx_pspi-test.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d54b5578f8..0162f59bf7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -892,6 +892,7 @@ F: hw/sensor/adm1266.c
>  F: include/hw/*/npcm*
>  F: tests/qtest/npcm*
>  F: tests/qtest/adm1266-test.c
> +F: tests/qtest/npcm8xx_pspi-test.c

This file is already matched as being in this section by the
wildcard two lines earlier.

>  F: pc-bios/npcm7xx_bootrom.bin
>  F: pc-bios/npcm8xx_bootrom.bin
>  F: roms/vbootrom

> diff --git a/tests/qtest/npcm8xx_pspi-test.c b/tests/qtest/npcm8xx_pspi-test.c
> new file mode 100644
> index 0000000000..107bce681f
> --- /dev/null
> +++ b/tests/qtest/npcm8xx_pspi-test.c
> @@ -0,0 +1,104 @@
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "qemu/module.h"

Every source file needs to start with the usual brief
comment giving its copyright/license information (and we
like that to include an SPDX-license-Identifier these days
for new source files).

> +
> +#define DATA_OFFSET 0x00
> +#define CTL_SPIEN   0x01
> +#define CTL_OFFSET  0x02
> +#define CTL_MOD     0x04
> +
> +typedef struct PSPI {
> +    uint64_t base_addr;
> +} PSPI;
> +
> +PSPI pspi_defs = {
> +    .base_addr  = 0xf0201000
> +};
> +
> +static uint16_t pspi_read_data(QTestState *qts, const PSPI *pspi)
> +{
> +    return qtest_readw(qts, pspi->base_addr + DATA_OFFSET);
> +}
> +
> +static void pspi_write_data(QTestState *qts, const PSPI *pspi, uint16_t value)
> +{
> +    qtest_writew(qts, pspi->base_addr + DATA_OFFSET, value);
> +}
> +
> +static uint32_t pspi_read_ctl(QTestState *qts, const PSPI *pspi)
> +{
> +    return qtest_readl(qts, pspi->base_addr + CTL_OFFSET);
> +}
> +
> +static void pspi_write_ctl(QTestState *qts, const PSPI *pspi, uint32_t value)
> +{
> +    qtest_writel(qts, pspi->base_addr + CTL_OFFSET, value);
> +}

If I'm reading the implementation correctly, it makes both
the DATA and CTL registers 16 bits, but this code has the
data register 16 bits and the control register 32 bits.
Which is correct ?

> +/* Check PSPI can be reset to default value */
> +static void test_init(gconstpointer pspi_p)
> +{
> +    const PSPI *pspi = pspi_p;
> +
> +    QTestState *qts = qtest_init("-machine npcm845-evb");
> +    pspi_write_ctl(qts, pspi, CTL_SPIEN);
> +    g_assert_cmphex(pspi_read_ctl(qts, pspi), ==, CTL_SPIEN);
> +
> +    qtest_quit(qts);
> +}
> +
> +/* Check PSPI can be r/w data register */
> +static void test_data(gconstpointer pspi_p)
> +{
> +    const PSPI *pspi = pspi_p;
> +    uint16_t test = 0x1234;
> +    uint16_t output;
> +
> +    QTestState *qts = qtest_init("-machine npcm845-evb");
> +
> +    /* Write to data register */
> +    pspi_write_data(qts, pspi, test);
> +    printf("Wrote 0x%x to data register\n", test);

Don't put printf()s in test cases, please. The test
output is supposed to be TAP test protocol format, and
the printfs insert random junk into that.

If you need to output some kind of message, you can use
g_test_message(), but for simple stuff like this I don't think
the printfs are really adding anything, because the test is
so short.

> +
> +    /* Read from data register */
> +    output = pspi_read_data(qts, pspi);
> +    printf("Read 0x%x from data register\n", output);

Can we assert something useful here about what we read
(e.g. that it's the same as what we wrote) ?

> +
> +    qtest_quit(qts);
> +}

thanks
-- PMM
