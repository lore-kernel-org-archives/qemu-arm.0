Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5557877wrt;
        Mon, 26 Nov 2018 05:27:16 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V6ntn+FzbIkyHxVfR6N8j3+Xa/BqO4Q2D0a04IAjAJ7lgpG/d7KHoCduDOvsBIAbInVfGN
X-Received: by 2002:a81:ec0f:: with SMTP id j15mr19376449ywm.214.1543238836478;
        Mon, 26 Nov 2018 05:27:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543238836; cv=none;
        d=google.com; s=arc-20160816;
        b=oRD7MxwbB3QXiOIfB6jmfSFMwCwNXdmXohtIRYMnLJT6fNC/bXptnu8Md+6cS2ckda
         7E/QFKuTi4CfquAi32mdsJw31LwBcthq5fE3BbFhUpW7hjdSZsyN9BtXfxpt3vmTUlDl
         sh73CNLTfpZCDPc1qYvQR/IbclKprvFBNPB38B7Uft9cYHhXrEK5rk/blVVTryBzQDix
         Gk+UC3isv6lWBraGRHCqNdtsJ8C2aw3vsn1/Hd+1E0eokO9zogeyLtYmKeQEB9lhRiq1
         9vjb75m5ICuvzPAw0SZO7O1QzceLLyvzVf+kNaVgn8dnmAkIlIaH1n+1m6fvo5PwkV8n
         c6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=RhS2s6xxI9YoGo2pgFI5LT/bkTJlci9yyC4M+lzCe2A=;
        b=fZmbYOgdeYaZIpZBRIUZzCiNr97aWXNDaJHLjajjx8grOfU8GPHIwhhxucLVgR6xIf
         uLlvgorJxF8w9EgSGyy49GhASzMdkBBV9KgREZynW+wcZps3ggAgQ4vTwy9Jftb9yYxK
         ZVJzqgquV+Sa6ybxgccypI1W34NjihtLOjT9Vo055Q3fYtXGzeuXIUGYlociLyaS/rxI
         VwPHMbjnqPdiCbnvwWmAKGcGE4UmEXhRorZOSxxuLFb4LJqZXmjy44Edw4VJeQ2Z8LW8
         6gvi2mbrspCM2LCl48t6KL00mtWVnuULyRK9YFteb9RWWA+6cwtDqO/WOI9EfC8wzHtJ
         Jodg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s184-v6si255436ybb.25.2018.11.26.05.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 05:27:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRGux-0002LZ-S0
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 08:27:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRGoz-0005Ai-DS
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:21:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRGou-00087Y-C3
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:21:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47466)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRGou-00086t-4z; Mon, 26 Nov 2018 08:21:00 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 037603154862;
	Mon, 26 Nov 2018 13:20:59 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA64B1F8;
	Mon, 26 Nov 2018 13:20:47 +0000 (UTC)
Date: Mon, 26 Nov 2018 14:20:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181126142046.07c5e227@redhat.com>
In-Reply-To: <20181107123652.23417-11-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-11-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 26 Nov 2018 13:20:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-3.2 v3 10/14] qdev-props: call
 object_apply_global_props()
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
X-TUID: 6o9ZLKmwXIJX

On Wed,  7 Nov 2018 16:36:48 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> It's now possible to use the common function.
>=20
> Teach object_apply_global_props() to warn if Error argument is NULL.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/core/qdev-properties.c | 24 ++----------------------
>  qom/object.c              |  6 +++++-
>  2 files changed, 7 insertions(+), 23 deletions(-)
>=20
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 8728cbab9f..239535a4cb 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -1223,28 +1223,8 @@ int qdev_prop_check_globals(void)
> =20
>  void qdev_prop_set_globals(DeviceState *dev)
>  {
> -    int i;
> -
> -    for (i =3D 0; i < global_props()->len; i++) {
> -        GlobalProperty *prop;
> -        Error *err =3D NULL;
> -
> -        prop =3D g_array_index(global_props(), GlobalProperty *, i);
> -        if (object_dynamic_cast(OBJECT(dev), prop->driver) =3D=3D NULL) {
> -            continue;
> -        }
> -        prop->used =3D true;
> -        object_property_parse(OBJECT(dev), prop->value, prop->property, =
&err);
> -        if (err !=3D NULL) {
> -            error_prepend(&err, "can't apply global %s.%s=3D%s: ",
> -                          prop->driver, prop->property, prop->value);
> -            if (!dev->hotplugged) {
> -                error_propagate(&error_fatal, err);
> -            } else {
> -                warn_report_err(err);
> -            }
> -        }
> -    }
> +    object_apply_global_props(OBJECT(dev), global_props(),
> +                              dev->hotplugged ? NULL : &error_fatal);
arguably, it's up to caller to decide it warn or not.
I'd leave it warning code out of object_apply_global_props() and let caller=
 do the job

>  }
> =20
>  /* --- 64bit unsigned int 'size' type --- */
> diff --git a/qom/object.c b/qom/object.c
> index 9acdf9e16d..b1a7f70550 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -392,7 +392,11 @@ void object_apply_global_props(Object *obj, GArray *=
props, Error **errp)
>          if (err !=3D NULL) {
>              error_prepend(&err, "can't apply global %s.%s=3D%s: ",
>                            p->driver, p->property, p->value);
> -            error_propagate(errp, err);
> +            if (errp) {
> +                error_propagate(errp, err);
> +            } else {
> +                warn_report_err(err);
> +            }
>          }
>      }
>  }

