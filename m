Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp938199wrt;
        Thu, 13 Dec 2018 07:19:48 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X195pPlXek/XpUV/LfOtU6+DhwZMfyDMAVyN3KAISZhf7f4logHg3zYC63bXaazzlvmySG
X-Received: by 2002:a37:6f45:: with SMTP id k66mr23020021qkc.313.1544714388038;
        Thu, 13 Dec 2018 07:19:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544714388; cv=none;
        d=google.com; s=arc-20160816;
        b=alBACYIGqaO4Nso0yQ7PvBx44FHEyAee6ldIgWyW7Evdl2eHI6nqSmMtOcjPEj1ipj
         mEQguJjqkVlxcacMp5iX8Mj3om7g3WGZYlpXKpx1CqRlQajV4PIYax9zFwOkTqR/prrp
         +QwHjZIoW1EirvbHkSyQ7ai/7f9MZrKAQ8TOKB+ODgI6A9xuDMQZSL8BEoo+nDtQx8FP
         kz0Cx1IuSN2ytlHT29wmvkF/RU8LgXqRsZ5b8BvqKyYNUdPmZfHF9q8lWCq60SAa30HS
         vzinRaqGO+pwXljWmRWKaGIZsZOzegAGN4gQxtRK1XYGRxXabaTUuR5ixGfHhanKE5TR
         qOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=ANfCRBD4+Ecf71NYdDlHOMQ/b2ypiuOC4+zE/9Lo9kw=;
        b=RJ3VfGkOdB2HslxIVfiWy2IWyVQtsXIeQphFOZ95gz/B7O6fQVwAltrgtEMsBlGBvw
         9q84qqQ26KSb7jhq/IZ9uKRZMfiwEOsBv3MNaFIesyD+oQE1W+nfqcNfkecQhxV2NFao
         azXlh8RdvjaBQlfl00AZs+cpVI9zao0ma/uGhCf1KPeNW0XB01MKZjCVKaIkVcIUiOeT
         Uq1O6lWVCl7h9gdnh+L/lFDw/kwhYEUE2vTaD/Hnn+sJrvZLN5oiJXqEltlJQ3FRzeV4
         EGClIlwQ4mk4pQ8FLayhJaA3FUXg66nyJPFyKzAR6XyKY2P03JyRSL3MJml6Jw8mshoE
         /Vyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S8D8GFHw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w81si457352qkb.30.2018.12.13.07.19.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Dec 2018 07:19:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S8D8GFHw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gXSmB-0001Ja-EF
	for alex.bennee@linaro.org; Thu, 13 Dec 2018 10:19:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gXSe5-0002o9-RY
	for qemu-devel@nongnu.org; Thu, 13 Dec 2018 10:11:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gXSe4-0005Q2-LD
	for qemu-devel@nongnu.org; Thu, 13 Dec 2018 10:11:25 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:46843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gXSe4-0005AB-6u
	for qemu-devel@nongnu.org; Thu, 13 Dec 2018 10:11:24 -0500
Received: by mail-oi1-x233.google.com with SMTP id x202so1848914oif.13
	for <qemu-devel@nongnu.org>; Thu, 13 Dec 2018 07:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ANfCRBD4+Ecf71NYdDlHOMQ/b2ypiuOC4+zE/9Lo9kw=;
	b=S8D8GFHwYPsORAbYNy4R1iyhDd3AGOPwd93T6rEFmzZWGJQ8MrTejz+VZU47wRpsgg
	AtFCksgoSWbbEQEkIYfeWD721MWeW5dvLUvIJns30k4uyohffbeZoSXrV5ea9WvhBhyA
	dKYAb3T0H3wkLewYRnmqdHeJLd5nP2y8TijQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ANfCRBD4+Ecf71NYdDlHOMQ/b2ypiuOC4+zE/9Lo9kw=;
	b=Ln8mGfh28BxHWTDvyxAcokZL7Dzmec2hJyUbMAAFH8u3suDm+FGwpg7G57rNdK6Vl7
	18wwnEgllnh3Rjxm6z2IU2nLVMppXezMmF4d6th1fm3Y9FEAbD/hRIIS6nXKi40VLjUn
	udLSCR1Yzc0ayTXIyZkeIT8Sl32LJAO9uk6y/LQVGVIjWmp7lCrJ9VWnlk/2fZcQYnKb
	fmvfvodbfbFoHEkLioxSS3YIbkNt7Ej/obQwF387T1CzZuM1/dL61mia/ejbOK/g7E4q
	myIicYWdE2HhnrDjZglDpz5NtL5b5L7BiVyPR1cfqE2+5J2W3MZ+Sad/lXNg6YQcXbd2
	fc4w==
X-Gm-Message-State: AA+aEWalhUlyOEYqLavPzpCXc6Q8EftNrD+90AzDvbCQ6qAELzFXSgTJ
	VG9z6gT4/eNM3tsaBgc2eD7T7BVsfGJxQZiIkNKtFg==
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr1204909oit.325.1544713877273;
	Thu, 13 Dec 2018 07:11:17 -0800 (PST)
MIME-Version: 1.0
References: <1544708743.4811.30.camel@rwth-aachen.de>
	<CAFEAcA-p-LC2swC8-AQt60QBhQN=PNJvBjbGXrtdvvvDd-74QA@mail.gmail.com>
	<1544713257.4811.32.camel@rwth-aachen.de>
In-Reply-To: <1544713257.4811.32.camel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Dec 2018 15:11:05 +0000
Message-ID: <CAFEAcA93tPS-jJBoT3fFekEvXx4pJPR_u3P-x1d3op470uexmQ@mail.gmail.com>
To: lukas.juenger@rwth-aachen.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::233
Subject: Re: [Qemu-devel] [Qemu-arm] Warning when DTB memory nodes are noped
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v3eQHvN6Oy3z

On Thu, 13 Dec 2018 at 15:00, J=C3=BCnger, Lukas
<lukas.juenger@rwth-aachen.de> wrote:
>
> On Thu, 2018-12-13 at 14:49 +0000, Peter Maydell wrote:
> > Was the deletion of the memory node actually wrong in your case?
> > If so we should look at fixing the wrong behaviour, rather than
> > just being noisier about what we're doing...

> I see. In my case I wanted to specify the memory using the DTB that I
> passed using the -dtb option. I had two memory ranges in the dtb and
> they didn't show up in the kernel later on because they were noped by
> QEMU. I found it confusing that QEMU makes changes to the DTB that I
> passed via -dtb.

Yeah, we don't edit the DTB much but we do fix it up to
indicate the memory, number of CPUs, kernel command line, etc
passed on the QEMU command line.

thanks
-- PMM
