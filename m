Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp468956lfb;
        Thu, 9 Jun 2022 07:15:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzvrbpDh95EjhUUE+BaoyXWH6yvErb0t/lS68Gda8wjz0gvpqHnDWU2vRsPcSAN3ioscWE
X-Received: by 2002:adf:dec1:0:b0:213:be00:99a with SMTP id i1-20020adfdec1000000b00213be00099amr34903533wrn.506.1654784112673;
        Thu, 09 Jun 2022 07:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654784112; cv=none;
        d=google.com; s=arc-20160816;
        b=TdWnbhVal4WOQvK9IFi+6hrvJoWmHOdZ2DdvIwuclnw8wwJQPHpxEBvUDgy2zmitla
         uAy4xYEx+hO0CgHDYOkj68VDAc7Qzh3cRGarHUCFp20Oqkj0Stu8S7ZshrUKFjZkRGN0
         yxhjXSggTcLv8oHT5M3oLPrmIVUM0RqK4ga6UrphQOCfLiMBJPlOg4CwXMQMKUkoE8p4
         FEWk0DUuxTwsnFkHETCZfYWKqUeVpOe8j/yoKXFt6PUEaDaEvNm+clFnT1WVroyp3zJn
         qEaxc80PGnrFaJxEci9PdcwOdGI/lo7cLfAFgx+lSR87IpOpNqosSlA3IvcwC5WTYb6y
         x92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature:dkim-signature;
        bh=NmOq+fvygi/FvByq9zbYWD0F5BFMT3OHiN8pPHGE1hs=;
        b=mPASk0vH90s4wjxApnOvc8hKefY9CFBHP7u8/oJuMslUwLYctRDqeIX1r68qNrubhn
         /9kYpVsAcWyB++9bUPrkjUP2ONcgVPPjuXU4yTQppBiAVVFQm+Sv1xao4+aN3NprfSd7
         PzGjc+uPjVj6KyyenAxmdUOkNOwxs6STPs/5AtEPP3k3c1Wh5ubGoFo9FRnlozdGOF/j
         L1dc4cTAxoDtbLhTeJYyarHBn8ZNknHGSn+LPFZ/Wg3sLnpzAstWlrgBaM3mFRbb5bzm
         7TULaMXn946QuYwpLIJhwttscq0N6DM5PQO4S9m4uF09VfBNCqS6DaekTOD/zDrSd77c
         xSBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=mllZVMuV;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id k13-20020a5d6d4d000000b00212b80c0168si25246933wri.880.2022.06.09.07.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 07:15:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=mllZVMuV;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0213021F84;
	Thu,  9 Jun 2022 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1654784112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NmOq+fvygi/FvByq9zbYWD0F5BFMT3OHiN8pPHGE1hs=;
	b=mllZVMuVGAToISp469iObplqyZy9FmJAiY7FHD1dQlFvQhCbXdioveD8p7Qv7X9wQeLs7P
	Yj6Ih6JjFczFfQXxQhRx5EHJjwPzYJ3tUHlTEyUjiSPcu5u8wc5JKqM2A0wvEZ9Mdt8pwD
	UiYvS3zcEXCxcvEJcSRthLqnIMc0fDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1654784112;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NmOq+fvygi/FvByq9zbYWD0F5BFMT3OHiN8pPHGE1hs=;
	b=665HxNJCJ3MIE5CJ++Y/oKiQwFULQM7CXvN2Yw7A/XdA1JfuVtRrORhl3OX3cXeV7bY8HA
	oYielmwME481+ODQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92E2913A8C;
	Thu,  9 Jun 2022 14:15:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id lVkIIm8AomLNawAAMHmgww
	(envelope-from <cfontana@suse.de>); Thu, 09 Jun 2022 14:15:11 +0000
Message-ID: <e29d83e6-e7bb-b370-33d0-88d22aa2eddb@suse.de>
Date: Thu, 9 Jun 2022 16:15:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] disas: Remove libvixl disassembler
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Matthew Fortune <matthew.fortune@mips.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
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
 <YqG2Anwtba+MfxfH@redhat.com> <209c7aaf-bc7b-cbc2-c6d0-002bbe31258a@suse.de>
In-Reply-To: <209c7aaf-bc7b-cbc2-c6d0-002bbe31258a@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6t0OGcQiM8ec

On 6/9/22 13:27, Claudio Fontana wrote:
> On 6/9/22 10:57, Daniel P. Berrangé wrote:
>> On Thu, Jun 09, 2022 at 10:47:24AM +0200, Thomas Huth wrote:
>>> On 08/06/2022 17.51, Paolo Bonzini wrote:
>>>> On 6/3/22 19:35, Thomas Huth wrote:
>>>>> On 03/06/2022 19.26, Claudio Fontana wrote:
>>>>>> On 6/3/22 18:42, Thomas Huth wrote:
>>>>>>> The disassembly via capstone should be superiour to our old vixl
>>>>>>> sources nowadays, so let's finally cut this old disassembler out
>>>>>>> of the QEMU source tree.
>>>>>>>
>>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>>
>>>>>> agreed, one thought: at the time I added this thing, I had to
>>>>>> add C++ compilation support,
>>>>>> maybe something we can now drop if there are no more C++ users?
>>>>>
>>>>> I thought about that, too, but we still have disas/nanomips.cpp left
>>>>> and the Windows-related files in qga/vss-win32/* .
>>>>
>>>> That is pure C++ so it does not need the extra complication of "detect
>>>> whether the C and C++ compiler are ABI-compatible" (typically due to
>>>> different libasan/libtsan implementation between gcc and clang).  So
>>>> it's really just nanoMIPS that's left.
>>>
>>> Ok, so the next theoretical question is: If we get rid of the nanomips.cpp
>>> file or convert it to plain C, would we then simplify the code in configure
>>> again (and forbid C++ for the main QEMU code), or would we rather keep the
>>> current settings in case we want to re-introduce more C++ code again in the
>>> future?
>>
>> It doesn't feel very compelling to have just 1 source file that's
>> C++ in QEMU. I'm curious how we ended up with this nanomips.cpp
>> file - perhaps it originated from another project that was C++
>> based ?
>>
>> The code itself doesn't look like it especially needs to be using
>> C++. There's just 1 class there and every method is associated
>> with that class, and external entry point from the rest of QEMU
>> is just one boring method. Feels like it could easily have been
>> done in C.
>>
>> Personally I'd prefer it to be converted to C, and if we want to
>> add any C++ in future it should be justified & debated on its
>> merits, rather than as an artifact of any historical artifacts
>> such as the code in configure happening to still exist.
>>
>> With regards,
>> Daniel
> 
> I'll take a look at it, maybe I can turn it to C fairly quickly.
> 
> Ciao,
> 
> Claudio
> 

It seems to be generated code, getting the original authors involved in the thread.

Thanks,

Claudio
