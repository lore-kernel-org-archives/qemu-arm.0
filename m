Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp466290ejc;
        Fri, 13 Jan 2023 07:16:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuiGIIjjSzGsGbyeCVnCAEf0jMGWorY68h4VHR+0XJZ+hswQ7WUosTKjvxqw87wdsTkd88O
X-Received: by 2002:a5d:52cd:0:b0:241:f95f:eef8 with SMTP id r13-20020a5d52cd000000b00241f95feef8mr48975697wrv.11.1673622990304;
        Fri, 13 Jan 2023 07:16:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673622990; cv=none;
        d=google.com; s=arc-20160816;
        b=PAczm49OW3OVonkiBeojDj7smGZsd4BBW6wT5bNHvQzhP3wLCXuT3SNYGsYbmOvzX7
         WyE2h7eOXbsrBaw5t/h8A1FgXoqBzNttPUEWW09xwp1wkxT+bm1Jz5gBKG5WwbiEsng4
         oaQKyxtgwwhJ9hk1mMWzTHBkorppggHrPHmNktnVGnBTv+E7dfJF9DwtyHvIToKqHWGF
         7ZWPHAaam4193BA9X1vVNXDhiG9kTraKjcOEmfaeKi/namYQaWOj4xXQaU+9qmKTin6e
         WwRlLshLCsfGhv+BHFb9nYTREY7FaUKyCLI/R5Su+r/r+ThowqoTTbb7YSbAgrfnHY4Y
         4wKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=m0OHjKgIMktckgF3OHq8dy1ejkySu3Cxj6wan8Tsm1g=;
        b=NX6tw7hUdHV4TwhDytGfotzMgg3MA19QjLkiitE0EH3NkSmarEQ83GCjc08EQxXIy7
         x7LAk5QwqOvL/PGAo6P7jVMavkQGVnYr8lCP2ruYK+pCs0YkbgE8zd9s8xm5qoaLXybg
         BdANJoflur9itCQiaZZuufIbShoYCowDWKhXJOYz5TsRPwHCeuqeOfGdzaVPf8KjJydh
         I67EqNOkBtKkaq6jhVhFhlFBr7iRNHrxwdfpZp/lRBEOQyqSk18sQ5HiLKHuZBF9R0Sw
         sGVueZfIVzr/LeAoWDchewOxR1I+tY2oye5Falv1wHD8FeTTPQeiNB6+azrM1RnKY0T0
         i/XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="T+NLasW/";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id u16-20020adfdb90000000b002421edfc94esi16081704wri.711.2023.01.13.07.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 07:16:30 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="T+NLasW/";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 69159377DB;
	Fri, 13 Jan 2023 15:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673622989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m0OHjKgIMktckgF3OHq8dy1ejkySu3Cxj6wan8Tsm1g=;
	b=T+NLasW/0S9smKBxw5bFRYgovTvG6zhTot6rJHkDSd2aubyPZ4qH5YXGvxPie+aXgrVweP
	jyosZbnELxAr2EZQ4OCS4TPY+fEvmGOVUzPFYufl2LQSmKwKCrD9GOuWJyS8jD727MHiCf
	nUp/m2kyXse6xGlDiCp6cMn27a6ogqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673622989;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m0OHjKgIMktckgF3OHq8dy1ejkySu3Cxj6wan8Tsm1g=;
	b=2D2U/7HQ/Cx2AsS9hRxRfsAgPCjAnrrN+bcM7pP93HgooQzy6u3JjfAdWP7s1liviCRqww
	r+ydWsV13LbKO+AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E092413913;
	Fri, 13 Jan 2023 15:16:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 99nHKMx1wWMqMwAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 15:16:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG
 when CONFIG_TCG=n
In-Reply-To: <81895ce0-ce46-bdff-9865-0721dd4accf1@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-22-farosas@suse.de>
 <81895ce0-ce46-bdff-9865-0721dd4accf1@redhat.com>
Date: Fri, 13 Jan 2023 12:16:26 -0300
Message-ID: <878ri6ihx1.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: 7X5D1MERVmtN

Thomas Huth <thuth@redhat.com> writes:

> On 13/01/2023 15.04, Fabiano Rosas wrote:
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/qtest/arm-cpu-features.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>> 
>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
>> index 4be1415823..9a052e41fc 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -217,6 +217,15 @@ static void assert_bad_props(QTestState *qts, const char *cpu_type)
>>       qobject_unref(resp);
>>   }
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
>>   static uint64_t resp_get_sve_vls(QDict *resp)
>>   {
>>       QDict *props;
>> @@ -338,6 +347,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
>>   {
>>       QTestState *qts;
>>   
>> +    if (tcg_disabled()) {
>> +        g_test_skip("TCG support disabled in this build");
>> +        return;
>> +    }
>
> Could you please use qtest_has_accel("tcg") instead? ... that's what we use 
> in other spots in the qtests for checking for valid accelerators already.

Ah, that's much better, thanks!
