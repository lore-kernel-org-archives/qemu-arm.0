Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2655793ejc;
        Tue, 17 Jan 2023 10:55:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvRDMAzAuHrIp6YyBpFhlh/5jkiIP70cLPcvboHy7WnUqDUBwigOlY6IGaIc0v8fwL54ixZ
X-Received: by 2002:a05:600c:3b83:b0:3d9:f758:e280 with SMTP id n3-20020a05600c3b8300b003d9f758e280mr4142062wms.24.1673981724817;
        Tue, 17 Jan 2023 10:55:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673981724; cv=none;
        d=google.com; s=arc-20160816;
        b=Kwij8d7V2+irl32Do1/YXEUGNP7P+Fnt8GD4RAA5RIcR3vvbjuqAIY9ixOsadhKFmD
         lfeVmDmvy4p7aquM434kHJWkZ6KJ+Q0GUsdq+LS5LmXTtwB3Ul8xB/5/kbzY46y92HrK
         3GYV4grFzqIL9+gyoaCdrpRu5cHeBkrwVQDr37+65r0ajNqe7EByQgU7rc5UGqCkL3OZ
         IEG2aUzTVjcWxdnrbnw2iQ+wMQ6dYgw0NaFx0wvIteEUrDxE1tqRzaQdbZ9eO8uZZHhT
         tLrBjYlqBkjsV2S0eswBWPg9NxR2G0TUKHhtpBAvK0XslTHQ0tTthU546I5csEreWJLI
         mVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=dZv+jTHc+XmPDQ3MR441gXG/YLreUAMyp4/Uz9nuK/I=;
        b=yAjk0yRevSvI5ogJeGK++sxYdzWGEWb1QcczM88g0sBFhAlAb642vCtYYtf4RcHfTo
         i/Qdsf1uXrZ/YGWiu2Ehr725uzofyZpOQntft8MTwAIQuSXv6CXpO4er9387XdDYPQ5F
         CAsguanWAPFyqKvqlun202oqLkC8y5pRuwEZs43Eq6wZoHkFisCvce8qesAtcpPLZZnT
         pCmTgKzTJL6gynmIzdNU2KXPBXzHKdLjGQEAC1gWjYCac5XB6+MuVTmuHCIUB/j0byj1
         I+fABZm06Zxc1v9oAUgHYr9i6dI2RI4l477BWSvphJVXySwpxAXyMYBGtI82SclKbnTb
         elbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FArfxiRc;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=FGFsL8iq;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id w10-20020a05600c474a00b003d9f86da484si21444732wmo.97.2023.01.17.10.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:55:24 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FArfxiRc;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=FGFsL8iq;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 256B11FF3D;
	Tue, 17 Jan 2023 18:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673981724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZv+jTHc+XmPDQ3MR441gXG/YLreUAMyp4/Uz9nuK/I=;
	b=FArfxiRcCP2TEC7co3pL1n9jvAjmZ9G1G68/OVMq4kNJduHxeHXIe/WAz6cMwsHkxymTGT
	Fbzjw2usV/KsZ+LIRGm3x1qWe6+cgH3bVjk6Hr1dnPbuqE6QF6ovy6I6j2vFDguJdy1KLs
	lSj6BUQAVuB6dW7KDKdU4gdQK/tOnyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673981724;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZv+jTHc+XmPDQ3MR441gXG/YLreUAMyp4/Uz9nuK/I=;
	b=FGFsL8iqR7Gy0WR+3SlQuf1CR+NyVvvCzfs9sTOxUXLfKwCxHDpu2cmQ1xhPxbEWjlDzzV
	Xtfe2LkSUHwvycDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4C251390C;
	Tue, 17 Jan 2023 18:55:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8l+BGxvvxmOoNwAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 17 Jan 2023 18:55:23 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>
Subject: Re: [RFC PATCH v3 10/28] target/arm: move helpers to tcg/
In-Reply-To: <7d47f4df-1a14-d448-f8df-9c31dc2ee371@linaro.org>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-11-farosas@suse.de>
 <7d47f4df-1a14-d448-f8df-9c31dc2ee371@linaro.org>
Date: Tue, 17 Jan 2023 15:55:21 -0300
Message-ID: <87h6wp0z52.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rLbkDKxWLKit

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 13/1/23 15:04, Fabiano Rosas wrote:
>> From: Claudio Fontana <cfontana@suse.de>
>>=20
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>
>> ---
>>   target/arm/meson.build               | 16 ++--------------
>>   target/arm/tcg-stubs.c               | 23 +++++++++++++++++++++++
>>   target/arm/{ =3D> tcg}/crypto_helper.c |  0
>>   target/arm/{ =3D> tcg}/debug_helper.c  |  0
>>   target/arm/{ =3D> tcg}/helper-a64.c    |  0
>>   target/arm/{ =3D> tcg}/iwmmxt_helper.c |  0
>>   target/arm/{ =3D> tcg}/m_helper.c      |  0
>>   target/arm/tcg/meson.build           | 14 ++++++++++++++
>>   target/arm/{ =3D> tcg}/mte_helper.c    |  0
>>   target/arm/{ =3D> tcg}/mve_helper.c    |  0
>>   target/arm/{ =3D> tcg}/neon_helper.c   |  0
>>   target/arm/{ =3D> tcg}/op_helper.c     |  0
>>   target/arm/{ =3D> tcg}/pauth_helper.c  |  0
>>   target/arm/{ =3D> tcg}/sme_helper.c    |  0
>>   target/arm/{ =3D> tcg}/sve_helper.c    |  0
>>   target/arm/{ =3D> tcg}/tlb_helper.c    |  0
>>   target/arm/{ =3D> tcg}/vec_helper.c    |  0
>>   target/arm/{ =3D> tcg}/vec_internal.h  |  0
>>   18 files changed, 39 insertions(+), 14 deletions(-)
>>   create mode 100644 target/arm/tcg-stubs.c
>>   rename target/arm/{ =3D> tcg}/crypto_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/debug_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/helper-a64.c (100%)
>>   rename target/arm/{ =3D> tcg}/iwmmxt_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/m_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/mte_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/mve_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/neon_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/op_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/pauth_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/sme_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/sve_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/tlb_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/vec_helper.c (100%)
>>   rename target/arm/{ =3D> tcg}/vec_internal.h (100%)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>> +void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndr=
ome,
>> +                        uint32_t target_el, uintptr_t ra)
>> +{
>> +    g_assert_not_reached();
>> +}
>
> Do you have a plan to restrict the calls to raise_exception_ra() to TCG?

Not yet, looks like moving the sdiv and udiv helpers which call
handle_possible_div0_trap would be enough.
