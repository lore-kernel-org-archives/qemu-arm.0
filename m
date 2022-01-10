Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp769756lfj;
        Mon, 10 Jan 2022 02:51:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBGuCQQmr2w3nD6BUIcb6QXIIOCdKzwiiDPYaVVkH2+p1zlwCDXSvVmPY/hJOv4qU0BgLD
X-Received: by 2002:a25:4b43:: with SMTP id y64mr27250173yba.367.1641811879566;
        Mon, 10 Jan 2022 02:51:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641811879; cv=none;
        d=google.com; s=arc-20160816;
        b=ul4yoPc4aAiZsunZs1ph5O3kKfjAHpp6S7ZNsrGYkik/BTB85qlc0x0a5OeoUyyB5L
         MFxO1q3wda3dwq2pJScTfJCCPq3A/7C+vtH9cp2SpOQZqDbugFUdlPBXzRxlKTISHSeJ
         JxMHmaeXu+f8fVBNJ3+JccRMBRXpyYt5as7VbwhvIagALcyJ/JnaYzRId1T/Zsctw9Wy
         Fp1VgOCjhXyeWz/GYFMfzESxDdFS2ky8RCMFfDfmbDveo+svlcdCZoYUsYxKQ2F7LpZk
         tPmlFoEg6vCcvXXSeKcm4GKx5qpwywGPZV1omHHbvpLKQrVqpWlfomsOuUCjjgDGWAmv
         PnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wW9hVxsvVDXX4B56LPK2cwvJhGiFnWtKGSFCLZZubDM=;
        b=qHQiO9Zy0XKZxqdAftyXcipkpkq6R2RVZOeJxrPAKfG4VC+ZFCsYk6USyiQTcyEQbP
         LjTmUvOjLlsw1a9u/VUfj1zYMAzFNM9Kff+3NNso0R1LKfbLH5ekoxGsEGQ3MIskf0D+
         AcaGFh7JETlSjrDR9R9FA7//ZHEayjBYLIEqEYFWWeviQf9pt1+gv+OVqgfSXEPgYCak
         8rlQf8/Ijw1Z2uisp1VeTPGe+QxyHmzd9/cTKkQQjbC9oJamiDQTv7ihJVT8wCbS8BnZ
         MxPpvAP7Co83/5qK3xeA7eICzJRsuTmL4IzdTQZYHu97Bjizowum2nPjr5Ix0mCzQ/8b
         yXNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ichGp+mF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si6615230ybu.800.2022.01.10.02.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jan 2022 02:51:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ichGp+mF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n6sGk-0001eh-VA
	for alex.bennee@linaro.org; Mon, 10 Jan 2022 05:51:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6sGU-0001ba-Mx
 for qemu-arm@nongnu.org; Mon, 10 Jan 2022 05:51:05 -0500
