Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1631826njc;
        Wed, 21 May 2025 22:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHte0Zf5uyptXbycC23o8D8q3T1tD6xnhYo2PYTVU/zjKhbOXleaRzy2Zs7iUMiLHsLQdmQ
X-Received: by 2002:a05:622a:1b15:b0:494:7e69:137f with SMTP id d75a77b69052e-494ae46142bmr400736411cf.42.1747891013765;
        Wed, 21 May 2025 22:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747891013; cv=none;
        d=google.com; s=arc-20240605;
        b=RV+zJFwUH/ckowac4usj1HdwaBruXzHY6sI5B6NpFkcgm5yHXQnvQnC5kebNMqTsjP
         aFMFAcmHRLPGMJXUaEjVhe/oeUTp9/AvdvxNrlcGKaPAqFbJbrzGkmEiUrpbnUC7jIgD
         /L1kedR0AAWSxWHE5jXQt5ENCtkK3DSk7lVVn9gq3xwK+0uOgewwGZjkDzgyPtKHb9Bx
         9y0JBEyV8fKiEDU4AbRsUSmGxyKLH6aclOdfcUGt8nactSt3yicFoZc+alYT3FYEmNfv
         t/mzttPbeM3i8TR/W1VJcxv2BfKntkhlNleMAoNoR3DAnjjNZMrHIbaCTJJLhmSZ5Wtm
         Fzug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=yLyiRwnVOQqrfoOk18hKb/BEKJpPnp1Il7WAe14oY8k=;
        fh=wV2BOmKvk8LTvV0S9Y+PwYY0Zo/bX5NQdGPYvEF6e3k=;
        b=cuVjqudMgCM7XmJeAqjgpIUP6GLa5Ui0HDLqvWLq/TUFcPQt+dJq3Gtk+nyGaQWyjf
         vG2wlxxXcew4FNaf9bOA0QIoepH5DDPqgUJFs8z/xPec5HKs+i8vOP64wyt0p9k17mWb
         UKyVDEgy78QFiJBfnZ+t5x0Olmgts9OVm2CDLdAd4d3iKAWEOaxuVXcb9Co29aIpZjF5
         XYGOF6vQOOz4ajGOM6wD2SBqSuxvw6kq+PB792LewAAIAJFWDSkxv/NbftSUElh9RAfq
         L0ymYTNWdU8FY+f46kVrJRN+LsG6BYHZMU/LhROAta5GCGxWKiFmM1d1PzOiWjTBDVbf
         zQLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CcLtPA4+;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae564291si144393821cf.324.2025.05.21.22.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 22:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CcLtPA4+;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747891013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yLyiRwnVOQqrfoOk18hKb/BEKJpPnp1Il7WAe14oY8k=;
	b=CcLtPA4++cYfNuZCJpAxkhoRFIZGbvlO9WfjNMh8/oDhuXDQfCjWexngIF4DnKJjODiq6E
	1Z0PSZRF6mEpcEFsTPLUjeR71NV5WLsxKJjGtRZU6RBeD7CHIu6ddVdQS0s2Win4e6+u5P
	C9Goo8bp2wTYF8NpMajWT39wPJaNSp0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-346-QQnmrHNnMim7F2hZJVa6Yg-1; Thu,
 22 May 2025 01:16:49 -0400
X-MC-Unique: QQnmrHNnMim7F2hZJVa6Yg-1
X-Mimecast-MFC-AGG-ID: QQnmrHNnMim7F2hZJVa6Yg_1747891008
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C56A1955E79;
	Thu, 22 May 2025 05:16:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.7])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D32130002C0;
	Thu, 22 May 2025 05:16:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0D7A421E66C3; Thu, 22 May 2025 07:16:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  Akihiko Odaki <akihiko.odaki@daynix.com>,  John Snow <jsnow@redhat.com>,
  Fabiano Rosas <farosas@suse.de>,  Peter Xu <peterx@redhat.com>,
  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
  Alexandre Iooss
 <erdnaxe@crans.org>,  Markus Armbruster <armbru@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,  Philippe =?utf-8?Q?Mat?=
 =?utf-8?Q?hieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Sriram
 Yagnaraman <sriram.yagnaraman@ericsson.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>,  Gustavo Romero
 <gustavo.romero@linaro.org>,  "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 09/20] MAINTAINERS: add myself to virtio-gpu for Odd
 Fixes
In-Reply-To: <20250521164250.135776-10-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 21 May 2025 17:42:39 +0100")
References: <20250521164250.135776-1-alex.bennee@linaro.org>
	<20250521164250.135776-10-alex.bennee@linaro.org>
Date: Thu, 22 May 2025 07:16:44 +0200
Message-ID: <87ikltxm0z.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: WfLcaw8/JtvE

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Seeing as I've taken a few patches to here now I might as well put
> myself forward to maintain virtio-gpu. I've marked it as Odd Fixes as
> it is not my core focus. If someone with more GPU experience comes
> forward we can always update again.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - s/M:/S:/ for the maintainer entry
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 818d7b9d5f..8dfb393c06 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2673,7 +2673,8 @@ F: hw/display/ramfb*.c
>  F: include/hw/display/ramfb.h
>=20=20
>  virtio-gpu
> -S: Orphan
> +M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +S: Odd Fixes
>  F: hw/display/virtio-gpu*
>  F: hw/display/virtio-vga.*
>  F: include/hw/virtio/virtio-gpu.h

Reviewed-by: Markus Armbruster <armbru@redhat.com>
