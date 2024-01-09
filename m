Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp535834ejs;
        Tue, 9 Jan 2024 09:40:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6zLoQMiWl2TlT0DHnk/qodCR7WKXuiV/KcPdgHM/LzChMmT7Ik9Pt1Hj55jzYLLzmAdHl
X-Received: by 2002:a1c:4b01:0:b0:40d:91fc:7ea1 with SMTP id y1-20020a1c4b01000000b0040d91fc7ea1mr1487442wma.116.1704822037227;
        Tue, 09 Jan 2024 09:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704822037; cv=none;
        d=google.com; s=arc-20160816;
        b=DPhV+qbhHwVhPqJDPeideTTQjL455CuDKY1plRnHTrJwI8JHt/qXDsYozaQdJ5Rydd
         TyRvxftm40RH/I+R+kan57LU8GGqDULa6INpGmr77cK9EQiGFRqXZ2QH23jiNUIgy3Ta
         70NfqbcbHf34h1n6EcgP4wgXXM7bXkuLlwWX+zz+fdsakpAZjEVZCGijVBm0nml03L/N
         6VbcZwBliURELW3/5lKt0KixWh2kbhpsGpd4rQ90GQNTaAB3haQWc4eHpP2Id1gH7+eb
         dxsdg7eAv0C3f4tQeHETMqrdEpiQe4Y85WjOr8VC80TuxOEYiJWXrXaiK4IHVs09v3ak
         j0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=zxe0lf3KR4KbqPmrSSdV1FZ+XlTJFVbNml2QRLvQY0I=;
        fh=gf8t/VQiNQ+0eEEr/9+wieESJKlRqn9ej7QKhVZYUnc=;
        b=wRbDuwGAT5Veh5PibfdzQ0SILONr6t5rTmN19tzvD7q3x9qb2aVJdbKOZfmZPUZ9J4
         KjTVfoWbbG5uSTaxuK4tyHqS5Esu68Tx75L5r0rvhE9XhwZkgghSLqv7DST5n7eSu4XH
         mUJf7zY5r+kfa+071PD3vb7k86fYy39aqKfDNbB+AA1ijxItyHfa5L1EFUXXNur9b8ft
         JVyUpHSb2kWPHGovDXlIRvDQwUtB+mZvJd8pE5IML3fVddoHsaRuqqIq8VAqJxYbpTb9
         SEU/297AIDPZnXFPV09hcxvlRwp1rF59VVshIWKcl+ECnPHzHmLrUFd38Rjo5vLjoawq
         gzyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=WjAEEq9q;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=WjAEEq9q;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.223.131 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.223.131])
        by mx.google.com with ESMTPS id k15-20020adfe8cf000000b003375d8b6387si1172104wrn.936.2024.01.09.09.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 09:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.223.131 as permitted sender) client-ip=195.135.223.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=WjAEEq9q;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=WjAEEq9q;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.223.131 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 532411F823;
	Tue,  9 Jan 2024 17:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704822036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxe0lf3KR4KbqPmrSSdV1FZ+XlTJFVbNml2QRLvQY0I=;
	b=WjAEEq9qw4UAq4Qg+OmCTLvygx6afQEuFfYLLbnecjUfwrgo9Isz4YzhntLbZJ3R6RhcSD
	hoYXUz6UeC5g9szymokCxEzg6ujow8W6YhYVj9x5wrurY9BNRp+0Zz0x3+4R6Zn6ubNaF6
	gMHN0Dbi5WQ9sblAcyvzv5z04FNDRz0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704822036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxe0lf3KR4KbqPmrSSdV1FZ+XlTJFVbNml2QRLvQY0I=;
	b=76vEDzxs7FLpMsXjTVazlggmNDcdmO4CdlFSrJrYxq5/RatjmZMkiD9aUAGJny20GFbolP
	aHMKBWyPCP+xCcDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704822036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxe0lf3KR4KbqPmrSSdV1FZ+XlTJFVbNml2QRLvQY0I=;
	b=WjAEEq9qw4UAq4Qg+OmCTLvygx6afQEuFfYLLbnecjUfwrgo9Isz4YzhntLbZJ3R6RhcSD
	hoYXUz6UeC5g9szymokCxEzg6ujow8W6YhYVj9x5wrurY9BNRp+0Zz0x3+4R6Zn6ubNaF6
	gMHN0Dbi5WQ9sblAcyvzv5z04FNDRz0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704822036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxe0lf3KR4KbqPmrSSdV1FZ+XlTJFVbNml2QRLvQY0I=;
	b=76vEDzxs7FLpMsXjTVazlggmNDcdmO4CdlFSrJrYxq5/RatjmZMkiD9aUAGJny20GFbolP
	aHMKBWyPCP+xCcDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C73531370C;
	Tue,  9 Jan 2024 17:40:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SWJEIxOFnWX4MwAAD6G6ig
	(envelope-from <farosas@suse.de>); Tue, 09 Jan 2024 17:40:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Philippe =?utf-8?Q?M?=
 =?utf-8?Q?athieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org, Juan Quintela
 <quintela@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Anton Johansson <anjo@rev.ng>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hao Wu <wuhaotsh@google.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Igor Mitsyanko
 <i.mitsyanko@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring
 <robh@kernel.org>, qemu-arm@nongnu.org, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
