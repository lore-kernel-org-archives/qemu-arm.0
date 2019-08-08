Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7926179wrv;
        Thu, 8 Aug 2019 07:15:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxX1+JOeCaXYEb8o3VbRX3ZGT66Q4/8/0TrmfSeL7PsYzYQ+dcdsgOUcS2uAKKqsw6RGr3g
X-Received: by 2002:ac8:244f:: with SMTP id d15mr12698343qtd.32.1565273708656;
        Thu, 08 Aug 2019 07:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565273708; cv=none;
        d=google.com; s=arc-20160816;
        b=EEjbSjpWOVieeWSDg4uJTnpL+yv3GAm2ffdBOM6saRGpN3byLYc4MRBKYGhasOOHgd
         XpgyR+WqNzGh+P6glBfUPpXys/mROK1RoN89CqNlqPZ3N5FxOkkXSYDF2M09VlYh1KBa
         4xZBVeL0bVyuEMPgq5xV5mIthMx4x95zw4Ua4Q/Sot/ryBxyW6wdn69fpzdIjffIrQPX
         BZh+jB4H3nTEa3IMTgLTDu83blj7pm8137aCCFiNSYSoxektgFgCWUJB6GmlYZjU5+1U
         PLZ3N22wIpsP8SMrS4JIBLr3Xpf3V/sGcY46x1db4SjLafF4qgYDUeH3saITojdG0Lwk
         HFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=Y/dmeQ5LWmrYcDwCK0BMPcq5K9Yo+SIzYfQtQMAZGeo=;
        b=L3Vinrv/Z9WisqZ7LhWhAmmpQT8flCRGehWkekYG8NkGFPAbmwbPKJnEzRyTkpuLNr
         vg8zoJS143h6InnmapQ5wlAulXM+NPct+Z1EL0mOH5V32pxC5qtYVK1zEoAuj6Jft3Se
         Qpo/3/j0vlBZCRQu6ozDUusmDSfWQj4bKcEBtfuSfcJuXR48lMplWwlcSA4beDih2oGi
         FiMsaVozjZH7+MdA5cuXAFD1lhr5E3mNtuZVd6F1gaL9jzhXcBW0bHANiwYYKr+LLba3
         ZoMsKozfGybhjC6P7t+9zfhxtQrvlOQ1Cdcab1eLdNH3ynSmwjCDx2yIEpRBrImNnF3M
         Iskw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si1102353qkd.89.2019.08.08.07.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 07:15:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvjC8-0005m3-5A
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 10:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53134)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvjC0-0005jM-I2
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:15:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvjBz-0000h9-Hw
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:15:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40174)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvjBz-0000gk-7h; Thu, 08 Aug 2019 10:14:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 850587BDD1;
 Thu,  8 Aug 2019 14:14:57 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F18B95D772;
 Thu,  8 Aug 2019 14:14:23 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:14:21 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <tony.nguyen@bt.com>
Message-ID: <20190808161421.0e4f85f5.cohuck@redhat.com>
In-Reply-To: <1565166381875.37725@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166381875.37725@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 08 Aug 2019 14:14:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 02/26] tcg: TCGMemOp is now
 accelerator independent MemOp
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 i.mitsyanko@gmail.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, pburton@wavecomp.com, xiaoguangrong.eric@gmail.com,
 peter.chubb@nicta.com.au, philmd@redhat.com, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, chouteau@adacore.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, jcd@tribudubois.net,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, mreitz@redhat.com,
 hpoussin@reactos.org, joel@jms.id.au, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au, lersek@redhat.com,
 green@moxielogic.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 marex@denx.de, jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org,
 qemu-s390x@nongnu.org, sw@weilnetz.de, alistair@alistair23.me,
 yuval.shaia@oracle.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jan.kiszka@web.de,
 clg@kaod.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 shorne@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-riscv@nongnu.org, proljc@gmail.com, pbonzini@redhat.com, andrew@aj.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, andrew.smirnov@gmail.com,
 michael@walle.cc, paul.durrant@citrix.com, qemu-ppc@nongnu.org,
 huth@tuxfamily.org, amarkovic@wavecomp.com, imammedo@redhat.com,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ewop1M+hB2tg

On Wed, 7 Aug 2019 08:26:23 +0000
<tony.nguyen@bt.com> wrote:

> Preparation for collapsing the two byte swaps, adjust_endianness and
> handle_bswap, along the I/O path.
> 
> Target dependant attributes are conditionalize upon NEED_CPU_H.

s/conditionalize/conditionalized/ ?

> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  MAINTAINERS                             |   1 +
>  accel/tcg/cputlb.c                      |   2 +-
>  include/exec/memop.h                    | 110 ++++++++++++++++++++++++++
>  target/alpha/translate.c                |   2 +-
>  target/arm/translate-a64.c              |  48 ++++++------
>  target/arm/translate-a64.h              |   2 +-
>  target/arm/translate-sve.c              |   2 +-
>  target/arm/translate.c                  |  32 ++++----
>  target/arm/translate.h                  |   2 +-
>  target/hppa/translate.c                 |  14 ++--
>  target/i386/translate.c                 | 132 ++++++++++++++++----------------
>  target/m68k/translate.c                 |   2 +-
>  target/microblaze/translate.c           |   4 +-
>  target/mips/translate.c                 |   8 +-
>  target/openrisc/translate.c             |   4 +-
>  target/ppc/translate.c                  |  12 +--
>  target/riscv/insn_trans/trans_rva.inc.c |   8 +-
>  target/riscv/insn_trans/trans_rvi.inc.c |   4 +-
>  target/s390x/translate.c                |   6 +-
>  target/s390x/translate_vx.inc.c         |  10 +--
>  target/sparc/translate.c                |  14 ++--
>  target/tilegx/translate.c               |  10 +--
>  target/tricore/translate.c              |   8 +-
>  tcg/README                              |   2 +-
>  tcg/aarch64/tcg-target.inc.c            |  26 +++----
>  tcg/arm/tcg-target.inc.c                |  26 +++----
>  tcg/i386/tcg-target.inc.c               |  24 +++---
>  tcg/mips/tcg-target.inc.c               |  16 ++--
>  tcg/optimize.c                          |   2 +-
>  tcg/ppc/tcg-target.inc.c                |  12 +--
>  tcg/riscv/tcg-target.inc.c              |  20 ++---
>  tcg/s390/tcg-target.inc.c               |  14 ++--
>  tcg/sparc/tcg-target.inc.c              |   6 +-
>  tcg/tcg-op.c                            |  38 ++++-----
>  tcg/tcg-op.h                            |  86 ++++++++++-----------
>  tcg/tcg.c                               |   2 +-
>  tcg/tcg.h                               | 101 ++----------------------
>  trace/mem-internal.h                    |   4 +-
>  trace/mem.h                             |   4 +-
>  39 files changed, 421 insertions(+), 399 deletions(-)
>  create mode 100644 include/exec/memop.h

Acked-by: Cornelia Huck <cohuck@redhat.com>
