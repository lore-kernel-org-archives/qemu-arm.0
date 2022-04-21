Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp22692lfk;
        Wed, 20 Apr 2022 19:20:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4EtAHED8Zb6VJq1UNhXLfYx8adqYJ1jst8EgeWT8TIana8uN5DhLdp68ib14ErSxAUqW3
X-Received: by 2002:a05:622a:64f:b0:2e0:6a11:7b0d with SMTP id a15-20020a05622a064f00b002e06a117b0dmr16096134qtb.9.1650507621888;
        Wed, 20 Apr 2022 19:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650507621; cv=none;
        d=google.com; s=arc-20160816;
        b=qj2HNvf3Nv4rnT3X5tPu//yVA0LebX3l+8FA3ODaMa6Dnm5CLpe+awGXER8YOTVlyL
         EcdJyiXWTnbh+NyAkgHUuUcUol1Fe01jik7OdtjY0ClD5UEwbM8KVZu01xeVtdwODkLV
         AdcRTE2YsxP77ziXT1r1+B11pggwhuPwWlleDTv2DgYa6xO9BHqYLobJ8qtTHVHF62p+
         JGIt0xBHEaX3YvwT0JBj03QDBdNSAmBI3VutACEJwX2ITPxp5bU73PFTTlq3vKeJdnG9
         QH4mNbhTgGMcbnGfMt+vLvbTG5IiXOD6qMDzLbR73LV18hBdSfAWIfTheYXzaTbsJo9Y
         YAnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/jDftP+xe+9OnkdBEuxvo6HXn+Khvm1C3VJUpuN6/TY=;
        b=ofZnmd46r/7w5Pjjko+L+INKYjXsMOsWLog6POV3OkyOAuFS5rVojaCZpwsPmDlNVG
         n1DCpC+UlOZS6UkrOm96gbNbDWBmVjkrkuJpUPBSHmsj7EQTCowUIAu55QD/xnuUbvS3
         gxICivbNuPJfXn4jqzjkuIPyuIfIgfKaA23bHIaM4H6/wrPDeRTMVd0eSmhVsDS4SZpB
         6oJkAgX7HyxLVe27KkpG6JZTVD4qS8E176itMLVsnSEMQAhcEJ0iQuPOZOtcfVugtnLE
         X9kHR8mgmr/zdFuzDZx1zGE4TeOWoCoPiB8H82/JgbyKnCcw466tVYg6DhpkEqd3/UjC
         JAKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=fbxZE85w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s28-20020a05622a1a9c00b002ed10bc6c28si1020661qtc.254.2022.04.20.19.20.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 19:20:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=fbxZE85w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhMQf-0007xW-9H
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 22:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhMPi-0006uV-Hm; Wed, 20 Apr 2022 22:19:22 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhMPg-0005Xh-Sd; Wed, 20 Apr 2022 22:19:22 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id p65so6205941ybp.9;
 Wed, 20 Apr 2022 19:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/jDftP+xe+9OnkdBEuxvo6HXn+Khvm1C3VJUpuN6/TY=;
 b=fbxZE85w/o0YAtKSJU6Kmqj/yWhtyee4WFKUyPDvYMvECE1pLZ1QY6F4OxUCn8jGJj
 yPxo+h/xyP/Cyaz0gUSqjzfW29XRVwPzcq0vbX0EvKlKhpqXDenV8Bp3g0AWBUMksuI4
 I0GsaWcPwsyHVk+pJGJz2GVsw1GPjqNXN3K/tQDVfr+jyboS+ywsS7opppzXqlpcfJvM
 4jL/6jktYuRzfBa6EsN8m6peWMb09D7fsnUnU14N+okEKfdkCN3DzjTIXuMBPu3HsFk8
 +T7rA0rc5VEA487+RPCcNFJYspSLzf+PZUxwcATjO7OYpjaeSNPaoWiNSPq4T33lCA70
 hUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/jDftP+xe+9OnkdBEuxvo6HXn+Khvm1C3VJUpuN6/TY=;
 b=03VFVe33wPFlpmNsYdVIz3BybeJOO0dOgcsrxicQGu2r1DjBGrSHNGEPEUh8Ejasnf
 VcnOYgrgG6sHAoMGz54vASJWqRkUcw+Y7b4w8AKEslmov6JH8tcIulbYMBSsGUC+YdRS
 ZioSsx1xF4ifL29KRPlnJ487zdHebHsqMKCuEXcjnT3emG7vIgo7DTSro0RFLa8hiAPo
 x8+U38Ox8Zc4Vp8RnYs1oEAKyq0xJh8f3T/DwIDdFhq4e1r+KvGD/2o6Fmk3Y9ETuPD/
 oSaLQ68sdei3xXbO1nz7vdE/8mXF5TAfB4Vwkd38AHJIiCEuiwa7YCnhXOpFKH4tuy5r
 7DYw==
X-Gm-Message-State: AOAM530i085/3OSvOh/pgAkJinXD4VyL9Y5owpC5zbGs2lQyudxUnKBR
 HyV3YL+Dx1wH6wyaFQah7l9BLqBaqSc2ZOrzeso=
X-Received: by 2002:a05:6902:10c1:b0:63c:d3bf:59d2 with SMTP id
 w1-20020a05690210c100b0063cd3bf59d2mr22451288ybu.99.1650507559277; Wed, 20
 Apr 2022 19:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Apr 2022 10:19:07 +0800
Message-ID: <CAEUhbmUGQ8Jo5zQkCo-4VMfFw6oO+6AUDROEk1H4WHJ-e9Dz+w@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] hw/riscv: Add TPM support to the virt board
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d06lV/SEjZWT

On Wed, Apr 20, 2022 at 1:52 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> This series adds support for connecting TPM devices to the RISC-V virt
> board. This is similar to how it works for the ARM virt board.
>
> This was tested by first creating an emulated TPM device:
>
>     swtpm socket --tpm2 -t -d --tpmstate dir=/tmp/tpm \
>         --ctrl type=unixio,path=swtpm-sock
>
> Then launching QEMU with:
>
>     -chardev socket,id=chrtpm,path=swtpm-sock \
>     -tpmdev emulator,id=tpm0,chardev=chrtpm \
>     -device tpm-tis-device,tpmdev=tpm0
>
> The TPM device can be seen in the memory tree and the generated device
> tree.

Please include a 'virt' board documentation update patch to mention
above usage for TPM, or dynamically instantiated devices with TPM as
an example.

>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942
>
> Alistair Francis (6):
>   hw/riscv: virt: Add a machine done notifier
>   hw/core: Move the ARM sysbus-fdt to core
>   hw/riscv: virt: Create a platform bus
>   hw/riscv: virt: Add support for generating platform FDT entries
>   hw/riscv: virt: Add device plug support
>   hw/riscv: Enable TPM backends
>
>  include/hw/{arm => core}/sysbus-fdt.h |   0
>  include/hw/riscv/virt.h               |   8 +-
>  hw/arm/virt.c                         |   2 +-
>  hw/arm/xlnx-versal-virt.c             |   1 -
>  hw/{arm => core}/sysbus-fdt.c         |   2 +-
>  hw/riscv/virt.c                       | 312 +++++++++++++++++---------
>  hw/arm/meson.build                    |   1 -
>  hw/core/meson.build                   |   1 +
>  hw/riscv/Kconfig                      |   2 +
>  9 files changed, 221 insertions(+), 108 deletions(-)
>  rename include/hw/{arm => core}/sysbus-fdt.h (100%)
>  rename hw/{arm => core}/sysbus-fdt.c (99%)
>

Regards,
Bin
