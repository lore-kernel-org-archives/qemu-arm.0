Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp130399njb;
        Tue, 26 Nov 2024 07:11:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmuLIPpt/G/3mEbvL4sslYIAmcxl5wrliVcSAz+KfD2PrrZd7ZxZMe06u6t4JkemnKZmVqICYxNtbgjA==@linaro.org
X-Google-Smtp-Source: AGHT+IE93VG89IMkH3/3Lo+mhV0Fewlq4Mtv90YaWrwWe7fi1t2BBTYbm2vVZmPRUA66wjQkQltH
X-Received: by 2002:a5d:5f4b:0:b0:382:1831:f7db with SMTP id ffacd0b85a97d-38260b59bc9mr14109080f8f.19.1732633886212;
        Tue, 26 Nov 2024 07:11:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732633886; cv=none;
        d=google.com; s=arc-20240605;
        b=BQl529Ny1H8Feh2L+yFoUiY+j2avHRkJkvUb36MZKwN1U66hUvdJpx0isUJvqTqzxF
         Z70F97czum8iT0gydcg5G1G28Nj6n8+nW05SofjCe98TC068X2BFl5NvCAkwY8CyRnbC
         zuLC0I7l33T472bS+HUGUZYTr3sWYtvdbjZSDxdapdwGOTDijtUBrY1HpPSvlg1UIuDj
         abUznZV0S73c9WUCVMx2tEevLTSqAlrPT53z3EL2vFp4WZICTkp2ktZeiaEkO9F1qtir
         9woBI1r1M5JJd7waSoFwgZWZrXX66VExzwfFvw8zcI1qT4daDZCofZ8YA0LyPXLXdeZZ
         y7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=JGU0ymwwubPU/KMUZ4VFprHZfB5g6qKLPHnXImxnKSc=;
        fh=O6vxloQoy7xuZtnw2OvAMY4dzoqPmTvirzKU/Lj8NMs=;
        b=YrKkAy7oweg3pnY2NJb5zr4LHlC2YUFdd27r+CDQC7BUkNcSRMY16K/Ia+Iha/Hgp0
         9FCCKhJbZeyO+jDsmpO7U/YO6zohLOmo4J0OIC5+1W4a+tOzwApHMFoz7vKHSUWUqLio
         ExatPjX5K76o4H0d8VElAI4/U+d2DUE/RXrwLnPp+u0BnsI9rl19bbteBkj3ARm1SYz0
         tXWzdnxXhBJygo5m7RLspxnYPzrFyJ79j3uwDLyf6L0tc5GGThWZezTpOKvQhNen6jy+
         noMM2PNnHp35/uBCDGCw8gW/HkHaYFrbzFk3kl/85BVErM1ET07kfvOcqTDW/RxKXZJa
         lY8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NQdKQw4l;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-385be98a15dsi1784397f8f.449.2024.11.26.07.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 07:11:26 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NQdKQw4l;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732633885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JGU0ymwwubPU/KMUZ4VFprHZfB5g6qKLPHnXImxnKSc=;
	b=NQdKQw4l9X2jM3eKN1p9KhiTnYG91lK9IWfH8hKN0fUG60Ko5zYImO0wHzHhAg0FtDC1Xa
	OhKQoNRzy+F7JL5R36ZV5WSUDTT1GEYdeNO9EV04SSWsBXlAWpkADiYowfJK5NmrZzZAa+
	zDEczTG6UONC7p6VKhv5TI+c6Bgs/0I=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439-TVL5P0iiO82lRUQp76T5GQ-1; Tue,
 26 Nov 2024 10:11:23 -0500
X-MC-Unique: TVL5P0iiO82lRUQp76T5GQ-1
X-Mimecast-MFC-AGG-ID: TVL5P0iiO82lRUQp76T5GQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EA7E1955F56;
	Tue, 26 Nov 2024 15:11:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.102])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A15CA1956086;
	Tue, 26 Nov 2024 15:11:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6DDB521E66C9; Tue, 26 Nov 2024 16:11:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
  peter.maydell@linaro.org,  richard.henderson@linaro.org,
  philmd@linaro.org,  qemu-arm@nongnu.org,  qemu-devel@nongnu.org,
  alex.bennee@linaro.org,  Eric Blake <eblake@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 11/26] target/arm/kvm-rme: Add measurement algorithm
 property
In-Reply-To: <Z0XFsC6vWkrR7aAm@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
	"Tue, 26 Nov 2024 12:57:20 +0000")
References: <20241125195626.856992-2-jean-philippe@linaro.org>
	<20241125195626.856992-13-jean-philippe@linaro.org>
	<Z0XFsC6vWkrR7aAm@redhat.com>
Date: Tue, 26 Nov 2024 16:11:19 +0100
Message-ID: <87ed2yowrs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: osFiEYAARiVf

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Nov 25, 2024 at 07:56:10PM +0000, Jean-Philippe Brucker wrote:

[...]

>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index f982850bca..901ba67634 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -1068,6 +1068,20 @@
>>    'data': { '*cpu-affinity': ['uint16'],
>>              '*node-affinity': ['uint16'] } }
>>=20=20
>> +##
>> +# @RmeGuestMeasurementAlgorithm:
>> +#
>> +# @sha256: Use the SHA256 algorithm
>> +#
>> +# @sha512: Use the SHA512 algorithm
>> +#
>> +# Algorithm to use for realm measurements
>> +#
>> +# Since: 9.3
>> +##
>> +{ 'enum': 'RmeGuestMeasurementAlgorithm',
>> +  'data': ['sha256', 'sha512'] }
>
>
> A design question for Markus....
>
>
> We have a "QCryptoHashAlg" enum that covers both of these strings
> and more besides.
>
> We have a choice of using a dedicated enum strictly limited to
> just what RME needs, vs using the common enum type, but rejecting
> unsupported algorithms at runtime.  Do we prefer duplication for
> improve specificity, or removal of duplication ?

With a dedicated enum, introspection shows precisely the accepted
values.

If we reuse a wider enum, introspection shows additional, invalid
values.

Say we later make one of these valid here.  If we reuse the wider enum
now, nothing changes in introspection then, i.e. introspection cannot
tell us whether this particular QEMU supports this additional algorithm.
With a dedicated enum, it can.  Whether that's needed in practice I find
hard to predict.

I lean towards lean towards dedicated enum.

Questions?

[...]
