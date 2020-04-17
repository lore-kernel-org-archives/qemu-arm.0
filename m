Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp86944lfm;
        Thu, 16 Apr 2020 23:41:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypIloK4Mr37GJ2dcQiiB0HuejHGmXtf1DEPinZ6R4RUOnIgVkezXIMNAgwgQuCF8xBNYIVH6
X-Received: by 2002:ad4:4653:: with SMTP id y19mr1334636qvv.6.1587105666877;
        Thu, 16 Apr 2020 23:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587105666; cv=none;
        d=google.com; s=arc-20160816;
        b=Dg4LCgNjMVT1tsimlf7UyB4+cvWQy2lvdqvT/GrJq/iteDV5E/rctOjygd8epItrAG
         xpL9h/10qjN/cdoT8OfSVz/cZ/s/sQaIqlhNZkWfXf4zWlAcCDDXFgtfYHgy4PXZO/hA
         AwilWXIXdF1ZaIcsW1V+7GkoPXWT7P877WcIUgu3r0xXn5oU9q6LNBEUq557rSt4sfMO
         k/OE3b/OD7ISRxqiS05A8tL72u90l3drnsNCoEUIPQI+R1XngESpYFz+CkcqvlfbJW01
         LOmKePGYG0PDNQrIFz7qBlEjllHLVOHxoL9bZ852sanS6OuOCCCSD36Q4YJOk6jVLl5t
         6Faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=fEMxjAYNaA24PRwCIBTPQwHjswgDw/0sJlHDOVvm1G0=;
        b=Lff3zszYgoOZOg9Uf9XRe2cbT4P2I0MpCyEMdXAzgfn1DpG96wAgonbnkuLA9K4zBw
         r10gH+4TfCeo5eYrl57hWqj1JqfsA2mRL3A2zoef+nPB/0OSfP6Op3FYZvcaexfMaWX2
         a3BUKog4248uj7siL6K7ifEv871wFCq7/8l880xgbrSBvNeEK3h4Q+tQYojrEH0qyal2
         9lnsiJA7fMs2mpxP0dyi8ip8U/0yUPYAyJ7RwamObqblgpSZ15yy/2MsoiEIa9WiECml
         +5TsMx1YoxfgoHtGUCGJB908+YRvPDYBmmKhV6Q0W7+cgg32kkmmLHYBdBm9U6bROKSB
         3ZFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XNmqFsuC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x21si3994705qtk.35.2020.04.16.23.41.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 23:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XNmqFsuC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPKgU-00077T-9i
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 02:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jPKgC-00075V-O8
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 02:40:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jPKgA-0007lC-SA
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 02:40:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41133
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jPKgA-0007jq-OJ
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 02:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587105645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fEMxjAYNaA24PRwCIBTPQwHjswgDw/0sJlHDOVvm1G0=;
 b=XNmqFsuCXxdL690coyVhbivNA4fuE3U7y5DRunUChf7VXyshuTujLTu9+mhg3STZP9BkOe
 uuMQn1HUsHoHf4k61gKLjnnicwksGoelWsaGX7E0qnyfAMKH3BWjRk+2ORchW9aM0zTCr2
 H3C3/EJVncvhGmdGI1Y1XyTqLBWxrwo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-9mnkvIpwOxyu1CMAnjoNOA-1; Fri, 17 Apr 2020 02:40:44 -0400
X-MC-Unique: 9mnkvIpwOxyu1CMAnjoNOA-1
Received: by mail-wm1-f70.google.com with SMTP id q5so544546wmc.9
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 23:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2mHImV1cMqRM3Vy0b2SFiCR52s4bh8qmJiZQmqCJy9w=;
 b=ULSBDsmMSIKYfaEH/hPu+hZnwdyA4fixT1A0mmsGiKoaI2M6TbHAmCgIcX9ApqOPCe
 y4elZpwFMiUyWBmDgZOc2G7v1fJ0/o7XfHt9N02r5itl1ZrGQh126CQWvnlyPkk8rzkP
 NKMGamhohRWpmj6mRr/AkGUnp2/H08cqhMVkfxlEtli2nk6R4CzY4bfTd9nqi0Jvhjom
 wbvUw43UXLy2ullRRoIbqqTirM4k30AjaJpU6ilMuDlIqgeV3er5Jrn++b/Y0ZUXHQl/
 ZDYck8Ro4rqRvOD2qWFXHZB64kza/3j8zF66XuXzXWzSJsJA1y85GfnlGLsAafdoIQbc
 zGrw==
