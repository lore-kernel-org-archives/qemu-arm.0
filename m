Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp1600071njb;
        Thu, 9 Jan 2025 07:11:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWxbFDnjbljbMoXnZPEBD4OGUjbt82CgEwSPiuDCwy/pg346P2aNF2A1hH8dDg8M71jO0fc2NpaGapUmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGZ8usaDhA13PonmsOY0FwqmDO/6s+QkjebxgOxMlwLIMU3ACdr83k7Oz9e1eSOJG10+6tG
X-Received: by 2002:a05:6000:1f85:b0:385:e411:c894 with SMTP id ffacd0b85a97d-38a873377b2mr6743278f8f.43.1736435478500;
        Thu, 09 Jan 2025 07:11:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736435478; cv=none;
        d=google.com; s=arc-20240605;
        b=gNdgWsX8EjXUUY4Dz9SYcqjqtLjlQWJGS/EHLFW+6ImljRDN6e6uHzo4A9yiBzuSpS
         pBf/Sp09CEWaus3ekBukkWTGQcrvl4hfAL/swLTnhtkyBmFs/kZHHkrCgOROz9CnHvAI
         Ogd/EBQFAhRSJ5r7Lx3nFX2bjGcYgiNLSMelr/y9NYFmE1lwFykZgUTBdC9Lkuu+c547
         1wJP0Yu9fxW2Th4xomzqmH8AGMRsCYRpyNoLgRwWbWhJO4D6paxlfiYYIrjwG6q8qf6y
         FkYHIuwiQr+0gEIp1W0y2xZWsDbiCYCwJqJmbRwi3FEKui0zE92eiDGtxU0OpMVBQ2US
         BpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=o6UgPtE26aeisqzYug7JbgLjE/TGY7sBW4j6jlkYaAY=;
        fh=7HMh6lBZCopz6hsCMi4Nr1uykbFiegKUN8x54gO7kUc=;
        b=ctp8EEqaWtkBCxtjwJRuBLWwJ4Mjfa9J5Lreq1h0SHfm+FYruU+skWqeYT++50tDIC
         eMuHW9gndrP/C/7PERo79btd0cy57IHaHFkQcQJGHfFc7g3SCv0h2orzjD6DCI7/f+6k
         Yse4g/QN+9zsdBT3yZLhhvundJKF6cBxR7+bmd0g9ZGTcTY/rtLZprlu1DPZqH9WmM0A
         MBd+q/Kz7HwbDXw7oUzCi64No03nVdocODYT/yYF1kSZeQJbvCtVVdZ8F9P/jr8l7Cj5
         ldPUWNYPEYepF6JzEtoSD1iNnKboCecUmjS8vBiJ3IL9p/4bwFBNZYGokMwM2YC1nIDJ
         Qp/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=qES5gMST;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=qES5gMST;
       dkim=neutral (no key) header.i=@suse.de header.b=NEHUQnEd;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.223.131 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.223.131])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38a8e4c7df5si1071714f8f.344.2025.01.09.07.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:11:18 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.223.131 as permitted sender) client-ip=195.135.223.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=qES5gMST;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=qES5gMST;
       dkim=neutral (no key) header.i=@suse.de header.b=NEHUQnEd;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.223.131 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AEB801F453;
	Thu,  9 Jan 2025 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6UgPtE26aeisqzYug7JbgLjE/TGY7sBW4j6jlkYaAY=;
	b=qES5gMSTf2ZD3SGBuC3x977i2bF4/y/PN8dZJ242o85R3CbX6/cGgsVAV8vJjOtkHFgapb
	o+VkMpTp9IqHubbTqctzX3qX3vX0sMj1lJzCuRNqlKYYMYDJEvYJ6SNTuzrZIw8Ck7/+s4
	F5Dmz8Yy9eJxtROeE+cDoVidVdGK7ZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6UgPtE26aeisqzYug7JbgLjE/TGY7sBW4j6jlkYaAY=;
	b=NEHUQnEd53wYQlactAhmJpO6yQwVUQEDo6/9xSVY7REz+PjmE/UFWlWNMwyFZFLGcctZKT
	LXtEmCE4tQIa4/Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qES5gMST;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NEHUQnEd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6UgPtE26aeisqzYug7JbgLjE/TGY7sBW4j6jlkYaAY=;
	b=qES5gMSTf2ZD3SGBuC3x977i2bF4/y/PN8dZJ242o85R3CbX6/cGgsVAV8vJjOtkHFgapb
	o+VkMpTp9IqHubbTqctzX3qX3vX0sMj1lJzCuRNqlKYYMYDJEvYJ6SNTuzrZIw8Ck7/+s4
	F5Dmz8Yy9eJxtROeE+cDoVidVdGK7ZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o6UgPtE26aeisqzYug7JbgLjE/TGY7sBW4j6jlkYaAY=;
	b=NEHUQnEd53wYQlactAhmJpO6yQwVUQEDo6/9xSVY7REz+PjmE/UFWlWNMwyFZFLGcctZKT
	LXtEmCE4tQIa4/Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 355FD139AB;
	Thu,  9 Jan 2025 15:11:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /uLsOhTnf2e7bQAAD6G6ig
	(envelope-from <farosas@suse.de>); Thu, 09 Jan 2025 15:11:16 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Gustavo Romero
 <gustavo.romero@linaro.org>, Samuel Tardieu <sam@rfc1149.net>,
 qemu-arm@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [RFC PATCH] tests/qtest/stm32l4x5_usart: Avoid accessing NVIC
 via MMIO
