Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp511511ejc;
        Fri, 13 Jan 2023 08:22:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsW/x76GYVV0jeVJqoF8LpKk3WnVO+fx+Qa9jkAQ7EDvjtLRTJH7xd4CVbUFFxN6eaPN2JJ
X-Received: by 2002:a5d:6844:0:b0:2a2:5a2:cc10 with SMTP id o4-20020a5d6844000000b002a205a2cc10mr23787593wrw.36.1673626940513;
        Fri, 13 Jan 2023 08:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673626940; cv=none;
        d=google.com; s=arc-20160816;
        b=ho3B1kSeBVyEKX388IUeNDgP9B8Tfc/l6eF+nxoqpEOZiuoPMowfaIAeX13vLg9VOD
         R7CeyHSgSttd72GdAGfQPl/SGqh465Oqvdv13jQB2l3EBqFsWBvSXmIPxihEmxFr+sBp
         2EBjPdRhkjYopNZWWbsPONGZ0cvJ2JmZ9CUJDzzhNgnEurRfC8vEw6PY7bkxRz8tcYDA
         ZzbC55hdT5pG0/3a7NV58QVwDMWIP6JSOES6wittjiR1YQ/sc9e6Ra4kZhcyUKmd43Sm
         K+yJb59/c8NACQhACRd6K1s0yIucTNgN+9fgqNbmRuicJH3NQmCPTbK+5aDPp79lbK87
         s1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=mKs/ggpulP1sYOtSS5Rw57ie3DsUzarayKgqr5ie3Tc=;
        b=g7Lq3fTddnFx5OFUyid2Qe53iF437uXXKe57YlRAAQzOwXQCt7hp34KOylPxtwCX1r
         Jq/2BrwPwuEGbBNg06WcSdu26BZWDxT5auSOnb830QU/cmksFJf99yY3rpkaWRzhtQkX
         WoYfvJv04TjLgbDA9aqQGnkHhfk01y6ETuiWBYxD+s4tW1P18n33AFInXyVrc51g3Cva
         pJybiSmZk1xsxGCG1KAdzw4WXT0EoGuG0115/s2OEtdk4ekhMR3IQoncPQQQWKkLZRyB
         XcvhaqHcPD0iKZjcwhos8NGiDlIkCHbHi24oeYEAAD9kUaffdy+ejmhG8GFGz5uBwGTX
         cerw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UR1U90OJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=3hEfh+aP;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id g11-20020a5d64eb000000b0024262f81683si406849wri.835.2023.01.13.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 08:22:20 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UR1U90OJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=3hEfh+aP;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A06A26BBA3;
	Fri, 13 Jan 2023 16:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673626939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mKs/ggpulP1sYOtSS5Rw57ie3DsUzarayKgqr5ie3Tc=;
	b=UR1U90OJmocxTEYD7nrMARQ/CDib9KcPrabedlM592AEPclaAxIUNy6zOnS1b4Wa8dK1gj
	s9TjqxSG3xQuraHzYlHsbCU05aZpZt/FWWTezVSZaglvVgaUULDQBdzsmnz/1AMAwLJh19
	nEAoAXmy0r1YYiVGcOBQdC9rA/U8I3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673626939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mKs/ggpulP1sYOtSS5Rw57ie3DsUzarayKgqr5ie3Tc=;
	b=3hEfh+aPOrgHtB8GUxooNsQPfubODaXBJo87L9ePiQer/8V4oZnVy4P+l22tT3fNM7yTzz
	cReJ2zi59+9dArDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D9611358A;
	Fri, 13 Jan 2023 16:22:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XHDyOTqFwWN0UwAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 16:22:18 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
In-Reply-To: <3be55a1c-64cd-28f3-9c7f-ceb67b20c36e@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
 <3be55a1c-64cd-28f3-9c7f-ceb67b20c36e@suse.de>
Date: Fri, 13 Jan 2023 13:22:16 -0300
Message-ID: <875ydaievb.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: wRFCsYBNGozj

Claudio Fontana <cfontana@suse.de> writes:

> On 1/13/23 15:04, Fabiano Rosas wrote:
>> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
>> cortex-a57 as default cpu for KVM.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>
> Our recommendation currently for KVM on ARM is to always use CPU="host", as named cpu models generally don't work (yet?) with KVM.
>
> https://qemu-project.gitlab.io/qemu/system/arm/cpu-features.html
>
> Should then "host" be the default for KVM if CONFIG_TCG=N or CONFIG_TCG=M and the TCG .so is not loaded?

Yes, "host" seems to make more sense. I was under the impression that
there was a way to use cortex-a57 and cortex-a53 since they have
cpu->kvm_target set.
