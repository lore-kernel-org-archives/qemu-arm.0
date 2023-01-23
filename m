Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2971653ejc;
        Mon, 23 Jan 2023 06:37:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvRYGwOwWyqoRnw/FV69cExG0/z3hztLM/ww3IlDTVV9iwreMv94Ixpz57YW01LtztV3S/l
X-Received: by 2002:a05:600c:2d05:b0:3d0:85b5:33d3 with SMTP id x5-20020a05600c2d0500b003d085b533d3mr23165741wmf.16.1674484670010;
        Mon, 23 Jan 2023 06:37:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674484669; cv=none;
        d=google.com; s=arc-20160816;
        b=bM44eD/t7TZXjXTmUnkcQ8F0zqolQK9qT/sn+DsVGC41bxOWWfanS3zdZxyxo/QISz
         uYUKo25fB/bhewq1JgCrv5z8WdeoT7i16/DXAmN6vcZp5V5WUJbDlQV82D1fq6CfbbR3
         f4c6YYDvcM8yx8xOj/iNL3/3W599V0wPaWL00YaDfz/bYk4F5lt5Qy/eUQxAcMcOjyoB
         KVB8nfHe/+p+g15Ny8uAUm4nH9cLpsnc7Z4NgarGZcUK2YE62XsrPuEiFsAQSV+OsMX+
         1iHGnpuaElCAsh6jS4rAaAE3YJt8fYMdW5/lg7M1dDTzVPmza5kWjsMBdt2nIITyDbnG
         MigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=qRBfuVJOiA1LbWZ1vB6Nts7q9j6NIBs1DY5AgfpKRRc=;
        b=S6sZC2zaK89Cta+MlbAsE6YTN7gPa4YUOqlW1Yu6RL1JjhWo+2YJoCEjMNSniqZS8u
         Y00NEP6RY8lyffG30MxP3RC9wM7KogfVjUSYse8wn66Zz0typqkZeJY5sc7kCtMQalBT
         5zzESa5BeNojHO4sZBWlQ4m714RlNFuXhXRaaHUxdW/PqH8i94jwMDD0RruDoa1f9vDQ
         JyuG9q3IbRpqeNo7pRPUgKIGL5vPAo6xktzbsxewCtSyXaGt7lTJUZCe0dDeDmrE7vLC
         BQYNkD/OwDg0lMJ7M39grH8MscKTtGogWfNnqTcXrshUQMqeU6tUiu23FJ8qyt2Xz5GG
         sB9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=F5RcxJYe;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id c2-20020a05600c0a4200b003d0880e064fsi12972024wmq.182.2023.01.23.06.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 06:37:49 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=F5RcxJYe;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 56CE01F6E6;
	Mon, 23 Jan 2023 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674484669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRBfuVJOiA1LbWZ1vB6Nts7q9j6NIBs1DY5AgfpKRRc=;
	b=F5RcxJYepoqhM++iOxK8ftsiaIPSZThfeGVz08kQZu0J/1SFlyT4B3MxiFpqTcd4GG84AG
	rCqogvBpJiebnJl0VaxMDjbcNlIhfPdsrgQ5OMEHht8o9PpxE9o3l3rt0FqfFrv+zrMR+M
	Gdekpoh/7QqwLNrzDZX1LyhMOcS++FM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674484669;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRBfuVJOiA1LbWZ1vB6Nts7q9j6NIBs1DY5AgfpKRRc=;
	b=vYFA8kOrAZ15HYX96HxmK0ewrrWHR2nabmMhHogiXn5oyx014kF8PX0d6JjdCxNbKo1RFK
	R24jHBnwBkU9YcCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CEB07134F5;
	Mon, 23 Jan 2023 14:37:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9yHDJLybzmNoNwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 23 Jan 2023 14:37:48 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH v5 7/9] target/avocado: Pass parameters to migration
 test on aarch64
In-Reply-To: <65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org>
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-8-farosas@suse.de>
 <65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org>
Date: Mon, 23 Jan 2023 11:37:46 -0300
Message-ID: <874jshco5h.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BhVPGtqbhj5o

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 20/1/23 19:48, Fabiano Rosas wrote:
>> The migration tests are currently broken for an aarch64 host because
>> the tests pass no 'machine' and 'cpu' options on the QEMU command
>> line. Most other architectures define a default value in QEMU for
>> these options, but arm does not.
>
> There was some discussions around that in the past:
> https://lore.kernel.org/qemu-devel/20190621153806.13489-1-wainersm@redhat=
.com/
> https://lore.kernel.org/qemu-devel/CAFEAcA9NBu+L4wHfkLTv93wy90wjnV05EZ12P=
T6PmLjdZ5h_YA@mail.gmail.com/

There's more than one topic being discussed, specially in this last
thread, but here's my two cents.

About defaults: It's probably best to be explicit in tests. And if we
wanted, have a separate test to make sure the lack of an option still
does what it's expected, either outputting a message or behaving the
same as the explicit version.

About host architecture-specific tests: Unless we're talking about KVM,
I see no point. Having to change hosts to test agnostic features makes
no sense (the migration test is one example).

About generic tests: If a feature is required to behave the same for all
architectures/machines/cpus then sure. But most low level stuff would be
quite dependent on specifics.

>> Add these options to the test class in case the test is being executed
>> in an aarch64 host.
>
> I'm not sure what we are aiming to test here.
>
> Migration in general? If so, any random machine should work.
> By hardcoding the 'virt' machine, at least this test is reproducible.

Yeah, I cannot say for sure there isn't some machine property that gets
transferred during migration. It seemed more conservative to define a
specific one.

> I'd rather fix that generically as "if a test requires a default
> machine and the target doesn't provide any default, then SKIP the
> test". Then adding machine-specific tests. Can be done on top, so

I agree, but the only tests that should *require* a default are the ones
that test the command line parsing or adjacent features. We could always
test "-machine foo" and then separately test that the lack of a machine
option still gives the Foo machine.

The fact that we sometimes use defaults to be able to have the same-ish
command line for every case is more of a limitation of our testing
infrastructure in my opinion.
