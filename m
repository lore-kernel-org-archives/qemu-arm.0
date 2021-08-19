Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp389514lfg;
        Thu, 19 Aug 2021 07:39:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKpzgTD5vD2yfyB/TcTv+tmw3BbhxTilqQRAyguEVtBHbE+rdvKwV73SW3VxxZy5T0yqb2
X-Received: by 2002:a9f:2286:: with SMTP id 6mr11188023uan.53.1629383996957;
        Thu, 19 Aug 2021 07:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629383996; cv=none;
        d=google.com; s=arc-20160816;
        b=C4il2u0/65I+rUO57IdpDtSUkFUdRmfLeZZiVqgVhysmry7PRKIVkUWszzZA2h9fGD
         55g0pClO1r1mDA1ogjVotQwuyc0WAqNVUSB9xnIo+XxzXj2T8dis+Ts8fjBmxrtDJEjQ
         4ewyepe7eQxSn2c1ccojpK2MAwVcOeyq840GbINE7imG7hX9wypChnqybBoc6yuxsF8s
         YeOy3N4inXyQjKl+HVTKl82om5u8XkycPwRSidzhyvbTQecI1uFGVKZHm9Wu8v54dsLP
         EtGubkcABn1ex0uwtg0VeeRCUgygfgOqQ34k+dooABph1v8q8gu1mBsNDQq1flViiejX
         NiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vVVDXr9oIYYY2xqnY+5rphyvS0aAAxMcD4SzkQgbEXw=;
        b=HXKjSI2ETvAkYYjwF+202VCMOODXd0+TNpdD0pt73TY6mvt4EHF+ZdTkOG/MfVc1sf
         7SO/E5knqRtX6U9cwSKGAO/uRUxTdADiZfBXmd/juNRjfQgEG84VXEXTnd3wnN/S9RU5
         fvk1N29T12VTb70V3HPjzFVKuUQYQwLQTDQIpshMIcXDtlqbijCLAoWDOQMzueNffEMl
         QuuKcG2TqsVjKWJvaMzFrS1fO0CLaKWof7EZNyTxLPUJEaee4RLREAdeQEbPVMC4GOcW
         VtyoHZEM/O2d1QfgA+PXv8fxfeiKpN234s9RgAmkmaP2XZ/CiCb96S9YeFun9qLzkPSm
         dryg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dniTonSe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si2147311uae.108.2021.08.19.07.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dniTonSe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGjD2-0005o6-9H
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjCD-0005Bl-4j
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:39:05 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjCB-0004ul-F2
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:39:04 -0400
Received: by mail-ej1-x634.google.com with SMTP id w5so13452028ejq.2
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vVVDXr9oIYYY2xqnY+5rphyvS0aAAxMcD4SzkQgbEXw=;
 b=dniTonSeDFX1dneOf5zf7LvbP9IuI3aS+CX1CJ+iLuSMqqnZSPXNGalmNoVUpC4yt8
 QmmhGNSFZUHauycI0wzU+temQDnNnXUu6iJd+aPyHDvrShFmKSJq4kEQbcgQORVAGD/O
 jvtIoXT4vjK/D2OPc7+PsOAEd4ozytmERbMcFRlODGcmoUPhdN+K1vsYOd2pOVhGAx3x
 9hmymFTWSW4mwy+kPbIEvB3b4uiASRVi+2nUjjA0gA9Eg90cJ3BUxCNfxW63ztOVUbPz
 xZb7It77v/K3ZLmyt0JdoYI/U2KdY7HJREQAGa6mscE/FQw3gv0XK/Avu7z5nzHxe7j2
 ypoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vVVDXr9oIYYY2xqnY+5rphyvS0aAAxMcD4SzkQgbEXw=;
 b=FXufSmwifPPbEcMi0QHyH8yRwVaMgi2f4ggVViJ01YsQrcNNee2C23Q17BuM3AlYM8
 XRinutfZF6AWv9E7otEK1Ef3jSdfUiWJvcojT6hpkJGHcw6LSt68vQU3C7GHq1SyCN5a
 CTDgyMdzRuOA9nhXTAUKfBa/JW6RHVEBn8oUNoXew52xMBnPbmjwYX8HSqv4wNVTadA6
 Y8Enn6l4S2rNsgkCFIR/NhTsbDzjwzOywpkOQXt1s0nZSu+dXJwdROkvnwXV4WLQAbRd
 5GbuOCApWy+6U8NjXq+i8dg/4p8ydHXeqUXyIN9ZPoMiqa1bcUuXUIojwRN3eILcvi8I
 MQyA==
X-Gm-Message-State: AOAM532Bflw/nPmAN5iByxeFWb4DWkLw5boMX136wwY4g5tRzbXm5/vW
 jFWKlFFR2iRJubVLmrv7Y0BsvXIsCsBjB4tEnfQTrQ==
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr15691623ejb.382.1629383941633; 
 Thu, 19 Aug 2021 07:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-5-philmd@redhat.com>
 <CAFEAcA_MrsapWF9K4_HW7FNGcT8PHUJRer7FH_fMU4yf1wz4tw@mail.gmail.com>
 <8fda9bc6-54ce-3a04-6c4c-b200ec699fa9@redhat.com>
In-Reply-To: <8fda9bc6-54ce-3a04-6c4c-b200ec699fa9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:38:15 +0100
Message-ID: <CAFEAcA_kB0-fHYBk1hJ87=Qoj0U-EbjhzVruhVhJKnexViG8_g@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/dma: Replace alloc() + address_space_init() by
 address_space_create()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZHPCXr4EBgo3

On Thu, 19 Aug 2021 at 15:32, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 8/19/21 4:22 PM, Peter Maydell wrote:
> > On Thu, 19 Aug 2021 at 15:21, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
> >>
> >> Replace g_malloc0() + address_space_init() by address_space_create().
> >> Release the resource in DeviceUnrealize().
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  hw/dma/xlnx-zdma.c    | 15 +++++++++------
> >>  hw/dma/xlnx_csu_dma.c |  9 ++-------
> >>  2 files changed, 11 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> >> index fa38a556341..9f6b3fa47c6 100644
> >> --- a/hw/dma/xlnx-zdma.c
> >> +++ b/hw/dma/xlnx-zdma.c
> >> @@ -777,15 +777,17 @@ static void zdma_realize(DeviceState *dev, Error=
 **errp)
> >>          };
> >>      }
> >>
> >> -    if (s->dma_mr) {
> >> -        s->dma_as =3D g_malloc0(sizeof(AddressSpace));
> >> -        address_space_init(s->dma_as, s->dma_mr, NULL);
> >> -    } else {
> >> -        s->dma_as =3D &address_space_memory;
> >> -    }
> >> +    s->dma_as =3D address_space_create(s->dma_mr ?: get_system_memory=
(), NULL);
> >>      s->attr =3D MEMTXATTRS_UNSPECIFIED;
> >>  }
> >
> > Why are these devices doing a heap allocation rather than
> > having an AddressSpace whatever field in their device struct ?
>
> To easily use &address_space_memory if 'memory' link is NULL?

They could do that with
    AddressSpace our_as;
    AddressSpace *dma_as;

and set dma_as to &s->our_as or &address_space_memory.

Or we could fix the two boards which create these devices to always
pass in an MR to use for DMA and drop the conditionality.

-- PMM
