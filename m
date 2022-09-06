Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp3182325ejh;
        Tue, 6 Sep 2022 13:45:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5yVzBArF8rmyJ5Gd57ctOXBoOhTzaaQozjdF69N713Vdep2u1PysgrswgnOmP2pkg9udHT
X-Received: by 2002:a05:622a:178b:b0:344:55f0:192f with SMTP id s11-20020a05622a178b00b0034455f0192fmr335911qtk.673.1662497123094;
        Tue, 06 Sep 2022 13:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662497123; cv=none;
        d=google.com; s=arc-20160816;
        b=HwpdF9MIydyx3mWfqUXZa0OhuJ4Xlfa7Tp78VLk8GMhyCdnroNbtjyIX1VpHKZxlZ1
         czRrkb7HUhIfO7pvRRoUOhXlNGcrS4JKC3p5n2s1ehrdpSy94m8Gz+DxlhZLhS9ewjse
         fffU+MJwKOSVSTk8L3KZYJ2+n/tMuRLwddAPKLZwCPjE3Rjuu9G7GBmxplJUIo9rwqjT
         YyiC1G3r4fPQOP3FWknZHd4/E0y7ZYKtz+9DyJg3Ke9sfsyc5c7aW+iRgpk0yZhFy61t
         9DvPj2orr0U53BTXRX2meZxc1rupVgMEm92LmPES7tKA0jAdUZO2pNa4/2Q10eufz56d
         QxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:subject:cc:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:feedback-id
         :dkim-signature:dkim-signature;
        bh=u8PqlsTGRRNhe8EU7QHSPpRYK1LxejqlRIXFdMaPpxs=;
        b=i3MY8HQ5ZziR71DqKUzQ+QJD12l5ycEuubjvImS8ZSzo2sMEfZmU+oyZuVybtfRq1f
         i9cYmbK1e/vwAwL26sUHUFyQDcAUfiechc3RNQt9xfJHo2yFgoaMHIxWROB7t9Xt90ot
         grBZaVFJs+svzXr36vvOMl0C40WZ5y/q48pdHnF8esSw3FOrmoydzuZgkLCTtqB07X0a
         KVUdTa8FkzTxO0WddsMHY1jnRI9LCoSmQZac/4gRsqk6e4i/uv7BA3GZutt911C3IHkK
         MRgQGinjNre6fRjiJLOvAqGesWTFxmB4gAGMel4uT/UUBLV6ob5ndnY2LkXNuT+g3mZR
         m+mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@arndb.de header.s=fm1 header.b=faa6qsM7;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=DaDtKzE1;
       spf=pass (google.com: domain of arnd@arndb.de designates 66.111.4.229 as permitted sender) smtp.mailfrom=arnd@arndb.de
Return-Path: <arnd@arndb.de>
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com. [66.111.4.229])
        by mx.google.com with ESMTPS id u1-20020a05620a0c4100b006c9cc858824si1566973qki.338.2022.09.06.13.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 13:45:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of arnd@arndb.de designates 66.111.4.229 as permitted sender) client-ip=66.111.4.229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@arndb.de header.s=fm1 header.b=faa6qsM7;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=DaDtKzE1;
       spf=pass (google.com: domain of arnd@arndb.de designates 66.111.4.229 as permitted sender) smtp.mailfrom=arnd@arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id B089A58055A;
	Tue,  6 Sep 2022 16:45:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 06 Sep 2022 16:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1662497122; x=
	1662500722; bh=u8PqlsTGRRNhe8EU7QHSPpRYK1LxejqlRIXFdMaPpxs=; b=f
	aa6qsM7J5koeNq9oc8EmcPK54+LY93/nnBx5RNLy1CRQ3PLMEDLR6m0mqikAJA3O
	O3/kQpcWFK7gC+WcpNUsRmW2cRIxk7tLbxLA52GdAGr6LvalZvyLwdG+RR+3fUJH
	xq9rh/mXU5GffnSRSGd0TWDgH5EZjI05g6ZQPiTPHNDf6gqowpWiVLujFbstYlK/
	c0zEI3SgPF899LCdeHWxBaW1Y04L71Jdz2+UmSmwDrEP11m5cttm/FtdNi/i3ff4
	4ZYop/y/kKUhvZ1Q532HbyIvbuqY+zyoURPa9gzCtntaYYDyDuWFVp/ksuvZrQzj
	u3wvOEa3sSsh0fBPpgEDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662497122; x=
	1662500722; bh=u8PqlsTGRRNhe8EU7QHSPpRYK1LxejqlRIXFdMaPpxs=; b=D
	aDtKzE17UfrF6dgZcEoeJ+Hhjc8nyUK6xyLt5vIkjTat5c9oxYpRIrdSCByk9VC5
	w6AKWlz1+8ap8lL6FGRl59ocTzFT9vE/Y+dGQjbNaU0xQFqclVxi00dNw0A7mVvG
	QSIznq0p1/VPlr/SDabVrenzvXcas3zkLzjKoDmtke/zX4A5a2qz9Q1k4tOKVzqW
	xDhqL7secVigiYANPu+OTLcSKuoMAZuNKA0myn7fa/v+cCXsIriw4U/VjvUN4WQV
	3aOiEuRc+wSWBUqnhm73I/xyn5aIADADKLAFsxitmDfvrkf0m03G6T2n8S1QOxzj
	qkuN2oTwJC3F13pIUHxPg==
