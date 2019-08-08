Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7949688wrv;
        Thu, 8 Aug 2019 07:34:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbBEZeaJ1KhJua+ClgQDlyAhogtkqi3snHm0mt9zNZJk1f0vMt4xrU506Ax/NTYz4GYXMO
X-Received: by 2002:a50:b6ce:: with SMTP id f14mr15472368ede.236.1565274840311;
        Thu, 08 Aug 2019 07:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565274840; cv=none;
        d=google.com; s=arc-20160816;
        b=dilQVmlKK+I3g7A2UqvS9Fl7rxlF1BZBNmtaKP+jxcTLKEX5h94M3sMy3OtYR9sLiN
         2GKLNrzZKSdz9ezizDshaEJu9KspoJvIXIIYwUtCMx7Y8fvn450I3dKJWuyP8VmtHsC9
         yma5QcsZA/XpRC2upapXp4IS7j6SWpMsSRkIAxm5xG3TLlE86cOkkLbAeRtJYdg0k8mC
         UrVTvczoR6uQ+NB659e3ecoC26NHMODMJT1YIN8LNXJWMnlkBOcZ2n7lyEXoTnnyIcMb
         yguL9LBiwfBWnVCZ9KtTLfSiE5K6qhEoW4RWXTf7KYtkP7jC1Pb1fNvelAcwqLk3BiJp
         16TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=3bl3oqrnza5KBLdvZ27nPKg+JtoRUg9ZCIykYuLio6o=;
        b=vo+cWKMHi3q9J/qdDbKhgoLEZS5sCN4nu0fW1CaNHJa4XvZhpbhUyHv2ZNaoHeUpLi
         V9KtMTRhbNuuMofH3+t/3wkVyqsDtJSMRwpOyOoI1WkqviWFYmUdb/FE6QbRYi7iZYkv
         engXBqR/VpHgN9iP5qEFjrp0RcH1euqn3SyoDKgBrZSvcpJ3M+tnlZi5gWuO30LAuFTp
         YDanXktXDAkCr/Y66paxMfZuamWEg8etFs4raiRX4b7xI2sUbRc16Ho1rWaCaD4umyr+
         aeUC9TmhCNYqD9J4jIrNakafac4j6leCv+k6SW8II5Bny/G/Kyd1GZXAA12SL4Hf8kIA
         n0FA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p50si23339065eda.338.2019.08.08.07.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 07:34:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvjUN-00070d-Cc
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 10:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56474)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvjU8-0006el-Uz
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:33:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvjU6-0003SK-QM
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:33:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48196)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvjU6-0003Rt-La; Thu, 08 Aug 2019 10:33:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 65E91EE561;
 Thu,  8 Aug 2019 14:33:41 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A11C260BE1;
 Thu,  8 Aug 2019 14:32:54 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:32:52 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <tony.nguyen@bt.com>
Message-ID: <20190808163252.2909e8c9.cohuck@redhat.com>
In-Reply-To: <1565166496048.47265@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166496048.47265@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 08 Aug 2019 14:33:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 07/26] hw/virtio: Access
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
X-TUID: 6xofZ5zDuEiz

On Wed, 7 Aug 2019 08:28:16 +0000
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
>  hw/virtio/virtio-pci.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
