Received: by 10.25.15.230 with SMTP id 99csp838041lfp;
        Thu, 6 Apr 2017 09:39:33 -0700 (PDT)
X-Received: by 10.55.78.80 with SMTP id c77mr18591027qkb.221.1491496773639;
        Thu, 06 Apr 2017 09:39:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q31si1820538qta.195.2017.04.06.09.39.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Apr 2017 09:39:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cwARZ-0003oj-3j
	for alex.bennee@linaro.org; Thu, 06 Apr 2017 12:39:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cwARR-0003nX-Pv
	for qemu-arm@nongnu.org; Thu, 06 Apr 2017 12:39:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cwARR-00017d-2K
	for qemu-arm@nongnu.org; Thu, 06 Apr 2017 12:39:25 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:36196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cwARQ-00016v-SZ
	for qemu-arm@nongnu.org; Thu, 06 Apr 2017 12:39:24 -0400
Received: by mail-wr0-x22c.google.com with SMTP id w11so64735201wrc.3
	for <qemu-arm@nongnu.org>; Thu, 06 Apr 2017 09:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6nLm2fPK+QCOpoK3kCEqAoiCRvQGTe7FGv8sAZydWsk=;
	b=JPt2MvoWHN3ypoqz6WVeDWmdW8+bYd2fUbYuom+cAU6EMlBvnNw33BrToDJ9eTj0iQ
	K97SENRRnYtjm2BgCLavMNa07PUxakiaGkKvd9JBixTlyeuFvmgV3Ytqj22GzMYPbtBl
	n5fY8K+Zn5x5UHbLOTiE7vgWlTg/ZLp0EB+Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6nLm2fPK+QCOpoK3kCEqAoiCRvQGTe7FGv8sAZydWsk=;
	b=aEggY/DiPAIwJL3bCerkeUR3cKSr6bm6T0G4Z2qSQGQMMA8T60VehwVQPPy2TzBOTl
	Xws3wOVoc2OVIHZOHI31IOICJucVV5VkCSAWOdbzpdUNowPCZwBH4sA5E6u11EMxF5rL
	OIfEqJqvnHU67R0CF0qJIo3fdtw/EyqRvxHU8ntISSdbvp9XezrdkXAUangdKJUAux1v
	eKzx1AMrM7bvmMcd+miKWC2SN3sbzvDogjyk0trbOFsTqtHnnT8Gvsz/EsgAGJgzYC/r
	6shcTyHwJPffhSoJuji91CokFj71+JJ39JVwqy54YinfgyZI/Cn+8xrksk5OmvMOoag5
	rHKw==
X-Gm-Message-State: AFeK/H3hkU4uBm8YGwW7OJMEPBaHoqhfOy6tIS/uU/S3vS2EMjDdmxxfoeYxPktcLCQ5gsdELliy8FSr/DcUspFT
X-Received: by 10.28.226.215 with SMTP id z206mr24630183wmg.92.1491496763098; 
	Thu, 06 Apr 2017 09:39:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Thu, 6 Apr 2017 09:39:02 -0700 (PDT)
In-Reply-To: <30f2db0a-2132-4f6e-cd06-f5505f01db88@amsat.org>
References: <1491486340-25988-1-git-send-email-peter.maydell@linaro.org>
	<30f2db0a-2132-4f6e-cd06-f5505f01db88@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2017 17:39:02 +0100
Message-ID: <CAFEAcA_2gdAC04gOEyZwgSU5WD+pBiuv4BxGE6q3r05ZMuMadg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-arm] [PATCH] target/arm: Add missing entries to
 excnames[] for log strings
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
X-TUID: 8u2r+KR1zuev

On 6 April 2017 at 17:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi Peter,
>
> excnames[] is only used in arm_log_exception(), can we move it there?

Seems like a good idea. I think this is historic, we used to use
it in separate functions in different files for the 32-bit and
64-bit exception entry code, but those got unified a little while back.

I'll do that as a separate patch, though.

thanks
-- PMM
