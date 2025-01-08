Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp782922njb;
        Wed, 8 Jan 2025 03:55:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVfTyFhmH6P3UU2T7tNo3JJ50QCasrVdUcxtEILKFIy4AOskVECQwkdyF0Cr4LGrWmeUm6PX4p1qS5Tgw==@linaro.org
X-Google-Smtp-Source: AGHT+IF2plwD/4pjtnh1nV0YEKKSRUja7HVYl/wxYeV5uu9Hrrr2vmvu8zoArrVUY3AqZJzPaoqr
X-Received: by 2002:a05:6214:daf:b0:6d8:b3a7:75af with SMTP id 6a1803df08f44-6df9b2d8dd6mr34447976d6.46.1736337301272;
        Wed, 08 Jan 2025 03:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736337301; cv=none;
        d=google.com; s=arc-20240605;
        b=eGK8en71rQYyYHKfBZzxOV8ZEPxR1h5lFhhl5AAzFCC5gQtHMtAL9h3r32fou2H0X1
         weXqlmUroGDpPYPHr5mdYNdbmMthrNmXpHgtlob8zsfKqp8UM2POOy3zzvmPICRhsTrQ
         Tcj2lGZpKyOfOl3HU0Xhiq9g+6rwBtKmiKG3jy+5OVOFwgJCW90VCEetRyPM90HOB9mI
         CZIIYdjdOHQvBr5sgzc/Uw5cKTDPz0n3TqzxabiN4lr3oaNQBd28TH/HiiG2UKDxi+xG
         R6B6olRArTWzx4d3bWruhyAz35HgRtlOP+nL81lP5czM5fbgw6bDgQ7xPzlif1AUvRs2
         IMjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=F+bRpI0Nnd7m9f+43X09eoGNgD74tibaLdM9mSkRRow=;
        fh=o7Y9GeHcDjjxmuy/Z0Zv0C/UqeZhDoIGjvmwDHfjWr8=;
        b=FJmT2+CokvhX2utRvpRHicQn/dkXwX4LQXwciZYOHVwDvkBFox9HsXSnHoowpKOAww
         7k97nxvCS3PywbZImNjdyBK1hgUP8TRLBLM3vy2/f8T6hl2kmcAcGTdF8ZgHpk/gVFEm
         4/TQ/QI4eZ5PqWuoaNs44L6qQsNPMnX7QDSeeEFabGwzlQUAKgPxSz8YazzcqKjMzade
         2WI9SKmAVIKORP2whG36YshTyx0L2eoliCSxBgJzlLwT1vncRKBI8iTuwakFp9Q5h/8a
         2qIcTOs5VyfjDCeAeTLF9x4IuJqfRJ/CcOkptxuEA4UyS62xCrCQqzY9ZUyLvk5uxiKF
         P2tQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iOI9BhcQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd1810c125si473039576d6.32.2025.01.08.03.55.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2025 03:55:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iOI9BhcQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVUdH-0006Qo-IS; Wed, 08 Jan 2025 06:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1tVUd3-0006P4-PY
 for qemu-arm@nongnu.org; Wed, 08 Jan 2025 06:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1tVUd0-0002D4-6v
 for qemu-arm@nongnu.org; Wed, 08 Jan 2025 06:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736337216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+bRpI0Nnd7m9f+43X09eoGNgD74tibaLdM9mSkRRow=;
 b=iOI9BhcQkpOGwwnVCva5SsKhJCP40WTNaV/pL279GacVynUw05Rv3EW5XwouGkkqDlDdDX
 vY69fYryzDnDFY6AkfFtLEr9Y55sDGZH8bqhdjuvpttm4NG6CFDQJN045Y3O6LBRyWpFt/
 3+1fOtQ6Q77qaT5GM5sFOi6bqeEuJKE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-E-eyM5phOfqQilncHYP1zg-1; Wed, 08 Jan 2025 06:53:33 -0500
