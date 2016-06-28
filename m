Received: by 10.25.21.96 with SMTP id l93csp1507961lfi;
        Tue, 28 Jun 2016 01:16:30 -0700 (PDT)
X-Received: by 10.55.125.194 with SMTP id y185mr2146401qkc.201.1467101790790;
        Tue, 28 Jun 2016 01:16:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s66si2863323qkf.111.2016.06.28.01.16.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 01:16:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHoC6-0004jr-8y
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 04:16:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHoC2-0004il-79
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:16:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHoC0-0000UO-7F
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:16:25 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHoBz-0000UG-Px
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 04:16:24 -0400
Received: by mail-vk0-x231.google.com with SMTP id c2so12006221vkg.1
	for <qemu-arm@nongnu.org>; Tue, 28 Jun 2016 01:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AlaFLoEJCjJ6NugQAaFKyi/5ZRI0oJyFwnyYToXzXRA=;
	b=LPoYxvoouWiTquXeRldWucrRtszlyMid3OSX3Q1Q+ory22bRkQKM1pcS/SBNi7LpRG
	6PbGHUtuqBmlcuABHIhleleDP5po1pzEhPTlU6tw6A0RTk6aXEi4meKbaK1vr937Q0Bu
	aw+vjkl4eK22hFQfq7VPy5rKIdUQQ40c4t6UU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AlaFLoEJCjJ6NugQAaFKyi/5ZRI0oJyFwnyYToXzXRA=;
	b=ZwwuvWnvedPL8ISJRgMgFNoblHObZZMbX5BFKsnMx6PqyxALoVOGfvtuhKBuRHFXGC
	FPwS0U1esXvd1w3Awo8Soz8AexzA76ump4SSBnGJU+fDD+uPC0swHQDmEwExCjG7AIkI
	kxzu95dGHZUjUT74QEaOG15wWMKveKOu6DjBsv4RVPHECgZrdw4Rqjehbr1dkm2om0Uw
	kl+rB8KuxqTU4bFDsJ37V/WYJxWuSstZYprDUG9r3566ZdZbFpxfHPjKuU4s/zMcvO8c
	+wTi7K3Z0xuiWENI9b6Qsg/Gu4DXZrxcUPRMMM5xLcvUs8oVAZZr95nHNrj6RmeBbqkI
	aQKg==
X-Gm-Message-State: ALyK8tKiJaiWsWBh7i78Hsfk006hSH1xU/XD3TWmbbHn728N507NJzKWQXGCn7+3tebFGz/9CUTapifzD70m5eaK
X-Received: by 10.176.65.106 with SMTP id j97mr724491uad.64.1467101783324;
	Tue, 28 Jun 2016 01:16:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Tue, 28 Jun 2016 01:16:03 -0700 (PDT)
In-Reply-To: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2016 09:16:03 +0100
Message-ID: <CAFEAcA8iPStWP4Pcf6Bxmn8gL5SnBDFyrPNDUpi8syc7PC_QiQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [PATCH v2 0/6] Runtime pagesize computation
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4n+YxtWrXg79

On 21 June 2016 at 18:09, Peter Maydell <peter.maydell@linaro.org> wrote:
> This set of patches is a development based on the ones from Vijaya:
> the general idea is similar but I have tried to improve the interface
> for defining the page size a bit.  I've also tweaked patches 2 and 3
> to address code review comments.

> NB: I have only very lightly tested these and haven't attempted
> to measure performance at all. There is an assert() in the
> definition of TARGET_PAGE_BITS which is good for making sure
> it isn't used before it's valid but not so good for speed.

Vijaya, are you in a position to test this patchset for
performance? Presumably you have a test case benchmark you're
looking to improve here?

thanks
-- PMM