Received: from [2a00:1450:4864:20::429] (port=35692
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6sGE-0000Jc-DJ
 for qemu-arm@nongnu.org; Mon, 10 Jan 2022 05:51:02 -0500
Received: by mail-wr1-x429.google.com with SMTP id e9so24429013wra.2
 for <qemu-arm@nongnu.org>; Mon, 10 Jan 2022 02:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wW9hVxsvVDXX4B56LPK2cwvJhGiFnWtKGSFCLZZubDM=;
 b=ichGp+mFN9shaZHz4pnodUX5IsYwzzj3Xr10P1jS1RRCf7scsfy/L+W6TYEOk64QHu
 4OMr8mxYTJ8bxqLukjNUfn9Ic3j8SAuQgoDsIm6FEdgiHs2KLZ4tDQzOXHJ+XQu/TtAQ
 GN4mOYnfup+beaW3wbBrn9XyZ3WSKhDS+c18QmRLxQ2IrxrLDANuQxO5S/QIJx8LnK4D
 bcxYzfue4oJK1aF5v+hIELNQacvjfE62kMAx0pWc+OUo0IXeUS60UkCpQZZgdSYFJJiz
 IHt2Fec5W6eHhAFZURXynusSPztLpJ6Sc9u+iw+wWcY0eHOqUbwDMrjN+28YNtYKW7/3
 +WyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wW9hVxsvVDXX4B56LPK2cwvJhGiFnWtKGSFCLZZubDM=;
 b=DQYaiuzjiJYc8cyRbVdQXjBKj+QXvCOAYXgyZW+QzUKIQ7tdaoEz0+xO5e/Wex6r8A
 ZvGUjYgyF4zzV8STGjM1nDQRL//VdjPiOlSV+c2/ZDZdzsTgfJVtkK4b0hHNAVcPDHPh
 cBv0lntCvQyeOAA0qZ+yslSdjYJFE/6+vY3XcoVQq8aZTDCV1lptUkbin9QbRI3PDSVE
 r33aykRyDoPQ2KmAc001LFwY5SaLByHjNX2IDSGz0255ppM30t0wP3tOCRBTI85L+/wk
 iODDV1bYi27tGiEtYsb88gt/mRqimqIIo7q8rNV8wVC4VV2hq1cPQ48LCywGbn6LYz6k
 2Xrw==
X-Gm-Message-State: AOAM532orT0JSubV3ZLYIpzGsReECJ8HpY1jQgVSGz4oKbvp2ZiFbV9+
 +BRW+v0eXHF+mxzbBW4De29J8RCarjZaSqj1+/Vsyg==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr62968673wri.295.1641811843868; 
 Mon, 10 Jan 2022 02:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20211203233404.37313-1-gshan@redhat.com>
 <20211203233404.37313-3-gshan@redhat.com>
 <CAFEAcA8hd000vwp8A602uw4yueea4uU0xttELcC8sn34X+N5-A@mail.gmail.com>
 <3528fa8b-bfa6-2127-dfe6-4135b3b0989f@redhat.com>
In-Reply-To: <3528fa8b-bfa6-2127-dfe6-4135b3b0989f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 10:50:33 +0000
Message-ID: <CAFEAcA_qW9d9ACZFEi+K+yKJMPAESMQyU+O5JLOL934gdXk-Vg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/arm/virt: Support for virtio-mem-pci
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: drjones@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, jonathan.cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hLvVrtX+NGUB

On Sat, 8 Jan 2022 at 07:22, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Peter,
>
> On 1/8/22 12:40 AM, Peter Maydell wrote:
> > On Fri, 3 Dec 2021 at 23:34, Gavin Shan <gshan@redhat.com> wrote:
> >> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> >> index b20595a496..21e4d572ab 100644
> >> --- a/hw/virtio/virtio-mem.c
> >> +++ b/hw/virtio/virtio-mem.c
> >> @@ -125,7 +125,7 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
> >>    * The memory block size corresponds mostly to the section size.
> >>    *
> >>    * This allows e.g., to add 20MB with a section size of 128MB on x86_64, and
> >> - * a section size of 1GB on arm64 (as long as the start address is properly
> >> + * a section size of 512MB on arm64 (as long as the start address is properly
> >>    * aligned, similar to ordinary DIMMs).
> >>    *
> >>    * We can change this at any time and maybe even make it configurable if
> >> @@ -134,6 +134,8 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
> >>    */
> >>   #if defined(TARGET_X86_64) || defined(TARGET_I386)
> >>   #define VIRTIO_MEM_USABLE_EXTENT (2 * (128 * MiB))
> >> +#elif defined(TARGET_ARM)
> >> +#define VIRTIO_MEM_USABLE_EXTENT (2 * (512 * MiB))
> >>   #else
> >>   #error VIRTIO_MEM_USABLE_EXTENT not defined
> >>   #endif
> >
> > Could this comment explain where the 128MB and 512MB come from
> > and why the value is different for different architectures ?
> >
>
> Yes, the comment already explained it by "section size", which is the
> minimal hotpluggable unit. It's defined by the linux guest kernel as
> below. On ARM64, we pick the larger section size without considering
> the base page size. Besides, the virtio-mem is/will-be enabled on
> x86_64 and ARM64 guest kernel only.

Oh, so "section" is a Linux kernel concept? It wasn't clear to me
that that was a fixed value rather than something we were arbitrarily
defining in QEMU.

-- PMM
