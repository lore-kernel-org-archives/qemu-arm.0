Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp99280njc;
        Tue, 21 Jan 2025 05:50:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjLx/pkS87fD8xQRKRAU8YH/YDuPpcnZny/FNI4a2iXWFai4u6QRWSPAvWQY147l/o6sE1
X-Received: by 2002:a05:6000:4008:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-38bf55bebd7mr16449725f8f.0.1737467437195;
        Tue, 21 Jan 2025 05:50:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737467437; cv=none;
        d=google.com; s=arc-20240605;
        b=YEp73jMfLHAmx1Y/ym8hHveumau/UWb+DU2AOMvFqJ+qxakjc8Iz6EDtJ1kkhL3xpE
         NP12JcBZmgNWpWgAr38Ui8ccWa+6lAPBhc4UoqcLcGhfv6nOe6ETq0tuc25H+Osrhbwf
         ZZNt5AdESNiCVho4by/hLcixd4acVy3Zk4QC2f66u8Fi4lNV2YcKZ08UBq9MwRkpXuPl
         A7qShUTfsubt33VyPysSs1na27u+73BI8D9SrLWJx+fO6z3/35Ff8xr2hbgWW5jE3ayj
         fPY8mnLn/HUapaARNmJ1XkKaESQRmi/6Kre9SpOqWC2lMIbeKWZ7Xdsbj2M5Meh2lMty
         o7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=tRX5FUOxVzYMcXAG+qDCvvIrO+z1A6IDexczs7hrlVM=;
        fh=yAw5fY5SLcUJR10mMR60dzrBjlSVtTyEse2avG/FNhI=;
        b=XpRkXoECnJ4elUFLTBaGliOWoi/vqlE0o06cDwkX99/T8xT3CZou6oI1LPbhGxtb5u
         FC2mVSiWA21RuwU6Wu74TeOdVgdpr0uvm/CLTHvEt6aV4+erwGQp9y91u8FLCfObIdo+
         9QGeh5gukj9eTuXcCeinwvp0rCcpoVP91sSxyaIZHqgz6b1stABGeyLE08td8cErQlXw
         Nr/Ev4ZZSBc+vC9ghLVxtImKRBCbB4XuLe+9D84MqC3e9R0A91mfu1WzblLkZWiTcFAo
         Tnn1cfSdnECn/4Z+VxHAajSTtbp+G7X+y0I8ZsIaPQJ7vKKwoKqRjuVXwSR66Rjld5kh
         OwQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZO5MRIdm;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZO5MRIdm;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2a07:de40:b251:101:10:150:64:1])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38bf3290d89si8020151f8f.681.2025.01.21.05.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 05:50:37 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) client-ip=2a07:de40:b251:101:10:150:64:1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZO5MRIdm;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZO5MRIdm;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 765C721168;
	Tue, 21 Jan 2025 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737467436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRX5FUOxVzYMcXAG+qDCvvIrO+z1A6IDexczs7hrlVM=;
	b=ZO5MRIdmlQzXFGu0q0z8PLINmh1xKIjVE+0f8ez5cTu7B4ohH3Y46cW2w6OVKrZJTUvkS9
	mc1geweFpPsm7EAoIlcpty2EQlvQJqX/03NRhP9VdqW4pgd92OR1UFsVQrlFz0bjUr3WNb
	ioUOZcFXLxqhTEiNg/vxwbUL41+h0jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737467436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRX5FUOxVzYMcXAG+qDCvvIrO+z1A6IDexczs7hrlVM=;
	b=gXkkxhOVKRWLhUJbjddbAQLljGgXDCQwXemA0XCu7o1fXhfXLiCiNhsWgfbH+CcOLbCZOD
	k0VTlV5IuwpZFjAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZO5MRIdm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gXkkxhOV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737467436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRX5FUOxVzYMcXAG+qDCvvIrO+z1A6IDexczs7hrlVM=;
	b=ZO5MRIdmlQzXFGu0q0z8PLINmh1xKIjVE+0f8ez5cTu7B4ohH3Y46cW2w6OVKrZJTUvkS9
	mc1geweFpPsm7EAoIlcpty2EQlvQJqX/03NRhP9VdqW4pgd92OR1UFsVQrlFz0bjUr3WNb
	ioUOZcFXLxqhTEiNg/vxwbUL41+h0jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737467436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRX5FUOxVzYMcXAG+qDCvvIrO+z1A6IDexczs7hrlVM=;
	b=gXkkxhOVKRWLhUJbjddbAQLljGgXDCQwXemA0XCu7o1fXhfXLiCiNhsWgfbH+CcOLbCZOD
	k0VTlV5IuwpZFjAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E3ED613963;
	Tue, 21 Jan 2025 13:50:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MxvpJyumj2cOagAAD6G6ig
	(envelope-from <farosas@suse.de>); Tue, 21 Jan 2025 13:50:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 0/7] testing/next (qtest timer stuff)
In-Reply-To: <20250120210212.3890255-1-alex.bennee@linaro.org>
References: <20250120210212.3890255-1-alex.bennee@linaro.org>
Date: Tue, 21 Jan 2025 10:50:33 -0300
Message-ID: <87y0z4e0nq.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 765C721168
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
X-TUID: 3yGbeIgUTF5Z

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> Thomas found that a number of tests fail under CFI and other exotic
> setups. The eventual realisation was that --enable-slirp masks a lot
> of timer misuse because it ensures there is always a timer and
> therefor things tend to move on (until the system is shutting down).
>
> It turns out that bc02be4508 wasn't the solution after all. The first
> few patches are clean-ups and various tightening of test expectations
> before we revert the patch.
>
> Please review:
>
>   Revert "util/timer: avoid deadlock when shutting down"
>   tests/qtest: tighten up the checks on clock_step
>   tests/qtest: rename qtest_send_prefix and roll-up into qtest_send
>   tests/qtest: simplify qtest_process_inbuf
>   tests/qtest: don't step clock at start of npcm7xx periodic IRQ test
>   tests/qtest: don't attempt to clock_step while waiting for virtio ISR
>   tests/docker: replicate the check-rust-tools-nightly CI job
>
> Alex.
>
> Alex Benn=C3=A9e (7):
>   tests/docker: replicate the check-rust-tools-nightly CI job
>   tests/qtest: don't attempt to clock_step while waiting for virtio ISR
>   tests/qtest: don't step clock at start of npcm7xx periodic IRQ test
>   tests/qtest: simplify qtest_process_inbuf
>   tests/qtest: rename qtest_send_prefix and roll-up into qtest_send
>   tests/qtest: tighten up the checks on clock_step
>   Revert "util/timer: avoid deadlock when shutting down"
>
>  include/system/qtest.h                 |  1 -
>  hw/ppc/spapr_rtas.c                    |  1 -
>  hw/riscv/riscv_hart.c                  |  1 -
>  system/qtest.c                         | 53 +++++++++-----------------
>  tests/qtest/libqos/virtio-pci-modern.c |  6 +--
>  tests/qtest/libqos/virtio-pci.c        |  6 +--
>  tests/qtest/npcm7xx_timer-test.c       |  1 -
>  util/qemu-timer.c                      | 16 ++------
>  tests/docker/Makefile.include          |  3 ++
>  tests/docker/test-rust                 | 21 ++++++++++
>  10 files changed, 48 insertions(+), 61 deletions(-)
>  create mode 100755 tests/docker/test-rust

Series:

Acked-by: Fabiano Rosas <farosas@suse.de>
