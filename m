Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp896702lfc;
        Thu, 12 Mar 2020 10:11:53 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtluMwCoUkZb75O+HyW+yZOOP84pCxt3xvTLpPiCFBhDgIMjGB8GuCMzopAc4uF+GNZf48Y
X-Received: by 2002:ad4:4af4:: with SMTP id cp20mr8499032qvb.222.1584033113427;
        Thu, 12 Mar 2020 10:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584033113; cv=none;
        d=google.com; s=arc-20160816;
        b=GYHVPXebaEsrCRYOu0IZmwAWTcpsrT1laHStSGteFNLZqALKxDAFmCacc6CYaOdZGI
         L2xNd35sjEWsGS7iWtg/78RnfHGSl5dyh+G/PjMXFiaO7l0zOC+8wLuXTNbRYkGkHvvd
         eiAjrQzFgL8H0i04ob9vaSHtvkJ+NK7/NkL3rkXVIHmIzOAwwmrghwqrhLwxDqj1X3+t
         cqsEuteeNNfxHsYY6Nhp9goXjdCnuqarOZlQ/Ju7yMs912D9tFR72+n62Ia5Ua4lCWvN
         8hWaD3jnOD4E5DWMoETWD1LQYs2za25GXiBFJ6FjDVxfNnCYMVoji3f64OyiPZ0Xzw1Q
         R98w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=yDAn56p1JorUdIBrrLQJNk/GIMybbrppb3b4dS2ACFg=;
        b=Gg8A/gHLQSrz3WrWsL/UTQ3V58F5/YlUoQjQ022NUAM3s1gy4Vd+eZZp20ELbD1TKy
         eER9hep0Bz3/0m4Kcdqr5mUx1Hp1mC04aUNnDIWg77n/gPIWBTH9bR57Vny16dTrL+Oe
         5MFDjb2Dtn0ABn4VJ0I25IHYFVCuc/gLVEwZOyEdGE++Ygdacv5fl63mH3IOA5TYGu2S
         CQjH5usMvVPoc0LKg6EK2m0afb4yWNxivqFYNbohadjAgkzo4et9/BteJ5ulXfxsQuiq
         Npn/6Aw5T1qS2Y3EDDqGxFWoDYCt1IBtqepVTxDm+6BFHnfi+EZN9i2YoMfrdDXtjBfu
         kkuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X5l+4ayU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25si3058958qtw.111.2020.03.12.10.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 10:11:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X5l+4ayU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCRNA-0003XW-Sb
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 13:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38652)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jCRE9-0002QN-7G
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 13:02:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jCRE7-0000tt-De
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 13:02:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22161
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jCRE7-0000rb-8D
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 13:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584032550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDAn56p1JorUdIBrrLQJNk/GIMybbrppb3b4dS2ACFg=;
 b=X5l+4ayUEPUSZVh6W4GiLVKcmDeZt4MiUnFruyejGZZiE5wyuxr6c80eid62l8C5NhSV8w
 jmAPqbzM5tLAwTrY70wjH9h4N6cBAzJYn4ae5c5JHbugBRA3Cg1g09L7rMFiHqvQuNEjEQ
 8x55+6trZG7BpupjdsYcGIhoBmtvfX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-CfFOaPOxNCix2KHRQQt4pQ-1; Thu, 12 Mar 2020 13:02:25 -0400
X-MC-Unique: CfFOaPOxNCix2KHRQQt4pQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31472803960;
 Thu, 12 Mar 2020 17:02:24 +0000 (UTC)
Received: from work-vm (ovpn-116-106.ams2.redhat.com [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33E8F8FBE1;
 Thu, 12 Mar 2020 17:02:21 +0000 (UTC)
Date: Thu, 12 Mar 2020 17:02:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] migration/throttle: Add throttle-trig-thres migration
 parameter
Message-ID: <20200312170219.GK3211@work-vm>
References: <20200221025727.63808-1-zhukeqian1@huawei.com>
 <2db47b97-729f-4ccb-dab2-585771acc2fe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2db47b97-729f-4ccb-dab2-585771acc2fe@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4kYkXYspcrna

* Eric Blake (eblake@redhat.com) wrote:
> On 2/20/20 8:57 PM, Keqian Zhu wrote:
> > Currently, if the bytes_dirty_period is more than the 50% of
> > bytes_xfer_period, we start or increase throttling.
> >=20
> > If we make this percentage higher, then we can tolerate higher
> > dirty rate during migration, which means less impact on guest.
> > The side effect of higher percentage is longer migration time.
> >=20
> > We can configure this parameter to switch between migration time
> > firt or guest performance first. The default value is 50.
> >=20
> > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > ---
> > Cc: Juan Quintela <quintela@redhat.com>
> > Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > Cc: Eric Blake <eblake@redhat.com>
> > Cc: Markus Armbruster <armbru@redhat.com>
> > ---
>=20
> > +++ b/qapi/migration.json
> > @@ -524,6 +524,10 @@
> >   #                      compression, so set the decompress-threads to =
the number about 1/4
> >   #                      of compress-threads is adequate.
> >   #
> > +# @throttle-trig-thres: The ratio of bytes_dirty_period and bytes_xfer=
_period to
> > +#                       trigger throttling. It is expressed as percent=
age. The
> > +#                       default value is 50. (Since 5.0)
> > +#
>=20
> Abbreviating feels odd; can you please spell this out as
> throttle-trigger-threshold?
>=20
> Can the threshold exceed 100%?

Note the code checks for that and disallows it, only allowing 1..99

Dave

>=20
> --=20
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

