Received: by 10.80.166.35 with SMTP id d32csp643753edc;
        Thu, 27 Oct 2016 07:25:30 -0700 (PDT)
X-Received: by 10.13.222.68 with SMTP id h65mr7095012ywe.6.1477578330649;
        Thu, 27 Oct 2016 07:25:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p189si1981112ywf.143.2016.10.27.07.25.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 07:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzlcX-0003j5-VR
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 10:25:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzlcN-0003ht-Ja
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 10:25:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzlcJ-0006pO-05
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 10:25:19 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:36480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bzlcI-0006om-Jc
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 10:25:14 -0400
Received: by mail-vk0-x22e.google.com with SMTP id y123so29890597vka.3
	for <qemu-arm@nongnu.org>; Thu, 27 Oct 2016 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b3LGo5fcuFMmlI6/2IxF7KgtssXItPjVOYMzenj4Ha8=;
	b=Rocg4S9VUDisqO1bdTYK7fGq/3OrQEfmnA+eXTwwX5wnnNnx1+Yuq7yuvLePufMrlz
	f/0D62SBDhN4AZcklFdnqRC9VE4DsyMwDUqzRee30cxfDqHYx+O9RU4grBQh0BpWnMrR
	4Je8DHEAU5oN5u60b229kuuUuw9jlibvyPtLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b3LGo5fcuFMmlI6/2IxF7KgtssXItPjVOYMzenj4Ha8=;
	b=T2F5qcqlujjgphzYXvjSVvpfaVHrwtjhgEQj6vwFb8NIMjiMAccy1JzB8S+rFGfpnQ
	FNcP8vaqDXPf80RiofbHKVez7VspLXiMZhq2y6X5s7eOpd08Jw+bEgkQk6S198dUIF0K
	outTW0iyIu1eYur2cmCaBFdhTcoEXGxNegydHJDmJrbVC2XCbukYf6Xy21a496SHM3Np
	aZBhiuZy3ruNnVmPeXyay6fnPONZf2vl9cvYIIfwDnhuQK0I8eLazUjK0DrXEfnkKXYU
	JgEJW4oRqLvJmp00Q+b6sbWRj+WXyw50SLDTlE+LdIRKp3pZfKadeA7vujT3fz7+BoS/
	ODTQ==
X-Gm-Message-State: ABUngvdgao1zwQo/xaTyJNoVO2i7u3YWsjLesf1DxTpEEynjThGNsfs1jsOUx1SX/mxJXYCTAyyUOBGfzt7icrvl
X-Received: by 10.31.65.195 with SMTP id o186mr5790274vka.3.1477578312762;
	Thu, 27 Oct 2016 07:25:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 27 Oct 2016 07:24:52 -0700 (PDT)
In-Reply-To: <1477086782-10479-2-git-send-email-wei@redhat.com>
References: <1477086782-10479-1-git-send-email-wei@redhat.com>
	<1477086782-10479-2-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Oct 2016 15:24:52 +0100
Message-ID: <CAFEAcA9DMNWnjCTWhP6_qKo1FSAaRtdfO6rqYtQWzSLQyKrvJg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [PATCH V7 1/2] arm: Add an option to turn on/off
 vPMU support
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: juCp8/sTlyoJ

On 21 October 2016 at 22:53, Wei Huang <wei@redhat.com> wrote:
> This patch adds a pmu=[on/off] option to enable/disable vPMU support
> in guest vCPU. This option is only available for cortex-a57/cortex-53/
> host under both KVM mode, but unavailable on ARMv7 and other
> processors. It allows virt tools, such as libvirt, to determine the
> exsitence of vPMU and configure it.

So what actually are we defining as "the PMU exists" here?
The PMU exists in ARMv7 and we actually implement at least some
of it in TCG including for v8 cores (though it is a minimal
architecturally-valid implementation which implements no events,
only the cycle counter).

Should the PMU registers in TCG which we currently provide on
any v7-and-better CPU be hung off ARM_FEATURE_PMU instead ?

thanks
-- PMM
