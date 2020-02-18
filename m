Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5951857lfp;
        Tue, 18 Feb 2020 02:01:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqyvwQR9FDkL2rdNEaYJZci8jJ/9j2km5OItmq7BtQHA+WkEfpAi0aGuN9y+ZMKUV+Xoeke7
X-Received: by 2002:a05:620a:1366:: with SMTP id d6mr17809047qkl.230.1582020094624;
        Tue, 18 Feb 2020 02:01:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582020094; cv=none;
        d=google.com; s=arc-20160816;
        b=EO/w9v73nPK1ZoAcpOVVKxNdrZY6elgtPvkfq7nLQ6wkdtYonlh+90KRepWMQfyuny
         XVekq9SgGiityE5zDBQZywKMavQsDAcptnOzzby9GAzs+NoSUvpZpVsxmHS9Vj1hRqFL
         XIRwx6R6mmN+hX7cF1PW0XEQmOuqzkj0I/zzvi5tanLbmU90K5t3OuCITLX/J6bFQpgH
         A9QBRarCQvwzqgTCJETKpz2y3T+hyB5RzFaYx+E3zH3ecCh5rOQWv1oOG21gZ/+zqjdu
         BsRFCPQOiqJuaG0jA57SYrXWyWtb7uf5QUdIhZJvUqsVRLP91IRohHKxGiFf8rZjbD/l
         9YFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=lCqgGp0NZnHeZdA6hXWAMbRUH3lpJdGCnsLTUxoeLQI=;
        b=AFRz8Ufyo2fSKF3ZanBn8V4L6IiFALYOUxTEJ6trHicyqpSpo2Pp3jto8f5IqTsz8f
         wkec9S67OysPueDwbClqLWt+NOUozLbsjRN0AGSZgjAN4WxAcpRhjH05PfldSZ/IHiL9
         fKXo0wPfQ+QpbzYiIDRSzyaIzdLlGqPJTVKAIXyJP0v82/P3YnH5+1XxZ0/PiFjcOggr
         6OwwObs9DZoAkUYyOgxR7/UqdmHJ6t7NB/H0VAKgwnjUCk5ZxM7K0xX525PxC0JtfRhx
         gQL/m8+6vpOa6R6DtliN2zwRp1o7a64JT4Krz+vYeJp06XQfTjFiZHCdSBRjcl7n4fxW
         vl3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WCuB3HUy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si1412600qvm.45.2020.02.18.02.01.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:01:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WCuB3HUy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zh8-0005zd-1X
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zgU-0005kb-IO
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:00:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zgT-0005tE-FM
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:00:54 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28047
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zgT-0005sd-BM
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582020052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCqgGp0NZnHeZdA6hXWAMbRUH3lpJdGCnsLTUxoeLQI=;
 b=WCuB3HUyl42jk/BTg41ktW41bIaHwBrVApBLKgMwsR8zNJRqO7KlWMXmuIDesmMkoE3XTv
 HHMnII5ZzbcnB2W86RfkMyePsFYXnSpRcwntkxR1eg416d8H/dslney9IuHyLq8u8g+uY9
 WGgwl74y3wbSCgYLQ72EbopGFMQjeVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-cp5tjIznPh6FRxdS8lVNjQ-1; Tue, 18 Feb 2020 05:00:51 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01CA8800D48;
 Tue, 18 Feb 2020 10:00:49 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1372060C81;
 Tue, 18 Feb 2020 10:00:31 +0000 (UTC)
Date: Tue, 18 Feb 2020 10:00:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 11/13] target/i386/whpx: Remove superfluous
 semicolon
Message-ID: <20200218100029.GN3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-12-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-12-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: cp5tjIznPh6FRxdS8lVNjQ-1
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
 Gerd Hoffmann <kraxel@redhat.com>, Justin Terry <juterry@microsoft.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-trivial@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
X-TUID: xJtIhvRzkYus

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: 812d49f2a3e
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> Cc: Justin Terry (VM) <juterry@microsoft.com>
> ---
>  target/i386/whpx-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/i386/whpx-all.c b/target/i386/whpx-all.c
> index 3ed2aa1892..35601b8176 100644
> --- a/target/i386/whpx-all.c
> +++ b/target/i386/whpx-all.c
> @@ -511,7 +511,7 @@ static void whpx_get_registers(CPUState *cpu)
>      /* WHvX64RegisterPat - Skipped */
> =20
>      assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterCs);
> -    env->sysenter_cs =3D vcxt.values[idx++].Reg64;;
> +    env->sysenter_cs =3D vcxt.values[idx++].Reg64;
>      assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterEip);
>      env->sysenter_eip =3D vcxt.values[idx++].Reg64;
>      assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterEsp);
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

