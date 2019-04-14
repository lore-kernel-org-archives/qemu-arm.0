Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1920709wrx;
        Sun, 14 Apr 2019 12:40:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXzf0/9+jOPGLGCk3z8WxSAVgwcF2Zm1/59ehC3ZHVPkyFL1hQcr7uwto+LSiX8ZOap1do
X-Received: by 2002:a5d:6349:: with SMTP id b9mr42121190wrw.62.1555270858222;
        Sun, 14 Apr 2019 12:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555270858; cv=none;
        d=google.com; s=arc-20160816;
        b=Kwc3Zp/tA+yFgRpC+0ClLUFoSgPfbPmZIt6jKWaZ+gqgEaK+TMHRr/kW14lRLDrkkX
         pSrNQmpw2zH2k8wME5Tz3BY6W8izupoEh26v2Zr7MhxB3Yf0fdkcF2E0SfggHdpiuWzs
         J+kqXa8LGQx74P07H3iUxJFw/PSgQLwhHDMGnqMbRa06aZzdZyBndaDBb2PHmy4bmKTD
         Pvcoskpt/OBOn++s9837BTX5Hiyo9doY1cWpOnJa2tD7cudeoFWTaMN4wmYttlSZhPId
         MZ//eDN0ZioxL1W+aNvPkvzLKa9GIf07xF/nKlZOLHMh0o1a7TGlEU1dlirai+w6ZG5y
         XuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=nGHobgXK2oi3BhhWYP+ReBEL0ebOMtubngBseljgzDk=;
        b=TvIQp2QdiaDU28CTpuyeMiiM0T9VYvaXnR9/+KkxDG42tqjuPNLzMuYFkP+KTrZet6
         g6F9DkTLEIlWmY85i3u1l4TfXDfQOWW4irxd9wiyKQFesRwsZvjGLMKA9X4xsX+qA2X3
         sE797aaDUp0oce7v61guYkDWdAKhRk8+cbNTGqlxtytriDZ466PEFn0sBhMb9uuqf8DU
         HXOMVJ+9HcOAP4qLRikNsl5fi4i2ysUeGD2jxM5aSxHWACDyqAdy59Q0rX2uTZG617oX
         wUbu+f5H6V02kC8kpElL4XUYPfB+OIxjn2ZlCYroJROetf+PKQY0SkUZNZCemAMnIL4s
         Q8Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XeBCraSs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si32334665wre.432.2019.04.14.12.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Apr 2019 12:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XeBCraSs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFkzp-0002oT-AG
	for alex.bennee@linaro.org; Sun, 14 Apr 2019 15:40:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hFkzd-0002oJ-Hn
	for qemu-arm@nongnu.org; Sun, 14 Apr 2019 15:40:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hFkzZ-0004Ev-KO
	for qemu-arm@nongnu.org; Sun, 14 Apr 2019 15:40:45 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43667)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hFkzV-0004CT-Ok
	for qemu-arm@nongnu.org; Sun, 14 Apr 2019 15:40:40 -0400
Received: by mail-pf1-x436.google.com with SMTP id c8so7497647pfd.10
	for <qemu-arm@nongnu.org>; Sun, 14 Apr 2019 12:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nGHobgXK2oi3BhhWYP+ReBEL0ebOMtubngBseljgzDk=;
	b=XeBCraSscpXKDC9V9CxmS5wLjl+saNVuGrIwZL8T6b26bPjc5aFLRxe1CXW/gDuuiz
	jXnFRS4FY6tzQSm9wWXdwzLdtGt13lUuPIuNbNwwBaJZi5unGEe83qd0r7TwKNqQr8ml
	ZccIwK4mJ5fIkMEfJJjIPQn+x/DIBJReoUDupqeBifKxMMUZPwWtfBxd/Lg1UJfcnGso
	e3zpIWsGUXI1TPFm/EPp0/dsa35mMJif9sGjPt7tXmRKnWX1WhGQY0OFQ0ET1hw1yxQ+
	CFLxC2cCEmTkVfm6Xivl3M74hzP5xRD1+WirOOlOHu7nmHCLQ45hR4HPdaW2j0j4YWvk
	zJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nGHobgXK2oi3BhhWYP+ReBEL0ebOMtubngBseljgzDk=;
	b=ks2Ox9DYPcIkWoXTpMqaBiKBDSTMSUDJFcGvylJikEJweaZI1Pz88Xc6mZOmIUxekU
	THnf5Ei49309KiAuXYp9D4fSNbzcJW25ELUFwUqYZk5okEn067LAqRJ+X61hK/+yKzYf
	XbD0/rqn9NtEzpVvTl1soRJTdytWhk+RQ5KTqwR+agqsrmITHF5dgTxG81NZpV9heK+2
	fGn5d4PFe1KL2Zl5fqsWsW8AfjRvck4mi/YtKXn6b+bkEKK1uVISThBWXMCFdJxGoE6f
	gVRc3uao290iCdoK5KVnUJpxHD6sbo1CGOXamyqUbaoSyBO91Mw0cHfs4S2FYIZFCTcO
	YjWg==
X-Gm-Message-State: APjAAAUXvu69sjcUBb3G7V87nQ9Z6NCCIYjrfvUtNLUL/6RpfIoTT7+g
	Z0s9VqTQ8xD2ugGz0jCm46T1cA==
X-Received: by 2002:aa7:83d1:: with SMTP id j17mr71864621pfn.78.1555270835027; 
	Sun, 14 Apr 2019 12:40:35 -0700 (PDT)
Received: from [100.68.67.33] (rrcs-76-81-86-38.west.biz.rr.com. [76.81.86.38])
	by smtp.gmail.com with ESMTPSA id
	i135sm63493969pgd.41.2019.04.14.12.40.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Apr 2019 12:40:34 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190411153942.4533-1-peter.maydell@linaro.org>
	<53930e87-3bb1-fdd5-a8fe-8603c0adecc2@linaro.org>
	<CAFEAcA-dbGvhgTrBKEtx-CPS7f2NJO5X+dj=mdcm+NrkF=uynQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0ee4fdc6-c782-d5f5-ec40-9e25c1c9dd1f@linaro.org>
Date: Sun, 14 Apr 2019 09:40:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-dbGvhgTrBKEtx-CPS7f2NJO5X+dj=mdcm+NrkF=uynQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::436
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Implement NSACR
 gating of floating point
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: esLFVwviCDvR

On 4/14/19 8:02 AM, Peter Maydell wrote:
> There's similar wording for the effect of NSACR on CPACR, so
> again I think we need to actually make the bits RAZ/WI
> regardless of their underlying value, not just force them
> to 0.

I don't see that language for CPACR, just "the corresponding bits in the CPACR
ignore writes and read as 0b00".  I'm willing to believe the manual is sloppy
on this point though, and the "correct" language appears only once, somewhere.

You might want to something akin to arm_hcr_el2_eff so that you don't have to
replicate the NSACR logic in too many places...


r~
