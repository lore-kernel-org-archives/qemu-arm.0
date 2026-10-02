Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA03CA5FDD
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 16:59:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCgaw-0004OT-T7; Fri, 02 Oct 2026 12:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCgau-0004O3-Qa
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 12:58:48 -0400
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCgas-0000tU-0w
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 12:58:48 -0400
Received: by mail-ed2-x0f.google.com with SMTP id
 4fb4d7f45d1cf-6a60591ae54so149517a12.3
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 09:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790960323; cv=none;
 d=google.com; s=arc-20260327;
 b=nyqBUgdDdNHZJHgmoGTOqHxe5ldfleHhtDgrSRycEaSy54TIbuSoMOH6lsMjpJ6jGz
 XPYQWQuQ9Lt5zeDzBYNrvn43gUdjc6GJD8k+Sl6D1k7VitkE7f8JZBjg+zl6NsIBS0Th
 +k2+UjBsmWHf7mdgeRpx6GLn9GARHJvXcqRr2YF5wIq+wcHjuLYJhkUmY22LUA5rWr8y
 GXQQXYYhREW4fCha3Dyg+/AV/lMgTncLtRFzieMo4ZB5WLr+z6Q860PVunPhP6B8qdCl
 Mbg9BdHKbtXGf/pd0W6cfm7bT1OreFpc6CgPSGNPVlRsrpIwL1N7Yk5yEDpsgdkmNzXv
 j81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=xP5DDHCMbAjbUs3xe/3crv71NDZ6i37Mh/QwccJb0iw=;
 fh=fIrAAbPnzRRDBCLgxmZRToh+Ets2xWKHbrNQjSwoLWU=;
 b=T7ODHmNFatjLgt9k0G+PTKy2VekOcp2RlisttwK+x4iZKYvoJNugO3L/guVgKSkQ8W
 RxiAhUKKCDoLItDGAgR6C+uQ+8rA80Fg38Bh5U1oKaoEDyeWFd6mgmMMbTlvaz9BYNxT
 5aT3EmJ4pc/p6LRk9rrC4HJzFoMIW/xjv81laGRJoAlNQAcm0E3rNBTdXERmG+EySgPQ
 +TRtwmxYU4MRx/fsvewMSJ0bLEBh9UXQ2/jp0SPkjzYAy9//CJM4P9HtqzInOtiRSco7
 Ys8r8fnOSLmJh2vgZPPUQOg0b/aVf6lTiLa+zFux5uphri2RFURLwIuORexb4kb53lnj
 QTPQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790960323; x=1791565123; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xP5DDHCMbAjbUs3xe/3crv71NDZ6i37Mh/QwccJb0iw=;
 b=OBkuXYHuP5IP6Q3QVpCgtBEUjLRnfdGlk3/WLm+p4Ypqb893firRw6ebsF4szQTixo
 aOs0uyK/hs03fNXyYN3PYDCjO/hQvojkWFzMQecUE4yRqW790nySpR4JW/6dNJB9yM4r
 YWj5eGj5OZHBrsIVIBhVSVbp+5e7ZPnpv4mt5bko+XwOkke8vUFrFU5Z3pBl8Tyk49cv
 qwQVlDCDlYzDCBAsxnEHK2wNPLEqZwqeKupWgiigQ5/ryZRwdFbLyHYLq0PcfOS2MQel
 uyNeQGR+tWRwJvuiy8lZMO6dwZPmOSutR4lG40wdm3DdBeg0TtAsJjIrghqui26rKnRe
 1YnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790960323; x=1791565123;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xP5DDHCMbAjbUs3xe/3crv71NDZ6i37Mh/QwccJb0iw=;
 b=P5wwUrhf3muInNN69x6t3jb9rCMjMo3IlsdyW+2vycvoeb7lqJjsY687Cu2rkp9pAR
 1rQqquyMpdRWynISqYVMtAwHT+HtjJ5lHOl/maaZ55t9WBgeGGFow4bMJyHvHP5g76S/
 TUpxEmmd0wx36qRhuDTIE35WLTIMV0USfZGvKkO9r18ruEseymcVitCOsmqz7vYmmX9z
 UaItOyQDvntW4kFej2r42KKux9JejcU3GNu7E23d6dGicsMEoi9NowAlk46suKw/v2aV
 05h3BY6uR9Q5mztPVkVn8f2Ly42qQNei4mefO9FP77x2769WatUCl2lD9/VTeQezau94
 emFg==
X-Forwarded-Encrypted: i=1;
 AKwUvBygLGFz2Z6eap3YdanUxNHvArjoyOIlUVs13GEjDCnslpyKtDNckAAuXRhTslfhVRjPZOPSafcq9A==@nongnu.org
X-Gm-Message-State: AFq9FYI6+MRUmE9W5HjBS1SmdCN7atY3QvM1PXhzOb7g11r1QateXO75
 oJQWVHohfG+t16mIr22ztpj5tnoSeilq0BjSSZPV1wWW3E5jeV4SafXzAcXmpZnoLE57n3s9gcs
 cIz1vfPtDZgtNQDfOV2eEyjlTsnDRnlg=
