Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1789092njc;
        Mon, 25 Nov 2024 20:55:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZAhK6OBqkowKMKQvN85H9ImdutfWmvSwG7LX/KokVGZNNpMufxRh6bfOFVu/D9bhHTE8w
X-Received: by 2002:a05:620a:6014:b0:7b6:6e3f:49e0 with SMTP id af79cd13be357-7b66e3f4b97mr643732785a.41.1732596929485;
        Mon, 25 Nov 2024 20:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732596929; cv=none;
        d=google.com; s=arc-20240605;
        b=d3JxyuFx0Zo6lwWbbz+QYmeYmNbngzR2LOWaRMKjs2C/b3hv+z3hzmldv0Wd+yZi1H
         EyXIL9Ig9S1rEBi5trLtBUax518U3eBDE99B6M0U+hgyQZtVvdN3HiZYier2EEEygRyQ
         QVALiVSYwhqIJxXwXN25kDTne3FTDaPzUlVUTTRmQwvyLOK3gsb/3axViVDJy9hWtsXN
         jUKXg2W64zq/A1t8ZRH/cxhOiFO/tdlc1QcNsdZIz3wDNr8f1lDkXlRleUcfJtERhFTc
         0amq2DZcl1V8u/mIT1a6PidYBf8sl1Heprd25W4Er2sxhPjN60+unhccrgjRapbE2u9U
         J++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:references:message-id:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=qSaTMPbLh+/G8hvgbbGFPh/Ds4pXGkRFAz+AHaii6WY=;
        fh=2X1HOgnBPvsDtbVIMWvrMZqL/zr/DmDFX9f9Bb810dk=;
        b=KKY7Jiz54915dGnv5jU3M7WcC2NgQ73XWFsTQ9NS1CbhAa3WQOrzaaPXqYM5cdtNAo
         ZvP5OLuP/1GNUbBclUCPOINFO4lxNdcPL3gdLwWnLdH3zGgVDTV40qJk49DEns7n6DbF
         l6tnwMb+YIYvfDLGkRh9vCPS2FT+81BiJqcvsT67fTuqwyKmPBMvPT+Cl1+KRhSXARJF
         LGd3XxGbhrq6AN/etavXGYuFMHHXOhdcPxQ9poa+eEYyRgWYYIaVHBf8c9EFJoZDGx6t
         JE/936OF18BN2LPFP+tCUfY75/ji4EVKwJy11X/mMt1srz23IQrHb5YF8rSL8bS8N5P9
         m2fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cYQTKDwS;
       spf=pass (google.com: domain of anisinha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=anisinha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <anisinha@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b65751b87esi978309285a.172.2024.11.25.20.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 20:55:29 -0800 (PST)
Received-SPF: pass (google.com: domain of anisinha@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cYQTKDwS;
       spf=pass (google.com: domain of anisinha@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=anisinha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732596929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qSaTMPbLh+/G8hvgbbGFPh/Ds4pXGkRFAz+AHaii6WY=;
	b=cYQTKDwSvTe/qXEmM/yYRICWab6e27ojpY3/22YT+xAmoKThPQgRQ3lkKVzizQWKCXC6Ch
	tISKJp2ggzSLFLuVbu2KP/vSHfdLfoqesxSspDhyaJymxMFRmEeDAG6NmLD61Wv3zRRXP0
	Z1Y9tJ/JQzv0raEvWHiZOdOb2F5aAoY=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-0rhdJC9HNUm6kLEwlm66fw-1; Mon, 25 Nov 2024 23:55:28 -0500
X-MC-Unique: 0rhdJC9HNUm6kLEwlm66fw-1
X-Mimecast-MFC-AGG-ID: 0rhdJC9HNUm6kLEwlm66fw
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-211fcbd2325so60318635ad.1
        for <alex.bennee@linaro.org>; Mon, 25 Nov 2024 20:55:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732596925; x=1733201725;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crgtnuFSn4RKN1oCL5EUeP8sV5iqv+TSrOEjccDNx+0=;
        b=MmepbMoOVQnRyVfeA7jtsKjPVpCoc57gK8mptMZZSiTfnNxbO8V+DUb00FXmJkgUue
         yMT80L9Dk0Coy8fOcI+EDD62W0mkmUj/Ac1UFSVLtwvRFoAWvHB2kh1Xwd2sXVB69oHt
         +HrcUPBVsypvfzlo6lj1nKG1+kRZbGRz75Pfgvj9bMfB+ZZg+Rsf7aXAonrqbFkEasE7
         y4wwYvG1B2dUngkGW90nuV/IuFzihJsr5C4HGCDw5NPXrVKmrbMPH3JoA35sXZkAN38Z
         aLlbk8PczHMl1aBovMen3HpJgoDGkd8AMdjKjGAj9n1L9+cLlaE5/P6/5zuROoD3SdF5
         QFlg==
X-Gm-Message-State: AOJu0YxfnFEyC4uSaZ5/yul8Ah/EXjp8QYzQvUYLOFNs0d6cAY7hVw9N
	ofXe8vXsvRSCXcRZKletS0CXlDu23T429yHUclr8MFzoEvHqhoqf4NChOXbRzlruWLCCP144o5i
	9B8pHLOOWtj8aBt/VRW9EHPm+nhEfFENoycroTc0BqyRAvVJK4S27ZZnA1/I7zX1rIumJnLHCvb
	OZaWCSJxK0d4h+WhR2zHhdnqgUucROc0BRbify4KuIu5Y=
X-Gm-Gg: ASbGncuUGjmtgyf5KHXLgVa3bcTzBtQa8uYh/p06QIHBmmIta6ycjE0LjAMT2vTtBeI
	uOPDJxmQIWxd2bqmscIaKGB2Xpx8U/ow+W/k31suFOtttqId+rBPQ8ziS7k1szdZNiyPPuaUbFo
	vURfaUOKQEyky/OvdoH4JqHX7FOJdMvGFxPmYeEFFADHC4WghTqbHBKWpif18zJ55Xze5FffqrK
	iUhmuEf3e4xan4XFXtBLh38VSA2zp3tjF2SeXybFX7BAhCjoi6Ml7HkIp67HSDIRA==
X-Received: by 2002:a17:902:da87:b0:211:ce94:866a with SMTP id d9443c01a7336-2129f27edbcmr208019895ad.40.1732596925638;
        Mon, 25 Nov 2024 20:55:25 -0800 (PST)
X-Received: by 2002:a17:902:da87:b0:211:ce94:866a with SMTP id d9443c01a7336-2129f27edbcmr208019295ad.40.1732596925091;
        Mon, 25 Nov 2024 20:55:25 -0800 (PST)
Return-Path: <anisinha@redhat.com>
Received: from smtpclient.apple ([115.96.111.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbff4basm74873375ad.116.2024.11.25.20.55.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2024 20:55:24 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH 39/39] docs: explicitly permit a "commonly known identity"
 with SoB
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20241121165806.476008-40-alex.bennee@linaro.org>
Date: Tue, 26 Nov 2024 10:25:01 +0530
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tsirkin <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 John Snow <jsnow@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Berrange <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Message-Id: <FF4D6240-DB71-4111-B7A6-E95E2C5ECF7B@redhat.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-40-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3776.700.51.11.1)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rtKLENbNTBpzIDavLBrhWs2bSUK4bD-n4nY66CnFSRU_1732596927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6IHkq4ZebrKp



> On 21 Nov 2024, at 10:28=E2=80=AFPM, Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>=20
> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>=20
> The docs for submitting a patch describe using your "Real Name" with
> the Signed-off-by line. Although somewhat ambiguous, this has often
> been interpreted to mean someone's legal name.
>=20
> In recent times, there's been a general push back[1] against the notion
> that use of Signed-off-by in a project automatically requires / implies
> the use of legal ("real") names and greater awareness of the downsides.
>=20
> Full discussion of the problems of such policies is beyond the scope of
> this commit message, but at a high level they are liable to marginalize,
> disadvantage, and potentially result in harm, to contributors.
>=20
> TL;DR: there are compelling reasons for a person to choose distinct
> identities in different contexts & a decision to override that choice
> should not be taken lightly.
>=20
> A number of key projects have responded to the issues raised by making
> it clear that a contributor is free to determine the identity used in
> SoB lines:
>=20
> * Linux has clarified[2] that they merely expect use of the
>   contributor's "known identity", removing the previous explicit
>   rejection of pseudonyms.
>=20
> * CNCF has clarified[3] that the real name is simply the identity
>   the contributor chooses to use in the context of the community
>   and does not have to be a legal name, nor birth name, nor appear
>   on any government ID.
>=20
> Since we have no intention of ever routinely checking any form of ID
> documents for contributors[4], realistically we have no way of knowing
> anything about the name they are using, except through chance, or
> through the contributor volunteering the information. IOW, we almost
> certainly already have people using pseudonyms for contributions.
>=20
> This proposes to accept that reality and eliminate unnecessary friction,
> by following Linux & the CNCF in merely asking that a contributors'
> commonly known identity, of their choosing, be used with the SoB line.
>=20
> [1] Raised in many contexts at many times, but a decent overall summary
>    can be read at https://drewdevault.com/2023/10/31/On-real-names.html
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Dd4563201f33a022fc0353033d9dfeb1606a88330
> [3] https://github.com/cncf/foundation/blob/659fd32c86dc/dco-guidelines.m=
d
> [4] Excluding the rare GPG key signing parties for regular maintainers
>=20
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> Acked-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20241021190939.1482466-1-berrange@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Acked-by: Ani Sinha <anisinha@redhat.com>


> ---
> docs/devel/submitting-a-patch.rst | 7 ++++++-
> .gitlab-ci.d/check-dco.py         | 5 ++++-
> 2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-=
patch.rst
> index 83e9092b8c..10b062eec2 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -18,7 +18,7 @@ one-shot fix, the bare minimum we ask is that:
>=20
>    * - Check
>      - Reason
> -   * - Patches contain Signed-off-by: Real Name <author@email>
> +   * - Patches contain Signed-off-by: Your Name <author@email>
>      - States you are legally able to contribute the code. See :ref:`patc=
h_emails_must_include_a_signed_off_by_line`
>    * - Sent as patch emails to ``qemu-devel@nongnu.org``
>      - The project uses an email list based workflow. See :ref:`submittin=
g_your_patches`
> @@ -335,6 +335,11 @@ include a "From:" line in the body of the email (dif=
ferent from your
> envelope From:) that will give credit to the correct author; but again,
> that author's Signed-off-by: line is mandatory, with the same spelling.
>=20
> +The name used with "Signed-off-by" does not need to be your legal name,
> +nor birth name, nor appear on any government ID. It is the identity you
> +choose to be known by in the community, but should not be anonymous,
> +nor misrepresent whom you are.
> +
> There are various tooling options for automatically adding these tags
> include using ``git commit -s`` or ``git format-patch -s``. For more
> information see `SubmittingPatches 1.12
> diff --git a/.gitlab-ci.d/check-dco.py b/.gitlab-ci.d/check-dco.py
> index d221b16bd5..70dec7d6ee 100755
> --- a/.gitlab-ci.d/check-dco.py
> +++ b/.gitlab-ci.d/check-dco.py
> @@ -78,7 +78,10 @@
>=20
> To indicate acceptance of the DCO every commit must have a tag
>=20
> -  Signed-off-by: REAL NAME <EMAIL>
> +  Signed-off-by: YOUR NAME <EMAIL>
> +
> +where "YOUR NAME" is your commonly known identity in the context
> +of the community.
>=20
> This can be achieved by passing the "-s" flag to the "git commit" command=
.
>=20
> --=20
> 2.39.5
>=20
