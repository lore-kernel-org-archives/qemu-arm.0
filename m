Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1905379ejc;
        Fri, 10 Mar 2023 05:28:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+p6Rba6+59O9gmmoM6ArUy2x+zagDgTNhh0lxdfxDvDcW1J5TTcIOULPJPx9bVXO2PFbQU
X-Received: by 2002:a05:600c:5493:b0:3eb:39e7:3607 with SMTP id iv19-20020a05600c549300b003eb39e73607mr2808340wmb.4.1678454932621;
        Fri, 10 Mar 2023 05:28:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678454932; cv=none;
        d=google.com; s=arc-20160816;
        b=d52+8PtH/w9nuoQ3vJWxlRCTuhnvZoSYoMlxbC0sI50vU4+N5OIic46ZrIRJ7d0iS3
         vEQq3a9iqyIEQdWeujRmesghfGopcYCWHxsAbiGFY0HNqfJ1hiT9hYyq6gBOO54/beRX
         gNcZQLbsJpEtR2CLHbBxQ4H1eB/gJwreklW7niOXhyzTh8ZLsk9kkGsqh42PzIWggCBN
         BWV/i0PQm7I3bVj782AkE8M2l/UKelh3rZ+/BC4NzEHo8sREKawGr7RaUJXxjkZtPxHw
         AvVmk9bg7PUTBWWsuWR9zQ7/sWnyd3C2KTLEhFkBs03s4m/DTv7tosqhog3W4fUwdIYI
         m5Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=2iPqXMUfIsAEqeZcV1a6ZwbIfCpqSP8BIPD4RI9e2so=;
        b=hSS2x7TA7EsciysGKxPG/OOJd4SBVGvKAK0zRgyvLwfdCOHFsuN54B2hIyRgq41S8R
         /cWSFElfn/8dfIbvTJWwqWDxIDhNmfbDvfRBfitziicWa41cMT2MiyTgcH9YpWNVfaMF
         Nxk73QfNWCFVsLZUMimlb9rgrfkgaK2LbDPFbm4tj01fVVTcvJ6/9VtmkUo+js2XJMEa
         QXt7UICuuZPWgmimbb8GpxFov7u1LsJtQmeiNMfiy1sjZgX/bJhZYfRPSABPEwa3GM/e
         brtpAzmfN16dK4HqBlyMwNeBve3WIbMfOhZC3NXfrvh808JVuF46YiddtHCg1IDTxhp6
         AqSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=YHhYI9uG;
       dkim=neutral (no key) header.i=@suse.de header.b=D9fy2D2z;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id m13-20020a5d6a0d000000b002c5584b8e9dsi2092364wru.740.2023.03.10.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:28:52 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=YHhYI9uG;
       dkim=neutral (no key) header.i=@suse.de header.b=D9fy2D2z;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0E87420653;
	Fri, 10 Mar 2023 13:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678454932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2iPqXMUfIsAEqeZcV1a6ZwbIfCpqSP8BIPD4RI9e2so=;
	b=YHhYI9uG371mP1QYPcJ9xVB08b01zdzwhEZqgg3fLAv3e3tvdy5ufIKGmWJ5r31OjUsitA
	krGRXHUqSeSc7L+l6837xTH4wvAvGP8ACglv87nc5f8/jGjU3QQvv7Exz6cfOtJ/TqJeKN
	x2qOxPBR8wmE/4vgPYJFbIGuAs8dVSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678454932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2iPqXMUfIsAEqeZcV1a6ZwbIfCpqSP8BIPD4RI9e2so=;
	b=D9fy2D2zhNLX58Ton9MXA/MrMybNuLBAIFruMMIiOSyO5V80eQ+MtbYVrl4sDJWzLDciQj
	gI24rWNWBnIjo/Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90BAC134F7;
	Fri, 10 Mar 2023 13:28:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id vSWJFpMwC2TxQAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 13:28:51 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v8 03/11] target/arm: Move aa32_max_features out of
 cpu_tcg.c
In-Reply-To: <3f660759-b37a-6b9e-3eaa-1f879db5ed48@linaro.org>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-4-farosas@suse.de>
 <3f660759-b37a-6b9e-3eaa-1f879db5ed48@linaro.org>
Date: Fri, 10 Mar 2023 10:28:49 -0300
Message-ID: <87a60kenvy.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: H0UrpnIcWPbw

Richard Henderson <richard.henderson@linaro.org> writes:

> On 3/9/23 12:14, Fabiano Rosas wrote:
>> In preparation to moving the cpu_tcg.c code into a 32-bit, tcg-only
>> file, move the aa32_max_features function which is shared between
>> 32/64/tcg/non-tcg into cpu.c.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   target/arm/cpu.c     | 69 ++++++++++++++++++++++++++++++++++++++++++++
>>   target/arm/cpu_tcg.c | 69 --------------------------------------------
>>   2 files changed, 69 insertions(+), 69 deletions(-)
>
> I'm not keen on this, as it's completely tcg.
>
> Perhaps it would be better to let -cpu max devolve to aarch64_a57_initfn when tcg is not 
> available (i.e. qtest_enabled())?  Move all of the tcg stuff out of aarch64_max_initfn 
> into tcg/cpu64.c.
>
> Thoughts?
>

That's what I had in v6. I would prefer it that way as well. Perhaps I
was too quick in changing it.

https://lore.kernel.org/all/20230217201150.22032-20-farosas@suse.de/

Unless anyone says otherwise, I'll revert back to that state.
