Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp39034ejb;
        Sun, 16 Jun 2024 22:28:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwZr/2rEZ+/OeNrFhqC/pzYYARh0TTU6tFH0ApkWh0eXcHKixI8W9b3VfRwU/YKEno4xvRtFSkZz6BlI1XZ9ekMn4qRisM
X-Google-Smtp-Source: AGHT+IHK2mqrZTd1Jlc8jedVDdN07czZP3KfQUYnLWTo/OAov+RHePCzgXVuXfy8NL1WRdDuFGV5
X-Received: by 2002:a05:6214:19e4:b0:6b0:7821:4026 with SMTP id 6a1803df08f44-6b2b00dc875mr113052226d6.52.1718602088725;
        Sun, 16 Jun 2024 22:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718602088; cv=none;
        d=google.com; s=arc-20160816;
        b=Ppc9201jayBXm477BFBnw/GpzfNzqkAz8Z52n72XRsg8crO0k4l47GIQ69YLYlEYhY
         byrVFMvIOfUZcGdYymIBDXnKlSYfKtxrkRGM0cyBhxxtz3nuc0dlMy7shmEtkDaKFAIh
         ZKI9bCSWff8AiWUPkWE7D2jhwgtWxT0VM7fSQodDuDIjaJEVv4xWVT3sNQxjDRuSBu0A
         DjHS8rdDhlpc50nm6NBMvpu1JnDSsGSLczL0LP0ayRuSwnjOLSYP6Tr4qLSTq55jZst/
         /OwMwgXK1LjqKjk2qDgimxxHCTcxv6NSs44gqw6Z6/0k6wHO6b5E6ZRlPa9+xEF3SZXK
         hrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aS3vDlpG5JAr0kUzKjXG6xA9B7QpFmkY+r7SXcqM/V4=;
        fh=yh4kTN2hd32/rDUbzyNo8TIHk+/FyrlZw9MLRbajYZo=;
        b=ieXFuxVtHCcVOnT/AaCpoNXjmwWKQA4Lks8bNODmkOMTkZkjnUHQu9V5N5qpDmrxgx
         15AhzYJ8vzmI3D+n8d5neeINktFiFpMrXxI4VWNWgsRTenVPCnzdGbSwuIrkNJ889fME
         hj+mCAw0mbXN+ha3AzQTkBbAVbVpDqgGa8feyhBA8Z/m7hR4oEIufvOkHEM3uFcSgqzO
         f5iqtbucHhRyE6rMNtQDsDduqHMlhkmzhnRgKl3shu5Fm5PD1W6uyBRZuYfega0P3cqU
         YMX+gcQaQuy5ZDyWFuelgxP7pSaPk9L/Mdgv3e+UOcSGVczulvkQJg9CZZih3T0AYO/6
         YnjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e4sTdkKf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5aff7a0si93210006d6.265.2024.06.16.22.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Jun 2024 22:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e4sTdkKf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJ4ts-0006R7-Qk; Mon, 17 Jun 2024 01:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1sJ4tr-0006QX-2Y
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 01:27:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1sJ4tp-0002Dh-7r
 for qemu-arm@nongnu.org; Mon, 17 Jun 2024 01:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718602043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aS3vDlpG5JAr0kUzKjXG6xA9B7QpFmkY+r7SXcqM/V4=;
 b=e4sTdkKfXDzyKOTLwZSqHLA3gufMcgeFvvmefRoXvu+RLuDTz2uiizFBOVNGEXEdAS9cuM
 w0weE346I6UV++K9P+Ia73GPKzHYYUTJGXynnls8l6Q8FtezX+IL/XlnAH0guV7CaYcDPR
 4oCcsnvDFuiJEwxTQDC3yiBeNmZsUww=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-gT3429eTOTam955lYDlxyQ-1; Mon, 17 Jun 2024 01:27:21 -0400
X-MC-Unique: gT3429eTOTam955lYDlxyQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a6ec06ed579so208262566b.2
 for <qemu-arm@nongnu.org>; Sun, 16 Jun 2024 22:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718602041; x=1719206841;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aS3vDlpG5JAr0kUzKjXG6xA9B7QpFmkY+r7SXcqM/V4=;
 b=nnVxk9MOBQVgs/bC9I9sefl5mIzFXJze7h438Py/pwRfRHJWqTRHgueL4KiQSQG00J
 3LePua5GEUGKSQE5wYQ4s7ftlwiamiqKpO+yh8MsNrr4k7Hx8F3a4y6PRjSXr0POn2l7
 b8V1Pxdo1/nIGg6c8X8WMn8T9GYFna5vAaL/JhPXdyiTQj+PelFZ4U5Cqs1SNiEA+A0J
 QUFzyNLpbeq7VONFXfaCGX9R66taQDLklQ3tT+Vd7x0DjggCRd3p2GFY4ikkNS6tDE95
 chhpBLyeqCwzM83a4cM1x0oOQH2YzY7pXnHMLfP3yqAwAVuUiulzNUgfQLbAanyI4l4V
 dX8g==
