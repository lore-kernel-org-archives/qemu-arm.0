Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2670325ejb;
        Tue, 28 Mar 2023 06:55:57 -0700 (PDT)
X-Google-Smtp-Source: AK7set8J1zKheiLNG4eNvlZB3e04Q2NomO8pxb0ADu/XdysOzh1O3Rr+JesFZ4QAJmYEr2oS2l7g
X-Received: by 2002:a1c:4b07:0:b0:3ee:ed5:6115 with SMTP id y7-20020a1c4b07000000b003ee0ed56115mr12433513wma.19.1680011756991;
        Tue, 28 Mar 2023 06:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680011756; cv=none;
        d=google.com; s=arc-20160816;
        b=lie/QZEJjJLpJeH4hoIyCVxa8l9W4KZpn8ixZaOPcdq/4aL6wGv6JthF43njvfY8UO
         jyxzK4XKY+9YUa3KoPboGJDpEG/cdmf62Zh02vzJnb17OOkLdfbHv+DwM/XSvaNL8lFF
         6I3P24MYJgldq/lrObRm53tyfBUXL/C13H0PXFT5Syx0ULtF8pcoRzPO3+zuzOb6cJXS
         eRNsPXtrCIGg9adywt/KeQRaaZRtrgDoKl/t+Noq7tOcsLNmVpgy0soo6fbQVbTajb50
         Amxyl5XoZ++gZOFZ0xsc63T55K/7p0K7EphF0XnjC3ukQC9GaoTgpUiPgzltBWGdN8tV
         DHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=idYHYkWgWJ0+4LEeTOA5LJ6nmIJvL4Ua2OrxV/oUzGI=;
        b=CECRmM1l/LlET3CxStJToKL7UYt5fr6eyJxZ3PwFKZ/M5XgQk318Q8g1qob7WZ4VZm
         vQIrh3JpRyjAugC0jbdP05m0zPyQ0r5k+RDltfKgBEm/J/6IsycOevqr55o9mrcdPQ8e
         VJa5BSC5AIEHfRyI4/wDq+M+fYK9s9JZcgvXzpTo2o2orvbLSgA5Fe2gN5vEE7pI8MYt
         GpaputeCv2+Npoh/hRGzFsnSi1mFcR3rvxCIhfwAqNex+js0G2txSl3JKnYs8YfimIKb
         7n+wl16YKB4h5XXFHUSm5xGJ5aBxT8/SpEShDA2NccVFDYo51lXC/f/cP1kOY4+FnX4O
         Rjvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=OaxryXsM;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=erBpNlpQ;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id u13-20020a05600c210d00b003dc5301b8cesi11579595wml.165.2023.03.28.06.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 06:55:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=OaxryXsM;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=erBpNlpQ;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5BF1A21A19;
	Tue, 28 Mar 2023 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680011756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=idYHYkWgWJ0+4LEeTOA5LJ6nmIJvL4Ua2OrxV/oUzGI=;
	b=OaxryXsMnXM4MDpxRFIs0Mpe9/1Dl3rwJwQo/nBPfGoMN5NyiBgPg9pbQDL4BWhT4WJC2t
	fFHX3cS+o+XYTpEAKsat8O3+ab4zx0yUWjn+X7jJgrulkjVuXHBnnsojjVwMBJmFCM5Kft
	txVJz25+wvlTKA103rSFFTTEKT468Qo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680011756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=idYHYkWgWJ0+4LEeTOA5LJ6nmIJvL4Ua2OrxV/oUzGI=;
	b=erBpNlpQS/T4qs0v+DSFc4j8QLf3mnGjVAEFUf0SWJWzzZwu6aZSZHEsv6luacgBiWFYhr
	CG7kvAm/t67zluBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D76DA1390B;
	Tue, 28 Mar 2023 13:55:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id nhFPJ+vxImTfZAAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 28 Mar 2023 13:55:55 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Claudio Fontana <cfontana@suse.de>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH-for-8.0 v2 2/2] target/arm/pauth: Inline
 pauth_param_mask() and pauth_ptr_mask()
In-Reply-To: <20230328133054.6553-3-philmd@linaro.org>
References: <20230328133054.6553-1-philmd@linaro.org>
 <20230328133054.6553-3-philmd@linaro.org>
Date: Tue, 28 Mar 2023 10:55:53 -0300
Message-ID: <87h6u5vv2u.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: EdbgJD/Xleog

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> aarch64_gdb_get_pauth_reg() -- although disabled since commit
> 5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
> gdb") is still compiled in. It calls pauth_ptr_mask() which is
> located in target/arm/tcg/pauth_helper.c, a TCG specific helper.
>
> To avoid a linking error when TCG is not enabled:
>
>   Undefined symbols for architecture arm64:
>     "_pauth_ptr_mask", referenced from:
>         _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>   ld: symbol(s) not found for architecture arm64
>   clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
>
> - Rename pauth_ptr_mask_internal() as pauth_param_mask() and
>   inline it in "internals.h",
> - Inline pauth_ptr_mask() in "internals.h".
>
> Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
