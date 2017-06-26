Received: by 10.25.15.197 with SMTP id 66csp1573447lfp;
        Mon, 26 Jun 2017 11:08:40 -0700 (PDT)
X-Received: by 10.237.57.227 with SMTP id m90mr1952675qte.45.1498500520170;
        Mon, 26 Jun 2017 11:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498500520; cv=none;
        d=google.com; s=arc-20160816;
        b=RYMovGUO851QwSqXdOrpxI6xqCR55ZdN0I8pBFJ4aDPY/kShyyocslmpP/0WB0IuEe
         SVZ3U1OWrMc2ZPK1lBtqAZ2vEvFPZ6gytugbgwjCuC66vGAreVW8x/mhqnhiFBuRlitc
         48+N7r4P24vDRI/4YnAfB0dhbgsEb0VttF0vNpxYcCjRnXHXauODPjo3i9JQe91Fqmfb
         xqoAwcevzGxQsQvPaTQbIOE9Lo92G0ZqTLWUfjYdHa3PYwrZL3YsAhk9YmAUCA2sIXRM
         /RFsagCRUZc5Y7AxAH6JMVtt48xwtAuV/2eobOHmwLdgUklZTeePxmVDper1g7MTphJ7
         Td2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=vcYnwabnMUc5xFNQ5caZxz4dqW9kKoP1O5gSdcCj2Jo=;
        b=QFdffpOWNhyvm9b9VJCEtTvE4wmoTgNs2j7CpydSB60eF29D/2GqzfESoWjgthMJ8c
         fJVZLNrfQX69PfuYC0wEnj4IGQYOniRyjpx+2CtyPGWzI2om8hBFxE/uEA2jbtKJwmKW
         e4n8br43Bev6MIUBGQhQ2twt6s2TSODiuNT6+zMI0cQvygCCDSStpNOho7b4RPmk/wSP
         kQixru9YXXvFStUBgNWKsbSPsznwVU4JF86xeDtiTkbp1ZTfRd7LZAf4YYDEYWxKTO0I
         qdjVUy/fAQIQZ/7wpnd657HsX09H5bcD1sKiGvl0uME+Fjm1ko+Ui7tjxGkxNwsVm74F
         YqyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=j9dJ0n+q;
       dkim=pass header.i=@messagingengine.com header.b=qMrGL1u1;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com. [66.111.4.27])
        by mx.google.com with ESMTPS id n188si615079qkb.292.2017.06.26.11.08.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jun 2017 11:08:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) client-ip=66.111.4.27;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=j9dJ0n+q;
       dkim=pass header.i=@messagingengine.com header.b=qMrGL1u1;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id BFF5720B63;
	Mon, 26 Jun 2017 14:08:39 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Mon, 26 Jun 2017 14:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=vcYnwabnMUc5xFN
	Q5caZxz4dqW9kKoP1O5gSdcCj2Jo=; b=j9dJ0n+qNGJmUt8P7xHqR5Dr7wtB6I9
	u97keTHfOIW4RIX7sMWGjcN6hfzGB8nh4IzUKWatVQVriBnGXYf00v5JthoDvIIX
	dQ7oQ6OfVzRrKyX4sc1FtiRn0Fh/BZ5rVm4cM18RgLFbSiJJg4J7ABd+oBnpRnN/
	VWDdvruYkWww=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=vcYnwabnMUc5xFNQ5caZxz4dqW9kKoP1O5gSdcCj2Jo=; b=qMrGL1u1
	VwTR/KiH5DElm8RGpnwThH6PyxgY8BGkv0nanB0sNuCEFeS4fB6pRoSAWnkPTo2q
	KtyrZjvTonSoK8IaxaKt3PMmM+Y91BbKElR4WveUKb82udaj2F0PzEX+LtgcMQvG
	eI38Bhcn7oa7Kt/GlOuFglE3fffawvx9j4BH3EtMoCs2ToNnq+ulmoostneNfatM
	3lQa1cnKPuQC6+375RhBQA6Vnal5PChByETQiG5ISeB+PJnW05jZtEInHCSKB7a9
	GNW4sz4L9R2xKfkFbutrX2dlA4jJby/DdEotbSrYg4I+efnYKb3Wqw+X5cv1x4SF
	qFBGeb7wFU3b6A==
X-ME-Sender: <xms:p01RWdPMg8eRBlHfC70rJSuG-R1IRlJEgUVhbECwPBaagwUpkALSeA>
X-Sasl-enc: zyJx+bqHXzw5ER3Scwu/ro8SaxfdlIt/sGzgq7t9nb0c 1498500519
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7589F247E8;
	Mon, 26 Jun 2017 14:08:39 -0400 (EDT)
Date: Mon, 26 Jun 2017 14:08:39 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v9 16/26] target: [tcg, arm] Replace DISAS_*
 with DJ_*
Message-ID: <20170626180839.GF17935@flamenco>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
 <149838409778.6497.16277162983730521098.stgit@frigg.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <149838409778.6497.16277162983730521098.stgit@frigg.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: Dynkt6tpdTH9

On Sun, Jun 25, 2017 at 12:48:17 +0300, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> ---
>  target/arm/translate-a64.c |   58 ++++++++++++++--------------
>  target/arm/translate.c     |   90 ++++++++++++++++++++++----------------------
>  target/arm/translate.h     |   24 ++++++------
>  3 files changed, 87 insertions(+), 85 deletions(-)

I'd do arm and a64 patches separately; much better for bisectability.

The DisasContextBase patch cannot be split up, obviously.

		E.
