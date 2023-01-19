Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp367861ejc;
        Thu, 19 Jan 2023 06:26:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsuGoUFqHCyPjMfUs0aQjcK2/V4+yvSLoIN3JTkZvF6TSHy9RVr2V8bsN5g+83z4z1XGqcP
X-Received: by 2002:a05:6000:1f95:b0:2bc:371a:8a2 with SMTP id bw21-20020a0560001f9500b002bc371a08a2mr10249320wrb.37.1674138392286;
        Thu, 19 Jan 2023 06:26:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674138392; cv=none;
        d=google.com; s=arc-20160816;
        b=rZD/Tryuy7mexL5Hu9mIHRxuSmextHgHbM2m/fVFK+y8mX4XkgO3oCvali7TYLMpnd
         stKkqgHwMw3AyQRTjk+5XS0ftieFx2b6ZuOHyw96Ay35QFWOnr9/EWSc2K/TGglqOtxR
         PSYU4+EIZjDsTzQCDF/AbBJR2+N2v+ho9pd3YD854+FarN1tiiEitWNRiRkeK5dsRPzD
         GMlOfQRIdBsdJPu8GlIUzqlEQc2xkPKDNtbZmOEq7+/ygk21NwGspVzh98/HTklCx76/
         8IB2ywfQyb5ozwhEscQu4cNsWIq9IJKjH4IOmDeJN7EenooHMJFRRClcCQ29OVe411EW
         QWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=D3SrGXQAGdia3Gtgzpgxn1EVA7CxIh05SQOCdS5nkXk=;
        b=NSFkNtQRkkI0GK+59wH14zeekRFniDfvCjYpXlwPJuagaVYf5Yii9nrvjH5D7mPtTo
         44GskTF6e0wHmN2kzRvQrBcKxFECWm5KlCJxJGIZJZouRkTciIX8j7+9fwownY9Spm2j
         7wfw+TRNDlxwBxy2aUMytGLUxgWybntQPP5egBpPvaIoPtgKx1Xeq880hwFdsP5ZBrlr
         SPkz0kNnMicFh7ldiN0MTd06mueWVn6jQ0/QfPZqk/twDheJQEu+DzRmu8iUpp/FfPNB
         +nyVl1dH5Tekgn/4peiOBlA3wN4Cpt/9Dap7Xc8CxZ6U4ktAzgAyzT/6q3gf3mM/IBXS
         77gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rtnsSVeJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Ewt5hOnG;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id h13-20020a05600016cd00b002be1b371f39si8775428wrf.739.2023.01.19.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:26:32 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rtnsSVeJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Ewt5hOnG;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9DDBA5CECF;
	Thu, 19 Jan 2023 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674138391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D3SrGXQAGdia3Gtgzpgxn1EVA7CxIh05SQOCdS5nkXk=;
	b=rtnsSVeJDfUSxn4Yffdkh4vv38EZndqH6AMXHFO1iSB4cMAxy1JAw5wIxmpklFqATQlNOP
	fS0IhZ4g+hoYR3RTR4uncHrczTf83Z9NKh6P3y/X0xob52N254TDYcITd8067y2IyubcVH
	QoOEgpEseoTKO7cr/1/f36WmISXusnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674138391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D3SrGXQAGdia3Gtgzpgxn1EVA7CxIh05SQOCdS5nkXk=;
	b=Ewt5hOnGB50Z43ICiZWl2P6qsr2dHCOdNxdr+zAeQQsi7+80b6E3be6NhrgShzXPJ4yrbP
	kr2sIAnSm9Do6jCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29E7F139ED;
	Thu, 19 Jan 2023 14:26:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AWDAOBZTyWOhJQAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 14:26:30 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
In-Reply-To: <d8da1d01-c87d-a226-0914-448a7da144c5@linaro.org>
References: <20230118193518.26433-1-farosas@suse.de>
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org> <87bkmu1z8v.fsf@suse.de>
 <d8da1d01-c87d-a226-0914-448a7da144c5@linaro.org>
Date: Thu, 19 Jan 2023 11:26:28 -0300
Message-ID: <877cxi1tyj.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7kDr+DF+aCxH

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/1/23 13:32, Fabiano Rosas wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> On 18/1/23 20:34, Fabiano Rosas wrote:
>>>> These are the already reviewed patches from the first half of my
>>>> previous series:
>>>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>>>
>>>> This unbreaks the --disable-tcg build, but there are issues in runtime
>>>> that are still being hashed out in the other series.
>
> Are you saying, we can *link* this configuration but not *run* it yet?

Strictly speaking, we cannot run it. While it works most of the time,
there are still references to machines and cpus that are TCG-only. Try
running -machine ? or -cpu ? for instance. If a user tries to pass one
of those, there might be breakages like the ones you saw.

The other series (I just sent a v4) removes everything that depends on
TCG. Then it will be 100% safe to use --disable-tcg and consume the
result.


