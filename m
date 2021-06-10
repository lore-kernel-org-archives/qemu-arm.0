Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp319626lfa;
        Thu, 10 Jun 2021 02:24:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGsQNTHA7/2cwdgRFJ7F8vQL2fss7cLMEHUn8ClJsVjI5HQF0iR679bgE05p1VwxX0chuZ
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr3907802wmj.19.1623317059718;
        Thu, 10 Jun 2021 02:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623317059; cv=none;
        d=google.com; s=arc-20160816;
        b=n/yiBGTfZMQnpVhn3MaJa4M8b3FeUg+EzKgwANgTpNvpBK/OdRGCbTsx+QQTzFXlUM
         d6jGi6SOrNygIsir6bkbCA40h25EZ8yW0vLb/W3JmB//1quuz8A0nuoFDsMY8ouPPwVr
         znHFds66WDsOruNYoE/IYn1ZJcuzjmj5uHUkxZY4qX8sLN3rsJQydsiNXIWQjJ6eyE6A
         lzZHkEk9P2pUUAK6wHn6Eww0VnZNzpjn1D2bN0Kgp1RpkrXSwQ/tlZoulmI2NNmUhFUV
         7Jhh8JdP1rwB5b6hBAodiK3PXyrRTVXXy6V6v4TYvw4avekBx7Ci/l5L+JWH+ICKReo2
         l3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:dkim-signature:dkim-signature:dkim-signature;
        bh=mGXbyDY8RJ0c4R+x2imxpCV/0jfrDSe9Md8HvlcVTWk=;
        b=RMDQYFkPsmNNYqeOLxtRiLQ7c/5aHIpP17LG36lwwHImcMDbs2nXvwOkjIDUOq+K+v
         clyt9DT9+njah8BXemil8TFLHZ8CL1SAECBCWFldwm3Is8Orm9CTdGATXZo/Zbg6Gydt
         CIG83HGuAQCJYN73Ht3W97ibrrrSbF1ar7qAOmsPIJ514JVuZV/DyrSNWFAXdN0yWA8U
         d/xzF3l/uncgJrNYJZcJiQKUrl/WXlY19zzefjInKnpSJC+0DQMqpNSpdt8DAC9xgiYX
         RcRuUpbLpt29wLYAK6NhuQ4KIWh6XZElldePdCy1uIE2qIFgNa5bvcLH5cCUf/zls5g+
         ZRhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="qH01F5/z";
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="qH01F5/z";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id x5si2671344wmc.100.2021.06.10.02.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 02:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="qH01F5/z";
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="qH01F5/z";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=cfontana@suse.de
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2538421A68;
	Thu, 10 Jun 2021 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623317059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGXbyDY8RJ0c4R+x2imxpCV/0jfrDSe9Md8HvlcVTWk=;
	b=qH01F5/zQuj51QiNxpZr64OMBUXbY53Q7NCmddjCCCc2WzF8bII1Cq6g3pH7OWWKQtaKa5
	xJ8wgMUG8HOpaAmUKZ7silylO3SyjmIKU/G/RSHaO4aF9twoXVw+tmZYm89LhqzvQXy1oC
	VEi/3f0cDnwryktbAZZoGMs/8AIHA1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623317059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGXbyDY8RJ0c4R+x2imxpCV/0jfrDSe9Md8HvlcVTWk=;
	b=yWLMarGKzfdg/c7UnJ8ThFiTqt3b4CLONcM1hL50CYy8KOMUvoKR2MutDvw64rIB3QxBQ3
	jgntQu6fDA+FHOCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
	by imap.suse.de (Postfix) with ESMTP id E6BF7118DD;
	Thu, 10 Jun 2021 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623317059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGXbyDY8RJ0c4R+x2imxpCV/0jfrDSe9Md8HvlcVTWk=;
	b=qH01F5/zQuj51QiNxpZr64OMBUXbY53Q7NCmddjCCCc2WzF8bII1Cq6g3pH7OWWKQtaKa5
	xJ8wgMUG8HOpaAmUKZ7silylO3SyjmIKU/G/RSHaO4aF9twoXVw+tmZYm89LhqzvQXy1oC
	VEi/3f0cDnwryktbAZZoGMs/8AIHA1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623317059;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGXbyDY8RJ0c4R+x2imxpCV/0jfrDSe9Md8HvlcVTWk=;
	b=yWLMarGKzfdg/c7UnJ8ThFiTqt3b4CLONcM1hL50CYy8KOMUvoKR2MutDvw64rIB3QxBQ3
	jgntQu6fDA+FHOCw==
Received: from director2.suse.de ([192.168.254.72])
	by imap3-int with ESMTPSA
	id tW3lNkLawWD5OgAALh3uQQ
	(envelope-from <cfontana@suse.de>); Thu, 10 Jun 2021 09:24:18 +0000
Subject: Re: [PATCH v16 78/99] target/arm: cpu-exceptions,
 cpu-exceptions-aa64: new modules
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-79-alex.bennee@linaro.org>
 <d0865350-88f9-0f91-f984-25832c0f289b@linaro.org>
 <d62d06c3-5b14-56bc-c5a5-d5e960a9d7d7@suse.de>
 <CAFEAcA-GGr50x8XQOssOEVqPvE7Wq+=tpypirxT+rso+diCWsw@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <029be61d-43e7-bec4-0a8c-16c37906a997@suse.de>
Date: Thu, 10 Jun 2021 11:24:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-GGr50x8XQOssOEVqPvE7Wq+=tpypirxT+rso+diCWsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: PJEv/S+KJ3OH

On 6/10/21 11:01 AM, Peter Maydell wrote:
> On Thu, 10 Jun 2021 at 09:45, Claudio Fontana <cfontana@suse.de> wrote:
>>
>> On 6/5/21 10:50 PM, Richard Henderson wrote:
>>> I don't see the point in the excessive replication of header files, for exactly
>>> one declaration.  This is not the first example.
>>>
>>> What's wrong with internal.h?
>>
>> Doesn't mean anything and leads to a mess of unrelated code.
> 
> It is all related: it is "things that the target/arm code needs,
> which are not needed by anything outside target/arm".
> 
>> I think we should be better at creating meaningful modules
> 
> target/arm is a meaningful grouping of code :-)
> 

Well, seems a bit too large a grouping to me,

and it seems like more effort could be put into recognizing opportunities to split things into self-contained units when they show up,
with more clearly defined and commented interfaces about inputs/outputs and initialization dependencies,

instead of cramming everything together. Of course there is a balance to be had, but my impression is that using exclusively things like internal.h
leads to people adding anything new just piling unrelated things on top, and missing opportunities for doing things in a more self-contained way.

Just my 2c of course.

Ciao,

C.
