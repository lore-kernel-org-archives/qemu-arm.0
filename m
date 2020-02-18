Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5955887lfp;
        Tue, 18 Feb 2020 02:05:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJdfg24v8AbYgTZtsCClQsklBTcKapf9S7AgsHayEuoR2oo9cOTvAO/wyM2KsAvC4x+Xa3
X-Received: by 2002:a37:c89:: with SMTP id 131mr1086369qkm.440.1582020342501;
        Tue, 18 Feb 2020 02:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582020342; cv=none;
        d=google.com; s=arc-20160816;
        b=DHgzxibbRKW74ZI4seYLcRhuYYba8g94oithkYtZ7wYyMNeOwShzvqnHvPWwOIcbqc
         HHkV9h0DO7pxGs2bUpC0jCX5Mz89f8EkL0GPIDsInZXv94W+sUJi0vcoLpF/27arcXWE
         O++QiW23zmvnmbVC8lDAIP38pflUr7uQkzz5j/lCZfh02xhQ4V2n+EbAkRCN1AJ7Oj+6
         jRN/KML6zw1P5TgeQZJqIDiSqCBJ0GuCI943vl91I/jIkXTLjiQu3I3d/gNydiOk0z43
         zk/QZEjLAtNBOQqlwaju/G65rSaS8dSgaJUGZvcFLUsi3sa6eWDYubcPeRXZMY2x1JDo
         sg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=PJALTyvcBMpA+vzSfbVeBchj5gcI3zO3pngsiwbXCAk=;
        b=tzYYGUw4gCBmQw2+jNG4/xYZCcQpBP4dcGwUr5Wobd0hf8ky6VaGr975hlI0tTJ8pg
         VnPEF76royQdvsRnAs8zS+mMl0YPAbCNg0mg+zDJWhLDgluOfkKbbIYPeUbAK68GGswB
         VwkCj6bgzv24qzoyVp9YCEnFD1O+isvYyjClCH8Q9rIb4tFkgCuCUwg75Nc8wsK+uqLd
         ZTwfNtWiYd5XjGtR6QCQ7CQPpsOHAHGXgP9bnCw4RS7YhB/9s0yaxJtxGK506oFx++Yu
         w70lJfo7P7HmqX2CNexccFBtpgPIy+g0X0HJw6Gv2GOD9LRasjdtMawEzFGpMa55CwXH
         4OiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UvrhIxO8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25si1376022qtg.329.2020.02.18.02.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:05:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UvrhIxO8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zl7-0004xM-VL
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zgN-0005YE-Eh
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:00:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zgM-0005nV-G2
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:00:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27280
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zgM-0005my-B0
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582020045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJALTyvcBMpA+vzSfbVeBchj5gcI3zO3pngsiwbXCAk=;
 b=UvrhIxO8lw+X9aj4Rh6SkeXZtL155LplQa9DD7StGe2ABlVoDjCHiSQ6dztmINTV+sqS9t
 pVtAWxWOJKK0Pfc54AYP2L3jVR6o+RJsgNyUIFHM4+vuDb1MGrE0xcsp0vAAW6RPNSLe3i
 FOcbhXH+rUn6mDFFvTMIMTDyt8SVLUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-MINsvDlFOQeXEJF8N6_s-A-1; Tue, 18 Feb 2020 05:00:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 020241005513;
 Tue, 18 Feb 2020 10:00:00 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9590E90772;
 Tue, 18 Feb 2020 09:59:40 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:59:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 10/13] ui/input-barrier: Remove superfluous
 semicolon
Message-ID: <20200218095938.GM3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-11-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-11-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: MINsvDlFOQeXEJF8N6_s-A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pWB5ge2fE7rm

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 6105683da35
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> Cc: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  ui/input-barrier.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/ui/input-barrier.c b/ui/input-barrier.c
> index fe35049b83..527c75e130 100644
> --- a/ui/input-barrier.c
> +++ b/ui/input-barrier.c
> @@ -455,7 +455,7 @@ static gboolean writecmd(InputBarrier *ib, struct bar=
rierMsg *msg)
>          break;
>      default:
>          write_cmd(p, barrierCmdEUnknown, avail);
> -        break;;
> +        break;
>      }
> =20
>      len =3D MAX_HELLO_LENGTH - avail - sizeof(int);
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

