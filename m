Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2665155ejc;
        Tue, 17 Jan 2023 11:04:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuxWtpABrd7VxftXotGG5IRBlWEpeQMNBHBjRZ7Yr1iYtkrsTgQzae2JFj7veamx/WxrXyC
X-Received: by 2002:a5d:4c48:0:b0:2bd:c431:46d8 with SMTP id n8-20020a5d4c48000000b002bdc43146d8mr12932410wrt.49.1673982258466;
        Tue, 17 Jan 2023 11:04:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673982258; cv=none;
        d=google.com; s=arc-20160816;
        b=dJi7RPH69oLVdODNmwwHDrSB3HKVjm4391FxCyFWdhr8rFzzxLHvm29i2MFj1fMGS5
         OC/5ev3pb8TNgAAiA7mEAHc2V7uQMTFZ8mie0Fi2L/6EN/BB+1XsHwGeqrFvPWAnmR5A
         RkA7mJJK+V8io66PxIcl1GqnaaYrCB1Zs/40mvbNhRGR58ay0Z8J0XdnCLAecMeeryhC
         MTUiqnuseLgP/vW169W280UqUrm+CUvSYI3xFobFNnQL8l61dVlpp8Fthd9PKrcWZLUR
         sR1VfjwC6NjhRVTyOYO93Ix/9mkLn8gtptHaRXiRnbZsy5TaC/zYRocVtjpjCfWLtqhX
         I+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=igX/hAWhdeyLVUd1sjjff06FwLtEbMuD3RohQNs4foI=;
        b=pgHHQh/ilC6khM4OHre4eph/63Xsfk8xNeT/1VqDLZiEY1EWW+4sfdQNxpOiMUezWn
         /wusSKTBzMVXJRbHWiuS2B7ve7UNdIKMLp6gWNcFeJrVXzkbm0v2eZuIBvEwPC9AzHPu
         ZmOt0GS8Vp0bQHNqT4PG2Vm3epsKESurgWkPQNS+wfgRE9sBjFQM6aTjQSPhETMjdH/a
         9lrT1emtUmdRyzKuB/QFbOYZipCmyBkogEg0+TpzzMHbr7gzayb9bUny9+MfatTlAc2x
         8EZ4h9IrcGvYOq1VNER31G0tgTfhGQONTbazCnv0kNWUEaawg0ts06g+p7h2spQThofI
         URDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=h+zuAi8t;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id h3-20020adffd43000000b002365ce2019csi25421835wrs.185.2023.01.17.11.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 11:04:18 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=h+zuAi8t;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1A80322208;
	Tue, 17 Jan 2023 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673982258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igX/hAWhdeyLVUd1sjjff06FwLtEbMuD3RohQNs4foI=;
	b=h+zuAi8tveo1IXTAscMa97oEUrWEXz3h4K11huy211s5cvVZn9Jx5E6kMHXPj0X+xTV8Wc
	VEEV9r5kInhykWW5cHjyq9759zY95K59rJI4lIa/ErwtZLSl3vOjd8Aze++8/tHi0pcnK7
	kLHWntoMT6bVzgsxH59ugIITvidHvJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673982258;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igX/hAWhdeyLVUd1sjjff06FwLtEbMuD3RohQNs4foI=;
	b=ul2F2JydHyQcTKqxTlJZL6Z8FCU7IO/vc+nC7R9nmdkxZw5/0ctUN94ap6KLli6mJjjgJZ
	l7M+6+kdq/okDyBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E59D1390C;
	Tue, 17 Jan 2023 19:04:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8dAUGjHxxmOZOwAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 17 Jan 2023 19:04:17 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG
 when CONFIG_TCG=n
In-Reply-To: <87ilh58c5p.fsf@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-22-farosas@suse.de> <87ilh58c5p.fsf@redhat.com>
Date: Tue, 17 Jan 2023 16:04:15 -0300
Message-ID: <878ri10yq8.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: ePib9LlZ3hH4

Cornelia Huck <cohuck@redhat.com> writes:

> On Fri, Jan 13 2023, Fabiano Rosas <farosas@suse.de> wrote:
>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>  tests/qtest/arm-cpu-features.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
>> index 4be1415823..9a052e41fc 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -217,6 +217,15 @@ static void assert_bad_props(QTestState *qts, const char *cpu_type)
>>      qobject_unref(resp);
>>  }
>>  
>> +static bool tcg_disabled(void)
>> +{
>> +#ifndef CONFIG_TCG
>> +    return true;
>> +#else
>> +    return false;
>> +#endif
>> +}
>> +
>>  static uint64_t resp_get_sve_vls(QDict *resp)
>>  {
>>      QDict *props;
>> @@ -338,6 +347,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
>>  {
>>      QTestState *qts;
>>  
>> +    if (tcg_disabled()) {
>> +        g_test_skip("TCG support disabled in this build");
>> +        return;
>> +    }
>> +
>>      qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
>>  
>>      assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
>> @@ -373,6 +387,11 @@ static void sve_tests_sve_off(const void *data)
>>  {
>>      QTestState *qts;
>>  
>> +    if (tcg_disabled()) {
>> +        g_test_skip("TCG support is disabled in this build");
>> +        return;
>> +    }
>> +
>>      qts = qtest_init(MACHINE "-cpu max,sve=off");
>>  
>>      /* SVE is off, so the map should be empty. */
>
> I'm wondering whether the invocation of tcg and kvm test cases should be
> reorganized a bit. Currently, we have test cases that use MACHINE (tcg),
> and test cases that use MACHINE_KVM (kvm with a fallback to
> tcg). MACHINE_KVM is used either for aarch64 && kvm
> (test_query_cpu_model_expansion_kvm, which tests behaviour specific to
> kvm), or for aarch64 (sve_tests_sve_off_kvm, which tests behaviour that
> is the same for both kvm and tcg, and therefore tests tcg twice if kvm
> is not available.)
>
> So, should we
> - drop "-accel tcg" from MACHINE_KVM,
> - call sve_tests_sve_off_kvm only if kvm is available, and
> - call the functions you skip here conditionally on tcg being available
>   instead? (not sure whether not calling should be preferred to skipping
>   in general)

I did the last two already for the next version. Good point on dropping
"-accel tcg", I'll do that as well.