X-Gm-Message-State: AGi0PuYVDKZAs16L6k0D+NwruRXJg7Pfv5hht+bZBQWPCXCcZFQx8bUL
 nGk83FX/30zpIFVoWniN+FYU8EWOr0587jh+RF2cYy/caIMZ+ytuKQL4FundwKk7cvXCE6VSoAj
 xERpCbBXLdSBg
X-Received: by 2002:a1c:9e43:: with SMTP id h64mr1749154wme.0.1587105642862;
 Thu, 16 Apr 2020 23:40:42 -0700 (PDT)
X-Received: by 2002:a1c:9e43:: with SMTP id h64mr1749122wme.0.1587105642603;
 Thu, 16 Apr 2020 23:40:42 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id v21sm6436460wmj.8.2020.04.16.23.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 23:40:42 -0700 (PDT)
Date: Fri, 17 Apr 2020 02:40:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.0 00/12] various bugfixes
Message-ID: <20200417024020-mutt-send-email-mst@kernel.org>
References: <20200414133052.13712-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200414133052.13712-1-philmd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Fabien Chouteau <chouteau@adacore.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gwDPZUcaTC98

On Tue, Apr 14, 2020 at 03:30:40PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Collection of bugfixes for 5.0.
>=20
> Only vhost-user-gpu/grlib_ahb_apb_pnp patches are reviewed.
>=20
> As 5.0-rc3 is tomorrow, I thought it could help to gather
> them and resend altogether.


So who's applying all this stuff? Peter?

> Regards,
>=20
> Phil.
>=20
> Mansour Ahmadi (1):
>   hw/block/pflash: Check return value of blk_pwrite()
>=20
> Philippe Mathieu-Daud=E9 (11):
>   Revert "prevent crash when executing guest-file-read with large count"
>   qga: Extract guest_file_handle_find() to commands-common.h
>   qga: Extract qmp_guest_file_read() to common commands.c
>   qga: Restrict guest-file-read count to 48 MB to avoid crashes
>   vhost-user-gpu: Release memory returned by vu_queue_pop() with free()
>   hw/openrisc/pic_cpu: Use qdev gpio rather than qemu_allocate_irqs()
>   hw/misc/grlib_ahb_apb_pnp: Avoid crash when writing to AHB PnP
>     registers
>   hw/misc/grlib_ahb_apb_pnp: Fix AHB PnP 8-bit accesses
>   hw/display/sm501: Avoid heap overflow in sm501_2d_operation()
>   gdbstub: Do not use memset() on GByteArray
>   gdbstub: Introduce gdb_get_freg32() to get float32 registers
>=20
>  qga/qapi-schema.json                    |  6 +++--
>  include/exec/gdbstub.h                  | 22 ++++++++++++++++
>  qga/commands-common.h                   | 21 +++++++++++++++
>  contrib/vhost-user-gpu/vhost-user-gpu.c |  4 +--
>  contrib/vhost-user-gpu/virgl.c          |  2 +-
>  hw/block/pflash_cfi01.c                 |  8 +++++-
>  hw/block/pflash_cfi02.c                 |  8 +++++-
>  hw/display/sm501.c                      |  6 +++++
>  hw/misc/grlib_ahb_apb_pnp.c             | 11 ++++++++
>  hw/openrisc/pic_cpu.c                   |  5 ++--
>  qga/commands-posix.c                    | 29 +++++---------------
>  qga/commands-win32.c                    | 35 ++++++-------------------
>  qga/commands.c                          | 33 +++++++++++++++++++++++
>  target/arm/gdbstub.c                    |  3 +--
>  target/sh4/gdbstub.c                    |  6 ++---
>  target/xtensa/gdbstub.c                 |  6 ++---
>  16 files changed, 136 insertions(+), 69 deletions(-)
>  create mode 100644 qga/commands-common.h
>=20
> --=20
> 2.21.1

