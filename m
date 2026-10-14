Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0945FCC6B2A
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 12:19:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGxws-0001kc-Id; Wed, 14 Oct 2026 08:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGxwo-0001kD-IY
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 08:19:08 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGxwl-0005Pa-5m
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 08:19:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6aa8d04fcddso8326125a12.0
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 05:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791980340; cv=none;
 d=google.com; s=arc-20260327;
 b=BlXJDzL4SS/exH2Ac+/4JQ3RRkD844XOQcg63S8E5CP6TqZLVFbKpw4gSrjUIYlm5a
 p7FuSTrhXCabRoWEth13DajTSCXAPhRbYm3dqiMwuUcERKU1yAPa5+6mlU+/ErFuygGl
 QmMviEmiaiS4drK4Gq323pg9q42xhPoNQIrax8pakewKCDHj0aYEODYBKQSWZ+vcQDYT
 +UN9U8Wd1MasZHqA3TvrsDe5jN/9kWCaWQ36Q1y5KNOiWu9cNOd7iYFZ700kugYFFn0b
 uOnPtyV7UM+mQ6RzBPiAOYPc4SWbGVp0faegaDzYphBkXjSX2IJfxYD0bIDoxRVZWeYH
 K0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=ssRl3kbqja2TBFr7DxtKqnpuftUarLL3G3B+v9cQ3R4=;
 fh=wZj36VJxdGmf+m57aPi76GpsWCjGP8M8t4FAy13vI9s=;
 b=A4tpmCR8jUYgDiBpdcRFhdcOSzOAboh/9sA3YwF2gZXrKTS76YNpLGSV9WTLRol4xr
 tPOoGyhtlavL9Ad5kuNo81SlwxzYlqxsRB9TLWJCfn2UBlG3lzs60KiyIHQAIKce8RmI
 v9s4VzL/LtDLS0qJxl6h5K0mYlNdAmBp66cccjDXG5KVPyOdDV71NuB/s2mJl8M5eEwF
 DL1wCHCKGlpiYGYcqM9+fLSdul1P4xI3e93iQzU8T3WB3Ag35fLyALq8QVpgqONvMH/t
 2WY6+NTEDj5vtUYJa9hJ6L36uywCLYmTJ4cwQehN/h8aSGjKNsywA78RgRkUkmeYFW+y
 uj8A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791980340; x=1792585140; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ssRl3kbqja2TBFr7DxtKqnpuftUarLL3G3B+v9cQ3R4=;
 b=sLEkmvREnoI8bbLrgd7HDgQL6iqhILvbpTA/RUE8+eCN2eCNDksiuvczOBn4Wy82fX
 zPgRNPU74BTmcOHPYQXqszW6a8HWsjpUOoMeTi5bw6ax9VyOANeRCAR6pfm3M0Be7g2D
 w0t3Msp/YTy1xo0n5CSqkB2ln4ztAG3YesazvS0PawWz5Mf7CPvrhg36ah2oh7Mq5Unz
 CFIFU9kQxWBwPOr29PadzVIoa6Mw4CRAEnZz6JdoKdqgEW1q10Jw4667mcb2pEp68QQj
 yLkdZCpW+xxNvg5/Ck+/3YwxopdvQ1NETaCtzCZQn4VMLoGM+/OYGRprrCq9tdnn/JUz
 e8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791980340; x=1792585140;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ssRl3kbqja2TBFr7DxtKqnpuftUarLL3G3B+v9cQ3R4=;
 b=zjNsOsWqO9/J5564zWhz9BwV0k83luMFXWyyH+qcbNgHICuNkkac79tYUWRYPg5qV3
 xoWASxlarUF8F1qEHDdu4OuqRdzoyJR8kZCzsOfC71oRISZR5GH2vYkODLkgzFIQe4FT
 Cpv4CynKuNxfc5+IcYnRVcNUBgaQKkNV5aRORZrJ9vgYgjRSQFWK/OXID83VQrTorpee
 lMAdyI2xb/WkQ3yUTY100bibIAThV1/ORHfITnsuPvZQdDgNbZ0jRmg/1wn1eTl/LwoX
 NDRcchOpakn0RboZCb/bFOJ2+ED3uycjju2bjI57vUNXqVQlBVWqZS0aYVvqrcPGyZdQ
 Od2A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxs7bjnzU9jYMqgCs2K/w6pNEoZoU8msTuPGNp7YVQCOlIZgEl7pODkAaejtud3ElrVlyo+RabR8w==@nongnu.org
X-Gm-Message-State: AFq9FYKczvB/lpHngLY7jcQyhaiRAFt1Bd3dHEyEr/hPGYu0A1Gy07Rs
 ldjHCoDIEm1RtLN6VR/MQumJeo8qkHe/TxembTMHfXUBnqWws0DU0q9VEppDnuoCfEbbhsf0R88
 mSCGFourCZAPfiyS0StkNtqnb8q24V3c=