X-MC-Unique: E-eyM5phOfqQilncHYP1zg-1
X-Mimecast-MFC-AGG-ID: E-eyM5phOfqQilncHYP1zg
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6d8e6046f0fso274278536d6.2
 for <qemu-arm@nongnu.org>; Wed, 08 Jan 2025 03:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736337213; x=1736942013;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F+bRpI0Nnd7m9f+43X09eoGNgD74tibaLdM9mSkRRow=;
 b=NK+gwy/HVSZiNAFp076//xki+4JVhmGqxoMq38Pcrj51M2LexPMTHZGBzoBGkk2dii
 NvGdswTbZBnif/D9wNBAsJpTgz6xQKYbLrIkHBCLzYVLqNSJQ0WkIrD1H1CGkeGwzbTE
 9Tf3dULPDlH5ow/KxVuUySEeABAvz9k3Mb7GdCEflQfs6vtuFZNHjQ+Tpvgl87BkFXQO
 RubkfGPh8HFMKr2VGT6TXydx2EZxP68S4Qhp5S0vAXQlqB+3NNs13DfeJ+jzHfTLeOAZ
 TMOs1Lan8/OIILv+EMSm3+Mic5aIvYiHZhopPl8y1x0zr6Iy5l1gcjEAAO66viEEmT3v
 ogpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIwfrxWyvmA68IDJkp3brwnbhJr0PEcD4TwBR5P8pyRx/Q0+hOr93Rwiunufry9+xVo7+FCUnv3A==@nongnu.org
X-Gm-Message-State: AOJu0YxZjd9QvHTNCVDA2xt6sMhl05avJKUcLvZvI0Ho+UZdGsjCiAyE
 0gKwHGL60cAwhmEot6/IVoO00GcDfuDMWsqqHrpOcWG5wdaeCv5QjLLLDPpIC3tYYXpvyQBy5Ns
 s4ijtcP1BzdLtDPc9cKoMNBIg01qxX+BbDOq+a9mEEqN7mUGZCfsCoXgK2n0CPgkoP2dXXpd1bF
 92MNPyo1uF/TjK7P5hkjt3Cau0
X-Gm-Gg: ASbGnctWHWUwNSZVOh/vx67BuG/gylkoWT9DJHCsveZpCmdDBp4m+mplXtiMJN9VsMZ
 vz09BDpwCG++/oLAVx9cZP1oANgkM3I2njQYF
X-Received: by 2002:a05:6214:4303:b0:6d8:88cf:e690 with SMTP id
 6a1803df08f44-6df9b1b4ea6mr41342186d6.3.1736337213255; 
 Wed, 08 Jan 2025 03:53:33 -0800 (PST)
X-Received: by 2002:a05:6214:4303:b0:6d8:88cf:e690 with SMTP id
 6a1803df08f44-6df9b1b4ea6mr41341946d6.3.1736337212947; Wed, 08 Jan 2025
 03:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20250107153353.1144978-1-kraxel@redhat.com>
In-Reply-To: <20250107153353.1144978-1-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 8 Jan 2025 15:53:21 +0400
X-Gm-Features: AbW1kva58vlI7scgAdLr0660Co8G94i65sjLhDKV0nllJ1pqeH1_4cvGORHyH8c
Message-ID: <CAMxuvazrd+3v2qqO-5o3qpky-ULRTwvU48jkwdxMPZG5c1RA1A@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] hw/uefi: add uefi variable service
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, graf@amazon.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7ctL8LVSVSgxfnnchQGCvUiIBDHabwkWH8gztzeoKXc_1736337213
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.432,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lgSB+i0a/OxU

Hi

On Tue, Jan 7, 2025 at 7:34=E2=80=AFPM Gerd Hoffmann <kraxel@redhat.com> wr=
ote:
>
> This patch adds a virtual device to qemu which the uefi firmware can use
> to store variables.  This moves the UEFI variable management from
> privileged guest code (managing vars in pflash) to the host.  Main
> advantage is that the need to have privilege separation in the guest
> goes away.
>
> On x86 privileged guest code runs in SMM.  It's supported by kvm, but
> not liked much by various stakeholders in cloud space due to the
> complexity SMM emulation brings.
>
> On arm privileged guest code runs in el3 (aka secure world).  This is
> not supported by kvm, which is unlikely to change anytime soon given
> that even el2 support (nested virt) is being worked on for years and is
> not yet in mainline.
>
> The design idea is to reuse the request serialization protocol edk2 uses

I suppose this is a stable protocol. (some parts are set by the UEFI
spec probably)

There doesn't seem to be a defined way to query either side version or
capability, I suppose this could be added later assuming an initial
behaviour/magic etc.

> for communication between SMM and non-SMM code, so large chunks of the
> edk2 variable driver stack can be used unmodified.  Only the driver
> which traps into SMM mode must be replaced by a driver which talks to
> qemu instead.
>
> A edk2 test branch can be found here (build with "-D QEMU_VARS=3DTRUE").
> https://github.com/kraxel/edk2/commits/devel/secure-boot-external-vars
>

ok, perhaps it would be nice to have some basic unit tests in qemu
too. Almost none of this new code is exercised by the qemu tests yet.

> The uefi-vars device re-implements the privileged edk2 protocols
> (i.e. the code running in SMM mode).

Typically the kind of new code that I wish would be in Rust. But I
suppose it is too early yet, and you came to the same conclusion.
Probably a good candidate for rewrite though!

