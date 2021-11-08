Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp196273lfk;
        Mon, 8 Nov 2021 03:57:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYHz0Wqent4EaIi18ZvpdIANNGkgEJ7uzzdRuQikzrdTijG9RtvCwUfCxd6E5xhWTMe3CH
X-Received: by 2002:ab0:6883:: with SMTP id t3mr83795360uar.66.1636372663773;
        Mon, 08 Nov 2021 03:57:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636372663; cv=none;
        d=google.com; s=arc-20160816;
        b=xTTA8142NSHB2LRxF7z/8VMHd+4eYx47to62ol8FPb+VBcGjBleoYltKwQhHAhaTW0
         /M0cgzesMp8YoX7U2otMqPGCd+URX4nU+LwK553Vb4dqD1inVKWsFyZH629I4c2t8wri
         75ys4ALkfr1fXVab/FGapyyUGE5oFQyUkqQYS1CabRCI8aRzqw8rGXerCcvNLZ3J7Sgw
         MFrEQEk/BFAWeHr4Su7ycuCmgAfMwYDH+CTzc35XqFGvUnd1aSQnpMGfNy8c5vq8T2E6
         f5FiesDbUNgXjxs9NufJMsVEOFb75TTm8OL2iR7BAn9U4M+OF4yuNQ2lGamKDsXnU/Jr
         fecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X4RW1zLyughl4DWgQO4RHNdWsaPHQa2528Lym9xiBzo=;
        b=gy1BPHR51mglM7X5bUYDtHNfnozYmOdwfEDov85h0l2uoiJQXoNmXdFpv8QaxxrYFk
         f82b1mlTS92yRhnqSeDKcKMJSf9cSVD587WDJqnWuotGNtMFDPc4ePNZNRGEPQ4exGx3
         JEn5oDhY3IMv+UX+xdr8cuhqSo14eMfQCWprIxuTI6iZBfuro1IAKq1RRzlhBuiX2g4K
         NXE56653irCwSrIRJaPEM+YRuQj9TwwRvM63vEtCgmsikSilhgYGIxDvomXr8vgPnP+e
         b8rKmqg2w4wTWwG4t6Cvg9T8fPsBPRhdQs9D1qVC1lM4/OV2B2J8MxCbesh5Fon7Cchp
         SX0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P4+et3qQ;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wrampazz@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id cd15si32080325vsb.144.2021.11.08.03.57.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 03:57:43 -0800 (PST)
