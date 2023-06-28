Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp26122ejy;
        Wed, 28 Jun 2023 15:01:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Xep4g7TmGKJjHzHnadA4wha0XprLVl+bRmlBsPbum/B9KqOPLfQaoel/yQW9utzq7oHeb
X-Received: by 2002:adf:fe09:0:b0:313:e6f3:d05a with SMTP id n9-20020adffe09000000b00313e6f3d05amr10677478wrr.16.1687989717795;
        Wed, 28 Jun 2023 15:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687989717; cv=none;
        d=google.com; s=arc-20160816;
        b=U4agwBg5lHvoj5Q3DSHn2t8WqbkqUH5rP126GB0aidjTGl+s9qahXrT8jAzlR29Lee
         o6Lk08lDmgv+CF1CyefguUmgxWoNEWZUGxqGZAsJebjGe4tJHFrNAOyVzuz00SJ1RF/u
         7cLMmU3J6l0aSkWs1nVZab4DrGO04IpbNbTGs/rk4F7POSVGGA9fsDF8uqLi39V9Govk
         lEgQj5KlUsuOklcYSEsJlPqML0zXXeBMP1qrXL0DdhGFdpeSBe8EuixQZWzGfUl0I3m3
         RPDaMRZ/gWU6hhwUfwxVzeMpsD3RPjVWUIP3O0Qq7t6CS6129aMEavPJmRZOBHWKxSTo
         E8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=/QC0nNCuG1ErmvbVHD5LNWqVAqPjv/diddoC/1j66KM=;
        fh=rhDcylIM5Lsq4+qov/1OPA/rY6hTzP/mDU/kd/pifCE=;
        b=i/mip9Lw+I1z6tjbrJOdTdbUEzV/gZFrwaSiXya/+JbFsvfA3Lze89ORGGDRxEUNB2
         W4zC7hdfn+JBGegaqZSOVnROmQ14b0fNpTLtOMb2uqDwpjHHn2ej/D6dyL8ZYWBiVlzH
         tYTIayv+xJoXNnS0Wv2uGSLpoA6RccjL8C/xLUmb95MrrFFk86ejA7jLp8b6r/4swxtA
         TWM/EMcSE+Spk5zFhRQLzyyTKPgsxz93Rv2/jCmZu6ZeHMC0viHkp9qrV1tF8gLj/3Uv
         koAm/KQflyvrcs7YyYf6vgshws0KGlRwABMejxMqGktFzUU+8/x3WqpiDyR+/ll5ODPX
         Mh8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=0dj5+PBG;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id d9-20020a5d6449000000b0031411e6da9bsi654276wrw.871.2023.06.28.15.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 15:01:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=0dj5+PBG;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2C14C21857;
	Wed, 28 Jun 2023 22:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1687989717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/QC0nNCuG1ErmvbVHD5LNWqVAqPjv/diddoC/1j66KM=;
	b=0dj5+PBGXdotYQY5x/p1l7nSr4+UKZ2H5HjCUti5PZmV8WCYuzr+CnYZkTLFVwIJ+cwaGg
	OCJUxkcD9nGLH44r+Ujo79J+FRb5DKF1/D6LFmMtYo1y3htlcQBLQfnRhew+2p6Gmkxfsz
	P1P6xOc9YIb3hDBLHY4NF/SnmERhT84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687989717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/QC0nNCuG1ErmvbVHD5LNWqVAqPjv/diddoC/1j66KM=;
	b=+NT79AsdR4a+ReUt4fQkEP+HX3I2amYo1FT1ZHAoBoujBYFAPOQBLjtHhBubj3hgd33AfA
	ixxWtBCkVX7FwuDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0432138E8;
	Wed, 28 Jun 2023 22:01:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 172nHtStnGSOZAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 28 Jun 2023 22:01:56 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
In-Reply-To: <87bkgzqmpz.fsf@suse.de>
References: <20230628164821.16771-1-farosas@suse.de>
 <441e8217-31ac-0fd9-1d85-e83f9fdcb3f3@linaro.org> <87bkgzqmpz.fsf@suse.de>
Date: Wed, 28 Jun 2023 19:01:54 -0300
Message-ID: <878rc3qm99.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GtFGK3Gr+4Z8

Fabiano Rosas <farosas@suse.de> writes:

> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>
>> On 28/6/23 18:48, Fabiano Rosas wrote:
>>> This code is only relevant when TCG is present in the build. Building
>>> with --disable-tcg --enable-xen on an x86 host we get:
>>>=20
>>> $ ../configure --target-list=3Dx86_64-softmmu,aarch64-softmmu --disable=
-tcg --enable-xen
>>> $ make -j$(nproc)
>>> ...
>>> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `m_sys=
reg_ptr':
>>>   ../target/arm/gdbstub.c:358: undefined reference to `arm_v7m_get_sp_p=
tr'
>>>   ../target/arm/gdbstub.c:361: undefined reference to `arm_v7m_get_sp_p=
tr'
>>>=20
>>> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `arm_g=
db_get_m_systemreg':
>>> ../target/arm/gdbstub.c:405: undefined reference to `arm_v7m_mrs_contro=
l'
>>
>> I'm a bit confused, isn't this covered by the cross-arm64-xen-only
>> job?
>
> It should be. Perhaps the CI is using different optimization flags. I'll
> try to figure it out.

Yep. The CI has -O2 while I am using --enable-debug.
