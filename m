Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1743494ejb;
        Fri, 3 Feb 2023 12:35:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9ibEOgMPKMymxxubJs7cURKDMWFKOTDtyskWMcla5GjealpCL+V268rpvjsDruWrBO9JCA
X-Received: by 2002:a05:6000:68a:b0:2c3:be89:7c20 with SMTP id bo10-20020a056000068a00b002c3be897c20mr4628635wrb.3.1675456527653;
        Fri, 03 Feb 2023 12:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675456527; cv=none;
        d=google.com; s=arc-20160816;
        b=lX3Pi+XcRkRKKbwcnI6bpvMv1VuBhT5zuBPILb5JdCB/UvEOeMHPoq8jj77n4OoGck
         +/xSJJh/TJUvXcuCChKBY+GSxV8HFzCkahV6vK8pFNx6BBx+U23JGMfQJgIlEuf+FHeF
         RQG5e3ncInHpoVg1Fyr4uyTdiHdGtt/2Wo8HoXyfU9YT2PC9DqYjghI74cKxCoGhh5jy
         8v5m4V2bAeYnEpAXDiz9NLQUEucNGz8smkG8nRkSzcTmye6YUtC2v+8ogIqd9EUrTCaw
         nRNIVHoBNqzMLPIA7XOQX/1q5DZc5hCXhyXmigKka4P+xhkRxV72UQo4pWlM8biQIO3J
         NZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=t4DQXPc/X5fUbNeg2HxRM2Pr6KA5NGApVuBsRUVLFFg=;
        b=K4CQJCv8TZCOar/KyWlQbM88H1ofecz9CS8jleY4j1Qqe5keFJq7vLR/XoOoXSo8AV
         5sqgzsQNzHJMW2cU81QlgBi+vYPeAlQzHjU2SV6cabbS3RJYC9YRHnyZyMj4T6mp00Ss
         1lOgzCvKOUEuyii+sNZXbrJzAqsBA6VLaScvfdmETlA81LrRJsBBijvyGiGT8orY9wEb
         i7ZPiQ5V1EgKwlQayJCVzr40Pr7udLL8lkDh9QQY2MwJJitDNBZaF+fftyhUCc9PG0wo
         LO6K+8FdG3m0/BPsksLMYc0wIr5EDgC1pF51xiHqz4ua/mKOXxlNRRnouX/ElpmLZFkF
         TUiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FoimQh3o;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=iwd5Fgie;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id az8-20020adfe188000000b002c3cf02751esi3077581wrb.10.2023.02.03.12.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 12:35:27 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FoimQh3o;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=iwd5Fgie;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D98DA5C296;
	Fri,  3 Feb 2023 20:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675456526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4DQXPc/X5fUbNeg2HxRM2Pr6KA5NGApVuBsRUVLFFg=;
	b=FoimQh3o0l9hGPacNsJI0YN8s/0hEEnFUUJ6MEJ2KjzBud2t/PLUXLKZQau+y93CcxEgF0
	fq/GdXcW4WAToJ/LRM/v0NID85uvhOcbGYSqsX2SrVPz5dMfc8jrHzqNs7qqPK2uLKoZTf
	JDj9dz1e4A9V38px6bZPToLbwqmlb+M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675456526;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4DQXPc/X5fUbNeg2HxRM2Pr6KA5NGApVuBsRUVLFFg=;
	b=iwd5FgieWBFuIThHoiyNkDo1oBI1EsBXCXUrL6pvCLQBTRChwOHmKxrsWA0dvuHfOagYtl
	YW8XBtxRrr4/+wDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 621211358A;
	Fri,  3 Feb 2023 20:35:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MzR7Cg5w3WMrIgAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 03 Feb 2023 20:35:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: retire the Aarch64 TCG tests from
 boot_linux.py
In-Reply-To: <20230203181632.2919715-1-alex.bennee@linaro.org>
References: <20230203181632.2919715-1-alex.bennee@linaro.org>
Date: Fri, 03 Feb 2023 17:35:23 -0300
Message-ID: <87ilgia3n8.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: W66QCkz6C2NH

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> The two TCG tests for GICv2 and GICv3 are very heavy weight distros
> that take a long time to boot up, especially for an --enable-debug
> build. The total code coverage they give is:
>
>   Overall coverage rate:
>     lines......: 11.2% (59584 of 530123 lines)
>     functions..: 15.0% (7436 of 49443 functions)
>     branches...: 6.3% (19273 of 303933 branches)
>
> We already get pretty close to that with the machine_aarch64_virt
> tests which only does one full boot (~120s vs ~600s) of alpine. We
> expand the kernel+initrd boot (~8s) to test both GICs and also add an
> RNG device and a block device to generate a few IRQs and exercise the
> storage layer. With that we get to a coverage of:
>
>   Overall coverage rate:
>     lines......: 11.0% (58121 of 530123 lines)
>     functions..: 14.9% (7343 of 49443 functions)
>     branches...: 6.0% (18269 of 303933 branches)
>
> which I feel is close enough given the massive time saving. If we want
> to target any more sub-systems we can use lighter weight more directed
> tests.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
