Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5372752ejb;
        Tue, 7 Feb 2023 05:45:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+TO74zKEg+Ryfkv65o+LpEvvmi71oeWyJXdSpAbKzjTZKq0rYloaayCqn/1twhMKFP0R6X
X-Received: by 2002:adf:e749:0:b0:2c3:e5f5:9faa with SMTP id c9-20020adfe749000000b002c3e5f59faamr2963325wrn.58.1675777523543;
        Tue, 07 Feb 2023 05:45:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675777523; cv=none;
        d=google.com; s=arc-20160816;
        b=W5WPvdWalr6Yd8GSY3HEpjXInOjL24D0S0EFqP6NGooH++W/vxzZZqHZEiHFbeYrkx
         pBHAWOX3Wk8l6qgtsmDDFNco/yv0a7RVvJDbFoKHMi2tw8AXgr8qU7lcAJFinkIS4+La
         ciUlW8oylminiVOkKOfpMHYvPJy4Q1LbjEsZHFY164MRCIVVGyXDgCcB/vXetHKyoe/j
         24s/Tp/CFm0tN2Nx4Gjwzb/p82LiwUFm4hf4Lmg/j7cnLHxC56kmP6WwMwN4HPtQdcUm
         vYToMnl+dkDxo7yuVwP0ZiCGScTsclE7L+5NNxdreAVhoqhscbGNC7OetGM138/gd6Ij
         ZVDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=lV+K3kPtNhC/p8IGUSrKR6VGBaVMLoXYdz3X4AnBffs=;
        b=MCgJHmgmdpovTx5d5bmv+wdnR2LIfDjdtdmVetD68TSH7L+eKXoJGS1bHOEwZEHYvR
         KAFwE6nSD4dqY0FHv882472vSmFWjYHJ+r43/xO44ihxN3U5osXUWc1+aj0JkpLX9M+r
         H8j3rAwFA3AZwMM9Rx8b2SkH+Qz+bQt9bJWVTYpKBbNaLHq/oKMtoHhxB0UcqhrUrPjg
         sJWYTXYw4GHKXCKCN+wYz1HvA05ZwBJlLN5RLKTLZCXIarOjerz4F90sB63z2U4GMN7G
         As/jN3Ft/5KSsczUNDlywHls1VgtZOXkDL1hgglJhY3608DXcdwXRl7RfOKNf/nEFyQL
         FxNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZjgCf07Q;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="E/1TZG4j";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id v14-20020a056000144e00b002bfc14eca1bsi16995267wrx.342.2023.02.07.05.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:45:23 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ZjgCf07Q;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="E/1TZG4j";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1801E3F29E;
	Tue,  7 Feb 2023 13:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675777523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lV+K3kPtNhC/p8IGUSrKR6VGBaVMLoXYdz3X4AnBffs=;
	b=ZjgCf07QrD4r7ttu2zXVAo7+vY/b2ME9xbC51AaZyoemwqsHUekGgX2xiFoN4IYR74bUes
	McdOf/pE/WjaYY4X0ra4roi2jCi63qu2p1sSOjGCQFPmi1Y5GDXkwom1JabubXqb8vitm4
	Ho8e/oZhmaBQoJASK+5eNaBWl9oEHWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675777523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lV+K3kPtNhC/p8IGUSrKR6VGBaVMLoXYdz3X4AnBffs=;
	b=E/1TZG4jpDeavK83icDrcSd4/R6Z6SvO8eGcHK1R6K/M8euciI5LRLe+pFgiWYplTNoODa
	5tlXqb7avZIe5eCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D4C3139ED;
	Tue,  7 Feb 2023 13:45:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kT2eGfJV4mPIeQAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 07 Feb 2023 13:45:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] target/arm: disable FEAT_SME if we turn off SVE
In-Reply-To: <20230203100551.2445547-1-alex.bennee@linaro.org>
References: <20230203100551.2445547-1-alex.bennee@linaro.org>
Date: Tue, 07 Feb 2023 10:45:20 -0300
Message-ID: <87cz6loahb.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: HbSiRORq8OPo

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Before this change booting a -cpu max,sve=3Doff would trigger and
> assert:
>
>   qemu-system-aarch64: ../../target/arm/helper.c:6647: sve_vqm1_for_el_sm=
: Assertion `sm' failed.
>
> when the guest attempts to write to SMCR which shouldn't even exist if
> SVE has been turned off.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> ---
>  target/arm/cpu64.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 0e021960fb..a38d43421a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -409,6 +409,13 @@ static void cpu_arm_set_sve(Object *obj, bool value,=
 Error **errp)
>      t =3D cpu->isar.id_aa64pfr0;
>      t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, value);
>      cpu->isar.id_aa64pfr0 =3D t;
> +
> +    /* FEAT_SME requires SVE, so disable it if no SVE */
> +    if (!value) {
> +        t =3D cpu->isar.id_aa64pfr1;
> +        t =3D FIELD_DP64(t, ID_AA64PFR1, SME, 0);
> +        cpu->isar.id_aa64pfr1 =3D t;
> +    }

What about -cpu max,sve=3Doff,sme=3Don ?
