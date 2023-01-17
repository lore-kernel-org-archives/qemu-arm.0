Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2661720ejc;
        Tue, 17 Jan 2023 11:01:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvU8XgULLp3qYBRtFDZgbJxcL9dyA1XW2V2yYHHemYvvbaTin2FSPTWvogUnUR7KchY1TVH
X-Received: by 2002:a05:600c:4e12:b0:3da:fb0b:8496 with SMTP id b18-20020a05600c4e1200b003dafb0b8496mr4044980wmq.34.1673982090163;
        Tue, 17 Jan 2023 11:01:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673982090; cv=none;
        d=google.com; s=arc-20160816;
        b=Xqymys74X87yxwa1C13JYJkRRsFg5mcX4BnVey7nIoJL4GmBYLUWR6adQluJWsCKXZ
         xmTCUOF6FB+fhIBV73x8jYsjSsUZFLXZttUe7xS/3vpwANp3bH2IYeybBAI+/AZAb+EJ
         u4XBJILZ8rU4qpZ3u/JOq690hF9qIaY0bTfz6cod40D5xlBgvSzB9TSt8UKL4sq0YUUM
         3xIFYsCiMucrG4vaYRxyZzvL8e4qWI16gqvy7a+gk71DckY0oexWLka31rCs7rRgwQZQ
         MY0zW604IpWURNh55WxiVIyEPWcSkzrbwVX1iLNp0ADOhiE3aSXEu1AtAlQbaI6CW/u0
         JuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=iThEnDTET59x2sUomagCvKmMSdatwdYlv/6+dzSVev4=;
        b=Qbw1zmnMgFdGgaqv4HU+SJB6DIT0bp8e3CTZvSKAycVQAm4klruc8EXsXN649p67AJ
         kY6GFRYNyqPzUACuwBDhLyG0B4Buy9Bq0JQNl0UQX8dIjDSuXOW+EQ42MyJfxabJqGyx
         X2+Kx8SyK4auN+Z4gPYdaDNj3Zptnx7zvou+UKCO6hHU+k1HziYmQAXeFOmxnzcljCUK
         G75aMXad7H5K3FfHoIBJRg/d5Gd9w1rTMT1tvUrdJgJevWaKlGowZ13aNkvQQ3eVkDTQ
         uEIT0PlJT+yb92SybUWePUGhbbqd1wZgbMNH1dx5xV3QGVStwFJNUQd1jsXztjDeTcO6
         YqYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=LZi5ix13;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=odVFiV6z;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id t14-20020a7bc3ce000000b003d220627bd7si25399147wmj.163.2023.01.17.11.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 11:01:30 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=LZi5ix13;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=odVFiV6z;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BA6EF1FF51;
	Tue, 17 Jan 2023 19:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673982089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iThEnDTET59x2sUomagCvKmMSdatwdYlv/6+dzSVev4=;
	b=LZi5ix13e1mTv2wyG5lYWvHceHGy9wTVpIILt0JwA1KqDL6+Sn0dzrGxBA5KH1vV61avRA
	yUBg+gDl7u8mIMc7z9a9pzsviwG3egD4Uph6MYLyTkCGa4TES+fX2Qd0QyV5Ig2XDMp02C
	UpIczJwKyQRIb4j6GxS7CqKh90tqrGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673982089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iThEnDTET59x2sUomagCvKmMSdatwdYlv/6+dzSVev4=;
	b=odVFiV6zXT4E4D1YVMiVO4I9kYPZrKd6KxuVFChS88pgQlX2AsXKoCyWWjkXdtF7cXWkzZ
	i00qgPqkTomAuoAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4750A1390C;
	Tue, 17 Jan 2023 19:01:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8sB4BInwxmN3OgAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 17 Jan 2023 19:01:29 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
In-Reply-To: <bafc45b7-f42a-a500-053f-65f057a14cc1@linaro.org>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
 <bafc45b7-f42a-a500-053f-65f057a14cc1@linaro.org>
Date: Tue, 17 Jan 2023 16:01:26 -0300
Message-ID: <87bkmx0yux.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8GY2Tles1QLO

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 13/1/23 15:04, Fabiano Rosas wrote:
>> The cpu_tcg.c file about to be moved into the tcg directory. Move the
>> code that is needed for cpus that also work with KVM into cpu.c.
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   target/arm/cpu.c     | 76 +++++++++++++++++++++++++++++++++++++++++++
>>   target/arm/cpu_tcg.c | 77 --------------------------------------------
>>   2 files changed, 76 insertions(+), 77 deletions(-)
>>=20
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> [...]
>
> TYPE_IDAU_INTERFACE is ARMv8-M specific, so TCG AFAIU.

Hm.. QEMU doesn't start without it. There might be some implicit
dependency. I'll check.
