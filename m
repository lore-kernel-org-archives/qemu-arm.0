Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp970928lfg;
        Fri, 29 Jul 2022 07:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uW6vwSPoeaaCWQ1rOh3uY9bZeCDIjp/P7WRW2w7YMZ1mHV90fK0uPJE+yeHS9s4RomzBnH
X-Received: by 2002:a37:b483:0:b0:6b5:8688:5299 with SMTP id d125-20020a37b483000000b006b586885299mr2927461qkf.147.1659105543514;
        Fri, 29 Jul 2022 07:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659105543; cv=none;
        d=google.com; s=arc-20160816;
        b=tv8AUaUrXUQ7vhyIYNBzp8u99nTF+tIxq9W9R4bWPnnBVAoKBqvgnSqKACLkHOVnvm
         rpUxt03Vs5mWg5t5q72fUO0NaQ40HLTEjg1wSaOBHfeGGaDQAEBJgugwQMV9kqhDoJSE
         eOtPx1rnZDkbLNNHmbQgpG5zffDiRKcTZQNAMuB2y8x8fyW2wYZMfrYuCWJGmtCvVWn1
         ql8LJrI4EKae5t+2c0F+5HFbN8hgR6jHKS71tJdecNkY1gVI8QiHB9jy4RMVfZjgrRIe
         DuXN2xLQbFeUE5IocQCOizpmUcnWYqVlB1bDYMhbislujpp4WM4uA2xK5IShAMwj0IZI
         /ZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=dwDWhwWtd1UwGDpT/e/X5sZQv3LmMrrGlT4WK+vl3aw=;
        b=jxsKsWH54GUMbBFlo7M8MI6mRxATFPlTR/u+e2xsHEkokseUMmAm9uDDMhXU5k9I/h
         o7VqzeweSA0d4ykpYex9Ge3AbQofGgKstM005adW8o61wNzR//dy7EipLlLzcwWO/Qqx
         WqJyJMiuMIacbNnMhcxvYeFaKVOMUB9D6l8QMZf54NBJ1zBV/7RHxYxFIQlC2tq6eIG9
         M+hOzx9gshXAVM7pM/AAFRTrvAPt16a6GOEob/5aiGbW++np/rs93R6Rjgo24j78VEHT
         rHbnF8M6W0R3q7X52IZ2yDagjD/0s1RXtt3kAoLQkY7X/aYQqKQvTmlAI0rdpJ8Qs5za
         Da3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=RnqMF+op;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=zvAkoUtO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5-20020a05620a288500b006b5e3b35017si2140226qkp.746.2022.07.29.07.39.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jul 2022 07:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=RnqMF+op;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=zvAkoUtO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oHR8p-00066y-14
	for alex.bennee@linaro.org; Fri, 29 Jul 2022 10:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1oHR8c-00066a-Ay; Fri, 29 Jul 2022 10:38:50 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1oHR8a-00005I-7z; Fri, 29 Jul 2022 10:38:50 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D9EA65C0172;
 Fri, 29 Jul 2022 10:38:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 29 Jul 2022 10:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1659105523; x=1659191923; bh=dwDWhwWtd1
 UwGDpT/e/X5sZQv3LmMrrGlT4WK+vl3aw=; b=RnqMF+opd/xbIemMIJRxvitnZY
 fFkCBlwgU463tXnMuLga5L0gKYgYCDkQWDcUWxLcpXnyRpkwz6gD58qFLRseuTjI
 Or9likc4rhhjium8BNU6wU7EOznB+/Vep0HZ9Hu/3qPtwJiegDox0AlyDfusPOcB
 o1H+FnFz9/XsHPnvxr7kYUTXjY/mfQhlNVFzMNtuco5mqCTUX6mAmCsVaydBvq69
 ByFROlM0LUn98VPdN+DT6jih2xg5+MNqhluKJkmFGngzO5B9Pp8mpLN92bgHiu9U
 3pw8GIUdeF2ERB2b7xNDGhF/6T083birb3a4FmmIeArrgfrI3lsOdDLToZCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659105523; x=1659191923; bh=dwDWhwWtd1UwGDpT/e/X5sZQv3Lm
 MrrGlT4WK+vl3aw=; b=zvAkoUtOxOEpd06HhaKcLJTpB9+CJBZCLKG9WCDxTa0J
 vP11N4UvwcqwPnZY9AWRo0ZPTsslgps8rGWjImzrlFS5B8zm1wX5fvoXe/W2zv9u
 nwIYew5IdtK9kRSu1zkZjYm9ehhQI9LVZ+MT5m+1My7YARf8esIu0wbiLfWcJUwy
 vkbrXoCntUNiqfbpir1tTB7Gay0zM84w6r6Xu+QPEZz+I5bQOb1KwoiAnKhZBkjZ
 tBRNgn0HqlZ3PfPbGA6RQaqKcNYPwXSeiMKW7PsI0atYxKDokF2JD2VGxm3TZPhl
 M1CIX8XhesGufXAVwgoHwo5z7tXRtvpSw9va9pa4gQ==
X-ME-Sender: <xms:8vDjYqDPNuDwWTJx3EWpSjz5XNQdp-awmFjsuBKEQlKV3CcQRi8GOA>
 <xme:8vDjYkhDViXVe7pRoiwy7QeCm5OL_8QVMlrA3jWcvXMMzssn45mRZe2p_yydPgtr1
 vucyQfvNR9aa7pTuCk>
