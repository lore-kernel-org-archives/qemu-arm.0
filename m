Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5292587wrv;
        Tue, 6 Aug 2019 06:57:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx7yoVyKqO2W+XaxYWRSkecv6MGZ1UZHbBCcBDR56hhnKomcM4mOmdaV1GIyLtdZamGKCY3
X-Received: by 2002:a17:906:3507:: with SMTP id r7mr3279265eja.45.1565099845870;
        Tue, 06 Aug 2019 06:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565099845; cv=none;
        d=google.com; s=arc-20160816;
        b=Hj+Scqi7PvQYhvKkcdSdkHbAbINJGyPC7Ae+3AGYZm8xrCxyA1JVerbhKMQacP8WoU
         GmArLGCX2s1iEi1w1PSKYGvGBKBQh5GQ497NdCbHg2ChSZKofHebKZNucI604zWgpseD
         wqRqVB9dcHQQyoR+AK2vLR8MSSzjfGI/9bOV9jmSpHsrbX7+LB7+NJKWEwfjEQZNR3H+
         olWwkDnbuwG0TTHwvFpTEn0aXfFhGXScURV2jpTC4eQ+KQtJ5oL6v5xC+bmp4SP4CmM9
         /tmEGgE43zP1haWoMXZtb//DWk/JDCzzPf0T0jetQcU98NbW3LzxIaZi53vymIyUYl9r
         OYLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d5XpGl0H8WVLCpTddTPdD6q88Je9nInZfwRbtRYnlZU=;
        b=vtojEZrP3xmq3PJaw7ciXB+cdV2gINlNHlfhfhcinpveSmmA2fvII0fkxqFUmes3k6
         iUGdGDLpkl9PnQe1zIhvH55ou/BheuNcQPmBG2dLZ9/kAhAPOOvOjK84QOh3/XHC/7bP
         FCtFaYJIfsyzkX3j/AF0PzHeq8/WXlfC17Z3WqDze/NK8RqdIhJocfr2KgrzgE6KtQB0
         JDcWJ9OgRzVStxQHXPTSKlogTKrRvh5dUVCsMhSnKFMxQrKfFU8pG8KQ+N4gE5Ufr10M
         at13EmSw4A2tpBxQzhpc0eJG0eEgNGq126Vnju20Vgc52wBflI8oHOehyeBk0Yj2UZIY
         LvfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H2XrCZ1q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si26953571ejo.306.2019.08.06.06.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 06:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H2XrCZ1q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1huzxs-0002kQ-VI
	for alex.bennee@linaro.org; Tue, 06 Aug 2019 09:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35692)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1huzxm-0002k1-DR
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 09:57:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1huzxl-0003Jw-Ez
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 09:57:18 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46524)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1huzxl-0003Jh-7U
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 09:57:17 -0400
Received: by mail-oi1-x241.google.com with SMTP id 65so66664414oid.13
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d5XpGl0H8WVLCpTddTPdD6q88Je9nInZfwRbtRYnlZU=;
 b=H2XrCZ1q8VEn7XzP0IRYelYbwrfNyEAhf+DpZ9QXsMguDuuhlw2yDaxS0ga/idyECG
 5bnsPnzb3KmUvILwjlLum39reWALKXGi7D3WFy6oBA2v0LJDJAqTWva66TJ9rD2fcls4
 4G4l9nXYsMNtcFLImKKdDlpg2k9QEFCCZ5DtaLdxSlQ4/MukMPasGMaHVVr/qd8zIfrF
 VYmYaW/Fnd3oC5Ee/vwlNm0DS2Hva59urrnwa7xlaDlzdkHHsRheEcAqNJxORnq+rv1v
 YR6YqOPo8vVGzYftQ457D7hPd/fcNfZhVYgiOP7gKAMbQPRZWqbzQlNDXTim2n/F8LqR
 Z1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d5XpGl0H8WVLCpTddTPdD6q88Je9nInZfwRbtRYnlZU=;
 b=inM4BRt3rzPQJHgJcahuMynRYcnWwS6iCRElVl6TbmItnyzxeN/LvUwPkNXBvW0nCa
 LmecKEYtOTSstlQZj9uZuUKmmhDAA6h2S3NgIupWMxbwYuRAgXswjIj4AnAKQgyfd1eC
 OAv5uLFRCw0aDnLQpe1gfPHu6/oswYsy9LGaW2lXoVwbjmbIA185qYKNncSbm9fsX1fQ
 GypHuNHR+VzrMuzQ0ltg1dThJYULS1fu6hsV604xDTQW3S/xTSy7OPPqvFSs8vOtgbBU
 bhiv7JyfMdjAm7ErJ3QsgVpQlZD+1oKxfveLBVEdKZ2Rr0bzTEFPamEEnp8+Ulh6owzj
 1owA==
