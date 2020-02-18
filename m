Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5949385lfp;
        Tue, 18 Feb 2020 01:58:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxegFnYUM6T/r/r9XkM5m8FlMm3ywEc2ZKaUvEkn1bpdOW6ez2e7RgEaxRRvZGBE6o+8u8s
X-Received: by 2002:a05:6214:a48:: with SMTP id ee8mr16208691qvb.90.1582019913524;
        Tue, 18 Feb 2020 01:58:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019913; cv=none;
        d=google.com; s=arc-20160816;
        b=RVeKtgg81own+KDsG1fTU+3JWrCfpQqMna78VKHXYChhK3EC/mbnq7k6c0F04F2Hm9
         Urjgbm1Aau2JEX5M62/nqDq7FclXZztls5k2IEXeDJGbeTjW1TgvNdoynAqVdrm/7+LO
         UM0yOYSxjW8QWG+0gFzEikQa4yfsuNF6fnrbOu0AvEbTsAUjCJnmn27sJRNR7l9OYXbj
         cA7Zf/3St8Cl5zXmWMt6tNg23aDSxQ+90yx3NNlZ0AQMwrqJ8ddmpzM0+ZeJRee7pzWU
         QSrTjJrzO+1C0toWGoS3ky6jTZXugfbMDATYq5eRYi9+CFGVTJce9t/XL2dcIfAg5k7s
         ylJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=ZX3chkrwvDhLB1ewTZIHUP1V/2meRWAQMlNE8/MgjsU=;
        b=LN3TE52NxgHPETRL16xy+PwyeD6MsUfKVu337BzvY0wy9uY3cwZsFwHyJNbwODhhHo
         6B54PqFHpziHIEo6nDlIP1zNsnjpV/V8S+uodVUaA8Bu/oJxFXBJgbE+Vh5c5wEbsPda
         kAcrmbW+apv5+hN4jaIxoIXdhGjyi/adgHL9ppRAf+kNV3U2gyBCRmwzhUcpPpFrHfU0
         qP2R+rY1Fck6tzFqUd4q7T8nL00TYTvW6A2bZQ/0eq4Fx62d5MIG8aQQBmzDqNDF/c/V
         ByQfFudF2duyyJlLEeYP0qY5VQRf5Sx8HQz/pOjcOwS4vWoo9aJbA1mYarrL8DYscrUH
         /mew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="fV5eo3/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si1466084qtn.26.2020.02.18.01.58.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:58:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="fV5eo3/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zeC-0001i8-VV
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zYU-0007gm-K3
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:52:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zYT-00026B-Ik
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:52:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33275
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zYT-00025u-Ea
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZX3chkrwvDhLB1ewTZIHUP1V/2meRWAQMlNE8/MgjsU=;
 b=fV5eo3/3uNp4kSFo7C0N/mlLM/OVdSQWibiZMWqTN+CrS9xOmOlbihZlEgDK+cXTsu1cpN
 4EqWDYUTCj+FhbElOp1Zw+gXRWbnNdRncOZzk1AedLLwFfIYOWjGi4rX8TuCuLaXM6tQL+
 3WaDqrV2qZypFwnwJFGK8DqN9NbKNnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-13CTc3uKNJiuDkp9RAwOBw-1; Tue, 18 Feb 2020 04:52:35 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AC29800D50;
 Tue, 18 Feb 2020 09:52:33 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 146088CCC5;
 Tue, 18 Feb 2020 09:52:14 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:52:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 03/13] block: Remove superfluous semicolons
Message-ID: <20200218095211.GF3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-4-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 13CTc3uKNJiuDkp9RAwOBw-1
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
X-TUID: 9vWKtzOujVtG

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 132ada80c4a
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  block.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/block.c b/block.c
> index 9c810534d6..9db0b973fe 100644
> --- a/block.c
> +++ b/block.c
> @@ -2435,13 +2435,13 @@ BdrvChild *bdrv_root_attach_child(BlockDriverStat=
e *child_bs,
>      if (bdrv_get_aio_context(child_bs) !=3D ctx) {
>          ret =3D bdrv_try_set_aio_context(child_bs, ctx, &local_err);
>          if (ret < 0 && child_role->can_set_aio_ctx) {
> -            GSList *ignore =3D g_slist_prepend(NULL, child);;
> +            GSList *ignore =3D g_slist_prepend(NULL, child);
>              ctx =3D bdrv_get_aio_context(child_bs);
>              if (child_role->can_set_aio_ctx(child, ctx, &ignore, NULL)) =
{
>                  error_free(local_err);
>                  ret =3D 0;
>                  g_slist_free(ignore);
> -                ignore =3D g_slist_prepend(NULL, child);;
> +                ignore =3D g_slist_prepend(NULL, child);
>                  child_role->set_aio_ctx(child, ctx, &ignore);
>              }
>              g_slist_free(ignore);
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

