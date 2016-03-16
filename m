Received: by 10.25.208.211 with SMTP id h202csp1128388lfg;
        Wed, 16 Mar 2016 04:50:40 -0700 (PDT)
X-Received: by 10.55.201.219 with SMTP id m88mr4370870qkl.41.1458129040736;
        Wed, 16 Mar 2016 04:50:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k41si2952334qgk.72.2016.03.16.04.50.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 04:50:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag9yK-0000ys-AJ
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 07:50:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9yG-0000vV-RH
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:50:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9yB-0007nZ-AD
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:50:36 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9yB-0007nT-68
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:50:31 -0400
Received: by mail-vk0-x229.google.com with SMTP id e185so58050116vkb.1
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vDf0E34rYt7Vtd+oDc67DVv46+5u4qZ7bvexUO8JZGk=;
	b=kXsiDtUFYlboyq4+k8qgp8QE2Yum4glA5LO5Q+Sczd6ORKfSXPyabeSqu9gTD87zda
	9Aa1giEOhvC5IIpNvzPddg3kEE4gEdVBnUYwU+HgfdL6wpWwfCGh7o0H16AHIbLW6v7m
	zyQgjsNAWr/kp1m30f0Qv6+ScKGrMHGD04b9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vDf0E34rYt7Vtd+oDc67DVv46+5u4qZ7bvexUO8JZGk=;
	b=Fmyjx+BwTloetNNOR6sYu0lFbAuFMBIBhFHLp5HUC4Mki+S53/ZNkwoCADRyxAZtdi
	8GyaJ6ZDfgdZMtHyLclfH6MZ5EqwFve7ilEMqT9V/urVmBqnh/b8zu9WCljTvVJsyHKK
	Xj8hZZputbvyrJkuL8oiTsjLX0rqYs7TLycpM6mNzEvNKqoiiKef2YJxSQdjmVVDDX8W
	joHCRetOc1nP+RGXQUINm0oro9nSJWEu2hf/hwv/NZSYmCqAak/yTQvmjYFTWOVFRARX
	uuU4ilnkki6vymHay019MRTwl7i7SNvwuH7IJ3WiJIShDFvGo+DG+RPA9GayTJAo1+sP
	8fNg==
X-Gm-Message-State: AD7BkJLh43uR9gH8zjLz/oaus6mCkfoKwEmVPXyQ9+Ae6HXHqz/URM40fhg6mQAi2LYFy6VCw/j8gUeh1mH+Ewxm
X-Received: by 10.31.141.2 with SMTP id p2mr3775146vkd.37.1458129030825; Wed,
	16 Mar 2016 04:50:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 04:50:11 -0700 (PDT)
In-Reply-To: <1457334350-5675-9-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<1457334350-5675-9-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 11:50:11 +0000
Message-ID: <CAFEAcA9SnVX_i8qRK0Dzdgfvb2UKB6WezOwK-cy5defjS6NQXw@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 8/9] hw/arm: QOM'ify strongarm.c
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rcp7+JJtJE4N

On 7 March 2016 at 07:05, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> Drop the use of old SysBus init function and use instance_init
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Again, followup cleanups are possible to move these devices
out of the board file and into their own source files in the
appropriate subdirectories of hw/, and to add reset methods
to the devices which are missing them.

thanks
-- PMM
