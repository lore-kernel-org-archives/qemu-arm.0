Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3292144wrt;
        Mon, 7 Jan 2019 02:30:49 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4d54rNFBsdd0sbuv1ARvcQu2I2dUb5lX5LXWpr2qiViLQYCEbiLVhR2Sw76uvcAi7BkhKv
X-Received: by 2002:adf:9ec8:: with SMTP id b8mr53883878wrf.164.1546857049003;
        Mon, 07 Jan 2019 02:30:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546857048; cv=none;
        d=google.com; s=arc-20160816;
        b=SkT79q1gshdWZ8AEj2GrBt1SaGwoCu8dPD+gqo2Y5zm6vyO1sVhMOWNVO+Va5e1lms
         e3SgJv0pRYueCkQW0cCLAsNBDyk/UWYbcqDbi9MAYvBIv37A3HWObTCHhCM7YJ8Zy/MJ
         HtyX3quxQDcHcW7ZT77hOMMUxbbvuRXBcRzqebVrBW7jQQYC287iXBh95IwVTlMZki0M
         xPoIbCYbdp6mgCc6UrFEuJ0Xv+o/EoxIGH+aBbjWKkIkziOO0mRjwNEwFW3oxKu4mkcc
         9dTuxmdPkuHeWLCr/o3xJxTPdyf+grBlniyhIUzTlVxlennUgucdqj5XTLioM42c4VQD
         ysNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CahJekLw5i+Rg9MebIdTvDgTFt1Tuenr9NV8IGk9/mg=;
        b=m+6GdOe41Fb+nitFPq00rhN71UqA4tqXW+AjhxLVlfR/XCryyuHxAIF/N3zGr7n2vo
         pdKYmdO25pcAgGYHXR4pYAKvSkA8uhq+YmmwRN572OtTbT6k/B4ya9KBWhlzZtxWClJQ
         5dJ5ifLRifzVQ3bR3mZ5Fa6NCISm+CU7TklKrhsy1rnRqVyNGYkqOFWiRKvfd+VbKtS9
         p4i2pWPiWkYGhBABrtXCqIgtNifoVQTHPovyHoUAPVzZCL1J79Wu3KjjAZriyj6nM/pb
         fYkZfTL/2lvIJefMIWnGSb04G5YKTsRG6yPnF5T8CLx9wj09wC+DYYlC+OLKX6GlzbF8
         HSlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eQaENkGn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8si5097056wmc.123.2019.01.07.02.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 02:30:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eQaENkGn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggSBE-0001DZ-3F
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 05:30:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggSB1-0001Bk-CC
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 05:30:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggSAz-0000xP-4p
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 05:30:35 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41774)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ggSAr-0000rE-Eb
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 05:30:29 -0500
Received: by mail-ot1-x342.google.com with SMTP id u16so37351772otk.8
	for <qemu-arm@nongnu.org>; Mon, 07 Jan 2019 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CahJekLw5i+Rg9MebIdTvDgTFt1Tuenr9NV8IGk9/mg=;
	b=eQaENkGnO3iBRLG60WsAJozmHPYFq8FwjubH+OCsAcN4t4lsSOo3tzZSU/YtHTcl7P
	jjIJqOVbgNHzf6445gfKpC3qwlTyo1tUr6i0VqHEP9dD8bjpIr+Rj+4SxLDoDMagmQ1l
	slj7JoOmGQZAZq8iWItZ/8Vi5EaAgg9iayHFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CahJekLw5i+Rg9MebIdTvDgTFt1Tuenr9NV8IGk9/mg=;
	b=iGAPOj77nGIVu0JDGTfQ0y8761oiI19MfXfxLVLvZJyXBF/YcIapoNuggLpC3OdLBm
	W5S3HjqAuL6x1Olo+xAYGS0J9CRkiZztPFcMcutca6Ea1TmqOeruEPBW1pe4w/ZHdBXe
	nugn6QdJt+vydJrCfMztoOKf8rpzauYy2rV7qZuc0U9nzsMkqsPFZM9Wajzk+z+Nce1P
	rAWq5ezQCfJARM1RWkoyrbZE4Yx/LQgVHE7pTl6om8ajYO/etxi1jTBHjd+wZ9OnipeS
	KiMFNbUanUdDvypgDe7JaGqSZkH3bhRRbrqgvNQc8W8GUh7Y/fE/h5Y034X2DuMz1Qqj
	KwZQ==
X-Gm-Message-State: AJcUukfSVN3BTe8K9Tsf7BO60Wja3GyVVSDxixbdv0X2VzlqF9ZV14RQ
	IGUwCxHqf1u4obX9eNqG74kezCpElnt4wV1oni7EHw==
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr40972282otq.316.1546857017477; 
	Mon, 07 Jan 2019 02:30:17 -0800 (PST)
MIME-Version: 1.0
References: <154681539681.475.7900177304020568757@02a1dbf831e2>
	<45bd563b-881a-5308-dca8-9aaad94b7ebb@gmail.com>
In-Reply-To: <45bd563b-881a-5308-dca8-9aaad94b7ebb@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jan 2019 10:30:06 +0000
Message-ID: <CAFEAcA_dzEkTFZEsKRjB0pX+rDnhkE=5=qKy9EnFUdu0nH_=yw@mail.gmail.com>
To: Nick Hudson <nicholas.a.hudson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4] Support u-boot noload images
 for arm as used by, NetBSD/evbarm GENERIC kernel.
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
Cc: fam@euphon.net, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bhvtKmztuCjU

On Mon, 7 Jan 2019 at 07:54, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
> On 06/01/2019 22:56, no-reply@patchew.org wrote:
> > This series seems to have some coding style problems. See output below for
> > more information:
>
> The files being touched have lots of coding style problems already.  I'm
> avoiding i) fixing these in the same diff for clarity and ii) in the
> case of IH_TYPE_KERNEL_NOLOAD, following existing formatting.

Our usual rule of thumb is "keep checkpatch happy", ie don't introduce
new style issues, even if the code being modified is a bit messy.
In this case it's no big deal -- if you've already sent v5 I can
just wrap the long lines when I apply the patch to my tree.

thanks
-- PMM
