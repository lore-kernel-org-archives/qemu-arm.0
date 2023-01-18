Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp441575ejc;
        Wed, 18 Jan 2023 04:10:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsz9FUjKobRGJn03xOI68WXdM1CDBLtEou7JC4Wnc9n5PYvps++/NgmPps4D1o8Gif76swj
X-Received: by 2002:a5d:4532:0:b0:2bd:dc1a:cbd8 with SMTP id j18-20020a5d4532000000b002bddc1acbd8mr5614027wra.57.1674043816549;
        Wed, 18 Jan 2023 04:10:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674043816; cv=none;
        d=google.com; s=arc-20160816;
        b=AzLxsT+bjKci4y4ZgYPlh+E/nN9vhUFJ2ZMMDN5LmflS6sbwWtda4vF7Jm95BJs8oM
         JV1njIYh9oHf0SrsNIKgroC3hnsegrvcvVdTpEVHjS4EDWFIIqVTh14GVYq2sxRYJNI5
         7OVrikYoZZFb898GXvvPcL9TiCeqr28Z2JfxFZKdav2R9bVGyxc6/hIiwC5P+wYepirR
         wwsIQyiHqddhiTCE7MunkdZv5WQCjSTg2acCgjut0pCoD2W0ZaXq4wC9TxNdA18ZS8qq
         ZIiqKJ/mkSQqTyNJtsb2Uyk/3NM0UfZGkJB6g8miOTFT2Ytv067bmgITqHu6NKSFAOCA
         2PwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=iezqUoQZ0T8WdkdK3O1eID2PN+qDN3tTwL6s1/Uwj00=;
        b=L7KBmvxjeVC5LYPa4D5rGseonhzRvWvggM8czYss/EHImlpNQgP7P/2Qa6iJvr4ySU
         BSvAxFoXcioCEBqjWR5qBQO+WHnmarrm9RIbbw0L2ScZoizIp7MPOEX/n4KUILQVX3KY
         8oPdp8iFVyX0ciAdVakxx2cBlRQkktVWCqvgZH1tBl1aNs9vvT8SDVIL2Riimg5mHtur
         +D2aUnVAK7V38f6P016H/VyJC9TMnrNdgeDOhvX0hMCr9Ful9nUF2JLHnhlXfzHFHNeB
         atoGreUPNqQI0haeJGmnisp+pxWme0imaMKDdpddiVXAFczhULNHSZxjfxQL44muHPrf
         FFGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=WFuq2a8c;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id a8-20020a056000188800b002bb31e8aba2si37418417wri.445.2023.01.18.04.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 04:10:16 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=WFuq2a8c;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D26E55BD1F;
	Wed, 18 Jan 2023 12:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674043815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iezqUoQZ0T8WdkdK3O1eID2PN+qDN3tTwL6s1/Uwj00=;
	b=WFuq2a8ckItURTp1RJ+8V9QuTW9c3MQlgwBe9pRkdrh3k8IY6CDAmtHSfpteJaO+teX5k2
	0rLl57rhr1loZp+UAUngMFHG/mM+hS6/c2D2qULwEsnhnWWEaCryTMk+3DanDSFAMEzMgP
	5e5eUotAGi8SmDw3xt9MsxU96vPNP14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674043815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iezqUoQZ0T8WdkdK3O1eID2PN+qDN3tTwL6s1/Uwj00=;
	b=zIrWOUvroalQ+Y0JmOZN8ieRLEBGdsJ5wUuhyCq2jTlIVjMnDU3ASoM8M7chk2UTIl5oxU
	6BTvWydaerEbOnBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5CC9A138FE;
	Wed, 18 Jan 2023 12:10:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id u0RJCafhx2OWEwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 12:10:15 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Claudio Fontana <cfontana@suse.de>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
In-Reply-To: <c803c8a5-5788-2935-c1d8-3b62cc9a64d9@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
 <bafc45b7-f42a-a500-053f-65f057a14cc1@linaro.org> <87bkmx0yux.fsf@suse.de>
 <1ff29148-eae9-84b7-3521-4b9d543f12e3@linaro.org>
 <c803c8a5-5788-2935-c1d8-3b62cc9a64d9@suse.de>
Date: Wed, 18 Jan 2023 09:10:12 -0300
Message-ID: <87edrs6o2j.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /KqRcA/jS9gC

Claudio Fontana <cfontana@suse.de> writes:

> On 1/18/23 11:45, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 17/1/23 20:01, Fabiano Rosas wrote:
>>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>>
>>>> On 13/1/23 15:04, Fabiano Rosas wrote:
>>>>> The cpu_tcg.c file about to be moved into the tcg directory. Move the
>>>>> code that is needed for cpus that also work with KVM into cpu.c.
>>>>>
>>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>>> ---
>>>>>    target/arm/cpu.c     | 76 ++++++++++++++++++++++++++++++++++++++++=
+++
>>>>>    target/arm/cpu_tcg.c | 77 ----------------------------------------=
----
>>>>>    2 files changed, 76 insertions(+), 77 deletions(-)
>>>>>
>>>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>>> [...]
>>>>
>>>> TYPE_IDAU_INTERFACE is ARMv8-M specific, so TCG AFAIU.
>>>
>>> Hm.. QEMU doesn't start without it. There might be some implicit
>>> dependency. I'll check.
>>=20
>> Likely some M-profile code (note this type is a QOM *interface*).
>>=20
>> I checked the uses (git-grep -W IDAU_INTERFACE) and none should be
>> reachable in a non-TCG build.
>
> crossing fingers, I remember getting in trouble there, but maybe that is =
now solved by the KConfig thing..
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02958.html
>
> My understanding is probably obsolete now, if so sorry for the noise.

I guess this is what I was remembering. But after the Kconfig and qtest
changes everything looks good.
