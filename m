Received: by 10.223.197.9 with SMTP id q9csp10451670wrf;
        Mon, 23 Oct 2017 04:19:24 -0700 (PDT)
X-Received: by 10.55.118.7 with SMTP id r7mr18637970qkc.241.1508757564425;
        Mon, 23 Oct 2017 04:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508757564; cv=none;
        d=google.com; s=arc-20160816;
        b=KU8zH9O1CPadLYDvOg3g6UbTw8e+Fj35q1Mvak+r3OV/lL77LMGgQQbixVW/2M3Qfb
         uDd+e4NrvnMGUY4X2YcP+J9/u6evCKReZPHbhkYfiu0F7E39BpqD2/OEhKqyfJcR09fO
         8sG5lQJ97E5MeLa5ExZgJQ03A7ZyBHdT8LcV0MxLRVUxu89+mD6zQp28OarxNZymU3C6
         1l+Tr5vQm0wD8Ax813Qkf1dhS223bmnOvoyLq2L0ZlkvITG4eSifInpeqLTlX3cbcgW6
         xxk+XSK0vEmQrZqsoa5JGIIxvu0ueG61CJjUV83sWIm95HglNR7vrabpGlThPtJLSQTq
         9BEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZBdJiIAI8GtARdk8GtFI74K8nSPsa7YVe9Rhs32k7rA=;
        b=m8OLYQnFiBtx6iYrit4tcmrlkJe+z+B4RS6XqCTyM/Ne/k/u9VP2r/6dICySUWVBeV
         s2xSR9c/vo/KOa7Nff2cLHUzmsGKIOhanSt4tbpE8jZ3Zf/4Je0ZyFaiLORkMOsJ1YU4
         KZH64EAsRaDxC74yTkEY/NG0/rvn3D2D6Z0A7Y8Zhvh6GhgPEA3xu9CezRjU5iTa8eG7
         tu1XC/qomQQJQh8ODOLzVcj2kMoq/CnqOUGqwOrZdYndf0EfVs1l5ivwdO+pI0Qasx2a
         qsvZXojyeVU+5Na7sWeSHH8YMhptgzLK3qbPodlMo8m63EuKwk9GTVlL8KaY3PxzPXTx
         aR1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=lt9QSDpH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u63si1870102qkf.3.2017.10.23.04.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 04:19:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=lt9QSDpH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38068 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6alO-00015u-1p
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 07:19:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e6aju-0000UV-Kc
	for qemu-devel@nongnu.org; Mon, 23 Oct 2017 07:17:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e6ajt-0004Lq-HU
	for qemu-devel@nongnu.org; Mon, 23 Oct 2017 07:17:50 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:54954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e6ajt-0004Le-DZ; Mon, 23 Oct 2017 07:17:49 -0400
Received: by mail-vk0-x22d.google.com with SMTP id n70so10870553vkf.11;
	Mon, 23 Oct 2017 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kcOCQTpEL8g4aoVnZoUh41+05bqW6HD7e3LBiI5/7js=;
	b=lt9QSDpHqhN+qZSuO676RTsAKNisMmwgssE2j+A0Pf5RwXQN+zO5ErbzdwB0atFutZ
	wB5go/SsC+nRRMkGSPd1sakYPB/QZXsyVdrg9Z/MLECSDK7ftYTJbYre0MryQ0/Z4l3f
	SImE5mZqI4SCrJjxmWxteHyZCdoh8GxNzDT0fvKvF/O+aqgSZg/3nyB0PIfBxcKj1hQp
	qFL0dLUDeGBRwvBOfsdSlisg6XDJIFSq9/S4SAXODKKYbV3ciVj87wm84CP2NLj/QkQZ
	B1OBsnREcA9yYE4epl8EisXWKpHmuFQ6YNMTmveze04uo2Bp2WrddMXbGLL34K6mECEs
	4huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kcOCQTpEL8g4aoVnZoUh41+05bqW6HD7e3LBiI5/7js=;
	b=TQbKDvEibdu1X4icvEAFEoyuOcudOlLSCkSrBsUHGPvOiRSrhq4bv/CD0e+PiFhzhd
	axLlm/UllO/DU8i9ZA1HnJ9iZ9+mDpl2iKRycj0HEfHD982bQhG9zElWfMhNNFBWMvmF
	8IQfKTE+Hl0dPXZKV/3fosPvWqhERyDpEXuY6Mm8o2S4jZETdMOwxI1Id35Y9lWr9MYu
	Fop8SH4XApzDI0hOhmhJyG5fWthj4IqPRYlo5uIp4IIzXcW1747+TqVv5RN9AQX6Lod/
	Y26a4+ZLrnZQSzrnDTXON+Mr8fUFkJ0BIhxHzNE3+wvYyhqOoyP7a/8VJQ302+AKWRvw
	58WA==
X-Gm-Message-State: AMCzsaXPK01xvgmAu+ibQcSVIjX5GOlDhAGUknHBgVdSyGYtoLn4nstc
	5jtjt4IYCTdBadW+0Ar1kcXQ5EuVxBbg+abmRBQ=
X-Google-Smtp-Source: ABhQp+ShKCGvviJK1on/Vn4GALCoHiCca60aRQ8S7m9K1qkabaKfO37+DY7Mwu4A6uyNubyFp4zxp7Y49TlqYzWXdcA=
X-Received: by 10.31.185.198 with SMTP id j189mr9163131vkf.172.1508757468917; 
	Mon, 23 Oct 2017 04:17:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.63.6 with HTTP; Mon, 23 Oct 2017 04:17:48 -0700 (PDT)
In-Reply-To: <20171023051819.GD17374@lemon>
References: <1508678882-4327-1-git-send-email-sundeep.lkml@gmail.com>
	<150868113318.482.11705826106714639873@b58463cdfd5f>
	<CALHRZuqhSJC9t3Xrc6-yd3EKcaNUp3NyR+i3FW=i4C7Y16acxA@mail.gmail.com>
	<20171023051819.GD17374@lemon>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 23 Oct 2017 16:47:48 +0530
Message-ID: <CALHRZuqRKq6iooYTUQfi4ju6bFaszTWZmJs7rt0sjjT5MbjtCQ@mail.gmail.com>
To: Fam Zheng <famz@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::22d
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu devel v3 PATCH] msf2: Remove dead code
 reported by Coverity
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair23@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Darren Kenny <darren.kenny@oracle.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UbMt0JoWPV90

Hi Fam,

On Mon, Oct 23, 2017 at 10:48 AM, Fam Zheng <famz@redhat.com> wrote:

> On Mon, 10/23 08:59, sundeep subbaraya wrote:
> > > Cloning into '/var/tmp/patchew-tester-tmp-egubaaoc/src/dtc'...
> > > fatal: Could not read from remote repository.
> > >
> > > Please make sure you have the correct access rights
> > > and the repository exists.
> > > fatal: clone of 'git://git.qemu-project.org/dtc.git' into submodule
> path
> > > '/var/tmp/patchew-tester-tmp-egubaaoc/src/dtc' failed
> > > Failed to clone 'dtc' a second time, aborting
> > > === OUTPUT END ===
> > >
> > > Test command exited with code: 1
> > >
> >
> > I did not understand. Is the error related to my patch?
>
> Nope, there is something wrong with the testing bot.
>

Ok.

Thanks,
Sundeep

>
> Fam
>
