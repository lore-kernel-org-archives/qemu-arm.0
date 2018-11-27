Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1231865wrt;
        Tue, 27 Nov 2018 04:57:58 -0800 (PST)
X-Google-Smtp-Source: AJdET5dV0d4ZjkoAA28/sjKxlIG/novcHppjz/8xe6dZpaJmvY/ITsKkruJs/wZQDmlmgrpIVg+z
X-Received: by 2002:a81:b3c3:: with SMTP id r186mr34755994ywh.66.1543323478165;
        Tue, 27 Nov 2018 04:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543323478; cv=none;
        d=google.com; s=arc-20160816;
        b=IJtF5Ha+p9W1B7hMZaUYXX6co9jFGBI1lo7uH3S6G3enTyMhJ5U/5CcbHZbvSWTJr2
         BWk9wTUXoDr0tSzwI9LZph19WkDSoMadTM2jWd41WR0LaIZiKw0c776X8XIFdWm6NoDb
         b8nVOFXMaJG82rs6s21UFhz+4NtJEzTkvQHBfAAsfAT3osfjb4JA2qeMxsDK9g224LBz
         1empno8BzWpWT34/v75SG4tzb0s/Kz3HbWAgWcFk3k+XfOtqQikw9ozcisGfLL0xbZO7
         tV0mom4MTy++T+d5rKahc2orAujVzWW5EEGFDUVSEXGqr8k2F2OI32RHTkb8kQS6yOoa
         EqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=A8PNYDC7bdrqPC6/h3WqPIk/c2THSbcGoa3X6A2i7A4=;
        b=eojPG6wHB1QomxIZns4jRJpjpXD99d67HjwC5XRZMFK1vv4q78otNF7No1oTu9vPCg
         4dyMKdHHXTI2nCikoerYfWMY8SOKgW9kFh6tZu/MSOMieqcjXVZl+ZwAwsUFopXYKWXQ
         RJL7rUqP9eBdk6aadiunoozBi/x8SusmdVvROcz64hgvHbNXTCAumKQ04GAd+fdVbg+w
         s99Po6tn8eemlCSH6x+zRu3rqvyHhJNdrw3Yj1Ce0Tv+XMIbQ8l+eI1vwO72SoRgH0WZ
         1yeNMqeabeFQSGJKeTY4nC2mU3aHxmoVJEOWysEwPXQmkuN0yiI3gmqMqP92GQ2WmpvP
         NAkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 200si2660185ywr.313.2018.11.27.04.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 04:57:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRcw9-0005ml-Kr
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 07:57:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gRcvy-0005lA-Jr
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 07:57:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gRcvs-0004qZ-8L
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 07:57:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47346)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gRcvq-0004o7-6u; Tue, 27 Nov 2018 07:57:40 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9BD30A49E7;
	Tue, 27 Nov 2018 12:57:35 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDB3F60C81;
	Tue, 27 Nov 2018 12:56:45 +0000 (UTC)
Date: Tue, 27 Nov 2018 10:56:44 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181127125644.GB18284@habkost.net>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181127092801.21777-17-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 27 Nov 2018 12:57:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-3.2 v4 16/28] hw: apply machine compat
 properties without touching globals
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:Virt" <qemu-arm@nongnu.org>,
	"open list:sPAPR" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H6zJXjh9E/Ib

On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=E9 Lureau wrote:
> Similarly to accel properties, move compat properties out of globals
> registration, and apply the machine compat properties during
> device_post_init().
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
[...]
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 7066d28271..3b31b2c025 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -971,17 +971,26 @@ static void device_initfn(Object *obj)
>  }
> =20
>  static const GPtrArray *ac_compat_props;
> +static const GPtrArray *mc_compat_props;
> =20
>  void accel_register_compat_props(const GPtrArray *props)
>  {
>      ac_compat_props =3D props;
>  }
> =20
> +void machine_register_compat_props(const GPtrArray *props)
> +{
> +    mc_compat_props =3D props;
> +}
> +
>  static void device_post_init(Object *obj)
>  {
>      if (ac_compat_props) {
>          object_apply_global_props(obj, ac_compat_props, &error_abort);
>      }

Why not just use MACHINE(qdev_get_machine())->accel->compat_props
directly?

> +    if (mc_compat_props) {
> +        object_apply_global_props(obj, mc_compat_props, &error_abort);
> +    }

Why not just use MACHINE(qdev_get_machine())->compat_props
directly?

> =20
>      qdev_prop_set_globals(DEVICE(obj));
>  }
[...]

--=20
Eduardo
