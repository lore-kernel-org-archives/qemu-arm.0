Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp566969wrq;
        Wed, 20 Jun 2018 03:03:15 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLinZEsepbAFW/Qi6k3bIpRiHbBfJjC+aDO/h33M14aT0wvQZonLGL98oOQSDtte092XEdb
X-Received: by 2002:ac8:7349:: with SMTP id q9-v6mr18905690qtp.132.1529488995801;
        Wed, 20 Jun 2018 03:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529488995; cv=none;
        d=google.com; s=arc-20160816;
        b=IP29KjF5NOqUPbw42fHyjKSJ21MyK+tr2uRc/1PnoKsFPthBq95aTc1++VwBjZTs4q
         SwKCYqGD1RnALEwRZDtyzKZskqYVOkFf4F+b5l3T6OF8RUlgJ1GfU4Ob7xEZa7gMHIpD
         nrjeJCfyKOiWtyH/FtpPn2NpbdafUu0ka84JoRT8axCk/4p+mD4AQe+AEZvEbSAgJwmP
         JhcDKL9DKS9x8oIivoQWPBbio7QnkP8kndHc33ZJuzowAy1L5lF8Fm0YbUjEFu6gwEzt
         r5hdcdOTdqg3wJ1xF3nf8CEmyLDtGLmdtzVH0mVKuJspea0jwx6PXs6lKadq7itECRz1
         VpdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Zq1Ktd62g+BzESb0omVUtdLg0sFf4s9N16yI0KbXczA=;
        b=APqqqgKU7litc/Ym3GgJx/yO4iP6DDzetXXpVlvtrozb8y5i+du4CZM0jS8wFJFmey
         M+pJDbIATjX4jvPsmmyPbZurtrrNry7m/vtzG78qCXDcKxF4YoDzzDpmZvoiQA634Pnc
         FU6obD/koK8cOiumzqndD9XGHVAvRq3SPxyCFhFE8NcqQsJapIlfnRAOfFmS/EEokBmB
         AAdJQsyAqK+XUDwSXUZVSD4cghQN6egTjl+F30x4GM1iiaPZbx3DrmMY819xjsOHhtbF
         geV7CkqZvHNm8cT+dO2FWQGZC3ObMD/04B3lUmlB7wsEzekoU4oEoZCqarDDecd2XusE
         96hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LgNnCwn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w31-v6si2055030qth.67.2018.06.20.03.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 03:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LgNnCwn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVZxL-0006cK-9K
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 06:03:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVZx8-0006bQ-Ih
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 06:03:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVZx3-0006E0-IV
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 06:03:02 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34479)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVZx3-0006De-BO
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 06:02:57 -0400
Received: by mail-oi0-x241.google.com with SMTP id i205-v6so2505397oib.1
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 03:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Zq1Ktd62g+BzESb0omVUtdLg0sFf4s9N16yI0KbXczA=;
	b=LgNnCwn7C6XAkduT2V61YI7CzyPW+mHmhWzOZrV10azud8kw3BHky0S7XhncZT56/D
	GG2Vi2R3R5QwYe/LyC4f9luv1xurSk35fF6Z/MBn5OKHKf9pUV6cBKggn2jjlCB0aNzz
	TvFWx0FdTyqHB32nTZ/TDJT7FbK8LXesCoK0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Zq1Ktd62g+BzESb0omVUtdLg0sFf4s9N16yI0KbXczA=;
	b=ZzWlE8+o9tsh6BDrBy/ELqIM1TEaxBM/fWAwUDt5kHr4QHjg2A9vKf7OXT9ocFJie0
	3ElUrILJrN9bstUa3KWTq8PkvXkAzLdxD1MZ5YBWajHguhJpoOmXb39kOCvFjhq4dL+s
	bhDiF7pkvjyceiKOiy85XJHFaOIUFbMHxO1v+3bNbZl52SnOd64JqQx3pC5hT6954fE8
	IISndaKsdJUYVoGoJh5Z3yTWJMREHVJKGFqTwOFs/eNk+bfsWcVB8c9oelmwD1nDHblp
	SdTaFxB8k7hamen8DE+moU6YAJstJmeZ0BwERTeAeU88v3YYC/BE0HrFO3N4mKZOfUOg
	HbEQ==
X-Gm-Message-State: APt69E2xEUWmkhDLVLtjujRq0OxrbkZKiiq0+GGGnYWAxm3hYBs2/Kll
	l+g/Dy7QZErTZVajjHsMo69/WgAI4xHhz3PrhESU+A==
X-Received: by 2002:aca:5383:: with SMTP id
	h125-v6mr11759382oib.252.1529488976632; 
	Wed, 20 Jun 2018 03:02:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 03:02:36
	-0700 (PDT)
In-Reply-To: <20180620095000.mbhnrfmlnupzeig5@toto>
References: <20180529124707.3025-1-edgar.iglesias@gmail.com>
	<20180620095000.mbhnrfmlnupzeig5@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 11:02:36 +0100
Message-ID: <CAFEAcA97ZAfbstKJAcjSGoP20P3hao3-N7mG3EeGgtRLVeCcxg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v2 0/2] xlnx-zynqmp: Change the Cortex-R5 for
 Cortex-R5F
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vUB5zJJVK5EA

On 20 June 2018 at 10:50, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> On Tue, May 29, 2018 at 02:47:05PM +0200, Edgar E. Iglesias wrote:
>> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>>
>> The ZynqMP actually has Cortex-R5Fs with the optional FPU enabled.
>
> Hi Peter,
>
> Any comments on this series?

Oops, looks like it didn't make my to-review queue. I'll put it
on the list...

thanks
-- PMM
