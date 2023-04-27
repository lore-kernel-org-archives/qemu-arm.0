Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp395005ejm;
        Thu, 27 Apr 2023 06:16:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5PrZ7TTm4PtUpGXH8bBoDLuLuo/QxXBX+4In789hk4gf2XhtE7MNvLOwhLjtKrrYcmr3XV
X-Received: by 2002:a05:600c:c1:b0:3f1:7581:bba3 with SMTP id u1-20020a05600c00c100b003f17581bba3mr1470296wmm.10.1682601411671;
        Thu, 27 Apr 2023 06:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682601411; cv=none;
        d=google.com; s=arc-20160816;
        b=B4+lPGmrLbjg3X1yAcEt+YaFJSWcHCYjBIbsJsa14tPPs11PnDx0GuR/hvAqXscVZQ
         sf7S7VPKS64q4k98hYOJKmfVfFsToMeJY4KR48+UC5McOnBshjf5IaxTBzt3RttNG+Ww
         psL6SOYrmr+93/EFt8qCtNCvDiFcAnNJ22T8SqgpH5TJcgMDahtl3SnsUyBQN8+DsIEs
         P3TM3M7nwRBpwqpSr6IPxDP0Esc/aIHFhoH05CfQcb38Lqv/o0wknfh7BGd716lrbpog
         /XbF8Xhp5Tvg+gQqEnfkOR50HtazXpZqVrRrI7xlCo8iBaf/gOk5Q/afaCeAJBxSfabV
         1mcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=MX6UVE4mjzxG9yyliZyZZXDI0qRbdsD1I4FO143MM78=;
        b=Mk8Qov6AUv2lB+Em8n1VXGMebdbVuwIku5AtWlX0z56wc7d8TfPEiY3DW29eTgdhrx
         s0k1qs870W690MYxrrL/aqKQPlB3Vitfz4eWkI1i3Mt5mSkqX+YqF6pPEvscQ52nrn4f
         OGkrH1tutD1Yhq8lotoUjfli7Rrc/CYKXm9ugAdAaUpciVF5bQ7r7djx0T6EsV2Sbiby
         4XuzBHrmRnhEGR/GtW63dybeH/biUGhX6RNnBJAAjmAiiB/fRMkIVTYjnmPvl0xBrmWR
         uPW/9DiidKKTc0ClinQ3CUueahzTxW55pVxtukHnjiZKmuPSAIRVhkEeyDukiPE7jdIE
         gWGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=z36CFUnj;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id 9-20020a05600c228900b003f16ce29c20si11548226wmf.143.2023.04.27.06.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 06:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=z36CFUnj;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4CD8821B34;
	Thu, 27 Apr 2023 13:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682601411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MX6UVE4mjzxG9yyliZyZZXDI0qRbdsD1I4FO143MM78=;
	b=z36CFUnj8VFVgi37lLzTYRvr+6OjlKh8Og7SEhuI6LmproqH01NMl89QGSpCnQRu3NCwlr
	Yljtf02M6z26IPjDongNyx+WP1Dx+ef4aUnSkOkpkYkktExOGZc7+NlfTq7+oozMC3xtAG
	XJTwPbbwB5luY+/M2W6stf1RcoY/Mpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682601411;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MX6UVE4mjzxG9yyliZyZZXDI0qRbdsD1I4FO143MM78=;
	b=E0DzPQk6dGBGxxtCS3ZwVfi7ZmeP03GaNSMnAtFlNBHs9sKOJCayKYey2+siNfJjbtRvlJ
	5GxSNLNo8zq7/wBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4453138F9;
	Thu, 27 Apr 2023 13:16:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KjPxIcJ1SmSDcAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 27 Apr 2023 13:16:50 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
In-Reply-To: <c2853e95-2aec-246a-5846-d91d40329c61@linaro.org>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-7-farosas@suse.de>
 <c2853e95-2aec-246a-5846-d91d40329c61@linaro.org>
Date: Thu, 27 Apr 2023 10:16:48 -0300
Message-ID: <87a5ytpirj.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: iBkLH2bFzVsW

Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/26/23 19:00, Fabiano Rosas wrote:
>> We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
>> query-cpu-model-expansion test to check against the cortex-a7, which
>> is already under CONFIG_TCG. That allows the next patch to contain
>> only code movement.
>>=20
>> While here add comments clarifying what we're testing.
>>=20
>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>> Suggested-by: Philippe Mathieu-Daud=C3=A9<philmd@linaro.org>
>> ---
>>   tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
>>   1 file changed, 17 insertions(+), 3 deletions(-)
>
> I don't see why you're changing the cpu model here.
> Neither cpu will work, of course, but why change?
>

Because there's already a patch in master that puts the cortex-a7 under
CONFIG_TCG, so I can have the whole if/else in this patch.

If I keep the cortex-a15, this change needs to go into the next patch
("move cpu_tcg to tcg/cpu32.c") which moves the rest of the 32bit cpus,
which was supposed to be only code movement.
