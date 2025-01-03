Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10230784njk;
        Fri, 3 Jan 2025 07:01:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBfUjZqIJ1J/Kbg3DRyjqDTOSxe1fVE5TLl2Gz4vlYeUVNhdlOlJB9JRxwRzXXKfn9fq77
X-Received: by 2002:a50:cc46:0:b0:5d9:a62:32b with SMTP id 4fb4d7f45d1cf-5d90a620352mr3986955a12.7.1735916464231;
        Fri, 03 Jan 2025 07:01:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735916464; cv=none;
        d=google.com; s=arc-20240605;
        b=eXn/+hXWuAmEGEUnzk1u2ZmGqJPv6NkC3imy/8/O960gHCdWwfNiIo4dTAJXMhp8hP
         SNzV+F+jLPwFwxjVcW61vv6hqWhDwHhKyn1Ulw8ltPp0wE0p9bgLzV+HkOAphJAzAuM2
         LsIFuunsqGUra2Mo9Q7OaBKH2mXNUdLhUf1g2EUu9Oy0nHsR81CVSPLN+aNAKYFUcdvp
         IEwd9jlYjZoCAKC/7qbs1JPX7kxMoSsr1PmuBPVzo+7Yr70jlPZaC9eW3SL4p/pLhL6g
         02RV/5by+zkDuDvwqquvXJiz3VkF7ykgLZ1T6WIwI/0putVLksLjlO4gXXBgykDF65Ob
         X86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=JLlZhWeS7KDhoYjnDMbRZ+Mf3l5cR/S5+Yv/CL+wim8=;
        fh=cdaS+BV9DXOis9/TSnFVpPZNwUMS+OQghHJkMQKHjjM=;
        b=ShGxF+CQBEssABK53JXSVr5Z1dWJre7aTJ4pMuwYEKihLfrBAgLpLfi3UoOlovOVH7
         CLOCAtzyZzRikgnJvZfPzArEqss5jZLBSoAcy8XN4jCBpM/5RWSbOnkv7QkbI9uA+10/
         dFd3pS2ZO85LNu4LnNfCz8KqweIsT4D2RWpI/FuhTJSmaN3LTf8OkUsfYof8kjIqaCtg
         bKKFBZuSUEK+jqyhuKZrXKj7VDySoX1dqnJg8/tXXV8P1yELg6wAtWeYBKKp0zooul93
         FD8RQGW5OznFHhH3IHOF/eO53KUpC+rkWr2xJTAodZqkduo05wvfgj7zMjLiwUff8wYi
         lUZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=kyX4khkS;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=kyX4khkS;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2a07:de40:b251:101:10:150:64:1])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d806fc793dsi18970021a12.206.2025.01.03.07.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:01:03 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) client-ip=2a07:de40:b251:101:10:150:64:1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=kyX4khkS;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=kyX4khkS;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:1 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 469DC21119;
	Fri,  3 Jan 2025 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735916461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLlZhWeS7KDhoYjnDMbRZ+Mf3l5cR/S5+Yv/CL+wim8=;
	b=kyX4khkSAEUDv+MhcNO3o3hZicUcdf4F4TS/XH+TW6SVZHQQOj7AbdO1cIa8aYGRaLR6kN
	bfh/rPMwvNEaLxE6ZNdeMvLIl5reDyxwadeBsGllqoXpYgRQ9Hkf9V2jxhAHdgkGyKOv4Y
	3ji5kv0rmYpmvUUzyPADgZwIq2fTUis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735916461;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLlZhWeS7KDhoYjnDMbRZ+Mf3l5cR/S5+Yv/CL+wim8=;
	b=hEtpSnbWa7SgKPXJvhI3syEXXgpDfuvthoNW/0H/e4grTrYbaRWkVZM82MOTM6EB/P3qTL
	eXCFm0sXFUFLipBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kyX4khkS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hEtpSnbW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735916461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLlZhWeS7KDhoYjnDMbRZ+Mf3l5cR/S5+Yv/CL+wim8=;
	b=kyX4khkSAEUDv+MhcNO3o3hZicUcdf4F4TS/XH+TW6SVZHQQOj7AbdO1cIa8aYGRaLR6kN
	bfh/rPMwvNEaLxE6ZNdeMvLIl5reDyxwadeBsGllqoXpYgRQ9Hkf9V2jxhAHdgkGyKOv4Y
	3ji5kv0rmYpmvUUzyPADgZwIq2fTUis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735916461;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLlZhWeS7KDhoYjnDMbRZ+Mf3l5cR/S5+Yv/CL+wim8=;
	b=hEtpSnbWa7SgKPXJvhI3syEXXgpDfuvthoNW/0H/e4grTrYbaRWkVZM82MOTM6EB/P3qTL
	eXCFm0sXFUFLipBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B788513418;
	Fri,  3 Jan 2025 15:01:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ok/SHqz7d2fGZQAAD6G6ig
	(envelope-from <farosas@suse.de>); Fri, 03 Jan 2025 15:01:00 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathi?=
 =?utf-8?Q?eu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v6 4/4] tests/qtest/boot-serial-test: Initialize PL011
 Control register
