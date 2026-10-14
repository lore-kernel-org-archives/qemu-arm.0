Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49675CC6B1A
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 10:47:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGwVR-0005w1-6v; Wed, 14 Oct 2026 06:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGwVJ-0005th-51
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 06:46:38 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGwVF-0000v0-Nk
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 06:46:36 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b1afcd2d23so4102365a12.1
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 03:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791974791; cv=none;
 d=google.com; s=arc-20260327;
 b=ZaZ6WlT2h5B4NpJBiUMt+gUbupH4xq4AwWl/uJ4JOr7g1VTgL9cmUTdyGmctSsYZz/
 KX0YCjFpoH1902y3I1N9A0DtdGcn5OX2y8Iqf4hbPKktt0eDdfWjo3UAKf5wHE3hjNgz
 /37eUnQIWJQ5JiKdf2VekL+tiAkvTks80zYvbrZYSCq3Jab3ipdxFL1+xEXoPlTH/tI8
 aUbwhcaXR1ehSUxA7hGqRcSCumSC5YomaOYn8KxmdBQFkx6vhbnbNi3npCbXdjMm+ZZE
 Bqu7+MwzS9r/iD701EEXjSNdu0hfJDH9IwA33dSR8WwprotgolaR/GhEQdHuGMh3FWwo
 /vkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=dgAIZN9ZyT5AcReeOiog3uIyPsirNLEYDLgf6GKduJg=;
 fh=ljVwBXH29fpytEWS0i/FoR6sqf114DL8B7PRH1zFvQ0=;
 b=d9/z6KSlVgZyTg6GmRZna8ahhmy7eAQwuL7HgQFeNmz4Ra2anL/5EOZMKJxVqn5rIQ
 NnP25fRSHZp64QujY90EDTGARM5ebdGF3WPIg0FmCG14pVf1OCfQosIG0/MrVtqmERF8
 5C4N849OeFI7wUAUggjrTvEcsH1wdSw3X4JLhmSDIHhBP3XTMu//Z49mK0IobBrrcF/Z
 yWmAx4GL/u78AyW7tAhnecHmSWOuR7Pc49Eto78a6zGeUoms6+4glwtV+Gk0aTE5gPK2
 A6LGShm6g1HSMiPMB83/uAGcaHIQ+EvKMP+b/HOdzADi67+1eMBtxRKNRBlPXFrHcWVV
 lU7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791974791; x=1792579591; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dgAIZN9ZyT5AcReeOiog3uIyPsirNLEYDLgf6GKduJg=;
 b=j1GkAPHNR8UTm7BoqlQTTPk/e/tMxy3RqQbimghhkuSFx8QWrN9YK+DzKJbMrKZm6d
 /TdGd7fIFfVsRjs7oX0jyNS/A3ewV9ISlQmz0yndk4PqOFp4Cq0vqFNUO1b8TeiiEuY3
 5+pGLf1x1I2JF0RKAFZKoq03p67Go9RRFI2rfGaOIDBszqzvyUSwNjnAPhL/OVDo9YXc
 3nQGkgF6U9BvLJoaUgPUGvUTAjO04HRIFvDQm4yF4BFLoq7hy5ov39bUK7KbqEkDbSLa
 vz2NLjQRvmWHmTI1SqgC18smBDO50KkTFgbIkOd4Oe67mGuikm9paXDXCMc9rHh0uOGB
 ZF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791974791; x=1792579591;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dgAIZN9ZyT5AcReeOiog3uIyPsirNLEYDLgf6GKduJg=;
 b=Dnyo3d7bDsZ/ru7zaZyciJubSRjNRY/PpW1VABeC8UqXkobXzUHqlYOYUYuVu3nEF1
 mTJUxNM5yI/nnK+ActrPTLsaIFaG6W+Pjqaxowd1IRbVR+3xvTg9ftjSCUwygXEMykSJ
 M+neLhZNR52kArQBNQ2JK+upeH+tqo9rIPFBXdl5DAlrZJHbwIZObVdzwGxe6x1VJzQM
 xOc+PMXk2wtAZKc2VGRIRXJNh4NgMtMLRWSXk2MeuIGlOIRdUztitBNx9jlyc5VukMNb
 /2m5Gy2G/aNfv40wt9bG1hOKnv9iLP3T+QIEcroNGpmZUjUd7l1Phd1/CEDhvfGcK422
 mGJA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx0VOeRuaNd5Z20NyfLQueMiSCyUa3dF8rPZrjPcjh3MOg5RXGndgc/58HE7GyodKmJWxE8eRQKLQ==@nongnu.org
X-Gm-Message-State: AFq9FYIx5BZvwyvNeYgjvQgyABKgVKk+V73WxRYopqYWFmpqGdSeErhe
 /04/Ux66MGwWzELrAU9iPOfcCUHxSn/p1QNNgNCmQOnnRxndqQ6SbQH5XBw5LLoMy0Mvo9kPxEM
 SGWjZK1zwDqBI+sVMPDs1QJNMed9zKaw=
X-Gm-Gg: AYBFou1JSGUBqqkhlZcyfKgFV7s+qrpbZRWVh+WCNNucwFp72wrCJfFQVUNEMfvUViZ
 SPbxxL3QD0caGPVhIOrW19E//+o0cWpucHO0GB8bVI5zQOuVr9n/JH7FNTzUXTXXqx44NI6Zft7
 NSRpUq2gTNOvrn8YvylssEtwu/zwK3WyeNzZCHy/vDyWlyb3aGzP5jH3NenDxWjzb3WefwxGOvf
 gKfNoT5MuNDNXlli+qlObpZv014jm/e+oZ2VS3sd+Bd1z3DRhrZb+s3JCNHuQXtNGLfA55+pBpa
 4sehS0YDyLQiDgtquhXNbQKyodKIdHpTNoswUTf8Nv2pad0QR8rgkyw=
