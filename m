Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10209927njk;
        Fri, 3 Jan 2025 06:24:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFav6NjlNj7L+1uu+aDuN6rXiXFu0dC5EVtTYwHZrj+RJHys3M4JYl7dQre8T/586xOSE1u
X-Received: by 2002:a05:600c:4f92:b0:436:488f:50a with SMTP id 5b1f17b1804b1-43668646896mr451737275e9.17.1735914297630;
        Fri, 03 Jan 2025 06:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735914297; cv=none;
        d=google.com; s=arc-20240605;
        b=KdwwWgkbZRnPBQixuRbVhs2urykKEgzR+4uWtYjiQR2obtjpgbAW+63Tte1QWuSFRi
         6582CYBTcnIpA5tsZNEiK5x7C7TL+JQuQQ+gFMhdamTguRf/pPZ2TbCJZStVmFyeXp1D
         VdC9wQevZV722z/pMBCc05ea118sPjDsU+h14v/iIPPnCDbf8q0KLR+BEyKr1YB8xlA/
         jpraXRFV+q/o/1kGIRuqYGZMNggwGdofOkhLYP3s4+ZYcaHm5OIJnX6+V7JzuX5Roeva
         9D3tHdnsSXDNg3ilSefoQL8OWeQtXk3Y0JUffOUV+ZjrWva1g7OUDp3Ov7ODZ4fJkUBx
         akVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature
         :dkim-signature:dkim-signature;
        bh=rcMrzQcZ7L6DKtOjgNZCFYnkQYfFI4acBM5KL6MCMiw=;
        fh=cdaS+BV9DXOis9/TSnFVpPZNwUMS+OQghHJkMQKHjjM=;
        b=fQ+33pz7X4W1eFTWOPcZeOROVMo2Pa/ZkNR0+LaofCZJTlWRvIgxf3CGf9CmJqgCp2
         2Myv6x0V1qF71vDzU88c1McYtozxw8nMPYKH6Ae6sSKpZnqCUPxy35AtbOx3Dee9LlwZ
         BqL7ae0pNU/A53Ajb6aNRH4OlBOttrygN/Q60LStdNhMG0BNy2H++sDOxixZITyabuvr
         pzLm+dDWTSXP7RRlrla4QDgPbd5abmPPA6NyVa1tMVGrX/29HC3G7twL40MXNoxCPJmB
         Nb87ahtcHREt1ESLBbOvSBl/gYjXGf+qe1b7N5drDgmqHcDiePc6FS5FFVkps8rG//XT
         fzHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="GF/8SKxa";
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ragd99zE;
       dkim=neutral (no key) header.i=@suse.de header.b=YVGtLLD4;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:2 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2a07:de40:b251:101:10:150:64:2])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43656aea657si228689835e9.24.2025.01.03.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:24:57 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:2 as permitted sender) client-ip=2a07:de40:b251:101:10:150:64:2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="GF/8SKxa";
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ragd99zE;
       dkim=neutral (no key) header.i=@suse.de header.b=YVGtLLD4;
       spf=pass (google.com: domain of farosas@suse.de designates 2a07:de40:b251:101:10:150:64:2 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE7FB1F38E;
	Fri,  3 Jan 2025 14:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735914297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcMrzQcZ7L6DKtOjgNZCFYnkQYfFI4acBM5KL6MCMiw=;
	b=GF/8SKxaObaMTLXxjBiOczVuh0kGnlfK8Yhw6ciTy2Tol1M7Vv12XoatztL/2JKENv1f+9
	HBjJFjswSBpmmAeKKALl+tEkZBXOXwVGAujwvAzT4E26g/Ws2Mcj7k576vJsb5p3PabqEd
	FZdPXCYVgMjYRRDqhSpA+eIlU2znlss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735914297;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcMrzQcZ7L6DKtOjgNZCFYnkQYfFI4acBM5KL6MCMiw=;
	b=atTJ3y3l4n5lXQOoR8Hy9QOG26s72O/I1u+9cyQX5CUz55BWBx1137rXQaH+q/+5bujYaA
	Juv42iS/eoYimSAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ragd99zE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YVGtLLD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735914296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcMrzQcZ7L6DKtOjgNZCFYnkQYfFI4acBM5KL6MCMiw=;
	b=ragd99zEKewav2ucvPilWtrGDugzjrCWp/j14RmeCCHdqtQBU0j6j3BjKgBmchTvGe0b9+
	Wacykb1Gl6Evd+wU88hsUO5ZEOa7CG7Ze3cIxIBSrjOYcmHReemUYIDEaqm1E15f1JYbtB
	13PSXNvtOaeT11YFyMUVIBSO7TXrwok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735914296;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcMrzQcZ7L6DKtOjgNZCFYnkQYfFI4acBM5KL6MCMiw=;
	b=YVGtLLD4zpLVQZBMiXD/ifcEqR7FL4xOj7y/W2FuvgjhKuy9SzTFrVDpuCFRuxpIk3O4bC
	FIip1KiYEouH1JBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 55B4A134E4;
	Fri,  3 Jan 2025 14:24:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4O4RBzjzd2cnXAAAD6G6ig
	(envelope-from <farosas@suse.de>); Fri, 03 Jan 2025 14:24:56 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathi?=
 =?utf-8?Q?eu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v6 3/4] tests/qtest/boot-serial-test: Reorder pair of
 instructions in PL011 test
In-Reply-To: <20250102105822.43532-4-philmd@linaro.org>
References: <20250102105822.43532-1-philmd@linaro.org>
 <20250102105822.43532-4-philmd@linaro.org>
Date: Fri, 03 Jan 2025 11:24:53 -0300
Message-ID: <87bjwo7z62.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CE7FB1F38E
X-Spam-Score: -4.46
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.46 / 50.00];
	BAYES_HAM(-2.95)[99.80%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
X-TUID: OYvF4JQ0J4Kj

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> In the next commit we are going to use a different value
> for the $w1 register, maintaining the same $x2 value. In
> order to keep the next commit trivial to review, set $x2
> before $w1.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
