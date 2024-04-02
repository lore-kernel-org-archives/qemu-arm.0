Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4065759ejv;
        Tue, 2 Apr 2024 09:21:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcuj6fdKIQ4f2oXksOR+RBrN8J1BUTJiQrU3LsAnwd4lyP74f0Se8N216Ew9IhhmMeNqVW7JJ7CUfmrgY5caWVfjCAG/cc
X-Google-Smtp-Source: AGHT+IHq6WGoRvvp2lTMRSbuFtgn9LSH/q0ixAzvXNwtYxHg3AYo6By9lJ9IukpodL0xXxWiWvrm
X-Received: by 2002:a05:622a:492:b0:432:7ae6:ac21 with SMTP id p18-20020a05622a049200b004327ae6ac21mr99878qtx.62.1712074889822;
        Tue, 02 Apr 2024 09:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712074889; cv=none;
        d=google.com; s=arc-20160816;
        b=HdXGoYWGZkWf3raW7mSgSg+QiwiWBd/wua30coxgsBhvjozro4kKsG1aSOB2smthV2
         LjlmuXUDOlcjgyIhQgQRdWb0YcdiHFWUtUWWtNhdqWX88G/ziBE9YrbQAw7B0eQhbhbf
         wMC2yU2j9Es566zrQSNElGkklppypg1xXBjlyCvGcmSxmncM1nXVa5rvfU9KnQYD5rZL
         H46cgROkcsC9NXZIFbU3i7tk5JcwTn5lXtCpl+VapJzBclAhHvikbSXX1SBdMHlwYcuB
         W90SxgA1jbt1DQDMOksgX0dFFKw2hy8lqeoxS5ERUBnb1Fd6sOP3KwZzfc7f17ylTWNr
         RTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=o1peXpmt2C+W5FT88tgPQZyqintO0tvvupH2V4zg3hM=;
        fh=cWWrQPNWFbSLOlJQ15lR+GuxVs1BPTRl2/A2DTCGtIc=;
        b=TBX5/1JxjHeotDpxzv8wSYBVNVTpupkWG+VJxe1aRNLP1qcxz+YXsOEj8+RUks44+U
         WSWRC7RWg19rQmZ2dMhGHzDEGwILrRgHLmlawqWDMqvUTlbS1YC+Sk3gkDniYfhPxi+e
         KgrzURiwSqaiSQR5VJcaZRSDLSNjwQ/28sajJouaGYBJO3qvMrp+BorW2A3nuXwEaSDD
         uN4ud261VdSwgEsuhZ71hrjms3D9PMCprExUnDwyP5Bgq0PTd7LcVoFz13uvwtO+cw86
         L6DysXzPfRCMXY6+okKiIHUwuEdnk6BysGaRtswaeuEq98p736QExymlHOfWPd995d3k
         g+Jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BcTXK0S2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21-20020ac85d15000000b00432b6a1ceeasi11726928qtx.152.2024.04.02.09.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 09:21:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BcTXK0S2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rrgsm-0008OG-Do; Tue, 02 Apr 2024 12:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgsk-0008Ng-8P
 for qemu-devel@nongnu.org; Tue, 02 Apr 2024 12:21:06 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgsg-0001jB-ID
 for qemu-devel@nongnu.org; Tue, 02 Apr 2024 12:21:06 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56df42c2773so923411a12.3
 for <qemu-devel@nongnu.org>; Tue, 02 Apr 2024 09:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712074861; x=1712679661; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o1peXpmt2C+W5FT88tgPQZyqintO0tvvupH2V4zg3hM=;
 b=BcTXK0S2Q9R52F0ExKJKRnssi2P/k86HquenDANnYFDN4wNvJB3kFecW8Pd/XOZBw3
 Q35Mau7zsb7LXA95kuorxPDqlrLMHQ+G1ZDQXNVWNTgES+2r2CnmG4oF1zdEh2UhrUPA
 uRJJTzZH2kJKSoeX1c79idhGu6uRYxw8YFhUB+/F3WuQ0CcvqzGeSvXiUKiyNDPFVrNV
 8M0x8fqfBycxNAg4tOwaQwzUiOJt2R/3lfKnP7ALxcMQocsU3z71NgDeXXtMSDVZJ+ou
 muMekk9vjthacURTTvNvj4j7PYFgWYTP2QBlNacolc0eo+TzhgQ/fSpmCh3fvJzszyV0
 UmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712074861; x=1712679661;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o1peXpmt2C+W5FT88tgPQZyqintO0tvvupH2V4zg3hM=;
 b=TAEahYgWve36MJRqKNJPs4J2MUxuC89vJ7Bpn3jgKdc1uKARovTQ3VLtvWhH1AbATY
 D2FKyzmRb0jU8RhiHu1YBWJR32+f1D4mSBybxf9Vw/BKhs7ZFxlK4SgxIpMUnEdz3syK
 sWFxtv4G3yrLsOlGeXNS/yAR0QGG3vTR6LcBBJy9UREM8/LTjwzj99IgQGizyA6F9mBi
 vwGWVo33gICvLuZS9MtBRzMaFnYYJpi9QmOytEgk+ioirPccFB4SmikvM1BYzlOqA4fI
 rGzx6C80SmU7/JYeXDV8JyK+8Ei24hfU7+3/kl1ihjkyqlJAZwsqK5D09V/+deDFrogv
 37Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGbd0P7WbgYG/UbNyhnu/98yb0Y5f3t85IPZ55EQ+EwRwK0XOs507HNGg54XUGZUruEcTLYD3JYaRsC7nbmjOF/BUMBlI=
