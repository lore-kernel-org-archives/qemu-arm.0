Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1115680ejm;
        Fri, 28 Apr 2023 06:43:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7obdIY+aAc3ojPJMvw4gr9ETSch77k+SKz+fPLMXR2Y1tAxwHbGVQSh21YTyFHfY2RCSoq
X-Received: by 2002:a5d:480e:0:b0:2ff:7311:6e74 with SMTP id l14-20020a5d480e000000b002ff73116e74mr3740864wrq.26.1682689420347;
        Fri, 28 Apr 2023 06:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682689420; cv=none;
        d=google.com; s=arc-20160816;
        b=yC4CPQ6x5hPJjcBhq8ie7g7uE/DARmB0NJLlrANmWEFy49Mtu1cdZBrEli14ow5Rhg
         E2QYN897yrU+CTNjhPkCSGnQfcYCSW2ic7N/1Cxv++YU1cT5PtkNPBmTOty4ghvz3K/x
         t+oAtel9ZRpfc/pfI8lYZxjUgUOphiSR9m89Y8MbSOnhoNv8VmQ0vDwTM4Z3a8Neqdxi
         pgUOVLyutgC8wcuT4dwRGIj8VwIYpC/4VD7JLIBLsYIqrtBwX5evqoNUnZXYhzEBw0t5
         OsJir42yTVn2KHZq/IbKMzE/a9Tla3oSdO3uOCwnxY3imJO4gbrViob1+dDn5+9oUF2n
         Z4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=lvPWgPBFJ+0zKZL4p6jUAkjCoB7MhfushykW1zp+gBw=;
        b=reyKemGW1jjzk7iYEBZY6p/pO8rXaINRyxFdVE5nHnqxloU+2pcsiSLTbNSqn5rMxT
         nlYcXiitLtQgUL1k1MmudGLE/illXFHU4upa594bMs3FgbJsbHp25I5SyPm5YfIrXe5M
         EfwVHpBGBQtp0JLKHz1++teEHOC2FrbvUwV/M1lCGM25ihWFLnU5JGzPXuLBaDjjE0Iq
         aGyULLzFI9X5v3R5URsAjOX1/lEo89SLNxJAYanb/cmk6QX+qrwXV6J0IPDUdKDZnqyu
         W5qyMZi25bQZg/WTyRozI2l7LvetpluvMw0thddQ2u/FPaWM8alr2MHtj41RO1NDWLO3
         PIvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=mKStukRW;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id a17-20020adff7d1000000b002ef0a3b44d0si12813603wrq.570.2023.04.28.06.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 06:43:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=mKStukRW;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A5AFF21F92;
	Fri, 28 Apr 2023 13:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682689419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvPWgPBFJ+0zKZL4p6jUAkjCoB7MhfushykW1zp+gBw=;
	b=mKStukRW/PEHXwbL6BZWMwXbui2BFlWwIwycfBmbvxgKCz9aJO1d/5DjQmNFs1DL3pQoVo
	OXBOXpLRvRhx3FwegmOMgrXI6l206i981iFgDEa1n1OWKLdtjHC6HhJSVG1OXlplYGDFdM
	eQRb+n0164sYUk37h+dnltPssX71mVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682689419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvPWgPBFJ+0zKZL4p6jUAkjCoB7MhfushykW1zp+gBw=;
	b=NLkhjd+rL5kipaaSXTfiWHnR+RP6yp7HnsJihM+v3FVKUf4QO40rHs2ybep3AK5PqAlvio
	kweWcMNeiMDvI3AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2ED3E138FA;
	Fri, 28 Apr 2023 13:43:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id u3dFOorNS2QVJQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 28 Apr 2023 13:43:38 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
In-Reply-To: <fa2ae98d-4113-b204-7e12-9490b5765b4d@linaro.org>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-7-farosas@suse.de>
 <c2853e95-2aec-246a-5846-d91d40329c61@linaro.org> <87a5ytpirj.fsf@suse.de>
 <fa2ae98d-4113-b204-7e12-9490b5765b4d@linaro.org>
Date: Fri, 28 Apr 2023 10:43:36 -0300
Message-ID: <87wn1wruk7.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BwFL2rFWw0kO

Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/27/23 14:16, Fabiano Rosas wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> On 4/26/23 19:00, Fabiano Rosas wrote:
>>>> We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
>>>> query-cpu-model-expansion test to check against the cortex-a7, which
>>>> is already under CONFIG_TCG. That allows the next patch to contain
>>>> only code movement.
>>>>
>>>> While here add comments clarifying what we're testing.
>>>>
>>>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>>>> Suggested-by: Philippe Mathieu-Daud=C3=A9<philmd@linaro.org>
>>>> ---
>>>>    tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
>>>>    1 file changed, 17 insertions(+), 3 deletions(-)
>>>
>>> I don't see why you're changing the cpu model here.
>>> Neither cpu will work, of course, but why change?
>>>
>>=20
>> Because there's already a patch in master that puts the cortex-a7 under
>> CONFIG_TCG, so I can have the whole if/else in this patch.
>>=20
>> If I keep the cortex-a15, this change needs to go into the next patch
>> ("move cpu_tcg to tcg/cpu32.c") which moves the rest of the 32bit cpus,
>> which was supposed to be only code movement.
>
> Well, I still think the change to a7 is wrong.
> If the two patches need to be merged to break bisection,
> then so be it -- just mention that fact in the commit message.
>

I don't get why it would be wrong. The test just needs any cpu model
that triggers the message at qmp_query_cpu_model_expansion.
