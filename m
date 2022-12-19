Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3308217ejb;
        Mon, 19 Dec 2022 00:37:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ACOAQdlPk2eWdam4RCZSBVRNu2XVC8vZo9Ny0WQZFXIyCJTJrRkbbehqX0YEcLwAm27T5
X-Received: by 2002:a05:600c:4494:b0:3d2:3d3c:46f7 with SMTP id e20-20020a05600c449400b003d23d3c46f7mr14153373wmo.30.1671439035887;
        Mon, 19 Dec 2022 00:37:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671439035; cv=none;
        d=google.com; s=arc-20160816;
        b=bLoCmTBccpsb305XZI6W11wF1t7+zGXmKZcGjM59kGzErGKC7RusDDXGjPHZq261hc
         xLAVel9wcPLv25rre3+4eQzRHLXfdg6/EXC5uBzLPcdhc6sfc5Y/fAJbmRVpr6brPnh2
         tguxITRCJLDTFDhqawgmSIyxEoccUrYP/7dW33lJFR0a419/AiWM8HyNfrrbN2Lt8Ja1
         4/moe0V2UTnleRHU/GQdG1yD0RjGvhpp5k6ye2qTP7R5Gr0AlYyCLoGBeg25mOiwcq+0
         2MhuypfqDdi5i7slqdwnLW2IlUk082WDmidk1l3epoqBCjcXapkIlPR+ux9UJmcch8PQ
         Vv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature:dkim-signature;
        bh=Dowq7wSc/L44cg36b3WmRU6zilRnAfGjvafq1GvVXQk=;
        b=Y3sEXKhluLxKhXTiqrW7l7kqUZBL2SwJ6Upt16XZ5yxvbwNyTadaYGegWePI0PIbVt
         lV/IilCai7fnZjqUO3ImtulkpNFOTc09rpP1upxIYzHW5dsBUBshCfN8te3OpfWPlkb1
         xVDP1/x1Kw3HuHFYFkbJYXq0wumDou4yC+MOrA1GsuzBN6SWMVXPIbSeNGH4Hcb/uACB
         j240MuHoKKNKC/msGX5RQ7fgecqrUUyBKueD6h/kx2UHqVPHdoTAbroVJGp2udgU3C5t
         V2bblYczLQvoAGjl+LoUDyvCwc12iJ7GFX0AH8hB5H8FSchhnjZsYhcKpfulqIgcxtY4
         +FUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Awz2G3bc;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id az6-20020adfe186000000b00241ea0ff0dfsi7395289wrb.540.2022.12.19.00.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 00:37:15 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Awz2G3bc;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 383F45FB25;
	Mon, 19 Dec 2022 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671439035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dowq7wSc/L44cg36b3WmRU6zilRnAfGjvafq1GvVXQk=;
	b=Awz2G3bcCZNxvecRFHQirr/lJtbhgmWf21VCftdyS6YTZeAtZTUYF+ak/m8cXG+rg1mZcR
	gpLbkrCdb/X5TTZARLR7gO7pUo+8+RWB0T36o5i80R/akDvkqpzPg9nMbCdVNbXzhRGXm3
	QxgTxhHevZfIOIfxqcwb060wDtHaO0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671439035;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dowq7wSc/L44cg36b3WmRU6zilRnAfGjvafq1GvVXQk=;
	b=YWp3sEQM3zQAWfPHqUAW4Vc70LTlz7lfJabKpiBtWXOtcoIKpE0di9vzE6b+i97Kx2FR5V
	rO3sTMVihAAS2FBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DCCA613498;
	Mon, 19 Dec 2022 08:37:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id P/BdNLoioGNyEwAAMHmgww
	(envelope-from <cfontana@suse.de>); Mon, 19 Dec 2022 08:37:14 +0000
Message-ID: <3355a215-dd7a-e80a-ca53-b0d65eb435b5@suse.de>
Date: Mon, 19 Dec 2022 09:37:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20221216212944.28229-2-farosas@suse.de>
 <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6E2fyOV/06kw



On 12/16/22 22:59, Alexander Graf wrote:
> Hi Claudio,
> 
> If the PSCI implementation becomes TCG only, can we also move to a tcg accel directory? It slowly gets super confusing to keep track of which files are supposed to be generic target code and which ones TCG specific> 
> Alex

Hi Alex, Fabiano, Peter and all,

that was the plan but at the time of:

https://lore.kernel.org/all/20210416162824.25131-1-cfontana@suse.de/

Peter mentioned that HVF AArch64 might use that code too:

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg00509.html

so from v2 to v3 the series changed to not move the code under tcg/ , expecting HVF to be reusing that code "soon".

I see that your hvf code in hvf/ implements psci, is there some plan to reuse pieces from the tcg implementation now?

Ciao,

Claudio


> 
>> Am 16.12.2022 um 22:37 schrieb Fabiano Rosas <farosas@suse.de>:
>>
>> ﻿From: Claudio Fontana <cfontana@suse.de>
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Cc: Alexander Graf <agraf@csgraf.de>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>> Originally from:
>> [RFC v14 09/80] target/arm: only build psci for TCG
>> https://lore.kernel.org/r/20210416162824.25131-10-cfontana@suse.de
>> ---
>> target/arm/meson.build | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/meson.build b/target/arm/meson.build
>> index 87e911b27f..26e425418f 100644
>> --- a/target/arm/meson.build
>> +++ b/target/arm/meson.build
>> @@ -61,10 +61,13 @@ arm_softmmu_ss.add(files(
>>   'arm-powerctl.c',
>>   'machine.c',
>>   'monitor.c',
>> -  'psci.c',
>>   'ptw.c',
>> ))
>>
>> +arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
>> +  'psci.c',
>> +))
>> +
>> subdir('hvf')
>>
>> target_arch += {'arm': arm_ss}
>> -- 
>> 2.35.3
>>