>
> v2 changes:
>  - fully implement authenticated variables.
>  - various cleanups and fixes.
>
> enjoy & take care,
>   Gerd
>
> Gerd Hoffmann (21):
>   hw/uefi: add include/hw/uefi/var-service-api.h
>   hw/uefi: add include/hw/uefi/var-service-edk2.h
>   hw/uefi: add include/hw/uefi/var-service.h
>   hw/uefi: add var-service-guid.c
>   hw/uefi: add var-service-utils.c
>   hw/uefi: add var-service-vars.c
>   hw/uefi: add var-service-auth.c
>   hw/uefi: add var-service-policy.c
>   hw/uefi: add var-service-core.c
>   hw/uefi: add var-service-pkcs7.c
>   hw/uefi: add var-service-pkcs7-stub.c
>   hw/uefi: add var-service-siglist.c
>   hw/uefi: add var-service-json.c + qapi for NV vars.
>   hw/uefi: add trace-events
>   hw/uefi: add UEFI_VARS to Kconfig
>   hw/uefi: add to meson
>   hw/uefi: add uefi-vars-sysbus device
>   hw/uefi: add uefi-vars-isa device
>   hw/arm: add uefi variable support to virt machine type
>   docs: add uefi variable service documentation
>   hw/uefi: add MAINTAINERS entry
>
>  include/hw/arm/virt.h              |   2 +
>  include/hw/uefi/var-service-api.h  |  40 ++
>  include/hw/uefi/var-service-edk2.h | 227 +++++++++
>  include/hw/uefi/var-service.h      | 186 ++++++++
>  hw/arm/virt.c                      |  41 ++
>  hw/uefi/var-service-auth.c         | 361 ++++++++++++++
>  hw/uefi/var-service-core.c         | 237 ++++++++++
>  hw/uefi/var-service-guid.c         |  99 ++++
>  hw/uefi/var-service-isa.c          |  91 ++++
>  hw/uefi/var-service-json.c         | 242 ++++++++++
>  hw/uefi/var-service-pkcs7-stub.c   |  16 +
>  hw/uefi/var-service-pkcs7.c        | 436 +++++++++++++++++
>  hw/uefi/var-service-policy.c       | 370 +++++++++++++++
>  hw/uefi/var-service-siglist.c      | 212 +++++++++
>  hw/uefi/var-service-sysbus.c       |  90 ++++
>  hw/uefi/var-service-utils.c        | 241 ++++++++++
>  hw/uefi/var-service-vars.c         | 725 +++++++++++++++++++++++++++++
>  MAINTAINERS                        |   6 +
>  docs/devel/index-internals.rst     |   1 +
>  docs/devel/uefi-vars.rst           |  66 +++
>  hw/Kconfig                         |   1 +
>  hw/meson.build                     |   1 +
>  hw/uefi/Kconfig                    |   9 +
>  hw/uefi/LIMITATIONS.md             |   7 +
>  hw/uefi/meson.build                |  24 +
>  hw/uefi/trace-events               |  17 +
>  meson.build                        |   1 +
>  qapi/meson.build                   |   1 +
>  qapi/qapi-schema.json              |   1 +
>  qapi/uefi.json                     |  45 ++
>  30 files changed, 3796 insertions(+)
>  create mode 100644 include/hw/uefi/var-service-api.h
>  create mode 100644 include/hw/uefi/var-service-edk2.h
>  create mode 100644 include/hw/uefi/var-service.h
>  create mode 100644 hw/uefi/var-service-auth.c
>  create mode 100644 hw/uefi/var-service-core.c
>  create mode 100644 hw/uefi/var-service-guid.c
>  create mode 100644 hw/uefi/var-service-isa.c
>  create mode 100644 hw/uefi/var-service-json.c
>  create mode 100644 hw/uefi/var-service-pkcs7-stub.c
>  create mode 100644 hw/uefi/var-service-pkcs7.c
>  create mode 100644 hw/uefi/var-service-policy.c
>  create mode 100644 hw/uefi/var-service-siglist.c
>  create mode 100644 hw/uefi/var-service-sysbus.c
>  create mode 100644 hw/uefi/var-service-utils.c
>  create mode 100644 hw/uefi/var-service-vars.c
>  create mode 100644 docs/devel/uefi-vars.rst
>  create mode 100644 hw/uefi/Kconfig
>  create mode 100644 hw/uefi/LIMITATIONS.md
>  create mode 100644 hw/uefi/meson.build
>  create mode 100644 hw/uefi/trace-events
>  create mode 100644 qapi/uefi.json
>
> --
> 2.47.1
>

