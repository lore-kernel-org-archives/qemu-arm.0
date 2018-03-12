Received: by 10.28.91.67 with SMTP id p64csp730448wmb;
        Mon, 12 Mar 2018 06:00:01 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuEiuq9vDYKG8TJaAMMCYsRPUg7uHvwGDyypxEWftHPjd8mPPkSj23RcXBT+qkpaZ9hhggk
X-Received: by 10.129.89.212 with SMTP id n203mr1372884ywb.437.1520859601150;
        Mon, 12 Mar 2018 06:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520859601; cv=none;
        d=google.com; s=arc-20160816;
        b=YNLgJayCZbzr3+pr3uweNaM4hAf9qCQXU2x9ciuoTXU/DhiqEHUbbb9tXFB0TF9R2K
         qQqyEGaSB1HdbN6Pi2m+GgxuH4Yn6dR1XMMaJt0LuM8vQY54wRAZgsW3CfHrdaBhtvKL
         HJ2GdQ5UXJjnERNtTSIdGm5LVLpWsaQkc3WNKR79EPgyDNGmvi2cN4Fxcgf9rUrnx7VA
         Q1akfebrOcokDYWq44+2DWgT6K54sdxtXr82cPJAWAuSaG6qfKDhPnYpG2t747Nuf+Lc
         QngiQThqcgjXx5u+q7CFgos9na4L7a+K46c10RJ3dYK3SFtBtr0vIu/jI6ydrk8hmqVt
         GJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TyomQApxXIaTq8ttA7ia4VAayHuYbKjX2APgEuh4ZGw=;
        b=oB3JlBGOKDQopwQhqMiU6DjkcNXlc+NyKkSdhMMmLPk9ITrphjB4+iu/tSsvDNMCsQ
         Pv96agUygm0VeEZJTzYMdh7O9GB10uyyt8QhvedmSIprSEfjjaFtxR0Lqd3hPWrHkhl2
         V3dWJro0b3+fG+s6kn83Mi0G+Vc7GaLIkEmwDBVjtx3QBLv8BtvlBxyzxhkzYMNB+/BO
         Tb5TTbkHKLPLL/W7tuTVw7cEdDBOI+5/wqcrShder+3SmsvWeorHTYssMQ5p/4I4JBhP
         /ggMUzhy1Smu0Grkoxp76uxt+YPDS85+swD/wSb5IK+01+ysKKsz5mvOzVyauWcOAPDP
         UTYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=epVi9py9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p205-v6si1171435ybb.297.2018.03.12.06.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 06:00:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=epVi9py9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58579 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evN3Y-0005zN-KM
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 09:00:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evN20-0004YO-D0
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 08:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evN1z-0005dJ-Nc
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 08:58:24 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36848)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1evN1z-0005cT-IB
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 08:58:23 -0400
Received: by mail-oi0-x243.google.com with SMTP id u73so12180920oie.3
	for <qemu-arm@nongnu.org>; Mon, 12 Mar 2018 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TyomQApxXIaTq8ttA7ia4VAayHuYbKjX2APgEuh4ZGw=;
	b=epVi9py9Ly6eA8TuPOl7gv3z1grEda+3OcbQfhCpFpWPXOUKgjlAjPgcKQov5eJmUi
	11UlKAhsv7jx0w09zpzHuuIKmMzRzYvTNZBo7XL3xw4UXwXhRnggKs5meA8jJhAAp1Jw
	XZw7HZDZr25u1Yggw/Q7YKHEChQP1uKXUTUk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TyomQApxXIaTq8ttA7ia4VAayHuYbKjX2APgEuh4ZGw=;
	b=JV8LCqFiv7lxnG9LI4Zg9Cb8B5V+72+afqPUxujqjZcufwqqPArt4WQcIYYodpGnks
	tYvD38P5a8k7zyWWsnaiiuEEIM+5aZyatlPhX8Vxb567QjvpcomAK7Z+ND+T2xGeeJe2
	wMPxmJJWiSF8ba2CaS2P9Ks7nm7tG6fDGvFEvFHWyQ5ssv7nG7m3ma4UF1M7I9dKyZQa
	LfHXD1GE98iU7R8t/h2noEkf/je6gEE393TjMbWLRnMHdBMfCrlokYMA8TQtv8xzd90G
	kS9jQ1k3aQrg4UO+3jO8vO4543EIJ9Tr8Gr93nuxg9VXsfA8+7UDyf0K9ImmJxlgC7BL
	Rg7w==
X-Gm-Message-State: AElRT7HoNbO1KNRZ2H7FADgPldSv/0fhAQ06c1P0rH6vNA3l7AsRfFbO
	QNtLEwApTucuBnb6pM6Oayiny4hNr7rLEYuo7/4kGw==
X-Received: by 10.202.97.87 with SMTP id v84mr4982469oib.12.1520859502853;
	Mon, 12 Mar 2018 05:58:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Mon, 12 Mar 2018 05:58:02
	-0700 (PDT)
In-Reply-To: <74aa2e5e-ed1b-3cf8-8ddc-41f7ef90ad7b@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9KzitEO21Rgh8Azip+gVJjyobzNbk8sHuQf-ngg+Jjxg@mail.gmail.com>
	<74aa2e5e-ed1b-3cf8-8ddc-41f7ef90ad7b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Mar 2018 12:58:02 +0000
Message-ID: <CAFEAcA-Mb_o88ieynaY8k6xehTyAoC13Dkf0QUUyOGmEjRd7XA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 00/14] ARM SMMUv3 Emulation
 Support
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Prem Mallappa <prem.mallappa@gmail.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S7Dzr4zkHCjp

On 28 February 2018 at 08:44, Auger Eric <eric.auger@redhat.com> wrote:
> On 27/02/18 20:02, Peter Maydell wrote:
>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>>> This series implements the emulation code for ARM SMMUv3.

>> What state is this series in now? Is it "seems ready to
>> go, needs review"? Are you hoping it might get in for 2.12,
>> or targeting 2.13 ?

> Yes I think it is in a decent state and I would be happy to get some new
> reviews, for a tentative pull in 2.12. In any case I will be reactive on
> any comment in that prospect.

Hi, Eric. I've now gone through the patchset and reviewed it. Sorry
I didn't manage to get to this in time to be able to put it into 2.12,
but there weren't any major or structural issues, so we should be
able to get this into the tree early in the 2.13 dev cycle.

thanks
-- PMM
