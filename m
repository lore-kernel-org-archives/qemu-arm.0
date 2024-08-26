Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp886721njb;
        Sun, 25 Aug 2024 17:07:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBdPF36ngW+NbcjcDLC9goAxVvD0wpsOvKCPUflijHnCIMRPxP47thiqsj5G7gFBKjvZWq8BT/lbmmCw==@linaro.org
X-Google-Smtp-Source: AGHT+IHX1M+r1knPlpAmjzajbQFMDv78lN3Z3t/Q+ILwAAf9xtOpRFoTNhDeXw/nAkjYJo6ZSJor
X-Received: by 2002:a05:6122:2007:b0:4fd:18e1:ab0b with SMTP id 71dfb90a1353d-4fd1a52c65dmr11617131e0c.4.1724630824244;
        Sun, 25 Aug 2024 17:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724630824; cv=none;
        d=google.com; s=arc-20160816;
        b=he6vLa1rh4Djwzm+Nfrp8/YjHT+6zUrVq3fhJl68Lo2Y5qydIFN93fJikFJnR/nCSf
         fp5u4tMvI+lAqsoSc9iHl9fyOoqhhCWwgiCX1KKV8EPVNqNCyjEwRYqlUngW7YLLyoo2
         3YGLl5Z3uzE7SDVBclKjvomOeAVjWsAc46yBYpWjDA+VIbKTQm9RnsDyy5VzOtBBmq+a
         fmATu4i2jpIbnxwNI+ItwIz8TXrZGZr0X4ozYgQQtU3QpjTmFXXhRuKQMEIwvbpq43ae
         I515iL+exe6Bkl2NuucIW2DHAKfVclK3rpd7uyDVK+bNBpMMT/dbHzAgGnKpiPzLjnDT
         JrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=c8KpSH2/8UXSgFzTZXJ5Acjckq9KLqp6+mKVmD/Y0+c=;
        fh=1Y8/mOYPhwe8xlK9cswlYGWmHMeQtgNupvaxGEV8KXc=;
        b=ugtJktvF+lG4ByZbMQfK25fiEMCq+IEuzd2Q/8JNRBf8v634InbGw9iz3v1PT9e9vB
         at8IOJUDcoOtRnn8rhWQ6z508yI/yi1Gx8P4SKYYFKPKJLk+CK4ytx3nZfEA35CI2zSF
         TIbzuZPkeayXWFGToOYkEzs/ZJJ5GDfws9VZl6PAjcmv6hP2hq64lrEPFqydM+swR/hS
         fOb01zlg4uYL6zSba5OqgcFopdOPYfEOXVhVIURDyOZVtQxYYehdGGEZYZ8UjWrtAJy9
         IDhedGOs9gxnYx+yJTbbjycouhx4a0uRHME3CDAoFkEDUX/9f7LisxpRhR1kPrpFZemM
         OtyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bxim3B3I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe1a8d45si59273191cf.377.2024.08.25.17.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2024 17:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bxim3B3I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1siNFq-0008QH-PG; Sun, 25 Aug 2024 20:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1siNFo-0008J4-UI; Sun, 25 Aug 2024 20:06:40 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1siNFn-00011v-82; Sun, 25 Aug 2024 20:06:40 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f3f25a1713so42864411fa.2; 
 Sun, 25 Aug 2024 17:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724630797; x=1725235597; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8KpSH2/8UXSgFzTZXJ5Acjckq9KLqp6+mKVmD/Y0+c=;
 b=Bxim3B3INC6ibFiZ3G4rB1RLyCm4GgJMf6rtW97g53gZU+7yM1b7DNfr0mBWn/THqn
 nFtRf3iy1qiOCcs6Cpvckh6iz3h3ty/H4D+vbbHQBLx70RTFVldNhuuOOnwJ0CB/dVB1
 fjOBh6PQ7YKi6wtlG8SkPIWZRltNdqNUG6Q2C4veCeB1uI8AcZzC7bnzoB4nTmQ1Pnk2
 ut9IJY6yiIS4Y5fCKK+ZD5C58kkrCvCN/wU4nLwMfPUgFqPvAHuYfMRrosRBuQ4VMf6C
 K7yW26YaI/q08Ku3Wuh5I3u9PEm407odMe7hCjbktEFnsbSHebFUnBdj2/a+dwzSR4rp
 6KQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724630797; x=1725235597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8KpSH2/8UXSgFzTZXJ5Acjckq9KLqp6+mKVmD/Y0+c=;
 b=ON5KQj0+5nTM05SVpL4y7kcjVd7Nxu0u72bvdN2qupdzLZSthJ+Fxxv/JG657Qai7F
 zAbG4cOOxBdtqjlIoi8eDfDRHFOjAHNlKOqVsF0gHQQ/MP/lzfIpxWol1OZ6I5mZbDfb
 GGMH8gI6oIr6tSRYaBn/tDFc0/jh2cB21P2Vv/zHzYzm2YbztCPfNqdIg+GfbvT8TDLr
 UFuqpnqwPuXLzYP1mC7LcyXn6kPUmVQjQGSDABs8xDWE6hOE85j5beGMVZeClYFWJjYc
 PlrtvUIav1gmety8GnisiA09NzD50pYY7xbwRTMRVmvm2LXaM+AdUFpKsy6eXAcUPZAb
 XCgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiH/BjgVrL4/tClkpj4dzLA2VUHyQSE6MXAi8FMUVQxoSmc6PebkbbazwbUDLzoCI1jLmdHGBwjpjv@nongnu.org
