Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7953573wrv;
        Thu, 8 Aug 2019 07:37:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxuUNlY0ixDIb96Isyc6LpS404HprwcrEQidLAgYxaUuMFFYETsgsoF1ICISzP3aa9btq+n
X-Received: by 2002:ae9:ea17:: with SMTP id f23mr13459514qkg.236.1565275034753;
        Thu, 08 Aug 2019 07:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565275034; cv=none;
        d=google.com; s=arc-20160816;
        b=LGYVGTMtJ6yIgkq2w3dQu4rTMbbXdj9uqSfhPMuU9dOLrrGyiGd6KY6wSAPTiG9DjF
         nc8AfnapXIBv3vbasxMxgy+92h/mq2tFJFC5eKJ8AyLApXpgsSJiTxGNRwXjnkxVCBHj
         ir6XaDR4FLcCbxqhYbNMyFm99fJhhVU6QQ+TL+dRJye2I3PIQN0GvblsAJVyNBZrMNKU
         DRfU8xS8oekFRGjTq47k4aWIasBDstXKKPctOP0GK4vrLwvorU5aLnXIWbMe85zpDVgI
         m2b+n0eg3jvETXkeMpq7W/XcZS+vp4dCzt1hSus4GwEMhRGj8P1SYfbfPiQWAePSXDRg
         j/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=h4aVh+HKp30MZ4gzB85BtoaMGDHEniZZD04THqP+KI4=;
        b=nv3yALOgxwYdu1EWoxwQw8/kf1Yb6WCjlFx6Pb7VLlv8rvss4cVyJdBVuwfKmcPNFf
         kQ/eVhOywo94O0x9im3WM6GiF9zmRrlRyEYfnUP5Z7zO3OdUkYVa32zjHRp4q5+dTNtQ
         vUHojAmhY0gvNVrsimIv4xdnmt6VDD9XhDAEKE0/xLDYys4R6r+5rvreeR1Oi73ef71y
         X+LqbeZMJMPnReh52W7HgcgRrSKxonqBp9sEJIfWnoGmpkalkKZs0yaTcnwWzwP/TBlk
         PKxCuWllCbcQBbS4cGnhLkfg88FvjRh2BNkvdPaTbwTG2VE3PT7Fd4AWJrIACJkIF2uH
         OBaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n38si57393191qvc.79.2019.08.08.07.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 07:37:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvjXW-00030V-AH
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 10:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57105)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvjX3-0001tM-3H
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvjX2-00060i-2C
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:36:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47866)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvjX1-00060H-Nd; Thu, 08 Aug 2019 10:36:44 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7655E6128A;
 Thu,  8 Aug 2019 14:36:41 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF1451054FF1;
 Thu,  8 Aug 2019 14:35:29 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:34:46 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <tony.nguyen@bt.com>
Message-ID: <20190808163446.41e4398e.cohuck@redhat.com>
In-Reply-To: <1565166520130.61317@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166520130.61317@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 08 Aug 2019 14:36:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 08/26] hw/vfio: Access
 MemoryRegion with MemOp
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
X-TUID: V8uGnxOdULpc

On Wed, 7 Aug 2019 08:28:40 +0000
<tony.nguyen@bt.com> wrote:

> The memory_region_dispatch_{read|write} operand "unsigned size" is
> being converted into a "MemOp op".
> 
> Convert interfaces by using no-op size_memop.
> 
> After all interfaces are converted, size_memop will be implemented
> and the memory_region_dispatch_{read|write} operand "unsigned size"
> will be converted into a "MemOp op".
> 
> As size_memop is a no-op, this patch does not change any behaviour.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/vfio/pci-quirks.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
