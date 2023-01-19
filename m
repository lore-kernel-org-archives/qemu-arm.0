Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp376363ejc;
        Thu, 19 Jan 2023 06:39:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsN6CgsdzW0HchxP6zoJRnA0Zt8MzMQl82+FUGkcUaqoVv8S9dLE6l15I5tnec5L3oaZLys
X-Received: by 2002:a17:907:84ca:b0:82b:61db:92b8 with SMTP id oh10-20020a17090784ca00b0082b61db92b8mr10738231ejc.57.1674139154150;
        Thu, 19 Jan 2023 06:39:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674139154; cv=none;
        d=google.com; s=arc-20160816;
        b=gO5CBWLMC4PNv09aLCHqEIyMCPTBy2Vc4znHcnx5S6xmYjW3YdGmMYrDa7VvfaGXd8
         elaGM499C6g/sYoCl7VKcBNGDc1lJ54g8Qy54G62qNk/hpZEn/T1BKCo8NPbQqvvB8ZN
         dL0gkZ9qmmI5nIv3ySgDC/+beBOjBQNQ8QI0l8gKAEYM23lvs7m3k+4EGdyCdEcrguV7
         +8slWtZdG6OZt3AoSd1nmZRzgb4OPW8lIMQ2AB0jD+5whHUKC1CffQ/dkRBbxOQDbUpq
         IV4TymZK0eO6tbd/+hbkncbSLiZbfr7G1kg23SFzaCIwStjn0pkVezmZGEZuexCwE09j
         hGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=1GIvdkOTXlKxnBEquwvZZPXfR47HKfI3DYtRrAbRCYM=;
        b=LLgbVPchePabW/0GEdv53nuFtPez2Ld7zUCG5Ey7/SbWZAArID3LOk9pblljFWMM+o
         L2yUb2D+n31fO90GuczuB2kaKwlXaRm93YD91OOtPexS3cmLzoqjYv9tNdTp1jnn6Wjc
         oxsM/B+rWLA3Oh6BmkP3xYHz4WLnc693mkb8DOC/usXm7aOk8fNZdcJUs7DT6sOw/6FI
         ml4AGUqSuTkY2QQKKN6jo90q1cXHvHzWjiyzdE5apkn4iUUWHIxSF5RrRgjyTYpOL6HT
         WaINAwdP7uyrx6jDQuG3FjPyY1CAFsuc0AVa8sPHDAag07d1lnIPYna+Wk7DQQGOzb67
         5u7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=F9367bnD;
       dkim=neutral (no key) header.i=@suse.de header.b=sszIGyUm;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id sc3-20020a1709078a0300b0087769779d12si3435563ejc.820.2023.01.19.06.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:39:14 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=F9367bnD;
       dkim=neutral (no key) header.i=@suse.de header.b=sszIGyUm;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 510C821E4F;
	Thu, 19 Jan 2023 14:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674139153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1GIvdkOTXlKxnBEquwvZZPXfR47HKfI3DYtRrAbRCYM=;
	b=F9367bnDVeSOcwzNOEyd6I4pZuhVHRlnf5SCvmQEAjWIYUOWC1HH3YTw1NmnUh/KvOu4gF
	8TYbIOSkx50D2fE7ODRnR7/l5LHR96x8+rzXy017/M+51Zrj5XDVqF2LaXyeOm9wWr9AIl
	iVBOqPNrv51vLZTEeAcFvt8YiBZx3G0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674139153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1GIvdkOTXlKxnBEquwvZZPXfR47HKfI3DYtRrAbRCYM=;
	b=sszIGyUmZUwgrmWPA+mzBTQyMqwU6KrhDqSGH93qMwyUkR17HyF89FDUHtZX2TJitna3rn
	ihEgUsG1BMhPmuCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3B27139ED;
	Thu, 19 Jan 2023 14:39:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id vQUBJxBWyWOKLAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 14:39:12 +0000
From: Fabiano Rosas <farosas@suse.de>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v4 08/15] tests/qtest: Adjust test-hmp to always
 pass -cpu option
In-Reply-To: <Y8lOeRqfcAUljaJN@work-vm>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-9-farosas@suse.de> <Y8lOeRqfcAUljaJN@work-vm>
Date: Thu, 19 Jan 2023 11:39:10 -0300
Message-ID: <874jsm1tdd.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: kNcXCZ8KQiUu

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Fabiano Rosas (farosas@suse.de) wrote:
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>  tests/qtest/test-hmp.c | 34 +++++++++++++++++++++++++++++++---
>>  1 file changed, 31 insertions(+), 3 deletions(-)
>> 
>> diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
>> index f8b22abe4c..c367612d4a 100644
>> --- a/tests/qtest/test-hmp.c
>> +++ b/tests/qtest/test-hmp.c
>> @@ -121,21 +121,49 @@ static void test_info_commands(QTestState *qts)
>>      g_free(info_buf);
>>  }
>>  
>> +static const char *arch_get_cpu(const char *machine)
>> +{
>> +    const char *arch = qtest_get_arch();
>> +
>> +    if (g_str_equal(arch, "aarch64")) {
>> +        if (!strncmp(machine, "virt", 4)) {
>> +            return "cortex-a57";
>
> Won't that break on a kvm host on a different CPU?
> Would -cpu max   work on everything?

These tests run with -accel qtest only. No TCG or KVM. So this won't
break a KVM host with a different CPU. But we also cannot expect that
cpu to do anything useful. This is more to avoid initial configuration
code to break due to lack of cpu.

About -cpu max, before this series, it works because of a nuance of the
code which does:

aarch64_max_initfn:
if kvm || hvf
    host
else
    cortex-a57
    extra_features that depend on TCG

After this series this becomes roughly (see patch 01):

aarch64_max_initfn:
if kvm || hvf
    host
else if qtest
    cortex-a57
#ifdef CONFIG_TCG    
else if tcg
    cortex-a57
    extra_features that depend on TCG
#endif

The above routine causes us to have two different -cpu max depending on
whether TCG is built in or not, so I'm basically bypassing it and
hardcoding cortex-a57 to be consistent.
