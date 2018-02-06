Received: by 10.28.71.27 with SMTP id u27csp3560753wma;
        Tue, 6 Feb 2018 01:42:47 -0800 (PST)
X-Google-Smtp-Source: AH8x226QM8zshvj0nU/H6zf4ZeS2Oo/fIqQiWpMa2vpmcI4I55NXfVi4fEEqWpv7HaawcTsXUNyl
X-Received: by 10.13.205.3 with SMTP id p3mr895537ywd.377.1517910167158;
        Tue, 06 Feb 2018 01:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517910167; cv=none;
        d=google.com; s=arc-20160816;
        b=PUneMxsR00hDV8RM9L+iGu+I+dczuKA1q/h2MzT61GWqwiReddfG4kDQgp6jP92cUj
         CwGKqBwAkC9WqAXRVHYhFDnYGTONna4q0WlZml0Nb7kaSAlZIIEN+/UKzQyJK2Tjf0FE
         Tt75TEmokWrWB+l3+14EGKivZ58wn6qdEicRUlO2hphsIxeGVtKHPe12dv5MsqLWPzMZ
         Be0fOmvhYC8sQ+zL1ymCzd0h3F7xnIGEgr/FWX86ujlLXKaJfwojCAkx5kra0chBMaC+
         0ag+WqCkdp0COuGQESW203r5OWzl8m8aY/1QYeKWJu+jnhzJCQgQrNeEM4s/MROFjB40
         TddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=n0BoXywqVHNeFxJWbtU2WlvZhHjmr3S6rQ8zZ/1T0kc=;
        b=PEc9xFNIdQjw/aqXC1ayl5Wuvz2xZZYtvYb06+tCiVGftqKjv9RIE9jPiz11bZKC7B
         xN+X19FAgMkJ2SnL9IPYLMzwotzHKLDZTnogpLOQQY9U/7R6ZDeqN3y1GEv3CoyItFtF
         9gKpzluJewN2p6dZJUR3lOkcIGufvl9PU5znEllo+v2dRllEjlLPsUwDoG/rXLyP22yw
         x2zao7RVdGp3Ov64NIdS/lBPbUkjbSqE8wLRCYKNmMEtXkgSd57tvC39Uc63l/WEx0UV
         BIAGgOS3ViIXmlvCHfAcUHTPw88cYGbrEGSJBdTBdtlgh/NGBeoP6t7Haz1NGTR01eQR
         1jDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vo1nJuuC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z136si1771231ywz.505.2018.02.06.01.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 01:42:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vo1nJuuC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eizm2-00061n-MU
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 04:42:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eizlv-00060G-Nx
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 04:42:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eizlu-0005tG-W3
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 04:42:39 -0500
Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a]:39500)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eizlu-0005sx-QU
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 04:42:38 -0500
Received: by mail-ot0-x22a.google.com with SMTP id f18so1142636otf.6
	for <qemu-arm@nongnu.org>; Tue, 06 Feb 2018 01:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=n0BoXywqVHNeFxJWbtU2WlvZhHjmr3S6rQ8zZ/1T0kc=;
	b=Vo1nJuuCQ9x+Uujj/dKEd6KwCiM5StW7Imh2e1IQBzXpPTXM6ix9Nu++2Is2O1bG+t
	UH+hGWfUhHfM8+YI4YC6q69KhaasoIq4050fsiyxWFIw+2pfeX+uHCl9ztFHZQr/U/IC
	ywapOV8pW6L5Ufmyxapy/NknmgofNxJDchkfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=n0BoXywqVHNeFxJWbtU2WlvZhHjmr3S6rQ8zZ/1T0kc=;
	b=ldMcne8JeFSB3b0GCxcqsoqqi4SxU2OPhad+pMzNFEJa85p54SzbaGUpEB98+xhlPw
	KnXhSjAOaCPK6Z893dlHQfBZkWFyNVgHogOPjy/I2q4ZDxbWSLdewmZAKgZmEyXfte0C
	4rWJ70P2LDfnLiJRxKSOfywoKOMeAQNaTLj1sF0O9IlJsWdm1DuPsUgpLp9FTG8wVIuM
	VDZ2SmNF4o6cnlB7IErMnYLCcOIv43kBZ1fe/Pz8TfyTSzvdtQWfCm/z7a5sbZg1CeGs
	61mKAGSohVxRQgdZG9v6nSa2CgX0gB97WlQlPuMBqlUgqYdqSkXPS36+SvwOJ5YV0U9+
	lV+A==
X-Gm-Message-State: APf1xPAfu4dHYMqkOxck8zY0/TGQEu2nKc6esvgk4z2am/YRUpkPxYaM
	rlduvU2WNFqlaU28CioGm0ZmT+TIPGgKio++Xc3Vqg==
X-Received: by 10.157.13.72 with SMTP id 66mr1162315oti.116.1517910157873;
	Tue, 06 Feb 2018 01:42:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Tue, 6 Feb 2018 01:42:17 -0800 (PST)
In-Reply-To: <540d164d-23b7-c511-80ee-037cdcb3d86b@amsat.org>
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-3-git-send-email-peter.maydell@linaro.org>
	<540d164d-23b7-c511-80ee-037cdcb3d86b@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2018 09:42:17 +0000
Message-ID: <CAFEAcA_2qoWcJ9wL+ewXD1Fp6XFYb5EuotcD=_WMxyNf1aTZ+g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22a
Subject: Re: [Qemu-arm] [PATCH 2/7] target/arm: Split "get pending exception
 info" from "acknowledge it"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HervjaeTxCSy

On 5 February 2018 at 23:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> maybe:
>
> assert(ptargets_secure && pirq);

This is one of those areas where people have different opinions,
but personally I think the point of assertions is to turn
bugs that manifest later and in confusing ways into bugs
that manifest early and clearly. In this case, if either of
those pointers is NULL then we'll immediately segfault in
this function, and the stacktrace will point directly at
the buggy code, so the assert doesn't gain anything.

thanks
-- PMM
