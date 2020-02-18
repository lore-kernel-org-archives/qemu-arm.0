Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5951163lfp;
        Tue, 18 Feb 2020 02:00:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqySC4F+Twgicr3yK+rCm889lvscWMwGWQ2JxSgbZ1pi9jAjl3ua77Xn3Vwr3L54x/nyi8MK
X-Received: by 2002:ac8:7297:: with SMTP id v23mr16368799qto.135.1582020053090;
        Tue, 18 Feb 2020 02:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582020053; cv=none;
        d=google.com; s=arc-20160816;
        b=aVxTCTVofNzh9J3KDxd4WP7JuVFBtA2XTVJw23tN3JuRcwu7DIS4UAa6lwDY+/eqt3
         ybzkf0vHtfkVAWTTnHEElHI50ykPgPmzoBpwSlmc3RGV21Wk0Xzc5riXntKR4eFI8xvz
         Olu5uYKLnaACYZXMprlLAljW38vvZomxhzB+IsSYkT/W7pb2Gtqr+tRspTMWOhuv1YfW
         8osk64u1Rw0S2frJwW72nZdg0tuUww/27Eo/YxjjA7zMTvINYYB+zCvRmE9Lf0M8xPgK
         sxQMkGBge4P8i4Wg3F+MzbLj9YBGWGb6DqT9IAlKIWJ+KyfS3jf9L8s6FrI0h861ZzG2
         KHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=PSdoaDpcjuMsY9+RCbhjnC/nAltEB1nfZhS6Dcm2AS4=;
        b=RYJKbt63qNDqy9PaZ4kHN3SOC119KgT0SelZx6y8c0Bz59So7PcaLmZfwW16r1MtRF
         Qf5xZbM3jDSB3fboeBA/v1QQ8DiTNyWykw+sxjg7LvHFBtPHKtfB3gM08hdpchWKXh8f
         MiJKexmON5b7ibG+n5R2O5cVlW/i4K3Bbv2ExYcQ2wLtLktywn6rO/aC4/bQNeJ7Y9gb
         Vf89Ay+OtjHTiUYurY1za3NNYwNkZvDIH0VNxf+FEb0hI1SqxpYTAJ1X009T1DtMe1VQ
         x2NMdqTqV6j6pQZC4GqCW4nlwztqzjfgjzVH6/GFk2dAJLeufzlBC7vgaepjH3sC9DnQ
         3nFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dd5ZBVdd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si1559670qki.54.2020.02.18.02.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dd5ZBVdd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zgR-0005OO-Cg
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zf1-0003Do-4U
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:59:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zf0-0004hl-5P
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:59:23 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57532
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zf0-0004hU-0w
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PSdoaDpcjuMsY9+RCbhjnC/nAltEB1nfZhS6Dcm2AS4=;
 b=Dd5ZBVddpTyWYez4+hVBIrE5NHL6eXn/GjZvUBR/zE+m3VizNGhTKlm9Z6D3Orb+M5/cbX
 +52Fta7d23f617LU+bsTrnYd7d1H4G98Cf2T5e3NCubq2Qw0YM1ZPg/5mytnb/5WPa3cS/
 Qeh++dvFlxuNlF3HWAunCGbV1KiEyaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-VmESdGpZMZKUYxDtqqpbDg-1; Tue, 18 Feb 2020 04:59:20 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E304DBA3;
 Tue, 18 Feb 2020 09:59:18 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3683219481;
 Tue, 18 Feb 2020 09:58:58 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:58:55 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 09/13] migration/multifd: Remove superfluous
 semicolon
Message-ID: <20200218095855.GL3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-10-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-10-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: VmESdGpZMZKUYxDtqqpbDg-1
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
X-TUID: XgORX35gvqFR

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: d32ca5ad798
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/migration/multifd.c b/migration/multifd.c
> index b3e8ae9bcc..cfaba1369e 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -305,7 +305,7 @@ static int multifd_send_pages(QEMUFile *f)
>                  + p->packet_len;
>      qemu_file_update_transfer(f, transferred);
>      ram_counters.multifd_bytes +=3D transferred;
> -    ram_counters.transferred +=3D transferred;;
> +    ram_counters.transferred +=3D transferred;
>      qemu_mutex_unlock(&p->mutex);
>      qemu_sem_post(&p->sem);
> =20
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

