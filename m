Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4728C55162
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 13:52:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpRB8-0002zz-80; Thu, 30 Jul 2026 09:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wpRB6-0002zY-AA
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 09:52:04 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wpRB4-0008N4-NO
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 09:52:04 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-66825847b2cso2341168d50.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 06:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785419521; cv=none;
 d=google.com; s=arc-20260327;
 b=sWoKgzw020BWboXTDrEgkljIYDfjllDY1jyUmZX2Gu/PfgK8gFrt+R1josxCbWAZHO
 uZaq0TlKNhQRaAujIBCYCbRVbc/mHaRCg+fo0DmqiwXECy9r2eJqR5TDFhvGz6RG81bY
 64Z5ZaPVegggoesrNXZ1vJn70qj2VftexllHQDwTKzriyVP9D6WFKLnCLBKHzWfjcegQ
 IHSg0NimOS/ci314i0a7ImpisgqGjbFGfcCJVs/7S/xTeHPOmLWuwurVGa2Sg9va8vjV
 0GpuISQot8FJ6jCiBysrBYh/41/ouHeARqwuYXf9jnEL7/t0g+SgyQ40sv3KchyaCo2c
 qVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UpFZt6TA0GM/LcfAdzAdwRxl6RcGbMKpL4bynEkkW+0=;
 fh=hcTnEgsV+/tepJx6NiN51Zzc3aM+HRh1ir1hXCXNgaY=;
 b=ORNXySzLzN3mcjCtLPmjGX4Z3vNbg7b17HGkHhgoOBCofhi8wZbrtaJuod+mU3P27T
 U5al8gzp9f5Z90JGuiOw149SaFrvZx9jLsygKlZUTJYKiKGgiwmrnTDNYZbY8Xjy+Si5
 2eD7IRElB81Df+W8Ytt/vRHr9CG5L2LelabSonaP39ORDVzsG34WQjs8fT5A9RoxwOFI
 QfsLI7XjgfJyUIiydyHVh1E3kMTciednx8oII0Z36FzhQQGDh1sMWVm43aBMvGNyBnOj
 6L6tSXiHIFqZogPkQFjnj53NXelL/vO3auEBBjpAmOuVMq5TI/N/bReO4462eN7J+6ZW
 8maA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785419521; x=1786024321; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UpFZt6TA0GM/LcfAdzAdwRxl6RcGbMKpL4bynEkkW+0=;
 b=NoR391GOghG9ePrOQiowdpUcAP3kmiN8jbeaXC3/4HwZGEu6hmBUkD+PfeLP9eTbpp
 4y0MNYxWioxQn+Yh6xG/BFOGxA9Ppec57JSzlrpDXVUIPzIrmZT2Ijmf0hvcDMn85B6W
 k2ptPdnZewKkCN2o0XRxu189CcXwMeA7gTwx+R/mN/CUXvW3xYbCA7gF3PJT2N33Wx0Z
 VI3CaVA2RR6F5wzZQ5E1LWkb0mrXgmsKlJo4tMLxkP9SuRT84byg4gorhkovS8Rvx3tB
 Wy3q8Pd0amUohkiym1b8Oy8Vc9Tpoh4HjjNwmBv/EtB0BZYF2kjOejJpftPq0aw1KlTi
 FCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785419521; x=1786024321;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UpFZt6TA0GM/LcfAdzAdwRxl6RcGbMKpL4bynEkkW+0=;
 b=Ip5/CWnzOKCwIek0mZ2Psc8VId/FokEmkLQAgimm1SBchbOx89pvimbKMuQ4AKGDkF
 IVgit8q8l+Dyy6QGDsDj8NmvReYiJhfEo66ebUcQMf07Djueid84kXfJjeqs4Qyjwgj8
 QbETDDKotK85tf9sZfPI/q+hJc+1iFGqCCFz74vCAdw3rDWg28IzSfOQhpRH/ey130Yb
 4H7Zh44MeJPmEos8qqwhovQNj3s7Zi8QkHrsKeLRIUcx/pM/IDPyq8ttKwAvfEUh8Orn
 YR/3VWaXKprUVzfQ4ITKnNb3z8U3TFI+sLG/KWv4NDfRevTdH+v+19OiUgv5AqACe4MT
 n8Qg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrk6XP4+ct99Cy+rk70qoK0/rRabL7uROOhsXFFJy7s9Z8tLp3JZwcYxjWQU6rwufLo5mOVe3YoNA==@nongnu.org