X-Gm-Gg: AYBFou2rrfeH6K1CGOPicF/G/M8F6DG8JUQ61qaqwhmCnOKSMOlVVkBr/j4+gn7fE6D
 JJuov0L5nLJXzGdUezXoPAox1DTOfKr8gbVk9PeRirBJZ3eix3PFzzt65tmJ4YAZ+J2MSSQpUDr
 guHt6eBi6Y4QOZBeHRAfrsY2uWHulrX+GoNLWysyAyP3pKinmJ9pjuOHJvG3T0QuJ4Qc+JA2Tns
 v2ZDGUS/GrFgTTUbq6bFBT+J+1nfvDKzL+7b4TnA+cK56pefiJm3i0Q7sYHPUDvnlg+c1R2LvoB
 WugeZgOO1tiMAOkSYP0Aj7WABxO9P4ryDOK2v3bu8qrQXFcnmVyGIi3orRdxV+uHRdE=
X-Received: by 2002:a05:6402:27c9:b0:6ab:6f77:c4eb with SMTP id
 4fb4d7f45d1cf-6af9e362590mr2151368a12.37.1790960323384; Fri, 02 Oct 2026
 09:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2XoE8VyCpPCqRVFArBn_dDsyMw8vrSJxWMhKq17btZvO2n6A@mail.gmail.com>
 <b02db9e2-b348-4011-a98d-122e9d9f17e5@oss.qualcomm.com>
 <ar6a_uDw9OeLng6c@redhat.com>
 <6bf4dad5-4fa2-4df1-b6b8-d594dbd3842c@oss.qualcomm.com>
 <ar6lw3jAcnVej6vK@redhat.com>
 <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
 <CAE2XoE8MriyEEeRF3uDwWgnJWPHBieK_-pD1+k0tUjROWjDpWg@mail.gmail.com>
 <a9cba466-f442-4bbf-9154-3674b5f10882@oss.qualcomm.com>
 <ar_coT44h5-zJPVV@redhat.com>
 <CAE2XoE8Jg=WHDF1_pQ-K-Y6f_aE2N8y5_=aJSeC4A52HWFwEkA@mail.gmail.com>
 <ar_hNU0Y4BxXKHnv@redhat.com>
In-Reply-To: <ar_hNU0Y4BxXKHnv@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 3 Oct 2026 00:58:29 +0800
X-Gm-Features: AclHuK9oLDsuIH_-0tyf2D0IfUvd5pve5TCsKMnaTRuIfsSbB4TbL5MGHOTOL9s
Message-ID: <CAE2XoE8YbxQobHHhttKHQrEgrMg2Z1XePzwFDKB2g7E1yH1noQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Song Gao <17746591750@163.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0f.google.com
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, Oct 3, 2026 at 12:52=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Sat, Oct 03, 2026 at 12:43:19AM +0800, Yonggang Luo wrote:
> > On Sat, Oct 3, 2026 at 12:32=E2=80=AFAM Daniel P. Berrang=C3=A9 <berran=
ge@redhat.com> wrote:
> > >
> > > "is_available" is probably a bit overkill as a mechanism for
> > > introspecting, when we just need to return a list of targets,
> > > Since we have that already we might as well use it initially
> > > though.
> >
> > I have experimented with x86_64/i386 arm/aarch64 riscv32/riscv64 so
> > that I can tell:
> > using is_available will be a better option. As we can use inherent the
> > is_available from
> > parent, if we just use a bit set like QEMU_ARCH_ARM, then that means we=
 need
> > specify it for every single machine. And if any customization is
> > needed, for example, depends
> > on KVM config or other accel config or any condition not just
> > QEMU_ARCH_*, then is_available
> > still needed, so I would insist is_available with a TargetInfo*
> > parameter, then all concern
> > will be addressed.
> >
> >
> >
> > >
> > > > >> Does it matches what you would expect?
> > > > >>
> > > > >> Also, for compatibility with existing binaries, should we accept=
 -M
> > > > >> $arch-virt also? I feel like it does not hurt and would make thi=
ng
> > > > >> simpler to switch between existing and new binary.
> > > > >
> > > > > Same reason -M $arch-virt, indeed like -M $arch:virt,  but $arch-=
virt
> > > > > would be even harder.
> > > > > Because "-" is a valid separator in machine names, ":" is not a v=
alid
> > > > > machine name.
> > > > > So without init QOM, we can not reliably identify "$arch-virt" be=
longs
> > > > > to which target.
> > > > >
> > > >
> > > > From the conversation above, Daniel and I are not in favor to have =
any
> > > > kind of parsing based on this string. So either we'll pick virt, or=
 the
> > > > real qom name, but not anything else.
> > >
> > > Yeah, I'm leaning more towards always exposing the $arch-virt names
> > > in all binaries, and also exposing 'virt' in the traditional
> > > binaries only.
> >
> > I have a question, do we expose the "$arch-virt" as a machine "name"
> > and expose "$arch-virt" as machine qom "typename";
> > or expose "virt" as a machine "name" and expose "$arch-virt" as
> > machine qom "typename".
>
> The human facing machine "name" is the important one.
>
> For the QOM typename, I don't really mind either way. If we can keep
> the QOM typename and human "name" matching that's nice, but if they
> differ, then it is not a big deal - your series has the patch to
> expose the QOM typename in QAPI 'MachineInfo' which addresses the
> only downside of them differing. So whatever approach works best when
> implementing the ideas...

Then it's clear, for
single-target binary:
"virt" as machine "name" and "virt" as qom "typename"
multi-target binary:
"virt" as machine "name" and "$arch-virt" as qom "typename"


So for humans, we still use the familiar "virt". And for libvirt and so on
they still can use the old way to talk with qemu-system-$arch.
And to talk with the new qemu-system, we have returned qom "typename"
for them, the libvirt and so
on needs to be updated(not a big deal) as the qemu-system is a new
thing. If no more new concern
I'll go this direction for this series.

>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

