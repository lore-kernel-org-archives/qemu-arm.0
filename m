Received: by 10.80.166.35 with SMTP id d32csp720944edc;
        Tue, 1 Nov 2016 08:36:16 -0700 (PDT)
X-Received: by 10.31.211.3 with SMTP id k3mr22906833vkg.71.1478014576117;
        Tue, 01 Nov 2016 08:36:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w75si4029547vkh.78.2016.11.01.08.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Nov 2016 08:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48655 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1b6l-0004sT-FQ
	for alex.bennee@linaro.org; Tue, 01 Nov 2016 11:36:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1b6e-0004po-1F
	for qemu-arm@nongnu.org; Tue, 01 Nov 2016 11:36:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1b6d-00079O-Fk
	for qemu-arm@nongnu.org; Tue, 01 Nov 2016 11:36:08 -0400
Received: from mail-ua0-x233.google.com ([2607:f8b0:400c:c08::233]:35892)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c1b6d-000795-BR
	for qemu-arm@nongnu.org; Tue, 01 Nov 2016 11:36:07 -0400
Received: by mail-ua0-x233.google.com with SMTP id b35so59721911uaa.3
	for <qemu-arm@nongnu.org>; Tue, 01 Nov 2016 08:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HeBANxvocHjOvUvfhkDSP0pKFuhhVTjOys4+u/MJ9Qk=;
	b=EYJIiSKomC1lsWX6LBazlAuyEjTfYdoumSfOJohozkBevanVlRzZAfTKiJWJwnRBQT
	KM753lt0hKMlI50qjQ9jeyV+JESRTB40vr2Ne1tuOhsKGrvm21vJEbEKxn6pYFrFmBhq
	VhiSTEmwqO44rBt2TNXhu6LeC8ixrhHsxLTuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HeBANxvocHjOvUvfhkDSP0pKFuhhVTjOys4+u/MJ9Qk=;
	b=agmVGTz+setgc/+MTEBEj21HvoU1W/lOUq9YygFsKtZPgOtp36HDs2Rpf2TpFkh3JZ
	a9QkgXFW76qW+gAS29oFGr6iq/4uIDLStOMImvKdVDf9oR1bZISXWHR4+smbaZsThKFc
	xfwCCxxBvLJuPw7nf6RZnw6JwIv+zN24ARhD6snPl4c6g2erJELyP+iUXwW+Ehr+Ir+y
	rkHMxuH4kIS+q6XhIbObrFfvAiq18R29fNawt4xrZsVoU1FWyOXUm8z4dS08pFFbyvQD
	zQa9V9OS+yYLD0oqgPGADOOwR8aePXPSHAuK+7b+w85Hajaloo7LiipnkoTmhMqo9YxL
	2YxA==
X-Gm-Message-State: ABUngvcV03NJz3RNbzm7NMDK2xlmh2CQd61IIqXN74C9UBBlRZLQa0Uiz91iGru2upJ0Oihz2HjIMNS2iVP14Yiw
X-Received: by 10.176.3.137 with SMTP id 9mr18312082uau.120.1478014566718;
	Tue, 01 Nov 2016 08:36:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 1 Nov 2016 08:35:46 -0700 (PDT)
In-Reply-To: <20161101152819.18906-1-sw@weilnetz.de>
References: <20161101152819.18906-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Nov 2016 15:35:46 +0000
Message-ID: <CAFEAcA_Z+_ZertzpPY1cW5VHfQ6p30-QWNPCiH10+Qq+pAxLQA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::233
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gicv3_its: Fix typo in member
 names of GICv3ITSState
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developer <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZR3o1Xas0sen

On 1 November 2016 at 15:28, Stefan Weil <sw@weilnetz.de> wrote:
> translater -> translator (found by codespell)
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

This is intentional: the name of the hardware register
in question is GITS_TRANSLATER, the ITS Translation Register.
The R stands for 'register', as is usual for ARM hardware
register names.

thanks
-- PMM
