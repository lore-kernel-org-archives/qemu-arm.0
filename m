Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4970569ejd;
        Tue, 23 Apr 2024 05:16:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQQuJk+29M9qjhN8nuiuBB2CvV79mZHzmXvskPMsvp6NQ5NV/XhRDwFjKsI5Rth/gupqQsCfnTqXA+aq7hzFWOx9fD9yIt
X-Google-Smtp-Source: AGHT+IH3J0zoR9hR62x8wPpdDQC8U3+j5WBGe6tu7o9KMngv2OVPyANBdTcjxCYh7gJbCK3yRjz+
X-Received: by 2002:a05:6122:2017:b0:4da:aabe:6f6c with SMTP id l23-20020a056122201700b004daaabe6f6cmr16576074vkd.7.1713874562520;
        Tue, 23 Apr 2024 05:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713874562; cv=none;
        d=google.com; s=arc-20160816;
        b=F9cJvFerUeh0oBpWKbw5r4Zq2npAIfm3F6+48pUJFFfbVdZYXRRufg3MZbRE6UmSJS
         HZKOw7iV59v9b7bFR9lRx+8/e64M5h8Q3YeYosAB4JzV4/FSTi2MYcGscuNq/qmIgXjJ
         CnpGpRLbGbZD7g8YaOnLvKk8vf7GvW8i2MYiduK0T7SZFE7xFvO2QbTeZyy/s592xVT5
         S7X391VJzkI0tXklDdk09NTY1QvaiikZWOe1WU7Zw5ILbp/vr1kcbrquICKPsv2wMaQL
         rXLL7y/Dbt4fm1o1rzdn0dMbhgOs0GkQSjlKDvKYrfDW3CPDHDcuJZEBA71PbzazMq3o
         fMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=sqkrQb1Je3cVxkFlaa4ueHZH6N5awSLdy/MU4fhDqFs=;
        fh=zR4PX+0l2zjKEYFtAPRMm8RWdd9uwoqaczOYjkQa7Z8=;
        b=AMPOa0pk0UO6wS8xqUiwrkwnjTNxCFchaQkr2vnyY1sbi0jm5nmYkWyP+sXS4r465A
         Xm2BwGkqqGr1PrD6+aZkBM9SgiCUuuC5YxWVrKFfiCAFIN6XdSQ8Q2yIlugPjGN5ks4Z
         Cv+EDjXxp+lBKDKiW3z5qQHTqIEQ7LYW+9/Bf42hgj+yy6VhEMXHMg/xg36VK7RjbRwE
         J+ZFcjwd3Ca1FxOHStH4pM6bZrB8Gjxwy7ZsobiSbhrAf058p9rmhMNmNODEgVi9Y1Jz
         fPiboSw2d5CbhxQ+DJB++A+XowFr2vRRAIaeAH7jRm5aTKpq4nUeTlUPWmx19au5gvSw
         YLFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KbEcb/OL";
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a3-20020a1ffc03000000b004c7f11bac3esi1904167vki.180.2024.04.23.05.16.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KbEcb/OL";
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713874562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqkrQb1Je3cVxkFlaa4ueHZH6N5awSLdy/MU4fhDqFs=;
	b=KbEcb/OLFmaDc975v7fWy8k9qK2AbTOFaynGxHFH2k/y/cRkwmF6uQimukXtjLPGWQZeJ/
	BJDKvhtFYFPgm1fSfPnrFpSrVUahDWsXSumQk9veoF+6AFO5fq6XvL43TKkpjJbgjDVMU+
	QiIPfHrtxE9qmmvXKjGtAR/BI5v9hfI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-9XWVMldoOoabyQictYSepg-1; Tue, 23 Apr 2024 08:15:57 -0400
X-MC-Unique: 9XWVMldoOoabyQictYSepg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EB278E9E88;
	Tue, 23 Apr 2024 12:15:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.247])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A8761121313;
	Tue, 23 Apr 2024 12:15:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2691721E66E5; Tue, 23 Apr 2024 14:15:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
  peter.maydell@linaro.org,  richard.henderson@linaro.org,
  philmd@linaro.org,  pbonzini@redhat.com,  alex.bennee@linaro.org,
  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Eric Blake
 <eblake@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 02/22] target/arm: Add confidential guest support
In-Reply-To: <ZiKa6MQaujEMlC23@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
	"Fri, 19 Apr 2024 17:25:12 +0100")
References: <20240419155709.318866-2-jean-philippe@linaro.org>
	<20240419155709.318866-4-jean-philippe@linaro.org>
	<ZiKa6MQaujEMlC23@redhat.com>
Date: Tue, 23 Apr 2024 14:15:56 +0200
Message-ID: <871q6wcm0z.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: 95pl6Px6vGj3

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Apr 19, 2024 at 04:56:50PM +0100, Jean-Philippe Brucker wrote:
>> Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
>> support the Arm Realm Management Extension (RME). It is instantiated by
>> passing on the command-line:
>>=20
>>   -M virt,confidential-guest-support=3D<id>
>>   -object guest-rme,id=3D<id>[,options...]

rme-guest

Since there are no options so far, I'd omit [,options...]

> How about either "arm-rme" or merely 'rme' as the object name=20

"arm-rme" sounds good to me.  Need to adjust the various identifiers
with "guest" in them, then.

>> This is only the skeleton. Support will be added in following patches.
>>=20
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Cc: Eduardo Habkost <eduardo@habkost.net>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>
