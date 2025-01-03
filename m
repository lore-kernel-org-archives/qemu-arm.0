Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10209301njk;
        Fri, 3 Jan 2025 06:23:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQvuCsf3Hokiw/6y26uAzTFjPaRVJZfECR8e+YUeYDwub5MK4YZa256RnN66X1gBphUrYX
X-Received: by 2002:a5d:584b:0:b0:385:fb40:e57b with SMTP id ffacd0b85a97d-38a221ea3a0mr44674386f8f.15.1735914236444;
        Fri, 03 Jan 2025 06:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735914236; cv=none;
        d=google.com; s=arc-20240605;
        b=ebNUoz5G1xh3IJ7AGKAjpIw7hU3VgTJ8Ccl8CHDAkq/b65clSmxuwl8WVf9gauBUjR
         Blp8W78mDi1daQTX6krSFhOQDqu55PWeIFn0167n5X/VIyfkXoUNDZnmzoY2us+b9ywv
         my1BNzfzCB/Cctjp9x1psHBDB8ZXKetdUwol7TMGNLKyZWS2xPitA9lC2cMGCirTscty
         TEwbUoSCl+kvPzqrIFSqwlScLLKJO2z7VlaNp/9qe7Rk2Z5Q9qf/91o04/TpSNf4Ew5+
         Lcm09Yr2MOzfuOqa4+jmIGfvvkCt3IHryfXgLjI3qzAabgG0w6XUF4Gq/66LfDG4a+AL
         3UgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=GHVnQFXxVvW2+JU1tVsEDoToQVemvao2RFVeUK7VKEI=;
        fh=cdaS+BV9DXOis9/TSnFVpPZNwUMS+OQghHJkMQKHjjM=;
        b=GR7FBcToUtJqUfIHhnhHue7E2YytZQ7KUE9gEm7WBiaQbWW7Hz1AtHkvH1NCWK3QoK
         dggQSixJFTOQPu1xr+Zai9qKgMebo9fP3lbDhV/Hw48/ic5IhFtCUFGnsGLxRX5adK4t
         MyrCjZHNNNRqLvAyARbRUsPlZUFH90FvyeBGYRkpPlC81g46yfYDkU/UUZ4Wz2tfLgCC
         xxyXj+q+EyFKJkK0qV8dMWtMVwkaG8KZt5yEpvq4sk7TVTiaxxTzX7Zz3xFOHAu4QBq3
         5Wlf+/Nsi3cQadcMlJLGxbejsxseiHYnLjSjJ58b/ALhYCmM1R7yy6gaqt7lJPq9Yc7Q
         tiQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RP2JQsBN;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RP2JQsBN;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:2 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2a07:de40:b251:101:10:150:64:2])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38a1c832ecfsi20287681f8f.218.2025.01.03.06.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:23:56 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:2 as permitted sender) client-ip=2a07:de40:b251:101:10:150:64:2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RP2JQsBN;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RP2JQsBN;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:2 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 809171F38E;
	Fri,  3 Jan 2025 14:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735914235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHVnQFXxVvW2+JU1tVsEDoToQVemvao2RFVeUK7VKEI=;
	b=RP2JQsBNqi6EAOA9W4fzs8pu1EYFYNKEq3e25ieZxtjkmvcLo7IwQ6EtzU3aXzBC19RreX
	V5K4wObRJjWIZ1a0wbQnT7le/LrnoqrJi4A2kAxx+OmD1Nq+3MMAfabkzA4a23OaA8W1v6
	KKxTN+1156zOcr+3V/oIvh6/TPWklq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735914235;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHVnQFXxVvW2+JU1tVsEDoToQVemvao2RFVeUK7VKEI=;
	b=F66f749DWnZflnj5c+t4D9Rwyda7DtqLpr4Iw+/Tm8Ur0E2Xk0fHVE00nsb07mkgyn6odL
	SLtofB8UEKR1XxDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735914235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHVnQFXxVvW2+JU1tVsEDoToQVemvao2RFVeUK7VKEI=;
	b=RP2JQsBNqi6EAOA9W4fzs8pu1EYFYNKEq3e25ieZxtjkmvcLo7IwQ6EtzU3aXzBC19RreX
	V5K4wObRJjWIZ1a0wbQnT7le/LrnoqrJi4A2kAxx+OmD1Nq+3MMAfabkzA4a23OaA8W1v6
	KKxTN+1156zOcr+3V/oIvh6/TPWklq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735914235;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHVnQFXxVvW2+JU1tVsEDoToQVemvao2RFVeUK7VKEI=;
	b=F66f749DWnZflnj5c+t4D9Rwyda7DtqLpr4Iw+/Tm8Ur0E2Xk0fHVE00nsb07mkgyn6odL
	SLtofB8UEKR1XxDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 02DA4134E4;
	Fri,  3 Jan 2025 14:23:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iltYLvryd2fiWwAAD6G6ig
	(envelope-from <farosas@suse.de>); Fri, 03 Jan 2025 14:23:54 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathi?=
 =?utf-8?Q?eu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v6 2/4] tests/qtest/boot-serial-test: Reduce for() loop
 in PL011 tests
In-Reply-To: <20250102105822.43532-3-philmd@linaro.org>
References: <20250102105822.43532-1-philmd@linaro.org>
 <20250102105822.43532-3-philmd@linaro.org>
Date: Fri, 03 Jan 2025 11:23:52 -0300
Message-ID: <87ed1k7z7r.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -4.28
X-Spamd-Result: default: False [-4.28 / 50.00];
	BAYES_HAM(-2.98)[99.91%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-TUID: Hh8jnqtFj68N

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Since registers are not modified, we don't need
> to refill their values. Directly jump to the previous
> store instruction to keep filling the TXDAT register.
>
> The equivalent C code remains:
>
>   while (true) {
>       *UART_DATA =3D 'T';
>   }
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
