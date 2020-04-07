Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp5079647lfi;
        Tue, 7 Apr 2020 04:12:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypLTUxclaP+LU+36/4BXUq4DPMVQVzDBQhKsZi0KSTJrXwbhksHTTdlwaY67/sXmu1YENVjj
X-Received: by 2002:a05:620a:16ab:: with SMTP id s11mr1496920qkj.16.1586257963896;
        Tue, 07 Apr 2020 04:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586257963; cv=none;
        d=google.com; s=arc-20160816;
        b=Jtmz4cGjo41R2D+kF5spFB7o6/jUc93Bz6zNV4LkYSebjk/mrFbJ42KiQff5wiu90P
         JDSUlfEbMcJj0tkBtZuuy0z0rqnJygNKzZ7/T/ZX5wcQ+88AX2AXP+hB+cZo7/CB0gEE
         sFoC2LWnBdaHH7g2uljQecQbDTlappoxCuXCwVr1V0hBDB+Y3VIF6Yh/9/H+cUkqQ8IJ
         +qp/3keEShR1X9dIWazbeU0r9KhKrMUEk+66sADsR2auLcVp7w360Y8eel8iaAbDrYaO
         oVAnla7O4ITBmhMx+TA15MK6882u+y95n6NnO2kmO0iLuZ+ar7jQV7yxYTQzepWgqOZo
         0YJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cSUdV4YJp2r4Uc62ffvGv4zQUWbZQAl/6XoUgsGODn4=;
        b=yt6oouDPMkJE6Nh1Sm2GErmr1KJJulwZjZVu8eFjtKILzd8FyyzdZI67JYiNaCtAGP
         ALuXzfa4oWQvf9eUfsbnHrlgxbb6FTh8aQlNvbsUNIhc4uwl7pKwBtqITZEBzmTq/jWw
         1ra4hh4kD17aQLBuC+D2gBNbEoJlw6cJnnWL/ptJPPUv2MRz8rxEZT87KMrTo4paKwOu
         3TIe//LFchpURdfBC1q1CsK5OYXEHJXYYFERtTft5qbNhRf+vkLBN6GQKey1Dy27xJEY
         XzUwE4KC+0QHHunSCs+HONx2TLendTy8dAz1ObeeHCwJeaJBmhEjxrKztUIUSBtsOT6+
         nWPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BLl9jbkZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w25si1486917qtn.87.2020.04.07.04.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 04:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BLl9jbkZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLm9r-0006lQ-CS
	for alex.bennee@linaro.org; Tue, 07 Apr 2020 07:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLm9j-0006jt-KS
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 07:12:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLm9i-0006xK-Df
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 07:12:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58859
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLm9i-0006xA-AV
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 07:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586257953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSUdV4YJp2r4Uc62ffvGv4zQUWbZQAl/6XoUgsGODn4=;
 b=BLl9jbkZVvUxg6SRKIHduURNqxc6ZwjYses46eL4csohzgcCvzUR19nLuNT0jJTT+tZkrB
 XUVTy11wYbyRnzYA7Z17DOWLq/89+cyOh59rrOKWQVskD9no7PCtXashIGcIYkbBrGa2K2
 Sf6ugo1qgXuVjAK6PD/OVb85cgMGOMU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-OLsGtGePMDey2BBLkWMQvQ-1; Tue, 07 Apr 2020 07:12:32 -0400
X-MC-Unique: OLsGtGePMDey2BBLkWMQvQ-1
Received: by mail-ed1-f72.google.com with SMTP id k7so2816389edn.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2020 04:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IAfi00UCbTdnAMY5UYEliobHyzCVnYDyFiL/3c4BkNQ=;
 b=CVC4Hp8regWEtI+GgzCEkOk+3Y9o3gCAfAEzcY6nifBRCQ+i8jc743jNkjjJKqYdtx
 H4wfy7hwurla9t7zRH+22tlRhb7yAUwz02ayIgdvjbHHsYwQPRoJfqZZdhL8ljk+dHto
 kW9stH1QTEHuVCt7vH/Moh4pCAkFEFSod7DblWsL/UJ8OD8HO0fWvyEJ9F8Xfk+0tMZ6
 6PbgRHA3E5vmDiGhWd2feuxZVgkYNaiG/vkPeXoeV4sWK4BEaYHP4tPCfVyPcgtA4rfM
 iHPSN6Yin/JNNgpstrzFYyHNXhQlwfVrvsbdSPh+mdcmv0fvNgl35Hwj/3RsSF4zpcb/
 wuSQ==
