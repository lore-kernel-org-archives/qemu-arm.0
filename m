Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10207653njk;
        Fri, 3 Jan 2025 06:21:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKNq3ei8wyQ4Tsi4K64TUiat/IxyibyzzHZh3rwECgbxmJGiecYuoIQoIV01+gcoH+wrCE
X-Received: by 2002:a05:6000:1889:b0:385:ef14:3b55 with SMTP id ffacd0b85a97d-38a22a4c485mr35042886f8f.19.1735914063244;
        Fri, 03 Jan 2025 06:21:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735914063; cv=none;
        d=google.com; s=arc-20240605;
        b=jkAUyTma7xliwGVANkSumodDlumf1SxWYI2QVNB3hfe4+f4oX4wGid/OlikJugQEUn
         K4jPbhLhZv7UtJVwYBcG7wXt8POEyMY9WVmoWmii/+lF+igoS8h5sp+QTZujw8daFZCm
         1u6ZiAQQwXwKH5VRvfD57tQKWElLMyTb19iLh2oPZulvit+iwVzqRILGbpTv46t9S3u3
         uyICxga7pt8mUhLXPCPhz3qCvLZWzNh8aD3eJdpuN4wv1edQQs9xTEd+q9797Hcj6bYr
         krEzfR/iYynoTrXmgGMPcU0EI9gBIFxnkpLqfY7DQtBtia8YuycfGMqBiYWomKASDQpn
         +xMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=SXkHskpI745sEWSXAas671BVqGiHsaGtOA5Rp24toB4=;
        fh=cdaS+BV9DXOis9/TSnFVpPZNwUMS+OQghHJkMQKHjjM=;
        b=fjkYXLNZGOLPsE0PdaGBAF4ItG2vwoK9VCQyJqk1fsTJtN+XBhwO1yp4Ye3VUC6rHh
         9e+3Zz/Z3V4Mkf10VJg8UhPYo6wXjojyklTDJhsg0k+3/UF2dNsE36SC2Zs3LVdq1fTG
         CqJQ2G68pQjc22fX58u4pzIcteCXAAYgeqlWiugkSgfYM0LB5XlIckO2bJIgv7CHLPyt
         Nc+uj9LrU6/3POdNBONfk4gnUrrrcmrBF5b0C1zgJQYFSNyTYN8VGWpwsLWQLYx+K1aS
         KNnRhd2WNFkAN8zNg4yujTwa6JDHvajFlRJeKEjhqdasZEv5NFGuJafzVGWfbCQiszb7
         1xeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=I9erZ6qo;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=I9erZ6qo;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.223.130 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.223.130])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38a1c8b84e8si20445189f8f.326.2025.01.03.06.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:21:03 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.223.130 as permitted sender) client-ip=195.135.223.130;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=I9erZ6qo;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=I9erZ6qo;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.223.130 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 54530210EE;
	Fri,  3 Jan 2025 14:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735914062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXkHskpI745sEWSXAas671BVqGiHsaGtOA5Rp24toB4=;
	b=I9erZ6qoIYiNuiUA3EpOon/EssvWW8ZuSy1azxwdyt0mzZP1fV5oMD9cD/6ueyRiOhzW39
	tbpYidzVVMKvZT81HNCUdatD+8KNmVke/eUJrw1z2o0er65nXQvxONE3bfkHpQD7lOnPLQ
	QiZZIimZXh8BUompqrcJFsaz2j0QMbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735914062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXkHskpI745sEWSXAas671BVqGiHsaGtOA5Rp24toB4=;
	b=flpfRDVkAu1eBGu42G1Oj5wKsvPm76dqA+/prGY2DVyBL9//AgMevvyNnpQpvhFce3RVoo
	c1eoozQLTKJ7gPBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735914062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXkHskpI745sEWSXAas671BVqGiHsaGtOA5Rp24toB4=;
	b=I9erZ6qoIYiNuiUA3EpOon/EssvWW8ZuSy1azxwdyt0mzZP1fV5oMD9cD/6ueyRiOhzW39
	tbpYidzVVMKvZT81HNCUdatD+8KNmVke/eUJrw1z2o0er65nXQvxONE3bfkHpQD7lOnPLQ
	QiZZIimZXh8BUompqrcJFsaz2j0QMbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735914062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXkHskpI745sEWSXAas671BVqGiHsaGtOA5Rp24toB4=;
	b=flpfRDVkAu1eBGu42G1Oj5wKsvPm76dqA+/prGY2DVyBL9//AgMevvyNnpQpvhFce3RVoo
	c1eoozQLTKJ7gPBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE0A5134E4;
	Fri,  3 Jan 2025 14:21:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V05kJE3yd2cXWwAAD6G6ig
	(envelope-from <farosas@suse.de>); Fri, 03 Jan 2025 14:21:01 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathi?=
 =?utf-8?Q?eu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v6 1/4] tests/qtest/boot-serial-test: Improve ASM
 comments of PL011 tests
In-Reply-To: <20250102105822.43532-2-philmd@linaro.org>
References: <20250102105822.43532-1-philmd@linaro.org>
 <20250102105822.43532-2-philmd@linaro.org>
Date: Fri, 03 Jan 2025 11:20:59 -0300
Message-ID: <87h66g7zck.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Level: 
X-Spamd-Result: default: False [-4.24 / 50.00];
	BAYES_HAM(-2.94)[99.76%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.24
X-Spam-Flag: NO
X-TUID: gMT2MYEDNCB0

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Re-indent ASM comments adding the 'loop:' label.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
