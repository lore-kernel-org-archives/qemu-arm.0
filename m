Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4293843lfk;
        Thu, 27 Jan 2022 10:38:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyps+ZSd16I4L15mbBkpsMIPMXtIQSV//MakZAbxUNHdJ+XPheSa/joOpOrWOVVqw63q17a
X-Received: by 2002:a05:6e02:1a83:: with SMTP id k3mr3576543ilv.60.1643308683365;
        Thu, 27 Jan 2022 10:38:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643308683; cv=none;
        d=google.com; s=arc-20160816;
        b=Pt/eXQJpxnxu2Azal+HWfFHEf7rv0NaG93zHimsM9LEyVVB/jvfHE9cizP+bZrLpF7
         KRqK7WFn1rZ4l0FU2SSqsWilYBkiHzGXCsFJu3jz3BFuitZU61yHoF5xw8iaAO6nlf7g
         1Lokp2LRGdhnhN0RAMAhhcKenirVfPPEepyoyeJPoA3BROMIJnyJqJDPTa9CZ4Z/zJht
         nqhnw4gLoGwBQ/zN9Pa27ThI5DiZgCr5nGyyPgguWdkCr0/9YiwGmKYJjcCVee+6ubJq
         iWn/rS6b/uN64VVR33GgLrwvF91eFXYkoAUAU5ePaldesax1NVEairipyk/wsbePP/IK
         mI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VxxVhgegQqneBiSoVMvzTyrLA7CyIDu+InX0vZUI1/g=;
        b=GnxGwgBdxWLSqOREOsuZJL88YmJBZG549HOB5h98AY+oBxa93IrjVPkTZ7e6CrmFte
         64BQyDHI34DIC71vp5yneKWNfjuy75RKLL1cMp898D0d4qMZnW533nQx/Pul7q3/G0JE
         8RBBLTIQnUgz5vTFY3dd93745wIEjSL//Mfj2DnrgxUHGQ58aiH6i/RvXaKpkKJcYGfJ
         Ca5+26VCZeUkPjyoFFOYBSa2cmLt8DzJMgFpgbTovaREplpEMC1ts5cA9DK3ccEIUcW9
         mAif8UAvPjsCZ6JgwpBI0A5XGpSvLfJlMWrhLiZditzsa9WDRar1TCGW2vbvSm/BX70p
         /pJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RDuHKZHJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si2797594ila.17.2022.01.27.10.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 10:38:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RDuHKZHJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD9ek-00077B-Hr
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 13:38:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD9e7-0006IU-BJ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:37:23 -0500
Received: from [2a00:1450:4864:20::336] (port=51021
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD9e5-0001k4-Mo
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 13:37:22 -0500
Received: by mail-wm1-x336.google.com with SMTP id m26so141363wms.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 10:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VxxVhgegQqneBiSoVMvzTyrLA7CyIDu+InX0vZUI1/g=;
 b=RDuHKZHJ+gj3/QW7W2eHmabHOZx/33BZg+yMGlrKAMkMFt2l2lyc8hKN/30LR5I0Rl
 M74TZ5reQ4zHFMBqV41KRG35L+8eGxwJQuPJJTNvE7iIypPOwNcQZCqcuIeyPl/XfMVH
 q51AsU26QaueQBKSDv0DANkH13ximmOTHPOxF0Jd+iPHapn/KmREeguGlk4JxJirShRr
 vZ2ajOILDk61cUT9Ktj1Sg1smFVL7Bv2zqXqgz8he599RI3zCnjN5gMqaugUX+Hs2fG4
 puvfYV76zFYBiqx8qDfIIFgNeZY1Vj6c/zVuUzISDhAfHo9A/Hn3XNDOdHXer5dXnoG1
 vk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VxxVhgegQqneBiSoVMvzTyrLA7CyIDu+InX0vZUI1/g=;
 b=wFta2knuqbTYPGpX3Q3yfB5JnAg3DZiwaOpcj44gYbgSLOYlqVcgi6yd2SPKDb9L5h
 VjOiilvW2NBQfbpTw4xuDwOLZ0iTqoOWD/OF9Gx0Xg4LMRtkFAIgRQ1oNnuFDWGdm33W
 uzpKY2am0yeMzXyUXIcgxkjK5M5DH9rov9QFEyvwiPndMx4bVIlYREgocy97c/x/vYu3
 RinFw0GRjxuxuS4ZbOFZad1PWNJKvQZGJmuWzD2trXE0QIeyhNaypBZgXy1m4iOw2DEr
 yPSJUoQ8mBpM0d9BYkv2WsgDlQKEvrrfjUnKjtOcITq//zOY0+Q/SzwRGt8zOHHLnj2X
 hDIw==
X-Gm-Message-State: AOAM533WAzYmvZ4k8GY4RsO0zWIk4AsZjfkU82Wsv/Bg/Pml7JyK+/iL
 J7oU0pqeT6uDd9CMYsLIcYza3k1q8LkbbZ0usH8mlg==
X-Received: by 2002:a05:600c:1e0f:: with SMTP id
 ay15mr4271818wmb.133.1643308639894; 
 Thu, 27 Jan 2022 10:37:19 -0800 (PST)
MIME-Version: 1.0
References: <20220110175607.591401-1-venture@google.com>
 <20220110175607.591401-2-venture@google.com>
In-Reply-To: <20220110175607.591401-2-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 18:37:08 +0000
Message-ID: <CAFEAcA-s4upQppain+2L-GOux8hN5cNVhqS5Q3u+J7fr_7exPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/misc: Add Nuvoton's PCI Mailbox Module
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Joe Komlodi <komlodi@google.com>, hskinnemoen@google.com,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, kfting@nuvoton.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E5Jk/hgZ9+Rq

On Mon, 10 Jan 2022 at 17:56, Patrick Venture <venture@google.com> wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> The PCI Mailbox Module is a high-bandwidth communcation module
> between a Nuvoton BMC and CPU. It features 16KB RAM that are both
> accessible by the BMC and core CPU. and supports interrupt for
> both sides.
>
> This patch implements the BMC side of the PCI mailbox module.
> Communication with the core CPU is emulated via a chardev and
> will be in a follow-up patch.
>
> Reviewed-by: Patrick Venture <venture@google.com>
> Reviewed-by: Joe Komlodi <komlodi@google.com>

Hi; this mostly looks good, but I have a question about s->content.

> +static void npcm7xx_pci_mbox_init(Object *obj)
> +{
> +    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_ram_device_ptr(&s->ram, obj, "pci-mbox-ram",
> +                                      NPCM7XX_PCI_MBOX_RAM_SIZE, s->content);

What's s->content for? Nothing in the rest of the device emulation
touches it, which seems odd.

memory_region_init_ram_device_ptr() is intended primarily
for "create a MemoryRegion corresponding to something like
a bit of a host device (eg a host PCI MMIO BAR). That doesn't
seem like what you're doing here. In particular, using it
means that you take on responsibility for ensuring that the
underlying memory gets migrated, which you're not doing.

If you just want a MemoryRegion that's backed by a bit of
host memory, use memory_region_init_ram().

> +#define TYPE_NPCM7XX_PCI_MBOX "npcm7xx-pci-mbox"
> +#define NPCM7XX_PCI_MBOX(obj) \
> +    OBJECT_CHECK(NPCM7xxPCIMBoxState, (obj), TYPE_NPCM7XX_PCI_MBOX)

We prefer the OBJECT_DECLARE_SIMPLE_TYPE() macro rather than
hand-defining a cast macro these days.

thanks
-- PMM
