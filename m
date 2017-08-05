Received: by 10.25.221.202 with SMTP id w71csp880496lfi;
        Sat, 5 Aug 2017 10:18:35 -0700 (PDT)
X-Received: by 10.200.0.155 with SMTP id c27mr7916513qtg.322.1501953515000;
        Sat, 05 Aug 2017 10:18:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501953514; cv=none;
        d=google.com; s=arc-20160816;
        b=Uw8g60nUirXS3ESMopfQQQeOfYigKyVC1L4Kr6tAfqNoD55jcGGfBxZp2l1qVz6HPk
         xmwPD5k03HbQbYXLL24iE2cK/Gl6Yoe8eI6f5sCDIfDKiXBlVlHIIhnxKrfomaHC4e5U
         8sMMcCo1dRAJh20Q8ICchKH/BI7lsW6t1q00VHkb1uPLw6Np2o3kN6pz4lPCS34rglOH
         TVhso9DCSVUTp+zy5M5U98ZaJQxsspaLaAj14sxarsF5NC84avDsoW86d5Vv5jJH7QRG
         Lxl+bnSHTWxZuZNrPFfHMK/rAex+J8inpdDhjUnDWuY1/unoOLlz0mtxWG5Oz9x5Kcqr
         IN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DrSQE4G0LvNil9UVkDUrBIbBzyabnsoDl5pre3EeV8k=;
        b=VtbYW8Lbfu14RZs/4DOCv2n5/WcQCHn4cdFrZYoSLkvRr15gfwCRCNbvPiwsdX42Cc
         INUymUthl2jJyLjrNTJeI2VI8jP1fcRpMFEHZtppKaugsza/bIRF7Oh6u4/kDbcXUzTm
         Xao5mzzMGuOK2KGm3OoP9PNqBLEw7aGBv+4vdJZ87aT8rl2D1D1aqB44uGsAR6MIk8xs
         WquR4xTvJPbAhMJYxLzPk+UpHgJoAGiU92vLY5Vd7aSS0THErN4pxrMaQ1+RazQEKTnW
         21XWZfQjlX9RktrCib4PgzWvGfmUlBwQDU2R4Be7WeZu5Iorup8+sp47iudX/YYLW68q
         UEOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=O2G/fMrF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v68si3863195qkd.300.2017.08.05.10.18.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 05 Aug 2017 10:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=O2G/fMrF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1de2ie-0004Y6-FY
	for alex.bennee@linaro.org; Sat, 05 Aug 2017 13:18:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1de2ia-0004Xr-NP
	for qemu-arm@nongnu.org; Sat, 05 Aug 2017 13:18:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1de2iZ-0000NS-Jp
	for qemu-arm@nongnu.org; Sat, 05 Aug 2017 13:18:28 -0400
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:37957)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1de2iZ-0000MQ-D2
	for qemu-arm@nongnu.org; Sat, 05 Aug 2017 13:18:27 -0400
Received: by mail-wr0-x22f.google.com with SMTP id f21so26203883wrf.5
	for <qemu-arm@nongnu.org>; Sat, 05 Aug 2017 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DrSQE4G0LvNil9UVkDUrBIbBzyabnsoDl5pre3EeV8k=;
	b=O2G/fMrFBiHH3Qeb+HtsLkWjw7mjGB2NfSc7Kb9PoJ2AknZ9xAoNSwlMCsBwRUWszT
	f2dHDKJ0huEru7Tj/aPoeeerIyoicDIkq9/DHbt3SlmAHI98ljrYxdHWfPYWhWq+X856
	606CilO2UIXi0SuSxlXWvwKqf3kVCwZac7aWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DrSQE4G0LvNil9UVkDUrBIbBzyabnsoDl5pre3EeV8k=;
	b=s2ERvV71o8lVc9xH7Y6lCgkVkB8k7j8iRI9vVLUrdApvkFtMoW2pEyTl/Ggrv7ITMW
	l1dL4MCm7H/nTKJARoBEMkwLNL2sHlZUKwP678cGfJu+e0mEQmLssKybdjVky8btz20H
	hnesUdBK8pqX8dkr6V5vmvktc8T/D6SK1UcvWLj7XeyCGR5Zk0TB2cri3jrtD2EriABJ
	oSuLe4QgcgDqLmp0kYicZNVohZsIrMNpfG3cV8spbQdnqSeqeiSfu3DhiZam4hG7i303
	sfUrPy6tlfsC78RZrXt2ON+DHsUyeRpc+2cXiVUx/t5RegGT67F4qoOdbsIu0SYhp8jw
	/NoA==
X-Gm-Message-State: AIVw113MJ8a26qorwDGjuiMZc4ZoFBKPuj0P0Q71ck4dn1k6040FvLih
	tT4JyPrhIBOAaJTjSHLSlcAQ8QigkdNI
X-Received: by 10.223.174.242 with SMTP id y105mr5122003wrc.262.1501953506167; 
	Sat, 05 Aug 2017 10:18:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Sat, 5 Aug 2017 10:18:05 -0700 (PDT)
In-Reply-To: <20170805011209.GA4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-3-git-send-email-peter.maydell@linaro.org>
	<20170805011209.GA4859@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Aug 2017 18:18:05 +0100
Message-ID: <CAFEAcA-9Os-e5rZZCNWoi0nzjo_g6wjMui=DA4K+8KM+ZjExJA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-arm] [PATCH 2/8] cpu: Define new cpu_transaction_failed()
 hook
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
Cc: Laurent Vivier <Laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pwziKIhzg/kB

On 5 August 2017 at 02:12, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> BTW, a question. I don't know of any from memory but does any arch
> have the ability to report the payload that failed for stores?
> I guess it's easy enough to add that if needed though.

I think maybe m68k bus fault stack frames have
store payload data? The description of them is pretty
complicated though and I'm not sure how much of the
frame is "stuff we actually need to emulate" vs "data
that's only important if your implementation pipelines
instruction execution"...

As you say, we can easily add a 'uint64_t data' (only valid
when access_type == MMU_DATA_STORE), either now or later.

thanks
-- PMM
