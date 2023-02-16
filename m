Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp674109ejb;
        Thu, 16 Feb 2023 08:47:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9trnT4YX6JRwOtlBvfbH9d/xbkACELLrfQiD2V3XPgA2EkKeDK14c8uyT/t028+f/R4Fm4
X-Received: by 2002:adf:df81:0:b0:2c5:4c32:92c5 with SMTP id z1-20020adfdf81000000b002c54c3292c5mr5013098wrl.25.1676566075839;
        Thu, 16 Feb 2023 08:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676566075; cv=none;
        d=google.com; s=arc-20160816;
        b=SYMBQa8co4p9shePpc2b248RxfHVpDtD/E18AIZQJmxEQR6ghZliLzZgE7KYYFiIf1
         pCxm1jRBs6B7verLeVbQz8FKa7WNs4sLKBCN5SBnUjiMddi2dYwADjWouKhec/x5a+g2
         F7DCG+G0WtREEq5dOfzD2zvF+WeqTGm569hrMPik+6AcwcchuWJtF5gx1VSHv+W0vrK5
         mqFQnZ5lLlXCZYJmTjDedkrkHN/a/V35xnYF86GmzQ3WNT5IsBsLjEQziUuzaKHK4R02
         kq749aVCNeQ0hsV7IXm9B2EenwQN8g/lfCQTpYnn7YPzNwX+M56LfRHJh9L25kJby9ND
         ojig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=9BXwRmktdYDT64nWxu6McPLW5wPO1Yug5aQx11PgREc=;
        b=UzRXtXZxUKRWkWfUOQ+0Xt+lcyTpznkgXdijdSdeLjhE8qFD/FaNXs3U2BYcox1d9d
         UV/asKK4eNKrZmYKZLOB9cMICx5SrM0L3s0EUTDBLYP1xgJ3u06T2Z28grs1tp/Kdu/x
         0ejBgBvU0KRXikELLFHGvWGw5pP1NwJJAqTtvWUPtaBtMuwGXVFheFeNKBTpD5Z/6+ys
         e+0LK6tLKpzbkJYG30Dq710jGdSAyWa++VUJqF3S5eNEgwYBzjS9gfLFNxwJ00pQMV3+
         wtEtn1e2tE2aJqkcg3rHhK9vG7r8enJC71q9Xo1q6EyildPnluB06OBDrVIoyHPGTau0
         SpeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Ve7NQeBL;
       dkim=neutral (no key) header.i=@suse.de header.b=deVDsdPy;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id c18-20020a5d4cd2000000b002c56aea7d59si2196981wrt.1002.2023.02.16.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 08:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Ve7NQeBL;
       dkim=neutral (no key) header.i=@suse.de header.b=deVDsdPy;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4D59D22580;
	Thu, 16 Feb 2023 16:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676566075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9BXwRmktdYDT64nWxu6McPLW5wPO1Yug5aQx11PgREc=;
	b=Ve7NQeBLXO2to4huSdJet4OuTukFRJ1wNno+C2PSdBE3gj98eJFgVeZTZbmAEOwp7LWSOe
	GRNIF8aetC6X3ROi4/N9rRreX/qOLlmPuq0SO+h1DeSyD5UY0zddsG68QiKexkMi+J1C+3
	XbyxdvmRmkJHIiSttZXXyQIfbZ0cq84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676566075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9BXwRmktdYDT64nWxu6McPLW5wPO1Yug5aQx11PgREc=;
	b=deVDsdPyUmY2X47gaIoMZu4fKaVWWHtgmmsozHi57YwgzrOugDssjFkCz+tYJOozVkhbnp
	0v5U3O1rsBljNECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF47B13438;
	Thu, 16 Feb 2023 16:47:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +qLFJTpe7mPRNAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 16 Feb 2023 16:47:54 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
In-Reply-To: <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
References: <20230213202927.28992-1-farosas@suse.de>
 <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
Date: Thu, 16 Feb 2023 13:47:52 -0300
Message-ID: <87357536br.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: Z/g8VkFBNhyB

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 13 Feb 2023 at 20:31, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Hi, could someone take this?
>>
>> I rebased and put the two series together to simplify. I'm keeping it
>> up-to-date and tested while it doesn't go in.
>>
>> CI run here: https://gitlab.com/farosas/qemu/-/pipelines/776103500
>>
>> Based on master.
>> Supersedes "target/arm: CONFIG_TCG=n part 1".
>
> I've taken patches 1-5 into target-arm.next.
> Patch 6 doesn't apply on top of my tree, which is unsurprising
> given that it's trying to move 9000+ lines of code in a single
> patch. That's so much I couldn't even figure out how to recreate
> the code movement locally. The diff is not very legible either.

Ugh, sorry about that. I forgot to apply --patience on this last resend.
That diff should be just a sequence of 9k '-' lines and 9k '+' lines.

I'll try to split it up, let's see how it goes, the ARMCPRegInfo arrays
are huge, they might end up pulling everything with them.
