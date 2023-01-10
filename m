Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3148529ejc;
        Tue, 10 Jan 2023 05:00:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt/Rj6tV6Zc/fh6GoKovnWH1PRZ2kD1mOWQAuNM9ZRkBu7RnrEIgzySDXgNxQXD7dkf2H0u
X-Received: by 2002:a05:600c:1e18:b0:3d2:5e4e:701 with SMTP id ay24-20020a05600c1e1800b003d25e4e0701mr49154335wmb.31.1673355618934;
        Tue, 10 Jan 2023 05:00:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673355618; cv=none;
        d=google.com; s=arc-20160816;
        b=ttQHVwyn/8xwFT6EDeqIoN+x9XPdNxwTNfMQcGdOKp3+4G20bnt9GIWqC02zSRMvLg
         ez1b4Pz8YG+eNzsqcA0UETJt6BJ+Wb7hZZ6ON8TNOIeXWfqkKmIc1zLjta0WU0/YMbOr
         irZ+8Dso0l8oYTmoHusUKu+LPt3gADvF+zwxem22kzmfKe/aZu5+IwlIk6hGRBaJKwD3
         f5sEzbCrmJmLIZDOm1b5l3sc7myrBTqEIxnQ66uLL5M9v8yVFS+1hBuAamsukuzGAqT8
         TDL3qMZDm+MR3w+LpPBpdlVnYiKKP0UQRLri3/sL6d0ouoK6I/a+0ZeJUktOTHLQwaCj
         NZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=0wRSUH2PSXvUbTygbwSnIuvFX97Te0qGmgqjD9pbYVE=;
        b=LglVJXCJ2KnfQhd8ZCMjD9vPJxEsVs1fwCyHakyyg1qAYCoNfGEiYCQfnflE9zNuXc
         jN/3jVAx18sgYvrAvkXIKJ+/laL24R5evj555gt3VE+fealC6KCdascclR0uRaLBIP37
         ke5eLjFU7lDRZzdYuPkwDIwXO3WDY7uy4c83b2wd8dnbDkMKHTGJcjXvqWP9hgBUgk8o
         28eT7nR+Jo5kzmr1/EFnp8g/ZrkDlx/lGHADoJ5ZQhdzIcm+2fYwzRoxa0bHjN8wAROc
         DzejxIwTE14vzLs7gWt/W86rlenni6KcY750/ISmMqI31jVdRRgFDx/Qs6kojfb7pPBI
         8JOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fRXdpu1T;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id z5-20020a05600c0a0500b003c6bc6818fdsi14855565wmp.14.2023.01.10.05.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 05:00:18 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fRXdpu1T;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2161275EC9;
	Tue, 10 Jan 2023 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673355618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0wRSUH2PSXvUbTygbwSnIuvFX97Te0qGmgqjD9pbYVE=;
	b=fRXdpu1TpFKZ7wpWhch2c9BMY5cuZr5N8/M6WI5N9IqUhbuBUKuKyboJiHe2fnun9xc9SS
	R4NndP/7kJ2qDeZ4gzSX4LQYUvvtcge25STszTyYMrBjlCMgcWavAw3Iv6HWkv+yAmhFoX
	/HIKT/TLvqYZHhEh/a/slNevWtND5XI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673355618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0wRSUH2PSXvUbTygbwSnIuvFX97Te0qGmgqjD9pbYVE=;
	b=5dKz0RbPhCApt7m6iOwcUNtIXX761hfxEqxqdXBIAM7VV3uvKA0O/+NHjr/ZU2kjJvJKyA
	/KlGEbKh5XGfCIAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A376713338;
	Tue, 10 Jan 2023 13:00:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ay5tG2FhvWM6LQAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 10 Jan 2023 13:00:17 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
In-Reply-To: <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com>
Date: Tue, 10 Jan 2023 10:00:15 -0300
Message-ID: <87zgaqa6jk.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: j+ibEfY7CoYx

Thomas Huth <thuth@redhat.com> writes:

> On 09/01/2023 23.42, Fabiano Rosas wrote:
>> From: Claudio Fontana <cfontana@suse.de>
>> 
>> on ARM we currently list and build all machines, even when
>> building KVM-only, without TCG.
>> 
>> Until we fix this (and we only list and build machines that are
>> compatible with KVM), only test specifically using the "virt"
>> machine in this case.
>
> Why don't you fix it immediately? ... 

My idea was to have in this series the minimum to unbreak the
--disable-tcg build and later bring the rest of the changes
incrementally.

(plus the cpregs code movement which conflicts with everything, so I'd
rather merge it sooner)

> it shouldn't be too hard to add some 
> "depends on TCG" statements to the machine entries in hw/arm/Kconfig, should it?

I havent't looked into it yet. If it turns out to be simple I can do it
now.

> Anyway, if that's not possible (yet), I suggest to add your hack to 
> qtest_cb_for_every_machine() instead, so you could change this in one 
> central place instead of adding a hack to each and every test that uses this 
> function.

Good idea.

>
>   Thomas
