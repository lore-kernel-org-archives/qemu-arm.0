Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996D4C43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 10:29:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfb8f-0004FO-Mi; Fri, 03 Jul 2026 06:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfb8e-0004FA-DU
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 06:28:52 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfb8c-00018x-QT
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 06:28:52 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-664b3831a20so571730d50.3
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 03:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783074529; cv=none;
 d=google.com; s=arc-20260327;
 b=ZzZUXkgB8b7bHjhwDml61p6eZYg+byMFl8y6YOGq2YbwwwzG1Nxa+IHyiBWPlC6m/1
 xdHp0JgpRt7wu7py+cqsmz7yCncYR00Hq5soCxzDwTRqyTK1PnNLNMOaYem9ilqe+/KT
 RlcDhG7acMNXcDESB3FstXuRXLFDf2wGbw/YPBFIqFlcl/JfK2bXZjF8Exlqe1+av3nO
 QuJOvcjE8kU5csnnQ4ND7rvO9ciw+TqQhPM5Fc3RgpIAigTxSjbezmbuMSjDbH6mMwUx
 Swyr432YTCE+YOhqwedysvIVKZ8eLA9co9ikBT2Wtk+XAmbynJSM7877t0eJ+J6uX0Qg
 5y5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BYRftQ1EhBxVHug1SZSh5KJBSBcocp+LBwne83O/SwQ=;
 fh=bkHn70OwuxO5xNAEhoGKfmoCrgioKYLd+rDV1f11hsA=;
 b=Hl5FUb6/s3Ga0Prh2yxnMParl2DXOteP9pHWsJ6mTLV3Pk1T5AUUkHdSKgEZIQgWYI
 7pneSdAOT3itqr3Sk13Z4UWmEeEPci0JLhxmYdyngfDRnogowuhWKBVRNn6rZcDCl9Iy
 KB81KMp6BkxktzIaCgCl6SyaOgCLnFykdfVz6DYCD0nopoKKlHBQInKGILzy6BzTBuFy
 vhFEqRW6PgyCC9JViL0TdiZe7riU7MRbFwRSP7DmzRjBjYE82/BdV6kYXiYsNacdwRBK
 fdtmBYxLneTBSUNG5M204D9Iienctv+4MeRJJf9qAJgw+x0u17q0JCN0BJQztbmDzF+Y
 zaEA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783074529; x=1783679329; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYRftQ1EhBxVHug1SZSh5KJBSBcocp+LBwne83O/SwQ=;
 b=UTcpqx4Ok8ccMTmsgz9KmRXjcVU1Ja3ea+qAryH/H9YO925BZmBa1ocpX7m3zpD0Ba
 D91i2S+StQfs0Jn3QGiudN6ObGQTAh2wtCmmbq47XdV14Gly1DRzVgS37FlFzY/5YZTx
 TGQtXbvQGspcoCn6oyASKClX2bCjXtFSChV+OiIiKiLcxQTD6Lb/zxvRPuuwNT1iALXo
 lc9kXnt6wdvO/Bf52rEBiwm7tB70PfipzOcPvmWi2Saw4M3YpfCdCRjCsZxoTNxjJU0j
 anFAvEKttpEmuoC4XOKYbdMA2/BnXhdbjTD31a49gXkiXGE6DNsZVGgUPG3c5HdHaeri
 VE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783074529; x=1783679329;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BYRftQ1EhBxVHug1SZSh5KJBSBcocp+LBwne83O/SwQ=;
 b=ZX2medImVVDKE2YDqmIwRc6R9ikglZwCiWL79Z1GU3gw4WyMhqHABgfO20QW+idTwF
 v4LKQlq6HHWaKp0K2urUoGrA7FXdIqIUYtbpc2zY8RLqc32ws/LbMBcyMyqNGfUkfdNN
 lyAD2pB57D0AI3gaxxjYT2G96d3KuVFvwWUXO5JVZdHZEK3uhTepcPcdYFVcx592/foh
 dZK2QcibNvIJ4Oo1wu/SRBvh2TMesHh6ukJpIevfghValqaI2wJD3EHBqssdPukmougD
 naHkq06aeDnMLoK50iPvJsJ+GO3VWkjMlPuM5CGwqobInW2jXFKbvuoJ/HizmL/U6ATC
 JYzA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoQq+3iqd6oWR/TPU+DC4nF1AR4GLdQIUyBiiNxxIOutC7d8SdZYjgAmVLxkTRoIFy10KsSfkfDGw==@nongnu.org
