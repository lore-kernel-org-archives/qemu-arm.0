Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp883459ejb;
        Wed, 1 Feb 2023 12:54:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/hNbYULYI42leEZHxg4NgJ9s4gAVDKhUmvSzGNafJZ3Edi3RJ5/TJBWrRQkTom9BOXUn8F
X-Received: by 2002:a0c:cdc3:0:b0:537:7181:c903 with SMTP id a3-20020a0ccdc3000000b005377181c903mr5468402qvn.34.1675284854174;
        Wed, 01 Feb 2023 12:54:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675284854; cv=none;
        d=google.com; s=arc-20160816;
        b=tBN7Q8pYt5nxVyVEByZY7PJupiUTOJIY1DOHFG5yVvuREdBKU0/PGlXElQuvq+B40X
         XYO+nszm9ljuuUgdB4U8SfnG3ut92U17GhC57D8X3jFo2LfMId0eIrlrYcZDK3Qc+hbU
         ESwIVQKNeLwSrbY/PqI+c9zEUY1Zzq7xhv5d/8GWD2PXS2iH0jKqUVGFSPBsr7J2cLqa
         irmCQFd3QTJPDzGH1ecVdBJ3PvRGzbg80dxTmzVA8v51i+zKVehsIq3qa0e8vlNbrIwf
         r49vh0ShEAudWbH4NfRPYlLRMkTboM3GDDoceI9sXqwxIq7iZg4AFgr/YjYyw+7svUs2
         uWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=asirKvU1d0A46Bv7Y1H5lbdLU1hrEfVIVFUwdDgBVsc=;
        b=uKkUwBg9C5+kYoUdiclLqEuuN/4hFnwIT6LWCSbza4LgEmOKX2psiOtWFzRci42rew
         9ZrDM+Ha1etarKUMJTwKtdyxpFiGXu5xCII6RYrX0Pp7dGQ4wDQ+AIC8VtWNltKo+z7a
         EUGdj7dfsyqgPN/7qz6vpyQdZB9K6glLHbG+Z/YRN15bPYXGfve1uT2atEpqoWFkTz4r
         NA6HV4rk4ntD1hKPgjKte20sGXfCLUMmzVRtUyCiKGxDVfUPhPMflXIyKsxT+KuOzYxL
         uPLZtdvEh8EXxfx4H8P+MK+e9T1aJTAcpeBf2zphaGj6JHBFwTbMOE83I9ychPGfeLr2
         hixw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TcZLucyr;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g5-20020a0562140ac500b00554f9b0e18bsi1703663qvi.182.2023.02.01.12.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 12:54:14 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TcZLucyr;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675284853;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asirKvU1d0A46Bv7Y1H5lbdLU1hrEfVIVFUwdDgBVsc=;
	b=TcZLucyrFAPHbgA+unpWjPE4y2LjTBV59rQ6OEtuIOpF0c0bvvjJDtAMkFO+78KF0awxPI
	vWJ4lwYhOeW3fzSTf/Ho/81GXimYSxx7UvDu5CabXZJw4u1NKg93Vk/Pt4s+mQVDjl7S+V
	B0xIcsEztn+2tjCzkhXAeY87BjmW3k4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-SS_xZRgvPLeq3r3Oyr-BsA-1; Wed, 01 Feb 2023 15:54:10 -0500
X-MC-Unique: SS_xZRgvPLeq3r3Oyr-BsA-1
Received: by mail-wm1-f70.google.com with SMTP id e38-20020a05600c4ba600b003dc434dabbdso1700108wmp.6
        for <alex.bennee@linaro.org>; Wed, 01 Feb 2023 12:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asirKvU1d0A46Bv7Y1H5lbdLU1hrEfVIVFUwdDgBVsc=;
        b=i8TmtMk51STpm7aoiULWcUC4swUsmq13xjI0bos9eLt0bDKwSddDjjnLCrVcB2af0/
         lKbkMGo5J5g8M8YOB84LEubweQ4BO1Lr0lRo4mqdv/q3o6f+GNvjsguTWhf1T2iYJeHd
         qCa9493j2hZtJb8D0MF/fGtie1CdRzlRl93BSWrAAy3TSrZMnzy9j5M8gUtlxAlgkVEa
         KXPshU6bN2DKGBHlSqc7H3zx5APyLctENCX8aVbXGcuXZ+75w2ANLnU3+TtYFHBaZ9s2
         vVGHRvZ84Og0Gu5nHUb6JiKISC9kR4uTf3Q7aSasEJ2TwRADvixbn5z9fncbDst0QYmB
         JZ6g==
