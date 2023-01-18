Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp852000ejc;
        Wed, 18 Jan 2023 13:28:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsgSrzA1EajrbF3vSaRz6nTkprPjLa6nu+dYqg8VSbSli92A+DFUSwNnXS0cdBrsY0yG0WQ
X-Received: by 2002:a05:6000:23c:b0:2bd:ef16:199b with SMTP id l28-20020a056000023c00b002bdef16199bmr15911291wrz.41.1674077286065;
        Wed, 18 Jan 2023 13:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674077286; cv=none;
        d=google.com; s=arc-20160816;
        b=kiM56abvEBBROP/wWFqkBDydVbIyDstKIqhp/bxLx664/kF2/3MVt4yq951GsTjntu
         7i0mPVUcP0Pm0sMwJNn/FJ+WfvapIKy3EA/WloJGFSwbpkvtuPQvEjww1zBrACPxuVWs
         50kFwJRcK5qcWrkA+KvbLMG8B/KGnbCUOez50RlL1X+IrChjPsgTwoXguvYLSrBRc59D
         SsVKKry9zgCuxNt53lEaPL2lWRoYUvGKSZKWg9aktwFdf+b02LexquFcPZM8HyRjZVUz
         cfDybvE0zus+wbrJ5PTMSizF0nfzbW9CA9ZLn4hyyfMbquK/rJZoYpreVV4u9juWfI0X
         2t5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=0BSc5p7bKJXViDI3RVXRkdjdywP5P+IzvQ5qhCGuF4I=;
        b=nKt8Tml5EPe1rNe/HDeLokxBLeI7TCQYdJTgPTTuFHxRI/t9UolcYbrUqTnWdMpgmL
         YY2FAYUK6cm4b3uH8XCMsUMrBoLctgTT4V2wB0MUfGCeBvLq3z6b5Rx4b1dmYTsxmqsI
         3C1UdbLmvrm41wNt+vIIk1WOcWxwaQ8c+KufOlwFTb7s9ojkpM8s21fM8tIKYmA1TjAv
         zuDnYTf3wOg5Q3Xi06gluugurnFh3XcDPr6s5Q/QheP90fRikZpykKGDw6L2X5N2a9x5
         SAzCMzRR+xnUAuPHq6c1Pn4cX91QeSNxYYN8SBb7P7JvpSr81qdPbqCckEU2bEF02deP
         WSIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zTMoAHVU;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id ch14-20020a5d5d0e000000b002bdfcc4b781si11341509wrb.221.2023.01.18.13.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 13:28:06 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zTMoAHVU;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F1A6B5C362;
	Wed, 18 Jan 2023 21:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674077284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BSc5p7bKJXViDI3RVXRkdjdywP5P+IzvQ5qhCGuF4I=;
	b=zTMoAHVUaBWisdS6w3eu0KIByeCOKJKBJiPAyPm0Bkhxpw+b87kZX53qCGfOw0pZusmj8k
	0zkS/sLTdZGS3CNaQtAASkW1Hpmq7Hj6GGvCLEUKixmuAiQZxSa0AzB6FnqWaN/u/nzLYo
	oWNuSmGu9MfcC/clu2HHXfFff/OieWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674077284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BSc5p7bKJXViDI3RVXRkdjdywP5P+IzvQ5qhCGuF4I=;
	b=7NCheuY3ho43BppRhaQI0Mc2P350ih+pXaEVrVAiRRi8ozW+CfIjXeFCnkUPMQ5scRm/4X
	EPGto05UlKlU2gCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81199139D2;
	Wed, 18 Jan 2023 21:28:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id riK0EmRkyGP+NwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 21:28:04 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
In-Reply-To: <9c740b33-240b-b4f0-82a1-cc01ad886edc@linaro.org>
References: <20230118193518.26433-1-farosas@suse.de>
 <9c740b33-240b-b4f0-82a1-cc01ad886edc@linaro.org>
Date: Wed, 18 Jan 2023 18:28:02 -0300
Message-ID: <871qnrcz31.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DE18Vnj0Ps9L

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi Fabiano,
>
> On 18/1/23 20:34, Fabiano Rosas wrote:
>> These are the already reviewed patches from the first half of my
>> previous series:
>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>=20
>> This unbreaks the --disable-tcg build, but there are issues in runtime
>> that are still being hashed out in the other series.
>>=20
>> For the build _with_ TCG, this should behave the same as master.
>>=20
>> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
>> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@lina=
ro.org
>
> $ git am=20
> 20230111_richard_henderson_target_arm_introduce_aarch64_set_svcr.mbx
> Applying: target/arm: Introduce aarch64_set_svcr
> $ git am ./20230118_farosas_target_arm_config_tcg_n_part_1.mbx
> Applying: target/arm: rename handle_semihosting to tcg_handle_semihosting
> Applying: target/arm: wrap psci call with tcg_enabled
> Applying: target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
> Applying: target/arm: Move PC alignment check
> Applying: target/arm: Move cpregs code out of cpu.h
> Applying: target/arm: Move define_debug_regs() to cpregs.c
> error: target/arm/cpregs.c: does not exist in index
> Patch failed at 0006 target/arm: Move define_debug_regs() to cpregs.c
>
> I am based on commit 7ec8aeb604 ("Merge tag 'pull-tpm-2023-01-17-1' of=20
> https://github.com/stefanberger/qemu-tpm into staging"), what am I missin=
g?

How did you fetch the series? You are missing patch 06. Maybe it is too
big for the method you used?
