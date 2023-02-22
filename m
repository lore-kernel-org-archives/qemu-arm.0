Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4310216ejb;
        Wed, 22 Feb 2023 05:58:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9PThsOA7m1O9ejdPDmGyiaGgUj8pal2KN5EH4TAx4zL0tSfBv9xPzA8el42bYopfDH+dzN
X-Received: by 2002:a5d:6804:0:b0:2c5:96d4:1dfa with SMTP id w4-20020a5d6804000000b002c596d41dfamr6681729wru.22.1677074326242;
        Wed, 22 Feb 2023 05:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677074326; cv=none;
        d=google.com; s=arc-20160816;
        b=lCE37E6vZpUxmnVTVDEE71V5wQ3IeyFWbqv2NoDGC4X55eFieNpI4BSjLZOEflaDDs
         rch+BPfTP/NWs33ecgbM2NNpiH4ubLNs7fMF8mm9yEncZfgrLwyd9pRDijoq941utIU4
         aJHh4Dyv/OIt4iRnon/nfCcb/w6AdZRaAw+soNUpjGV/0AiFMs3tfhnoT2feN9fAxWqw
         suxcOIR7d7Vl5P3Ft8cMdvfUCg7GBpXV0rxstNfgVEuY7wfBcT7sij25kG2NP37Bo/7p
         Wzi/kQ0UsztCJpkB9E6uNlKwlEcBcAS6A7SKyuG7VA0hwhcdD3DEVNr+jFVO53BqPYOn
         IE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=MgLoWDV7twra41hKGjkyZA+PYex7B29ScxcYPwlSsb4=;
        b=TiBbt0z4yLLyNxTOX+rc1QHFIuxQ86kLn/dZfaL+rvPjpMCYolcFjdbpUekntrkUgM
         ek7XwK39Sgg3IH3FemruClhxvdhRwZbkYhS9nRgzk9qpd7X/T1RM1Tac6oKS9FDnbXuk
         wJG0lrVE5Fac0ZvEbtvE7BXg8++jz2oizDLRBIbHYCZ/cZ95J4XeqrwTqdh8Sd4cTeAG
         uSB2iE5krPH62WcawWI8S7dTzPx9Qt2txHwQc1O8X0Vy5wKI6qhnzO2njrroqSE9rFr5
         U1cEvUJJm4Yg/sQy2O0lue6TV6osYixEpPmF17dFLBfRofi8SCbuhivIRs6RZ6HG4LF7
         ejQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=jAZ85MBH;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id c4-20020a5d63c4000000b002c57c63a1d7si10109762wrw.63.2023.02.22.05.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 05:58:46 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=jAZ85MBH;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B40511FF7D;
	Wed, 22 Feb 2023 13:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677074325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MgLoWDV7twra41hKGjkyZA+PYex7B29ScxcYPwlSsb4=;
	b=jAZ85MBHtGxbhwMilSwbczavNxu0ghSF08CT3FnVS2HGhJE1eyW4GtuEV2dHIt+Jz6/KM7
	4zIvDF15vOGO7QTw7V86epLclBQ++YsK1mV0e1unv6aV3Qc2XzVt9SE4WteRu5HwP4LCDO
	HDCSyLlzTcAYr6zPswqSPjpXPjtEfEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677074325;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MgLoWDV7twra41hKGjkyZA+PYex7B29ScxcYPwlSsb4=;
	b=3YWl0stPRmybYFYrpde78RCdUBWGnVHtp9cWpjLoeD8Tggqxi9b75llG0/gRAHlfiqHcvS
	V5nSgxGipV7U/vDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 428BE139DB;
	Wed, 22 Feb 2023 13:58:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UvJ1A5Uf9mOAdgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 22 Feb 2023 13:58:45 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v6 19/29] target/arm: Move 64-bit TCG CPUs into tcg/
In-Reply-To: <CAFEAcA__kyfbPv5tmSTiBJ_O15ND5-QpKpATx856s8XCoUNORw@mail.gmail.com>
References: <20230217201150.22032-1-farosas@suse.de>
 <20230217201150.22032-20-farosas@suse.de>
 <CAFEAcA__kyfbPv5tmSTiBJ_O15ND5-QpKpATx856s8XCoUNORw@mail.gmail.com>
Date: Wed, 22 Feb 2023 10:58:42 -0300
Message-ID: <87356xol7x.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: ATM/ZWrj8Vpw

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 17 Feb 2023 at 20:15, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Move the 64-bit CPUs that are TCG-only:
>> - cortex-a35
>> - cortex-a55
>> - cortex-a72
>> - cortex-a76
>> - a64fx
>> - neoverse-n1
>>
>> Keep the CPUs that can be used with KVM:
>> - cortex-a57
>> - cortex-a53
>> - max
>> - host
>>
>> For the special case "max" CPU, there's a nuance that while KVM/HVF
>> use the "host" model instead, we still cannot move all of the TCG code
>> into the tcg directory because the qtests might reach the !kvm && !hvf
>> branch. Keep the cortex_a57_initfn() call to cover that scenario.
>>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>
>
>> -/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>> - * otherwise, a CPU with as many features enabled as our emulation supports.
>> - * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
>> - * this only needs to handle 64 bits.
>> - */
>>  static void aarch64_max_initfn(Object *obj)
>>  {
>> -    ARMCPU *cpu = ARM_CPU(obj);
>> -    uint64_t t;
>> -    uint32_t u;
>> -
>>      if (kvm_enabled() || hvf_enabled()) {
>>          /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
>>          aarch64_host_initfn(obj);
>>          return;
>>      }
>>
>> +    if (tcg_enabled() || qtest_enabled()) {
>> +        aarch64_a57_initfn(obj);
>> +    }
>> +
>
>
>
>> +    if (tcg_enabled()) {
>> +        aarch64_max_tcg_initfn(obj);
>> +    }
>
> Why do this only for TCG, and not qtest ?

I was trying to give qtest a minimum set of features, since it shouldn't
require any to begin with.

I could probably revert to the old behavior of having this code for
qtest as well without breaking the build. It's just a matter of moving
some stuff back from the tcg-only land.