X-Received: by 2002:a05:6402:2808:b0:6b1:d62b:a8dc with SMTP id
 4fb4d7f45d1cf-6b1d62bab4fmr6241459a12.1.1791974790530; Wed, 14 Oct 2026
 03:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20261014093152.834-1-luoyonggang@gmail.com>
 <20261014093152.834-6-luoyonggang@gmail.com>
 <e09a64d3-7632-4f90-bd69-0c6097f8cd78@oss.qualcomm.com>
In-Reply-To: <e09a64d3-7632-4f90-bd69-0c6097f8cd78@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 14 Oct 2026 18:46:14 +0800
X-Gm-Features: AclHuK99CHluDZFrJ7zUw4KmuE82Vz6nlN29M321nxoRS07KNUiRagNm5CzA4Eo
Message-ID: <CAE2XoE_7iHUBUD7bPDNbmEY7qx=ncOaODWNYAezuPivCz1hSMg@mail.gmail.com>
Subject: Re: [PATCH 05/34] qapi: add missing Linux user-mode targets to
 EmuTarget
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 qemu-riscv@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-s390x@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 qemu-arm@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52f.google.com
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Oct 14, 2026 at 6:25=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 14/10/26 11:31, Yonggang Luo wrote:
> > This usermode targets:
> > aarch64_be
> > armeb
> > microblazeel
> > mipsn32
> > mipsn32el
> > ppc64le
> > sparc32plus
> > are not in machine.json
> >
> > This is a prepare for directly using TARGET_ARCH_VARIANT latter.
> >
> > Also get target-info.c to be compatible with future TARGET_ARCH_VARIANT=
 only usage.
> > So that we can define TARGET_ARCH_VARIANT to target_name directly
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >   include/qemu/base-arch-defs.h | 13 +++++++++++++
> >   qapi/machine.json             | 25 +++++++++++++------------
> >   target-info.c                 | 26 +++++++++-----------------
> >   3 files changed, 35 insertions(+), 29 deletions(-)
>
>
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index 07fac4f0764..a3d6e08a847 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -15,11 +15,10 @@
> >
> >   ##
> >   # @EmuTarget:
> > -#     The comprehensive enumeration of QEMU system emulation
> > -#     ("softmmu") targets.  Run "./configure --help" in the project
> > -#     root directory, and look for the \*-softmmu targets near the
> > -#     "--target-list" option.  The individual target constants are not
> > -#     documented here, for the time being.
> > +#     The comprehensive enumeration of QEMU system and user-mode
> > +#     emulation targets.  Run "./configure --help" in the project root
> > +#     directory, and look for the targets near the "--target-list"
> > +#     option.  Individual target constants are not documented here.
> >   #
> >   # @rx: since 5.0
> >   #
> > @@ -30,17 +29,19 @@
> >   # @hexagon: since 11.0
> >   #
> >   # .. note:: The resulting QMP strings can be appended to the
> > -#    "qemu-system-" prefix to produce the corresponding QEMU
> > -#    executable name.  This is true even for "qemu-system-x86_64".
> > +#    "qemu-system-" prefix for system emulation, or the "qemu-" prefix
> > +#    for user-mode emulation, to produce the corresponding executable
> > +#    name, where that target supports the respective emulation mode.
> >   #
> >   # Since: 3.0
> >   ##
> >   { 'enum' : 'EmuTarget',
> > -  'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'hexagon', 'hppa', 'i38=
6',
> > -             'loongarch64', 'm68k', 'microblaze', 'mips', 'mips64',
> > -             'mips64el', 'mipsel', 'or1k', 'ppc',
> > -             'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
> > -             'sh4eb', 'sparc', 'sparc64', 'tricore',
> > +  'data' : [ 'aarch64', 'aarch64_be', 'alpha', 'arm', 'armeb', 'avr',
> > +             'hexagon', 'hppa', 'i386', 'loongarch64', 'm68k', 'microb=
laze',
> > +             'microblazeel', 'mips', 'mips64', 'mips64el', 'mipsel',
> > +             'mipsn32', 'mipsn32el', 'or1k', 'ppc', 'ppc64', 'ppc64le'=
,
> > +             'riscv32', 'riscv64', 'rx', 's390x', 'sh4', 'sh4eb', 'spa=
rc',
> > +             'sparc32plus', 'sparc64', 'tricore',
> >                'x86_64', 'xtensa', 'xtensaeb' ] }
>
> 'machine.json' is for system binaries.
>
> If we want to expose these QAPI types to the user binaries
> (I'm not sure we want...) then this declaration block should
> be moved in another {qapi}.json file. QAPI types are versioned,

OK,

> so we'd need some "  @aarch64_be   # Since v13.0" comments.
>
> Anyway I doubt we want to alter EmuTarget, I'd rather let it
> die as a legacy field, and expose {arch, wordsize, endianness}
Are you talking about base_arch? that won't work(we need mapping to
the EmuTarget to select the $target directly)
What the advantage of EmuTarget is that we can have a one-to-one
mapping from EmuTarget to TargetInfo
That each EmuTarget only mapping to a single TargetInfo, so we can
reliably choose TargetInfo from EmuTarget
that is one item of data

Hi Philippe
rationale:
https://lore.kernel.org/qemu-devel/87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss=
.qualcomm.com/
This was tried before and rejected.

> to management layer if this is important to consume.



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

