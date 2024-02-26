Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2080812ejf;
        Mon, 26 Feb 2024 06:15:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNlrcw8INf3wv1ipbZ/6QmDHMFMcETBpU1AbznVQkoQ7QvOzVP7bxJTuMWRI+7xKzqg0+772IVMbwVtsR5Ybb0gRhfVdLN
X-Google-Smtp-Source: AGHT+IF71z66mobglTQmsLFh/324bwtyydG8h9MaC1XaKeuWVr0FuwV7qQB4tuRlMfjsNUcRtVjJ
X-Received: by 2002:a05:620a:190e:b0:787:b0b1:dd85 with SMTP id bj14-20020a05620a190e00b00787b0b1dd85mr9354179qkb.49.1708956936632;
        Mon, 26 Feb 2024 06:15:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708956936; cv=none;
        d=google.com; s=arc-20160816;
        b=oCL4nVhTfpc2gd0KGwbOQWpxo74uf2fE26cwLT2JB4/ZxBSUwJODsVz2r0woENWJkz
         pea+ERPaRmnxHd3PH9jHRqDOWUxyK5t17YM4yZOh4a1bqYlIeqvSsUhOo4fAjvmtKZD1
         Hc+DiepkoXSWogBd7XhQ3sJK97afNu1jd6Oq29lhstyN9HMq3xChiHF0yKsHigEWgUl5
         zZnlGpoJU/8SuCckO0Qn8ctWll2TffgLfC9bFYsmQPA54Tr5VpBm/LTxovW1aaQQFDhf
         /nFtPXC+4aOUFQm/DrlSuzLxLW+ANXSslVChdtcn/T8fCr7Dg4ism9eRCa6a89Fzhh5b
         JnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jieytYaQ+nN4bXnK0Fs+GW555aeEe4W+nRHFe6bD0Og=;
        fh=AnbZTpdxRsnyFgN3WGwR9NbMyjtHo2ocb446TcEAjlA=;
        b=Xv71qimed6Y2dY22R6FVrwUgHp+Ix1bAnVBIGW4d8tWsWZbu9/TkFNMQbIOWj2UYtk
         1Pr8RyoVjZWYU1RS8nYoi2okm15QqkgdWCiHF8fjFXJGpM+JmmH/Jtm4KeSRlPVISZrO
         3fTinRjYOC5kemebsprvDInVvuzompUmBA258zBMlXnrK4Db4qkdNsKZ1s3GbydMYMo5
         WBXjgjqGEqGiZm1gc+WS+bDdkeF7Uk8R1+4NVzZ9Dj1npJ00o6zFArBuJpHPuBg63FMK
         Z0CUnWyWdMjXCk3SmDqAno2WvnEuTEjZglH6f0bRZLQCZQuyho+LL/6VipPeWA7PjRxv
         D5lQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UqQWX75R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020a05620a404700b00787b59e5659si5609242qko.200.2024.02.26.06.15.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 06:15:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UqQWX75R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rebDJ-0007TE-MP; Mon, 26 Feb 2024 08:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rebDI-0007Su-6A
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 08:40:12 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rebDG-000562-Df
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 08:40:11 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-565d1656c12so2283069a12.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 05:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708954809; x=1709559609; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jieytYaQ+nN4bXnK0Fs+GW555aeEe4W+nRHFe6bD0Og=;
 b=UqQWX75R4GRiaj4lmFuDFlBtOrb0408soJhfPLMeuc8l1OBvVCOcIja7D/KRtnyihl
 BUvyJaZGNvGPY10KG3EI/GqB78w3esR6noZ9/G4qpdXUBPHDvW7p2b4JOb4UF7NYmANL
 yCfVaJ3sRSaNIM6HNaPsoUEGFibc3uxAwk2P4Fu0OfqWmkadEOM7zyy0omzwifxrv5ZF
 EjezDVQgvuGPncWvXkqyYmT68kQTrYCTEg6v6jaCNWaEpvPsI1otiLD3DnAydh1ZOQEA
 b8BNIbd8Ki+VSCx6u4z5lJ6RYmIhmnqd3F7/sqUx8ETSBSFKQdMpmtoQxWOgZ9r1/blV
 buMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708954809; x=1709559609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jieytYaQ+nN4bXnK0Fs+GW555aeEe4W+nRHFe6bD0Og=;
 b=tzfapli+m7u78h88I92F3uhWjtTpijO33QBnXgef2pRH1mTM6kEfVwC3h2/KJ93OLC
 ip5MYJBlHnreOzvN5uVs+wvyzgvBYw5pmLSLMFJy8eyh7kwvZXqXoC9mKpAju9dPkudS
 6tcTZjul627M+sn2lb0o540tuubsXRuncQF2g0u0n8dpgvOsbuLhj+I+7Lx2OUr7JtU7
 XObndExk+11Q+u+jeyfkz2pnrnNK8k72sRrdC2o29DYl4Vu4xgMZMYtrFsYYFCw+4Sgd
 18jo0FjrbfnSHS6qnXrXCh0gUUPUKl4Uik3g2WXtVMnv+a4DyXLGI9XUsjC79LqhDTuM
 0CnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2oY5tx9n9wKwCLK3OO4NJKCg0noOC6FBYT/uEsO0p+itxj9uKA8El9G1g9uWfNUR5xWCZdzn7rwcRFNqllTOByGlG
