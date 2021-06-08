Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4542408lfa;
        Tue, 8 Jun 2021 08:42:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhFR8kz79q9qZ7/ArFfKK2oNz97Fs2gz1rALV9OzwoAWRxerao0JrsCusOuQHasP2r/GLe
X-Received: by 2002:a50:ec08:: with SMTP id g8mr26847908edr.376.1623166924492;
        Tue, 08 Jun 2021 08:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623166924; cv=none;
        d=google.com; s=arc-20160816;
        b=WLBl1v68ZVyQcPdOwjKWhkdovN6WrthIObQUk7XGGMip0BNI4KPM7240q+w1BmV2aM
         /RKdHh2JI4hFpMQdfGCJKUkSJ8IcIK1xAKiq1mipr4gLVIcAApzq3yeMgwP3nILTll3n
         ev+ErMvnHAmIRFXtZD0rTnZqGjRY7g8po51/bBb/2RePKcwQTBjJcFu3xq6bq7TqHDdj
         pKkH20KU10Od0vOh6hzKDAX3IzR9SC+yqe2v1z4yqsXXA1h+gAdWA+FOGzaaZjlqgdCG
         rxHt4e4o6gISu8ztE2WSTxE1zS/JVxHNv2oPSQ7UtZSaruzjWBCOGnWsSGXr64X3hW2a
         5ljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=IOL0If2qzXj9pGqSD5CwxZovrcohf6MaoE1UZUpidd8=;
        b=ipT3ohwEAqnQPq7JffZWf5Ed6CPVDS/e138+ItT1Akb4FsLhFZtl8MXj9dii6ECAXe
         AE0/Hw9Wi296enZni7xkKdWsy/2XIIx4jTM5HO7J2UiEve0Q6eRK4JQB7U00TnscrHKK
         LZBJbBhhHI3khc70kFzTmxt5xY3FKLTskc32V0y0mqgYV+V4/LVq587FkUIgg1iB8j5C
         XHp+VZZeqzVux6jMFS+R6vMl50f+cXzqiQYQU4/t7B/M1qEzIiXc+2Pq8H5EXf59hj8A
         9ck1sQgFAEEEPhbmWDnasPC1teDfARfuzSyGKpqKxVjj3t3r1kyiLlxNN0FPHcxDkfes
         /YDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VQ8hPq0B;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id k20si38887ejd.293.2021.06.08.08.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 08:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VQ8hPq0B;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623166923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IOL0If2qzXj9pGqSD5CwxZovrcohf6MaoE1UZUpidd8=;
	b=VQ8hPq0B8RVyMSuL9DOzLWxwVVaupGQQ5ceSHDtL45VEX0uwDlyeOk5YGTR2i5esKhqZ1N
	trDEGsGqNhTrT37PzWdXYov3yEqs2kDMWc4/TpMyFyF3XtBx8c0hBy/H+16xz0J0PwupXr
	Di/EDP6ofWBs7goTdhueKfY1PtEf83A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-qmYm8qVbNo2eFrYna8hyeA-1; Tue, 08 Jun 2021 11:42:00 -0400
X-MC-Unique: qmYm8qVbNo2eFrYna8hyeA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25AC38DA126;
	Tue,  8 Jun 2021 15:41:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com [10.36.112.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E93F810016F8;
	Tue,  8 Jun 2021 15:41:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 818C1113865F; Tue,  8 Jun 2021 17:41:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Eduardo Habkost <ehabkost@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Dau?=
 =?utf-8?Q?d=C3=A9?=
 <philmd@redhat.com>,  qemu-arm@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH  v16 02/99] accel: Introduce 'query-accels' QMP command
References: <20210604155312.15902-1-alex.bennee@linaro.org>
	<20210604155312.15902-3-alex.bennee@linaro.org>
Date: Tue, 08 Jun 2021 17:41:57 +0200
In-Reply-To: <20210604155312.15902-3-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
	message of "Fri, 4 Jun 2021 16:51:35 +0100")
Message-ID: <87r1hcwegq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: O1Qj6MvQQDT3

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
>
> - Accelerator is a QAPI enum of all existing accelerators,
>
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.
>
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>
> For example on a KVM-only build we get:
>
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "name": "qtest"
>             },
>             {
>                 "name": "kvm"
>             }
>         ]
>     }
>
> Note that we can't make the enum values or union branches conditional
> because of target-specific poisoning of accelerator definitions.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-3-philmd@redhat.com>

I assume this one's superseded by Phil's "[PATCH v8 02/12] accel:
Introduce 'query-accels' QMP command", i.e. I should review that one,
not this one.
