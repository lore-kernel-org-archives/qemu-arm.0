Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1430051ejc;
        Mon, 16 Jan 2023 06:08:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtggHW5lfhJ5b/jZ19Bd1ICWMJUkIdJAuIZC6n/lW7UqzaaeZmyylDmB1NwEAnEN+/Meg5c
X-Received: by 2002:a05:6000:1b05:b0:2b5:dc24:e08e with SMTP id f5-20020a0560001b0500b002b5dc24e08emr26744408wrz.69.1673878102619;
        Mon, 16 Jan 2023 06:08:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673878102; cv=none;
        d=google.com; s=arc-20160816;
        b=o5zTmFLeuF92QRWjvBYKZ+neyGuFtgZZMvbhR6DimJqgeDU++nPxaXdjRpvVzELFkh
         uX0WDie20P9mHSXWYGYiqGeMbQlFmXvkFPAYoCn0/8rff/RzL7qsCMqKbYrpclK5pL3E
         e9h098kJV427V/OmS+6bxpv3ebvdINW1Clut9GjxVwmNHbV323G52eHg75qJhUDlKVXO
         1i+X1q9RjOzhol6VBhChQ/yq/2IDiji+riI9iAv0zjgwkCX9PC3OeFOXNyk8rM1J2z/d
         oxbFiyIgwjbA3xV8nmZqJsAgisblpjYqfV4wDOI7ZQB6B+xVOFnESXeUPNOXzl2zApkL
         EU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=jYpvfBUUQx5AgLWD7HpZ/ikak7btnZaNIlIB9bjuo/4=;
        b=h6XgVlGK60K2y/3iib1NaLlvQiWobkn08Nettxk4bfR16TbIsFPfUoGFBggnvWcHvq
         UupC4QW4lsHb2bE+Dq4E7wVer3HMDdHJgraEkm/8onFGUrYD3O9mdYBlLNC0lWoVhUn4
         DMNe+cnG7DDYnaRAA1DMrrcs/MwjbSVsLwo9Dp9FGdMtpZTCHrrHLN6TRsgHUi5ClyQR
         +3IE4acbSkeV65Ink0/8PqWWpPDnNO17LYclJrAqxDQ1bXDSDsWtJk19+Cdk3OFD5D7R
         OqpBerjK5sVbbddAwQTkj7WvT/WH42YzP+/ErxiES8QoOkU8hFWXncoUn1qapF2tb3Kb
         2lvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=jN7idM75;
       dkim=neutral (no key) header.i=@suse.de header.b=67OQSLJc;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id m9-20020a5d6249000000b002787ce8057csi23277764wrv.457.2023.01.16.06.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 06:08:22 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=jN7idM75;
       dkim=neutral (no key) header.i=@suse.de header.b=67OQSLJc;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EDB2B678BE;
	Mon, 16 Jan 2023 14:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673878101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jYpvfBUUQx5AgLWD7HpZ/ikak7btnZaNIlIB9bjuo/4=;
	b=jN7idM75FOXoIf7po8BgPta5c7v69eV9jQFxbHXN3b7ceASf2mmvC+8/gXhKcmBcvUXLtS
	3CkXsTOatimbAIM9mog+nrV7jBNy3mXa8pQWtnstHOWIXLm3UPHIq1C5gVVGLwsRxiHIXg
	11jViQsYkBIwA15kcX1Xh2wqT9PYY6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673878101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jYpvfBUUQx5AgLWD7HpZ/ikak7btnZaNIlIB9bjuo/4=;
	b=67OQSLJckyjz3TKZi6h/0da2Fu/SPHP5dmYoupUy0h8bM8cTi2oYBSB5bvISvgl0lFqdiX
	ItsLd/T9LCuzGbCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BEE5138FE;
	Mon, 16 Jan 2023 14:08:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KK11EVVaxWO+VwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 16 Jan 2023 14:08:21 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
In-Reply-To: <CAFEAcA8cUc28JBT7QikUirthUn7yP-BVV3+cibHryAGx5FWE+w@mail.gmail.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
 <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org> <874jsqzj7m.fsf@suse.de>
 <CAFEAcA8cUc28JBT7QikUirthUn7yP-BVV3+cibHryAGx5FWE+w@mail.gmail.com>
Date: Mon, 16 Jan 2023 11:08:19 -0300
Message-ID: <87wn5my3l8.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: nUh1YfYXJLw4

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 16 Jan 2023 at 13:45, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>> > On 1/13/23 06:04, Fabiano Rosas wrote:
>> >> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
>> >> cortex-a57 as default cpu for KVM.
>> >>
>> >> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> >
>> > Ideally there would not be a default at all, requiring the command-line option to be used.
>>
>> We could probably do that now without impact to users, since KVM would
>> always require a -cpu option due to the current default being
>> cortex-a15.
>>
>> >
>> > Second choice would be "host", since that's the only value that's actually usable (except
>> > for the off-chance that you're actually running on an a57, which is less and less likely
>> > as time moves on).
>> >
>>
>> I'll have to go around fixing qtest first, either to add -cpu or to add
>> -accel kvm, otherwise we get:
>>
>> The 'host' CPU type can only be used with KVM or HVF
>
> For a CPU type that will work with either KVM or TCG, that would
> be "max".

Yes, although the issue here is more that there are tests running with
!kvm_enabled (no -accel kvm given) and !tcg_enabled (--disable-tcg).

The "max" cpu does in fact work with qtest because even when
CONFIG_TCG=n, it ends up configuring a "cortex-a57 + extra things" in
aarch64_max_initfn. But that seems a bit too implicit to me, it would be
better for the tests to explicitly set the accel and cpu options.
