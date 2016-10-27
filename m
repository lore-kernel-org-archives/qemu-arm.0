Received: by 10.80.166.35 with SMTP id d32csp645767edc;
        Thu, 27 Oct 2016 07:29:37 -0700 (PDT)
X-Received: by 10.37.172.136 with SMTP id x8mr7506034ybi.119.1477578577064;
        Thu, 27 Oct 2016 07:29:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c184si2824585ywe.157.2016.10.27.07.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 07:29:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzlgW-0006d5-8o
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 10:29:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzlg1-0006I8-SI
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 10:29:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzlfx-0008JZ-8d
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 10:29:05 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35420)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bzlfx-0008JO-4S
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 10:29:01 -0400
Received: by mail-vk0-x235.google.com with SMTP id q126so29876751vkd.2
	for <qemu-arm@nongnu.org>; Thu, 27 Oct 2016 07:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=7+mp3QulUJMVEzn25jQczDSQw2v6LuuR0ItlRTz3WkY=;
	b=Ya82M215OF/LC06mxxYdnFh1w2Hyt0JlOOAFg1kO3+5BehKhZaN+x1ZPBFuMDCjdxA
	YOAQsiSQezTh2o2iL9MkzLqu4rhl844wBI69ZOl+IxwrYjyvbSjGU8JEuAYCD0t4JCuR
	FZplL/v+GsQPSLfQRPCbcm6or3P+gI4ILFUbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=7+mp3QulUJMVEzn25jQczDSQw2v6LuuR0ItlRTz3WkY=;
	b=Et9PfhFBsFKlNdvjMCZC+NWJu1jO3ZGhZ/KKVPoi9f6jSA4K4VQNEPPj+HgS8WZPeH
	Nce0UIblFNtXy8UlADlMODM3bWNBVJIuBjrGn6vheTw72QBosMhrJgQaTGA0afP+Jzra
	0Fx0hGKwIt9bn3TKunerulajN3E0+gp7w6otZ7kN+5A9aGpREIfWxrfa30i2AsDw7gQb
	bt6WrwoUY0/49LqhrN+Tpx0JsWdHKVCkDmeLgvYbSxjcCYJj6SI0iH/3VnDZ4o7aP1Wd
	soNKjlmksiql5BR9nYQxDnvdkA4pGuxbPL+akd0XlxRrDLzekgaIgQg41+RBBtscmogP
	T7BA==
X-Gm-Message-State: ABUngvdbB+iwGHxr6/AF+HyYpSKzd1YbT9Q0fXglOkuLpdJNEaf2oj8+QYf1VDHJ+aROU5U+3kavbZdacSDBjp2p
X-Received: by 10.31.165.74 with SMTP id o71mr6347725vke.95.1477578540427;
	Thu, 27 Oct 2016 07:29:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 27 Oct 2016 07:28:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Oct 2016 15:28:39 +0100
Message-ID: <CAFEAcA_5+bm4xN_m3G+vY9StEvk2s-eqbtdXjcudn+2oFqaS7Q@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] [PATCH V8 0/2] Add option to configure guest vPMU
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
X-TUID: HNRIsWu5aDQR

On 26 October 2016 at 07:28, Wei Huang <wei@redhat.com> wrote:
> This patchset adds a pmu=[on/off] option to enable/disable vPMU support
> for guest VM. There are several reasons to justify this option. First,
> vPMU can be problematic for cross-migration between different SoC as perf
> counters are architecture-dependent. It is more flexible to have an option
> to turn it on/off. Secondly this option matches the "pmu" option as
> supported in libvirt. To make sure backward compatible, a PMU-related
> property is added to mach-virt machine types.

(Sorry, sent this as a reply to the v7 patch; resending to
attach it to the right thread...)

So what actually are we defining as "the PMU exists" here?
The PMU exists in ARMv7 and we do actually implement it
in TCG for v7 and v8 cores (though it is a minimal
architecturally-valid implementation which implements no events,
only the cycle counter).

Should the PMU registers in TCG which we currently provide on
any v7-and-better CPU be hung off ARM_FEATURE_PMU instead ?
(this would result in the behaviour of virt-2.6 for TCG
changing in that we stop providing the PMU when we did
before, but I guess that's OK.)

thanks
-- PMM
