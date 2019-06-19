Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp126498wrg;
        Tue, 18 Jun 2019 19:24:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxphLVqwHWb98x1t7mCV3ai99Jd/gB187aPSvBEkfNuxpzHL7B4yjJ0kaYn8iZQAXO4x438
X-Received: by 2002:a17:906:948c:: with SMTP id t12mr89482224ejx.222.1560911081703;
        Tue, 18 Jun 2019 19:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560911081; cv=none;
        d=google.com; s=arc-20160816;
        b=IYrLQ14VowBwcrLmeaV2zS0SrMchXlLtemnUAcnjCG3gaJK2bmgoPqOWD8dgobvblU
         tAPnexbhzwUDZKix6mk4MYUb4fy1qQrWE57VbeTgTFe8WaqXf31p6i/3NsbVAC1l4Xvo
         5s4T5/5/uLpAnhJkdAXMQ035GvyKFa8WhKoAPr9gVRUkTMw9SHrwVTK12gVCbeue4Xv7
         Jbl7PzZN2pFG/pTb8OocTwAdXUUWwAzIzGiyUuAcmFs0B4HqimWk2iZ88b2uwboEuteD
         wxC9tK6+J+hvj8qVLRO2O8MYxOMyDy8ch2grgV4ob7UmUYxwW/DmBi2zoGCu2z6vxCom
         KK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=wvn4Vif61o3VRHggbcT5JUZbaHwuzqncIVST4G/0Wlg=;
        b=jf7cAS1OpHIJXApryeQmy5lZK54TUUbhO56rvLSEdo8Qy8WR1WIeH7k/lrZg8o1JKq
         QzM0ur8wjNfOOa7VpNb+a4XHvDx1eWYKXCwkAmuxrmA/JxtLhnjaxt9CktRe+V3amdhf
         czaKKxSPx0kDhWfwiJAkIw9+7xIj5rN3Aen3c8wKZ/JdGnifrHkigcx627vubiN/PEW9
         IRNDIcQt3Qv/yKQnvfRMiwsZufJI7Q5TrInYCh4bwR4ju7bFvXj5SXrPW7VQL1iUlvC+
         alyQWIVjM/f4+XvdUrdzEJ5riynmsB1HewoJfrbcsm6DTbBmIxZmchgBcB+GojCNenPE
         0PAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=cvBxi4Oi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z44si12968886edb.16.2019.06.18.19.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 19:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=cvBxi4Oi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdQHA-0006ff-Pf
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 22:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36369)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hdQH5-0006fZ-Mi
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:24:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hdQH4-0005NO-Os
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:24:35 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:35215)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hdQH4-0005MN-KM; Tue, 18 Jun 2019 22:24:34 -0400
Received: by mail-qk1-x742.google.com with SMTP id l128so9974218qke.2;
 Tue, 18 Jun 2019 19:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wvn4Vif61o3VRHggbcT5JUZbaHwuzqncIVST4G/0Wlg=;
 b=cvBxi4Oix9OON5yD/2BNsAbiaawGwAdRDbqN/Hz4Yay+zVCspGWpyTgsUwSO4C34/m
 D7x+N75+QisQ9rVmqaQFRoMwDOQsCNsTH2LemrRXTb2EGb6IvO+51cTJ6xXPwiFMEoqw
 X7e//nGCfAu65SAb/3JGDnQmUuL6zJNxc4xsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wvn4Vif61o3VRHggbcT5JUZbaHwuzqncIVST4G/0Wlg=;
 b=oO1RwiYw4iSIFOx50dkRwHSDYm7lRU1DL6TsFYOn3Lu3RqsW7a0F6WCbbrI+1WmdoM
 6B0RJ60M3qeGG/Bf391zHoknntMz/lsZ4MR+2zKKippowCTa/ohHhdFD1sHhbdUkEuHu
 u/bFnHcyraDTB2sp/qvD1PnPq+/6vZF83wRSt5iWD0x1lM0Ek6vMqNuziqXxS5d3yPXr
 QacCUuPf51q6n+ouneTwSc5kWCtyt0wz28V8Zt8F8yrArJNkDXuhm7kow/IwePkq1ufw
 FVCbEHjM91DovQX/K1k3f6FPjL+geNtQJM6NUP874fqS3XzpO34AclXw52/Wc+ef6cEh
 FvQw==
X-Gm-Message-State: APjAAAWL4GNZSXUtDu/sOuHSsZkQGUT6KTajca+YlHVapADNcBfEmqBR
 mlhPhCDAtmdXf2fMu0craMv/wiIBvnzhh2GaNtQ=
X-Received: by 2002:a37:a10b:: with SMTP id k11mr99980159qke.76.1560911073212; 
 Tue, 18 Jun 2019 19:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-20-clg@kaod.org>
In-Reply-To: <20190618165311.27066-20-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:24:21 +0000
Message-ID: <CACPK8XdwsBZktQBjBszMMCo3Gkfwz_h=8xyZehhY7bqE0U9GSA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
Subject: Re: [Qemu-arm] [PATCH v2 19/21] aspeed: Add support for the
 swift-bmc board
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Adriana Kobylak <anoo@us.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dObT+LmRGxGw

On Tue, 18 Jun 2019 at 16:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> The Swift board is an OpenPOWER system hosting POWER processors.
> Add support for their BMC including the I2C devices as found on HW.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
