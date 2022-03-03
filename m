Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp676090lfo;
        Thu, 3 Mar 2022 04:23:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxY6owP+U0t9nL3Bfkql1Tvcydbudm6JTRxQWgHkPxwFh63k6VImihyl6YHKPbXrpqxIChj
X-Received: by 2002:a17:906:66cb:b0:6cf:e4f7:9504 with SMTP id k11-20020a17090666cb00b006cfe4f79504mr27266626ejp.142.1646310220761;
        Thu, 03 Mar 2022 04:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646310220; cv=none;
        d=google.com; s=arc-20160816;
        b=FFyLgCzYyBMKwY1KsGUPj7lVrdqBqkkygM5GbYgDRbnKQZi1g3Z5fpQjnwlSrHN5Mt
         oNTdsPl/lS48QIRe3zplB1TCiVlbKn9z208/v4MHm//PvsnB75AWCgwIgd4rL42c9QLW
         1v+Wx/ssNIaktkNNw7Jy5/BOnX326qhvVqoL6OLA0etlVqJKBXeI5u5xOVnfqz5wdZ81
         QlofvDMvk1GQW3o94WqlOoy48VPjcSsUyF2cLK5QdQ2Wac1rV7T+yu5WVe7J1tuiFSzQ
         9ASR/fWzlIsomdpDrIqkAz2LcEhdTWto3AJMZWCAgzy9in7f0bHxhHRJ5TObXwk4E4f9
         UpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=xqB53/OlukljnakrlD0/NJ34F7CHmRudeq/p9wfXyzQ=;
        b=GfrLc9O6q5Lt4gqIyFemU6hiAYTM5d6/wqHisXe98juyOb6zMRzKYLespK2UoRYS5C
         bhwFlgEVIdbNADHTHnNziMAjj5RvR8Bm/jWpZZenRoesv9ZQFp3w0YHD9izN+iuH9KOh
         wqkKSH+V4WZbQkW6hIb+xRvB/pkTzX6L9oF43KeJVvRq4Gmiw7JgGny4LuetlzEkrLFJ
         /NeakyljPNRtTdLY/4+UDaee+vok75rfGtD2KjDkLHvtJh/P9VY51jxfwBfKFNvHsHPn
         cxpjE98rnFOL+cHNguxTRIz7O0bgJRl5TJ6tXyKJQcfVoxisudgNVGGYrDbloVcjoV8i
         QVfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YhfpJuJH;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id cz2-20020a0564021ca200b00412b83c8daesi1072932edb.552.2022.03.03.04.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 04:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YhfpJuJH;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646310219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xqB53/OlukljnakrlD0/NJ34F7CHmRudeq/p9wfXyzQ=;
	b=YhfpJuJHXaEU0spY+oLArIvVgwOuQdTrOgiyPHSc27wYFm3l4nKBouVB0oivlSuOThwAcy
	vztt+MXUBNAVFDbmS9UY5HkAtnX15D5ZxeUUkziuao4ONkdE+Ei6Wn9JAYqRDKjaFv1XqO
	3Mep0dr+QPaWCmeo1BzddbjMxDDX5is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-tQLhhOIDMvC_5mYdQvLgDw-1; Thu, 03 Mar 2022 07:23:36 -0500
X-MC-Unique: tQLhhOIDMvC_5mYdQvLgDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 707291006AA6;
	Thu,  3 Mar 2022 12:23:32 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org (unknown [10.22.32.111])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 772987B6FD;
	Thu,  3 Mar 2022 12:23:05 +0000 (UTC)
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-6-crosa@redhat.com>
 <aa0e1eb4-ef43-b386-e7a3-c034f666181b@gmail.com>
User-agent: mu4e 1.6.6; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: qemu-devel@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?Q?Herv=C3=A9?=
 Poussineau <hpoussin@reactos.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, Fabien Chouteau <chouteau@adacore.com>, Antony Pavlov
 <antonynpavlov@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>, Michael Rolnik
 <mrolnik@gmail.com>, Greg Kurz <groug@kaod.org>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, David Gibson <david@gibson.dropbear.id.au>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, Beraldo Leal <bleal@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, KONRAD Frederic <frederic.konrad@adacore.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-s390x@nongnu.org, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Eric Farman
 <farman@linux.ibm.com>
Subject: Re: [PATCH 5/9] tests/avocado/linux_ssh_mips_malta.py: add missing
 accel (tcg) tag
Date: Thu, 03 Mar 2022 07:13:43 -0500
In-reply-to: <aa0e1eb4-ef43-b386-e7a3-c034f666181b@gmail.com>
Message-ID: <8735jzmdib.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Pm2PYPEDbFsa


Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:

> On 25/2/22 22:01, Cleber Rosa wrote:
>> Being explicit about the accelerator used on these tests is a good
>> thing in itself, but it will also be used in the filtering rules
>> applied on "make check-avocado".
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   tests/avocado/linux_ssh_mips_malta.py | 3 +++
>>   1 file changed, 3 insertions(+)
>> diff --git a/tests/avocado/linux_ssh_mips_malta.py
>> b/tests/avocado/linux_ssh_mips_malta.py
>> index c0f0be5ade..0179d8a6ca 100644
>> --- a/tests/avocado/linux_ssh_mips_malta.py
>> +++ b/tests/avocado/linux_ssh_mips_malta.py
>> @@ -23,6 +23,9 @@
>>   @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout=
')
>
> Should we remove this line then? ^^^
>

Yes, we definitely should.  But, I thought it should be a next step.
The reason being that manual invocations of avocado or a custom list of
tests to "make check-avocado" will still respect that at this point.

What do you think?

Cheers,
- Cleber.
