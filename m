Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp418493ejc;
        Wed, 18 Jan 2023 03:33:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsiGWh8SLJG3qnS3mC4NYz3xcDmJRXFTaAg4NkiqhZxBw5kb/ZcvaAnSWYjW+BSgUj4xs9z
X-Received: by 2002:a17:907:88cd:b0:859:5541:f3ff with SMTP id rq13-20020a17090788cd00b008595541f3ffmr7523023ejc.32.1674041633536;
        Wed, 18 Jan 2023 03:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674041633; cv=none;
        d=google.com; s=arc-20160816;
        b=xGXCkqHl3EewPPWb2ikD1anrrcFmZJxCq2iETVwM3sAb0sqLBe2QOrSbaDjXl7sKJA
         OVSCk8ZBotvzTVLhBmusV1u4ylEWuhZ7i9XGs3sqqU5PztvgDDofpmBhoF5pazV/LMX2
         AHn8ggVMplvvr55zXjlSNVSNm74Xs0PAPXRcH5m0WBC2Rrv1euy5rPpAyp1ma6mgSmbg
         bJpXYwurXsuMW7gGVwwFuMgH4esdb/XBrYvwacZMn/lyT13lQNzRkA5SLZu3/vaJiAbN
         NTFP1oh0JzMj0NXx+IwVJX6XDVjPbv0OEbYuV/r+RU9ppyfVQSmBQmznsHSZFyCvUPSK
         xOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature:dkim-signature;
        bh=tiKmrXvaLUOKOhl28VHbquXQKFRjoZ1o/inJ9lYSie0=;
        b=DQnBJpPuJxGEX56w1hrOc8a9Q9wxY9xg/+4LUzhH1peeVCHr4LMT5W8JM6Ipe+hwom
         i5LW1PEuFtJXA4/RVRbuQ810RDKEy0qrdB6tJUWkgFqtyeCh6EhdscC7EPyxpCoeatbh
         l3NqFkqqOI7zKqZJm1jXoQyKTZh6GBPT+VuASrdJBT6Pfks+nHoG3aKMax6v8/Ke2eJj
         6rsnAY3iNEsXolH5u+KWJxoXPhk9vQgMrqYXzKZwBx1aAYLbYLUNfRbWhC0h1oOygxp8
         iLEPbE7s0yDY6MmpnxcNEyA5Mt/bRfn/9ndeE3WgnaTJSQV2/OdbQQZYg+WCX6zj3AlN
         mQiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Lf76XRt6;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id xb7-20020a170907070700b007877f3132d9si39002149ejb.438.2023.01.18.03.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 03:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Lf76XRt6;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E024320ED4;
	Wed, 18 Jan 2023 11:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674041632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tiKmrXvaLUOKOhl28VHbquXQKFRjoZ1o/inJ9lYSie0=;
	b=Lf76XRt6U25BDCXTVYl2QqRfTldSmdV2i/KM/FgckjjauQLK1QJvP0lB0tEw1WKORnyNFx
	5RNRZI0Ln6Z4j6M0ID3P803uXYRlZ/GdMqCOGVIUFW4GTnkcp/N5ViWrGf8xBgo0jf9mEy
	eHUFV4rzVnehyaqPevBLOwSQDfFtP9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674041632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tiKmrXvaLUOKOhl28VHbquXQKFRjoZ1o/inJ9lYSie0=;
	b=oxDH4ajLBfT+GkqEkjKZwCRF4+jzD8JlN4iGvxq5UcYLnVuByBejYG13fcZe03YDEP4zuJ
	jF25HC2sZ+5NHGAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80258139D2;
	Wed, 18 Jan 2023 11:33:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RpowHSDZx2NTfQAAMHmgww
	(envelope-from <cfontana@suse.de>); Wed, 18 Jan 2023 11:33:52 +0000
Message-ID: <c803c8a5-5788-2935-c1d8-3b62cc9a64d9@suse.de>
Date: Wed, 18 Jan 2023 12:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
 <bafc45b7-f42a-a500-053f-65f057a14cc1@linaro.org> <87bkmx0yux.fsf@suse.de>
 <1ff29148-eae9-84b7-3521-4b9d543f12e3@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <1ff29148-eae9-84b7-3521-4b9d543f12e3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Cr9eYziQ+3xP

On 1/18/23 11:45, Philippe Mathieu-Daudé wrote:
> On 17/1/23 20:01, Fabiano Rosas wrote:
>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>
>>> On 13/1/23 15:04, Fabiano Rosas wrote:
>>>> The cpu_tcg.c file about to be moved into the tcg directory. Move the
>>>> code that is needed for cpus that also work with KVM into cpu.c.
>>>>
>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>> ---
>>>>    target/arm/cpu.c     | 76 +++++++++++++++++++++++++++++++++++++++++++
>>>>    target/arm/cpu_tcg.c | 77 --------------------------------------------
>>>>    2 files changed, 76 insertions(+), 77 deletions(-)
>>>>
>>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> [...]
>>>
>>> TYPE_IDAU_INTERFACE is ARMv8-M specific, so TCG AFAIU.
>>
>> Hm.. QEMU doesn't start without it. There might be some implicit
>> dependency. I'll check.
> 
> Likely some M-profile code (note this type is a QOM *interface*).
> 
> I checked the uses (git-grep -W IDAU_INTERFACE) and none should be
> reachable in a non-TCG build.

crossing fingers, I remember getting in trouble there, but maybe that is now solved by the KConfig thing..

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02958.html

My understanding is probably obsolete now, if so sorry for the noise.

Claudio