In-Reply-To: <20250107192637.67683-1-philmd@linaro.org>
References: <20250107192637.67683-1-philmd@linaro.org>
Date: Thu, 09 Jan 2025 12:11:13 -0300
Message-ID: <87wmf42fam.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AEB801F453
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
X-TUID: SDiivZGRjOik

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> The STM32L4x5 SoC family use a ARM Cortex-M core. Such
> core is architecturally tied with a NVIC (interrupt controller),
> having the NVIC MMIO mapped in the core address space.
>
> When using the QTest accelerator, we don't emulate vCPU, only
> a dummy is created. For now, QTest is only supposed to access
> MMIO devices mapped on the main 'SysBus'. Thus it shouldn't
> be able to access a NVIC MMIO region, because such region is
> specific to a vCPU address space, which isn't available under
> QTest.
>
> In order to avoid NVIC MMIO accesses, rather than checking
> UART IRQs on the NVIC, intercept the UART IRQ and check for
> raised/lowered events.
>
> The sysbus USART1 IRQ output is wired to EXTI #26 input.
> Use qtest_irq_intercept_out_named() to intercept it, count
> the events with qtest_get_irq_lowered_counter() and
> qtest_get_irq_raised_counter().
>
> Remove the then unused check/clear_nvic_pending() methods.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> Based-on: <20241216141818.111255-7-gustavo.romero@linaro.org>
> "tests/qtest: Add API functions to capture IRQ toggling"
>
> This patch is to fix the problem reported by Fabiano when
> removing the &first_cpu global in qtest, see analysis in:
> https://lore.kernel.org/qemu-devel/05820c9b-a683-4eb4-a836-e97aa708d5e5@l=
inaro.org/
>
> Note, while writing that patch I noticed a problem with the
> b-l475e-iot01a machine. In bl475e_init() somes output GPIOs
> are wired twice. The EXTI outputs are passed to the SoC with
> qdev_pass_gpios(), and few are re-wired to the various output
> IRQ splitters. I'll open a GitLab issue so it can be cleared
> later.
> ---
>  tests/qtest/stm32l4x5_usart-test.c | 33 +++++++-----------------------

What about these other ones?
stm32l4x5_exti-test.c
stm32l4x5_rcc-test.c