X-Gm-Message-State: AOJu0YxFKiQ7NMpz2DP8Bzum6WpqhLf2Sb/KZ9pIkr3H4YuXGFkaAeei
 LnTbzAg6K57qDaHQ6BQivze02A/MZr9v22Pls5VuKC1LDgUNWTd+QtDJW90RqwNI4i64Vw7W3DY
 FLOSfKFmtkhRWPtIJtMEzpWxP35I1u8Ob+XAARnJ699X0G959MA5n5/ONZef1KYzi2EjNhDHzUy
 nFb1DoCndb7QtGNua2S6eamwL/
X-Received: by 2002:a17:906:b44:b0:a6f:1e88:37c1 with SMTP id
 a640c23a62f3a-a6f60d41c02mr569092566b.45.1718602040828; 
 Sun, 16 Jun 2024 22:27:20 -0700 (PDT)
X-Received: by 2002:a17:906:b44:b0:a6f:1e88:37c1 with SMTP id
 a640c23a62f3a-a6f60d41c02mr569090666b.45.1718602040445; Sun, 16 Jun 2024
 22:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240612020506.307793-1-zhenyzha@redhat.com>
 <69649622-e52c-4d24-809b-3d8a97786a69@linaro.org>
 <CAFEAcA9wEjONgLfTObNYwJbwn5Gs1BDJiDivc9PEwmfOeZW6ww@mail.gmail.com>
 <8d7e111b-4f74-4a67-b01b-2af5ce009a06@linaro.org>
 <ed3df37e-fddd-465c-8ae9-1c5791966995@arm.com>
In-Reply-To: <ed3df37e-fddd-465c-8ae9-1c5791966995@arm.com>
From: Zhenyu Zhang <zhenyzha@redhat.com>
Date: Mon, 17 Jun 2024 13:26:44 +0800
Message-ID: <CAJFLiBLt4ig0XpDScq0M1EAPo1PEvZNiumf9kKMOErSE_OJ_cQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm/virt: Avoid unexpected warning from Linux guest
 on host with Fujitsu CPUs
To: Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Jonathan.Cameron@huawei.com, 
 gshan@redhat.com, eauger@redhat.com, sebott@redhat.com, cohuck@redhat.com, 
 ddutile@redhat.com, shahuang@redhat.com, qemu-riscv <qemu-riscv@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Song Gao <gaosong@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=zhenyzha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: HdYwd58vObS2

On Thu, Jun 13, 2024 at 1:48=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2024-06-12 1:50 pm, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 12/6/24 14:48, Peter Maydell wrote:
> >> On Wed, 12 Jun 2024 at 13:33, Philippe Mathieu-Daud=C3=A9
> >> <philmd@linaro.org> wrote:
> >>>
> >>> Hi Zhenyu,
> >>>
Hello Philippe,

> >>> On 12/6/24 04:05, Zhenyu Zhang wrote:
> >>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>>> index 3c93c0c0a6..3cefac6d43 100644
> >>>> --- a/hw/arm/virt.c
> >>>> +++ b/hw/arm/virt.c
> >>>> @@ -271,6 +271,17 @@ static void create_fdt(VirtMachineState *vms)
> >>>>        qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> >>>>        qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt"=
);
> >>>>
> >>>> +    /*
> >>>> +     * For QEMU, all DMA is coherent. Advertising this in the root
> >>>> node
> >>>> +     * has two benefits:
> >>>> +     *
> >>>> +     * - It avoids potential bugs where we forget to mark a DMA
> >>>> +     *   capable device as being dma-coherent
> >>>> +     * - It avoids spurious warnings from the Linux kernel about
> >>>> +     *   devices which can't do DMA at all
> >>>> +     */
> >>>> +    qemu_fdt_setprop(fdt, "/", "dma-coherent", NULL, 0);
> >>>
> >>> OK, but why restrict that to the Aarch64 virt machine?
> >>> Shouldn't advertise this generically in create_device_tree()?
> >>> Or otherwise at least in the other virt machines?
> >>
> >> create_device_tree() creates an empty device tree, not one
> >> with stuff in it. It seems reasonable to me for this property
> >> on the root to be set in the same place we set other properties
> >> of the root node.
> >
> > OK. Still the question about other virt machines remains
> > unanswered :)
>
>  From the DT consumer point of view, the interpretation and assumptions
> around coherency *are* generally architecture- or platform-specific. For
> instance on RISC-V, many platforms want to assume coherency by default
> (and potentially use "dma-noncoherent" to mark individual devices that
> aren't), while others may still want to do the opposite and use
> "dma-coherent" in the same manner as Arm and AArch64. Neither property
> existed back in ePAPR, so typical PowerPC systems wouldn't even be
> looking and will just make their own assumptions by other means.
>
As Robin's comment says, each platform wants to assume coherency
by default may be different. Adding it to all virt machines may
introduce new risks. Currently, the issue is only valid on Fujitsu CPUs
where the cache line size is 256 bytes, meaning the combination of
kvm+virt-platform is needed to trigger the warning. So I'd be inclined
to add this "dma-coherent" property for the "virt" platform first
and advertise the property to other platforms if we hit the issue
on those platforms.

Thanks,
Zhenyu

