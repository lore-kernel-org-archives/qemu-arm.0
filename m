Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4982545ejd;
        Tue, 23 Apr 2024 05:35:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsgRoL+GB/oaA2Jzhu+4XdKpxQUMJx0Rm6D5f+zivOTrtX2dhRgyAVE3i5v3NQHgaGPbPAmahWXxWo+6kyP3jAiUdvv6PV
X-Google-Smtp-Source: AGHT+IHyVBr+dAL2I9xJRYpOQplAl9Fx3pQI/3f2H/rT+Cz4qoj/K9kNUYkJ5LhaxNtX8hyEDgh1
X-Received: by 2002:a05:6359:760d:b0:18a:9bba:972a with SMTP id wg13-20020a056359760d00b0018a9bba972amr8752090rwc.32.1713875735285;
        Tue, 23 Apr 2024 05:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713875735; cv=none;
        d=google.com; s=arc-20160816;
        b=z+aChUMteDWTAbhcBX1YEFBrX5QlWO23GtWpOrltlvEjcNck3yBfrWV3x8n2DeSrUE
         YZ1mTt99iAqnaGPNixXVTfuSWDoDAxRYQFze5Bf9XrmsxSdWXmAZwd7lcHwmnnAqNGDE
         TC2BU6iDa6NjnpCsAMyT6GQEW8SZQoqNQB6LM8ya1bQZl21kqRrujzqUSUzmCBgY5UVc
         fg90XGAJmja/WZ6Ew6XRha/zv1WsIlEB34/mq2qWKNPg1CR5v9ixhEgXJJBqI6Y3LayC
         6Xqum1lHxbKAIeBoVPfKRjUOnPWf51aibi8VLx4DY3HMs+BGVxDgJbzZG05CQnfh8OcK
         vx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=4OCGcb/2OSw9wHh3Ls5sXs3Y9oqsKXa+lhRpE4ntXl8=;
        fh=qJqPnzegr3f0HpY6BqDiDfzVll36UPVhNOiXbsooSMc=;
        b=hwQhXApsLjK6eeJvSFnay4bNDfKr8mqLRSGjliG/h93I5wTy0DEVwWzn9Ltisl7hE6
         kwWib0aAJ/CnE/xLl4KCatxUkmfzTVK0n2hyOPmR1t+snLYYCvzA1Dq0Rx/ZTJexsIwV
         ZfRoDR9U5CklGwOmvt2YFbKs9yhiKA4AziHKVaEsViGzlZJLQuAhU7nnAGskSHfl+Lt0
         ndnPDo0neNpjB1YoUerDixocqP0D83f9qRrBC58n8S/SP5Ap50zC7b9O996+sRK23Evu
         8la1Q7TSlAiJrpe17t1vQkd1QkG51Xx4kkHhRR9bQvmV6+EEB5kcKXOboL1yXDO9311p
         tfMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OYHzJCms;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id x12-20020a05622a000c00b00439ef24cb69si1366541qtw.479.2024.04.23.05.35.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:35:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OYHzJCms;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713875734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4OCGcb/2OSw9wHh3Ls5sXs3Y9oqsKXa+lhRpE4ntXl8=;
	b=OYHzJCmsQnhRCmikC+aJFT2bNBuoIYt+zCu+5UCLonQaNtvAf87/bBmqrEdn455dTwN859
	BNn3INEVWG7Q/VgAnv21bPouQr0IxSiyermIBd4DEGsdT8G3iEdPp6qE5rtbc7oTCVb9yI
	7KEjGDHUMT79qik10/8Oxtj4vsDVNwY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-fCPgjXdeNrSVBRVXV967Mw-1; Tue, 23 Apr 2024 08:35:32 -0400
X-MC-Unique: fCPgjXdeNrSVBRVXV967Mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D4C3834FBB;
	Tue, 23 Apr 2024 12:35:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.247])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C6B2C13FA4;
	Tue, 23 Apr 2024 12:35:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5DD3C21E66E5; Tue, 23 Apr 2024 14:35:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
  richard.henderson@linaro.org,  philmd@linaro.org,  pbonzini@redhat.com,
  alex.bennee@linaro.org,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
  Eric Blake <eblake@redhat.com>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 14/22] target/arm/kvm-rme: Add Realm Personalization
 Value parameter
In-Reply-To: <CAFEAcA_0wi_Ujt5vjbcUFacNqxktmbF7Kma8uEw+pOUp==W0oA@mail.gmail.com>
	(Peter Maydell's message of "Tue, 23 Apr 2024 13:20:20 +0100")
References: <20240419155709.318866-2-jean-philippe@linaro.org>
	<20240419155709.318866-16-jean-philippe@linaro.org>
	<CAFEAcA_0wi_Ujt5vjbcUFacNqxktmbF7Kma8uEw+pOUp==W0oA@mail.gmail.com>
Date: Tue, 23 Apr 2024 14:35:30 +0200
Message-ID: <871q6wb6jx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-TUID: bc3jgLWZSdqA

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 19 Apr 2024 at 16:59, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
>>
>> The Realm Personalization Value (RPV) is provided by the user to
>> distinguish Realms that have the same initial measurement.
>>
>> The user provides up to 64 hexadecimal bytes. They are stored into the
>> RPV in the same order, zero-padded on the right.
>>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Cc: Eduardo Habkost <eduardo@habkost.net>
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> ---
>> v1->v2: Move parsing early, store as-is rather than reverted
>> ---
>>  qapi/qom.json        |  15 +++++-
>>  target/arm/kvm-rme.c | 111 +++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 125 insertions(+), 1 deletion(-)
>>
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index 623ec8071f..91654aa267 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -931,6 +931,18 @@
>>    'data': { '*cpu-affinity': ['uint16'],
>>              '*node-affinity': ['uint16'] } }
>>
>> +##
>> +# @RmeGuestProperties:
>> +#
>> +# Properties for rme-guest objects.
>> +#
>> +# @personalization-value: Realm personalization value, as a 64-byte hex=
 string
>> +#     (default: 0)
>> +#
>> +# Since: FIXME
>> +##
>> +{ 'struct': 'RmeGuestProperties',
>> +  'data': { '*personalization-value': 'str' } }
>>
>>  ##
>>  # @ObjectType:
>> @@ -1066,7 +1078,8 @@
>>        'tls-creds-x509':             'TlsCredsX509Properties',
>>        'tls-cipher-suites':          'TlsCredsProperties',
>>        'x-remote-object':            'RemoteObjectProperties',
>> -      'x-vfio-user-server':         'VfioUserServerProperties'
>> +      'x-vfio-user-server':         'VfioUserServerProperties',
>> +      'rme-guest':                  'RmeGuestProperties'
>>    } }
>
> This list is in alphabetical order. Are we obliged to add new
> items to the end for some compatibility reason, or should this new

Since order does not matter, we should keep it sorted.  Same for enum
ObjectType.

Thanks!
