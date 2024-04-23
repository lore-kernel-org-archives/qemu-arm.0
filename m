Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4975440ejd;
        Tue, 23 Apr 2024 05:24:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIKNl95HlP7dKhuNZQygZzOTQuId/kNT6WMEyH41QTxnjNkkHq1u/KhEk9xaREk4odXTXTHXrr+Eoh6V6ofsw2AZNzvVa8
X-Google-Smtp-Source: AGHT+IEEEwjFF4wnPV0Ct1jMdoV1FprSV0QWPmWJ7QAGRjdsAIjMzTid1w+LNZ+JmWYKm3mmM6rp
X-Received: by 2002:a05:622a:1344:b0:439:f542:fa1b with SMTP id w4-20020a05622a134400b00439f542fa1bmr1482730qtk.14.1713875041697;
        Tue, 23 Apr 2024 05:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713875041; cv=none;
        d=google.com; s=arc-20160816;
        b=I53t4reLfnnGWp+8dD92uOwKw29PI1XWHAmI/n4PCE0ri0m0TgsFPPLJFcAagoeI6/
         AdoQSN77Zz6I3iQXblTJCYccWLetjb7yfjQ30oQfqW9aeDFz/RGoTdHnOmP2GLAOpZ9c
         rQE2PzL4wdOf3s5yx0hYzQ7RqeY//h6x9+brehx+JIEci1BYT1foNo01lBWW86EWFEPD
         9Jii61da7CfFTxzoPVQPP64sYub30BaeUq+QQDYxWpgn4gT3CM9pUbAonF8wPniNYeiT
         A/hjrNVmOCa+rvl/2w6MIlX0CDGhLEJaWVdPQ9+XBLGqpJ4CBOZrnOl3P5ryY+EMDzWC
         XJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=fiqphxhYJargMMyLa5pQpnAo6EBJ91EbXVeBFXykreM=;
        fh=91dEIlbah35+t9zVVyoBUs9Q3y3sqoz24ttnniBdHd8=;
        b=P8tt3egka2bUfgdtXMIfVsms5emMh/xFG75e/fKBkRAuxVP3MNwOacRnD5mKxviFAq
         QP9hSdDS7OODg3oHm6cbAG/Vj1qsP56pg0fxhc5OMG7NGrtdMN84cLMbCNtqKPLiZYrf
         pAYRKnUAMgPW3TF8wGPIsdNB2gPM7Jtz+a0E8DL8VHTd4ydpb0apk8Lp5jawbVbBGqzo
         9QFbp0Wp8TaovZBeHRbD+cMqxB2GNGfglKCv1mus9igEJG9IwzsPYmKE4LtWLokOZh/5
         sBAl5ElMLDJ86N6nIlXeyPZNEciLT8eyIADXchByJnN1SYW/9zWKdYmpT6BtWT9IAR7u
         bpLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c3iKEF8A;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id x16-20020a05622a001000b0043787c0db4esi13186148qtw.252.2024.04.23.05.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c3iKEF8A;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713875041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fiqphxhYJargMMyLa5pQpnAo6EBJ91EbXVeBFXykreM=;
	b=c3iKEF8AUmOHhcHT+dT0tvLDK8s/n55QraW/7CdZFr6JWcDsVEX/pj0Yk14TYzBQHEqf2B
	xk5ZakN8XB4UkClCVFktzBzN2AZeVkrNd6MgUjpSUVkWk21pq7tiNwwOphJBI2coEZ3I+m
	7SLYglwEUu0VFgciPJGlKCUVE5r3qbM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-mn02n3XQPyO058_wGItq9Q-1; Tue, 23 Apr 2024 08:23:57 -0400
X-MC-Unique: mn02n3XQPyO058_wGItq9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BB988001B2;
	Tue, 23 Apr 2024 12:23:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.247])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE6B0406D72A;
	Tue, 23 Apr 2024 12:23:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E691C21E66E5; Tue, 23 Apr 2024 14:23:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org,  richard.henderson@linaro.org,
  philmd@linaro.org,  pbonzini@redhat.com,  alex.bennee@linaro.org,
  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Eric Blake
 <eblake@redhat.com>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo
 Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 15/22] target/arm/kvm-rme: Add measurement algorithm
 property
In-Reply-To: <20240419155709.318866-17-jean-philippe@linaro.org>
	(Jean-Philippe Brucker's message of "Fri, 19 Apr 2024 16:57:03 +0100")
References: <20240419155709.318866-2-jean-philippe@linaro.org>
	<20240419155709.318866-17-jean-philippe@linaro.org>
Date: Tue, 23 Apr 2024 14:23:55 +0200
Message-ID: <87o7a0b738.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: 2+QEiQqy3HIV

Jean-Philippe Brucker <jean-philippe@linaro.org> writes:

> This option selects which measurement algorithm to use for attestation.
> Supported values are SHA256 and SHA512. Default to SHA512 arbitrarily.
>
> SHA512 is generally faster on 64-bit architectures. On a few arm64 CPUs
> I tested SHA256 is much faster, but that's most likely because they only
> support acceleration via FEAT_SHA256 (Armv8.0) and not FEAT_SHA512
> (Armv8.2). Future CPUs supporting RME are likely to also support
> FEAT_SHA512.
>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v1->v2: use enum, pick default
> ---
>  qapi/qom.json        | 18 +++++++++++++++++-
>  target/arm/kvm-rme.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 91654aa267..84dce666b2 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -931,18 +931,34 @@
>    'data': { '*cpu-affinity': ['uint16'],
>              '*node-affinity': ['uint16'] } }
>=20=20
> +##
> +# @RmeGuestMeasurementAlgo:
> +#
> +# @sha256: Use the SHA256 algorithm

Let's have a blank line here.

> +# @sha512: Use the SHA512 algorithm
> +#
> +# Algorithm to use for realm measurements
> +#
> +# Since: FIXME

9.1

> +##
> +{ 'enum': 'RmeGuestMeasurementAlgo',
> +  'data': ['sha256', 'sha512'] }
> +
>  ##
>  # @RmeGuestProperties:
>  #
>  # Properties for rme-guest objects.
>  #
> +# @measurement-algo: Realm measurement algorithm (default: sha512)
> +#

We tend to avoid abbreviations in QMP: @measurement-algorithm.

May want to rename the type to RmeGuestMeasurementAlgorithm for
consistency.

>  # @personalization-value: Realm personalization value, as a 64-byte hex =
string
>  #     (default: 0)
>  #
>  # Since: FIXME
>  ##
>  { 'struct': 'RmeGuestProperties',
> -  'data': { '*personalization-value': 'str' } }
> +  'data': { '*personalization-value': 'str',
> +            '*measurement-algo': 'RmeGuestMeasurementAlgo' } }
>=20=20
>  ##
>  # @ObjectType:

With these issues addressed, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

[...]
