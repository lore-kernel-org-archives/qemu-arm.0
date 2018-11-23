Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2103261wrt;
        Fri, 23 Nov 2018 06:27:20 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U62U/1vrIUcgaVs0QZ04PBk8dLCtsrk4ZEx+wC3eM6DCceBJwAuN0G7VHUtP0Q+SybYpDI
X-Received: by 2002:a25:f80a:: with SMTP id u10-v6mr16157334ybd.219.1542983240755;
        Fri, 23 Nov 2018 06:27:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542983240; cv=none;
        d=google.com; s=arc-20160816;
        b=Kb2h5wgmhaCaY7jPRiKuh53evItYbesFcGC+a8xSqKr8NnoSMy+TL9kME+b65Z4uUu
         3s9VodA+BEkl1CH9P5pOfAl6xAYJHYJBgTkGSrTXXVC+fliyAXENG8hOWuns22oGgB9R
         UN8FH8z5vEPC8q+U6ZR7RVw0YG6AavEv0qNtCuXpktfl4RrDDzcuUcSrqi5sDe7eiCNK
         bVWJDImX44d88Z9DY9K7v7/NeK5NplMKm9nImYWzNHcJGs6wkMbCmU5vBKbZLaMp0fif
         VJ+pCdEb1MO2RLpfA7f1RXArd0X3fM4MP11WGbrbIN+WS+jFxqgVk8wQzeIj+fN9EW+s
         OiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=I+46NGFNGUMsafXahfHTlsjcyBJiWSzL/eTj+ZaEsNo=;
        b=EXzE8vt9aU/0bYNaLWZXSkr0JP82MeAAxaNU4EukvXkprwIjamgWfUABn1Y0wLIRBj
         dYtZJWGL5EWO+xJJq5K2lzinG2XxEYue5vf1TDg7ld1kRPWVAWVl2IGwKrT7iZk0/TMQ
         Q+lhLc+XbeojsCCI9tynxA8U6J5FzDeQOWt4NhC9LjoflwqUNSH9jyESxpH36SzRgl8U
         4QhyMMWg6VJFP4Eguhoomrau92bvt0xWayhrUqnSYM8v5QEYTg78N72fx4LixtPRyDOd
         jcrm4lV0y7/M9QokIPfCz1mydzqx/U6f8aqL7Qsp0x6xKuQxQQVQGaO90q6vsbBzI7zP
         U7pA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l19si21829526ywa.358.2018.11.23.06.27.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 06:27:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQCQS-0008AN-9V
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 09:27:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gQCQJ-000891-45
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 09:27:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gQCQI-0001GL-8v
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 09:27:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gQCQI-0001Fa-1Q; Fri, 23 Nov 2018 09:27:10 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F402C0587DF;
	Fri, 23 Nov 2018 14:27:09 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87B9C1054FD8;
	Fri, 23 Nov 2018 14:26:59 +0000 (UTC)
Date: Fri, 23 Nov 2018 15:26:58 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181123152658.76547154@redhat.com>
In-Reply-To: <20181107123652.23417-9-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-9-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 23 Nov 2018 14:27:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-3.2 v3 08/14] qdev-props: convert
 global_props to GArray
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	=?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nzXIAQJlBz9c

On Wed,  7 Nov 2018 16:36:46 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> A step towards being able to call object_apply_global_props().
it also makes code more uniform as we don't have to deal with type
inform of GList.

maybe move it at the beginning of series and include accel part as well?

otherwise looks good



> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/core/qdev-properties.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 43c30a57f4..353e67c05a 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -1173,22 +1173,32 @@ void qdev_prop_set_ptr(DeviceState *dev, const ch=
ar *name, void *value)
>      *ptr =3D value;
>  }
> =20
> -static GList *global_props;
> +static GArray *global_props(void)
> +{
> +    static GArray *gp;
> +
> +    if (!gp) {
> +        gp =3D g_array_new(false, false, sizeof(GlobalProperty *));
> +    }
> +
> +    return gp;
> +}
> =20
>  void qdev_prop_register_global(GlobalProperty *prop)
>  {
> -    global_props =3D g_list_append(global_props, prop);
> +    g_array_append_val(global_props(), prop);
>  }
> =20
>  int qdev_prop_check_globals(void)
>  {
> -    GList *l;
> -    int ret =3D 0;
> +    int i, ret =3D 0;
> =20
> -    for (l =3D global_props; l; l =3D l->next) {
> -        GlobalProperty *prop =3D l->data;
> +    for (i =3D 0; i < global_props()->len; i++) {
> +        GlobalProperty *prop;
>          ObjectClass *oc;
>          DeviceClass *dc;
> +
> +        prop =3D g_array_index(global_props(), GlobalProperty *, i);
>          if (prop->used) {
>              continue;
>          }
> @@ -1213,12 +1223,13 @@ int qdev_prop_check_globals(void)
> =20
>  void qdev_prop_set_globals(DeviceState *dev)
>  {
> -    GList *l;
> +    int i;
> =20
> -    for (l =3D global_props; l; l =3D l->next) {
> -        GlobalProperty *prop =3D l->data;
> +    for (i =3D 0; i < global_props()->len; i++) {
> +        GlobalProperty *prop;
>          Error *err =3D NULL;
> =20
> +        prop =3D g_array_index(global_props(), GlobalProperty *, i);
>          if (object_dynamic_cast(OBJECT(dev), prop->driver) =3D=3D NULL) {
>              continue;
>          }

