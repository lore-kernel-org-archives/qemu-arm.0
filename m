Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp22705ejy;
        Wed, 28 Jun 2023 14:51:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4aDvfsKuvcmFZNQKg57kFnD4Je7tp/fhiB4sBxdJyrK31c6uRA0lO4CUMVfjRQMANnjyYO
X-Received: by 2002:adf:f5ce:0:b0:313:f676:8343 with SMTP id k14-20020adff5ce000000b00313f6768343mr6940598wrp.60.1687989115477;
        Wed, 28 Jun 2023 14:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687989115; cv=none;
        d=google.com; s=arc-20160816;
        b=oFsRgzt5DwvPOU25cAoUcaq0fsy50kjKJGFQ2M8Ti9yL6kx+8rKcKm/yT89zN/KYLu
         B/rN8m3u4RlTn8lAPamab1SdKWosFDrQUk87ShZeVRK5kGWvw14mgwpGNsTZ183u+WI9
         thH30M4EElpevxBbxr0wccUwTwH1XnfeK9dZPklVV4ReML5pUh7ZyoG8d+45fsgQlHML
         Dy1smMP0wWLIukbBtwbe5u4gBe7/o8UCX2MkRIlLXbfpzqEz0mnXrcJW75HnV8FeHMn7
         CKDHkMIF3ig0ydx/hOaHFni298lltKtOFA352KwnadsJ/8gCZyUbR5iuMNiniOv3s9Ck
         yICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=JrmVMEKvCpwICEIOWOUY0XbVeXGFMU6QizL/dyKqd00=;
        fh=rhDcylIM5Lsq4+qov/1OPA/rY6hTzP/mDU/kd/pifCE=;
        b=TmyozhU0LLb40KRszxWC2sF514Deu1C2aGuM3+0BW2opQESPQ7VASFwtcxlaEuxBbb
         Ug3cT7KmeQcnAPBY2M5Td1OWEsuv9zG8ll1nj8t+X2MRQa/z9AdABZ6J52FwZzuQ0OH+
         ZCiA8slVWEJnm21BUUpfepHBamL43uYAMhutTeYpednMtjLOmJtQ3cOYdsx5OewgS3fH
         hw0lKYCKyz0Pm+QlrmsvFVhQH5c5jfENy3NDLWw7PE4DVGrSh0XWC7j2TdtLkP184GNN
         t2Z4hiYVTcCGd8v9EKvaPVjiPHPa/X/4jX+ThRYDyHZMZN1LgKTm+FfZGgUAPkC2wvNh
         K/hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=TkNUrNoG;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=+IHlLvhK;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id h7-20020a5d6e07000000b0030aec6a8826si7051431wrz.491.2023.06.28.14.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 14:51:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=TkNUrNoG;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=+IHlLvhK;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DAC351F750;
	Wed, 28 Jun 2023 21:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1687989114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JrmVMEKvCpwICEIOWOUY0XbVeXGFMU6QizL/dyKqd00=;
	b=TkNUrNoGxquyCD2d1KKnsRG60ulEERyE9aBxjcQD0rMJzGLVg12zKTeQhRHs8VcDeQ4vza
	z/zUuoW3njEMUpwitYtBED2TiXP7aUaPkPixUq6qaKcKxIt1Amk9C/JXEkmmmIXTYmFr8q
	BrsMrTRUzm9LOh4zIxL++nxySDrtEEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687989114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JrmVMEKvCpwICEIOWOUY0XbVeXGFMU6QizL/dyKqd00=;
	b=+IHlLvhKV00EL+UuYCY1xXfDiIBhbAUYHxsocpQFDyb5A7yWvq6dltNnpfoZRDHZIoQ8u7
	oicq2W7yqeVRdXAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 696BA138EF;
	Wed, 28 Jun 2023 21:51:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XAwoDXqrnGTRYAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 28 Jun 2023 21:51:54 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
In-Reply-To: <441e8217-31ac-0fd9-1d85-e83f9fdcb3f3@linaro.org>
References: <20230628164821.16771-1-farosas@suse.de>
 <441e8217-31ac-0fd9-1d85-e83f9fdcb3f3@linaro.org>
Date: Wed, 28 Jun 2023 18:51:52 -0300
Message-ID: <87bkgzqmpz.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: sJH6UX6qnzqt

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 28/6/23 18:48, Fabiano Rosas wrote:
>> This code is only relevant when TCG is present in the build. Building
>> with --disable-tcg --enable-xen on an x86 host we get:
>>=20
>> $ ../configure --target-list=3Dx86_64-softmmu,aarch64-softmmu --disable-=
tcg --enable-xen
>> $ make -j$(nproc)
>> ...
>> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `m_sysr=
eg_ptr':
>>   ../target/arm/gdbstub.c:358: undefined reference to `arm_v7m_get_sp_pt=
r'
>>   ../target/arm/gdbstub.c:361: undefined reference to `arm_v7m_get_sp_pt=
r'
>>=20
>> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function `arm_gd=
b_get_m_systemreg':
>> ../target/arm/gdbstub.c:405: undefined reference to `arm_v7m_mrs_control'
>
> I'm a bit confused, isn't this covered by the cross-arm64-xen-only
> job?

It should be. Perhaps the CI is using different optimization flags. I'll
try to figure it out.
