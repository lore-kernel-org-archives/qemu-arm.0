Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1195391njk;
        Wed, 18 Dec 2024 12:10:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFawbC2KTgF5ehd1tYwr8e+6idr0eV62f6+IvVjIXlvGQp1a0TegM8augGaFsFzJUfFF/z9
X-Received: by 2002:a05:600c:1caa:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-43655341274mr37485475e9.6.1734552640903;
        Wed, 18 Dec 2024 12:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734552640; cv=none;
        d=google.com; s=arc-20240605;
        b=cAgytzgovD6ZGME2QFQSsM7a2W/0XsD0bFdrpgeWOYsHOlj/56Gf/w/NRjmZ1u/BAo
         isMhT+KnoSDttBugCIqwopyhqNLwbivuCxIoyaL0voWuNs7hGTUa35JkOY/lk3CXcrry
         aXcyotYRBnCoiJWUdJFeJR/jRzpb1KPIUGIad5Qu6/r8JHHKHQE+CHXpD33L+C+hPB0Y
         6jS6TkO/izIedhWpSsLVWMRLZc6N3thSoKWDNKe1vSjIUaz/8PWEGmwyhZ6eLfePcCaD
         N1edBC0DNjdrAxTiCqyxOcaKw7Q0Kkehm4ywwxEplGMVTH0JvaVk++jMvPoCRKyLCsce
         wCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=tdYTLtosx3DqqhtmSGHqs7uSuX/xc70ZhSw0PZXO9r0=;
        fh=W9PHk9wwCQzcpRmRdauRouOlMU9yXVxn55BbaY1ruLE=;
        b=RjV/CZSKvD1aHP3uT+VAOL0tcCXBHziLuTpmfWkidW8fmcKsRdJyIm0CZwVV2UERGv
         p4X0J0t9Pfxzelvt7J6ZR7QxwHD22wPkUucGPutZafYt28Nn41VIBjqoEE9uHm71tO6B
         ZBWVvcvUSs6BAiKsqUImpmenv0sUDxVpVknrkLlexDXtAEekBZYfdbK7ZYVff52xvrFQ
         eOXEaXlxk3GRIjdZUG/qFZ4UUYlnuXIuWm0zC4DfpZnnLHtdl46QsPXT+6qB7P9BPCKB
         f4yFoNrEN7Zx3fb7Tnd0KabJP6tdSD35PuXQNv3iQVCM3mGDPxmq6+AZGQMF2ttGeSHx
         5rZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=E77inyaK;
       dkim=neutral (no key) header.i=@suse.de header.b=vF3m4Ngy;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Xy6IKisM;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.223.130 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.223.130])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43656b1b716si14163575e9.175.2024.12.18.12.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 12:10:40 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.223.130 as permitted sender) client-ip=195.135.223.130;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=E77inyaK;
       dkim=neutral (no key) header.i=@suse.de header.b=vF3m4Ngy;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Xy6IKisM;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.223.130 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CE6EF21163;
	Wed, 18 Dec 2024 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734552640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdYTLtosx3DqqhtmSGHqs7uSuX/xc70ZhSw0PZXO9r0=;
	b=E77inyaKdXVnFOlyoTR4LpR/t5hf7kesWZ6zsI+PJLGy9WPQwNkHlldM64ZNIDvLM/T699
	CrFrEfaxqz+pXeIP33+eGAGykmQGmc2tygtFkWBWhy94HwvLdcN/RkZOR3gzdLqgVAg/1K
	jYuuVvEfRio39FMBGCyrzQ42dNPMsec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734552640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdYTLtosx3DqqhtmSGHqs7uSuX/xc70ZhSw0PZXO9r0=;
	b=vF3m4Ngy5MI8uXlhqnsb5QEeGhz9u+ftcISFLN3Z6lXRHy9PF6PbHos2KMxexet5+gc7ZO
	hn657jlTzmnFY2Ag==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Xy6IKisM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JxdAqtVH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1734552639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdYTLtosx3DqqhtmSGHqs7uSuX/xc70ZhSw0PZXO9r0=;
	b=Xy6IKisM84j0M9H9oBskJySyBoqxy9SV/ZbYxMoqvx6JAIVfpyZt6+6iykDDpEMxaIzy5X
	DqxiE++kaTvaoN/qCtpQRtSZBx0uHKFvpfV5+FpHLppdV5YatyVGlXzGE9iOI86zOdCuWx
	wpTFwOawScpWLqpZl/5RNy4YWSaxmso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1734552639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdYTLtosx3DqqhtmSGHqs7uSuX/xc70ZhSw0PZXO9r0=;
	b=JxdAqtVHMg46v2mZxHH1lxiudTtfqb1zkM73F5AI6GSnY1JUIoCJ28g6FNXD1V1hAGSW6P
	C2sq0Jt+9TDjozDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DC45137CF;
	Wed, 18 Dec 2024 20:10:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gnMwBz8sY2fqCQAAD6G6ig
	(envelope-from <farosas@suse.de>); Wed, 18 Dec 2024 20:10:39 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Ed Maste
 <emaste@freebsd.org>, Eric Farman <farman@linux.ibm.com>, Thomas Huth
 <thuth@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>, Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Radoslaw Biernacki <rad@semihalf.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>, Joel Stanley
 <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li
 <liwei1518@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, Cleber
 Rosa <crosa@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, John Snow
 <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, Laurent Vivier
 <laurent@vivier.eu>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Richard
 Henderson <richard.henderson@linaro.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org, Laurent Vivier
 <lvivier@redhat.com>, Alistair Francis <alistair.francis@wdc.com>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 18/27] system/qtest: properly feedback results of
 clock_[step|set]
In-Reply-To: <20241218162104.3493551-19-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
 <20241218162104.3493551-19-alex.bennee@linaro.org>
Date: Wed, 18 Dec 2024 17:10:36 -0300
Message-ID: <878qscvjk3.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CE6EF21163
X-Spam-Level: 
X-Spamd-Result: default: False [-2.98 / 50.00];
	BAYES_HAM(-2.97)[99.86%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_CC(0.00)[redhat.com,freebsd.org,linux.ibm.com,ventanamicro.com,aurel32.net,semihalf.com,ilande.co.uk,linaro.org,nongnu.org,gmail.com,jms.id.au,flygoat.com,quicinc.com,dabbelt.com,linux.alibaba.com,vivier.eu,ispras.ru,wdc.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL4imt8pjjaa6sqn3s4gq691sb)];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.98
X-Spam-Flag: NO
X-TUID: bJy7aEgcudiF

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

Reviewed-by: Fabiano Rosas <farosas@suse.de>
