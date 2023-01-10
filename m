Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3164193ejc;
        Tue, 10 Jan 2023 05:19:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvISCbPjR1aw7/o/BKD76v6Qn2H2wMHEJEg2eg7Dde72IeZz1mypTisOcxfF0N9zqRevqBw
X-Received: by 2002:a05:600c:c8a:b0:3d9:7062:e0b7 with SMTP id fj10-20020a05600c0c8a00b003d97062e0b7mr43550092wmb.33.1673356795539;
        Tue, 10 Jan 2023 05:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673356795; cv=none;
        d=google.com; s=arc-20160816;
        b=1LADNb6M4S+fGGVUu6BmZB9Becpv+Cdeo5hB2lmhdLbiysdZxjdG2wtDlscXIVQj/D
         CF0EVQOqk6AlJMgI9lPK6nCd0jk1gLlJguO5qgReHCO9BsNZgXIxGUq/7wMRkmMB+aOM
         Pp6Jju2ewuhetPamaOqYD0g4YNOx61PO63G2kRwmD75S7bjHKiCjgdPDx9KIxcpFRsFT
         tMOJnA8MQEr8em9hnEHSCnLU+q6aPy6/bIT2/X2B5NsTGJRIt1DnGa1/b3c81vvSRs12
         y82J8EXytT1wk7iHMMzsfXmkkEorccPfQGKesHlzto5nKIxFNJ9nIZrIButgA9sGFJDB
         L9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=TYBcXyviBMBxf9BmBzjVP8C3CJPvVNozAUDdQQv96kk=;
        b=VPsV0KXA4IAigf3z3Juc8n4jOks2O3Vca9+o+pBFWwDav8/dQYqKzdIqEJq4SAVQ7P
         vOqM+RbDiQXC8RKNIr+rShaeyjExBDdfcEd9waCExk20J9QA8f2LB0l8qEtDJVzfSGZT
         Kd5N5XCUhHjv/in0mb9av9rB94GMmYopl8aosI1Lyj33U01tCvCEDFBJUVZH5pKk3QBG
         cbTvdJFcRylMygNqteE3XHTIwPhNBNJr1/vkPv4qWyoprIat3VyOE52fNZ4v33Cte8QJ
         OWyR63N4JB4A5Wjh9dm7laWieqrvg6Wxdk8GONwcOn0G8aeqJ7yIgAgSXQY7576Y5/8K
         yC4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="Qxf//jZs";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id e7-20020a056000178700b002b69f244898si10909241wrg.148.2023.01.10.05.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 05:19:55 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="Qxf//jZs";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AB5C63E702;
	Tue, 10 Jan 2023 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673356794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TYBcXyviBMBxf9BmBzjVP8C3CJPvVNozAUDdQQv96kk=;
	b=Qxf//jZs6QLcaL6hGUHUVp3unjrxCFpLk9qg9NDkUScW+3ZRb2PdmTjN952+t5AI7eao4Z
	nbS+hi177hK0rt2Ygpu3cGWkik0yWWM7UNaZEhaIssV4Mhi/Pr2Ogsb8UgEQ+SmjYc2reQ
	j9KxjgFQedK+lppPG8NIRMthZDgxVCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673356794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TYBcXyviBMBxf9BmBzjVP8C3CJPvVNozAUDdQQv96kk=;
	b=Ay3Fg18Po7nnmWoun7IFHQ045LnaLscYq51twl7LqpkB95Rs5IX/8MkeDZqAIAC70tBULb
	2fNg9trhmsXUz1Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 296EE13338;
	Tue, 10 Jan 2023 13:19:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id jjEcAu9lvWO9NwAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 10 Jan 2023 13:19:43 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into
 cpregs.c
In-Reply-To: <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-8-farosas@suse.de>
 <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org>
Date: Tue, 10 Jan 2023 10:19:40 -0300
Message-ID: <87v8lea5n7.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: 4ZDdfa4OZwmA

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/9/23 14:42, Fabiano Rosas wrote:
>> We want to move sme_helper into the tcg directory, but the cpregs
>> accessor functions cannot go along, otherwise they would be separate
>> from the respective ARMCPRegInfo definition which needs to be compiled
>> with CONFIG_TCG=n as well.
>
> Hmm.  I would have hoped these could stay tcg-only, somehow.
> I wonder if it warrants being an ARM_CP_SPECIAL_MASK value instead of svcr_write.

In general, what characterizes as "special" for a register to use
ARM_CP_SPECIAL_MASK?

And specifically for svcr_write, it seems to me that
helper_set_pstate_{sm,za} and arm_reset_sve_state are straight-forward
enough that they could (if it made sense) be used by non-tcg code
(except they eventually call vfp_set_fpscr that still needs to be
split).

>
>
> r~
