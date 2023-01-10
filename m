Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3175426ejc;
        Tue, 10 Jan 2023 05:36:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs0ggGq72Ym7mgND9sAezWuu6Qmjzt4AlQb4l+vFlNStx0STS1/wZQNr60ZO2wvMnThP4ZT
X-Received: by 2002:a05:600c:a4d:b0:3cf:6e78:e2ca with SMTP id c13-20020a05600c0a4d00b003cf6e78e2camr52996963wmq.5.1673357817843;
        Tue, 10 Jan 2023 05:36:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673357817; cv=none;
        d=google.com; s=arc-20160816;
        b=gGYc7jH8LVZ9gXsflGJL9uuzKLpAgV3Ms5x9NS1Fd8o1S/bi4YtKa3r48QrkEu51cv
         F+hMw542Y5tgL1iVQ3D1rf3Ihy2EZeLWeyaW8Bb+LeHNnS5+mBYO6dviw8Zpq25V6rIZ
         Rw9EnJMHczsskS2LIpCvPwhZanV4Qd5pkGp3/cRujiTb//jJhtWGzdIIyOX03T1UelvX
         PFvkqMXDi3/JGvTZRIGAOxQC8ZocbUIFfEOVMLLDWjr4qDbVnEhP9MXBlkFxlqbCLnMh
         PtF1UKLJ406KKqTLyypt30XwlW6aFvLIS9rzEh2V66lpX9jaq9qgwHaHHlTvGpQFw/1Q
         4pvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=2FZoGBZyY5QIjarJEBtrX/c/I4Z/CXUzrjP9bsG5GHk=;
        b=XUkv3m9Z7CNrcng4eLkAC0vEhc1Vi+Ky8WMISAroTiPLaLoM/0BjnQHFFDCTtmVUgU
         ESsGuGuWACidFGsOKnFCJ64yPWZrMHAiuJmIq87+exbl54NL3Cc4/OwABi39DQsqiKL/
         oqBJ3Bv2taqHbgBxIjVN/lKf9+2X/cLf9A9aWEVLCON1g2aTeeXzd7K9JMdB4Eb3Y32j
         U9XtDOeiQityukdKjCcaVlsACfw/Xa8nn5nh6WLUb8RW6QXOyEvI7zWLGG6N61HHMrE6
         eHUoKlFYSRPNHuWMSvXuX5oFtC4VBj6hZgkwDp8/h70dKNH3miL5sYXosofizyDODK/I
         ZcnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="SZk7/KsD";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id a1-20020a05600c224100b003d1b4d957b0si8742320wmm.162.2023.01.10.05.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 05:36:57 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="SZk7/KsD";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 03F2676198;
	Tue, 10 Jan 2023 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673357816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2FZoGBZyY5QIjarJEBtrX/c/I4Z/CXUzrjP9bsG5GHk=;
	b=SZk7/KsDO9G89/jCCVRArO5jrcBpv5dfuHA3dD0u3FbJbC6p5EoUYUMztW/rm/dhXZgWc7
	Y7hFr+9X6w3ExLd4aEm1lTTMpXIi3B5BZaaRieLRsgWj1/ICPyKSNRG36F+1vIgDmiSytk
	7cIabZm7CrW7gN1hWwJy9RaqWDo7X4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673357816;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2FZoGBZyY5QIjarJEBtrX/c/I4Z/CXUzrjP9bsG5GHk=;
	b=xT6pQVAkcKbSsPLhW2MZ/sIc/de5V+2DOiaJP8hdJPm0nfh3WzOxFHvuqGGBGunTIZTobS
	Bwk81jEIbf6ioTDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76F5313338;
	Tue, 10 Jan 2023 13:36:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8UrnD/dpvWNCQQAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 10 Jan 2023 13:36:55 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
In-Reply-To: <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
Date: Tue, 10 Jan 2023 10:36:52 -0300
Message-ID: <87sfgia4uj.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: RQItW1DDF2Dq

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Thomas Huth <thuth@redhat.com> writes:
>>
>> > On 09/01/2023 23.42, Fabiano Rosas wrote:
>> >> From: Claudio Fontana <cfontana@suse.de>
>> >>
>> >> on ARM we currently list and build all machines, even when
>> >> building KVM-only, without TCG.
>> >>
>> >> Until we fix this (and we only list and build machines that are
>> >> compatible with KVM), only test specifically using the "virt"
>> >> machine in this case.
>> >
>> > Why don't you fix it immediately? ...
>>
>> My idea was to have in this series the minimum to unbreak the
>> --disable-tcg build and later bring the rest of the changes
>> incrementally.
>
> This test is basically checking "all the machines should
> work". That's an important invariant to maintain, so
> I don't think we should just skip it for Arm targets.

But what does "all machines" mean in a no-TCG build? The original intent
of the patch was that only 'virt' should be present and therefore the
only one tested.

>
> -- PMM