X-Gm-Message-State: AOJu0Yw3iHJpoJuDUwX+h9AH/718lTqW/xiHmzb3WoU58aJu9YkDDGXK
 zuzT4ZYDdem8a5rFOM+pl8zjfg7dgqNmjq6FMr8R3QAhoiKQs/cIxwTQLHOo7ttIZoAP9/mhgmv
 HNSoh7jl14rYbOONEukrjVWaU93I6pog6ASUgiw==
X-Received: by 2002:aa7:c39a:0:b0:565:ff41:472f with SMTP id
 k26-20020aa7c39a000000b00565ff41472fmr1624282edq.21.1708954808876; Mon, 26
 Feb 2024 05:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-12-sergey.kambalin@auriga.com>
 <2ab7b523-816b-409b-a58a-f09e3f71ff8e@linaro.org>
In-Reply-To: <2ab7b523-816b-409b-a58a-f09e3f71ff8e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 13:39:58 +0000
Message-ID: <CAFEAcA-WwWQnAQTmoCixaW5aeRWrdx__YoSHp_VyGEbk-rOkpg@mail.gmail.com>
Subject: Re: [PATCH v6 11/41] Temporarily disable unimplemented rpi4b devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o7ktQcQhQTzY

On Mon, 26 Feb 2024 at 13:35, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 26/2/24 01:02, Sergey Kambalin wrote:
> > +static void raspi4_modify_dtb(const struct arm_boot_info *info, void *=
fdt)
> > +{
> > +    uint64_t ram_size;
> > +
> > +    /* Temporarily disable following devices until they are implemente=
d */
> > +    const char *nodes_to_remove[] =3D {
> > +        "brcm,bcm2711-pcie",
> > +        "brcm,bcm2711-rng200",
> > +        "brcm,bcm2711-thermal",
> > +        "brcm,bcm2711-genet-v5",
> > +    };
> > +
> > +    for (int i =3D 0; i < ARRAY_SIZE(nodes_to_remove); i++) {
> > +        const char *dev_str =3D nodes_to_remove[i];
> > +
> > +        int offset =3D fdt_node_offset_by_compatible(fdt, -1, dev_str)=
;
> > +        if (offset >=3D 0) {
> > +            if (!fdt_nop_node(fdt, offset)) {
>
> Peter, I remember a discussion where you wre not keen on altering DTB
> for non-Virt machines.
>
> Since these devices are all implemented at the end of the series, why
> not add the devices then the raspi4 board at the end, so this patch is
> not even required?

I'm not super-keen on it, but as you say it goes away once all
the devices are implemented, so I'm not too worried.

Doing it this way around would let us take the first 11 patches
in the series into git now (they've all been reviewed), which
gives us (I think) a functional raspi4 with some missing devices,
which seems useful in the interim until the rest of the series
gets reviewed and committed.

-- PMM
