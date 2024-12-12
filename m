Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4745149njb;
        Thu, 12 Dec 2024 04:34:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3hf31D3T/Atsa/IkFNX6564O2c/jUgQp61q0p3OCKKyKuWqieXG7wYboN/w8dlO7kvA8P
X-Received: by 2002:a17:907:7710:b0:aa6:bcc2:4da1 with SMTP id a640c23a62f3a-aa6c1ae4b65mr393967466b.7.1734006882988;
        Thu, 12 Dec 2024 04:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734006882; cv=none;
        d=google.com; s=arc-20240605;
        b=WsfZiDsYYrRxUVjLra2l1s80bMsvMn2DNX1Y9KvQt5e6QEco4z7FDccVJRSpoRvHkH
         n95UdqZuuBccCNc+1yk2Y1YN6UjTExU3MsGwF07tOaLbZNLXrPHrWtHE8e8QR5WgO2ZX
         rDxbcDPe8p++H1jVgqRs6ELlasZmS1y7RLscPvSj0nvjFaes7pB2E3/ZOu4a3giP4trm
         FQygRMu+imfmbNS3oWIYfodOMHlmX+K3LY8H0tkw0mfVfWpQi6UWrgWIjLbaJzcAxEEl
         ICig+QUYiNjdqTMLufao5glRavOva56Y/KNFUMtOw8fnkDmwDFBGQj4TgSRh+vj/6JB3
         eyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=PTAymOVEaL8bvIneGRCaEdJ+Wyy38EPkvob6i+Vnpwg=;
        fh=be10PWYm7NJp5JT8wg0ZleECAJNPqJqY8RAC1yKC/70=;
        b=LhfuMUW4DWucWJjdYC/eQVrWNY69Fr4NehmqnRVQL0wWQAYg7oD1iNKH/rlAJYMlBG
         jooqMjpCzzpWYxeF0BPodm8q5PLmWjp6lVvuarIkvopv7T/9CJsojBrm5e7REnucepjd
         cwr01V7IwwD+M2lz+XeakFQ2PaenM0lH5AZ1yPd1WI3hw5kulWp1ZwniegUs0qWEbt2Q
         P2ZL0ZQ1xInyQpbV4tfrJs6A3lDo3KiuRFw2nNV2vr9togph7hf3q1LW8nNf2WSD/On4
         5AfLKOrUTHSpckg6r35a5Ea67NZ1g4jnGggrtTHzwO+/okIyAOo3iEobOaFjr57cvJa9
         UFcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=bhNzNAkq;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=UI1bjYww;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=bhNzNAkq;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=UI1bjYww;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2a07:de40:b251:101:10:150:64:1])
        by mx.google.com with ESMTPS id a640c23a62f3a-aa6b4943e0csi226265366b.701.2024.12.12.04.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 04:34:42 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) client-ip=2a07:de40:b251:101:10:150:64:1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=bhNzNAkq;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=UI1bjYww;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=bhNzNAkq;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=UI1bjYww;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31DC12118C;
	Thu, 12 Dec 2024 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734006882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTAymOVEaL8bvIneGRCaEdJ+Wyy38EPkvob6i+Vnpwg=;
	b=bhNzNAkqn0MgJhARMTYdtNFXnqsXQyg29pN4f49cCn1ZNxN/fEXjiQu4rpVf2KdS2eVjVU
	VZDZaHNKK2qMVHi390sAsAXzLBwKaCHrMgYgyiQFLrsk/avY3M8taoG/0E/rVoiTLUnB4v
	ImGBrT+oIAhBqzJCQufZzCvb1knHM6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734006882;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTAymOVEaL8bvIneGRCaEdJ+Wyy38EPkvob6i+Vnpwg=;
	b=UI1bjYww+U3FA2WDBMfhujcRdM6OaOPAInL6o73bbE/6taUpA5cFGF8NvVzGrBNF/lNlkj
	4z8vSGFAQpt7pXDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734006882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTAymOVEaL8bvIneGRCaEdJ+Wyy38EPkvob6i+Vnpwg=;
	b=bhNzNAkqn0MgJhARMTYdtNFXnqsXQyg29pN4f49cCn1ZNxN/fEXjiQu4rpVf2KdS2eVjVU
	VZDZaHNKK2qMVHi390sAsAXzLBwKaCHrMgYgyiQFLrsk/avY3M8taoG/0E/rVoiTLUnB4v
	ImGBrT+oIAhBqzJCQufZzCvb1knHM6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734006882;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTAymOVEaL8bvIneGRCaEdJ+Wyy38EPkvob6i+Vnpwg=;
	b=UI1bjYww+U3FA2WDBMfhujcRdM6OaOPAInL6o73bbE/6taUpA5cFGF8NvVzGrBNF/lNlkj
	4z8vSGFAQpt7pXDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70DF013939;
	Thu, 12 Dec 2024 12:34:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wSaAG2HYWmfMSgAAD6G6ig
	(envelope-from <farosas@suse.de>); Thu, 12 Dec 2024 12:34:41 +0000
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
Subject: Re: [PATCH 17/20] tests/qtest: move clock_steps to after checks
In-Reply-To: <20241210204349.723590-18-alex.bennee@linaro.org>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
 <20241210204349.723590-18-alex.bennee@linaro.org>
Date: Thu, 12 Dec 2024 09:34:39 -0300
Message-ID: <87msh1f5b4.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL99m1pto7gi4rdu4g5kom7ddi)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ventanamicro.com,nongnu.org,linux.ibm.com,flygoat.com,gmail.com,linux.alibaba.com,redhat.com,dabbelt.com,quicinc.com,linaro.org,aurel32.net,jms.id.au,ispras.ru,semihalf.com,ilande.co.uk,wdc.com];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,linaro.org:email]
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-TUID: hYWpuWbsQb+3

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> In the qtest environment time will not step forward if the system is
> paused (timers disabled) or we have no timer events to fire. As a
> result VirtIO events are responded to directly and we don't need to
> step time forward.
>
> Potentially the clock_step calls could be removed all together but as
> we may implement async behaviour later lets just move them to after
> the principle check for now.
>
> Future qtest patches will assert that time actually changes with a
> step is requested.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
