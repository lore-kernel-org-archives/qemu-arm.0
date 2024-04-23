Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4971668ejd;
        Tue, 23 Apr 2024 05:17:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmFyojXCJi96fHJQFYY7QGN70b6ZCs11E2c5BmMBH5OryLT2dIYEJH8RUJgFDldJyZw0vqW48zdesfgZIaWcl6XNG5zkiu
X-Google-Smtp-Source: AGHT+IGSj7XpuOluKOENOvAcG3OMCLV99H88LHuVSp7fj6CjN4ti8BsMkWs3h0P0sKeoLl8Yp7B2
X-Received: by 2002:ac8:7f83:0:b0:437:bedb:3ff with SMTP id z3-20020ac87f83000000b00437bedb03ffmr4178923qtj.27.1713874670131;
        Tue, 23 Apr 2024 05:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713874670; cv=none;
        d=google.com; s=arc-20160816;
        b=XCt7dP/mWpKqqatdx5BYrAbQ4CGO54NpQ9uWM7oH3CrcU7mVPsBO1J0U4nqOEq8K9r
         e8+uvj9I7qsLL4bFXThttni03c1IbbvBDU0qyAGoMtnlv7wQbHtlUn/JIk6Hq0jwaT7E
         SUTJi0+5zSXNw9hPRXvBVOF81bYIwyPR8Bq9x4VRUxdsTs9PNJMUd/SCj6Y8EfwAcDpe
         1J9OQ4+/nmq/ZVIuUpXq7E5g4n6jikSkZ+JHSHubGQCJcye9N+WzNI2q1sZmjLqdXd2j
         bVO7YiHCoAvRzCo1coLl9P/YMhOQpDx4+VZL09yfwUDYiqBSwzooZf6mK1ZkBRIfh74b
         TWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=dLv/dX/0+IsyAizWsLYtiWDQIwTzqjT2akh2sOE00ZQ=;
        fh=91dEIlbah35+t9zVVyoBUs9Q3y3sqoz24ttnniBdHd8=;
        b=CDtGIKNyhZGUXljS/bm5mZLPuBljxbXv+S+4UtWZBnBlpvaFlgG/eUzagyopG9duEj
         TiwWAX0SKUylYZDAel23WyEpDwfQdxa/BkbRpfi+N7XvTlbj+afx/KlrDBlEeRN1+7gO
         +6ZOaT1dmC7WWSYJc24mtkwu/nlB3UagOSb85BmSQ/LSNZd8V8dz65ovaxekCcWbXCmD
         BEmlop32kgkmekbZXm7ser/Wcj2VBsWD0hxcGi0GNUVJH1vkeQBVUeWC6Z0+/wxx0SHj
         9GA752BgeLXbyRXcvL2DRTxH8u8s6GDtvbR/86Cdqa27eTCuDhuHq/7dRO7Eb5iP6wEq
         ijdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WLLZBYSi;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id p20-20020a05622a00d400b00437545f0670si12941208qtw.683.2024.04.23.05.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:17:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WLLZBYSi;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713874669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLv/dX/0+IsyAizWsLYtiWDQIwTzqjT2akh2sOE00ZQ=;
	b=WLLZBYSiut9HY66sH0XVvoPc2rg7qYb4bsqxV8WcoexQRUKzqL69KwLHoeLW98T7DYUFFC
	z9YGF5H+Jv7CjYYzVOWme+DZsle6LARmwKDlOjhmwpaBuSGGADq37KkMtWbFMdvGgE/2xL
	sGjDKwea0t2X8uSsfQYF3ja9vS5vOR0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-iGiBr7s_Obmj3LR8uEKvYg-1; Tue, 23 Apr 2024 08:17:45 -0400
X-MC-Unique: iGiBr7s_Obmj3LR8uEKvYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 588A280B935;
	Tue, 23 Apr 2024 12:17:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.247])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36ED81121312;
	Tue, 23 Apr 2024 12:17:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 588F821E66E5; Tue, 23 Apr 2024 14:17:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org,  richard.henderson@linaro.org,
  philmd@linaro.org,  pbonzini@redhat.com,  alex.bennee@linaro.org,
  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Eric Blake
 <eblake@redhat.com>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo
 Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 14/22] target/arm/kvm-rme: Add Realm Personalization
 Value parameter
In-Reply-To: <20240419155709.318866-16-jean-philippe@linaro.org>
	(Jean-Philippe Brucker's message of "Fri, 19 Apr 2024 16:57:02 +0100")
References: <20240419155709.318866-2-jean-philippe@linaro.org>
	<20240419155709.318866-16-jean-philippe@linaro.org>
Date: Tue, 23 Apr 2024 14:17:43 +0200
Message-ID: <87v848b7dk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: m9hpN04erO+h

Jean-Philippe Brucker <jean-philippe@linaro.org> writes:

> The Realm Personalization Value (RPV) is provided by the user to
> distinguish Realms that have the same initial measurement.
>
> The user provides up to 64 hexadecimal bytes. They are stored into the
> RPV in the same order, zero-padded on the right.
>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v1->v2: Move parsing early, store as-is rather than reverted
> ---
>  qapi/qom.json        |  15 +++++-
>  target/arm/kvm-rme.c | 111 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 125 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 623ec8071f..91654aa267 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -931,6 +931,18 @@
>    'data': { '*cpu-affinity': ['uint16'],
>              '*node-affinity': ['uint16'] } }
>=20=20
> +##
> +# @RmeGuestProperties:
> +#
> +# Properties for rme-guest objects.
> +#
> +# @personalization-value: Realm personalization value, as a 64-byte hex =
string
> +#     (default: 0)

docs/devel/qapi-code-gen.rst:

    For legibility, wrap text paragraphs so every line is at most 70
    characters long.

> +#
> +# Since: FIXME

9.1

> +##
> +{ 'struct': 'RmeGuestProperties',
> +  'data': { '*personalization-value': 'str' } }
>=20=20
>  ##
>  # @ObjectType:
> @@ -1066,7 +1078,8 @@
>        'tls-creds-x509':             'TlsCredsX509Properties',
>        'tls-cipher-suites':          'TlsCredsProperties',
>        'x-remote-object':            'RemoteObjectProperties',
> -      'x-vfio-user-server':         'VfioUserServerProperties'
> +      'x-vfio-user-server':         'VfioUserServerProperties',
> +      'rme-guest':                  'RmeGuestProperties'
>    } }
>=20=20
>  ##

With the doc comment issues addressed, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

[...]
