Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp619949ejs;
        Tue, 9 Jan 2024 12:21:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5vjxhIKlLB6oVcOnYFh+ESZGrBP2WL7CGL97knY6giCALHLweNhEr8uugvORh/mGHMCB0
X-Received: by 2002:a2e:2c15:0:b0:2cc:56a9:32d7 with SMTP id s21-20020a2e2c15000000b002cc56a932d7mr2964750ljs.85.1704831667465;
        Tue, 09 Jan 2024 12:21:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704831667; cv=none;
        d=google.com; s=arc-20160816;
        b=zY8Nsp42GjU5moj71KeuZ3ugRFi3jWuHB668vHXcWcrSHEu1hXF/TZa+WAEmmN9Sfz
         gOQuLJ23UUJxOMWAnKHz8hOItVs1L+HgaKoZXxEhnUcrwCaR56qJQfeC5a9dGXI4BMSU
         86MAbUTweP53OUX7raHyTOq8e0MNs1GF5T2J/bt1ApoYo51TdmPAZ56XVS5YqFGJnkgX
         4elcqStSFeOSiB4cwfjQS1RFVJqAe1ljxIpn87N5PDYagDdqbURjhYInzvz93j6KoI1F
         fjr63ih+ECTlhMNZbkbFxVejo9Xzu6QKjnfo425m3blN2KY4L+sOPdXFaPPM6axam3T/
         e3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=kWmxf0mlhBYBS0EsSSNkgd7+huRVr/Byc/CXIT+Shks=;
        fh=gf8t/VQiNQ+0eEEr/9+wieESJKlRqn9ej7QKhVZYUnc=;
        b=mPyEfwf2rmiAr/djJoB6KDu3bQyAsHvAs+o+isG9VmdJFtQE68Hz5cptpCRxxE9TNX
         LS5PODGTTO6rsw3eJjaZlO4AnqtV6eiIX2KwPivOptb8lbglHC8aQRFolniHT7CD5WWc
         TpxIb42JTUxs4tEAVLz0OMYVfCUVBTk2iaxf1xtjMEMog0yMIWmpLlJf9VgqHNloU5Ci
         REl2yRKQ6V4M/Xa3lEsgtQzRgmZWwFiKd+QRbRIMUiYYA85mzRwAh3fdvr8ifEUD2kRz
         9S3p+I3g8O/P4UG+6dsR+sGlqbuUaWx2fd/u7etYvKFvB+dwp13o8vjYfYjrATpS4Qqv
         JkKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=m5mRB0aN;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=ZOdEsI6S;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=m5mRB0aN;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2a07:de40:b251:101:10:150:64:1])
        by mx.google.com with ESMTPS id a94-20020a509ee7000000b00554c2e4e39esi1002744edf.523.2024.01.09.12.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 12:21:07 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) client-ip=2a07:de40:b251:101:10:150:64:1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=m5mRB0aN;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=ZOdEsI6S;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=m5mRB0aN;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0B683220F1;
	Tue,  9 Jan 2024 20:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704831666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWmxf0mlhBYBS0EsSSNkgd7+huRVr/Byc/CXIT+Shks=;
	b=m5mRB0aNdJCipoWMCSVL6uy6d0dX1M18wrNH5XUG3y6s8z0ukpuf0FBJa8vb71kEJ+xGfQ
	0QIZyw9SPdlvvDA6tvjbWtzof9CwXGQa+tD5Hlu03ITjzhAeeiAXx1K/Qc0ilEcaV4ygoi
	RNbcVBj7t2sIaVoLrIM2Muw0PE9Y3Go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704831666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWmxf0mlhBYBS0EsSSNkgd7+huRVr/Byc/CXIT+Shks=;
	b=ZOdEsI6SQyhpNNOqcEdQO1aTqVK/VSAnKvI+Hz1Z8TcpizgcoJgyrEWPtD2+GwKbsIO2zk
	l/72NJSJGrHNRECQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704831666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWmxf0mlhBYBS0EsSSNkgd7+huRVr/Byc/CXIT+Shks=;
	b=m5mRB0aNdJCipoWMCSVL6uy6d0dX1M18wrNH5XUG3y6s8z0ukpuf0FBJa8vb71kEJ+xGfQ
	0QIZyw9SPdlvvDA6tvjbWtzof9CwXGQa+tD5Hlu03ITjzhAeeiAXx1K/Qc0ilEcaV4ygoi
	RNbcVBj7t2sIaVoLrIM2Muw0PE9Y3Go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704831666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWmxf0mlhBYBS0EsSSNkgd7+huRVr/Byc/CXIT+Shks=;
	b=ZOdEsI6SQyhpNNOqcEdQO1aTqVK/VSAnKvI+Hz1Z8TcpizgcoJgyrEWPtD2+GwKbsIO2zk
	l/72NJSJGrHNRECQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8727C134E8;
	Tue,  9 Jan 2024 20:21:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RW6WE7GqnWVbMAAAD6G6ig
	(envelope-from <farosas@suse.de>); Tue, 09 Jan 2024 20:21:05 +0000
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
In-Reply-To: <d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org>
References: <20231212162935.42910-1-philmd@linaro.org>
 <03b969d3-1947-4186-b3ee-15e3cddc5f34@kaod.org>
 <18a38b88-8f20-420c-9916-a03d1b4930a7@linaro.org>
 <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
 <fe4d463f-b646-4b7b-9063-d16ad5dbb128@linaro.org> <87y1d6i47m.fsf@suse.de>
 <597186d9-af21-46e8-8075-f21d36c01c07@kaod.org> <87plya76cu.fsf@suse.de>
 <d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org>
