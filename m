Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp363952lfb;
        Thu, 9 Jun 2022 04:27:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMLWh5RoS6b8sVQk+Twf9DHT3XmPJVIAPBUeP+U5M9WWWONF69yeBMFgTUJsLXESde5ojI
X-Received: by 2002:a05:6e02:1245:b0:2d3:a86e:c587 with SMTP id j5-20020a056e02124500b002d3a86ec587mr20405414ilq.274.1654774029953;
        Thu, 09 Jun 2022 04:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654774029; cv=none;
        d=google.com; s=arc-20160816;
        b=qKwCi3T7/NWaX2wJF3YvPYSyheTNHUJiUn1sd0Ogd7++e/Eqauz8F+TpsaBUIBoM+d
         9IzZwpTUPMPcTosolOaQAAknUreUcYSm/wmCjXfdFmSwV5bpc2XfxWGfla861D9+f1Mp
         Y3kCfLhMxJFF8/iE78Dq1EiwKm8UzzVKE8iwr+KMTf/AVk262VC0aaAwVvAXXHDxRujQ
         QmgLLkIiW1385mEn+FNLfM1+n4biBeA45fNRVYa00AYsosC6jpmDtPba5rSGFgGGq5F2
         zlCdwRLyygpSK21bfoIrLvNJajzZ8wj/xAEbvBrqEg/97JRCqh8N/WAS49qyIgzW0InK
         jf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature:dkim-signature;
        bh=GCcpzS+5lWmo8xsVxkXG21BoNPtcEJ5wooOWoIPeqDM=;
        b=Ge3Y3Oe3ZOmhDi+e0k62GlHx+fZMRHsjKfg0n9T8l26fI7bsy0cASALPeGNHDxI7+K
         vfv9xhgxR0fw8qxxIdBQSY11L7/CJ9gOpr7vvt6WSaKNfv6EQ+f7GM58RnYhtTrbwrzX
         Bv1EA5LDj9v/tQ8IyebajZVyD/IbpryrPMB+HbMxmj0A97Ivrk4HjY7sgfYV/g2EZpCu
         kZrIozVq4UKJwlHdf8gVWFORZZsQCdyohBJc3jYumTiqFS6xNJRN/cL0m7PB5Ux62Sx1
         N/mE+QDDxxlSjtUb/04MVaD5Fe/T61BIc50JmFlVq2IHQ/iG8mO7IpKd/1tifk+QX8Lg
         y2Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=uIJ2yJBa;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id h6-20020a056e021b8600b002d3f382bb61si21562406ili.14.2022.06.09.04.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:27:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=uIJ2yJBa;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C9C51FE15;
	Thu,  9 Jun 2022 11:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1654774028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GCcpzS+5lWmo8xsVxkXG21BoNPtcEJ5wooOWoIPeqDM=;
	b=uIJ2yJBaL+kIcuKDN2YsjQQc9KwqWf4GRACkxUq6BleYXl8FOh3SzaWdiDAND32v0j0gKo
	yRwnQuNDYjABwZEUDeWsorH+lMN9rFPXTllfaj1EfKPIGjJFiI0igLJ20L3413tCzjS8TQ
	WBlWk0GFtUoRFOpgLTV6ki/CNUypqgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1654774028;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GCcpzS+5lWmo8xsVxkXG21BoNPtcEJ5wooOWoIPeqDM=;
	b=Gjx247ccut+HWg93xdZvQjs+J/YxzFoTtsoGknZuSSG8DxoolZBQ6gD4NExzr6zXxPjQk1
	2Q/xrrEMqm/LFdBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1AB5B13456;
	Thu,  9 Jun 2022 11:27:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zkOwBAzZoWJvHwAAMHmgww
	(envelope-from <cfontana@suse.de>); Thu, 09 Jun 2022 11:27:08 +0000
Message-ID: <209c7aaf-bc7b-cbc2-c6d0-002bbe31258a@suse.de>
Date: Thu, 9 Jun 2022 13:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] disas: Remove libvixl disassembler
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
 <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
 <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
 <YqG2Anwtba+MfxfH@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <YqG2Anwtba+MfxfH@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FojRN9QhIDES

On 6/9/22 10:57, Daniel P. Berrangé wrote:
> On Thu, Jun 09, 2022 at 10:47:24AM +0200, Thomas Huth wrote:
>> On 08/06/2022 17.51, Paolo Bonzini wrote:
>>> On 6/3/22 19:35, Thomas Huth wrote:
>>>> On 03/06/2022 19.26, Claudio Fontana wrote:
>>>>> On 6/3/22 18:42, Thomas Huth wrote:
>>>>>> The disassembly via capstone should be superiour to our old vixl
>>>>>> sources nowadays, so let's finally cut this old disassembler out
>>>>>> of the QEMU source tree.
>>>>>>
>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>
>>>>> agreed, one thought: at the time I added this thing, I had to
>>>>> add C++ compilation support,
>>>>> maybe something we can now drop if there are no more C++ users?
>>>>
>>>> I thought about that, too, but we still have disas/nanomips.cpp left
>>>> and the Windows-related files in qga/vss-win32/* .
>>>
>>> That is pure C++ so it does not need the extra complication of "detect
>>> whether the C and C++ compiler are ABI-compatible" (typically due to
>>> different libasan/libtsan implementation between gcc and clang).  So
>>> it's really just nanoMIPS that's left.
>>
>> Ok, so the next theoretical question is: If we get rid of the nanomips.cpp
>> file or convert it to plain C, would we then simplify the code in configure
>> again (and forbid C++ for the main QEMU code), or would we rather keep the
>> current settings in case we want to re-introduce more C++ code again in the
>> future?
> 
> It doesn't feel very compelling to have just 1 source file that's
> C++ in QEMU. I'm curious how we ended up with this nanomips.cpp
> file - perhaps it originated from another project that was C++
> based ?
> 
> The code itself doesn't look like it especially needs to be using
> C++. There's just 1 class there and every method is associated
> with that class, and external entry point from the rest of QEMU
> is just one boring method. Feels like it could easily have been
> done in C.
> 
> Personally I'd prefer it to be converted to C, and if we want to
> add any C++ in future it should be justified & debated on its
> merits, rather than as an artifact of any historical artifacts
> such as the code in configure happening to still exist.
> 
> With regards,
> Daniel

I'll take a look at it, maybe I can turn it to C fairly quickly.

Ciao,

Claudio
