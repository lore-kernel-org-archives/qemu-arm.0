Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3085960ejc;
        Mon, 23 Jan 2023 09:26:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtnPoVX/JpWy5mJoze+vHvkd6AjgNRhIYbKC5CG4kaMntOeSY4GmNNNWAu72g+5zzjcZWOl
X-Received: by 2002:a17:907:8196:b0:7c1:6fd3:1efa with SMTP id iy22-20020a170907819600b007c16fd31efamr33161839ejc.28.1674494797773;
        Mon, 23 Jan 2023 09:26:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674494797; cv=none;
        d=google.com; s=arc-20160816;
        b=tcQ/2btvP29iJEj+VFCNFezbdsoTc4/E0o1yCvC4KZC8HU+ZifwZRDNfK1K0UABXXk
         EexdNj7sqbkufe+F2J+IsRPzFz4g++RSFohnXiINS/eLhU8HZmnGIwc+qmU3yzjtev1e
         iwXiFo3aPFTZJKLZQCNUMIMLPNcyXgSN2Y6O/ht5/UrAdy5ZBnyW/ve0NPvIgX9DI8Fg
         aLy1hnWYuNYL4QN/qOZo9CQWwnlkU18phgFDSaX0tK6pepuKMyL0J6GKovdMl9mCbOw1
         qZr01j1+mcUKXQdrR2c1U4cZDAcTtk5xtD46znW+v6PUhyHDQogHbrvha4vv+MEsRu1I
         PIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Y4yc6+xONXZhHsHwmC58I+3SIqrE99U/Wlxon/l7SBw=;
        b=CHtiwKE6pDjNYVW2gDlCj8DVnE22J6emSYJwNRVCWZDNMS5swJJ78/pUwZ1wE6EXPJ
         QNa6Z4XDsdyOH2VdcpPDMOFt8vLjIkMTttNLjOoxi+nVHkqCMxbQJgte4LOhAgHyYBq0
         NryYP5K9RNdBWvKO6MZPgzgxWMaBgnUbmAPDick1KtFXo7T3DuIBJf8dYWpwz6nQxV7a
         tcgM2fFVIR1pYvr5jk3FGa8ucG40YkWh4ihOkdfjdcgKjlOVsWx1+MfZehFKYiPufP4O
         PNC3QdU9p+gGc/fv4BoG3gBiWevvaxxGvzFV2mXiLWB9bbg8qDG3ByEldwX/1tBlrhKa
         G51Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=k4+PJbZ0;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=5HQIIWoa;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id i2-20020a05640242c200b0049e18d9674asi28972161edc.359.2023.01.23.09.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 09:26:37 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=k4+PJbZ0;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=5HQIIWoa;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F1751F385;
	Mon, 23 Jan 2023 17:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674494797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4yc6+xONXZhHsHwmC58I+3SIqrE99U/Wlxon/l7SBw=;
	b=k4+PJbZ0UFwwreCWSuHMkh3n70Bx+CIHKkLsIAbbzmztzhzf4lqJ8utOhFv9SB9B0KYB0h
	Aqs3UeGWBfDaQ6MA+kRRjHdv7zItVYRKHEfzN3WVgIgtldllDM569NCv1WnIFW2hqLBAUS
	oFhroRz90NcviajhENS+aWUYHglZwp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674494797;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4yc6+xONXZhHsHwmC58I+3SIqrE99U/Wlxon/l7SBw=;
	b=5HQIIWoaWQMlqDSr0InH/N86Ds4j7IUP4zqKmo7+v8Sgym0udJiY/pHQfwfP+d7GPB3r57
	aOZVnYh2iyQs0PAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97AF31357F;
	Mon, 23 Jan 2023 17:26:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id PyQ0GEzDzmOeGgAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 23 Jan 2023 17:26:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert (git)"
 <dgilbert@redhat.com>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH v5 7/9] target/avocado: Pass parameters to migration
 test on aarch64
In-Reply-To: <3f577967-377f-aa6d-1c69-542988a26a26@linaro.org>
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-8-farosas@suse.de>
 <65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org> <874jshco5h.fsf@suse.de>
 <3f577967-377f-aa6d-1c69-542988a26a26@linaro.org>
Date: Mon, 23 Jan 2023 14:26:34 -0300
Message-ID: <87r0vlxiut.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6bNg9RTBFnSr

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 23/1/23 15:37, Fabiano Rosas wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> On 20/1/23 19:48, Fabiano Rosas wrote:
>>>> The migration tests are currently broken for an aarch64 host because
>>>> the tests pass no 'machine' and 'cpu' options on the QEMU command
>>>> line. Most other architectures define a default value in QEMU for
>>>> these options, but arm does not.
>>>
>>> There was some discussions around that in the past:
>>> https://lore.kernel.org/qemu-devel/20190621153806.13489-1-wainersm@redh=
at.com/
>>> https://lore.kernel.org/qemu-devel/CAFEAcA9NBu+L4wHfkLTv93wy90wjnV05EZ1=
2PT6PmLjdZ5h_YA@mail.gmail.com/
>>=20
>> There's more than one topic being discussed, specially in this last
>> thread, but here's my two cents.
>>=20
>> About defaults: It's probably best to be explicit in tests. And if we
>> wanted, have a separate test to make sure the lack of an option still
>> does what it's expected, either outputting a message or behaving the
>> same as the explicit version.
>>=20
>> About host architecture-specific tests: Unless we're talking about KVM,
>> I see no point. Having to change hosts to test agnostic features makes
>> no sense (the migration test is one example).
>>=20
>> About generic tests: If a feature is required to behave the same for all
>> architectures/machines/cpus then sure. But most low level stuff would be
>> quite dependent on specifics.
>>=20
>>>> Add these options to the test class in case the test is being executed
>>>> in an aarch64 host.
>>>
>>> I'm not sure what we are aiming to test here.
>>>
>>> Migration in general? If so, any random machine should work.
>>> By hardcoding the 'virt' machine, at least this test is reproducible.
>>=20
>> Yeah, I cannot say for sure there isn't some machine property that gets
>> transferred during migration. It seemed more conservative to define a
>> specific one.
>
> Why did you choose 'virt' and not 'xlnx-versal-virt' or 'sbsa-ref'?

It is the only one guaranteed to be present with both TCG and KVM.
