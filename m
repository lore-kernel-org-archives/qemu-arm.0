Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp297960ejb;
        Thu, 5 Jan 2023 05:12:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsSpvqz0Oeux0gr/8zq9p5rTLqr7KyfMV/psJfRtpE3O/W3eTdeuJtsCkd6ZQpUJYzxC2Bz
X-Received: by 2002:adf:f944:0:b0:2a2:6b1f:6105 with SMTP id q4-20020adff944000000b002a26b1f6105mr3675233wrr.37.1672924357997;
        Thu, 05 Jan 2023 05:12:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672924357; cv=none;
        d=google.com; s=arc-20160816;
        b=uikIfBF6cNb6O+gxHzs5MC4bq2oE93nisxfUiNpG2e3UWUSQT/O8woD5azURihRm09
         XLFIjpaSURk4a4WbtB1gOiQTKIHrDrIxhIKSCa7ZxJ7GMOF77rZLgDgApuI2+q3i6reP
         I3BIT9Stnrl5efVnQht1wAIMrijofpY5d4GcBSvVtlOGmqakHBwznuQEdID2C5fJP+aC
         Rq6xTrWXMAZ+S7A1WUOkQO+RebcklEdtMNWtJeJk2MLM/E7gbZ9L/wq2uC8OmvQDFXLq
         zkA3wkUfcyZjNHsBezK6TcMyAHeV/dw4+Kl8b9mwYqPTULzTgk+mjQqjGmum4iQ1vX9C
         7W6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=WzghHjmiibt/gZgn8wRCdDuc7ZDiIi5G54b+NyRvHes=;
        b=QEJVa6SOPZfAsewqWaBUWs46+DxvTE8J+Vba4F9uI6EX07//DOC8cYuqW2F2FGdoEv
         RJn3xfrn5zKovyyjykTeAgkhhImxj0prifMHwQki9pfrXAZia2H7HF+cr4GimF97flie
         uJUlUstJg7B/rnrKeL3yKfQo6UNVeOcV+TDyG0EcVFj61RGNZ7z82yNnure0iPlwWyd+
         98xxc2AzEIxLhc12BZhYffNbGQ72wIrSBDww+sJmQ94uKNveIX3gjGT+ffWqd0o03xum
         KCiF5ul+ZBp7bGy3TOxnx576sQ66/h+/iDvWXhziM+ExJYCyiLj5omfNtEy1bv+dqOZZ
         bfbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zUTpVZOE;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=uvuxLFo0;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id i7-20020a5d5847000000b0027246a79c6esi25868833wrf.460.2023.01.05.05.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:12:37 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zUTpVZOE;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=uvuxLFo0;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 52B1234695;
	Thu,  5 Jan 2023 13:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672924357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzghHjmiibt/gZgn8wRCdDuc7ZDiIi5G54b+NyRvHes=;
	b=zUTpVZOEMCpgOGwhWUPnyFNQ1iL7BobQmc0xc6Bm8IE3z+I5Q1k5Fjnd32xWQHsz1eWnFo
	pm0YWwdjyIQiYH8eduVJWCNkQyu1YtYwdVzDf9JKR5eiXpCom7cHU79U/IyiCC2Y0+exTu
	oK3peQWLZYdvsi3Kp3CrAE+TikbIEgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672924357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzghHjmiibt/gZgn8wRCdDuc7ZDiIi5G54b+NyRvHes=;
	b=uvuxLFo0o3ubrld30GMm1GmbB3Dsl7UPDVTPDQMnREZwAzM3iNOpoC4zsxbTlqrG52pdaT
	DyVjdmi3KKrO1qDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF501138DF;
	Thu,  5 Jan 2023 13:12:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KIU2JcTMtmOfZAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 05 Jan 2023 13:12:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH 19/27] target/arm: Move common cpregs code into a
 separate file
In-Reply-To: <2b66b91d-aae1-a94a-053b-05af0d5d59a7@linaro.org>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-20-farosas@suse.de>
 <2b66b91d-aae1-a94a-053b-05af0d5d59a7@linaro.org>
Date: Thu, 05 Jan 2023 10:12:34 -0300
Message-ID: <87mt6xnn0d.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: U/ZpxHxOok/J

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/4/23 13:58, Fabiano Rosas wrote:
>> Code moved verbatim.
>> 
>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>> ---
>> Extracted from:
>> https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
>> [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
>> ---
>>   target/arm/cpregs.c    | 482 +++++++++++++++++++++++++++++++++++++++++
>>   target/arm/helper.c    | 472 ----------------------------------------
>>   target/arm/meson.build |   1 +
>>   3 files changed, 483 insertions(+), 472 deletions(-)
>>   create mode 100644 target/arm/cpregs.c
>
> Ok, now I'd like to know what the intended difference between cpregs.c and 
> cpustate-list.c.  If it were only write_cpustate_to_list and write_list_to_cpustate in the 
> latter file, that might be one thing.  But get_arm_cp_reginfo definitely belongs in cpregs.c.

Well, to be honest, this came from a reviewed patch from the original
series, so I assumed it had already been discussed and didn't put much
thought into it.

I'll have to rethink this split a little bit due to your comment in
patch 20 anyway, so I might just drop this new file.

Thanks

>
>
> r~
