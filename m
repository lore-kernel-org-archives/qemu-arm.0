Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7947160wrv;
        Thu, 8 Aug 2019 07:32:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzpny1dCFbAh9td8keDZa9pMcRzrCjXTmabTgISqaXWoMNOyrisqV809UK9oedKvxXPlhB4
X-Received: by 2002:ac8:45d0:: with SMTP id e16mr13203084qto.337.1565274722888;
        Thu, 08 Aug 2019 07:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565274722; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5tJJgrEP6TXL9gi4MDJAh1J7sV1GGJ7FJ629/vojO54dMmtBuzpEuvK/Mfcj+8jnu
         wi5Hwsh6SVIVICdQMDfPqf40qTKwHFWJZckgJdl8Uf/4pZn/vBQaumpQnQvuN/5MXJgu
         zJ88Falni3KYx2Cx1NTicln2kNVl1dkllOLMMqZXEaFjPHbQ8MzjafzevdvvJFuBkgQC
         +DZrNbSQC3+7+GjJPvrNAxZid73yOPQ8pk+/FrwFz0bmQB8yjnctVZCGwiGvvb2ptkHC
         eUEBEpWoBgZZ+YXeunX0aKLiX4M9chtGDQYKrHjwwXTaBtLryShL8Jci50HbdAsyZ9b6
         is/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=rI3uFvyTJNe36NmV9Sc8Q9MqZjQWyW9xrt4DPjcLWr4=;
        b=FVFb/RkcW5CcS+nvTd3gNgZUAv0A6UGNxcgCK6Yuy8Pg758JSbyp0TVfnU8NAEG089
         lEsYJAoohGyD+PFlT3SIIewDrcaO9FvZBh73mI02DScNWFHWbgaAMvtv1i1lWCtdFPL3
         Iua+I438YZR2dpm76QkHqasNriJcZk5DxI02PbHQzVmz1mt+6j1omraey5aqVe9gUAaf
         0LwT6cO8SS+YrtMr5Q+f577p8NZQzh9LEK02r5rS8bx9nfjDsj/z2iBOpShZ3eJVArwI
         o9ng6DYeBTYbK0U9Bns3eOhWhGq3TFd50gAy7L939o3hTE7rtPa0X3vRoBHWSL/9u+U8
         BaTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i23si5269126qkg.92.2019.08.08.07.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 07:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvjSU-0004Wz-D0
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 10:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56074)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvjSD-0004Vg-TB
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:31:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvjSC-0002E7-10
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 10:31:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54922)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvjSB-0002DO-SA; Thu, 08 Aug 2019 10:31:43 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5EC4FC04D293;
 Thu,  8 Aug 2019 14:31:41 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8EFA194B9;
 Thu,  8 Aug 2019 14:31:04 +0000 (UTC)
Date: Thu, 8 Aug 2019 16:31:02 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <tony.nguyen@bt.com>
Message-ID: <20190808163102.47c8f056.cohuck@redhat.com>
In-Reply-To: <1565166454836.5266@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166454836.5266@bt.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 08 Aug 2019 14:31:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 05/26] hw/s390x: Access
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
X-TUID: Ml9RtDFb+zWz

On Wed, 7 Aug 2019 08:27:35 +0000
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
>  hw/s390x/s390-pci-inst.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