X-Gm-Message-State: AOJu0YziRqWNXbPPGW1UAvReHvZcDiSav2W7hJBdJ1snAgcTwalPv68f
 7Fghos3g1umBLUUl453asnZquCFYfbxR0IGo/6CMNNwp7lgYymaXpUj9dLxzBbYsTPSDLJQbwio
 2rroM7YXjvD2GDQ0ghQkEg1j2V47W4UAOV6pbeySS2w==
X-Gm-Gg: AfdE7cl0EE3VLfa7kgBCDMUdbhnDgLsUherxB2+5rnpeJkzCeYBK7UnPyK83b5SLns0
 TIQC8a6a23MtjhoPtddchD6Wkd68lJBH8aWX8P4W6lPwgRcf931j0yC2PHdHUP5wJYSsedkfHeW
 YbEMoQHqZn1YRiqnLEihLRXWh1TiWJUV+SR7dl1a3+qIQpG2nAKFdxvwggXci69uWaX2iNwnKnt
 cWPB+/TCNCbTsGHbvPTLcFZs4X0BIikvgkdUoiesVE6t0hQ+RPAGy484kMY/v+3CNo42n4MyO79
 FOIuFZ3HXe6quTW97ZLBEeoJa+MaB2lrHjk/jCUGPETsplXhn50TO6hU
X-Received: by 2002:a05:690e:4802:b0:665:a0c:658d with SMTP id
 956f58d0204a3-66521a77dcemr7254782d50.28.1783074529194; Fri, 03 Jul 2026
 03:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260628114925.418293-1-bin.meng@processmission.com>
 <CAKmqyKMzUgs=1LMJZHoFUt1j2PSWTTKbAbg7gvzjZx83V041OQ@mail.gmail.com>
In-Reply-To: <CAKmqyKMzUgs=1LMJZHoFUt1j2PSWTTKbAbg7gvzjZx83V041OQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 11:28:38 +0100
X-Gm-Features: AVVi8CejQaReLRSSrngSZYEkB3cfnGJyXv5vspWiZrG1P890gvTTyxXE5lAn_1I
Message-ID: <CAFEAcA-WKMnBFks8vrp8YC-h=j8AGWGaU_nzXasdpXx9NgdLjw@mail.gmail.com>
Subject: Re: [PATCH] docs/system/arm: Document Zynq Buildroot boot
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 29 Jun 2026 at 00:29, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Sun, Jun 28, 2026 at 9:51=E2=80=AFPM Bin Meng <bin.meng@processmission=
.com> wrote:
> >
> > The Zynq board documentation only showed a generic direct kernel
> > boot command.
> >
> > Add Buildroot ZC702 commands for booting through U-Boot proper
> > with the generic loader and for direct Linux boot from the
> > generated SD image.
> >
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

> > +  $ qemu-system-arm -M xilinx-zynq-a9 -m 1G \
> > +      -machine boot-mode=3Dsd \
> > +      -display none -serial null -serial mon:stdio \
> > +      -device loader,file=3Doutput/images/u-boot.bin,addr=3D0x04000000=
,cpu-num=3D0 \
>
> I'm surprised you can't use -kernel here

I think it's better in our docs to only use '-kernel' for
booting an actual Linux kernel, and to use the generic
loader when what you want is "load some other binary blob",
even if -kernel's historic "do what I mean" handling means it
would also be able to do the job.

Applied to target-arm.next, thanks.

-- PMM