Received-SPF: pass (google.com: domain of wrampazz@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P4+et3qQ;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636372663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X4RW1zLyughl4DWgQO4RHNdWsaPHQa2528Lym9xiBzo=;
	b=P4+et3qQoPDYZnNox7UlDo5zm7sAgpbBoTIiU9ebiW8jIEb5zGHW5WckCw++PhS/vjrKb2
	RVFVEEYKdzTQK8FpQZTJMleRsg5VibiHnmmpzh1ixueDtiKR2CQb8EaDcrpvo4ppRElioJ
	iXWsLgkrUSEI+3fSQG9dd71AK8VbbXQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-GXLOZR4qNzqSEclyFUByiQ-1; Mon, 08 Nov 2021 06:57:40 -0500
X-MC-Unique: GXLOZR4qNzqSEclyFUByiQ-1
Received: by mail-pj1-f72.google.com with SMTP id x3-20020a17090a1f8300b001a285b9f2cbso4706908pja.6
        for <alex.bennee@linaro.org>; Mon, 08 Nov 2021 03:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X4RW1zLyughl4DWgQO4RHNdWsaPHQa2528Lym9xiBzo=;
        b=63By9K+ySAE39XGOMXHuxqaggxCY6ZxzmBGc67KHaT+73ZEXeEXosQvk+pON67+S2T
         IMKMoy8eUUyIpv+5aUkHB9yD5cpXO0HJWSt3elUC3gS5v/lA7r+ZkBv5cVFQ4W/lN1Lu
         s3woHQp7lXHOe82GDAiEyb24ummWZkfbQitdgqTOFxhVx4JZgUk9DOSLfbf1l5hZj5XJ
         wYrUUZaMGsUj7s99R1sgdxPD574OX3mYskeHBXe5WkiljkPrjlL0t1zTk2Q6APxLocgM
         uPjtzVdbTNsSNR1K0DHwmrBSe7OvobmVMKRDRHig1McXr5bIjraTxzu93GTtuhZIj16P
         qB1A==
X-Gm-Message-State: AOAM5312S7mnaosIkG4fvSzxmqmN54djSX8S66rFwmiikC7qLUUZnbIi
	96iJdFz+vk4f6fb/BMOf8iQFLMzYY0+s53+J0JVo+QdzggI4/1H11w98rA1vCofg24wnyLlFNoa
	opgcSUAsWI6w2JLNkS9rKYPQZb9Aoe2lU
X-Received: by 2002:a05:6a00:1583:b0:49f:dc1c:a0fe with SMTP id u3-20020a056a00158300b0049fdc1ca0femr5314999pfk.46.1636372659307;
        Mon, 08 Nov 2021 03:57:39 -0800 (PST)
X-Received: by 2002:a05:6a00:1583:b0:49f:dc1c:a0fe with SMTP id
 u3-20020a056a00158300b0049fdc1ca0femr5314971pfk.46.1636372658991; Mon, 08 Nov
 2021 03:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20211105155354.154864-1-willianr@redhat.com> <20211105155354.154864-2-willianr@redhat.com>
 <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com> <YYjsvY3W27a1jUCD@redhat.com>
 <3aae05e7-823e-2761-0442-7fd92f3931c5@redhat.com>
In-Reply-To: <3aae05e7-823e-2761-0442-7fd92f3931c5@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 8 Nov 2021 08:57:13 -0300
Message-ID: <CAKJDGDY8_hvpqFeXfC=KpUHmyCVju1Z-LLdnw9JhibnQ2yeysQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado tartget
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
	Michael Rolnik <mrolnik@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	John Snow <jsnow@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-ppc@nongnu.org, 
	qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WMd9boh3gLfp

On Mon, Nov 8, 2021 at 6:49 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 11/8/21 10:24, Daniel P. Berrang=C3=A9 wrote:
> > On Mon, Nov 08, 2021 at 08:59:51AM +0100, Thomas Huth wrote:
> >> On 05/11/2021 16.53, Willian Rampazzo wrote:
> >>> This introduces a new `make` target, `check-avocado`, and adds a
> >>> deprecation message about the `check-acceptance` target. This is
> >>> a preparation for renaming the `tests/acceptance` folder to
> >>>   `tests/avocado`.
> >>>
> >>> The plan is to remove the call to the `check-avocado` target one
> >>> or two months after the release and leave the warning to force
> >>> people to move to the new `check-avocado` target.
> >>>
> >>> Later, the `check-acceptance` target can be removed. The intent
> >>> is to avoid a direct impact during the current soft freeze.
> >>>
> >>> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> >>> ---
> >>>   docs/about/deprecated.rst | 13 +++++++++++++
> >>>   tests/Makefile.include    | 17 ++++++++++++-----
> >>>   2 files changed, 25 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> >>> index 56f9ad15ab..7bf8da8325 100644
> >>> --- a/docs/about/deprecated.rst
> >>> +++ b/docs/about/deprecated.rst
> >>> @@ -410,3 +410,16 @@ nanoMIPS ISA
> >>>   The ``nanoMIPS`` ISA has never been upstreamed to any compiler tool=
chain.
> >>>   As it is hard to generate binaries for it, declare it deprecated.
> >>> +
> >>> +Testing
> >>> +-------
> >>> +
> >>> +Renaming of the acceptance folder to avocado
> >>> +''''''''''''''''''''''''''''''''''''''''''''
> >>> +
> >>> +The ``tests/acceptance`` folder was never used to store acceptance t=
ests
> >>> +in terms of software engineering. This naming can confuse developers
> >>> +adding tests using the Avocado Framework to this folder. The folder
> >>> +name change to ``tests/avocado`` also changed the ``make`` target fr=
om
> >>> +``check-acceptance`` to ``check-avocado``. In this case, the use of =
the
> >>> +``check-acceptance`` target is deprecated.
> >>
> >> Not sure whether we need  to document this in deprecated.rst, too, sin=
ce
> >> we're normally only listing the things here that affect the users of t=
he
> >> qemu binaries, not the people who want to recompile and run the tests.=
..
> >> OTOH, I don't mind too much either if we list it here... Anybody else =
got an
> >> opinion on this?
> >
> > Deprecations are only things for user facing changes in the apps.
>
> OK.
>
> > For build system changes we don't bother with any deprecation cycle.
> > Just make the change immediately and document it in the release notes.
>
> Understood.
>
> Willian, do you mind updating the release notes?
> https://wiki.qemu.org/ChangeLog/6.2#Testing_and_CI
>

Sure, I can do that, but I think I need to wait for the patch to be
merged, right?
