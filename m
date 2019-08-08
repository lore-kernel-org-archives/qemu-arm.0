Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7918345wrv;
        Thu, 8 Aug 2019 07:09:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxoQpuvTJHELQyMaAEsLvaUxB2qhXUBTTuV21RspNx0SDUtQ2mGTqX/pWNaZRaFWxEo/jq+
X-Received: by 2002:a17:906:b283:: with SMTP id q3mr13542952ejz.153.1565273351326;
        Thu, 08 Aug 2019 07:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565273351; cv=none;
        d=google.com; s=arc-20160816;
        b=o0EX5u8WD3qwnnH7ZSDlYRam+ge0OuDF1TF5uE1iifNCchSYi9H/TD8TZQ7PrVRJCU
         0/nOVu6Tqei/mRNdB2r1gfVncvWwKQYrXAjwbQTfR1nGC4TlVRtCDI5BUwEJAOAknX6q
         bc1CB8EHRNwWyEnWpFACMVQrT+lJRYtBgmQBTpt6HcB7zeJqoJLV3MlRjsFtFxWSCrgg
         zut2/EqMX9rjFucmUbuvYV/Rt3nWLJCINBPW/DfK6/wOue/8T8gWRDAzkDrInQD9Y90S
         xbebWxAFg+JbkCFEBtWqlA+e3S9pV/dbFJW1/yQ96B3iEecKmTdoR8p/9+lnr2GEPGwI
         POVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=HefEvhkQ6jm9E7en3CGCBSelaeIsAGFJPz8a2myuWiU=;
        b=jwPxwymOvXWbjeH70BwkIHPHOtC5981dAQogpQGv46yhkZeaTbh+GgCt4zZGvrTdgp
         LT8XktS/aHG4jzw/l7azKhnep2FcssBmnN+18ZMx2MwIataKr6+rLt8iAKaEEmRgu4dH
         hCsyX7yNvZu2VMhGzAgnCKs9n6SBybe+IviSSCh5BaVgheHv99SK/u+oG/eetAKFmqwg
         e4F+sfFqzfmQkuL1zsi67+FWNyFXI6dbPM7AiGLSaL4hY3mXvepGl/aCNbL2yHYogPi3
         JeiPNrMNFLeWGpg1CKb7TAV+V95L0wAR/qu5wo/VnIZDlEnkYUc9j8mfV/AoWQ1Q07pz
         STrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si32798923ejv.386.2019.08.08.07.09.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 07:09:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvj6M-0003hj-EW
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 10:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52117)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvj6G-0003fH-8Y
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:09:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvj6F-0005VQ-90
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:09:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53370)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvj6F-0005VD-1K; Thu, 08 Aug 2019 10:09:03 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2731D30C061E;
 Thu,  8 Aug 2019 14:08:59 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8989260BF1;
 Thu,  8 Aug 2019 14:08:05 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:08:03 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <tony.nguyen@bt.com>
Message-ID: <20190808160803.1326a244.cohuck@redhat.com>
In-Reply-To: <1565166336833.46550@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166336833.46550@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 08 Aug 2019 14:09:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 01/26] configure: Define
 TARGET_ALIGNED_ONLY
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
X-TUID: 4+wBaNV4uuI5

On Wed, 7 Aug 2019 08:25:37 +0000
<tony.nguyen@bt.com> wrote:

> Rename ALIGNED_ONLY to TARGET_ALIGNED_ONLY for clarity and move
> defines out of target/foo/cpu.h into configure, as we do with
> TARGET_WORDS_BIGENDIAN, so that it is always defined early.
>=20
> Poisoned TARGET_ALIGNED_ONLY to prevent use in common code.
>=20
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  configure             | 10 +++++++++-
>  include/exec/poison.h |  1 +
>  include/qom/cpu.h     |  2 +-
>  target/alpha/cpu.h    |  2 --
>  target/hppa/cpu.h     |  1 -
>  target/mips/cpu.h     |  2 --
>  target/sh4/cpu.h      |  2 --
>  target/sparc/cpu.h    |  2 --
>  target/xtensa/cpu.h   |  2 --
>  tcg/tcg.c             |  2 +-
>  tcg/tcg.h             |  8 +++++---
>  11 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
