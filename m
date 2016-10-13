Received: by 10.80.166.35 with SMTP id d32csp474624edc;
        Thu, 13 Oct 2016 09:21:01 -0700 (PDT)
X-Received: by 10.55.8.138 with SMTP id 132mr8399333qki.109.1476375661682;
        Thu, 13 Oct 2016 09:21:01 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a80si6925652qkg.200.2016.10.13.09.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 09:21:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buike-0001jx-IH
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 12:21:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buijh-0001Ih-0m
	for qemu-devel@nongnu.org; Thu, 13 Oct 2016 12:20:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buije-0005PY-Qo
	for qemu-devel@nongnu.org; Thu, 13 Oct 2016 12:19:59 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buije-0005Ou-JI
	for qemu-devel@nongnu.org; Thu, 13 Oct 2016 12:19:58 -0400
Received: by mail-vk0-x232.google.com with SMTP id 83so61179106vkd.0
	for <qemu-devel@nongnu.org>; Thu, 13 Oct 2016 09:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OwiVHWPST1WZ6jKpmgh/y9WhUtrTcUatY2JYVIjyRVs=;
	b=iq/rAUjvL5Vuk5UIFpaXfDX7nFfMra1vcoBZKfnIjHqJ0QyZWMyHhimQtSf5sRFrse
	j9KzdHNnudPbdQzFIdJMJLfPLq/0GHvBhALX/Cgtp2OXYACBCgANMQ7PjvLz14medpyb
	MFmdFfz1cNlJz1kRJ+62Ylh5EnYjn8ZwWU7Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OwiVHWPST1WZ6jKpmgh/y9WhUtrTcUatY2JYVIjyRVs=;
	b=i7/1pVbKALdrC02iAiuPlIv8ZVWFcl+SmF0qCet029b2jUjXdI/KZjnjeajob/bqHx
	tgpNcE669EWyVerGIKh8jFcatZLFZ4aay5cAG96q9dlFKGQrgwTDxEZsKB3YyNeiBZkd
	SkZm6q+JwKMxn6MAym9B2fJtgxJaXvmxHd8Eg4UasgFI0CqzEfiRWDh7GBUenR9NuIaI
	TsMGk/AkbGuIFq/htJQjdQBJZPx6/6/7WAqFQqtecTU/r/Q1aIPCr+YLG8CbUBhQqH7E
	sH44wyV6gt8ta/gycWFEEla6AJNjtA1q8Wz2U57+Za4LcrryF1zhpyI7nfQty898kV8Q
	2FvA==
X-Gm-Message-State: AA6/9Rm7rmDJEpQP9Rge0JUg3Bw0PE5sy5u2bT1TkYPhT/+qxrmZZpoCssoftTfwoF7oC17WKX9viJ1vJUmIL0Q5
X-Received: by 10.31.210.130 with SMTP id j124mr5551518vkg.17.1476375597725;
	Thu, 13 Oct 2016 09:19:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 13 Oct 2016 09:19:37 -0700 (PDT)
In-Reply-To: <1475617134-28180-1-git-send-email-wei@redhat.com>
References: <1475617134-28180-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Oct 2016 17:19:37 +0100
Message-ID: <CAFEAcA_vTEjMK1Eex8Z41L2reWHK8oZ_XyekKv1r7eby+J+y7A@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-devel] [PATCH V6 0/2] Add option to configure guest vPMU
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lD7/J8+4ljS/

On 4 October 2016 at 22:38, Wei Huang <wei@redhat.com> wrote:
> This patchset adds a pmu=[on/off] option to enable/disable vPMU support
> for guest VM. There are several reasons to justify this option. First,
> vPMU can be problematic for cross-migration between different SoC as perf
> counters are architecture-dependent. It is more flexible to have an option
> to turn it on/off. Secondly this option matches the "pmu" option as
> supported in libvirt. To make sure backward compatible, a PMU-related
> property is added to mach-virt machine types.
>
> The following are testing results with this patchset. Other combinations
> should have similar results:
>   CONFIG (qemu-system-aarch64)                       vPMU   WARNING
>   -M virt-2.8/virt,accel=kvm -cpu host               NO     NO

What's the rationale for defaulting to no-pmu? Other cpu features
we have tend to default to present unless you ask not to have them.

>   -M virt-2.8/virt,accel=kvm -cpu host,pmu=off       NO     NO
>   -M virt-2.8/virt,accel=kvm -cpu host,pmu=on        YES    NO
>   -M virt-2.7,accel=kvm -cpu host                    YES    NO
>   -M virt-2.7,accel=kvm -cpu host,pmu=off            NO     NO
>   -M virt-2.7,accel=kvm -cpu host,pmu=on             YES    NO

in virt-2.7 you always got a pmu regardless, so why does pmu=off here give
you no pmu?

>   -M virt-2.6,accel=kvm -cpu host                    NO     NO
>   -M virt-2.6,accel=kvm -cpu host,pmu=off            NO     NO
>   -M virt-2.6,accel=kvm -cpu host,pmu=on             YES    NO
>
>   -M virt-2.8/virt,accel=tcg -cpu cortex-a57         NO     NO
>   -M virt-2.8/virt,accel=tcg -cpu cortex-a57,pmu=off NO     NO
>   -M virt-2.8/virt,accel=tcg -cpu cortex-a57,pmu=on  NO     "No KVM"
>   -M virt-2.7,accel=tcg -cpu cortex-a57              NO     NO
>   -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=off      NO     NO
>   -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=on       NO     "No KVM"
>   -M virt-2.6,accel=tcg -cpu cortex-a57              NO     NO
>   -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=off      NO     NO
>   -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=on       NO     "No KVM"

This patchset doesn't actually change whether the pmu is present
or not under TCG so this is all a little bit odd.

>   -M virt-2.8/virt,accel=tcg -cpu cortex-a15         NO     NO
>   -M virt-2.8/virt,accel=tcg -cpu cortex-a15,pmu=off NO     "No PMU property"
>   -M virt-2.8/virt,accel=tcg -cpu cortex-a15,pmu=on  NO     "No PMU property"
>   -M virt-2.7,accel=tcg -cpu cortex-a15              NO     NO
>   -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=off      NO     "No PMU property"
>   -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=on       NO     "No PMU property"
>   -M virt-2.6,accel=tcg -cpu cortex-a15              NO     NO
>   -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=off      NO     "No PMU property"
>   -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=on       NO     "No PMU property"
>
>   * "NO KVM" msg
>     warning: pmu can't be enabled without KVM acceleration
>   * "No PMU property" msg
>     can't apply global cortex-a15-arm-cpu.pmu=off: Property '.pmu' not found

I'm really not a fan of the tristate has_pmu, so I'm hoping
there's a setup which lets us avoid it...

thanks
-- PMM
