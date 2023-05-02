Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2300254ejm;
        Tue, 2 May 2023 09:23:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Io17p1IJaGKB6JyCxrjpumGge8GxX9qSOTwDv0dBqhjSY9n/K2+Ye7SLPzxVpJKdHv9u8
X-Received: by 2002:a5d:5503:0:b0:306:d43:4d8e with SMTP id b3-20020a5d5503000000b003060d434d8emr7280252wrv.29.1683044601152;
        Tue, 02 May 2023 09:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683044601; cv=none;
        d=google.com; s=arc-20160816;
        b=xd6FXxxpSMweVu2Fh9FIKzZD3dn1mmTBZUz8gBZLVBp29ZUm9WOScjmnMU3QyXadbD
         eVugxp6KbYpqEdeW02V+IQdkdpMI84YVZ463im03/xYugOGLGGW7e1BjHpt5uxgBE0GR
         3ZfcHC9/kxoOyO5LijrYiSVxudm06NIhuR0ku+7iZbn+ByhFEIyoH4SzCEcaL20F4K4O
         Pft1CXomHKgD/eu313sTzgUgzDX4yz7599bf3CNRn2xakAYOafQt/+5r+IpqCKrbAqMJ
         X52sbPEWiUT1IUcsC0nAd6pUHeTH7eupmWkGm3Z6XPleoCQPwDGxGDYIqIimFSgUpIBl
         e3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=aGKLtI/cLJ+Zqn1cPCcZAf9lDslZGy8u4GzHL5+Tegs=;
        b=GtImPiH96ezw3RePJOrEKmCFCW4NAWjuMOuVOX7aEzQaUfKZuHLa5zWvlzbXTOEA5J
         d+OV0gqrI3LmISGxqoQbk1+5RXmjS4HmjNt4TqOpSzDmePfBvgu+iKNp5v8ZHLTbYFbu
         KULSoOsepvNt8fYz0yshuqAchh8PV4orje8Q6z/ExBbTTMyadKaePDo/8CURi1Tb9TRu
         HYd/dOFfLfBHQeMbYNJUCvYUdMsrLxNy7f+9ypB648EVl4Yfihwr/Fs9aZFz4uUNVH2F
         2ADHksvqgBsxO8nHzg9wjVYsM8231OiAN/SkSOZxiTGLEd9/VHkCKA6wGbw+H3OJXQsV
         RsWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=e+gFImhW;
       dkim=neutral (no key) header.i=@suse.de header.b=GLz3JFTr;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id x12-20020a5d650c000000b00304a19a64b8si10197848wru.329.2023.05.02.09.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 09:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=e+gFImhW;
       dkim=neutral (no key) header.i=@suse.de header.b=GLz3JFTr;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6B6CE1FD71;
	Tue,  2 May 2023 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683044600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aGKLtI/cLJ+Zqn1cPCcZAf9lDslZGy8u4GzHL5+Tegs=;
	b=e+gFImhWX8pod0IuRSOz7UwHx2/li290jCUowAUI7W6ze8xhG617plS5KXOqfIWpVIYRlJ
	ptCyENILwCLyeYceBATl7tb7cnY4lxh0EGKOn88cdjHKtuGHB4Tv5QRTyZ52N1fMs5GuE8
	htVcbkRLwEsWoaP6KAy37EjSREr1E9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683044600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aGKLtI/cLJ+Zqn1cPCcZAf9lDslZGy8u4GzHL5+Tegs=;
	b=GLz3JFTr8LyvndMQhoNg+tejvheIaWT5I3oq+nHKZiK1qOaj3uheDUg9e29FpsrojfO44n
	9wnxcWj0Ef5tu3BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA770139C3;
	Tue,  2 May 2023 16:23:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ZAbrK/c4UWQMPwAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 02 May 2023 16:23:19 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v11 00/13] target/arm: Allow CONFIG_TCG=n builds
In-Reply-To: <CAFEAcA-7ci6PRYCOcrPZcGq8x+Wxtx6wwSk1C18cOO=dXOq8Dw@mail.gmail.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
 <CAFEAcA-s6P2Y5nNQMyACeK3+4cuSrFfqqEdFW-BDToy_YXj64g@mail.gmail.com>
 <CAFEAcA-7ci6PRYCOcrPZcGq8x+Wxtx6wwSk1C18cOO=dXOq8Dw@mail.gmail.com>
Date: Tue, 02 May 2023 13:23:17 -0300
Message-ID: <87o7n2itxm.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: NPPVYvqySHCt

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 2 May 2023 at 15:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 2 May 2023 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >
>> > On Wed, 26 Apr 2023 at 19:00, Fabiano Rosas <farosas@suse.de> wrote:
>> > >
>> > > Hi,
>> > >
>> > > Some minor changes:
>> > >
>> > > - new patch to move a test under CONFIG_TCG (broken on master);
>> > > - new patch to document the unsupported CPU test (Philippe);
>> > > - changed the test skip message when no KVM or TCG are present (Igor).
>> >
>> > Applied to target-arm.next; thanks for your persistence in
>> > working through the many versions of this patchset.
>>
>> Update: I had to drop "gitlab-ci: Check building KVM-only aarch64 target"
>> because it enables a CI job that fails on our aarch64 runner
>> (because it wants to run tests using KVM but that machine
>> isn't configured to allow the runner to use KVM).
>
> We fixed the runner config, but the CI still fails on that notcg
> job because it is trying to run tests that explicitly use
> '-accel tcg':
> https://gitlab.com/qemu-project/qemu/-/jobs/4212850809#L3595
>
> Something is weird here, because we built without TCG support
> on an aarch64 host but we still got qemu-system-i386
> and qemu-system-x86_64 binaries, which then don't work
> and cause the tests to fail...
>

Hmm, that's potentially due to Xen. Looks like we need more (!tcg &&
!kvm) checks. Let me try to reproduce it.
