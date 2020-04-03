Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp604095lfi;
        Fri, 3 Apr 2020 05:37:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypLWP118676syQ4uKR5eTjwG+5iQzzNCTkjPYwti7shMxSFyhHTZ/PlvBirUbT5O1Dq/AcF+
X-Received: by 2002:a05:620a:89d:: with SMTP id b29mr2296887qka.329.1585917458983;
        Fri, 03 Apr 2020 05:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585917458; cv=none;
        d=google.com; s=arc-20160816;
        b=Qi/8ceBkgDCWIbvrXbC/juBbe+cQpsOV8nliRFvLt/tqoMA5G8B/4Dq6yJXqBx2uqg
         e40/atRMvgtq39y+HhZJ/36jgwtBfNb8Mb+IDClEprRZHYdglLO4WepdvPGGidOm6SLh
         Tzu15aawl0C94/I0ikGy03otj1Zu/EeWGsXYrEd4/o+nuZcPkxg/gdDYOlzVFmtj0zSh
         Lae/quhPmuyPpLmHLeJ2zTmDFydV3dO0J2nLC6KIE96BxgjICa+Xrmubsc9Pci752fnO
         rbM1AcAkpnwpelAMtkstyIF/sYQ7FGUe9X8UV7SxLozPOCCZX4jAw1/xv7svc/lurKKS
         MxHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Dd1gkcBsl4njgioJ3kCx8Bc/7yuYJ5E+utr3qgh6SW4=;
        b=htEQ9TnrqiXDcs1ZStMdNqLY+3z/2fbiLJFMDR9axS6ClzaZXECgJ7pKf/ffMa6EEp
         4aCd+2AzgRlJHEpAYlwVEIRXOqAelnIEhQQVLT/7+R5q7OqTShlP6EUSG/XmQa/uMAqT
         2YH6QCQCDS8Iq2Cnwj6G9PDOmTpB9pxOHhTfhZ0FnxeUDgani3HeFCh0eh0IPmdDOoR7
         CMBz1s+yL8Ctb2pwSkVN9jPpQl9N4AQxbK3zw0yyJSs8+YZAOb73dqlaCg9TG0PGfcRH
         FkyUgZacViSzyVpiov7jfPyeuAK51NLI5p2Ske8qR7NUmrFkMwQcGoTO1r+AT18NhBhX
         H/ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CKa2a8kJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a58si5407829qtc.4.2020.04.03.05.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 05:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CKa2a8kJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKLZq-0002VM-Ev
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 08:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54277)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jKLZh-0002Ux-9j
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 08:37:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jKLZf-00037h-Li
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 08:37:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40930
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jKLZf-00037K-FL
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 08:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585917446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dd1gkcBsl4njgioJ3kCx8Bc/7yuYJ5E+utr3qgh6SW4=;
 b=CKa2a8kJJMxmuh47t2tFfYaLuZdhczYmLqNkoQYXtb6RfUDCP+Lhd52OT/8t+dUHyC2S3O
 cixUNboLZj2nQ/8gvGLefIPW5smM9iEfTkq+uW96FSsNO4PujB/Y2w3oAvOFO2m3Qlqv01
 LgUyD/BIpUQmPBBUWVXXIDg/z0yUyao=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-vt4kiIgrM6Sw4LQGZb6lHg-1; Fri, 03 Apr 2020 08:37:19 -0400
X-MC-Unique: vt4kiIgrM6Sw4LQGZb6lHg-1
Received: by mail-wr1-f72.google.com with SMTP id r15so2986211wrm.22
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2020 05:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1OMInO7xK8SDssDQloHnMaMaMNNBWAVLV22fE4/2ta4=;
 b=LndO3qWUbz3HFXIkboMUepPRZNtQgWl72+Y83m85EDBAJucylrSzAlXt1wyJFvPVpt
 +/xDqXqTkoE4P2OPaz7jUbuGnuRSo7tMYMm3AtfcWUZz/FBWIcwwOUQh/SWHy4H+PY/F
 TQ7QViIgT/BU1mYAVtnjxJnxRIS+Hflx8/N6RTNj5+hW32d7inRVsP87KbGaLkNIlqob
 XwKaDE45RZukcg3/Pfhkyf22YY2RyCnEnjb6+TveF0A0ARnlJSRMmgNhJgr6CkfBBEBq
 Pq+WZbYfq/B90N8H/9PrmyHu3ddOPCfRe0pyeLsQQ+kXcnZrHYLGjCWa7FZwFkkR+Mrq
 5zfw==
X-Gm-Message-State: AGi0PuadlJlUwiBFEeHfvhBWEN5cDv0T47UxawwsdLeqBVMDPcPW9XYg
 vwJ1/WW+5npjBf14FpXHxbwhHPW+Bnd9EOR1BWg4y5GRfnxP4mYbuTmmqNlZDa1CM3QdsEt4mid
 wClZNXYP+Cb9R
X-Received: by 2002:a1c:a7c4:: with SMTP id q187mr8452786wme.88.1585917438565; 
 Fri, 03 Apr 2020 05:37:18 -0700 (PDT)
X-Received: by 2002:a1c:a7c4:: with SMTP id q187mr8452762wme.88.1585917438336; 
 Fri, 03 Apr 2020 05:37:18 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id i1sm11592848wrq.89.2020.04.03.05.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 05:37:17 -0700 (PDT)
Date: Fri, 3 Apr 2020 08:37:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH for-5.0 v2 0/3] acpi: Fixes for inconsistency in ACPI MR
 size during migration
Message-ID: <20200403083639-mutt-send-email-mst@kernel.org>
References: <20200403101827.30664-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200403101827.30664-1-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com,
 shannon.zhaosl@gmail.com, david@redhat.com, linuxarm@huawei.com,
 qemu-devel@nongnu.org, xuwei5@hisilicon.com, dgilbert@redhat.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e93R8e4n8zno

On Fri, Apr 03, 2020 at 11:18:24AM +0100, Shameer Kolothum wrote:
> This is to fix few issues discovered while adding NVDIMM hot-add
> support to arm/virt. These were previously part of [1] and since
> the fixes are generic in nature and might be an issue in x86 as
> well, they are being treated separately now.

OK I'll queue this unless someone has any objections.

> 1. https://patchwork.kernel.org/patch/11432371/
>=20
> v1 --> V2
>  - patch #2, Addressed comments from Dave and MST
>=20
> Updates from [1]:
>  -Added R-by and A-by tags.
>  -Edited commit log for patch#2
>  -Updated patch#3 as per David's comment
>=20
> David Hildenbrand (1):
>   exec: Fix for qemu_ram_resize() callback
>=20
> Shameer Kolothum (2):
>   acpi: Use macro for table-loader file name
>   fw_cfg: Migrate ACPI table mr sizes separately
>=20
>  exec.c                      | 16 ++++++-
>  hw/arm/virt-acpi-build.c    |  2 +-
>  hw/core/machine.c           |  1 +
>  hw/i386/acpi-build.c        |  2 +-
>  hw/nvram/fw_cfg.c           | 91 ++++++++++++++++++++++++++++++++++++-
>  include/hw/acpi/aml-build.h |  1 +
>  include/hw/nvram/fw_cfg.h   |  6 +++
>  7 files changed, 114 insertions(+), 5 deletions(-)
>=20
> --=20
> 2.17.1
>=20