X-Gm-Gg: AYBFou3MBT8tqPqhFcdH7a9WfoILte143h0fDAVQNVziBnUldmLZgeF3u1N4ZlcBYLi
 HkdXso2xJ6LWKPvh6XiLv4Cor5ryoeSEdPK2ULrJu+kL1RBvUD8PUjmuwyi/NW4ClefZvOhT78l
 z0K1BcgfhfXjYpPKC0YiocC2Ib+jD/VPlnK01QOu4h6PO7q9vKAANuFurA2WdjTGsNN27ELp8GY
 WKCrK+pkKO5h0iTZwgqvBNQbF2JERCv5jMj2R64zrc/j2+ud9N45z0QxmpkxsAdJmCbvVqMLlgO
 5yjweuvducNuosE36ro4f2XQ5YB6lZwJ0oDt0OQksB4sUn6DA/xfbKk=
X-Received: by 2002:a05:6402:401c:b0:6b1:bb19:de98 with SMTP id
 4fb4d7f45d1cf-6b1bb19e440mr8365980a12.1.1791980339890; Wed, 14 Oct 2026
 05:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20261014093152.834-1-luoyonggang@gmail.com>
 <20261014093152.834-5-luoyonggang@gmail.com>
 <87ecdscyoz.fsf@pond.sub.org>
In-Reply-To: <87ecdscyoz.fsf@pond.sub.org>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 14 Oct 2026 20:18:47 +0800
X-Gm-Features: AclHuK_hLX6fS2anu37HyXXnIlCZfmtNKhy61ehqdJR6WqkDWHSlRaw__mjX-k4
Message-ID: <CAE2XoE_OReOLTzfeEPAUS7doy94M-V=fVzRTrwD190obxn4ZYg@mail.gmail.com>
Subject: Re: [PATCH 04/34] qapi: rename SysEmuTarget to EmuTarget
To: Markus Armbruster <armbru@redhat.com>
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
 David Hildenbrand <david@kernel.org>, Laurent Vivier <laurent@vivier.eu>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 qemu-arm@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x535.google.com
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

On Wed, Oct 14, 2026 at 7:24=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Yonggang Luo <luoyonggang@gmail.com> writes:
>
> > As now it's also expressing user-mode targets.
> >
> > This changes the type name exposed by query-qmp-schema; enum values and
> > serialized target values remain unchanged.
>
> Are you sure?  query-qmp-schema masks the type names.
Thanks, I'll remove this.




>
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>
> [...]
>
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index 9b145c635ba..07fac4f0764 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -14,7 +14,7 @@
> >  { 'include': 'machine-common.json' }
> >
> >  ##
> > -# @SysEmuTarget:
> > +# @EmuTarget:
> >  #     The comprehensive enumeration of QEMU system emulation
> >  #     ("softmmu") targets.  Run "./configure --help" in the project
> >  #     root directory, and look for the \*-softmmu targets near the
>    #     "--target-list" option.  The individual target constants are not
>    #     documented here, for the time being.
>
> Is this still correct?
This is a grep rename. I'll update it later, thanks.
>
> > @@ -35,7 +35,7 @@
> >  #
> >  # Since: 3.0
> >  ##
> > -{ 'enum' : 'SysEmuTarget',
> > +{ 'enum' : 'EmuTarget',
> >    'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'hexagon', 'hppa', 'i38=
6',
> >               'loongarch64', 'm68k', 'microblaze', 'mips', 'mips64',
> >               'mips64el', 'mipsel', 'or1k', 'ppc',
> > @@ -95,7 +95,7 @@
> >                        'qom-path'     : 'str',
> >                        'thread-id'    : 'int',
> >                        '*props'       : 'CpuInstanceProperties',
> > -                      'target'       : 'SysEmuTarget' },
> > +                      'target'       : 'EmuTarget' },
> >    'discriminator' : 'target',
> >    'data'          : { 's390x'        : 'CpuInfoS390' } }
> >
> > @@ -281,7 +281,7 @@
> >  # Since: 1.2
> >  ##
> >  { 'struct': 'QemuTargetInfo',
> > -  'data': { 'arch': 'SysEmuTarget' } }
> > +  'data': { 'arch': 'EmuTarget' } }
> >
> >  ##
> >  # @query-target:
> > diff --git a/qapi/pragma.json b/qapi/pragma.json
> > index 342cedc42e7..93a710ee937 100644
> > --- a/qapi/pragma.json
> > +++ b/qapi/pragma.json
> > @@ -72,7 +72,7 @@
> >          'SsidSizeMode',
> >          'String',
> >          'StringWrapper',
> > -        'SysEmuTarget',
> > +        'EmuTarget',
> >          'ThrottleGroupProperties',
> >          'VncPrimaryAuth',
> >          'VncVencryptSubAuth',
> > @@ -109,7 +109,7 @@
> >          'QKeyCode',                 # send-key, input-sent-event
> >          'QapiErrorClass',           # QMP error replies
> >          'SshHostKeyCheckMode',      # blockdev-add, -blockdev
> > -        'SysEmuTarget',             # query-cpu-fast, query-target
> > +        'EmuTarget',                # query-cpu-fast, query-target
> >          'UuidInfo',                 # query-uuid
> >          'VncClientInfo',            # query-vnc, query-vnc-servers, ..=
.
> >          'X86CPURegister32'          # qom-get of x86 CPU properties
>
> [...]
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