X-Gm-Message-State: AO0yUKWsB1G64OimSkuoPavwuYioA1Gs9tKLAD7JPVNH9iueKVnwSWdZ
	VeOJfc+6j8Nlpv59ORQJ5Y4TSm8fC70E8sGSlLge51UzlbROxGTt9ZuwrguOTSZ0jRrAHXDabcN
	eUcjSVdBihzYAuDUe
X-Received: by 2002:adf:f947:0:b0:2c3:bc2e:757f with SMTP id q7-20020adff947000000b002c3bc2e757fmr1373337wrr.31.1675284849593;
        Wed, 01 Feb 2023 12:54:09 -0800 (PST)
X-Received: by 2002:adf:f947:0:b0:2c3:bc2e:757f with SMTP id q7-20020adff947000000b002c3bc2e757fmr1373319wrr.31.1675284849369;
        Wed, 01 Feb 2023 12:54:09 -0800 (PST)
Return-Path: <quintela@redhat.com>
Received: from redhat.com ([46.136.252.173])
        by smtp.gmail.com with ESMTPSA id d3-20020adffbc3000000b002bdd155ca4dsm18170700wrs.48.2023.02.01.12.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 12:54:08 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>,  qemu-devel@nongnu.org,  "Dr. David
 Alan Gilbert (git)" <dgilbert@redhat.com>,  qemu-arm@nongnu.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
  Paolo Bonzini <pbonzini@redhat.com>,  Claudio Fontana <cfontana@suse.de>,
  Eduardo Habkost <ehabkost@redhat.com>,  Alexander Graf <agraf@csgraf.de>,
  Cornelia Huck <cohuck@redhat.com>,  Cleber Rosa <crosa@redhat.com>,
  Wainer dos Santos Moschetta <wainersm@redhat.com>,  Beraldo Leal
 <bleal@redhat.com>
Subject: Re: [RFC PATCH v5 7/9] target/avocado: Pass parameters to migration
 test on aarch64
In-Reply-To: <3f577967-377f-aa6d-1c69-542988a26a26@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 23 Jan 2023 16:29:37
 +0100")
References: <20230120184825.31626-1-farosas@suse.de>
	<20230120184825.31626-8-farosas@suse.de>
	<65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org>
	<874jshco5h.fsf@suse.de>
	<3f577967-377f-aa6d-1c69-542988a26a26@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 01 Feb 2023 21:54:08 +0100
Message-ID: <878rhhumxb.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lVa6mfNeVqq2

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
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
>> There's more than one topic being discussed, specially in this last
>> thread, but here's my two cents.
>> About defaults: It's probably best to be explicit in tests. And if
>> we
>> wanted, have a separate test to make sure the lack of an option still
>> does what it's expected, either outputting a message or behaving the
>> same as the explicit version.
>> About host architecture-specific tests: Unless we're talking about
>> KVM,
>> I see no point. Having to change hosts to test agnostic features makes
>> no sense (the migration test is one example).
>> About generic tests: If a feature is required to behave the same for
>> all
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
>> Yeah, I cannot say for sure there isn't some machine property that
>> gets
>> transferred during migration. It seemed more conservative to define a
>> specific one.
>
> Why did you choose 'virt' and not 'xlnx-versal-virt' or 'sbsa-ref'?
>
> What does this test require? Any machine running KVM?
>
> Adding Juan and David for migration since I'm still confused trying
> to understand what we are trying to test here...

No clue really from my side either.

ARM machine types are a mystery.  But on one hand:
- arm is a sane architecture when there is no default machine
  learn x86, learn.
- I don't know either which one to use.

Later, Juan.

>>> I'd rather fix that generically as "if a test requires a default
>>> machine and the target doesn't provide any default, then SKIP the
>>> test". Then adding machine-specific tests. Can be done on top, so
>> I agree, but the only tests that should *require* a default are the
>> ones
>> that test the command line parsing or adjacent features. We could always
>> test "-machine foo" and then separately test that the lack of a machine
>> option still gives the Foo machine.
>> The fact that we sometimes use defaults to be able to have the
>> same-ish
>> command line for every case is more of a limitation of our testing
>> infrastructure in my opinion.
