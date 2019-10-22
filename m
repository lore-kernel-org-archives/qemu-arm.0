Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp196759wrq;
        Tue, 22 Oct 2019 10:21:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJKelwnlXlfTByfPZ7jzUBcS/Pc4hNLnotEDaO04j+jkiQFC3CgPcx4cqCvbbrQCMVg7e9
X-Received: by 2002:ad4:480e:: with SMTP id g14mr4264274qvy.39.1571764881206;
        Tue, 22 Oct 2019 10:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571764881; cv=none;
        d=google.com; s=arc-20160816;
        b=zeqkXilOMuMG8w8o6IbwfeBFNjFDyVmXg+6d0JRDlTjm9zR+q3tF+bsTnb0q1oPP1w
         bpABKKm6Z/jiaIE73LQ5Z/1+cLJt2Y4jrRjE/D5Rb6VYsc2IXSXwA5Dgi4WGJiRwwpps
         2c690zidDMup5ciJmyE0YwizgsH+pEVlQRRAucsL+OH3vzKcxlv3zOC4fo1HKbeO1xJK
         Slo3a4aHRHLhicVda/1vycy8shashQjZlDXH38NdmIONvJn5UakhasONGBpwbHgMyYBK
         QuQFL05QT3G++lxXbT2QtZuMTwevaZwbd/mPQtTT/R914pA/4Pda4f/pBeF7RZ8QUVHA
         z0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0La5A2pXgYdYZprUXZS7B3dH09V7aLZ8RTJlRKFlNoY=;
        b=DElH/Y8kHEhtaQWcD4T4JDdtnvAjeDnOv+F9pHzLLgXe1Y74kvYRjumriqjxN3oMzV
         m7ZW9Sn3YRLR7q7X395BHHq9UoxJGXdVrmk3hbMPWWzcs2mLJmPhfiBrMJqwupFlcxSn
         cX1UDgAcSZczYGygeQdr4jUQrIPwbxG0Im05Xw66Z4kkXw7HTTaIZNb4C1ubrUT7ERqN
         Ag6FGJyUmw2/LA0HObrd2zDurOsJ//crb823vrVZwsS7Kcy832ZbNkCtnXqF8AQ+Ueba
         3u1jo1JxJi5LwG+pv7wXFwrqc4RJRCf0bBUGeZGCnkOtRCA7Qor0/8UPeAzgurBrbIy1
         6mZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yhk6ETxr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j202si595148qke.175.2019.10.22.10.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 10:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yhk6ETxr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMxqS-0006b6-JG
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 13:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMxpq-0005mV-3I
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMxpp-0002Up-3u
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:20:42 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38051)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMxpo-0002U7-W1
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:20:41 -0400
Received: by mail-oi1-x243.google.com with SMTP id v186so2072402oie.5
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0La5A2pXgYdYZprUXZS7B3dH09V7aLZ8RTJlRKFlNoY=;
 b=Yhk6ETxrdaUM2oJ+DtchYQZhE3pWS71TXPp0pu4KdJQzXxHLxt47qxXFNobSG/XOZn
 lDV/bRQ0ZIUYyfZ/OSjc43OxtvlkOnYr6WAjrI6z5nD8+iHJsekiiHkxeKxBhC8Bbo8x
 augR3pitXD3WmUaFREDO9mVHDn5jlo4vjQRenR7t1ut+KmrWQSrWo4r9Qd+R7YhpF2Mg
 Fh3rgVFX2tMuYxOQ4w5kqb9vN60t5F50EP1/XmEnprbILtk9qTCJFMv+ybLQ16/SC07U
 Bq3eOxQTc0ya9boSk75NZjv05W7vqYWP85UiMwlow0Flhvx6KxZPR6Y+gBzEMPTMGyUk
 tJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0La5A2pXgYdYZprUXZS7B3dH09V7aLZ8RTJlRKFlNoY=;
 b=J+wscjZpEYJt07LsFXVCfVCrW7+pX/nQ2+fYxy+4cgHhaFpx9ymCbGpzCNOwF5A+C9
 S1MGbi0laQ5k5jhr0cJPaFyt3QlE5e71QQoeSNHYDMqo/Qh7Cbr9K5SMnWx9GmykTiTn
 FfvUWtCoGJRdJXUn1PQfr0jTajZ2enr7K6lZRAyFv3jkNCODip7oUfSdyHOWXY3jGE5h
 CzqEnWZQZcL9zDIFY56fxDuTtwRsAfU6Q01+xs2TGfSS+JnvkGtYV1tcsOLVZ9U885EE
 g4k/wsiHItB1k0/E9NdHzalGd3WPe3RosnA7VhLtOaZ+RRqyLESSaugquIk37MMe/1x9
 BuhQ==
X-Gm-Message-State: APjAAAXgsbui0mbEp/XZ9761hxxpvj9ZrJRUaL8RXYtKf37eu4nUP4tP
 4yfGguojGxSsTErhpBPx35AkceTXE2nKZc3reGQPkQ==
X-Received: by 2002:aca:49c2:: with SMTP id w185mr3959708oia.163.1571764839900; 
 Tue, 22 Oct 2019 10:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191016090745.15334-1-clg@kaod.org>
 <CACPK8XdT0_JCxzfxd4dCafK0Ae9+18ZWcusuXV+d4eEmwwBnkA@mail.gmail.com>
 <CAFEAcA_6yxaanT2N6Twos_FxjJNgvVKShwgq=pR4fqmcZUsQFA@mail.gmail.com>
 <CAFEAcA8py1obBXc1o02wTRkXms9NwCnCT6Q9ZZ-4W=NzNocLrQ@mail.gmail.com>
 <a0b2779c-bcd5-0fe9-ff3f-d4254aba8805@kaod.org>
In-Reply-To: <a0b2779c-bcd5-0fe9-ff3f-d4254aba8805@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 18:20:28 +0100
Message-ID: <CAFEAcA9nymSxBkEm8GcJm9p4Y_obmK-fbojFEi+Et52H-mPFdA@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Add an AST2600 eval board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p7i0urTg+XgE

On Tue, 22 Oct 2019 at 18:16, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Is it time for me to install an OSX system for dev and tests or is there
> a way to reproduce the issue ? no errors spotted in valgrind.

I dunno. You could have a look to see if you can repro
it with the travis builds. I would investigate but I
don't have time this week given impending softfreeze
and KVM Forum next week.

thanks
-- PMM