In-Reply-To: <20250102105822.43532-5-philmd@linaro.org>
References: <20250102105822.43532-1-philmd@linaro.org>
 <20250102105822.43532-5-philmd@linaro.org>
Date: Fri, 03 Jan 2025 12:00:57 -0300
Message-ID: <878qrs7xhy.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 469DC21119
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,linaro.org:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
X-TUID: Ti6HucwuW8kt

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> The tests using the PL011 UART of the virt and raspi machines
> weren't properly enabling the UART and its transmitter previous
> to sending characters. Follow the PL011 manual initialization
> recommendation by setting the proper bits of the control register.
>
> Update the ASM code prefixing:
>
>   *UART_CTRL =3D UART_ENABLE | TX_ENABLE;
>
> to:
>
>   while (true) {
>       *UART_DATA =3D 'T';
>   }
>
> Note, since commit 51b61dd4d56 ("hw/char/pl011: Warn when using
> disabled transmitter") incomplete PL011 initialization can be
> logged using the '-d guest_errors' command line option.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  tests/qtest/boot-serial-test.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-tes=
t.c
> index bcfa504826c..6ea7e62e076 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -70,15 +70,20 @@ static const uint8_t kernel_plml605[] =3D {
>  };
>=20=20
>  static const uint8_t bios_raspi2[] =3D {
> -    0x08, 0x30, 0x9f, 0xe5,                 /*        ldr     r3, [pc, #=
8]   Get &UART0 */
> +    0x10, 0x30, 0x9f, 0xe5,                 /*        ldr     r3, [pc, #=
8]   Get &UART0 */

The comment needs updating, no?

> +    0x10, 0x20, 0x9f, 0xe5,                 /*        ldr     r2, [pc, #=
8]   Get &CR */
> +    0xb0, 0x23, 0xc3, 0xe1,                 /*        strh    r2, [r3, #=
48]  Set CR */
>      0x54, 0x20, 0xa0, 0xe3,                 /*        mov     r2, #'T' */
>      0x00, 0x20, 0xc3, 0xe5,                 /* loop:  strb    r2, [r3]  =
     *TXDAT =3D 'T' */
>      0xff, 0xff, 0xff, 0xea,                 /*        b       -4        =
     (loop) */
>      0x00, 0x10, 0x20, 0x3f,                 /* UART0: 0x3f201000 */
> +    0x01, 0x01, 0x00, 0x00,                 /* CR:    0x101 =3D UARTEN|T=
XE */
>  };
>=20=20
>  static const uint8_t kernel_aarch64[] =3D {
>      0x02, 0x20, 0xa1, 0xd2,                 /*        mov    x2, #0x9000=
000  Load UART0 */
> +    0x21, 0x20, 0x80, 0x52,                 /*        mov    w1, 0x101  =
     CR =3D UARTEN|TXE */
> +    0x41, 0x60, 0x00, 0x79,                 /*        strh   w1, [x2, #4=
8]   Set CR */
>      0x81, 0x0a, 0x80, 0x52,                 /*        mov    w1, #'T' */
>      0x41, 0x00, 0x00, 0x39,                 /* loop:  strb   w1, [x2]   =
     *TXDAT =3D 'T' */
>      0xff, 0xff, 0xff, 0x17,                 /*        b      -4         =
     (loop) */
