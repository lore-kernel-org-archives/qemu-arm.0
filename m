Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp838751ejc;
        Thu, 23 Feb 2023 07:40:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9Bpl4qb30cuk+Wi6kViJhMrG90ARbdmQa77cfyxK+tTnvoABmRp744V8KUEU0O6BN5FKSD
X-Received: by 2002:a05:6214:2508:b0:56f:8a99:1a7a with SMTP id gf8-20020a056214250800b0056f8a991a7amr21116828qvb.23.1677166825314;
        Thu, 23 Feb 2023 07:40:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677166825; cv=none;
        d=google.com; s=arc-20160816;
        b=carv3ht7SIeKQrazTiaEj3TjS58Vm27wLwGN2LT8oJmSycVij9Ba11H3Xzt/rt59wc
         yC5RZUDjXR8hrjo2oDkrWjGDUYRitWjmRlqDu3Kz4uO6ociV4K6thHPxFxVbg6jzKDJM
         Tl5uxAM28vkGb4xmse1/k4BwldJ1y3tl+0C2YplV8XAUPUIj3o0UETkk+WDNgx7Hvqh5
         8C/C33+fhRJydrgyj8Tjpleh/IDnZ3u5D2vCIZ/l0oY4MIxahqv8q5hfmKPEfW1M/xBG
         jv2ASCxIPlhRJMkd/xfp5pXz7PWdeQOAsU8v7volmeQLSlxF6EcQamb8/NSc9ziz/EjE
         TvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=iLZUE8VH+6dkkpIPjfzdL2nS7EwVm/z5YUCf7UEQs3s=;
        b=lR+NY34sZ7qB2jf1av5Q95AFBNPgyHNtN5dwAp2tNu6rbWzWO9MYFoPIa7w5uWbIgP
         1D75YrmDccaiZbKS0znVjVbhZv1fMQmZVuSs59luBsTIgVt4gahYzarO2xjnvtk3xSFB
         5ka6S3wEP3m3HN4wmiP7aqs8vSsTClhJIyieot64CKsJFM0EgF5tHCYGA5r+r/8PHV8V
         euI/YXBhR2Li5hgeniG7lzx/6/TEvUxfWlkaqJ098eFBsBuNnTR+IgKuyPeXbjVC4XiJ
         86bVtuQ7JM+izaelZYIgOvttTU2iUz3IwV5w2uZmovoMqu4BFdjiAXTlCtVbEuvJkDlL
         7aKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EWq4TQV1;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b133-20020ae9eb8b000000b007267d9bec14si4825691qkg.652.2023.02.23.07.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 07:40:25 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EWq4TQV1;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677166824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLZUE8VH+6dkkpIPjfzdL2nS7EwVm/z5YUCf7UEQs3s=;
	b=EWq4TQV1nFkIMODyyN/AfGkxKECXZ/2wx3FV0eUPH26P2x0s8NzjoTTB8pgYvPqudGQ7lR
	irsV2Fo8Xcc+Q+Wl00XqkojvEB46fiWvxkiVHIAly5Inp32xsSkXIO3QCM0Cw1LkySFLi2
	uspx2GaT6qC8Sugq3qQZdd08wG70l/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-BI1bYQ0_Nu6_ozmL8xbr0A-1; Thu, 23 Feb 2023 10:40:20 -0500
X-MC-Unique: BI1bYQ0_Nu6_ozmL8xbr0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14FD585D067;
	Thu, 23 Feb 2023 15:40:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC61FC15BA0;
	Thu, 23 Feb 2023 15:40:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8E37721E6A1F; Thu, 23 Feb 2023 16:40:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-s390x@nongnu.org,
  qemu-ppc@nongnu.org,  qemu-block@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,
  Igor Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>,
  Jean-Philippe Brucker <jean-philippe@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Shannon Zhao <shannon.zhaosl@gmail.com>,
  Eduardo Habkost <eduardo@habkost.net>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Yanan Wang <wangyanan55@huawei.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Gerd Hoffmann
 <kraxel@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
  Peter Xu <peterx@redhat.com>,  Jason Wang <jasowang@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Xiao Guangrong
 <xiaoguangrong.eric@gmail.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,  Yuval Shaia
 <yuval.shaia.ml@gmail.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Fam Zheng <fam@euphon.net>,  Alexander Bulekov
 <alxndr@bu.edu>,  Bandan Das <bsd@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Darren Kenny
 <darren.kenny@oracle.com>,  Qiuhao Li <Qiuhao.Li@outlook.com>,  Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 3/5] bulk: Have object_child_foreach() take Error* and
 return boolean
References: <20230216122524.67212-1-philmd@linaro.org>
	<20230216122524.67212-4-philmd@linaro.org>
Date: Thu, 23 Feb 2023 16:40:17 +0100
In-Reply-To: <20230216122524.67212-4-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 16 Feb 2023 13:25:22
 +0100")
Message-ID: <875ybss84e.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: IVGcLpqmY+aG

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Following the Error API best practices documented in commit
> e3fe3988d7 ("error: Document Error API usage rules"), have the
> object_child_foreach[_recursive]() handler take a Error* argument
> and return a boolean indicating whether this error is set or not.
> Convert all handler implementations.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

This patch does several things (no, I'm not going to ask to split it):

* Convert object_child_foreach() and object_child_foreach_recursive() to
  the Error API: add parameter Error **errp, change return type from int
  to bool.

  Straightforward.

* Adjust the callers: pass the new argument.

  Looks like you pass NULL, which makes sense for a conversion such as
  this.  Always NULL?

* Convert object_child_foreach()'s and
  object_child_foreach_recursive()'s callback parameter to the Error
  API: add parameter Error **errp, change return type from int to bool.

  Straightforward.

* Adjust the actual callbacks: take the new parameter and use it
  properly, return bool instead of int.

  Either don't touch @errp and return true, or store an error to @errp
  and return false.

  You're not doing this at least in bmc_find(), see right below.

  I don't have the time for checking all the callbacks today.  Mind
  doing that yourself?

[...]

> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 99f1e8d7f9..05acc88a55 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -283,17 +283,17 @@ typedef struct ForeachArgs {
>      Object *obj;
>  } ForeachArgs;
>=20=20
> -static int bmc_find(Object *child, void *opaque)
> +static bool bmc_find(Object *child, void *opaque, Error **errp)
>  {
>      ForeachArgs *args =3D opaque;
>=20=20
>      if (object_dynamic_cast(child, args->name)) {
>          if (args->obj) {
> -            return 1;
> +            return false;

No error set here.

>          }
>          args->obj =3D child;
>      }
> -    return 0;
> +    return true;
>  }
>=20=20
>  IPMIBmc *pnv_bmc_find(Error **errp)

[...]
