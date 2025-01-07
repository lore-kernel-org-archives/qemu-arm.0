Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp415868njb;
        Tue, 7 Jan 2025 12:14:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1Cwpa+aeQQDjb13NvP5FSihx8x33VVYa28KTMZK6XH0SSqTu0KGLuMWJS2KD2byHrL+RZ
X-Received: by 2002:a05:6402:400a:b0:5d2:7199:ac2 with SMTP id 4fb4d7f45d1cf-5d972e00032mr454701a12.2.1736280894920;
        Tue, 07 Jan 2025 12:14:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736280894; cv=none;
        d=google.com; s=arc-20240605;
        b=Wsgf2QYCDVCmc+K/BJNvsK/0cwoxj2NYWWg62KLVgjugf7DYgX3xV34pdEuMsiWOGh
         oe/fyR7EBsJRodZQIef7HX9L1eABKBIuc/ezw6y1Kxyar4DPq6oHdDChEine0Nf9cF0L
         faa+2XOBJTqODjeD8qa4PHMshSIIHnVc5wZRmhiXJKZ80QisJzgwaO3er//mJg+YWRKh
         KmVGFNE27Z6Buk3Xl/qixsUJa/c983/ETsoZ1zBZu5EyB8KIWVIMODSb7Ew3PU0LymUq
         FFhc79xJ2sxPq7NJ24hQnxWpEV9oj/tQSGeNjxDwVBf/GxzqorPjJKKcOIrA6jWSqJ7G
         AcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=Bv7BPME/5/gl0L616sWa6w6nSBNzlk/FFrlu2lR6zGY=;
        fh=ExlvOHRZJPpjHLPemG2Wvgm1zymtQq4QEdUtbS2KfQM=;
        b=ZvEhHPC0kPvcud3MrgFEKZbbbRikpYTa5kBG/yDT1mD0A1kU8X9HK6AQNQrO4C/gyQ
         KwbAmIYA8xi2AeVLWdmdeAV7Q8RWU9hs+t4di4JMe1B17ZfvsMcOOdPEEFm2XImOt5AE
         VOJ3QpPWd/3YeUuovFeEXb/79YZOhZdCK/kJD5MAixGVKAlJiWP21og7yAId7UQ/qCSh
         Dgee4VKgxaxzxv0YO8wKAI/2WkZRPh/R8AkdT4l9OpDlYzsA8NFw5aG6q/wkfosidDiK
         on2rrwwm+2MVknWrozYPZiPYT5otDnbo0sOE52YnMVm3dSgU37+ZXhgF1OnxaZzvJwn+
         9lXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rYI382XV;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=o1HXIoSt;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2a07:de40:b251:101:10:150:64:1])
        by mx.google.com with ESMTPS id a640c23a62f3a-aac0f043743si2470120966b.594.2025.01.07.12.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:14:54 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) client-ip=2a07:de40:b251:101:10:150:64:1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rYI382XV;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=o1HXIoSt;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C235521157;
	Tue,  7 Jan 2025 20:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736280894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bv7BPME/5/gl0L616sWa6w6nSBNzlk/FFrlu2lR6zGY=;
	b=rYI382XVe7ReJN1APaN0T4dFLDdV6If4aiaGLge9fKruGr5uYwWCmNYq662wwVbQyZLgkm
	BwgRhEDQ95kNdHBPJn3ZfanKa19z0Rcqk8Vd3X3mv2DBLns6FxZEl1nSn1/PIyHhOmW+F+
	045HSyCZmwBrgq1L0ivlZ2BQHTbFHZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736280894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bv7BPME/5/gl0L616sWa6w6nSBNzlk/FFrlu2lR6zGY=;
	b=BsZKxuszPjwlMId2+uEG6c8osMaW9LK9axOsdW/SkRNMU4yJGZLi4JRpdYp27uRXkKfVtl
	lb2HRNNvs/cXDJAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736280893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bv7BPME/5/gl0L616sWa6w6nSBNzlk/FFrlu2lR6zGY=;
	b=o1HXIoStLCLW+E+epHgPpfY1ejPc/MuqCJ96Fvr3TYWK34EZgccwHlHwASpVD5oJ5Q7mRL
	PA1Mlq+SmC/dPG/8V0dIXs7qdN8XC5dME2IjaJkuPOQtK8d/16yUs8cyu5Vl6VhuedS7GQ
	JEVyJAOQpk7QAJdhyhRHLMszUgDEPQw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736280893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bv7BPME/5/gl0L616sWa6w6nSBNzlk/FFrlu2lR6zGY=;
	b=XpMoZNKcxPKut/RlWUBM2xL8/dMfc7lTkFoNWKTF4Ud1rKtPIAPKaY5RVxxQQlB8YvbaYM
	AOas6kXaE76agmBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BBDD13A6A;
	Tue,  7 Jan 2025 20:14:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kCyNAj2LfWceHwAAD6G6ig
	(envelope-from <farosas@suse.de>); Tue, 07 Jan 2025 20:14:53 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Beraldo Leal
 <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>, Halil Pasic
 <pasic@linux.ibm.com>, qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Nicholas Piggin
 <npiggin@gmail.com>, Markus Armbruster <armbru@redhat.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, qemu-s390x@nongnu.org, Alistair Francis
 <alistair.francis@wdc.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liwei1518@gmail.com>, Harsh Prateek Bora
 <harshpb@linux.ibm.com>, qemu-arm@nongnu.org, Li-Wen Hsu
 <lwhsu@freebsd.org>, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Cleber Rosa <crosa@redhat.com>, Marcin
 Juszkiewicz <marcin.juszkiewicz@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>, Aurelien
 Jarno <aurelien@aurel32.net>, Eric Farman <farman@linux.ibm.com>, Pavel
 Dovgalyuk <pavel.dovgaluk@ispras.ru>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E?=
 =?utf-8?Q?_Berrang=C3=A9?=
 <berrange@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Bernhard
 Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 16/29] tests/qtest: remove clock_steps from virtio tests
In-Reply-To: <20250107165208.743958-17-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
 <20250107165208.743958-17-alex.bennee@linaro.org>
Date: Tue, 07 Jan 2025 17:12:31 -0300
Message-ID: <87ikqq4c40.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -2.79
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-2.99)[99.95%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL99m1pto7gi4rdu4g5kom7ddi)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ilande.co.uk,redhat.com,freebsd.org,linux.ibm.com,nongnu.org,semihalf.com,gmail.com,quicinc.com,linaro.org,ventanamicro.com,wdc.com,linux.alibaba.com,dabbelt.com,aurel32.net,ispras.ru,flygoat.com,vivier.eu,jms.id.au];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-TUID: pJVyny7616Vo

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> In the qtest environment time will not step forward if the system is
> paused (timers disabled) or we have no timer events to fire. As a
> result VirtIO events are responded to directly and we don't need to
> step time forward.
>
> We still do timeout processing to handle the fact the target QEMU may
> not be ready to respond right away. This will usually be due to a slow
> CI system or if QEMU is running under something like rr.
>
> Future qtest patches will assert that time actually changes when a
> step is requested.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
