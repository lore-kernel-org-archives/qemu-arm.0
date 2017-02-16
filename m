Received: by 10.25.77.65 with SMTP id a62csp2631682lfb;
        Thu, 16 Feb 2017 11:34:23 -0800 (PST)
X-Received: by 10.237.58.41 with SMTP id n38mr4118887qte.134.1487273663705;
        Thu, 16 Feb 2017 11:34:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6si5912405qkc.276.2017.02.16.11.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 11:34:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceRot-0005KM-5o
	for alex.bennee@linaro.org; Thu, 16 Feb 2017 14:34:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceRop-0005KA-2e
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 14:34:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceRoo-0007Ni-9I
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 14:34:19 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:33858)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ceRoo-0007NT-37
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 14:34:18 -0500
Received: by mail-wm0-x22b.google.com with SMTP id 196so5499818wmm.1
	for <qemu-arm@nongnu.org>; Thu, 16 Feb 2017 11:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9dlm1wWxOPyDAckCz01jwtXvo8CJCC4nc0gBxQSojZk=;
	b=K5HxzMTC95dA/spehazzZjClaYgiZ4AKqT9hN155bb8e/gaJzPaQxhN+L8jDGNsfKb
	m2zX9h/OHJj6tjW2UTtOiaQtx8UYnEBe2msfm5j76EHZL86sUU0DEbJ7ajh60P3iVxB6
	JgV+5bHw7GM9DSOTuhDb98GpejqBdMuxhAosM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9dlm1wWxOPyDAckCz01jwtXvo8CJCC4nc0gBxQSojZk=;
	b=NaRILlloQe2Z25KsjKUJthLzaBvTWntQrSLpAZLhva157K9cXOX45qu+0dGjuoOfYs
	+aNPad9BUDQwvFyqVzSbE2weKlOPveGpXrk/dh3L7Nxx/7cH9A7hgCeo7tW+DTJGB4Tj
	r2Ky/7addRiQvF/tuHeMeiCksvI2nFXu9QcXuHI77/8O/DQoO8IcKVe794zBAuQ9vV5v
	1GA06LmoEyDCnENZeoWLVrVhC9BdZkXKdxHam3ip1MeN7mwYi3K6+PjJTQMp46rb9rOF
	jTotvTeJaeifft3JMwk1xqO7NPXBqCnjhnM+xxzbkQNlQ+5Cqi9+r9HitfacwWcutR6B
	Cx3g==
X-Gm-Message-State: AMke39kK3oToI8aJYvy5H5ruwV0/VuQxQTS4N8NmJp3lxSOSR1Htnem3CbJe9pPbkOPmfdHqK60ZWBzKGm00y5tA
X-Received: by 10.28.91.16 with SMTP id p16mr3737016wmb.111.1487273656885;
	Thu, 16 Feb 2017 11:34:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 16 Feb 2017 11:33:56 -0800 (PST)
In-Reply-To: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2017 19:33:56 +0000
Message-ID: <CAFEAcA-MMw0_ombzTD+kQYpeNKywtcKY2UczcpR-hFDwGZhZJw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [PATCH v2 00/13] Rewrite NVIC to not depend on the
 GIC
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e8mkVU7dqsTz

On 16 February 2017 at 16:35, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset is the revamp of the NVIC code from Michael
> Davidsaver's patchset of a year ago.
>
> Despite some superficial similarities of register layout, the
> M-profile NVIC is really very different from the A-profile GIC.  Our
> current attempt to reuse the GIC code means that we have significant
> bugs in our NVIC.  The series pulls the NVIC apart from the GIC code
> (fixing a few accidental bugs in the process), and then once it has a
> place to stand, implements a few minor cleanups, a key bugfix
> (getting priority calculations and masking right) and a missing
> feature (escalation to HardFault).
>
> For testing, I have used the Stellaris image I have to hand:
> http://people.linaro.org/~peter.maydell/stellaris.tgz
> and also a set of bare-metal test programs also written by
> Michael. You can find my slightly tweaked and cleand up
> version of those here (a README explains how to run them):
> https://git.linaro.org/people/peter.maydell/m-profile-tests.git

PS: git branch of this v2 patchset at
https://git.linaro.org/people/peter.maydell/qemu-arm.git nvic-rewrite
(includes squashed-in fix to patch 3).

thanks
-- PMM
