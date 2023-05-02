Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2138148ejm;
        Tue, 2 May 2023 05:23:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4XifC9T8lrGT2hSaRySFUeHFLZWhxmBgVOPswJVLOJJsrX22RAkQa7gbQVbl5LHfAw9abk
X-Received: by 2002:adf:f4c2:0:b0:2f8:d224:c1e8 with SMTP id h2-20020adff4c2000000b002f8d224c1e8mr11657865wrp.42.1683030203936;
        Tue, 02 May 2023 05:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683030203; cv=none;
        d=google.com; s=arc-20160816;
        b=xbQyfB8RZ5z0IqG/YTguH2/I5NuZAyTgCXEE9sKikSGrIg0C94+7Z383K/dBwbLGOo
         cupLAUL3t5N3aGfHlsXY3D2bdZH2/kkpRenoGPKYLXQYso9F4x8o7M361NLBfG29yl28
         muiavq9tRir+bZapFd//s8rfGkJ+0g/pIyJUatZzdK+FnBdXIp6lKNP5/6s/JRoHjnw7
         JUz3MLfFITAshIQ+8jEhukD0G7ivHvhN/nFOAb31dfpz071ABeVSRwgUxFrhK0BlwsDQ
         qQA2jHg060O6nJ+7WU08Z9N1JwIpCiLJt9kjy07yQcTBGy+GN4O9Rpb0Jn0w5WIY5msB
         2kMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=nRzSTciWut3U5vtSMhzKMhx5dkbc8jv3YATx12wbozM=;
        b=Gf29kSUwSnwq973g4JKCzYRBWNs1WLIV5pyqo7vsTu0+thTd4B4X/WTWFD18BHEBEI
         yJ9uHcQf94aYGQ0xuKma2SmHCH32JaLsBRUBDtcEqdUISfXB23G/4X+7C/Q9BM8s3Fki
         lYUvqUwLYWhnwDziiZH3pzaoWnAt8qnbCO6eEfLy/qj+Fe0aCa9fERF/4p4w7Wgm0AFZ
         ZOpF1wZMKhYpOVm+6YGR8l5t3pX7qmcYgKO0Cs9Y3Qt0XQjbwd16ga5jA8Qr3uuUonNb
         z8fzQ7XTLlU0KyMPZXLx03Kbc3ZvBe/2Ssce+DcRbZzhF74acIxb7XgcX84oJHXyy5Zw
         JrEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=0eJien0m;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=r72wTQ6m;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id l2-20020a7bc442000000b003f348182f78si485715wmi.77.2023.05.02.05.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 05:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=0eJien0m;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=r72wTQ6m;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C8C321E55;
	Tue,  2 May 2023 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683030203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nRzSTciWut3U5vtSMhzKMhx5dkbc8jv3YATx12wbozM=;
	b=0eJien0mrtsua8yQ28VQlB6E+IS20mUSsJyLuxIDmZuoN6a5bpejqwXRvSJ9wNoWixcLvs
	Y5y7Ge2QibfGvwd91BJloY5XIrery9nbFxBWMgoPCrt6Kw0Dm8EvXrLdDPF/Kc/2HWhNID
	Jrj4YOOQ4NBSBcwBBMoJjXlD/37VVx0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683030203;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nRzSTciWut3U5vtSMhzKMhx5dkbc8jv3YATx12wbozM=;
	b=r72wTQ6m4WLVfzQ2i8rpSHd45Z4MbO0gHfR5P+IlO4x88LFRf50DAGKDKds0pN2Mht/t0N
	GT9jN2t8p+RO8YAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18EB4139C3;
	Tue,  2 May 2023 12:23:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id c47PNLoAUWQ1NwAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 02 May 2023 12:23:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v11 04/13] target/arm: Do not expose all -cpu max
 features to qtests
In-Reply-To: <2270f306-5857-5f17-f8e1-fe2f15151da0@linaro.org>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-5-farosas@suse.de>
 <2270f306-5857-5f17-f8e1-fe2f15151da0@linaro.org>
Date: Tue, 02 May 2023 09:23:20 -0300
Message-ID: <87y1m6j51j.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mlDh7x0uWGsg

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 26/4/23 20:00, Fabiano Rosas wrote:
>> We're about to move the TCG-only -cpu max configuration code under
>> CONFIG_TCG. To be able to do that we need to make sure the qtests
>> still have some cpu configured even when no other accelerator is
>> available.
>>=20
>> Delineate now what is used with TCG-only and what is also used with
>> qtests to make the subsequent patches cleaner.
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   target/arm/cpu64.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> https://lore.kernel.org/qemu-devel/ae65d59f-5e16-24bb-aece-ccdd504fe75e@l=
inaro.org/
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> https://lore.kernel.org/qemu-devel/4d744ee9-372b-c1f1-0d0f-be06b4b63c6f@l=
inaro.org/
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Ah, thank you! The 'b4 trailers' must have failed and I didn't notice.