In-Reply-To: <597186d9-af21-46e8-8075-f21d36c01c07@kaod.org>
References: <20231212162935.42910-1-philmd@linaro.org>
 <03b969d3-1947-4186-b3ee-15e3cddc5f34@kaod.org>
 <18a38b88-8f20-420c-9916-a03d1b4930a7@linaro.org>
 <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
 <fe4d463f-b646-4b7b-9063-d16ad5dbb128@linaro.org> <87y1d6i47m.fsf@suse.de>
 <597186d9-af21-46e8-8075-f21d36c01c07@kaod.org>
Date: Tue, 09 Jan 2024 14:40:33 -0300
Message-ID: <87plya76cu.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Level: ***
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WjAEEq9q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=76vEDzxs
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,kaod.org:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[redhat.com,nuvoton.com,linaro.org,habkost.net,jms.id.au,alistair23.me,rev.ng,gmail.com,google.com,tribudubois.net,codeconstruct.com.au,kernel.org,nongnu.org,ilande.co.uk];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Score: -0.51
X-Rspamd-Queue-Id: 532411F823
X-Spam-Flag: NO
X-TUID: quIgBdawKHBt

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 1/3/24 20:53, Fabiano Rosas wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> +Peter/Fabiano
>>>
>>> On 2/1/24 17:41, C=C3=A9dric Le Goater wrote:
>>>> On 1/2/24 17:15, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>> Hi C=C3=A9dric,
>>>>>
>>>>> On 2/1/24 15:55, C=C3=A9dric Le Goater wrote:
>>>>>> On 12/12/23 17:29, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>>>>>> cluster container, not to the board/soc layer. This series move
>>>>>>> the creation of vCPUs to the MPCore private container.
>>>>>>>
>>>>>>> Doing so we consolidate the QOM model, moving common code in a
>>>>>>> central place (abstract MPCore parent).
>>>>>>
>>>>>> Changing the QOM hierarchy has an impact on the state of the machine
>>>>>> and some fixups are then required to maintain migration compatibilit=
y.
>>>>>> This can become a real headache for KVM machines like virt for which
>>>>>> migration compatibility is a feature, less for emulated ones.
>>>>>
>>>>> All changes are either moving properties (which are not migrated)
>>>>> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
>>>>> is still migrated elsewhere). So I don't see any obvious migration
>>>>> problem, but I might be missing something, so I Cc'ed Juan :>
>>=20
>> FWIW, I didn't spot anything problematic either.
>>=20
>> I've ran this through my migration compatibility series [1] and it
>> doesn't regress aarch64 migration from/to 8.2. The tests use '-M
>> virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I don't
>> think we even support migration of anything non-KVM on arm.
>
> it happens we do.
>

Oh, sorry, I didn't mean TCG here. Probably meant to say something like
non-KVM-capable cpus, as in 32-bit. Nevermind.

>>=20
>> 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
>
> yes it depends on the QOM hierarchy and virt seems immune to the changes.
> Good.
>
> However, changing the QOM topology clearly breaks migration compat,

Well, "clearly" is relative =3D) You've mentioned pseries and aspeed
already, do you have a pointer to one of those cases were we broke
migration so I could take a look?
