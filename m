Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3733572wrt;
        Fri, 30 Nov 2018 07:57:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XVJg9yGsom0fY6+oi5pZC/Y96MvDHVp8GHTugTIe2PoKQ5JTntYeJzbplbOzppSk3As2LF
X-Received: by 2002:a81:7b88:: with SMTP id w130mr6202603ywc.156.1543593461624;
        Fri, 30 Nov 2018 07:57:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543593461; cv=none;
        d=google.com; s=arc-20160816;
        b=oP20Q6I0r8tN3PAjOGIwrgRAk0Y6RKbKao4aRCt97f2NUlzJCYy6HzF61LUlIYrM6O
         HC8f1GB72fhUm22nx4Xpfd2y6PS2u5nWvcZUC8k+4r3758NQLJ/smHPwQlhPu2qymcdC
         ixBnfj4l7yTrH1WKinYW5ufOuS/op9O6zU7IAE62kXWoIfuQYrDaHsR7jxtySV9KtIet
         HeDPzI0E5ZIT7TdIo8sECRuVJ3ns/yM9uUsdDKcPwYZP8aJyIKCzHQ0pSeqVDxcWr8YZ
         6VOIhKO0lrNu0QX1oREictERgjBYYjI/dA4N4WWQb3a9yOLYbJmpWYl0VQHx/ITzWpet
         +lRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L+JYYGPcKM2uUhCwyyx8RPUck3J7M96G+UlA1N4T4n4=;
        b=wGx5yraQL8wlDU77VCW24GFWCvxGJDdV1Wemre4TNFfPeunPsd8pysLfHPbJT01gtS
         SDQEdTZBTNDTcZbxioDH+fU4VsEPifEgZvxUqboXE0BuWOlKjJIC4G4vdXTZteUouCEy
         q/CERK+BPFfCoQ1iafdI8UXpXsVBp8qaqoKwAsR3Nc25+CLXIJ38ojhK63M6u4YqFZuC
         YR0KifYPVpPDRKMZ60B6tlfVE3o3t7q82RaPj+t/ft38xxMJcVYXgA0xgAFq220WgOjN
         ysxSdpswZpK7cc4KyfQW3MxzeokomFGh1pu0UI1fCzuUrxJeQ/DmafRdVNPyi/VQSf8C
         gMPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IdJPmH+b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m125-v6si3207701ybf.94.2018.11.30.07.57.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 07:57:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IdJPmH+b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSlAj-00022P-13
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 10:57:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSlAV-00020R-LP
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:57:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSlAT-0000vv-Fl
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:57:27 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSlAS-0000vD-Rv
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:57:25 -0500
Received: by mail-ot1-x343.google.com with SMTP id 32so5491858ota.12
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 07:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L+JYYGPcKM2uUhCwyyx8RPUck3J7M96G+UlA1N4T4n4=;
	b=IdJPmH+bpFecbnhWLzDmdyQmHSlN3RiPf7OtUbG/lMyg7EqAamc3fR3AFoW7HjRAiM
	WknWBeWvPdFRrLYFinwwPjuI7hI1I4Rcnf4WBU8z+32clrfwS5XHH3dd7QLe7PkLws6K
	S3V2XkH96zwscVdRy2lBhikoOTsJPx1m1leSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L+JYYGPcKM2uUhCwyyx8RPUck3J7M96G+UlA1N4T4n4=;
	b=XMVLb9UmGLhClMROPR4zQXYeO5rVZJhc/G0N8s39A3kdVVuRGgerfA0dbQ0eWR+vkG
	CqgmA3JFh7B61oxD+7l1s8bRqjEHEdVT9cTw+D66t0+mN2jfL0Oh2uI4JhSW/o6fY+xt
	ugh6i5cgrtbhIGAv09iPkJGWu4AVzykYJwIA+/hnIQ5ZiHazfOrdQBbQle4UGkBTYQhv
	7IUWnC1TRXnLR6yZKZAFnvVt2jC31zgJgsv2Dgxy6oBVt90fQvTlkjIdR6n0ITgrOG1W
	YIwXrV3waUWJ+jeAI1SDB0mCodjp2CY/eUYsvkgJzUqiewGmak+iFW2NZkgWKOMlMjbA
	3nNg==
X-Gm-Message-State: AA+aEWY/9dc8XXeqe1xnb54mU34Ui7yncDET8ipPrI0mVjYo8ndI1XCb
	UGx6boY50jULxTiYG6OUiOqL84a467mTxtSyBgTj1Q==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr3553273oti.151.1543593444275; 
	Fri, 30 Nov 2018 07:57:24 -0800 (PST)
MIME-Version: 1.0
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
	<1543407172-16175-8-git-send-email-peng.hao2@zte.com.cn>
	<CAFEAcA83C_Eic3K4yY5bGeEKJpY2uf26diFtDJ5r+W71jcX2DQ@mail.gmail.com>
In-Reply-To: <CAFEAcA83C_Eic3K4yY5bGeEKJpY2uf26diFtDJ5r+W71jcX2DQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 15:57:13 +0000
Message-ID: <CAFEAcA8nfp0ueLMJHhgRyf+mqG1QbakjKJiqSnLF-MFkjkDhZA@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH V10 7/9] hw/misc/pvpanic: preparing for
 adding configure interface
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vTfJ8gpDacJ/

On Fri, 30 Nov 2018 at 15:56, Peter Maydell <peter.maydell@linaro.org> wrote:
> I suspect the reason you've done this is that you're
> trying to get "-device pvpanic" to work on the command
> line. I recommend not trying to get that to work.
> MMIO devices are not pluggable devices, and -device
> is not expected to work with them.

If you do want a pluggable pvpanic device for the virt
board then you should implement it as a PCI device,
incidentally.

thanks
-- PMM
