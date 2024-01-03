Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp694916ejh;
        Wed, 3 Jan 2024 11:53:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4Q5zxoaxCJshwLtaeE2uFBv8VUd7wPAptuzK5Qz6aESZBh0QZ58TJiMNv60i9gmmvZzty
X-Received: by 2002:a05:6000:11c2:b0:337:39c7:2b52 with SMTP id i2-20020a05600011c200b0033739c72b52mr3353971wrx.36.1704311601448;
        Wed, 03 Jan 2024 11:53:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704311601; cv=none;
        d=google.com; s=arc-20160816;
        b=kkNeXMYPU7yDOBy9ToW96txz6IX2c6OWz7mlY8qAH6f/226aX6Vis8oLNNlmPakvsA
         Bz0JCoWb2ENx9iYDFDqdOBuXhSBkQgTdhiz5GKyHv49aY+phczkOi61Fxxf8NBBvi9i9
         7hHZNpgvYcwzB21pjrmBGxGZX/r1OITxtpAjRNAVfOHckl1r4o60bIaIxYBoI5hwN1F/
         G5tS0NtaN6R+N9XsZJNH+ETDe4sXL7CFbi6zb5OEzP5Ne7DEoqDSvoSE0z3CArHECDQO
         YQRRliDmV/r9DBT674wRU+P2DIpDO2rxcSUO2+rX1HvD6at411x7gcJf7r1sl/w0teGM
         kJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=WnrRHUoz0jts2thVWi4a43FMZwX2AvnPsl8a71ZrUsA=;
        fh=V441W+niNHsEc6ANSJJrHKcMf6GxAW1s3Ky/DKgOTeQ=;
        b=OyBdS4J7Fl6uZ559TKMGDAt2X5lAiiOSNzAYpHt9fckzSHrS5wZeIVgocDALJPJCqM
         MeBTnSW001utHlidA5wF09krVc1vNLZoZObS1E9x6lFcTNbM19dZRuv9+x22DMSeYLfc
         JJVVwGEVQGH4QxtQvjZ0zj13o+HSENoffLQkuXigPb3f0rtGFke7z9g2rBj4soCDjCmE
         rWFokh7u+CKDuLiC8HhF7+46jaABnq/jpX4Gh+QiCNb6J4tGLBFbAz3qN8XWP7tqTYA5
         FPSECDLGX2uhVCSfItOEUN2EVlmP29qhKAAaCrTOjRlYcFOBige5OW7MpJeLvXw2DRda
         jwuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=GF3HFBPo;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=GF3HFBPo;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2a07:de40:b251:101:10:150:64:1])
        by mx.google.com with ESMTPS id p8-20020adfcc88000000b003362a225f1dsi13231727wrj.170.2024.01.03.11.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 11:53:21 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) client-ip=2a07:de40:b251:101:10:150:64:1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=GF3HFBPo;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=GF3HFBPo;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 74DEE2207B;
	Wed,  3 Jan 2024 19:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704311600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WnrRHUoz0jts2thVWi4a43FMZwX2AvnPsl8a71ZrUsA=;
	b=GF3HFBPo5oaXerPCtqrpaFWf3HG1+dx3tB8RiNsD/R2S40Gii55rt6rzukwnAws9IV3Fq8
	Do7/dMqrE/Aasdb27FhtL3SXLYK7Xq0oS1OYWtlO86gEefFKWpzaYSkKZhaMuISFTVndBV
	yZJN4c6S4zOV/WFZO0bKfJi5JPtSvdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704311600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WnrRHUoz0jts2thVWi4a43FMZwX2AvnPsl8a71ZrUsA=;
	b=SqRkAj6zY5/CmGZTxvZXKXgac2U0yhhbSsKgk/RgDnnem1tAP6saTJD0WP/NrRI9VjPrTo
	vQDzJLwDXYg0/dCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704311600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WnrRHUoz0jts2thVWi4a43FMZwX2AvnPsl8a71ZrUsA=;
	b=GF3HFBPo5oaXerPCtqrpaFWf3HG1+dx3tB8RiNsD/R2S40Gii55rt6rzukwnAws9IV3Fq8
	Do7/dMqrE/Aasdb27FhtL3SXLYK7Xq0oS1OYWtlO86gEefFKWpzaYSkKZhaMuISFTVndBV
	yZJN4c6S4zOV/WFZO0bKfJi5JPtSvdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704311600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WnrRHUoz0jts2thVWi4a43FMZwX2AvnPsl8a71ZrUsA=;
	b=SqRkAj6zY5/CmGZTxvZXKXgac2U0yhhbSsKgk/RgDnnem1tAP6saTJD0WP/NrRI9VjPrTo
	vQDzJLwDXYg0/dCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7FB51398A;
	Wed,  3 Jan 2024 19:53:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C1x1Ky+7lWXuHAAAD6G6ig
	(envelope-from <farosas@suse.de>); Wed, 03 Jan 2024 19:53:19 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
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
In-Reply-To: <fe4d463f-b646-4b7b-9063-d16ad5dbb128@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
 <03b969d3-1947-4186-b3ee-15e3cddc5f34@kaod.org>
 <18a38b88-8f20-420c-9916-a03d1b4930a7@linaro.org>
 <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
 <fe4d463f-b646-4b7b-9063-d16ad5dbb128@linaro.org>
