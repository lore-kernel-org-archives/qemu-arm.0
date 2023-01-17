Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2660592ejc;
        Tue, 17 Jan 2023 11:00:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtEyr9Q70ggvgTySvpacsU6qVwR1Zn0jFN1UDnUs+e50SjvkZVgGzZTw9vjMRgxkZP/DWCb
X-Received: by 2002:a05:600c:510d:b0:3da:f6ae:faa9 with SMTP id o13-20020a05600c510d00b003daf6aefaa9mr9470821wms.29.1673982026873;
        Tue, 17 Jan 2023 11:00:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673982026; cv=none;
        d=google.com; s=arc-20160816;
        b=j9mCGMd5vYZs8jkVgak3gFoQUgTEpJKWVXbKYwz8oxbQcluyyfYUIWVubXfR1xT2iF
         dcVmDahaLxfVDovDMegf3Aq20Xw30jCI+GOiF0tpdsa6/h3MYEC6FOrXJW/O9a9NJQtm
         Jxx4oe93zWsqeSRUJTa27e+yz+yxbNT9lHqbdDjopgOsLNQfEGNs7Rjq6IvxlVOdIlcI
         tysmzF1oplRH2szB8IHm1NOM3eXcYJgGiiYetSSpcAQTRLvxPswt9b27jEZf8Yx+mz37
         k8q9/Z0TBdCAsuw2PI7+Gh26OaBpYL70zYJfcRJL+pyias7UEG33HbL6UXXXDnuzPL3D
         sX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=tytMECktt2q8IMOwV1IDHPfg1Wk4gHqp+asVqAXJr4o=;
        b=BQxMYj72r6HNNLmMV86mXEPmJVJFObLRsgySm6InnS1cj6ixgDCHlMV/lMNGZQRO9F
         KitktIoN7ufI4R51hPFYITB9pxwsg+xe8jLJwjKz4rJStGR0ViYl3Nt4rnNbQK32v43T
         we4F3eWjugdMGkkgJJcmOGKH+XTL1u2RMsN9LYtoAMyftdqckRufjtk+gWpruWCVrl1J
         fI2qTH6F53IisExUWHG+RYizdBNbszrpYXWY4RtmHJKD22zfn1Esi+JvZ2GCqS7T5GKB
         0iwkq70yB0VhC5Mdc6zcw2RWRunvPxtLxKfLmd94jjI9VgqAM6W/HrfEEtp0Vgfjiv9K
         q3zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Lb11nkLO;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=fM5yOdV2;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id v11-20020a056000144b00b002a26f11d20csi10593246wrx.24.2023.01.17.11.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 11:00:26 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Lb11nkLO;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=fM5yOdV2;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 338BE1FF0D;
	Tue, 17 Jan 2023 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673982026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tytMECktt2q8IMOwV1IDHPfg1Wk4gHqp+asVqAXJr4o=;
	b=Lb11nkLOzJWT4dWlNhLo0qNHdxmPOgqJ4TG8JLbKd9pm/hMF7XYGNsg/fTaYwVc5g9REeO
	9r9ghlDdqBn5YpNSEjhm1NogRxXzAfR1Kq4pBeO0MnWv0cNmFiGsyJkuhGyKveG+7lJciE
	AaQ1nbxRd9h5VOuR2Lsw/UmuXSbB9Y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673982026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tytMECktt2q8IMOwV1IDHPfg1Wk4gHqp+asVqAXJr4o=;
	b=fM5yOdV24ZCMhTHVuVPU9fDZ1rLxcbCypsYXgqpECmtwXOJOVPdWEaOKy7EB5t/ejbM0Cp
	kMcUPHDS0gXf7sBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6F711390C;
	Tue, 17 Jan 2023 19:00:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MC8XIEnwxmMIOgAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 17 Jan 2023 19:00:25 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH v3 12/28] target/arm: Wrap arm_rebuild_hflags calls
 with tcg_enabled
In-Reply-To: <0a3720ef-fbc4-2be8-14b6-2906117f9fe6@linaro.org>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-13-farosas@suse.de>
 <0a3720ef-fbc4-2be8-14b6-2906117f9fe6@linaro.org>
Date: Tue, 17 Jan 2023 16:00:23 -0300
Message-ID: <87edrt0ywo.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: a9zFkg+BJGdM

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 13/1/23 15:04, Fabiano Rosas wrote:
>> This is in preparation to moving the hflags code into its own file
>> under the tcg/ directory.
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>> I extracted these into a separate patch so we can discuss. If I move
>> the tcg_enabled check to a header that would add overhead for all the
>> calls where we know for sure that the code is running with TCG. And I
>> don't think we want a new arm_rebuild_hflags_foo to be used for common
>> code.
>> ---
>>   hw/arm/boot.c             |  6 +++++-
>>   hw/intc/armv7m_nvic.c     | 20 +++++++++++++-------
>>   target/arm/arm-powerctl.c |  7 +++++--
>>   target/arm/cpregs.c       |  2 +-
>>   target/arm/cpu.c          |  3 ++-
>>   target/arm/helper.c       | 16 ++++++++++++----
>>   target/arm/machine.c      |  5 ++++-
>>   7 files changed, 42 insertions(+), 17 deletions(-)
>
> Shouldn't we also restrict arm_rebuild_hflags() to CONFIG_TCG in
> target/arm/cpu.h (to be sure future code using this helper stays
> TCG-only)?

We could, but in practice hflags.c is already under CONFIG_TCG
anyway. If people don't build with disable-tcg they will not notice.
