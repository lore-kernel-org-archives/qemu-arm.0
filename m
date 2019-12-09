Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4658110lff;
        Mon, 9 Dec 2019 09:10:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqwjTYP9p2K1WOAprL+AT/T5MhtzWywsUh13Cpj4aEzBhvYOKDgi8zvNVtm48c0g/TbNJSKY
X-Received: by 2002:a9d:32e:: with SMTP id 43mr12084195otv.301.1575911451336;
        Mon, 09 Dec 2019 09:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575911451; cv=none;
        d=google.com; s=arc-20160816;
        b=b446LkMToNaTbigDbMNJMHoCvQDn37MWgil/SJPui13rHJQddhGSqxSi6z66oZruKS
         TiFZCVe+Q92JCtjzg7Jd+1LtO3uSbYI2Wf7iXYAEVRsMAXKO7n8HeTD2HNPHYst+F5M1
         HNO+WAwC36/C13dbn3qUHiEUYMyzc3Ykt61gc+GB4xrrUwTxEJOVjLXdaIjg+UkBAjS3
         7b20UZIP7B5f9TyzXilrS8rFCLSjOUjCu8LwrnyYLNbBtyBYOcnHLhON/lKN/JkpsIum
         dW73XQkS37N5Cqw7Q0vD5RYfp4JbLZDs8TGD2+9Nhl6rtTGdxzzjXpqP+7hYeh79ocxm
         ICAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uG0p7uaocyTdM0lZUqiJyB5zKa4/nuiB6lCeMmbQvYg=;
        b=dTQM6iE1ejfE2sCiUH1LnK8MMa0W+OPwjWZ5loD+wG3CnlEDzBuTriMbJ8uIbcoKTn
         wsAa7Gsn/2/nSXF8DXgk+jjvTvZrXKc6bc47XjSxhEnSm0/N9C/rErjl8/XnFE6OrRgI
         cD4togP1uqGjYOr8sMgk7m0/oZfY8QOiQGKf1f9qrLb6K4kfGpyp+5r4XWsJdoCz2ywS
         WOXNFRdJy+rEZnDjZOVG4RPyqmarGcKYAbJA+WyVG7S89NtLsefnwF/AgnvQvVbXIX8y
         slEyWf6omXC/plBCIHVH8Z6GkCVhqzC8AXyf2+HRb7/RkmBdJBDnhhVEfyt0kywRntNR
         bAxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vxj318R4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si168841otp.5.2019.12.09.09.10.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 09:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vxj318R4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieMYc-0001nG-HW
	for alex.bennee@linaro.org; Mon, 09 Dec 2019 12:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ieMYV-0001n2-Jd
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 12:10:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ieMYU-0005wx-Kb
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 12:10:43 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43383)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ieMYU-0005wT-Fc
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 12:10:42 -0500
Received: by mail-oi1-x242.google.com with SMTP id x14so6959687oic.10
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2019 09:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uG0p7uaocyTdM0lZUqiJyB5zKa4/nuiB6lCeMmbQvYg=;
 b=Vxj318R459k3r1HH7WKzuOobiHupJZ/+ErR13u9Ln0EV651ESx44qpEzkD1N4+S8nC
 2geP1OSFmIXo8BqBFHMvjrUt9bK/bVpZeozDuaTzBgLsiFVd6Se+3a1bPG+SgCyqrmXv
 HEFkOP5ytYA/AtXNsqsxqGUeKjA/+334Nhlyd4QgcZq/bxxCtrXpZV6sbKJaKogpSLnv
 funYKCiOy6KFZgu1lzZ/HfZwzcL08vI6Dk9+WlP9ggE8AS81M8y5nZUcybNBZ7cj3oXa
 NURnBXJ7F5DOYDzTs898khBJ8NHxaJzr4IpvKGKxrdsha7x8B0JJ7SGzgU1yCKFnNuLZ
 adTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uG0p7uaocyTdM0lZUqiJyB5zKa4/nuiB6lCeMmbQvYg=;
 b=VihmClLbLnWOL+65o+2QUzkGRX0H+9goWRe0GoFtUk6TA4LDrJ3b4Kx+Krqf/CrXWI
 ONHf5Phn98RN94u1InzdLtbNd42oAPzIEE9vIzcnVPss9Ze7LV6tDfhwF5iun+9M0CAE
 nQFS3+2/5ip0qwuuMBf2Y6CZJN5Iweu9UkTQYojklDTajLeKORBBWZx1yXspFmF7mg6M
 j8iGmxTqe3h3oaRwUvBqQ2z8nQuPkbfhJpgMs7mR5I8oxJbwZm6ESF0Dgz6He0Vvz8BD
 uRFUEN+5sZqKdvnwNbk7b6Ah2JKzuoUOnHi/AbJxArnH5kn92l7td+RxgomWWqKNgDyw
 XZpA==
X-Gm-Message-State: APjAAAV25oP45HgPGc04YAAii/uBDsiQ5SGyYhRfJQ0tWOiDC4hMvCaX
 v3ZkcyE0frO93mxGsFPsWz8ohWLSDPTKd9txihTWaw==
X-Received: by 2002:aca:edd5:: with SMTP id l204mr78252oih.98.1575911441621;
 Mon, 09 Dec 2019 09:10:41 -0800 (PST)
MIME-Version: 1.0
References: <20191209152456.977399-1-daniel.thompson@linaro.org>
 <CAFEAcA-sgFKev2MiOjRAzuE0trNYQoNe6LOFLeghGm73N1h=SA@mail.gmail.com>
 <20191209170827.yojyts6qdvpxbkp4@holly.lan>
In-Reply-To: <20191209170827.yojyts6qdvpxbkp4@holly.lan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Dec 2019 17:10:30 +0000
Message-ID: <CAFEAcA_3_EwjAZ_Av4a9BkT_3KmbEEFFFukyV7gsDuWPrYKmVQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Second uart for normal-world
To: Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Jvatz2S3ZV2

On Mon, 9 Dec 2019 at 17:08, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> I don't object to making it command line dependant (it is certainly
> lower risk) but, out of interest, has using /aliases to force the
> kernel to enumerate the serial nodes in the existing order been ruled
> out for any reason.

No, I don't think anybody's investigated that (I wasn't aware
that you could do something like that). Bear in mind that the
kernel is not the only consumer of the DT, though -- you need
to use a mechanism that all DT consumers will handle correctly.

thanks
-- PMM