Date: Wed, 03 Jan 2024 16:53:17 -0300
Message-ID: <87y1d6i47m.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Level: ****
X-Spam-Level: 
X-Spamd-Result: default: False [-1.60 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLgn3pipxh44ye66tuwadwbnif)];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[redhat.com,nuvoton.com,linaro.org,habkost.net,jms.id.au,alistair23.me,rev.ng,gmail.com,google.com,tribudubois.net,codeconstruct.com.au,kernel.org,nongnu.org,ilande.co.uk];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: -1.60
X-Spam-Flag: NO
X-TUID: qrpShlE50vst

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> +Peter/Fabiano
>
> On 2/1/24 17:41, C=C3=A9dric Le Goater wrote:
>> On 1/2/24 17:15, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Hi C=C3=A9dric,
>>>
>>> On 2/1/24 15:55, C=C3=A9dric Le Goater wrote:
>>>> On 12/12/23 17:29, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>> Hi,
>>>>>
>>>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>>>> cluster container, not to the board/soc layer. This series move
>>>>> the creation of vCPUs to the MPCore private container.
>>>>>
>>>>> Doing so we consolidate the QOM model, moving common code in a
>>>>> central place (abstract MPCore parent).
>>>>
>>>> Changing the QOM hierarchy has an impact on the state of the machine
>>>> and some fixups are then required to maintain migration compatibility.
>>>> This can become a real headache for KVM machines like virt for which
>>>> migration compatibility is a feature, less for emulated ones.
>>>
>>> All changes are either moving properties (which are not migrated)
>>> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
>>> is still migrated elsewhere). So I don't see any obvious migration
>>> problem, but I might be missing something, so I Cc'ed Juan :>

FWIW, I didn't spot anything problematic either.

I've ran this through my migration compatibility series [1] and it
doesn't regress aarch64 migration from/to 8.2. The tests use '-M
virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I don't
think we even support migration of anything non-KVM on arm.

1- https://gitlab.com/farosas/qemu/-/jobs/5853599533

>> We broke migration compatibility by moving the IC object in the QOM
>> hierarchy of the pseries machines in the past. These changes might
>> be different. Here is the QOM tree of the ast2600 SoC.
>>=20
>> before :
>>=20
>>  =C2=A0 /soc (ast2600-a3)
>>  =C2=A0=C2=A0=C2=A0 /a7mpcore (a15mpcore_priv)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /a15mp-priv-container[0] (memory-region)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic (arm_gic)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_cpu[0] (memory-region)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_cpu[1] (memory-region)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_cpu[2] (memory-region)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_dist[0] (memory-region)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_vcpu[0] (memory-region)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_viface[0] (memory-regio=
n)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_viface[1] (memory-regio=
n)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_viface[2] (memory-regio=
n)
>>  =C2=A0=C2=A0=C2=A0 /cpu[0] (cortex-a7-arm-cpu)
>>  =C2=A0=C2=A0=C2=A0 /cpu[1] (cortex-a7-arm-cpu)
>>=20
>> after :
>>=20
>>  =C2=A0 /soc (ast2600-a3)
>>  =C2=A0=C2=A0=C2=A0 /a7mpcore (a7mpcore_priv)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /cpu[0] (cortex-a7-arm-cpu)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /cpu[1] (cortex-a7-arm-cpu)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic (arm_gic)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_cpu[0] (memory-region)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_cpu[1] (memory-region)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_cpu[2] (memory-region)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /gic_dist[0] (memory-region)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /mpcore-priv-container[0] (memory-region)
>>=20
>>=20
>> Thanks,
>>=20
>> C.
>>=20
>>=20
>>=20
