Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp640483ejc;
        Thu, 19 Jan 2023 13:47:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuQwvLTxmCzca+qdDkt43d6J0tYHICe1DD3WomvBKet46ITjNA+it2gz9q1AUSuNv+bBdYF
X-Received: by 2002:a5d:4450:0:b0:2b9:d6ba:21ee with SMTP id x16-20020a5d4450000000b002b9d6ba21eemr11110044wrr.1.1674164848501;
        Thu, 19 Jan 2023 13:47:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674164848; cv=none;
        d=google.com; s=arc-20160816;
        b=fggX9uXKHMUY63evmDune0+dDfhWZ1xKIS5xRBqvZuobIJzovU31tVETRlf8KfM2Ao
         peivQIfaYP7htHjhLjBWDyn+AKlC7CvJ1QlIdb7DYP1tVIBtrAxjF5JFqhqeFBEiLE82
         JF1Fq+dUBqfczwXSfa6ZcPWdcFhXqv+XyYSfu3q0h6ug0KRkOejMfOdrPIoolyrWajOb
         FTq0OR4ZCHhCNOM2OJD3DnNM8RON0muvPkhUU6eUGTG+xHS3H6aKYn5W5GMWi3/o8m2e
         LpcixWDgNRAIRDHl/N55LhHb/XxqME0BBe4n35K7TkLG9rf13Mnt5TNNTFGtI5Bn/WEN
         s1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=yXfsJQS/vLNCxRKxsuQYc9ooKEWHaLf6F7JzyNJQYUU=;
        b=U6mTENAOt3Npk6hL1yGDu1+HoF3zw1HMd+IcFViBGYauLKo2UbiMaMumiUjsCT3USI
         3tHdFmwcfyMGRQXqDf6AHIccK9kT3o9csIBT461Kj9oT6vrZnoVA0DzRuOlCWvOS4LC8
         Vg+doMltHle3AwxhOVUngZ+39Y8ZnLYmpzNdgPrHuXctX1XprW7yqzGYhMTOcvM24AwN
         TUvco6bS5SP6vOxKtoUU0+MVOGug4rYsf98tWZAnsAsFtnQaS/HYEPPXILMOPat+gemn
         rXTKWBVTU3n+kWgQE1UubwhAhVk1qgcarSw5u1qz7lH8/vnhuOh2DxBFe3uB8HYmqlh7
         TmUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=LHUeRo2K;
       dkim=neutral (no key) header.i=@suse.de header.b=upB2fhqm;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id c12-20020a5d528c000000b002be34f5ad88si4521596wrv.618.2023.01.19.13.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 13:47:28 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=LHUeRo2K;
       dkim=neutral (no key) header.i=@suse.de header.b=upB2fhqm;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CCAC05D356;
	Thu, 19 Jan 2023 21:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674164847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yXfsJQS/vLNCxRKxsuQYc9ooKEWHaLf6F7JzyNJQYUU=;
	b=LHUeRo2K1IRCY+WFx/S90Q0bGkZQW+zvr14hSsRMfXGYPDPeVziSqguSE4K+AHki13IQ4E
	yXAPuDPaRv8XhVYhAJHvwDzonxroGIK3+i+UMj31t82lxQfhvovUBlZC9e5tzAlbCYZMDS
	yhLokNDOesZrkUD74s4aMQAZ4foAbc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674164847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yXfsJQS/vLNCxRKxsuQYc9ooKEWHaLf6F7JzyNJQYUU=;
	b=upB2fhqm0Kb6oiK9jNgU/a+irnv7dcD532MsLMMiU/JPD+WMEKZ8I35Nvc4dkDalGgS9xT
	zmf59xN0JgmPg+BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B3E4139ED;
	Thu, 19 Jan 2023 21:47:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id FGyNCW+6yWMafAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 21:47:27 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH v4 15/15] arm/Kconfig: Do not build TCG-only boards
 on a KVM-only build
In-Reply-To: <0e4e2776-c44e-343b-1142-e236e38f35cc@linaro.org>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-16-farosas@suse.de>
 <d700c608-f886-8b6f-1ecf-bc48cf671153@linaro.org>
 <0e4e2776-c44e-343b-1142-e236e38f35cc@linaro.org>
Date: Thu, 19 Jan 2023 18:47:24 -0300
Message-ID: <87v8l22o43.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vlAMtMvTCYQj

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 19/1/23 19:50, Richard Henderson wrote:
>> On 1/19/23 03:54, Fabiano Rosas wrote:
>>> Move all the CONFIG_FOO=3Dy from default.mak into "default y if TCG"
>>> statements in Kconfig. That way they won't be selected when
>>> CONFIG_TCG=3Dn.
>>>
>>> I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
>>> keep the two default.mak files not empty and keep aarch64-default.mak
>>> including arm-default.mak. That way we don't surprise anyone that's
>>> used to altering these files.
>>>
>>> With this change we can start building with --disable-tcg.
>>>
>>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>>> ---
>>> sbsa-ref has an explicit check to avoid running with KVM
>>> xlnx-versal-virt has avocado tests tagged with tcg
>>> ---
>>> =C2=A0 configs/devices/aarch64-softmmu/default.mak |=C2=A0 4 --
>>> =C2=A0 configs/devices/arm-softmmu/default.mak=C2=A0=C2=A0=C2=A0=C2=A0 =
| 37 ------------------
>>> =C2=A0 hw/arm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 42 ++++++++++++++++++=
++-
>>> =C2=A0 3 files changed, 41 insertions(+), 42 deletions(-)
>>=20
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> The previous version was cleaner IMHO, not restricting only the
> machines but also the cores:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777724.html

I'm not able to apply that thread, there's missing emails in lore. =3D/

What do you suggest here? I like that you added detailed descriptions of
what was being removed and why. But it seems there's a lot left to be
restricted still, compared to this patch.

I also don't really understand what you mean by "also the cores". This
series already moved all cpus under CONFIG_TCG and what's left is only
the machines. If there's extra refinement to the configs, we should
definitely look into doing it, but I think that could come as a
follow-up series.