Date: Tue, 09 Jan 2024 17:21:03 -0300
Message-ID: <87bk9u8dhs.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Level: ***
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0B683220F1
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m5mRB0aN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZOdEsI6S
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLpct1jb1dgwfjtbqq8ebpmkdo)];
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
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[redhat.com,nuvoton.com,linaro.org,habkost.net,jms.id.au,alistair23.me,rev.ng,gmail.com,google.com,tribudubois.net,codeconstruct.com.au,kernel.org,nongnu.org,ilande.co.uk];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-TUID: 2ewwqXyTk4hg

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 1/9/24 18:40, Fabiano Rosas wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>=20
>>> On 1/3/24 20:53, Fabiano Rosas wrote:
>>>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>>>
>>>>> +Peter/Fabiano
>>>>>
>>>>> On 2/1/24 17:41, C=C3=A9dric Le Goater wrote:
>>>>>> On 1/2/24 17:15, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>>> Hi C=C3=A9dric,
>>>>>>>
>>>>>>> On 2/1/24 15:55, C=C3=A9dric Le Goater wrote:
>>>>>>>> On 12/12/23 17:29, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>>>>>>>> cluster container, not to the board/soc layer. This series move
>>>>>>>>> the creation of vCPUs to the MPCore private container.
>>>>>>>>>
>>>>>>>>> Doing so we consolidate the QOM model, moving common code in a
>>>>>>>>> central place (abstract MPCore parent).
>>>>>>>>
>>>>>>>> Changing the QOM hierarchy has an impact on the state of the machi=
ne
>>>>>>>> and some fixups are then required to maintain migration compatibil=
ity.
>>>>>>>> This can become a real headache for KVM machines like virt for whi=
ch
>>>>>>>> migration compatibility is a feature, less for emulated ones.
>>>>>>>
>>>>>>> All changes are either moving properties (which are not migrated)
>>>>>>> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
>>>>>>> is still migrated elsewhere). So I don't see any obvious migration
>>>>>>> problem, but I might be missing something, so I Cc'ed Juan :>
>>>>
>>>> FWIW, I didn't spot anything problematic either.
>>>>
>>>> I've ran this through my migration compatibility series [1] and it
>>>> doesn't regress aarch64 migration from/to 8.2. The tests use '-M
>>>> virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I don=
't
>>>> think we even support migration of anything non-KVM on arm.
>>>
>>> it happens we do.
>>>
>>=20
>> Oh, sorry, I didn't mean TCG here. Probably meant to say something like
>> non-KVM-capable cpus, as in 32-bit. Nevermind.
>
> Theoretically, we should be able to migrate to a TCG guest. Well, this
> worked in the past for PPC. When I was doing more KVM related changes,
> this was very useful for dev. Also, some machines are partially emulated.
> Anyhow I agree this is not a strong requirement and we often break it.
> Let's focus on KVM only.
>
>>>> 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
>>>
>>> yes it depends on the QOM hierarchy and virt seems immune to the change=
s.
>>> Good.
>>>
>>> However, changing the QOM topology clearly breaks migration compat,
>>=20
>> Well, "clearly" is relative =3D) You've mentioned pseries and aspeed
>> already, do you have a pointer to one of those cases were we broke
>> migration=20
>
> Regarding pseries, migration compat broke because of 5bc8d26de20c
> ("spapr: allocate the ICPState object from under sPAPRCPUCore") which
> is similar to the changes proposed by this series, it impacts the QOM
> hierarchy. Here is the workaround/fix from Greg : 46f7afa37096
> ("spapr: fix migration of ICPState objects from/to older QEMU") which
> is quite an headache and this turned out to raise another problem some
> months ago ... :/ That's why I sent [1] to prepare removal of old
> machines and workarounds becoming a burden.

This feels like something that could be handled by the vmstate code
somehow. The state is there, just under a different path. No one wants
to be policing QOM hierarchy changes in every single series that shows
up on the list.

Anyway, thanks for the pointers. I'll study that code a bit more, maybe
I can come up with some way to handle these cases.

Hopefully between the analyze-migration test and the compat tests we'll
catch the next bug of this kind before it gets merged.