X-Gm-Message-State: APjAAAVDc9Hy0nnr9LlEuvFPTau6kyjbGeYeCRhE16ECA3xbBvOGEtkM
 VTRW1HZYOn+xaX8QThIC4Y5fbUUF8i4/7FRjn9XXtA==
X-Received: by 2002:a05:6808:d4:: with SMTP id
 t20mr1881000oic.170.1565099836234; 
 Tue, 06 Aug 2019 06:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190730054501.32727-1-rashmica.g@gmail.com>
 <20190730054501.32727-2-rashmica.g@gmail.com>
In-Reply-To: <20190730054501.32727-2-rashmica.g@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Aug 2019 14:57:05 +0100
Message-ID: <CAFEAcA_OBg6s+qu-DG_N882Gy_FxX3_fxHLa=tzpHfRzY5fdWQ@mail.gmail.com>
To: Rashmica Gupta <rashmica.g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hw/gpio: Add basic Aspeed GPIO model
 for AST2400 and AST2500
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S/qeCqur/7Hs

On Tue, 30 Jul 2019 at 06:45, Rashmica Gupta <rashmica.g@gmail.com> wrote:
>
> GPIO pins are arranged in groups of 8 pins labeled A,B,..,Y,Z,AA,AB,AC.
> (Note that the ast2400 controller only goes up to group AB).
> A set has four groups (except set AC which only has one) and is
> referred to by the groups it is composed of (eg ABCD,EFGH,...,YZAAAB).
> Each set is accessed and controlled by a bank of 14 registers.
>
> These registers operate on a per pin level where each bit in the register
> corresponds to a pin, except for the command source registers. The command
> source registers operate on a per group level where bits 24, 16, 8 and 0
> correspond to each group in the set.
>
>  eg. registers for set ABCD:
>  |D7...D0|C7...C0|B7...B0|A7...A0| <- GPIOs
>  |31...24|23...16|15....8|7.....0| <- bit position
>
> Note that there are a couple of groups that only have 4 pins.
>
> There are two ways that this model deviates from the behaviour of the
> actual controller:
> (1) The only control source driving the GPIO pins in the model is the ARM
> model (as there currently aren't models for the LPC or Coprocessor).
>
> (2) None of the registers in the model are reset tolerant (needs
> integration with the watchdog).
>

> +typedef struct AspeedGPIOReg {
> +    uint16_t set_idx;
> +    uint32_t (*read)(GPIOSets *regs);
> +    void (*write)(AspeedGPIOState *s, GPIOSets *regs,
> +                const GPIOSetProperties *props, uint32_t val);
> + } AspeedGPIOReg;

Please don't create new abstractions for implementing
registers that are only used in one device model. We
have a couple of basic approaches that we use already:

 * just open coded switch statements in the read and write
   functions for the device's MMIO regions
 * if you'd rather have a data structure defining each
   register with hook functions where they need to do
   particular behaviour on reads and writes, have a look
   at the APIs in include/hw/register.h. Currently these are
   used just by some of the Xilinx devices, but if you
   want an API shaped like that you can use it.

thanks
-- PMM