X-Gm-Message-State: AGi0PuYDKFp9/vtpJmzzW61283PXGnYs/ZgIRdmxkLRmKsZuNEjnTJJ4
 QIwdalDA/9r5Ue0kUrWg8fnUxXGMWtoP0qZu4pcYSqjHwXKCKbzaz8P8EvO+D9ekgMYF1S0MqYe
 3h0Rl6moY7BeN
X-Received: by 2002:aa7:d383:: with SMTP id x3mr1406515edq.222.1586257950377; 
 Tue, 07 Apr 2020 04:12:30 -0700 (PDT)
X-Received: by 2002:aa7:d383:: with SMTP id x3mr1406488edq.222.1586257950106; 
 Tue, 07 Apr 2020 04:12:30 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id um17sm420868ejb.50.2020.04.07.04.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2020 04:12:29 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] dma/xlnx-zdma: Fix descriptor loading (MEM) wrt
 endianness
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200404122718.25111-1-edgar.iglesias@gmail.com>
 <20200404122718.25111-2-edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e447464e-eeb9-3024-fc52-6e03dcb79a17@redhat.com>
Date: Tue, 7 Apr 2020 13:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200404122718.25111-2-edgar.iglesias@gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6MHlI8BUppy0

On 4/4/20 2:27 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>=20
> Fix descriptor loading from memory wrt host endianness.
>=20
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   hw/dma/xlnx-zdma.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index 1c45367f3c..5f4775f663 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -299,19 +299,22 @@ static void zdma_put_regaddr64(XlnxZDMA *s, unsigne=
d int basereg, uint64_t addr)
>       s->regs[basereg + 1] =3D addr >> 32;
>   }
>  =20
> -static bool zdma_load_descriptor(XlnxZDMA *s, uint64_t addr, void *buf)
> +static bool zdma_load_descriptor(XlnxZDMA *s, uint64_t addr,
> +                                 XlnxZDMADescr *descr)
>   {
>       /* ZDMA descriptors must be aligned to their own size.  */
>       if (addr % sizeof(XlnxZDMADescr)) {
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "zdma: unaligned descriptor at %" PRIx64,
>                         addr);
> -        memset(buf, 0x0, sizeof(XlnxZDMADescr));
> +        memset(descr, 0x0, sizeof(XlnxZDMADescr));
>           s->error =3D true;
>           return false;
>       }
>  =20
> -    address_space_read(s->dma_as, addr, s->attr, buf, sizeof(XlnxZDMADes=
cr));
> +    descr->addr =3D address_space_ldq_le(s->dma_as, addr, s->attr, NULL)=
;
> +    descr->size =3D address_space_ldl_le(s->dma_as, addr + 8, s->attr, N=
ULL);
> +    descr->attr =3D address_space_ldl_le(s->dma_as, addr + 12, s->attr, =
NULL);

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>       return true;
>   }
>  =20
> @@ -344,7 +347,7 @@ static void zdma_update_descr_addr(XlnxZDMA *s, bool =
type,
>       } else {
>           addr =3D zdma_get_regaddr64(s, basereg);
>           addr +=3D sizeof(s->dsc_dst);
> -        address_space_read(s->dma_as, addr, s->attr, (void *) &next, 8);
> +        next =3D address_space_ldq_le(s->dma_as, addr, s->attr, NULL);
>       }
>  =20
>       zdma_put_regaddr64(s, basereg, next);
>=20

