Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1437747lfc;
        Mon, 8 Feb 2021 11:31:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHXOM3xZC4omsj7Gk+MitPwMu29mHy4nFO0pZPkmBZ8Kj+zds44TeqdXUxtmjC7xl5zD87
X-Received: by 2002:a25:6082:: with SMTP id u124mr8780959ybb.214.1612812679884;
        Mon, 08 Feb 2021 11:31:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612812679; cv=none;
        d=google.com; s=arc-20160816;
        b=CmkjPt8a31Y8vHl6q6UpSvBFNI31xqhECcYH8d3IbwTc+vwP/OG26xLDQrbkIeNUce
         gMsgPAsjcNwBWXl+KBoi6lHH4wMgpVGGgBjylaHff8It/bC3HERouIfsuxE8RPLSOA7L
         OkS7ZOBezVae/wABKm3TkIxs/68F1DoSCSaWat8pTaZOvCzruymnxOcnD2zQm0N0bjGN
         q56K3/r94JCl9Hr1MwjeM/57Ty9CVRto5YEIBEeM9OvYPB2zbMBS2jBgXsH4Eg3gcryn
         esYpp/KVOe98zJxdhrTHAfTewdts+TlOGsAgHk+4vt/CXNOkfh4k0dsAXuzhmnWi+Pzv
         eEjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imDRYnZAzNCT9pBp9Ie6odVJ++x+poW2F27CZWJK/20=;
        b=xx/hNycSAb3wq8gHQELmaPd6+dT3zKIrcQkE49gndK1qXZwTUQmr8Ou2It2BMlHvAI
         /5ioL6XAsd9VEmBYjcoLJf4x9iwWT9NjSE99EZy47ZVTQ/WYhWZ0Fq4ISEEIbDmYCzit
         S568XSEHxIxbsu5fmmRyRn+HKC5+2kfQkyvfaYTwYko+xc4TPEzaV4HoPJpBMRk+FfIC
         WvPi800V/KCob3BvDCydLxy0015vHbHrDBgFgisCow5/UlOIWL7EIbev36Z7v74kf2b7
         NuedncI2wcUn8cxKwbvGh7dTMlGSlWTF2RbOEENwKI6M1hSVC+OgFSHeKktCXzmDlLSP
         zFuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TMRd44mp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si19909134ybl.242.2021.02.08.11.31.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 11:31:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TMRd44mp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9CFi-000165-Sa
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 14:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97nw-00061E-Mq; Mon, 08 Feb 2021 09:46:22 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:39963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97nn-00065F-LN; Mon, 08 Feb 2021 09:46:19 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id i71so14794274ybg.7;
 Mon, 08 Feb 2021 06:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imDRYnZAzNCT9pBp9Ie6odVJ++x+poW2F27CZWJK/20=;
 b=TMRd44mpI4Ewt42B5PYBWwSGUDQxNOSwBZlF3AebmQ5ve27OKfjWdKlNTRGb54CXjY
 kLHYgVSOZAJ91ju/ysbPSM3x0WVJG/hHrgEAaKPn723b4Ix3UaIDIqG9YxXFDwXwq/St
 c0CiwchcE9/+AfpGKBCgdJBDBxfFA/4KnSzTk4Un7NF84JyM9+yx4VWrIal3oURFOj31
 CqX/5P6N2w0B7CZTZeHIU2x3tTmKc0ROgb1voPoSPoadgr/kH9WDqtIEnGz+7uLVjqMB
 cRHRnOu7rKz5KksVYR8bMgNgxxTYhJQhlwyOV+Ez5TwZVWNzdZpu9hpItcaAcbDU8mIs
 t8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imDRYnZAzNCT9pBp9Ie6odVJ++x+poW2F27CZWJK/20=;
 b=eiqZweKIdM5eT7/Pmr92JDemyMJkOfWC//LauLtbh5uaFaAdymK5m8A5P7e1bnVvQp
 DccXXIe5TaqA9Z4EYhQcgqepcuGvreHtAJ7QI5PebgXjNa2C2MHOohwp5MVWBasfVsfz
 rJTCQzLls+jJ6jFH6Qr30DH/nSbS78i5hhaUzl5zIXSfAy/K+Mf6ivOWXS6mR7SMuU30
 lIbrm2Xi8t3c7ZKur72XGUz2DhzTRrynPdV8IT4VZguNii2kjgs8gba4Z1+AM8WrY5jq
 +HsTaC4rSNPqiPtYty7C8x3bAsBaFlHznHHsfQsUf1kb2N5qwst/0uvqwvtXaYw1kYxH
 +2Cw==
X-Gm-Message-State: AOAM531LXV0P+THRXTFj3I0rIhRQSohLbu1T9IVCLYmldWB5nWYUZqYA
 m13qrzTDBqn82CiSaK5gALat0D4hvrtxCFA4loU=
X-Received: by 2002:a25:7d01:: with SMTP id y1mr26879364ybc.152.1612795559313; 
 Mon, 08 Feb 2021 06:45:59 -0800 (PST)
MIME-Version: 1.0
References: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
 <1612761924-68000-3-git-send-email-bmeng.cn@gmail.com>
 <20210208124425.GI477672@toto>
 <CAEUhbmV=QLCuk5_bymrVNPO_vEU=R1A3urAaqhnNAgSGpiTsGw@mail.gmail.com>
 <CAJy5ezooJ21SAFhR2Pf=1aAwBkPEUivbCawZy-geCx+g36EP2Q@mail.gmail.com>
In-Reply-To: <CAJy5ezooJ21SAFhR2Pf=1aAwBkPEUivbCawZy-geCx+g36EP2Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Feb 2021 22:45:47 +0800
Message-ID: <CAEUhbmVZr0pAW86kYjiXryN3cOaPc2LmrH9=fqLQUUdJrKX4Cw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA
 support
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 francisco.iglesias@xilinx.com, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aUdtQEf0mINT

Hi Edgar,

On Mon, Feb 8, 2021 at 10:34 PM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
>
>
> On Mon, 8 Feb 2021, 15:10 Bin Meng, <bmeng.cn@gmail.com> wrote:
>>
>> Hi Edgar,
>>
>> On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias
>> <edgar.iglesias@gmail.com> wrote:
>> >
>> > On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:
>> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> > >
>> > > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
>> > > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
>> > > crash. This is observed when testing VxWorks 7.
>> > >
>> > > Add a basic implementation of QSPI DMA functionality.
>> > >
>> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> >
>> > + Francisco
>> >
>> > Hi,
>> >
>> > Like Peter commented on the previous version, the DMA unit is actully separate.
>>
>> Is it really separate? In the Xilinx ZynqMP datasheet, it's an
>> integrated DMA unit dedicated for QSPI usage. IIUC, other modules on
>> the ZynqMP SoC cannot use it to do any DMA transfer. To me this is no
>> different like a DMA engine in a ethernet controller.
>
>
> Yes, it's a separate module.
>
>>
>> > This module is better modelled by pushing data through the Stream framework
>> > into the DMA. The DMA model is not upstream but can be found here:
>> > https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
>> >
>>
>> What's the benefit of modeling it using the stream framework?
>
>
>
> Because it matches real hw and this particular dma exists in various instances, not only in qspi. We don't want duplicate implementations of the same dma.
>

Would you please share more details, like what other peripherals are
using this same DMA model?

Regards,
Bin