X-ME-Received: <xmr:8vDjYtmt7dMOT5fHLvsYzMCyVV2Wito4-nQA22-86J_FJk8KycuVNMEUfwda-bcZnj1Bzg4Rhpmr3t5OkXVHRSo8VP12GMlH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpefrrghtrhhitghkucghihhl
 lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
 hnpedtjeejgfdugefhtedvudfghfejfeejfefhffeffeelgeduveejleelffefvdffleen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
 hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:8vDjYoxnU31aCY9GCiyGsSAuLk4ZUiSec_nlKA7BYPV_RzLUf0nmuw>
 <xmx:8vDjYvSi3mQTRzTI_3YSggHDYAoBWSHemcVZJR91nzyHt_NTljoiTQ>
 <xmx:8vDjYjY2CUt_jqUii1ECUH81QmDbSsEb8_Raq3akmsPPaDnOAQxmAw>
 <xmx:8_DjYggo0k1_K-u2sEo33gIUj1wBR0qczTtU4fSalvN2WrzZ3Nr0vw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 10:38:42 -0400 (EDT)
Date: Fri, 29 Jul 2022 09:38:41 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Iris Chen <irischenlj@fb.com>, peter@pjd.dev, pdel@fb.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alistair@alistair23.me,
 kwolf@redhat.com, hreitz@redhat.com, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, qemu-block@nongnu.org,
 dz4list@gmail.com
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
Message-ID: <YuPw8aQ2cfJIx+1f@heinlein.stwcx.org.github.beta.tailscale.net>
References: <20220728232322.2921703-1-irischenlj@fb.com>
 <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="beczAmmun8celmZJ"
Content-Disposition: inline
In-Reply-To: <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=patrick@stwcx.xyz;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.499, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c52nWy9G1Frw


--beczAmmun8celmZJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2022 at 03:25:55PM +0200, C=E9dric Le Goater wrote:
> Hello Iris,
>=20
> On 7/29/22 01:23, Iris Chen wrote:
> > Currently, most of our vboot platforms using a SPI-based TPM use the Li=
nux
> > SPI-GPIO driver to "bit-bang" the SPI protocol. This is because the Asp=
eed
> > SPI controller (modeled in QEMU under hw/ssi/aspeed_smc.c) has an imple=
mentation
> > deficiency that prevents bi-directional operations.=20
> aspeed_smc models the Aspeed FMC/SPI controllers which have a well defined
> HW interface. Your model proposal adds support for a new SPI controller
> using bitbang GPIOs. These are really two differents models. I don't see
> how you could reuse aspeed_smc for this purpose.

(I don't think there was anything here that proposed reusing the QEMU
 aspeed_smc model, but it might have been poorly worded).

> or you mean that Linux is using the SPI-GPIO driver because the Linux
> Aspeed SMC driver doesn't match the need ? It is true that the Linux
> driver is not generic, it deals with flash devices only. But that's
> another problem.

We actually mean that the _hardware_ has a deficiency, not any of the
code for it.  The Aspeed SPI controller has a single byte FIFO in its
implementation, which can only read or write in a single operation.  It
is *impossible* to perform bi-directional access with it (ie. you cannot
write the MOSI and read the MISO in the same transaction).  This is
broken for many SPI protocols, other than flash devices, including the one
used for TPMs.

In order to connect to SPI-based TPMs on an Aspeed chip, you have to use
the SPI-GPIO method.

--=20
Patrick Williams

--beczAmmun8celmZJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLj8O8ACgkQqwNHzC0A
wRkdhw/+P0+Z6wkd5RvVJLA8Cr8vE5sEP4ehgOI8hUhTTxFUtAIgCbAbpv5dN8Wf
PFts22zcJSNo9n84SvYvat4EjfmpWfsjYoUDpPLwCv28LDfLd6Pfr2vMcwLBe7E+
g6uw24S5VBmYoCSOA5xRt9wf/5iWhjXVedtz4Or8RnGKXnvQVWcyzABMaSTDrEKE
g8iJ2q838HQtVVoyeRXzrCfGPC8hQw9uUUgalSWEODTg58vQnkbbS1EX9jBH/H0f
+VZd4LzPX/2N9prWudWbFWVrgoXrOzm/45dGMQhStEf4cVYX3k7l841FJfP/jTkG
W1/uIyfNRmcD9srrFUW6KTh8A1f/EbenM8wqK1xH6FKWDh+AcJmqKqcE0JLqH4bH
z8wOCRhdq1/RCPqf2UKA4eWSg+6WcTGMQahOksjE6AfY2sA4dgCnrw7qP9loYSua
vY7kwM6ugy4yOzHS51rr/J90V/FVHBmKJm9skZYrHLenOYDZE8LaGwRMyFBy4pXr
Qz76sDzfXqywKHemCxOL/8BzZL80rQVsKt0YSg7lSN0pGPxYkcSQQ0DJMKYUPR/u
Sgd3qXIYUDrrolAGA5O6CE1onKCDsx7jRPxWuxvCFYVtWxbdQOYAcAmDOXTupzH3
6p1bMnrbNhXvyJMVROrJMdVYR5ttDbWO/+Ws4chxRf7Y6DAe1v8=
=GqtG
-----END PGP SIGNATURE-----

--beczAmmun8celmZJ--
