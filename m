Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5945617lfp;
        Tue, 18 Feb 2020 01:53:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqwuAoLO+a2SnRd50fkmMoUU1q7RV8gXzBrOYvtkDYKID8gyU+YphLnbnOuLMiEO/qmmSq/R
X-Received: by 2002:a37:6c5:: with SMTP id 188mr17804845qkg.277.1582019608495;
        Tue, 18 Feb 2020 01:53:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019608; cv=none;
        d=google.com; s=arc-20160816;
        b=Cc6ZgTv83HC0fXBwxjCYFwVfOBez4tfsC78ZkU85+ZfoaM0XWaxOCVN6znuBr/cyaB
         +XuhTMhcuZoe06fdmi4Yv9lhvpxZ17ircqZXEzPg9HzYONIFxSor6atvIoFOeCE/YVRW
         nuZj2vr7yFDRtUvLtFUp2PCrkHDJ1c1HHHW2lCsyJt4HWxhFwMf62GfgEjJzppQOX3bA
         oTQl6TzCG5whEuB+cpmuYThMdhb6irFU+xSasaMwUk027OyXYUtk1eCZMxrCEt8HR7ac
         LLZGN4tD9ATOM4jB42vvqygp86+LA11DRc8dQOJxAlW9HsSIZkJpBAg6hbdpQgMkQgQo
         J6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=Tck/Qr2prpuK61iRLpiXZrSo/5/pOzMSglU8r9C8hvE=;
        b=UU1q/eyYz4zu/ZY3cdF0FftPf558R1upSbZzgFdLPljl+j4R5fkOQviYBWTHAgRehw
         +iF0NZx/M9gryiHH+P9PwO1RVBpu9Qw5P5OnRmxlgLopvtBcGXHD7g/2GqWZEys2bIck
         VVm2aGFC8Shjp/X+C84x5+fKAl2CKHmvPKkhUXifQu5scZhNCbUQ45LVp7UmvHcLhZ6Q
         dsv0yPRuRhmxUJWntVpsB6MGbBozasPkvktYBsnUWd793Mhj2d58RXbrhFd0HXFau334
         dTgJPwMjGX8hccNx/eh4WUqazXjzmWdCH0zIWF0ErBXGkxYGlSFSLV5J6plTiP++EGIp
         5o1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y0Lp4iQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si1563767qkj.306.2020.02.18.01.53.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:53:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y0Lp4iQP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zZH-0000do-Uv
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45167)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zZ7-0000Z6-UH
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:53:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zZ7-0002Jl-0s
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:53:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51323
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zZ6-0002J8-Sx
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tck/Qr2prpuK61iRLpiXZrSo/5/pOzMSglU8r9C8hvE=;
 b=Y0Lp4iQPwvAwnIOrbjT6ErLutSx4e/qtKBXXi3w5VR4p+hxQicP2UOLlW70p/nCFv/nGBQ
 s7IN+lgMMODoX3hKTBSuXzZ4E0nU/JzicB8llpkpESEgtTO3KwhEXdEauXwwQyZuJp42wC
 NFhxiJK+w0gpwAJcAdb3VjycRy8f49A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-qi0c_oIpNky7_LC2txLCxw-1; Tue, 18 Feb 2020 04:53:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69607107B7D4;
 Tue, 18 Feb 2020 09:53:11 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7278119481;
 Tue, 18 Feb 2020 09:52:51 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:52:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 04/13] block/io_uring: Remove superfluous semicolon
Message-ID: <20200218095248.GG3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-5-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: qi0c_oIpNky7_LC2txLCxw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
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
X-TUID: jcDAG+D93M1r

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 6663a0a3376
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> Cc: Stefano Garzarella <sgarzare@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  block/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

