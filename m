Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2780008ejm;
        Mon, 24 Apr 2023 05:38:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z1bi+gL6PbZBwHAAX6qdac4bzYA/uKvO4lmBdqOLJBDYvyJSxLiex+nw/5UPYe5Nd1pIzj
X-Received: by 2002:a5d:56ca:0:b0:2fb:cbdf:fb48 with SMTP id m10-20020a5d56ca000000b002fbcbdffb48mr9148876wrw.3.1682339906416;
        Mon, 24 Apr 2023 05:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682339906; cv=none;
        d=google.com; s=arc-20160816;
        b=faeNk0N71t9+rhmtpNJWnvdZcIfqfeennQSzWGLwSy8SKxAPHfsiJ0zMRyXdTILO7b
         2tt+I09rubUAhStOTgxW9kzS0H6eaJ834ojYJNeV+ndxHhhsh/92Dkm2qsecduWBNESM
         ng/hkefs8VbUMI76+IT1ayCu4fPOvKrx3/MeAJ+cxGv1vRldENNRwNP3S8mENp8lekx/
         TJa7sBVLg93oLDvEbiu/u3Ww0jEULvk54kOnEdzdPf4/950DcLtVQUN/fS8ewBdPSY+3
         ozWOWZDWuFzfOLWZ10pXBVX56utaWubkz+/VheNLhNyZY8siR0moTBP79VuFDHkGH7Ec
         TurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=9m/I9fZrM/oAlSdMVqxyn5NkRX7eOd0YiT13Q5R7mzo=;
        b=qv6eVtQbycAp7NGNkmve+GKyzHBlJUTzbIChi4udx6UHwOQvRL4MbucJzt4CRBSqCk
         6VZs6HNKgXLEfFzl9ZMYJVWZpDo1jCo+1lErafMKJJPqPz7LGO3tvJQ7MGb7HNfmjF52
         oWGVZiZEVP7a3Rv2E9QxkDmDltQVnqj55eAFcfZM2YupUWCJ71TIC59Oz/0iFMCFNfsF
         ZKrueTM8VBP58GMP0VitG6RFMNFi9jpTh85A7fsXU0kZQ2yei9tuKv1nepuDcStQcROy
         4DXHVF7AKdyHlc31Dkcc1gvOEhcp2w/IeTiNoG0TN2+RkIJipH0jsvTP6PZsmuX8vOqy
         gWsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=bdw1kDsY;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=ZO6wWMms;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id j18-20020a5d4532000000b002f4b5696398si6377169wra.412.2023.04.24.05.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 05:38:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=bdw1kDsY;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=ZO6wWMms;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 098C121AA6;
	Mon, 24 Apr 2023 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682339906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9m/I9fZrM/oAlSdMVqxyn5NkRX7eOd0YiT13Q5R7mzo=;
	b=bdw1kDsYFzFf3ewLWd/arsZNbyJpKYRONuQTsoiqv5qTyMvyuFkGzWzIZ7IZI1ZkWW8p3y
	Cat4ZXruKj08dRo2PqalGxH0jVSLIWIP2GgmCUjVvTlYef4fhE2LGxaBVhSU86Jab4lSNR
	FMxfJjOD0XPfjCImf5J9oM77uJShd2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682339906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9m/I9fZrM/oAlSdMVqxyn5NkRX7eOd0YiT13Q5R7mzo=;
	b=ZO6wWMmsL5J50rUwXf67WDmXNEdiGXooWBKSk3sqlCCHsfHb/hFWeh2pNAQgl60nzsikrz
	PSpj6yLpLoUGKZBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BC111390E;
	Mon, 24 Apr 2023 12:38:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8FtGFUF4RmRUfAAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 24 Apr 2023 12:38:25 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v10 06/11] target/arm: move cpu_tcg to tcg/cpu32.c
In-Reply-To: <3175956a-ab3c-7259-1b28-6fe54043238f@linaro.org>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-7-farosas@suse.de>
 <3175956a-ab3c-7259-1b28-6fe54043238f@linaro.org>
Date: Mon, 24 Apr 2023 09:38:23 -0300
Message-ID: <87cz3ttpz4.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xlx/BNrZ+484

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 12/4/23 14:18, Fabiano Rosas wrote:
>> From: Claudio Fontana <cfontana@suse.de>
>>=20
>> move the module containing cpu models definitions
>> for 32bit TCG-only CPUs to tcg/ and rename it for clarity.
>>=20
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/arm/virt.c                         |  2 +-
>>   target/arm/meson.build                |  1 -
>>   target/arm/{cpu_tcg.c =3D> tcg/cpu32.c} | 13 +++----------
>>   target/arm/tcg/cpu64.c                |  2 +-
>>   target/arm/tcg/meson.build            |  1 +
>>   tests/qtest/arm-cpu-features.c        | 12 +++++++++---
>>   6 files changed, 15 insertions(+), 16 deletions(-)
>>   rename target/arm/{cpu_tcg.c =3D> tcg/cpu32.c} (99%)
>
>
>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-featur=
es.c
>> index 1cb08138ad..1555b0bab8 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -506,9 +506,15 @@ static void test_query_cpu_model_expansion_kvm(cons=
t void *data)
>>           QDict *resp;
>>           char *error;
>>=20=20=20
>> -        assert_error(qts, "cortex-a15",
>> -            "We cannot guarantee the CPU type 'cortex-a15' works "
>> -            "with KVM on this host", NULL);
>> +        if (qtest_has_accel("tcg")) {
>
> Can we add a comment to explain this non trivial case?
>

Hi, good idea, this is a bit opaque indeed.

> I suppose the reason is "KVM is builtin but not available, so we don't
> want to test the TCG fallback", is that correct?
>

No, it's just that originally the default cpu was cortex-a15 which we
don't give guarantees for when using KVM. But now that cpu is not
present in the KVM-only build at all, hence "The CPU ... is not a
recognized ARM CPU type".

>> +            assert_error(qts, "cortex-a15",
>> +                         "We cannot guarantee the CPU type 'cortex-a15'=
 works "
>> +                         "with KVM on this host", NULL);
>> +        } else {
>> +            assert_error(qts, "cortex-a15",
>> +                         "The CPU type 'cortex-a15' is not a "
>> +                         "recognized ARM CPU type", NULL);
>> +        }
>>=20=20=20
>>           assert_has_feature_enabled(qts, "host", "aarch64");
>>=20=20=20
