Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5949648lfp;
        Tue, 18 Feb 2020 01:58:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQymq48xeGcwwGsxfHnepa6Prd+wy5OgM6ax7qI0nMrHubjx/ifmQiiXs6TYtz8mXQ8Wmr
X-Received: by 2002:a05:620a:1586:: with SMTP id d6mr18395192qkk.234.1582019931165;
        Tue, 18 Feb 2020 01:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019931; cv=none;
        d=google.com; s=arc-20160816;
        b=qdaHGz1+agNmfPznjdFp2xxCHC2fw4GZ728sI43LBpjU48FHCChqq6i++LkexSaplL
         7q5os8RiY7B+su5pt7INR0QbAbAyEBxeGMc8jvElwzJMofB1WbV1oSCAURL5wHzrFLbf
         mNuU8l0lAYcmw8A9iJ+o51syqPeMr50YqhhhtQCkTDxfVKO8oJ1dcSukk3xVR6lz3OCV
         xhGR1z2BdYeZ4oA5XSBjKz2YFNE1rsxWn73LVbaxJdTOJYNtQ/Af/JQl5wegKe2gQn07
         z0Tey/jVhmEkpNteon2eHszYUNa7Gl3iv+huwkIFo3rgmu1/5hCaEr42mbSC0uAZ3ToG
         nr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=IkHt848DxWWkhO1vgEArZ549QARmKfZARkw1A+Y7GNY=;
        b=f+SMtM4F3rzvi94vF3hmHT5mm/MNkrbJ/Gh9AwpRstOrvsjYvEnu9YTICvrw6Ck/m/
         Ow/8b6NFLbyCjWsvea4YCFacklPIVn6GiN+bOD9+xLA1zSyg01sJuQd6mtLVzUsZgC+0
         cZjonUPKzVCTBRz5W6GmVZAh0fQXSiFtgOQbRlOBZdXngvJPkIydv3CYIKra5MDzQepo
         gROZls/GZZvnCeMWwqKZ+9k6jEo5Bdzp1Hq5vxFhIH6NItN6TnX8QWboO/hzojirxHSV
         Fr11l6a6+/m1jqCxYzmUL7s7BLu8UhxGea/HRVTtxOD/IX7WS8x8tKcTHTgMXXkDEz+V
         U3zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tsj85fQE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si1464535qtn.359.2020.02.18.01.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:58:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tsj85fQE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59673 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zeT-00028k-Js
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46049)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zeJ-00022M-Pb
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:58:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zeI-0004S7-Oj
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:58:39 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34710
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zeI-0004Rj-JU
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkHt848DxWWkhO1vgEArZ549QARmKfZARkw1A+Y7GNY=;
 b=Tsj85fQEflC+QD9WV+syiJeLTJfdm3WV1Y+Hg4NIpesAlbbADYBVj0K9N6bQ4HjvosURUG
 wztNKRzouc9Au0ha3kE7pFVf7NICHm13DDks0qyx0cmJnjjKLspS6VCVyo8b9WVJHfBfw0
 PhP210hrZFeHUv+qrfk7AqHWPH6YO1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-IPj_3_YnNmmEd9W9ixlS7g-1; Tue, 18 Feb 2020 04:58:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A5E98010E5;
 Tue, 18 Feb 2020 09:58:29 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6773E5DA60;
 Tue, 18 Feb 2020 09:58:08 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:58:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 08/13] hw/vfio/display: Remove superfluous semicolon
Message-ID: <20200218095806.GK3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-9-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-9-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: IPj_3_YnNmmEd9W9ixlS7g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-TUID: 5JMy2oZw0bSX

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 8b818e059bf
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/vfio/display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/vfio/display.c b/hw/vfio/display.c
> index a5a608c5b2..f4977c66e1 100644
> --- a/hw/vfio/display.c
> +++ b/hw/vfio/display.c
> @@ -287,7 +287,7 @@ static void vfio_display_dmabuf_update(void *opaque)
>      VFIOPCIDevice *vdev =3D opaque;
>      VFIODisplay *dpy =3D vdev->dpy;
>      VFIODMABuf *primary, *cursor;
> -    bool free_bufs =3D false, new_cursor =3D false;;
> +    bool free_bufs =3D false, new_cursor =3D false;
> =20
>      primary =3D vfio_display_get_dmabuf(vdev, DRM_PLANE_TYPE_PRIMARY);
>      if (primary =3D=3D NULL) {
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

