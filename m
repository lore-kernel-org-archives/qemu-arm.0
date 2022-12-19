Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3412799ejb;
        Mon, 19 Dec 2022 03:54:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf76+LO/nDzYnxW8l8jAIv8cJALZK0xW+AxkbSY42nSBt18HCGqihg24dhCZG/EJ+NX/j1Wi
X-Received: by 2002:a05:600c:3ca5:b0:3cf:ceac:94d3 with SMTP id bg37-20020a05600c3ca500b003cfceac94d3mr31209999wmb.13.1671450877170;
        Mon, 19 Dec 2022 03:54:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671450877; cv=none;
        d=google.com; s=arc-20160816;
        b=ZhJtIfqhi9I8WRu9mDLHfP+4p/9nE3SnYdphygu6Z0YXIqBa3eCU5IFQY6PeEZi0Hl
         g3UduWQ4rVt3W5e5cVx05dOe+q7lxvfwvdf7AM5zNoyPgVzOAGQkM1s7hKglariDByC3
         s8G0pSJ8TSr+h2ZSUzrWVJFfC4sV2cDc/swIklwraAVytYturxNucS4UupDU8afQIsMk
         51eGTKyPBo5OfUoimKnYnyqRTlSQo56CPVhdNGdwF0vIhIKwh2S9qNj/sqZLfUodimeA
         sSRkKwVvGxiiGmxgv7Voi11ljCIl/vqzTsdiLbQRxWo+cZmfjwpVKYY0ayT3Aal2wWr3
         sOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=7lnRqOFlcPGe5RaCGczGCpL0rMxcQIKVLlnS29R8+Pw=;
        b=pInn8KXLGIFG3o67qjzoBLNaAT+DRGRbH1XI288hJ6IsPnT3MED7660a2xdk6qvSlN
         MEdTY0AQYcjC9w7OHB1KTtO9gDdCXdmEm9EDydKaf7EM2r/bhiWtp2FhT2IspyekLi1+
         IQad47n+W/tImqCwzVsvlDaYJNAddo/qWVxtPeR3icH8LRZ9RH2FXh68oWfvhWqGUe5B
         vTyHaTjzfGnS07k4gmuYovaWguO8P9e7io2S6eBADbSEOLQDcHez3fKlwj2unCh8PwE0
         exAk2oPs0nASTVcOyXb+mXY9EAMo7VEAc7YrHCguLg6AprWEV+PfAuTPwEAdbvL/iOF7
         ZAPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=o16xBVvJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=uP0ke4wp;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id h3-20020a1ccc03000000b003b907413d2csi9911728wmb.124.2022.12.19.03.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 03:54:37 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=o16xBVvJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=uP0ke4wp;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8FF9860791;
	Mon, 19 Dec 2022 11:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671450876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7lnRqOFlcPGe5RaCGczGCpL0rMxcQIKVLlnS29R8+Pw=;
	b=o16xBVvJp/icvmDOi1JzXFmI+G/Y5lKk9zOrpHJGSteGmKSzz8/ZDAa69PmShwU4szEYbm
	QFShaWJXbg7xF9e1ahjap8gLMgTSKeNTYkNMwLB61/lea3pDbdlaYGW/+9FwK4x33YE/g7
	mPs8cAAu88ckm67Jui45yo78lXpkV7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671450876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7lnRqOFlcPGe5RaCGczGCpL0rMxcQIKVLlnS29R8+Pw=;
	b=uP0ke4wpzAfuFTTwFxOAOU+LUTFgCalbOMD/iovroKONNgMw9tdORIi27dTn/o4tmf9/eG
	JcagJZYAXoYgAOBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1418613910;
	Mon, 19 Dec 2022 11:54:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id O9t9MvtQoGNpaAAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 19 Dec 2022 11:54:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 3/5] target/arm: wrap semihosting and psci calls with
 tcg_enabled
In-Reply-To: <7f555a78-1533-7be6-f627-6e594a19c04d@linaro.org>
References: <20221216212944.28229-1-farosas@suse.de>
 <20221216212944.28229-4-farosas@suse.de>
 <7f555a78-1533-7be6-f627-6e594a19c04d@linaro.org>
Date: Mon, 19 Dec 2022 08:54:33 -0300
Message-ID: <87o7rz8v7q.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: blMQ5jX0zTtj

Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/16/22 13:29, Fabiano Rosas wrote:
>> -    if (arm_is_psci_call(cpu, cs->exception_index)) {
>> -        arm_handle_psci_call(cpu);
>> -        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
>> -        return;
>> -    }
>> +    if (tcg_enabled()) {
>> +        if (arm_is_psci_call(cpu, cs->exception_index)) {
>
> This could be
>
>      if (tcg_enabled() && arm_is_psci_call(...))
>
> because...
>
>> -    /*
>> -     * Semihosting semantics depend on the register width of the code
>> -     * that caused the exception, not the target exception level, so
>> -     * must be handled here.
>> -     */
>> +        /*
>> +         * Semihosting semantics depend on the register width of the code
>> +         * that caused the exception, not the target exception level, so
>> +         * must be handled here.
>> +         */
>>   #ifdef CONFIG_TCG
>> -    if (cs->exception_index == EXCP_SEMIHOST) {
>> -        tcg_handle_semihosting(cs);
>> -        return;
>> -    }
>> +        if (cs->exception_index == EXCP_SEMIHOST) {
>
> If you were able to replace the ifdef, that would be one thing, but since you aren't I 
> don't think this requires a separate check.  There is no way to generate EXCP_SEMIHOST 
> except via TCG.

Right, I had to keep the ifdef that was being removed in the original
patch because tcg_handle_semihosting had moved elsewhere in Claudio's
series.

>
> I guess I don't insist, since you're working toward Claudio's much larger patch set, so
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

If you don't mind I'll leave like this then, unless this comes to a v2.

Thank you
