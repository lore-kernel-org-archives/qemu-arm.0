Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5948278lfp;
        Tue, 18 Feb 2020 01:57:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwlOFv11fLaZ00OmpJ9K9pk+ddzV8OGh5g9F3ciZxoprUOC3N7Z6X9VWKLYuvxHGa2MOyik
X-Received: by 2002:ac8:694f:: with SMTP id n15mr16681871qtr.372.1582019830278;
        Tue, 18 Feb 2020 01:57:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019830; cv=none;
        d=google.com; s=arc-20160816;
        b=i49IdstwhFVwVvIfA5mpmG3EKjSdE69bpoaZni3Y4LHXTCruEzhJ751ugqf/itcxI5
         dULQ7475wniZX5tA5EhD2NUI1yR3j+pWDOOTP0xi7hgamaD4lDJqbvPxEvtJHVNUtvfX
         AIqVlhhkEzJzve4FoOhMVmY8sjxJm89HDX4s7D6dbEQhXZoDoqhvQeKoGNyTtrV5rInI
         a5eiLV0hGrvt7fAP0p+E7B+ilGL85QOzf+gh0JtOdHjYXBubMrSbzGAkT3Ei+aHqFXtd
         dsaHRKm+wbK/orHruWIpgFrp4f9dLaDXAWn9lCBJrM6ydELxmVldrzONC5G6wd4aX/3T
         MOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=7cJzAc12RVZRNEnjQBJhzyiL3IOCizN0eERxIa09ET0=;
        b=em77+JsSwq5Thn8L01BXo2YhrgnRTRgMV/w2O+YUgFcqYaXzZ0e6JQfliuaQczmpfi
         U91XU8a+yu99wVUUIKW7XXJrXVv/Z6xWW2xDNBjZzHUXNmDUV6tgDjQ6Iok9yMFHeu38
         4hRKqe9h6IVIue2Mf7p7PplDH6tQ1DoBTAXR78UnD70ALgSuCP1WBpyizFUJn/wFsvJ5
         BPMrY3glxMhfoeR45jPlntNvy1g+0jIsXW8eyzwwMhvDb47GO2uXFOLLcWW+xcxiuwGZ
         fHvaHl7GDxAhXxHkx75J64hlG5IA1lmk2/C/C6nipnByacvgfWfHAYcCFoBO+jNQdjGw
         n8rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZEG1ofHs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c23si1468955qtn.240.2020.02.18.01.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:57:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZEG1ofHs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zcr-0006ue-Ma
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sgarzare@redhat.com>) id 1j3zbN-0004QZ-U6
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:55:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1j3zbM-0003Ae-Kd
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:55:37 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29098
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1j3zbM-00039i-Fe
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7cJzAc12RVZRNEnjQBJhzyiL3IOCizN0eERxIa09ET0=;
 b=ZEG1ofHs+LC6qQawtVNyVTFn7I5L3wzfANjepgtTM0wg7agrQuLo9PJ8DzDwg10AXaf3cX
 G/Kc3ftXvO3xnPFzJgT8FzeTSHTMbMtb3kcJx83jD72C4UdoXwesITDvKhFkq8XhxTmYGd
 D8165w+Rv8i4Av2wjd9zxO/XwWVqcb0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-psAqnPbNNi6zQBjjnYtLDg-1; Tue, 18 Feb 2020 04:55:33 -0500
Received: by mail-wr1-f70.google.com with SMTP id 50so10575288wrc.2
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 01:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HgFqoSoARH3uk7odBpEdG6HCEcZqvIBJgyeE0i3cD20=;
 b=eD2Kd0RxifdrMI0dAX2BzL8tD27fUllQI5sIpmLdR7Kjs04e+ff34nty2anGlDuJG/
 mpIZj+zhALMbeVaLXy82nXV3eY+1x+aYQRdRL/Q/LBeIEbRDuKMMzzBG9t+wgn4hqJ1X
 zRhJHtIWrLx1p+eYQGc03HOSPx/NjHP7G8AjdQvRBgg33a3M5kxkaUBzB/xkM7gQ8J5G
 H0PtVv7iZ1g12dQXL/r6OYfwg2ieQY7k97/PoRKa2TjUmFH64IXXiY34dDxbcnRhbbXt
 I0iawzqFNkCPNjfde2MdWc1q8l3IlR8QUS1YVdU46GkDF5kafvT/GEElC98OwNZootZx
 5stQ==
X-Gm-Message-State: APjAAAUdHSJQK9Nft/crYn2kOzgc98PD3+a2iTC1bo1A0eR8CBf5LMAr
 CLA/U6LH+4snSTZk/Gsq5z6wvtZ9mbazukYS9AZf4Pn8yQGEiAoD3xpq/uiYuKI6YR3qWkK7Bwo
 S4xurVvMqU3PUkBI=
X-Received: by 2002:adf:a453:: with SMTP id e19mr27305872wra.305.1582019732646; 
 Tue, 18 Feb 2020 01:55:32 -0800 (PST)
X-Received: by 2002:adf:a453:: with SMTP id e19mr27305806wra.305.1582019732327; 
 Tue, 18 Feb 2020 01:55:32 -0800 (PST)
Received: from steredhat (host209-4-dynamic.27-79-r.retail.telecomitalia.it.
 [79.27.4.209])
 by smtp.gmail.com with ESMTPSA id 25sm2912651wmi.32.2020.02.18.01.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:55:31 -0800 (PST)
Date: Tue, 18 Feb 2020 10:55:28 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 04/13] block/io_uring: Remove superfluous semicolon
Message-ID: <20200218095528.3i26z4shmvqznput@steredhat>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-5-philmd@redhat.com>
X-MC-Unique: psAqnPbNNi6zQBjjnYtLDg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Cnup56AKNia

On Tue, Feb 18, 2020 at 10:43:53AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Fixes: 6663a0a3376
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> Cc: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  block/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

>=20
> diff --git a/block/io_uring.c b/block/io_uring.c
> index 56892fd1ab..a3142ca989 100644
> --- a/block/io_uring.c
> +++ b/block/io_uring.c
> @@ -187,7 +187,7 @@ static void luring_process_completions(LuringState *s=
)
>                      ret =3D 0;
>                  }
>              } else {
> -                ret =3D -ENOSPC;;
> +                ret =3D -ENOSPC;
>              }
>          }
>  end:
> --=20
> 2.21.1
>=20

