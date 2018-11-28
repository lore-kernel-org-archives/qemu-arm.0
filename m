Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1205033wrt;
        Wed, 28 Nov 2018 07:55:16 -0800 (PST)
X-Google-Smtp-Source: AJdET5fQzlCHIjg0+zcbsChBy6ysR4rtKzNFi2yy7TqQCF0cREGRxqAMDWJDNbXLxWIv4e1IyAkP
X-Received: by 2002:a81:a70a:: with SMTP id e10mr38945263ywh.233.1543420516835;
        Wed, 28 Nov 2018 07:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543420516; cv=none;
        d=google.com; s=arc-20160816;
        b=C5xk3D7BAadGtjT6gSUFuwmxYb400xrBg2WhI9bvvxFsahJeznNQU8Qu05K7v+eP4T
         hPj2fN8m0PAIAGyg6JUFKMLkV+MEFbHbosf3OAHjj5htht3m6bVb9gfUeQttEHttgnU4
         rYxeE8ydDLqMMqLY/q1aL1gENDBzv8x1nbY8pEEMln/phZ0FKLI42CpI97Jkm6SucyB2
         pn7Tdg6X1KxqmIzeLiTctxFS+fA1mS1Cg8Mh7qxImlbjNIyjDegyTr922lqhUnBzNdgm
         5euyYkKUcqSxTP/SLTIez+xR7uw8vYm95Jr+3dYiw2/+SgeGdBWuJvY/f7Bar2+0S9DQ
         RWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=oheZAeHj1iWXMj9KkPH0rUi5cTRX+9W5RE593f5fsRs=;
        b=QEFsJxLTgE93AmsiWKa0kILGXJNUHhUmbjSTRFr94+wJrIJjkFYhdvz0dyW++Ekqi5
         XKLu9PxLjOrEYw9iNUlT3kjTFuYjdaPhCZz//uxcZTMy05bFzp6RiB9AcMySz5Un4EpX
         impG0z3zaH2Hd1keTVQ3tC3dVdhHfKnbjg69dPLAqv5aGRD17UVzw1vxzBCKss2iYvXp
         jcpVxor7wFY5V2L6OzmE44Hae6Y+vlm9iVzcZlBIqd4NImCfbwWT7seaLLkNQMi1gzSI
         gF9x09QK0YNtRd00ddMxyywaBiLvPFmncGjDG2DvTYuszxpvbmGj5+8OTRXfpGhDgQKR
         NduQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a8dCCeNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u68si5275725ywu.134.2018.11.28.07.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 07:55:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a8dCCeNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS2BI-0007jC-3T
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 10:55:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gS2B4-0007hw-1T
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 10:55:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gS2B2-0002nU-IP
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 10:55:01 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43373)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gS2Az-0002jz-13
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 10:54:58 -0500
Received: by mail-oi1-x242.google.com with SMTP id u18so22950716oie.10
	for <qemu-arm@nongnu.org>; Wed, 28 Nov 2018 07:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oheZAeHj1iWXMj9KkPH0rUi5cTRX+9W5RE593f5fsRs=;
	b=a8dCCeNZwY9GRW6Qc3uOHqr/x4QdbAj0PYs0NnJ+8GkiGl9ZEDzLl0hTaVDkZDI6UO
	q3SxuxOhnJVmMiK67yQzAnWfj3Z2wbbh3V3+l7GiIaRuHzGkUCWqDZkXYZAWinywlGi+
	sLgxCs0tw2uzk7Kra3wdJP/Z/8oDEBIQIYAPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oheZAeHj1iWXMj9KkPH0rUi5cTRX+9W5RE593f5fsRs=;
	b=lQ9UR6Kj6LNfNweHKZcajG3g0tKN7Xff4odhOqanSZw+DFa9EJ1/YEMJXSo2WHx9TM
	tny4cen+dqwqE5Nu+4twtermHnLU5BDRiIHvjPhgDLPNnLDjILlKI6I40BiC0gRsdd16
	PfTA/7jX3th070ecmw2ACM9XbphWej5kk6K9Av2O4Hliaa8K3CqfOxAqLuMl+vH0U4uq
	uQKsflU+8YZtqsKKwNAfmyCpUKmzIlLPvNuj4soeyBjrDS6OHUDhnA74Th/XG1KWlRms
	4JVD5nHWNajrK8Ct/H9o57hYuWfpCmCu7dGopsDAt26raJT8NDClpKjfVOxipG3XjP2J
	NYKA==
X-Gm-Message-State: AA+aEWbjpGBzK9G4MrUpo1VbwEqmZ4qsT0ILvJ+vMUZJznnGZc5p6XTf
	BR6/Dw7VM4/ktW9U9KXrPELuprBWDOfpEAC2al0G5w==
X-Received: by 2002:aca:5ac5:: with SMTP id
	o188-v6mr10944286oib.146.1543420495901; 
	Wed, 28 Nov 2018 07:54:55 -0800 (PST)
MIME-Version: 1.0
References: <1543399094-2260-1-git-send-email-thuth@redhat.com>
	<2ac07515-10f3-ed38-c022-e583cd1cd36a@redhat.com>
	<ed0252f7-e74c-46e1-b47b-8d0c2e8dd73e@redhat.com>
	<0d74ecc6-419e-0b93-c0a9-4a4ce37a7ca5@redhat.com>
In-Reply-To: <0d74ecc6-419e-0b93-c0a9-4a4ce37a7ca5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Nov 2018 15:54:44 +0000
Message-ID: <CAFEAcA-q+kJT-pzTxWPwREPsTviAjd-EA51VoSSNEtPPP-N8yQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1?] target/arm/sve_helper:
 Fix compilation with clang 3.4
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aUJqybNSCACG

On Wed, 28 Nov 2018 at 15:50, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 28/11/18 15:39, Thomas Huth wrote:
> > On 2018-11-28 15:34, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 28/11/18 10:58, Thomas Huth wrote:
> >>> Clang 3.4 does not know the "flatten" attribute yet. We've already
> >>> introduced the QEMU_FLATTEN macro for this in commit 97ff87c0ed020c2,
> >>> so use this macro now here, too, to fix this issue.
> >>
> >> checkpatch candidate?
> >
> > I think we'd rather need a docker-based test with such an old version o=
f
> > Clang... (since there are also other issues like the double-typedef
> > problem that regularly occurs there).
>
> I was thinking of something such (broken code!):
>
>   if ($line =3D~ /.*__attribute__\w+\(\(flatten\)\)/) {
>     ERROR("Use QEMU_FLATTEN ...\n");
>   }

If you wanted to go down that path then it might be best to
opt for "warn about any use of __attribute__ outside compiler.h,
perhaps with a whitelist of known-ok attributes".

thanks
-- PMM
