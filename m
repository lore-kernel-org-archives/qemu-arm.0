Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp896040lff;
        Thu, 17 Jun 2021 13:35:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIYJ/QiH44nzwjl4oYaiHIFl++q8IB10hMVDf2fXRoc+34h0N8gRbsZmaOG3HeJyPME9/f
X-Received: by 2002:a5d:648a:: with SMTP id o10mr8060452wri.274.1623962110827;
        Thu, 17 Jun 2021 13:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623962110; cv=none;
        d=google.com; s=arc-20160816;
        b=SpDt8ZYD0ZhfhWrQt5avl9aqN4a4P3LNObog4ZcfDsNLpPYCiH6WxLvNWOdwLn0OW1
         f5TtBtkHKU07wBHiAy5VU7yGlTlo7aJG0N7wldNPOBY9yuCdzP2C0NQshb0n2JJKZ4WR
         e6DKDYyZoqkzj0oRnCxIdQU8OskJd9XfljHHOG+QcTR1DQMQSHbAyUamw9mKs4ua6Co4
         OBT5ASADMhRy7mnQLwcUlPj48YbArxo5TVpRu8FYw/+9g6g+aJcLBxZ62Ib1fOsPVqJS
         k5J/xulRkX573xDl9nvNhhL857EEWYIvPZ6VRHJZ7soKIABr0M1lMV+pi+XT0r5OFCKD
         3D8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:dkim-signature:dkim-signature:dkim-signature;
        bh=gALxrBprrngFa9FVDsVZgfzgcaS8rM1zYV9nTR88YhE=;
        b=WpfRmoNjOKVMJ0nKv1gQtB1LXPgjBwQyYTXztr8pySq57MBmyWapkS2Lpz+rum4/er
         wQQpGEIIWaI75Om/1uMiL9lRmEL56V2jZqVgxPSBCoL+3hlwXe9P0GvUAXuBXdJW48cY
         vUeLKsmC1EjNHf89wUSTyTyKpUVeq9DE75L3JnDK2Lirf19XiI6hH2Z7NrPGtIOI8Eyh
         Utac6Dc7yoT9skCZggeWgn8IpuXm2NPwef9oKxOR4WPYA8SDrjE1Qr8JPJ7AeVqtrIjQ
         5VIne+TLUwBAs85Fz8f4v82IkciXq8rwtSwIc4X8ZYJ2Tn3yvP08g250LaLPWY2+FUXn
         ww6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Yfas6YPw;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Yfas6YPw;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=4kzixqtb;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id 6si1355874wrb.237.2021.06.17.13.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 13:35:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Yfas6YPw;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Yfas6YPw;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=4kzixqtb;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C2961FDDE;
	Thu, 17 Jun 2021 20:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623962110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gALxrBprrngFa9FVDsVZgfzgcaS8rM1zYV9nTR88YhE=;
	b=Yfas6YPw0StSh/mxqVdISMvg39L3DTKZvOqXjduTYgll5dHz12eJ2eWuo6zrd3VTGprM6U
	u9LuNKGTdO3jhV2dPpi9EF+LwUqbT2WV3zkYESVh2y/lNkuHiWaC+oCjJgxNzLyd0uOjdE
	WWlvFfAcoHEnC09tx/JpRgNHenooNqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623962110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gALxrBprrngFa9FVDsVZgfzgcaS8rM1zYV9nTR88YhE=;
	b=4kzixqtb7B8NpL2zF1jG4JNWzt8fb9bOFlZkZwuob1RXg4s7pc+48OXtAgILSsxORU5vNT
	gnnewgfUmGuptwDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
	by imap.suse.de (Postfix) with ESMTP id C5E95118DD;
	Thu, 17 Jun 2021 20:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623962110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gALxrBprrngFa9FVDsVZgfzgcaS8rM1zYV9nTR88YhE=;
	b=Yfas6YPw0StSh/mxqVdISMvg39L3DTKZvOqXjduTYgll5dHz12eJ2eWuo6zrd3VTGprM6U
	u9LuNKGTdO3jhV2dPpi9EF+LwUqbT2WV3zkYESVh2y/lNkuHiWaC+oCjJgxNzLyd0uOjdE
	WWlvFfAcoHEnC09tx/JpRgNHenooNqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623962110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gALxrBprrngFa9FVDsVZgfzgcaS8rM1zYV9nTR88YhE=;
	b=4kzixqtb7B8NpL2zF1jG4JNWzt8fb9bOFlZkZwuob1RXg4s7pc+48OXtAgILSsxORU5vNT
	gnnewgfUmGuptwDg==
Received: from director2.suse.de ([192.168.254.72])
	by imap3-int with ESMTPSA
	id VDqlLv2xy2CcDwAALh3uQQ
	(envelope-from <cfontana@suse.de>); Thu, 17 Jun 2021 20:35:09 +0000
Subject: Re: [PATCH v16 43/99] target/arm: move a15 cpu model away from the
 TCG-only models
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-44-alex.bennee@linaro.org>
 <51fbcf63-a205-8848-95f7-b2c7e74754a9@linaro.org> <87v96ce5e0.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5710327c-79c4-2feb-2876-3f31ec045e0d@suse.de>
Date: Thu, 17 Jun 2021 22:35:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87v96ce5e0.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ChLTgcoILuxv

On 6/17/21 8:01 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 6/4/21 8:52 AM, Alex Bennée wrote:
>>> From: Claudio Fontana<cfontana@suse.de>
>>> Cortex-A15 is the only ARM cpu class we need in KVM too.
>>> We will be able to move it to tcg/ once the board code and
>>> configurations
>>> are fixed.
>>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>>> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
>>> ---
>>>   target/arm/cpu32.h   |  4 +++
>>>   target/arm/cpu32.c   | 73 ++++++++++++++++++++++++++++++++++++++++++++
>>>   target/arm/cpu_tcg.c | 67 ----------------------------------------
>>>   3 files changed, 77 insertions(+), 67 deletions(-)
>>
>> I don't follow this one.  Why would kvm, which is 64-bit only, require
>> a 32-bit only cpu?
>>
>> I guess I can accept that our board configurations are old and
>> fragile, and I realize there are already 99 bottles of beer on^W^W^W^W
>> patches here, but what needs to happen to fix this properly?
> 
> I'll drop this and fix whatever we need to. 32 bit ARM KVM is listed in
> removed-features so I think we are good.

Problem is, if I recall correctly, that the virt board currently requires an a15 to exist.

> 
>>
>> I guess I can give it an
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> if it helps us move forward.
>>
>>
>> r~
> 
> 
