Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1337858lfg;
        Thu, 6 May 2021 07:45:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvLNFoq+5X2OzOac9Er3xOI+VB+fmXmQ06nK1n8w+aQEiIwvJhiRpyUoBgQn5avKQyPWBv
X-Received: by 2002:a17:906:2c4c:: with SMTP id f12mr4762364ejh.3.1620312348641;
        Thu, 06 May 2021 07:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620312348; cv=none;
        d=google.com; s=arc-20160816;
        b=nigVTW1+AiFE62hL1AoLpwbQJGKZRRmnsVqyAB5AMDIxhr2N8RRPhDWfOySTPR7Nx5
         X5h48M+0HfRJGfPe9rMleXw5HbciLoukiEiL0aYkhRZ7Hw3bUq6JvGXmSnMXxlasFp6d
         bORtehjRLMDMa7WqphGTWnf+By7kKcbEfpIKIRatymevREYLCx034hv0XFlV3NJ51duW
         WKgdlvShPuK836KIVmdjfa15IPqIxzkOB8LLUT+/Rjjw1SsNY7Gz9ANwFcsmo71t2W/3
         Mq1jEiwosOZVG+UruDX5uGp57ir/alrSYs38lcv/LV5KPwq+68gOkU1XqmvkASoiqmaj
         mfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=GzByMzi8RPuq1LhwiN12cbY2Ym5XOCFF24Q3UuImpJ0=;
        b=Q/WN2GgASOjNzXCQAhoPC2y6Z0bwG7jUiHYOSOz1xG69f149REJcR3vHKGvEbyJrQi
         uUIIYd9MGNXV0aCnNgplzRDQ51sQAGnuAlKVwC+xSIL9fUxn5hateszNsp4Zh6LK5ga+
         eoUSjvpEVSjMBPas8nZKflXuhZCk2cjInkNGmuQWbr41T+b50XaCfZzYD7uuRxMaXKpx
         YioqFE4rK5qT9hc0fcihoNgpSQPfDV3T0sMD3m6kiYNoskznCM3PrOct/EtWlkScx/Sn
         8h9CCG9llsjczJo1VFOeLpj5mtAdKTKktYDncVUDOfLqdtHt7YtPSgJqMQ+ci5KHrEHC
         UfgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=softfail (google.com: domain of transitioning groug@kaod.org does not designate 205.139.111.44 as permitted sender) smtp.mailfrom=groug@kaod.org
Return-Path: <groug@kaod.org>
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com. [205.139.111.44])
        by mx.google.com with ESMTPS id g28si1003919edf.443.2021.05.06.07.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 07:45:48 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning groug@kaod.org does not designate 205.139.111.44 as permitted sender) client-ip=205.139.111.44;
Authentication-Results: mx.google.com;
       spf=softfail (google.com: domain of transitioning groug@kaod.org does not designate 205.139.111.44 as permitted sender) smtp.mailfrom=groug@kaod.org
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-4Jbjb-DMNXiDclDRdlqWiQ-1; Thu, 06 May 2021 10:45:45 -0400
X-MC-Unique: 4Jbjb-DMNXiDclDRdlqWiQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 337B961242;
	Thu,  6 May 2021 14:45:43 +0000 (UTC)
Received: from bahia.lan (ovpn-112-247.ams2.redhat.com [10.36.112.247])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1045F19D9F;
	Thu,  6 May 2021 14:45:34 +0000 (UTC)
Date: Thu, 6 May 2021 16:45:33 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 9/9] target/ppc/kvm: Replace alloca() by g_malloc()
Message-ID: <20210506164533.040b8c39@bahia.lan>
In-Reply-To: <20210506133758.1749233-10-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
	<20210506133758.1749233-10-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: bd+RumD+UP1+

On Thu,  6 May 2021 15:37:58 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> The ALLOCA(3) man-page mentions its "use is discouraged".
>=20
> Replace it by a g_malloc() call.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  target/ppc/kvm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb5..63c458e2211 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2698,11 +2698,10 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t =
bufsize, int64_t max_ns)
>  int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
>                             uint16_t n_valid, uint16_t n_invalid, Error *=
*errp)
>  {
> -    struct kvm_get_htab_header *buf;
>      size_t chunksize =3D sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
> +    g_autofree struct kvm_get_htab_header *buf =3D g_malloc(chunksize);
>      ssize_t rc;
> =20
> -    buf =3D alloca(chunksize);
>      buf->index =3D index;
>      buf->n_valid =3D n_valid;
>      buf->n_invalid =3D n_invalid;