X-Gm-Message-State: AOJu0YxrZhTTv4SwA8XJ1XqbvUx6adlMP4ELIEoZaTB/+zLEh/8zQ8xS
 F8ac/+Ecbr/rWfrJsqdfkPoFeMfhb24YnqJPQZUH3PlakGwtiKlOFIB1O4qIQJNMy03ZijZrD/r
 /EYOF+9YoBnbtH+wPmFHC2N3+xz+WVEvaJ7O+kg==
X-Received: by 2002:a50:a6d4:0:b0:56d:b6dc:c8fe with SMTP id
 f20-20020a50a6d4000000b0056db6dcc8femr295214edc.0.1712074860702; Tue, 02 Apr
 2024 09:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
 <20240330103128.3185962-15-ruanjinjie@huawei.com>
In-Reply-To: <20240330103128.3185962-15-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 17:20:49 +0100
Message-ID: <CAFEAcA-L6T61zSYKDEE22oUxpG6Cc6bTNWBn0Lkgx4xYmUfHhg@mail.gmail.com>
Subject: Re: [PATCH v11 14/23] hw/intc/arm_gicv3: Add irq non-maskable property
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AyBHgHSDtJIk

On Sat, 30 Mar 2024 at 10:33, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> A SPI, PPI or SGI interrupt can have non-maskable property. So maintain
> non-maskable property in PendingIrq and GICR/GICD. Since add new device
> state, it also needs to be migrated, so also save NMI info in
> vmstate_gicv3_cpu and vmstate_gicv3.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v11:
> - Put vmstate_gicv3_cpu_nmi and vmstate_gicv3_gicd_nmi into existing list.
> - Remove the excess != 0.
> v10:
> - superprio -> nmi, gicr_isuperprio -> gicr_inmir0.
> - Save NMI state in vmstate_gicv3_cpu and vmstate_gicv3.
> - Update the commit message.
> v3:
> - Place this ahead of implement GICR_INMIR.
> - Add Acked-by.
> ---
>  hw/intc/arm_gicv3_common.c         | 38 ++++++++++++++++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  4 ++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 2d2cea6858..189258e1ca 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -164,6 +164,24 @@ const VMStateDescription vmstate_gicv3_gicv4 = {
>      }
>  };
>
> +static bool nmi_needed(void *opaque)
> +{
> +    GICv3CPUState *cs = opaque;
> +
> +    return cs->gic->nmi_support;
> +}

I think we should call this function gicv3_cpu_nmi_needed()...

> +
> +static const VMStateDescription vmstate_gicv3_cpu_nmi = {
> +    .name = "arm_gicv3_cpu/nmi",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = nmi_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT32(gicr_inmir0, GICv3CPUState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_gicv3_cpu = {
>      .name = "arm_gicv3_cpu",
>      .version_id = 1,
> @@ -196,6 +214,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
>          &vmstate_gicv3_cpu_virt,
>          &vmstate_gicv3_cpu_sre_el1,
>          &vmstate_gicv3_gicv4,
> +        &vmstate_gicv3_cpu_nmi,
>          NULL
>      }
>  };
> @@ -238,6 +257,24 @@ const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
>      }
>  };
>
> +static bool needed_nmi(void *opaque)
> +{
> +    GICv3State *cs = opaque;
> +
> +    return cs->nmi_support;
> +}

...and this one gicv3_nmi_needed().

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
