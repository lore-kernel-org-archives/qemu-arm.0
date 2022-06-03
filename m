Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5789530lfh;
        Fri, 3 Jun 2022 10:35:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxOIkm5+Dpt3pYvDh8xzw6E5lTt6X4MzzLuISVeyDPonDLg68cRh5v55paSSQaWXYdGVzE
X-Received: by 2002:a37:a14:0:b0:6a6:9192:97cf with SMTP id 20-20020a370a14000000b006a6919297cfmr4347291qkk.170.1654277722912;
        Fri, 03 Jun 2022 10:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654277722; cv=none;
        d=google.com; s=arc-20160816;
        b=xwWVhw34jkKC5vZy7QzlZPUoPptoL5jrTQEHFKTgkN6Zk2jJaSdoo64eKWEDb8cpj+
         RMFkHsnDlylaqu7LPlHwn4NRPTHF1aWoRltocc7M2VtC5Qr5saPsShEm9Zz/muDk4I6Z
         pF8luB4DIr1fguXxeiPkIm+2/GrAc7O5OrjPHdLZtoDjR6NQPycM6A6Nzf5fXXeaH6b5
         ZgybLy1AzNbyEWsajRY9cVATTiuWiQ4btqHctTj2fTbgcaAZUNP6o6kT0OTyWI59++e1
         to5vjIulHOuDkCyjSHlxidbfqMevZd0PfBBPmVu2JEvIaGIwMT9bdv8xt6muv8Q9S76L
         x2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0RSZIFmkwsmWoaCv9Of6oRtXrS2HrNOlvzF1A7Ns+gs=;
        b=baEEtULm160XluC2w8MOIRDnqJtC6eUUCXyH5EyvgMpas1LuvaiqlzmOfzuiD7uGQ3
         Zlf34KABoGoz4atyirXPkcU5EO0ep8E1d6yd2JxArNDfP9feEkfTIye3g3woR6PrO3pu
         eqsIiwnhG/ts7BP6WuSMRE9zozkMF5pfYMPV10Jbx0BRdkpMo0It2ZQAMbYJiCSninct
         3MJJ9LQ4tlrkq5DsblFWtSJdfP6KRIeOBLOvjeAzDjY9zYzHPjn2HBY4MoIrlt6JnTat
         Yl16jbCcLCl0AahzFuEft0A+25Bnwm3WeE++sZJ5K9HnBC0q7dz4Yh+huweLMcDQOdcN
         POaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ER7u/orr";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id s199-20020a3745d0000000b006a3af1c4521si3688336qka.562.2022.06.03.10.35.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2022 10:35:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ER7u/orr";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654277722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0RSZIFmkwsmWoaCv9Of6oRtXrS2HrNOlvzF1A7Ns+gs=;
	b=ER7u/orrmXnXP7LGM1rcSvE3LYlvHQWP+4NoLGAa9B6UhAhztJhP9s8Tl+z1sEW5CkaOze
	qHBzaKin0g7oipStR5gQH9HGgFa9/HEC654JOC5ZxaFFeclgkN/7m1j9wD31pFLbYqtTG/
	RyRlP6LUJC6Apk01tC/W+3sEsMIDCqc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-1OopIeJ9N3iaotBFEiFAwA-1; Fri, 03 Jun 2022 13:35:21 -0400
X-MC-Unique: 1OopIeJ9N3iaotBFEiFAwA-1
Received: by mail-wm1-f71.google.com with SMTP id ay1-20020a05600c1e0100b0039c3a3fc6a4so1716621wmb.4
        for <alex.bennee@linaro.org>; Fri, 03 Jun 2022 10:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=0RSZIFmkwsmWoaCv9Of6oRtXrS2HrNOlvzF1A7Ns+gs=;
        b=dWQ5L+sfexaiFoyLqXJPXttJynrDmlUHTc4cAYMudLIlEs6It9rnWStObYrqO3Tiim
         DpSSl5tvFiLgt8TR5tlJTbmXTGj88GIjNrBMpgYLV0zOvz+8iZV/PSSYLT653r3TirHZ
         S1+1UZIbv3Ceq2S2VxLsu2pHXnk7Lz+Sd8uvXqgjqfYnS0wYfry+rReLeB1Z/U51smK2
         17QyfG8dZQ4EaxYzvNaJKNZaW8NQ6nzclHR/nofDegVV8W0Bprdrh7buoJyLMltLS/vt
         sZxGN82IJNiWI6fIzX20o45T2YW+3P6ccu4exUCb11poMNgcboIq7Kd322WTiU/S/4nn
         CFdA==
X-Gm-Message-State: AOAM533kBcv3PpGYBieVHrbfI7qjtnehCMEMbCKZTUg4RlRddvmfClWK
	BSmci7L1/IQnsCn5xyWqUZi7YN9cXfoJRMSaK1MjszXId2vY3ubvkXWZH5xrhy2SSUDs+Z8zAxH
	1q6FOU1vR3d/ZDSCL
X-Received: by 2002:a05:600c:1e14:b0:397:476d:1602 with SMTP id ay20-20020a05600c1e1400b00397476d1602mr39643892wmb.65.1654277715954;
        Fri, 03 Jun 2022 10:35:15 -0700 (PDT)
X-Received: by 2002:a05:600c:1e14:b0:397:476d:1602 with SMTP id ay20-20020a05600c1e1400b00397476d1602mr39643871wmb.65.1654277715652;
        Fri, 03 Jun 2022 10:35:15 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.104] (tmo-098-213.customers.d1-online.com. [80.187.98.213])
        by smtp.gmail.com with ESMTPSA id m14-20020adff38e000000b0021030c9d5c5sm7793679wro.91.2022.06.03.10.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 10:35:15 -0700 (PDT)
Message-ID: <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
Date: Fri, 3 Jun 2022 19:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] disas: Remove libvixl disassembler
In-Reply-To: <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: oLMCv9xtf3JX

On 03/06/2022 19.26, Claudio Fontana wrote:
> On 6/3/22 18:42, Thomas Huth wrote:
>> The disassembly via capstone should be superiour to our old vixl
>> sources nowadays, so let's finally cut this old disassembler out
>> of the QEMU source tree.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> agreed, one thought: at the time I added this thing, I had to add C++ compilation support,
> maybe something we can now drop if there are no more C++ users?

I thought about that, too, but we still have disas/nanomips.cpp left and the 
Windows-related files in qga/vss-win32/* . And I think Paolo was considering 
to use C++ for coroutine fixes - not sure whether that still is planned, though.

  Thomas