>  1 file changed, 7 insertions(+), 26 deletions(-)
>
> diff --git a/tests/qtest/stm32l4x5_usart-test.c b/tests/qtest/stm32l4x5_u=
sart-test.c
> index 927bab63614..35622e9434d 100644
> --- a/tests/qtest/stm32l4x5_usart-test.c
> +++ b/tests/qtest/stm32l4x5_usart-test.c
> @@ -46,26 +46,7 @@ REG32(ICR, 0x20)
>  REG32(RDR, 0x24)
>  REG32(TDR, 0x28)
>=20=20
> -#define NVIC_ISPR1 0XE000E204
> -#define NVIC_ICPR1 0xE000E284
> -#define USART1_IRQ 37
> -
> -static bool check_nvic_pending(QTestState *qts, unsigned int n)
> -{
> -    /* No USART interrupts are less than 32 */
> -    assert(n > 32);
> -    n -=3D 32;
> -    return qtest_readl(qts, NVIC_ISPR1) & (1 << n);
> -}
> -
> -static bool clear_nvic_pending(QTestState *qts, unsigned int n)
> -{
> -    /* No USART interrupts are less than 32 */
> -    assert(n > 32);
> -    n -=3D 32;
> -    qtest_writel(qts, NVIC_ICPR1, (1 << n));
> -    return true;
> -}
> +#define USART1_EXTI_IRQ 26
>=20=20
>  /*
>   * Wait indefinitely for the flag to be updated.
> @@ -195,6 +176,8 @@ static void init_uart(QTestState *qts)
>      /* Enable the transmitter, the receiver and the USART. */
>      qtest_writel(qts, (USART1_BASE_ADDR + A_CR1),
>          cr1 | R_CR1_UE_MASK | R_CR1_RE_MASK | R_CR1_TE_MASK);
> +
> +    qtest_irq_intercept_out_named(qts, "machine/soc/exti", "sysbus-irq");
>  }
>=20=20
>  static void test_write_read(void)
> @@ -221,7 +204,7 @@ static void test_receive_char(void)
>      g_assert_true(send(sock_fd, "a", 1, 0) =3D=3D 1);
>      usart_wait_for_flag(qts, USART1_BASE_ADDR + A_ISR, R_ISR_RXNE_MASK);
>      g_assert_cmphex(qtest_readl(qts, USART1_BASE_ADDR + A_RDR), =3D=3D, =
'a');
> -    g_assert_false(check_nvic_pending(qts, USART1_IRQ));
> +    g_assert_cmpuint(qtest_get_irq_lowered_counter(qts, USART1_EXTI_IRQ)=
, =3D=3D, 0);
>=20=20
>      /* Now with the IRQ */
>      cr1 =3D qtest_readl(qts, (USART1_BASE_ADDR + A_CR1));
> @@ -230,8 +213,7 @@ static void test_receive_char(void)
>      g_assert_true(send(sock_fd, "b", 1, 0) =3D=3D 1);
>      usart_wait_for_flag(qts, USART1_BASE_ADDR + A_ISR, R_ISR_RXNE_MASK);
>      g_assert_cmphex(qtest_readl(qts, USART1_BASE_ADDR + A_RDR), =3D=3D, =
'b');
> -    g_assert_true(check_nvic_pending(qts, USART1_IRQ));
> -    clear_nvic_pending(qts, USART1_IRQ);
> +    g_assert_cmpuint(qtest_get_irq_lowered_counter(qts, USART1_EXTI_IRQ)=
, >, 0);
>=20=20
>      close(sock_fd);
>=20=20
> @@ -251,7 +233,7 @@ static void test_send_char(void)
>      qtest_writel(qts, USART1_BASE_ADDR + A_TDR, 'c');
>      g_assert_true(recv(sock_fd, s, 1, 0) =3D=3D 1);
>      g_assert_cmphex(s[0], =3D=3D, 'c');
> -    g_assert_false(check_nvic_pending(qts, USART1_IRQ));
> +    g_assert_cmpuint(qtest_get_irq_lowered_counter(qts, USART1_EXTI_IRQ)=
, =3D=3D, 0);
>=20=20
>      /* Now with the IRQ */
>      cr1 =3D qtest_readl(qts, (USART1_BASE_ADDR + A_CR1));
> @@ -260,8 +242,7 @@ static void test_send_char(void)
>      qtest_writel(qts, USART1_BASE_ADDR + A_TDR, 'd');
>      g_assert_true(recv(sock_fd, s, 1, 0) =3D=3D 1);
>      g_assert_cmphex(s[0], =3D=3D, 'd');
> -    g_assert_true(check_nvic_pending(qts, USART1_IRQ));
> -    clear_nvic_pending(qts, USART1_IRQ);
> +    g_assert_cmpuint(qtest_get_irq_raised_counter(qts, USART1_EXTI_IRQ),=
 >, 0);
>=20=20
>      close(sock_fd);
