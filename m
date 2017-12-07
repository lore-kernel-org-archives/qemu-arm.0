Received: by 10.223.159.74 with SMTP id f10csp5683171wrg;
        Thu, 7 Dec 2017 11:38:48 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbfhS0nDY0VTqOrByLucxzKFsbmqQpSlKxEMviehSZz0kD1wjJ31AkJs84a5mRo0SZX2vv6
X-Received: by 10.37.221.198 with SMTP id u189mr17999967ybg.123.1512675527984;
        Thu, 07 Dec 2017 11:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512675527; cv=none;
        d=google.com; s=arc-20160816;
        b=o19zT1vXz5RF6e/4WKY6VqiOtE1DgPw2hncNb2fgO1LocwP+R0dPvpiFYwHp1pkG9w
         7o1cgeYNmHP2vhIMwSryAZN9xM4Ycal0FIByZDoJO24MSHUuFeOPBw7Y5g6Oj37LHZl5
         jdWo9UC/WSWnCTphxUj0vXW0Pe6uN751XlamRUGmFPiwlOW0ueexVVoeJtqW9fkTMc6s
         nXY+A0jhmi8J6pRs3bXobPg0726bLodxoEGZRge8brwV72t66AE4C0uhIbXfCsngcNID
         lXCZIL1YVMnPqJ/myffyqiVLnlEL/w4reZ5URKW+xwVWk25QpM2EsA8ohVOrbfA9bd1p
         KrLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=x8kI3uiaLF62gm2v5ka31qsvW1B7qX1UhuW6d6plD1E=;
        b=nfSLXxiDdfulQO3R3TUqFXDzOgdcV43zYqI3/3IqVhaIXoeZsLIlEfRrfC/QcBM/Lm
         3j08fYU3GavpuzKhAbW9uiT2tQR6UnZL6C1oA467wxE0JniigVG8T3PqXDxJ6s7sFS7c
         q42ccq72kzvVKYLHaMSE5ddRmUUkAp0iDi60pzV2/Z5LFRw/GNKrfud0l4ldLofIH3n9
         IgyFxpPWU6l0qvNJAAmc+Em6GxfE4ShN4eBU9SiXk83UDuDG14RFPTl5VeneUNs9/slH
         LcG5aTAIb8q3OObwrA2tcAMZ7KsRL5j0LvLwOKgx/zfaqZLY+mDkPUr7FkzvlkqhYkqy
         KSzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gvV3+ReA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si1266369ywm.271.2017.12.07.11.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Dec 2017 11:38:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gvV3+ReA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eN20N-0002WL-GT
	for alex.bennee@linaro.org; Thu, 07 Dec 2017 14:38:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eN1zW-0001kp-0P
	for qemu-devel@nongnu.org; Thu, 07 Dec 2017 14:37:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eN1zV-0005ks-8o
	for qemu-devel@nongnu.org; Thu, 07 Dec 2017 14:37:54 -0500
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f]:45994)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eN1zV-0005jM-1Z
	for qemu-devel@nongnu.org; Thu, 07 Dec 2017 14:37:53 -0500
Received: by mail-oi0-x22f.google.com with SMTP id x20so5695196oix.12
	for <qemu-devel@nongnu.org>; Thu, 07 Dec 2017 11:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x8kI3uiaLF62gm2v5ka31qsvW1B7qX1UhuW6d6plD1E=;
	b=gvV3+ReA8bOKYgk0fjBHOM1emnn/iUFvhe+BS6y/UYaemt13LyBMzwnGh/LgMaYcFF
	Movw5viD+YNOmli7zlQ+SzxVM6gPsodLm0imi5qhvDdBvtjgdCu7lKHzB1/4zMqnvqBh
	zrYNbAStXYMx5HfBHwqTLa8IUvrV6la1iTMCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x8kI3uiaLF62gm2v5ka31qsvW1B7qX1UhuW6d6plD1E=;
	b=Qb0+8pRDvU3jZx9daBq1x/gsO4n3S1GmTTfZ/OFRDt3JFhc9snCe9rHFtkiDZg+nH9
	3osOft7P4wuRK3rnz4IqbcoDNnuUQTBwspkFKQUXbGNHwjdX3IDbVXn9DZqJlBW+fCFF
	W6+mNsksTyMxO4wJTgPPCKo8vp3DJPiNOBcVJxgeSVKEQi+x2oaObPbQDQBQ8voi5puZ
	4b2NiSWd6ujYDMBlO26TVW+gVuPS+ZdhLvfbW8hiPuc2WoLsAvrwQ88s55kt0SMIKJHh
	mH6dRgyALMPyZfXa4jrBlj2Jyy2nAIZxV2bkIn4ucHxbIfxY8pz0W5Hf2FxApz2us0oE
	PrFQ==
X-Gm-Message-State: AJaThX5Ws9M+TBAsCKK/PsLTHRLxUdY3J0ohOZ16bA+2uuy+bAI1f+tr
	3dYnY0MUazeMRhLDeIzeQY6ahkObOrXKFu/q2tVtKQ==
X-Received: by 10.202.199.134 with SMTP id x128mr24226838oif.63.1512675471897; 
	Thu, 07 Dec 2017 11:37:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Thu, 7 Dec 2017 11:37:31 -0800 (PST)
In-Reply-To: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Dec 2017 19:37:31 +0000
Message-ID: <CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22f
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and
 gic-version=max)
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cNt3zVDaMF+Z

On 7 December 2017 at 18:14, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset adds support for '-cpu max' to Arm, along the lines
> of the existing support we have for x86 targets:
>
>  * under KVM, -cpu max is the same as -cpu host
>  * under TCG, -cpu max means "emulate with as many features as
>    possible"

Forgot to mention: -cpu max for qemu-system-aarch64 will
be a 64-bit cpu, and for qemu-system-arm it will be a 32-bit
cpu. (This differs from all the other TCG CPU types, which
behave the same for the 32-bit and 64-bit binaries. I think
it is the same way that x86 -cpu max works, though.)

thanks
-- PMM
