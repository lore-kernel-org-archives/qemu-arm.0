Received: by 10.25.0.6 with SMTP id 6csp259021lfa;
        Fri, 2 Jun 2017 08:01:46 -0700 (PDT)
X-Received: by 10.176.86.81 with SMTP id z17mr1101507uaa.57.1496415705999;
        Fri, 02 Jun 2017 08:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496415705; cv=none;
        d=google.com; s=arc-20160816;
        b=qIm6iCfyF8r0LcXhKDOXy/bykuWPS8YNwgm/JVGG3Aj9jDs/GAxfkVtl894gpfp6QU
         WZbrI9FWYrbkOKAVc3dezDLkIZV1XvWBSgaXsKF7VtnCoj01YQKP7hLO/QiBHUL0Cj1E
         Ujtvy9n3gpWGOaErnMT5PfoyqLEbL4ABJ+bY0987oa32A1MILQsAVEnXBJb/dlGVvh3P
         FgVUA0INotxC3YwecvxLexfYku+qeIGqQ9VaFaR0gbcUR3iNdbaepOfxq8zl7KOnSk3b
         5nun404V1WDjHi335eIxLs1Z/DPZ7IPKlNNzPcXSK0zhM96gfVlxVeykaXmqPnWgRg/6
         yp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XR/kFOOjAcSXQYooeLiNDlH1lTwPrbSrdoPiQqqmyMc=;
        b=fDTcgCPQTQeCdd73tsUOsL3XvcWg9inX1nKTg6rozCDzrdVfPIR2wkbomkIaZOVqCH
         FosImo2SKipAqjgjKbchQzNNLct7WRqrqE6m13LMWFUueynsgHaOC/Nn78PUulrjQ7qQ
         xYfcFmLtFr1d4sJRhBIS62Zmx09mOx1R/Uv2G8oVi3yRLBO3hMo2GS34Nk4lLbjzvsBt
         Su2nw1ncQb34tEre4ey89bWvF8+oBYHwxjC2byxEH1k5HJOLoRnNeWeH7LC+Nu6tldXo
         S/B3LZq5+5uHBfuTvcso8XD0TPew7iEzAd+aWCw5w7nxZrhgkaZvNuxGjDHmYO/3/bz6
         v6eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g23si1193336uab.253.2017.06.02.08.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 08:01:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGo59-000104-IO
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 11:01:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGo4L-0000gT-PR
	for qemu-devel@nongnu.org; Fri, 02 Jun 2017 11:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGo4L-0002Oj-3W
	for qemu-devel@nongnu.org; Fri, 02 Jun 2017 11:00:53 -0400
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:36513)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dGo4K-0002OX-QT
	for qemu-devel@nongnu.org; Fri, 02 Jun 2017 11:00:53 -0400
Received: by mail-wr0-x22f.google.com with SMTP id v111so1808903wrc.3
	for <qemu-devel@nongnu.org>; Fri, 02 Jun 2017 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XR/kFOOjAcSXQYooeLiNDlH1lTwPrbSrdoPiQqqmyMc=;
	b=F5RaeUHQUGNqbTvl5Pawc11rckVGwQiVSjUJELiUwlkMS5qCXDIlEVKXvLmFs/2qwN
	RmfXCpmgvKtdmeHRYxvTwxNam6RYE42ehpCjaoPJzFBlwZ8mPBl+ZGEpFIQ2miIQZtPE
	ryATqAgb0NDvNReRZAdKaK5KSeRhwWTMJpQZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XR/kFOOjAcSXQYooeLiNDlH1lTwPrbSrdoPiQqqmyMc=;
	b=OvUGrn0a6fIFDinUeL03npf0O18mIYvSFZRIqUyHgTZrU8KHW9CqOyfNSu+py+Ib6I
	6OLN//w8m/Va44EMN7oti/w8Tl5v+fGlYco9AokKfGa1M6Gbjpub751eThUX3rcD4dO9
	gyOEihGhiuXnrWWD7kBUVkjXX/FpelPpyoAk2trKfbP8sUwJDzElZeC7OEIie7xYdH45
	kwJiLNPfbYZFryQpSmQE9u3AMXgmJu/Acatz24f7QxTfpibA+ACqLGtO4baFMB5ujGAP
	I++9BBVk0x1iXdqjF4PJZ4V4Q9ZsxJ5TCaDzmHD7mYg3BFqPWWacp4B/CaiX+vuK8U5o
	s3yA==
X-Gm-Message-State: AODbwcDkuH9i/scwCu5bbkbu1/H9XyrAQDelv/W4Sk18HDRM4RyQ35TN
	UCw6OXUZPjjFuftSyMHI5xN2IpG0AYoi
X-Received: by 10.223.150.139 with SMTP id u11mr5297841wrb.195.1496415651247; 
	Fri, 02 Jun 2017 08:00:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.178.66 with HTTP; Fri, 2 Jun 2017 08:00:30 -0700 (PDT)
In-Reply-To: <8b782ee5-3545-3cb5-3b09-209fcffee7e4@redhat.com>
References: <1493314727-6951-1-git-send-email-wei@redhat.com>
	<CAFEAcA-KKvhspYza=8TNNuFtqzco=ChhtS6Aa5hnn8=Cb036-Q@mail.gmail.com>
	<4dbaaea9-7576-9acf-5327-b22db6f00ed2@redhat.com>
	<CAFEAcA8K9DENSPqJD2Okqjqyi7T8RhSBmhCa3ztooJK5xdcZVg@mail.gmail.com>
	<8b782ee5-3545-3cb5-3b09-209fcffee7e4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Jun 2017 16:00:30 +0100
Message-ID: <CAFEAcA8GY3yqZCVHihcFaFS-EkmEy+FRJ9+Kq_xRRdzD7+6DnQ@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-devel] [PATCH 0/2] Fix compilation dependency issues of
 CONFIG_ARM_V7M
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mk0AyG6nJJK4

On 28 April 2017 at 14:58, Wei Huang <wei@redhat.com> wrote:
> Using #ifdef is indeed a cleaner solution. However I can't use "#ifdef
> CONFIG_ARM_V7M" & co inside target/arm/cpu.c file because CONFIG_xxx
> aren't available as preprocessor directives. From what I saw the
> CONFIG_xxx options can only control compiling source file. One solution
> is to extract out all v7M code into separate files and use
> CONFIG_ARM_V7M to direct compilation. A bit messy though. Any other
> suggestions?

We seem to run into "CONFIG_FOO is defined for make but not
for the C preprocessor" from time to time, so maybe we should
fix that?

thanks
-- PMM
