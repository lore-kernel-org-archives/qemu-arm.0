Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4252097ejb;
        Wed, 22 Feb 2023 04:40:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+uEzGgts7YIFTgzglgltiNRS6/Pmrwh2SRUfbtm/OBr8cJul1qsk1ML9C9npRdh4YwQCzh
X-Received: by 2002:a5d:5387:0:b0:2c5:a2c5:130d with SMTP id d7-20020a5d5387000000b002c5a2c5130dmr5862657wrv.51.1677069653601;
        Wed, 22 Feb 2023 04:40:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677069653; cv=none;
        d=google.com; s=arc-20160816;
        b=hNrgSsQvjmHWE+EVEQetUAAEwUMjUYxmazq0a92BS5aVjwxifV1CIjnTOC7XtTiYfh
         GXnA4BFAdoo5fEMzVLDYMcjJxrxwOC/93ARqnvE/g64FHXJEarNs1w8ba7GlTPWU5OpF
         mKP0qL0HYLguKDQGe8wBr6XRhVwdJ9awvXxy3nJyn51n7863jdhjbZIlqFNfYnbFbkxj
         AyscUZlCHvrilyjOD7yrVCJgKzGnYmUoRtFW2WfhvvjTutnML3oX/oEDHjGDaHfWtapL
         hhvwsoVYJ4QxKm6EXHuBvxMp13uN6S1jgRjXaP3IhKQ1LTBGlflka3olyabW0PckmRsE
         RuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=og0oQdXIhFlfhW9gCpkRORQY170hBsTp6ToRrPlfDFw=;
        b=ryfdtZJvWtrbISCRd8mt2Rg36QYS0KknWvhJHuaOBxWMfQjeZf9rc6W34hV31tdM5g
         YJuitWxxtgEK+h2UWc3O9Dqn6hasrGWSkY/TU0OmAeratMYftZIzRHTyiC+3zTz6Ztfq
         615SrJO0c1dIkWuIJQ3mbVxGyR94yDAWHOd7ScFnGFUXDyggT6ytYk4JgDs9tbnXw0hd
         iNy57NSqcAcQO1b0UhX5Q6AS/d65ouCOXshEz0BEE+LXi64q4QRW6BU7cHMuoKjL3rDH
         qA4N2RYvytUl9d7q6l/Rs61jg/pmw0F63OHV1tdfHC36Q2Lc2g2F7Y+rJV+bL9e5tjmO
         Q15A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=yS96Nv0t;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=XdscH0RF;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id h10-20020adff18a000000b002c406800770si3547754wro.92.2023.02.22.04.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 04:40:53 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=yS96Nv0t;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=XdscH0RF;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3BEEE1FFE6;
	Wed, 22 Feb 2023 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677069653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=og0oQdXIhFlfhW9gCpkRORQY170hBsTp6ToRrPlfDFw=;
	b=yS96Nv0tvEsfCQj/ukqvMsESXNxpidBM211iGcjj84qE5tzLo7gJn+H9zeWnSXvolltarL
	L/Dw0lW1yL1oQK95ZuAV8JJJEnmk7WLsbiswXPfMx+VGcWGIoEwhYmw+9SRskvYSZrBOaj
	cHhwEBkTRbsK6kPi9IzU5Uc5/sqT5kk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677069653;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=og0oQdXIhFlfhW9gCpkRORQY170hBsTp6ToRrPlfDFw=;
	b=XdscH0RFzD32npQPCSabz22ymdZK2+nE3Sym2Zh2VST8Zh28HMGewTPBlrzy6T5Zo4y2IF
	ZWI+zN/Rvp+AAKAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF35C133E0;
	Wed, 22 Feb 2023 12:40:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id t5AjIlQN9mP2SwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 22 Feb 2023 12:40:52 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v6 00/29] target/arm: Allow CONFIG_TCG=n builds
In-Reply-To: <CAFEAcA-uk7V+Mspo9uZ5W9P9beYNEdhs-VSuOAD6S=5cqtPGew@mail.gmail.com>
References: <20230217201150.22032-1-farosas@suse.de>
 <CAFEAcA-uk7V+Mspo9uZ5W9P9beYNEdhs-VSuOAD6S=5cqtPGew@mail.gmail.com>
Date: Wed, 22 Feb 2023 09:40:50 -0300
Message-ID: <875ybtootp.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: e94pv9Wloe9g

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 17 Feb 2023 at 20:13, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Addressed Peter's comments and dropped the cpregs change which is not
>> related to fixing the --disable-tcg build. This unblocks the xenpvh
>> series and I can tackle the regs split without holding up the build
>> work.
>
> I've applied up to and including
> [PATCH v6 15/29] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
> to target-arm.next, and also
> [PATCH v6 25/29] tests/avocado: add machine:none tag to version.py
> (and some of the rest were already upstream).

Thanks! I had a couple of days off, I'll address the feedback on the
rest of the series right away.
