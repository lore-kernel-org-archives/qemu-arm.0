Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5422644lff;
        Tue, 14 Jan 2020 04:09:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqzwjbZjbRad60pHOi21BNGSq7qtsE4p4+Vv7NXPaT+c/NApXGbALk7LEG2nlIaNaK0FGZPX
X-Received: by 2002:aed:2022:: with SMTP id 31mr3076080qta.321.1579003793714;
        Tue, 14 Jan 2020 04:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579003793; cv=none;
        d=google.com; s=arc-20160816;
        b=K0USIsK/jaiPjqUAC/2x0Un/gvMpOtXQaDsRQZ+6aVgNdqSHwmuo+iVh4CwmC0Uj82
         wqNwU/YQvTc942RcPT0Q8Eyj329T0gnrc48DApYXcZvEu2IghmYuUS0jbygC/71V8G61
         3HSdkvBC0EnI3LSyRu7Bn4cnNndMKJttrdI0HszCIFdqbgpFRq0Qza88d5fuYHPgoyWg
         apj3xqlWnnn9mhUcRGlD8SYzWs2Btn1SGg6nz96SriJIlDa2PShQj2DP2Z2Vk82mRMcA
         OwHHQTxgpNUCvGUbYLNeOG4wTYDel6/Kudlgy1p13UxHwRXF2qEC7M6LRaSQY8HmVOWU
         UBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=fICgQi0YSLusFw0Y46W5rHFcSAaW001LL0e6Aaps9t4=;
        b=BD2fPlvQ5Yy4G7wRnvPVwVhLX7W0QWb0cOfpH4daP2i+h6fm3QLnhWlvY5vUsjq5NR
         XNxtCeHPt+AaREGDl7S2z7S/AJR8HwEFWcVl1QV9aTMM/+Ue7sg0V6pxx1U2eDYUPmTj
         7lmV8zSejjIv758LgFL4sfkRP70x0ODb1nq72mX4zetqrDaS1P6W73y1uz8vrjA12sKl
         LU6gnVcSMu1DzO/a+VepRt/7Kks99toh+gL0VWOEmnB8CqyGjezQqNUuc4W7GM4vg7Nr
         OqMG4GjpUQuBoV4gfY/vwRiWjXTs6pk7+NlzgXQfrpdI2J3zYu3ge4ewUa06M9zlzxGj
         i3Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QBL0TyiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h38si8181004qtc.18.2020.01.14.04.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 04:09:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QBL0TyiX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irL16-0000aO-Hh
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 07:09:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1irKuL-0007yu-GZ
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:02:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1irKuG-0003OZ-LD
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:02:52 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25285
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1irKuF-0003OE-UF
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579003367;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fICgQi0YSLusFw0Y46W5rHFcSAaW001LL0e6Aaps9t4=;
 b=QBL0TyiXBi70KXT3OlfhD9KN2H0L41y/aFilog1WzPxG1S6ns9HYmzPKrXVlvyGc7k6+xN
 +ftb9kRFV+Lg/MXbxTrsPvOB2BZh5GtOqLMdApDuin+/5mD1BE7xr/1BlSnJ7Rn/G5X9Yz
 5vzK6tTnLYYGU3YWBh4QSN/UHA4sDOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-UkBMVN4SOEmNejWJYfasIQ-1; Tue, 14 Jan 2020 07:02:44 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45AD8108AD2F;
 Tue, 14 Jan 2020 12:02:42 +0000 (UTC)
Received: from redhat.com (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F4376609E;
 Tue, 14 Jan 2020 12:02:36 +0000 (UTC)
Date: Tue, 14 Jan 2020 12:02:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PULL 30/30] multifd: Allocate uint64_t instead of ram_addr_t
Message-ID: <20200114120234.GM4071034@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
 <20200114113926.3556-31-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200114113926.3556-31-quintela@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: UkBMVN4SOEmNejWJYfasIQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E8qd4x675XFr

On Tue, Jan 14, 2020 at 12:39:26PM +0100, Juan Quintela wrote:
> We receive that value over the network, and ram_addr_t depends of
> architecture.  Just make enough space for 64bit.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

>=20
> diff --git a/migration/ram.c b/migration/ram.c
> index d0940387d1..ba6e0eea15 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1267,7 +1267,7 @@ int multifd_save_setup(void)
>          p->id =3D i;
>          p->pages =3D multifd_pages_init(page_count);
>          p->packet_len =3D sizeof(MultiFDPacket_t)
> -                      + sizeof(ram_addr_t) * page_count;
> +                      + sizeof(uint64_t) * page_count;
>          p->packet =3D g_malloc0(p->packet_len);
>          p->packet->magic =3D cpu_to_be32(MULTIFD_MAGIC);
>          p->packet->version =3D cpu_to_be32(MULTIFD_VERSION);

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

but I think this ought to be patch 2 in the series, otherwise the
multifd test case that's introduced at the start of this series
will likely fail when doing git bisect.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|

