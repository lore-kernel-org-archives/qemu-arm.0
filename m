Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4746152njb;
        Thu, 12 Dec 2024 04:36:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG23L4r3KbVNoWLwCWedGgpJ0mLml8tUZWOpIYGfFN+AmvdMAw6DnHsFB+6jzoLniBzuqq7
X-Received: by 2002:a05:6000:4023:b0:385:f840:e630 with SMTP id ffacd0b85a97d-3864cec38ffmr5053717f8f.37.1734006993648;
        Thu, 12 Dec 2024 04:36:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734006993; cv=none;
        d=google.com; s=arc-20240605;
        b=NlSqfpbjHqejhYzzRJCrIZgB4QkM7GuURV6BXFjQ5ez8AIiuAjO74c2pvLDveFW5Db
         cLYSO5v8HJwl0AwVe/xalLz+HzTQQM/y/RymlMFgtXwJBS7iAmoLO9+6J4Fic5I0aoq7
         BR3Lq8xLRyf7gUczJRdNz9Z6TKmvFjPsLtc1vaC9YvarwkjsQGklKqes9M82zlLkj4bs
         0OAo5gI7nrtEkjTCHe40clQxNF+bRG9lnI6yAkPpBE3MIcX4j8ub6BmA5xhLR9MWuHuB
         d100Itg9Wc0UuCe6AUQaQ13x8E8/t4AbmVV+vRoTrO62Xmih0RnyjG7ZfPOX1fStoiim
         eqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=G5rb0zuzG1zX+tx5ZdfNxy+q2cVTEdQUFsA/RUY4S08=;
        fh=be10PWYm7NJp5JT8wg0ZleECAJNPqJqY8RAC1yKC/70=;
        b=DQJOZE47MiVIpoEDRJGhxLEqsLupj+ws2voxA5f1oUFx5UZmsQTt6tnPqX7ky8Z4ff
         W6RYqkc5NoqvKDfZeXyzTQGNbDT/K1VtcTN4+yrwtDv2sJxXg6hcq80YZKEuPRG8sP0v
         sB1zICRZC6pBU2iaGP9aGqLRJo8hcVst9KJvbDv6awwwxgFyTyNZ3LTAsqF8LpKuRvXN
         QFt6Krj2YwhzX7UWLLnofFgKTRQwIzUOUsBWyOIRPVVkZ3Fhjt4YzdRo/H62531vl4Hy
         AhhfmNuZaHDwFcyWqBA1tIffT2BZ9zI9w8RkqvRHyXy2bm9MOp2kw6kdmixcoTxUForY
         P2AQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FFDJgShw;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=k8XEafpC;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:2 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2a07:de40:b251:101:10:150:64:2])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3878253a652si1730459f8f.759.2024.12.12.04.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 04:36:33 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:2 as permitted sender) client-ip=2a07:de40:b251:101:10:150:64:2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FFDJgShw;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=k8XEafpC;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:2 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 811A51F74A;
	Thu, 12 Dec 2024 12:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734006992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5rb0zuzG1zX+tx5ZdfNxy+q2cVTEdQUFsA/RUY4S08=;
	b=FFDJgShwC/teAFpyazR41IxgRH6RNEj0X965BkFbWJeWJKGiXNFMtE/lmo1TgO07dOdFZI
	+AKuWudhDtWS+YWDA53910xB6Oow0EmptboxE2Dt72GbkKDOzTbYpzst+gih6p14HB0TKu
	H0xes4dt61sTmeOr2QkXqqHOePJ39NY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734006992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5rb0zuzG1zX+tx5ZdfNxy+q2cVTEdQUFsA/RUY4S08=;
	b=p2zFaBT/8vxj9gaEKRqQMgq6I7PV6st3vprsZvoTNEESrJ5mu/F9C9tMDl/bdtEgWGRkk4
	E6YR6wauK3MgY2DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=k8XEafpC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=129bsKRN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734006991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5rb0zuzG1zX+tx5ZdfNxy+q2cVTEdQUFsA/RUY4S08=;
	b=k8XEafpC51n86f9MW2wJdxt1zTAxzfnfI1ivSkPwCJgDFRGMpxY5tVWNleKXMvWlkFUwbX
	Bj+QIiHsO5l+PYLm7IdSwETvs7oov9XpK7bRHaCXxY+hFqTq5Fzbux0S6ofICAfAKK2SF3
	9EbYEqMn2DhktTli+7I6kkcHW5F7GAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734006991;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5rb0zuzG1zX+tx5ZdfNxy+q2cVTEdQUFsA/RUY4S08=;
	b=129bsKRNjg8Dka6AO1SHLHzj29duiv1/Jv22WcEogeFcVYU8YasalFTYNG8hlgXA8UA2Dw
	DnuJkRukLBp5KnAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA21C13939;
	Thu, 12 Dec 2024 12:36:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VYdSLc7YWmdYSwAAD6G6ig
	(envelope-from <farosas@suse.de>); Thu, 12 Dec 2024 12:36:30 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Eric Farman <farman@linux.ibm.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, John Snow <jsnow@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Harsh Prateek Bora
 <harshpb@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>, Paolo
 Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>, Bernhard
 Beschow <shentey@gmail.com>, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Beraldo Leal <bleal@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, "Michael S. Tsirkin"
 <mst@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH 18/20] system/qtest: properly feedback results of
 clock_[step|set]
In-Reply-To: <20241210204349.723590-19-alex.bennee@linaro.org>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
 <20241210204349.723590-19-alex.bennee@linaro.org>
Date: Thu, 12 Dec 2024 09:36:28 -0300
Message-ID: <87jzc5f583.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 811A51F74A
X-Spam-Level: 
X-Spamd-Result: default: False [-2.81 / 50.00];
	BAYES_HAM(-2.80)[99.15%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ventanamicro.com,nongnu.org,linux.ibm.com,flygoat.com,gmail.com,linux.alibaba.com,redhat.com,dabbelt.com,quicinc.com,linaro.org,aurel32.net,jms.id.au,ispras.ru,semihalf.com,ilande.co.uk,wdc.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TAGGED_RCPT(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL4imt8pjjaa6sqn3s4gq691sb)];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,gitlab.com:url,suse.de:email,suse.de:dkim,suse.de:mid,linaro.org:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.81
X-Spam-Flag: NO
X-TUID: 5ftufOmr/ZZV

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Time will not advance if the system is paused or there are no timer
> events set for the future. In absence of pending timer events
> advancing time would make no difference the system state. Attempting
> to do so would be a bug and the test or device under test would need
> fixing.
>
> Tighten up the result reporting to `FAIL` if time was not advanced.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2687

Acked-by: Fabiano Rosas <farosas@suse.de>
