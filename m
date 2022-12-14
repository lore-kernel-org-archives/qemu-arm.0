Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp357012ejb;
        Wed, 14 Dec 2022 03:48:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6gdaNkv40MPgELK4VLj7Tb8Slx/sMaF3YR3WD+6usiyhywlm5rJUDjnB83xx2sBDxVrgHT
X-Received: by 2002:a05:6000:883:b0:241:736f:9d1a with SMTP id ca3-20020a056000088300b00241736f9d1amr17378169wrb.23.1671018485201;
        Wed, 14 Dec 2022 03:48:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671018485; cv=none;
        d=google.com; s=arc-20160816;
        b=WV7qNv9t/9+hOS1v/h/0POpCYYHXO38JbYqjSP2K5RBt9QN/vy187LE5q8siUHvaF0
         XohPSmgVEqApjXcdFYzlyrqIYOLI3fQdGsTwpXj/yxptYdyNXJ/Hwkh/5m3UB2wtQpJ3
         P63y8zs6PgyMI7pcAjXCdCKb5129z8peOcOongcVtxYPV9j6RDgjqUd0O9kSsN7FCzkk
         ZE2tMdCj2hH9PE/PFV4+pRY1rRdMnO0UtFWQ6CJEfDczXhMayRYybQbVmYOQXDJ+zJDP
         zq+ifTQ/8Z9wgIjb/tDx8iFb5amju6U52vOzwo4nXPTS4qfjMMoGmH0hxGnBstRINJ1N
         SRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature:dkim-signature;
        bh=UGlUK1C8okbujCmPyhVOXz2M3kH5ZDDFJRrQBgCSRtE=;
        b=CdSsYsHAWycqx5GSRylT/+caJgEFB+K7gG3FQ3T5ogkZsM0lnbA8ve79b79Q3VKH9v
         2FEyxr3aRNOEcMzGbY7dLd31F5RrQAYJVxzpvPhYpV5255I/w9VZWPM1pYUfo7H2OJzS
         517qB6p1M8hijdjlZ8rAcL4rwv7d7kDmC38wBCguaKFoO+4TrWuBlSwBtRitqmOAyIpB
         nYlNfqUdhmDdRNco8EgvOd+ihbHTrDCiD6eG3mW4sG2jse5VKcQdhCnr8YtwdoA+dRt7
         lTOSFPMZg1MRhRVK1AlufnwziBo7/ei8mnVnoyZKinvpelOAxROclBuToHgZrXMsUb9F
         dtoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Ku6VRf95;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=TZtb6iJ9;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id l7-20020a05600002a700b0024207688b00si1544801wry.941.2022.12.14.03.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 03:48:05 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Ku6VRf95;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=TZtb6iJ9;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 84B7E1FF15;
	Wed, 14 Dec 2022 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671018484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGlUK1C8okbujCmPyhVOXz2M3kH5ZDDFJRrQBgCSRtE=;
	b=Ku6VRf95eYvpqyvJUP/vVUBw/tWGKpkr3zK1dcr/SxGFsD4tEWtN7qTfSiD9aIH3THUulo
	gTLb5I+YZUMmsDVeA7hDDOj9ftFpoMqsk6J7URzffAm86uFbJwoPUUJXLTGZ/c3+Uxf/7x
	3JToZJmXPCZrrOcezdBC+OcbIK3nMPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671018484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UGlUK1C8okbujCmPyhVOXz2M3kH5ZDDFJRrQBgCSRtE=;
	b=TZtb6iJ9S81XMkQUggwAFRKJKmH++Smyur6zZvzytxzqxCs59jNbyBO+JkyrJw7cZUa22H
	SCEobOSCeiGVWGDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C490138F6;
	Wed, 14 Dec 2022 11:48:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hPUmDfS3mWMfTQAAMHmgww
	(envelope-from <cfontana@suse.de>); Wed, 14 Dec 2022 11:48:04 +0000
Message-ID: <e48328cf-ebd4-fc40-7395-b7659c3af718@suse.de>
Date: Wed, 14 Dec 2022 12:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/6] target/arm: general cleanups
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov
 <r.bolshakov@yadro.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20221213190537.511-1-farosas@suse.de>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 2ubPpyzu8VsN

On 12/13/22 20:05, Fabiano Rosas wrote:
> Hi folks,
> 
> I'm splitting this big series from Claudio from last year into more
> manageable chunks (at least for me):
> 
> https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de
> 
> This is the first chunk with only the most trivial patches that make
> sense even without the kvm/tcg and sysemu/user splits.
> 
> Claudio Fontana (1):
>   target/arm: cleanup cpu includes
> 
> Fabiano Rosas (5):
>   target/arm: Fix checkpatch comment style warnings in helper.c
>   target/arm: Fix checkpatch space errors in helper.c
>   target/arm: Fix checkpatch brace errors in helper.c
>   target/arm: Remove unused includes from m_helper.c
>   target/arm: Remove unused includes from helper.c
> 
>  target/arm/cpu.c      |   1 -
>  target/arm/cpu64.c    |   6 -
>  target/arm/helper.c   | 439 ++++++++++++++++++++++++++----------------
>  target/arm/m_helper.c |  16 --
>  4 files changed, 278 insertions(+), 184 deletions(-)
> 

For the series:

Reviewed-by: Claudio Fontana <cfontana@suse.de>