X-Gm-Message-State: AOJu0YxDJq7QC2v4332Vj8AZYEe/j+2zsf6CSCJtmgVj2yF6QzMgr0ov
 ms9SDYhCwaCoIuUReN7W2qVOybuim7BEc84+BYGgFsYcehn9vMMm6pWwgNfqZux4nzOCxtzsCd5
 TfrH+DaGzX6+YAR4p3pT315lzSYdJLd0=
X-Gm-Gg: AR+sD13Nq/ZLNyEcvnIoaElEsgSrMI0TRvkfG1asduRgRf9jtKnhFrp+Gn2jyR1gRSf
 PuBJoGRc0pSvMAQU13i2w5KlUeaXXU9YtETGsFrJ4nikMHM97YJ5aTGflOr9vX4hBejiWiw+Kjr
 Gwfd2JqSi9nrKqvPZTnVgGtNQSDCL/yBLiilxriN+tBpX3EHo/5ykYmXQLAbIUuwX3CceMBMpOO
 qpz4J15roAFbIJFrjq3oB1PVo/9tZQZbxgcjUDVWGFQTTILklFzYYBqPwk2KQPsAss9440ExBr6
 PAvsa7KXY2nXP/Rn5/VxMB/xYzTn+ljlPXbjig5EcMS+
X-Received: by 2002:a53:c38b:0:b0:668:768:9199 with SMTP id
 956f58d0204a3-6692f740434mr1303486d50.87.1785419521011; Thu, 30 Jul 2026
 06:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260627154225.863984-1-bin.meng@processmission.com>
 <20260627154225.863984-2-bin.meng@processmission.com>
 <CAEUhbmXe=aJ+K8isdCpdFn9Y4LLTf9SARY7VaZoMo39SeYJAcQ@mail.gmail.com>
In-Reply-To: <CAEUhbmXe=aJ+K8isdCpdFn9Y4LLTf9SARY7VaZoMo39SeYJAcQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 30 Jul 2026 21:51:46 +0800
X-Gm-Features: AUfX_mywJvB_MR-3G8HG8IE6qcEWKXf9fAE416Ku7kb3TdhRy3voyOZWjtneJ2E
Message-ID: <CAEUhbmXchynHnz1Zrh=WZC4RrmamRGcUm7uGda45kUUVSrzBjA@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm: xlnx-zcu102: Fix up DTB for direct Linux boot
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Jul 8, 2026 at 11:50=E2=80=AFPM Bin Meng <bmeng.cn@gmail.com> wrote=
:
>
> On Sat, Jun 27, 2026 at 11:44=E2=80=AFPM Bin Meng <bin.meng@processmissio=
n.com> wrote:
> >
> > Real-board ZCU102 DTBs describe the UART, SDHCI and GQSPI nodes
> > in terms of ZynqMP PM firmware providers for clocks, resets, power
> > domains and pin control. QEMU does not model those runtime firmware
> > providers, so using such a DTB with -kernel currently requires users
> > to edit the DTB before Linux can probe the boot-critical devices.
> >
> > Add a board DTB fix-up for direct kernel boot that removes those
> > provider-only properties from the boot-critical nodes and rewrites
> > their clocks to fixed reference clocks already present in the DTB.
> > This keeps the user command line using the Buildroot-generated DTB
> > while limiting the compatibility adjustment to devices modeled by
> > QEMU.
> >
> > Document the direct boot flow, the SD and QSPI image layout details,
> > and the remaining firmware and real-board peripheral limitations.
> >
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> >
> > ---
> >
> >  docs/system/arm/xlnx-zcu102.rst | 139 +++++++++++++++++++++++++++++++-
> >  hw/arm/xlnx-zcu102.c            | 109 +++++++++++++++++++++++++
> >  2 files changed, 247 insertions(+), 1 deletion(-)
> >
>
> Ping?

Ping for review?

