Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B38C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 15:51:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whUXv-0007qh-91; Wed, 08 Jul 2026 11:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whUXu-0007qE-RU
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:50:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1whUXs-0004fS-Fz
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 11:50:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-47defd0c1c5so476834f8f.3
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 08:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783525842; cv=none;
 d=google.com; s=arc-20260327;
 b=orhexyv4YH63Br4A17Gb46/BAGN4u4lO/YBdwcsz2Ei/PRxalzxvDrcFSs5amRiYZ3
 j/pVOgf+uMMFRoU2o27i9lrqKalguBgoq2ZAOQL2qd+w/hfVg6DHb3jWmsWmueaTU5Ae
 vxnleodRmRsIW7e7GqvrDT2gTmZMi7BZTRGZGb1UopGf9+ZsyttLLrcY0JoWTSSKQZj+
 4lQjDSeTY+3fzD4CPZ1mb5OFecedfqid7nd1x2PANThPty0zN2PNM9Jv34foKd3Sw0RP
 xTTWMMBbdYPK2b5Z8dfSOrrJqxWJwQCZ3ZmsHxlcf3r20+JtVn36s5atkTguNCY/LWnl
 NzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=s1OcXkWo3gi0kNRhczX4vcOTua6igMSJGEphn7JACdY=;
 fh=tWuvinkNO6T0Oig6FnFK5OTZzAEWjZKJ6uQi/2IwVUU=;
 b=h86hUXot51+qA0xykJS8tQB0Jk8D9zbdvC+kWRvDzfbYtLsadNIKWkCmeDh4HPMszo
 JUMT2ruGyW5WxkojcJ2tlueZqjcMF4Tp9AW1b+UyetEj5xqzUgoRhAwFqJMy9syHvfRB
 EjdpEIn8hBsWgdd0xOlplah0FcmUEiid/fXYFo/fLYpfcIRvWCUw/Ab9oQZeNTao5vpp
 UDkroOH0hKPyP1a4os5Dy6ioMVHtm1isoXP3SiHX+GeWn+axkEJUAKUr5g84OIC4VmFX
 4HN5Hp+fcONpdWc2ZKP4SrORz1WVluC/nl0I2Wd445XTTjp2LSMOlLXiD8OtTZ2/Mz46
 KpWA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783525842; x=1784130642; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=s1OcXkWo3gi0kNRhczX4vcOTua6igMSJGEphn7JACdY=;
 b=UidZbX7wsQxdndOGb77GaVZu6TWH84aQlYjy2eJmPSNXyceQnpKXlnpeNnOUT+Ddru
 IjYoL9TS9bMjtsa3nA0kcGfpnc5nf2Ne4pkzftw9dBgVsoNcJfbZBcE6DXoC4muYQcGx
 +doSiqACGs0D7lJeu0Iz3S/A2Yv2iJFQfIBLEEdmr9yZsciPPmCwQJkj5ShHF492YhYx
 moiQ4eYY7G8a4CsbjD0SWOteOF179+sqgd2rrzLWb4XustYTEgQIfK0cPvE9jcg1tt5h
 jO62LOYZuk7F+5JeCXhzH0HQcVR83oI5ZRJzb8Io59WBWjrudermieN6x/NbtzpqtMgc
 7IHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783525842; x=1784130642;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=s1OcXkWo3gi0kNRhczX4vcOTua6igMSJGEphn7JACdY=;
 b=Lx4MteNsa3JEd4P9CrbZdZgxDpWZoYvm/u9AxNj/OheX/inB0mM1oriGidIArUPIns
 +sspwoKYxI5MFFQ6SIbZQbQLiBEAr4RSkUJweX/9tziKCobhXEbIUe3sPo2obUOnQrlA
 WaQ0IqHHNTTXa/rYWvPaAOUmDKjDzERFuUa8wOo4QmFcvAq3TYjwW9tnfZC3EAHS+agd
 h9VTbBxgJg5qFZmTugyLO9Vy6MOHMa13fiAs3qYrwUhWrczv7nDqqshxAERIDZkawrnh
 3EGJAAthtSZPaKZEEppkyS/KDRtOuW5ue9FyEE7OszuqeXSTg0UnW7xTP19VAK6fhR4n
 EalA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpEfS36HMM7+vsK7kzquJac0eXyQBNyzmEGZtekLFaQiks2OreQIdpE9aJyYRN+ypNaIIZ/aRt5ig==@nongnu.org
X-Gm-Message-State: AOJu0Yz70OBfr5aXB6bUlumYpfAiD22a0HJcy365YKdN2gk64JI9vKGy
 IAP/N5tVSnSSGAznf0J3sUuaDzBzHTSkUIup0JlLVcTRvt1XrZFMRXE8wa2MIWtsDLkz41H1moy
 pD1YGZOnk65AafQsvsi+qOdO/XyZ8bXI=
X-Gm-Gg: AfdE7cnkDE7mXUzymDjY3hgJemntEcO4Ml04TCgoJc2H5FbzIFGkSGUiwceG67tOdld
 9scs5gbrD+80OXL486jJwJL2tZ+rIei5qdcq74/yDqncpzy1FdEyom3FeSVNXM2U95kMnSnu71e
 vXegS4F7NMD/mP/SAaqam+K47KjTi2TI+oLAIzwlLPzmXvZix6ygpC4zb610zVFElsdYHkUgsBd
 sK08zLftZ4VTyafzU2LpPTTMrTTJOMOG4lXGkKwMgXaNa3qQMMk2zP9Huxn1qJRdkUI1T4pXhx6
X-Received: by 2002:a05:6000:4705:b0:46f:7d90:8127 with SMTP id
 ffacd0b85a97d-47df07ae289mr3654527f8f.13.1783525841974; Wed, 08 Jul 2026
 08:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260627154225.863984-1-bin.meng@processmission.com>
 <20260627154225.863984-2-bin.meng@processmission.com>
In-Reply-To: <20260627154225.863984-2-bin.meng@processmission.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Jul 2026 23:50:27 +0800
X-Gm-Features: AVVi8CclZ5Wbxc-qEhKBwJh8Ujz5Rbqgv4D1IXG_AtBheHkub999OV380tI7kSw
Message-ID: <CAEUhbmXe=aJ+K8isdCpdFn9Y4LLTf9SARY7VaZoMo39SeYJAcQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm: xlnx-zcu102: Fix up DTB for direct Linux boot
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Sat, Jun 27, 2026 at 11:44=E2=80=AFPM Bin Meng <bin.meng@processmission.=
com> wrote:
>
> Real-board ZCU102 DTBs describe the UART, SDHCI and GQSPI nodes
> in terms of ZynqMP PM firmware providers for clocks, resets, power
> domains and pin control. QEMU does not model those runtime firmware
> providers, so using such a DTB with -kernel currently requires users
> to edit the DTB before Linux can probe the boot-critical devices.
>
> Add a board DTB fix-up for direct kernel boot that removes those
> provider-only properties from the boot-critical nodes and rewrites
> their clocks to fixed reference clocks already present in the DTB.
> This keeps the user command line using the Buildroot-generated DTB
> while limiting the compatibility adjustment to devices modeled by
> QEMU.
>
> Document the direct boot flow, the SD and QSPI image layout details,
> and the remaining firmware and real-board peripheral limitations.
>
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
>
> ---
>
>  docs/system/arm/xlnx-zcu102.rst | 139 +++++++++++++++++++++++++++++++-
>  hw/arm/xlnx-zcu102.c            | 109 +++++++++++++++++++++++++
>  2 files changed, 247 insertions(+), 1 deletion(-)
>

Ping?

