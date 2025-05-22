Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1631655njc;
        Wed, 21 May 2025 22:16:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoOmm2lUy9adCnIND9unMDftCDYUNFpK5qeE82mtKNTtuC3rBOtLHhFiBJqw/iOYsxXOIr
X-Received: by 2002:a05:600c:3d18:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-442fd6724dcmr190193265e9.23.1747890980496;
        Wed, 21 May 2025 22:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747890980; cv=none;
        d=google.com; s=arc-20240605;
        b=P4bpxmYWLYLYn/lxgb6r2iHP0pRqQkesCIvAPAXGiigXM+cfRPrAksMINwQ7DFD/JQ
         /CdQRq9QfVe3zNltzFtEY7rjZgk+4jwR5qj2a6Y2o3vmF0WNWLmuiM1X+Nuqo60Bx1YB
         bpfsPQSz982tQblzU9F/wOAzlzkzXuOUFOpv3+aeDrCYdUb0RDVUeQZIF7jy7XB5Ctln
         ubISiwx3CuNw2E4m80mVD5GWWh4PfYEvleXiOOOb1W49w/vacMWwrUj/YV3f1t7brIoD
         HHL2ANhWpnnBWDFpz/k48pErcBt58mvzxo2RnGWrjwRLd8YeDsu+mkI4g9hNo0r7zqka
         oE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=Pt25cjzhyxcw9TpbMeLsxO/RVvgC5E/8l4dk/AzZQ5o=;
        fh=+6j2FPS3odsRPPL2Y9t8VLevy2VMfQa15hIIvIGaFm4=;
        b=YchQYJrXNw/u7eGsyraIzrTvbgUIX7BlOoFqAZ+GIuWTJvGQIlzCkF2jJ3eANNk3Fe
         VCuam4B0ULKedx/7xzXAIFMR8AQuccDT9VMRF5JIsuf+sPJcfKH6eXCM1DSptEZ3Bc14
         ZaO5W+W6mmEHgLJ8VlQlxmVde2bJV1IWFp34hbzno0Haybkw4phk1jbtPM/V3V7uyN63
         qFpUcXcwU2ga/NmMAqzUTbU61wPq1Qg/yKAVZH/lvM1tAekLrWWIJwCNHYQ7Qy09cf9M
         VQg244M5af3nqi08yQo+aG7N6OnJqApweNqG80RgTp+WuH2PC8I5QMUzn9gEeEEGzUk6
         envw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TmfAbGrH;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-447f7fa224esi44307635e9.173.2025.05.21.22.16.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 22:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TmfAbGrH;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747890979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pt25cjzhyxcw9TpbMeLsxO/RVvgC5E/8l4dk/AzZQ5o=;
	b=TmfAbGrHoPEtsizBzQyP+UAbMn0jVsKsl83wMDQWf//qEGcjbn8vOQd/TiOWDCYqpwhuF8
	t1gmo5f3Yl1gDj6z4aid63HHojIeh//zo7Yu7iwum4MCXKXO6nTTaEOmxcaAxcsQGj1h1o
	0r3jYXaJlvwZWcc/s35lF16svlLGP84=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-VrfibAwtN9qToKtMoisUIw-1; Thu,
 22 May 2025 01:16:17 -0400
X-MC-Unique: VrfibAwtN9qToKtMoisUIw-1
X-Mimecast-MFC-AGG-ID: VrfibAwtN9qToKtMoisUIw_1747890975
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0ED73180045B;
	Thu, 22 May 2025 05:16:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.7])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 17E2F19560AB;
	Thu, 22 May 2025 05:16:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 79F8421E66C3; Thu, 22 May 2025 07:16:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  Akihiko Odaki <akihiko.odaki@daynix.com>,  John Snow <jsnow@redhat.com>,
  Fabiano Rosas <farosas@suse.de>,  Peter Xu <peterx@redhat.com>,
  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
  Alexandre Iooss
 <erdnaxe@crans.org>,  David Hildenbrand <david@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>,  Gustavo Romero
 <gustavo.romero@linaro.org>,  "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 10/20] MAINTAINERS: add Akihiko and Dmitry as reviewers
In-Reply-To: <20250521164250.135776-11-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 21 May 2025 17:42:40 +0100")
References: <20250521164250.135776-1-alex.bennee@linaro.org>
	<20250521164250.135776-11-alex.bennee@linaro.org>
Date: Thu, 22 May 2025 07:16:11 +0200
Message-ID: <87msb5xm1w.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: Vx12xCaePIxU

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Thanks for volunteering to help.
>
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8dfb393c06..a14e2796e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2674,6 +2674,8 @@ F: include/hw/display/ramfb.h
>=20=20
>  virtio-gpu
>  M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> +R: Akihiko Odaki <akihiko.odaki@daynix.com>
> +R: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>  S: Odd Fixes
>  F: hw/display/virtio-gpu*
>  F: hw/display/virtio-vga.*

Reviewed-by: Markus Armbruster <armbru@redhat.com>
