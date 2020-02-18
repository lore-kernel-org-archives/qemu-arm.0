Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5950947lfp;
        Tue, 18 Feb 2020 02:00:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqyUoMp0s/1Q7WS60100tyLVNhyNTWaKNbm3XhnYz7kPvWeWpK/I4Z3yFswO6MHRTjmOkGZr
X-Received: by 2002:a05:620a:247:: with SMTP id q7mr17646653qkn.199.1582020040239;
        Tue, 18 Feb 2020 02:00:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582020040; cv=none;
        d=google.com; s=arc-20160816;
        b=lUkR8UAPuI73xXg3XMxLboP9JsgjpG8s1sgedHd367ZRuptwI9BXbrRvSIJilIhQHb
         EyGrXrOtuGvwSbSGYr/X16TGjCDmFZ5wjuvDv+SdWg7Me82YCsi33hdfDa56SLU/ShLv
         vPOapM3pUoOW1kDTVuUq+rOcqZwqTGyQMaJlho4Wo1cQMojMF2He2CsrZ1zlkiGfGJk9
         kC1JVQtkLyBMV3kcm5RObIMabKTbuByczSvcOsJ/NwyRj+dheJzZGKaliMRzvLptEiM0
         FacwovzZUpkKSz93QJPMxTi2HVVH/a5N2OVmDZygCXjXoeEbTAiizvfJKXi4xebbDDYT
         MaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=qDbx61T4Q0bmDfIc+2zbjFF4eWEyPM0f+8ojJBMdH+k=;
        b=uvb/CpmxHEJrmBK/9p3wi0FP4Lhcu0k1lDdNxxeBgsiLYiYDUr+papQLIZH/kRdXBU
         w6eoDVwlDJG6HzISk6TMrbjpfnnUPRYn+WCTLzppMpQVOBw/wj8qJXYri2kLeAOmvjrl
         7Vcl4ARdV4sgVU/1OgZP38lOGIA7XJPVfkyKacf1zHXwRloZgoGRK3HFkm6xlojG91dW
         BKPgQfLfzIVehVZTd4g9P2lalHNhSbCYZ3jCotHy9bgDE3MTVHytzmBFLVaGVYI448/F
         8D080XfsaTIqYkHlKs8gzQ1q+uh1ej+AFcdK3sFA9IzFIOPYyBgzzcUh2RqWPdJRivoD
         au7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AND8KQF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si1660188qkh.26.2020.02.18.02.00.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:00:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AND8KQF0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zgF-00054N-Lp
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zZr-00025U-V3
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:54:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zZq-0002YL-Vq
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:54:03 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60517
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zZq-0002Xz-SF
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDbx61T4Q0bmDfIc+2zbjFF4eWEyPM0f+8ojJBMdH+k=;
 b=AND8KQF0ZBDq+z1o9obLzkixzjfIW9FFC0sJXFiD8fTzTm+WnTV+reLVx2eZuz3Vs03lyQ
 aSSrvzdzwUoeK4aueSWaMo9z/hl4LpUV8Dqc1snpHPnkrXfbdWHwb0fJbB5KOosLLmy6w4
 GKeeKHC1QTNW+Cbw3xk0katDhmAHcGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-btOGXQXyM_qUxLkPaA8nDg-1; Tue, 18 Feb 2020 04:54:00 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C266189F760;
 Tue, 18 Feb 2020 09:53:58 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E44E27061;
 Tue, 18 Feb 2020 09:53:37 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:53:35 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 05/13] hw/arm/xlnx-versal: Remove superfluous
 semicolon
Message-ID: <20200218095335.GH3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-6-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: btOGXQXyM_qUxLkPaA8nDg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xl1JZQs7lCR3

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 6f16da53ffe
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/arm/xlnx-versal-virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 462493c467..0d2e3bdda1 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -350,7 +350,7 @@ static void create_virtio_regions(VersalVirt *s)
>      int i;
> =20
>      for (i =3D 0; i < NUM_VIRTIO_TRANSPORT; i++) {
> -        char *name =3D g_strdup_printf("virtio%d", i);;
> +        char *name =3D g_strdup_printf("virtio%d", i);
>          hwaddr base =3D MM_TOP_RSVD + i * virtio_mmio_size;
>          int irq =3D VERSAL_RSVD_IRQ_FIRST + i;
>          MemoryRegion *mr;
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

