Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6330393lfp;
        Tue, 18 Feb 2020 09:04:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqyK1hWziG838aWZJQ9Uxjo2kvr2V84OEFHG7CmfSAWffJie2Ua7RNP5H/0o755cuAXuCzDb
X-Received: by 2002:a37:4a95:: with SMTP id x143mr18017376qka.23.1582045499254;
        Tue, 18 Feb 2020 09:04:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582045499; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgMvMLSq3+fcDfHJllL25KIClvbRRjCsI2n6HHzBZ1f62LCoerstRcwCsn1yk+OAN3
         a9UJV2JVM1BrKb/GlPh4/w2wROSDUlt9UxRLmCGUXPWEOxqs/w8SHbPTxAV9nO2UlyBW
         dgBH/+hkqjUC16EpdWDH1p67sM9bDwaK2bhmpRjLhM37L5GV4ATiDl1knAgdcf0wNf4Z
         +W5HlQJW8Ln0gPQ2mOXnLHvZI3gEH6yOYUfen53C0M3bGUJDHxB35Rt0ntLn1TN6Yo4X
         3UPtugoUWq/tkstsp2atgvZDDo0dHceb+iN08LQ7SvLY8hr3/yU7EQvA+omBabzEOv8V
         Elww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2544dIPgl1aKA4Z7K5Z4971BiGCIl2iah54j9kjCL4E=;
        b=YXjRD1Uz4w2NjtL7f9GFvBjJmeRj4Yxj0Ags5FnnbOZKfK5YgIizPBtAa+/9UEPeod
         qbSo+hsloydKKJAZjCiM4TnN73/m8Px8f7Wqzqjap3S/CG3T5HqVFflwxI7jEEMR/t87
         kez4meB9D3LfUo4KTcLsnPqnwn0HBSWgIte5E6phwkr3L6XEpGtQaIHuYoCRZqUxPP2G
         eKAPMomHWn5REUz1I4AiF5po13tG/C2bg3vKyFvuew//OgLewxqYLBVMfh/mVyyI5klc
         Ku/mpyfC0mavf2/ssHtDqtbpjJU/O8cpBIAhxlmC1m5tQnwaPyXZDBbL3VZxpieHL88c
         PERw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OT3TWL08;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v23si2139378qkg.331.2020.02.18.09.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 09:04:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OT3TWL08;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j46Is-0001Nq-Nj
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 12:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j46Id-0001Mz-7R
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 12:04:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j46Ib-00006j-Gf
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 12:04:43 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34287
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j46Ib-00006A-Bd
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 12:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582045480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2544dIPgl1aKA4Z7K5Z4971BiGCIl2iah54j9kjCL4E=;
 b=OT3TWL08SPxHhWfVHfMEk4tJF1BKgZ3nptUSNGMhuI2ndk32emuh6UkbQrbGy/GjbwB23C
 I7yjUJl+cJ2+asNxSKJrqytvat3gqrqZhBOCHs7ojnmErjCVqUrZpqNB/Xer4itKJOxtFs
 1Use9XRQQvj0XMTTXkvF85Oj75VCNn0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-VIVZ7FUfP7KinJ5ppqd8hA-1; Tue, 18 Feb 2020 12:04:30 -0500
Received: by mail-wm1-f72.google.com with SMTP id o24so339188wmh.0
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 09:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jf3dlEYrCzOw89Pny9+wuZ6snqo+K0B74r4yZz2W9gY=;
 b=K73Uc1tRetGVBrKhmT2Ewu+50txTLWg8eZt9OgY2AsBzaJRNPXG1WWKocdeGhPjdcT
 c/k20PzkAKmrBWohkwkhA4qqOrgPVhfb5TahK+J1sWSVH3g+Cxk9feKOVZWSoRT5JLIU
 Wkk8Am+tQL9NIPgarS1d5/dRet2kO9xIQ9b+mL+Rdy1X2ejWyhNZDWBYhurGI8lHIcss
 AostoUuXFN9732df53qWA97YCuTe5LbmqlUhA4QQStETmw42FZrikw8PX9z8Hg0+R5Ih
 5ys97KVkpPgqIzBlaq2N601ivUW3fRWak+3IrQvD1b2qTahIiAGUClcfAipSk42mdhHW
 4fDw==
X-Gm-Message-State: APjAAAVc1U/UBwJ4RqyiGTWeh9qtQzlJ2GFRiWedVEYw0NqNXoY5JYNR
 Shf06zR1TbGf82ugar2H36PFpHNgjNm4dDYmejlL37BiHATRNhw+FAplUCQ3VnuWRG5GX0lYEQG
 VuFOSAFOQLIeg
X-Received: by 2002:adf:f80c:: with SMTP id s12mr30272984wrp.1.1582045469013; 
 Tue, 18 Feb 2020 09:04:29 -0800 (PST)
X-Received: by 2002:adf:f80c:: with SMTP id s12mr30272937wrp.1.1582045468711; 
 Tue, 18 Feb 2020 09:04:28 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:59c7:c3ee:2dec:d2b4?
 ([2001:b07:6468:f312:59c7:c3ee:2dec:d2b4])
 by smtp.gmail.com with ESMTPSA id a16sm7026333wrt.30.2020.02.18.09.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 09:04:28 -0800 (PST)
Subject: Re: [PATCH RESEND 00/13] trivial: Detect and remove superfluous
 semicolons in C code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200218094402.26625-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <55411270-83ae-d6aa-362f-07018b44c0e1@redhat.com>
Date: Tue, 18 Feb 2020 18:04:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: VIVZ7FUfP7KinJ5ppqd8hA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s7Tpa7LkFFOO

On 18/02/20 10:43, Philippe Mathieu-Daud=C3=A9 wrote:
> Luc noticed a superfluous trailing semicolon:
> https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg04593.html
>=20
> Prevent that by modifying checkpatch.pl and clean the codebase.
>=20
> Philippe Mathieu-Daud=C3=A9 (13):
>   scripts/checkpatch.pl: Detect superfluous semicolon in C code
>   audio/alsaaudio: Remove superfluous semicolons
>   block: Remove superfluous semicolons
>   block/io_uring: Remove superfluous semicolon
>   hw/arm/xlnx-versal: Remove superfluous semicolon
>   hw/m68k/next-cube: Remove superfluous semicolon
>   hw/scsi/esp: Remove superfluous semicolon
>   hw/vfio/display: Remove superfluous semicolon
>   migration/multifd: Remove superfluous semicolon
>   ui/input-barrier: Remove superfluous semicolon
>   target/i386/whpx: Remove superfluous semicolon
>   tests/qtest/libqos/qgraph: Remove superfluous semicolons
>   contrib/rdmacm-mux: Remove superfluous semicolon
>=20
>  audio/alsaaudio.c           | 4 ++--
>  block.c                     | 4 ++--
>  block/io_uring.c            | 2 +-
>  contrib/rdmacm-mux/main.c   | 2 +-
>  hw/arm/xlnx-versal-virt.c   | 2 +-
>  hw/m68k/next-cube.c         | 2 +-
>  hw/scsi/esp.c               | 2 +-
>  hw/vfio/display.c           | 2 +-
>  migration/multifd.c         | 2 +-
>  target/i386/whpx-all.c      | 2 +-
>  tests/qtest/libqos/qgraph.c | 4 ++--
>  ui/input-barrier.c          | 2 +-
>  scripts/checkpatch.pl       | 5 +++++
>  13 files changed, 20 insertions(+), 15 deletions(-)
>=20

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Laurent, can you queue this in qemu-trivial?

