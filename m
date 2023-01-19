Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp562017ejc;
        Thu, 19 Jan 2023 11:12:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuEFh8KdNr8COjEKhKWrXaLhU88UwZzYI4BZhsCvC0c9/Iiac7LioKOlTk8tGEY+S6MqnjG
X-Received: by 2002:a5d:43cf:0:b0:2bb:dca3:b29 with SMTP id v15-20020a5d43cf000000b002bbdca30b29mr9540820wrr.36.1674155545446;
        Thu, 19 Jan 2023 11:12:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674155545; cv=none;
        d=google.com; s=arc-20160816;
        b=B7ZwVty1w4gUYy3jkbZoO/7tEGoJAtFcEGcy32lCu8Ez3QGxUUsAAZJpHOwXYbL+jw
         lsLDFEjP4TBimIh1wYzvar6iYEXuuz52tBTLRVYQ80mHqwJ9KVn3MaBKjDWee+K1+vGC
         S+ENERBJCdXRa1f9iaaM26LThpB8pl1ioyrXaS0rBRe0zImT0PcDBu8Vt9xBDy0J3zNV
         y9ZN544zMmS3L8gVOxEOoOEggBW6/c12qN03Jx9kOaLCgg2mG8mTAG5QDn/JBgMk/zQ0
         Uk9ECJs88C++RXhlWpFTQ5lirtdqJ7jqosBeOgZe0G6Y4T+3gdN7oBNyLZo8eFfZ15+X
         aX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=jHtAAPV03RmdslZrHKe+0O60obGhvacDcX0ABERk9Es=;
        b=X3F5styO1pGRyiOhXx3z51yayR/kN4Q4R1z1OUjV7UiVul/b7MfUqtYoIccnCRe/Vu
         k3xMZ8G/ir3632bF7KcKdY4GyqZqj05DlsmN/bvfLJcXrMxOTYqpFsdChzvCEWR9lTRk
         nT0YKNnZuhjtl09nrMXIoeOBFIx9A6/ILiV+Nukl36J7URyBcQQhPfvCw25xUrHuRS8+
         pefBC/FySNueRrUKnXKIaM6/QxR7NDtFbKSN9M9wYC6qrniwlW9I6LBisfz+irqvugIm
         tVozBWLwHB2crXQ2xHEGjWELN1iapW6EXh+QVmATu30YpA/zAbAtxz7Qttb3PRnieaUp
         Atow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Z7ebFUH1;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id o9-20020adfcf09000000b002bdc8566dcasi20176419wrj.977.2023.01.19.11.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 11:12:25 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Z7ebFUH1;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 00E6C5D20C;
	Thu, 19 Jan 2023 19:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674155545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHtAAPV03RmdslZrHKe+0O60obGhvacDcX0ABERk9Es=;
	b=Z7ebFUH1IBJFEZaYF/buHWF8vpUI6yAKOW3dTh2AmiLSLtVhH55i3taeXmGFDurFhOYq9E
	uRPPSWBIVZpQYQ6Iu33+3SLuvTnyhowJKZcUKsfo0REmuXrf7i36hnelSb97JdhBiCXcmy
	bsb+Ib4waX8WQIQ6cnSGgoR4TwcjyPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674155545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHtAAPV03RmdslZrHKe+0O60obGhvacDcX0ABERk9Es=;
	b=CZlm1H/XrsAsLOPS6ll+MtizsgEadZRX9hsaEey7UvwiifW6o9iHjjFLXXO4+r2X9B1s2r
	udXsw+YLYdFGhcDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8185F139ED;
	Thu, 19 Jan 2023 19:12:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7rjLEhiWyWP/NwAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 19:12:24 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v4 07/15] tests/qtest: Adjust qom-test to always set
 a -cpu option
In-Reply-To: <f014a262-1bb3-c08d-c0f0-ed3be8167789@linaro.org>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-8-farosas@suse.de>
 <f014a262-1bb3-c08d-c0f0-ed3be8167789@linaro.org>
Date: Thu, 19 Jan 2023 16:12:22 -0300
Message-ID: <87k01i49ux.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: 4zA/Abn1ka1k

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/19/23 03:54, Fabiano Rosas wrote:
>> Start using the qtest_get_machine_args function, which explicitly
>> sets the -cpu option according to the machine default.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/qtest/qom-test.c | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>> 
>> diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
>> index d380261f8f..462e3c4281 100644
>> --- a/tests/qtest/qom-test.c
>> +++ b/tests/qtest/qom-test.c
>> @@ -78,14 +78,28 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
>>       qobject_unref(response);
>>   }
>>   
>> +static const char *arch_get_cpu(const char *machine)
>> +{
>> +    const char *arch = qtest_get_arch();
>> +
>> +    if (g_str_equal(arch, "aarch64")) {
>> +        if (!strncmp(machine, "virt", 4)) {
>> +            return "cortex-a57";
>
> I'm not keen on hard-coding cortex-a57 instead of max, even if they happen to evaluate to 
> mostly the same thing currently for -accel qtest.

Ok.

> Nor am I keen on replicating this N times across N qtest files.
> Better perhaps in libqtest.c, or something?
> Or even directly in qtest_get_machine_args()?

Ah right, this was a callback in a previous version so there was no
"cpu" parameter to qtest_get_machine_args. Now I could indeed move
arch_get_cpu into libqtest.c somewhere.
