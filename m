Received: by 10.25.21.96 with SMTP id l93csp356558lfi;
        Thu, 30 Jun 2016 06:54:53 -0700 (PDT)
X-Received: by 10.55.183.129 with SMTP id h123mr18185973qkf.105.1467294893771;
        Thu, 30 Jun 2016 06:54:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o13si2634622qkl.331.2016.06.30.06.54.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jun 2016 06:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIcQf-000576-5I
	for alex.bennee@linaro.org; Thu, 30 Jun 2016 09:54:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIcQb-000557-6W
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 09:54:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIcQZ-0006PQ-Fm
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 09:54:48 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIcQY-0006PF-VP
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 09:54:47 -0400
Received: by mail-vk0-x234.google.com with SMTP id c2so110557470vkg.1
	for <qemu-arm@nongnu.org>; Thu, 30 Jun 2016 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k5TymAO2u4aXpPf7a76WRJiTDxU7Tff/zp7FoU3+Oew=;
	b=Y/maRYryNKQKv/pgK45E4ztPQsuvM0uTUqpbk5NhVK2Vu0iAGqkc49PhnwO8/qA1f4
	lwkWRNPTOp3DqH/2Co/BuN7fhQ9jii9ukwLJoHptQJUMAmA7jwrX0nlfZ/9VAV3QbfU3
	G0tvekJCenWcZE67AGj/jcwPikOAqBQqhkESE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k5TymAO2u4aXpPf7a76WRJiTDxU7Tff/zp7FoU3+Oew=;
	b=Gs8IVqIyaOMQMa9uHobbAOCiPfDo+Lj6i9/+Dn/zx6e9uPqENVKVyllqu0ISkW1/VX
	7MhWT6vRD5rJN5H4+aXE1paq6jzVzXSOce59hxQKJA3x4PcGCncxtJejRJ+n1d8cAhNc
	r9APtMeLG+3oszY6LtzEkcTrqW1NGtkW0KMgTlPjt4O850EzoierCOHfrS/5AgrimUpS
	QXai7B6TVaQllWY1jyCh58QSy0Y9nnfh7y73xmmcSx2K3CQdFY5gLcFsVlb+rBFIybkj
	Fm1Up7amADfp+2XZS8lKXGn5fHvsl9EeY0DApMh7J1EaBjTnIpsTCgB0BEk9EUSyxqVl
	tByw==
X-Gm-Message-State: ALyK8tIG4N5WfT0hK56jxUZ9Gm/55/HJxbd8WcqR3AQ0GtpGtRgYpt4IlmXmxe88eDPg4oVtmc96hCgpSCz4GBGD
X-Received: by 10.176.6.41 with SMTP id f38mr6552550uaf.82.1467294886282; Thu,
	30 Jun 2016 06:54:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 30 Jun 2016 06:54:26 -0700 (PDT)
In-Reply-To: <1467150268-11038-1-git-send-email-andrew.smirnov@gmail.com>
References: <1467150268-11038-1-git-send-email-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jun 2016 14:54:26 +0100
Message-ID: <CAFEAcA_fb-dArdV5_hUKSRAnmH81wuP_UT6SP2M+T2rKRoyCqw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [RFC PATCH] armv7m_nvic: Use qemu_get_cpu(0) instead
 of current_cpu
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
X-TUID: iMkccYOpawPj

On 28 June 2016 at 22:44, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Starting QEMU with -S results in current_cpu containing its initial
> value of NULL. It is however possible to connect to such QEMU instance
> and query various CPU registers, one example being CPUID, and doing that
> results in QEMU segfaulting.
>
> Using qemu_get_cpu(0) seem reasonable enough given that ARMv7M
> architecture is a single core architecture.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/intc/armv7m_nvic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to target-arm.next, thanks.

-- PMM