X-ME-Sender: <xms:YrEXY4rZNnBloMcp9N_XbqGwDIrH63ayoW-whR--72zJdmynyRLn5Q>
    <xme:YrEXY-q3-o1icWTQnHDqDlpfwGX9OfSporvpbi5j-IhRz5ByJLLPW5KPQ70nr4_5M
    DuJlqBf8xRFquebadA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelkedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:YrEXY9PiFCTZkvv17d_3lLv1reIMkggUKcoCicpakgFb1jXRt_dVXA>
    <xmx:YrEXY_6RFXqDgD0b6BCLxkMjDIFdxlFtZvlytXkH6GgfonQGh24u6g>
    <xmx:YrEXY34hxXLeWPUX0jsJgBl_N_44iRhyEkCZ942IkewdOq95APa33w>
    <xmx:YrEXY5nf_0PUvtG4AJMoaY6I37y_UH1x3DXsWrXOryoov0nkiLL1EA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 632A1B60083; Tue,  6 Sep 2022 16:45:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <49a0474b-96b6-4366-a6a2-f59ad0b5a0bf@www.fastmail.com>
In-Reply-To: <20220906172257.2776521-1-alex.bennee@linaro.org>
References: <20220906172257.2776521-1-alex.bennee@linaro.org>
Date: Tue, 06 Sep 2022 22:45:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Arnd Bergmann" <arnd@linaro.org>,
 "Anders Roxell" <anders.roxell@linaro.org>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] target/arm: update the cortex-a15 MIDR to latest rev
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nTscFmmll8je

On Tue, Sep 6, 2022, at 7:22 PM, Alex Benn=C3=A9e wrote:
>
> index 3099b38e32..59d5278868 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -588,7 +588,9 @@ static void cortex_a15_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      set_feature(&cpu->env, ARM_FEATURE_PMU);
>      cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_CORTEX_A15;
> -    cpu->midr =3D 0x412fc0f1;
> +    /* r4p0 cpu, not requiring expensive tlb flush errata */
> +    cpu->midr =3D 0x414fc0f0;
> +    cpu->revidr =3D 0x200;
>      cpu->reset_fpsid =3D 0x410430f0;
>      cpu->isar.mvfr0 =3D 0x10110222;
>      cpu->isar.mvfr1 =3D 0x11111111;

This will work correctly with Linux, but after I checked the
Cortex-A15 MPCore r2/r3/r4 Software Developers Errata Notice again,
I think that setting revidr here is not fully correct:

With an r3p3 CPU, bit 9 of revidr (0x200) indicates that no
workaround is necessary, but with r4p0 and higher, this bit
is marked as reserved and both the Documentation and the
Linux source code assume the hardware works correctly.

So I think this should either be 0x413fc0f3/0x200
or 0x414fc0f0/0.

     Arnd
