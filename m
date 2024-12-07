Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1371680njb;
        Sat, 7 Dec 2024 00:33:18 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWMGK35XZatbcvfnvBOcgoOVtCt12pToD+uJl8tkB1aMpQ6EG2SNxxZc8LgvkvMW7fUc8MQM2RINIkf/w==@linaro.org
X-Google-Smtp-Source: AGHT+IE1JKJnyfr6Tc9Hkf+O4c8wLaRw6CoPLg/jkaXpTDJqNsar8UBW9JEEPZLsdQNRnSnOuHtr
X-Received: by 2002:a17:90b:38c1:b0:2ea:83a0:47a5 with SMTP id 98e67ed59e1d1-2ef6955ac23mr9374825a91.4.1733560398414;
        Sat, 07 Dec 2024 00:33:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733560398; cv=pass;
        d=google.com; s=arc-20240605;
        b=BLaSy1gFy+Z+2YlrYMhq3WVPjOwfJc4K6gz8sNoOFW+CUQ/NelKhQcmJLn0op/fFzO
         M9QbOwfWnZkjWB0pHLlKuYN/9WlqYTQGoxOPsYOp+8lrnk+z63jWLeyB+aNEXs2JFjcj
         xffrsiOUiXwLSyAxGKgOyvKuo33VCl97a2QTx3ltiqXNFF59CePUqg8tEoxq+7E9R2+f
         js4zNldI2OcaIXC26f03QUpj1LPvNe+VbozSZmwxmUfwxeJquj4uOYb0aERBmuuebQ0/
         BbF89qyBaxlJwsfkxDstGAiNbvGr4MTVd1Q8/hxQsfn1VKEpaj/ti1w18pQdhaStuT6i
         0YVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=jnRBr4roXrye1S4qu1taYXv/EYjBxcshO9vSFQIvT78=;
        fh=+4nhXb5zpaAYzvcaalAr6lS3LAZiW+m6ZyVMjIkOc3g=;
        b=FqQlp3wTkEHKQrsBg6EalqK0VM6ypokC9zR0D8hiG5IAO6e5KMAeiE0KHgauR9H2VA
         U18+j2zPL+VmuIOIp/zm3RmFZ04x8R9gLjZudbf6J+YG6MpAhcfXjaTTsCj+PvLcolY+
         0bPvFAixPNlr7fYIHv8HqZ+OcrMBi/3tB1Tzqoca8sLWV00zBfmgV++BsmoWZpdWd/ZD
         eU8ZAEDsQZLs+Ix7kWQl5cxfx7UGoMU6gsdpqLZ1SGlEFI79rD9hX/Fu9lO/uN5+Meaf
         Tpyid/46MdMEWR/bM+0OkrSUZuR9B5l9qMB0FxpU3Zk/2xxlfTqa2ruyagvJg9hdfKyj
         YzmQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MO9sW+EB;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435946-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435946-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435946-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2ef87cb738csi1081077a91.41.2024.12.07.00.33.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 00:33:18 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435946-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MO9sW+EB;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435946-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435946-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0AD228172B
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 08:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DE676034;
	Sat,  7 Dec 2024 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MO9sW+EB"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03C518638
	for <linux-kernel@vger.kernel.org>; Sat,  7 Dec 2024 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733560394; cv=none; b=JJEX6icQzXfCjh3SFhLBUqp29ce9j4PaPzvGqMBsdZEaCumc/s6Ag2NsxYev9BENs2fWwAQxg5s+GqdJ11xiVrxfBMzsGkwG7dYrelY25DP8JS/2pEJGfVjq7StF+1W5q8g34fKWPB1kw2VxVjzOHWxnvP5MuKFXq3FIIhvV6OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733560394; c=relaxed/simple;
	bh=ysUzu1cKx69rnPAx2aBIYuDYfVrYDTwWQl2sRqD/khs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WbtVBKjpAHAZF0SK/CSwp26nCYToO6cASL04OxERIkh57Qi7Gz32w0Uez1DXtVARbv9/KaR7vr8BOEhE+pIiX+rZS+dPK8870xghpc5s8wQ4yqG7fKSCd+gG+DC8Z8QUYgWBaw6MwrSKzMWkaRdrhlQyWCSXVCkQNysEj6KNS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MO9sW+EB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1EFC4CECD;
	Sat,  7 Dec 2024 08:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733560394;
	bh=ysUzu1cKx69rnPAx2aBIYuDYfVrYDTwWQl2sRqD/khs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MO9sW+EBvR7TU0rUpiDwFwskd0Er3xxOKVEdxCKeukUDoYo+uNGhtn7iLZIzZReDQ
	 4L2avSzyuimVpKNYoGUvnwBpJkmCWEiOK5aSpoSM51fFTSL5+OC64F0QiJtJ6TZWom
	 EQTpJWLZYUq0oKE6Krl1XR7onD7CffJyHvv4hsNGKDhgTmWxTGJqUwz3gvhsBfk0WN
	 NrSUQbdeDlZwJJFwqjvlUfWdahmZuvEnA14vpLEIoBxYFUzzYQYeXTlew2BsRvuaPj
	 99WDnJv0tkDhXilJnxpp1Thkh2smnLPmQpnHrgfPkzqhXTGjyZn9F3byvMaXNKOiSc
	 Lsb83FpqtXeyA==
Date: Sat, 7 Dec 2024 09:33:08 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Igor
 Mammedov <imammedo@redhat.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 27/31] DEBUG
Message-ID: <20241207093308.55376e8e@foz.lan>
In-Reply-To: <87ser02f28.fsf@pond.sub.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
	<6f427a02c2c20512d5da178b47c64d553851a60e.1733504943.git.mchehab+huawei@kernel.org>
	<CAK3XEhNNZyRDgjm5Hjes-Xnj4CxtO2eQcs7AyTNOOFcKa3LusA@mail.gmail.com>
	<87ser02f28.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xTd+GjTwXsnK

Em Sat, 07 Dec 2024 07:16:31 +0100
Markus Armbruster <armbru@redhat.com> escreveu:

> Ani Sinha <anisinha@redhat.com> writes:
>=20
> > On Fri, Dec 6, 2024 at 10:51=E2=80=AFPM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote: =20
> >>
> >> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >> ---
> >>  hw/acpi/ghes.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> >> index abca351b18de..1fe4c536611a 100644
> >> --- a/hw/acpi/ghes.c
> >> +++ b/hw/acpi/ghes.c
> >> @@ -534,9 +534,11 @@ void ghes_record_cper_errors(const void *cper, si=
ze_t len,
> >>      ags =3D &acpi_ged_state->ghes_state;
> >>
> >>      if (!ags->hest_lookup) {
> >> +        fprintf(stderr,"Using old GHES lookup\n"); =20
> >
> > I don't like this. If you must please have them under #ifdef DEBUG or
> > somesuch. See ich9.c =20
>=20
> Judging from the subject line, it's not meant to be posted, let alone
> merged :)

Sorry! Yea, this was not meant to be posted.

I ended submitting the entire pile of patches I have pending, including some
patches I placed at the end to test that what method is used to calculate
offsets (the one supported up to current QEMU version, which is limted,
and the new one that uses backport logic).

I'll submit the right patches again. Please ignore this.

Regards,
Mauro