X-Gm-Message-State: AOJu0YzGoP+nfCL+gxKQ5E6xYD3AHPNzhM4DK+DFAV43Tendo4bfRzja
 nzBk1uhw7yUT+l2nE5OjYMtoD0Rbe79qtnUN77NvVAqR8EdFkR1f1QIMeMXc0F0JX9rBN2fmDrM
 BlvlMOXqd3dqhLKig/MfusUCFiGQ=
X-Received: by 2002:a2e:be8a:0:b0:2ef:251f:785 with SMTP id
 38308e7fff4ca-2f4f48d62a9mr59780031fa.1.1724630796177; Sun, 25 Aug 2024
 17:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240822162127.705879-1-peter.maydell@linaro.org>
 <20240822162127.705879-4-peter.maydell@linaro.org>
In-Reply-To: <20240822162127.705879-4-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Aug 2024 10:06:08 +1000
Message-ID: <CAKmqyKPj6fBcUG0wpzBVx4U+mYJufFm=W0t_Cy3pKQ5kj69W4w@mail.gmail.com>
Subject: Re: [PATCH for-9.2 3/6] hw/nvram/xlnx-bbram: Call
 register_finalize_block
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=alistair23@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Z0kj7BVubUhH

On Fri, Aug 23, 2024 at 2:22=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> The TYPE_XLNX_BBRAM device creates a register block with
> register_init_block32() in its instance_init method; we must
> therefore destroy it in our instance_finalize method to avoid a leak
> in the QOM introspection "init-inspect-finalize" lifecycle:
>
> Direct leak of 304 byte(s) in 1 object(s) allocated from:
>     #0 0x5641518ca9d8 in __interceptor_calloc (/mnt/nvmedisk/linaro/qemu-=
from-laptop/qemu/build/asan/qemu-system-aarch64+0x294d9d8) (BuildId: 4a6
> 18cb63d57d5a19ed45cfc262b08da47eaafe5)
>     #1 0x7ff1aab31c50 in g_malloc0 debian/build/deb/../../../glib/gmem.c:=
161:13
>     #2 0x564151cffc5d in register_init_block hw/core/register.c:248:34
>     #3 0x564151d006be in register_init_block32 hw/core/register.c:299:12
>     #4 0x56415293df75 in bbram_ctrl_init hw/nvram/xlnx-bbram.c:462:9
>     #5 0x564154891dc1 in object_init_with_type qom/object.c:420:9
>     #6 0x56415487909b in object_initialize_with_type qom/object.c:562:5
>     #7 0x56415487a93d in object_new_with_type qom/object.c:782:5
>     #8 0x56415487aa11 in object_new qom/object.c:797:12
>     #9 0x56415507883d in qmp_device_list_properties qom/qom-qmp-cmds.c:14=
4:11
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/nvram/xlnx-bbram.h |  1 +
>  hw/nvram/xlnx-bbram.c         | 13 ++++++++++---
>  2 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/nvram/xlnx-bbram.h b/include/hw/nvram/xlnx-bbram.=
h
> index 6fc13f8cc17..bce8e89d905 100644
> --- a/include/hw/nvram/xlnx-bbram.h
> +++ b/include/hw/nvram/xlnx-bbram.h
> @@ -47,6 +47,7 @@ struct XlnxBBRam {
>      bool bbram8_wo;
>      bool blk_ro;
>
> +    RegisterInfoArray *reg_array;
>      uint32_t regs[RMAX_XLNX_BBRAM];
>      RegisterInfo regs_info[RMAX_XLNX_BBRAM];
>  };
> diff --git a/hw/nvram/xlnx-bbram.c b/hw/nvram/xlnx-bbram.c
> index 09575a77d77..1bc58e90ad0 100644
> --- a/hw/nvram/xlnx-bbram.c
> +++ b/hw/nvram/xlnx-bbram.c
> @@ -456,9 +456,8 @@ static void bbram_ctrl_init(Object *obj)
>  {
>      XlnxBBRam *s =3D XLNX_BBRAM(obj);
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> -    RegisterInfoArray *reg_array;
>
> -    reg_array =3D
> +    s->reg_array =3D
>          register_init_block32(DEVICE(obj), bbram_ctrl_regs_info,
>                                ARRAY_SIZE(bbram_ctrl_regs_info),
>                                s->regs_info, s->regs,
> @@ -466,10 +465,17 @@ static void bbram_ctrl_init(Object *obj)
>                                XLNX_BBRAM_ERR_DEBUG,
>                                R_MAX * 4);
>
> -    sysbus_init_mmio(sbd, &reg_array->mem);
> +    sysbus_init_mmio(sbd, &s->reg_array->mem);
>      sysbus_init_irq(sbd, &s->irq_bbram);
>  }
>
> +static void bbram_ctrl_finalize(Object *obj)
> +{
> +    XlnxBBRam *s =3D XLNX_BBRAM(obj);
> +
> +    register_finalize_block(s->reg_array);
> +}
> +
>  static void bbram_prop_set_drive(Object *obj, Visitor *v, const char *na=
me,
>                                   void *opaque, Error **errp)
>  {
> @@ -537,6 +543,7 @@ static const TypeInfo bbram_ctrl_info =3D {
>      .instance_size =3D sizeof(XlnxBBRam),
>      .class_init    =3D bbram_ctrl_class_init,
>      .instance_init =3D bbram_ctrl_init,
> +    .instance_finalize =3D bbram_ctrl_finalize,
>  };
>
>  static void bbram_ctrl_register_types(void)
> --
> 2.34.1
>
>
