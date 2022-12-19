Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3563948ejb;
        Mon, 19 Dec 2022 07:16:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6wdeQV6FYDbtik1VRCHaRPMGmrcRMfEIppszX9Fz17y0UzmnqQ/bg9q44+It66B+Fss1nu
X-Received: by 2002:a5d:6186:0:b0:242:1238:91d2 with SMTP id j6-20020a5d6186000000b00242123891d2mr26796046wru.17.1671462973124;
        Mon, 19 Dec 2022 07:16:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671462973; cv=none;
        d=google.com; s=arc-20160816;
        b=EHZtKG4glwQOvFzdgWneCVuLjgH+Y0OBwHGosFquBtU6mef8b8vtloUJhhJG+kwmIY
         4aDNRzl7mZhJXuLm5ZJSJTRXeF2ZUypOKXfNY+qWD3o7/cBaucD0rMCEYVDQETX4oUzu
         3RAxDHnYNREYgz73hVeIqYQOE8MjH2cuPLgS/mX3wQToh8eG5r6w3OFIxRspZxOiCGu2
         6Zh82q5tR+pxoD0/9Ygyk+jmfiqPG22gAeOshzVWIub78ps8ZD7otGiVxUdD/ZCfF7Ib
         QW8suIVGNXORytOYM8vv8SGzh+Vfd8gldY41uJVUOYsQmLTFKwBXNg4JhAPDQvuMZnfq
         Hbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=DoKVAwB8Or20QMd90+mS/yKcsYPxnzunqseZ2wR63pM=;
        b=Zg2rw3iSxvRXFNDyrY5shF1/fHro/gQuO5aGFbY2eHa6/hxze503uUQ5Rtcg9qYwP2
         CvhievoRGu0jePAtasCT+f51SsE92gbJHBL0GF1FV2l4gDF+PKksSy6EDbVvs6xmyypg
         476z+sX5J1LDcj2G5/Ks8JNbMp8hhnyhaY57bg5ad82j8nG4QsuKOQIxammlmS7urPQA
         K5WkyWls0VV71oK+P1N/Al/rA6NQ2sNeRo22hLfHjK9MRHH9MieX/H703ZfNC9e8yLJM
         v105fzmqDoB2lrzayAI595c4ialaArptt+YCTNxZkQAhEtVenjqaycim8tTdyBnQVUR8
         NAMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=K2vTes51;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=kygEKdhN;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id e9-20020adfef09000000b002421ad7e701si5858155wro.93.2022.12.19.07.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 07:16:13 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=K2vTes51;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=kygEKdhN;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7252160ECC;
	Mon, 19 Dec 2022 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671462972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DoKVAwB8Or20QMd90+mS/yKcsYPxnzunqseZ2wR63pM=;
	b=K2vTes51N2USub2tXvt6TYEmhaCjtYmPoYmND/AZd0dnBSreR35csvRubrVQ8Cr43UoAlC
	BzWZ5+3fuqjxwmv/qTGDaTtveMT7LkOQG2tqebSGBjbjNpv5XSkjUU1MEAWzpnvgp59aMu
	dSngDG/pL9wS83x3S+ch3DHPDz6hoio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671462972;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DoKVAwB8Or20QMd90+mS/yKcsYPxnzunqseZ2wR63pM=;
	b=kygEKdhNKEIOU0qXIwvfuGMxPgLcGcEdAL+cIPeb1fCKpemI7mz31VxJWEeafVc6r9c9E+
	EpmTZWqVoSNfniAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F310813498;
	Mon, 19 Dec 2022 15:16:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id heg1LTuAoGMpVAAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 19 Dec 2022 15:16:11 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 5/5] target/arm: only perform TCG cpu and machine inits
 if TCG enabled
In-Reply-To: <42c455aa-c93f-9167-59ef-ddf2b46ca2e4@linaro.org>
References: <20221216212944.28229-1-farosas@suse.de>
 <20221216212944.28229-6-farosas@suse.de>
 <42c455aa-c93f-9167-59ef-ddf2b46ca2e4@linaro.org>
Date: Mon, 19 Dec 2022 12:16:09 -0300
Message-ID: <87len38lvq.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: R85NV2HOXzpX

Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/16/22 13:29, Fabiano Rosas wrote:
>> -    /*
>> -     * Misaligned thumb pc is architecturally impossible.
>> -     * We have an assert in thumb_tr_translate_insn to verify this.
>> -     * Fail an incoming migrate to avoid this assert.
>> -     */
>> -    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
>> -        return -1;
>> -    }
>> +        /*
>> +         * Misaligned thumb pc is architecturally impossible.
>> +         * We have an assert in thumb_tr_translate_insn to verify this.
>> +         * Fail an incoming migrate to avoid this assert.
>> +         */
>> +        if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
>> +            return -1;
>> +        }
>
> This is a sanity check rejecting malformed vmsave.  While hw virt won't have the same 
> assert as mentioned in the comment, it won't be happy and will raise some sort of cpu 
> exception later.  I think it's better to reject the bad vmload early.  I suppose we could 
> expand the comment to that effect, so that it doesn't appear to be wholly tcg inspired.

I see, I'll leave it out of tcg_enabled() and update the comment.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
