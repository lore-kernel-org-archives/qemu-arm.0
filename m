Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3153814njc;
        Tue, 5 Nov 2024 14:38:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNiSQ2aXGIJra+YD17Ku4KE/0FkURZXatMHjL1d9qHlieaZFLdFnKnmgxzBzF4IAuJElKmLwmv0sTl/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH0gFlt4W3US6Zutq4Paykazm4tT4t7f0p22h4snf3LNTONLRssGkeQOXTsBAq71p6zCx4O
X-Received: by 2002:a05:6902:2601:b0:e30:8f1d:bcc1 with SMTP id 3f1490d57ef6-e30cf4ec3d7mr23767386276.49.1730846310444;
        Tue, 05 Nov 2024 14:38:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730846310; cv=none;
        d=google.com; s=arc-20240605;
        b=DYAkZi8c5Gg1U0+XzRNI1oopXHkyPIUoKflKbXV7/Gobp2/5wuga8erSBaCb3jP5m/
         dm7Gm08OfMj3Y5Auor/DBbxE50lzw5zyRUE8PPQ+RGKtcJ+njAADN35UHGFYyBHd/rVm
         zDSecG146Oq88DxW5yVm4zkpCEKdoVFVbqRvVm3WAi4tPZ8OlNfMr0Q+hFgN1gU7kz0S
         y1ELts/2oid0DuzF/ZPgAXzbQJ5qNw1QdsdhpaFUhoOA/k7qN7XdOdIU0QDE6y/cpB35
         7GeNBN/GN445B67R91TdZWfQvrhv7/YYvyfKJJmtxrq3004Cjg/ruYVMkmvbsSKQGoPF
         AsdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SJiDjALYlvcF7sVsSeFOSeRB5eI45ipC94m/GKcDklU=;
        fh=i2/5gUgmcGxfQB6znwnD0rRB7wOLuwHGTRUfChOysrk=;
        b=ivEWRvVXj6/5n3u1yYHJkAAP97fabcrNo6AplxRhkTdSsCDjFhAQR9U1lQ8RaIpfR9
         NH9yTsxwvW9EzwfT6QAWO81/XuJJTWZIiCjT5+Pe8qd02ZqB50F4MFUDzBaZRTNrGWbh
         cloELVaF9Nv7x62oWSKNbF8A8y0IsAZQzx9J73kIgCV5b130HfAUd38uuhYdCF0xxvG5
         4XTtqHCXBNLLpH40sJKMTt3mjfcg1Adiz1J3M2X1ycGc9OcOJ+BBAhsNnDuUgddDrmxx
         ly+R7Cr6CGPULYTKY9VGzcs81gLxLyG11MGUhmk6XULOdCAa9a+DQ2B9jOvMd484pvnR
         n3Fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bXm+q7Oe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b2f6csi155629531cf.18.2024.11.05.14.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 14:38:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bXm+q7Oe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8SBd-00021M-0m; Tue, 05 Nov 2024 17:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8SBb-00020v-El; Tue, 05 Nov 2024 17:38:07 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8SBZ-0002Oq-ST; Tue, 05 Nov 2024 17:38:07 -0500
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-84fd616acf0so2312312241.0; 
 Tue, 05 Nov 2024 14:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730846284; x=1731451084; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJiDjALYlvcF7sVsSeFOSeRB5eI45ipC94m/GKcDklU=;
 b=bXm+q7OecOmoQv8nWVf+8A0BC1ddh179cAauLzRxV6v3C6dfEzvJgpBJpP0CAB4YZW
 8klSKsuXYbaqqL+yT8FOGA+sc5lUPpFqzDzBnYPi3FTTPmORY/wXz7va9SdRNyVnCgY3
 yjlj4rBktNulfHfJn8Rlvalqk+60wLbQhs/3KbP8Vf+uViqCJUrb63GO4tU9qS0M0dz8
 mib+I0KtHX0ZQw1+7EPh+JlzhCwQRyStTzdI5FNjZ5hgyVrLRCOCXj1Hivs9VQrEB7Zc
 tX1nhaqVxkDyAc+vxkK69jk8bMjPr++jgrUVZLtR04VORr7W3v/URLTfBmETYg71j/Eb
 5GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730846284; x=1731451084;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SJiDjALYlvcF7sVsSeFOSeRB5eI45ipC94m/GKcDklU=;
 b=o451SpVzkZ8X27t8UQ310JfJPNsO5cf2ItDCb326nzGXKrAdOu8CeLalPQ8+vafHOJ
 LZwmBEkVja6mRNra2Rzx/72cpab/beOuJmH2v4pur3Z3KndGdJ6n/gDWNPqCPfjC9zx2
 ScJGzEn1Hdjy2CKau/ay/LPqWZQ7/98NSsNAXt1NOyFSDbAtsnjytjXNdV4lGW3lnk5w
 Tb9t+p5EwICP2uwYycaGmDDT1aYGllpRb9vIFTQatFpplDArfeox9G1/JrKWA3fer6vL
 t1CbdOb1PGu7JHpFmrbZlUJN7aiLt6Sk/e6DnN5R3zSyfl/f/fRXVzXf98IN8qSDZJ4H
 Hl+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+11Sa61sO+ApMywyVPotv2yhmepjJ1J/cYOp/zL2kR5wHDxaB7BiI1CcuCmEv/lF7Bt3+/D68lw==@nongnu.org
X-Gm-Message-State: AOJu0YypdcA1QmeuQgALlllcjbDVBfty4PaIGxxXmeFO9SYZdgALz1UZ
 rRbup6qc2cTWkhYduc/uWHdCfAilYpR7qGfzG+JJDEvps6Bn5G24zc7Mlqw/fFAgcUZKYxSg7fd
 yH++SN2IK8xjNpSurtzyXcHyl//E=
X-Received: by 2002:a05:6102:94f:b0:4a4:7928:637c with SMTP id
 ada2fe7eead31-4a900e43a75mr24378915137.8.1730846284252; Tue, 05 Nov 2024
 14:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-5-philmd@linaro.org>
In-Reply-To: <20241105130431.22564-5-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Nov 2024 08:37:38 +1000
Message-ID: <CAKmqyKNPd=X4HjeJb7__U8bd0gJbTYVzCKzcecbe5OsNB3i6dw@mail.gmail.com>
Subject: Re: [PATCH 04/19] hw/microblaze/s3adsp1800: Rename unimplemented MMIO
 region as xps_gpio
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: u13zUJdunr/9

On Tue, Nov 5, 2024 at 11:05=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> The machine datasheet mentions the GPIO device as 'xps_gpio'.
> Rename it accordingly to easily find its documentation.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/pet=
alogix_s3adsp1800_mmu.c
> index 37e9a05a62a..581b0411e29 100644
> --- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
> +++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
> @@ -124,7 +124,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, ETHLITE_BASEADDR);
>      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[ETHLITE_IRQ]);
>
> -    create_unimplemented_device("gpio", GPIO_BASEADDR, 0x10000);
> +    create_unimplemented_device("xps_gpio", GPIO_BASEADDR, 0x10000);
>
>      microblaze_load_kernel(cpu, ddr_base, ram_size,
>                             machine->initrd_filename,
> --
> 2.45.2
>
>
