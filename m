Received: by 10.80.166.35 with SMTP id d32csp342326edc;
        Tue, 11 Oct 2016 02:22:03 -0700 (PDT)
X-Received: by 10.55.23.105 with SMTP id i102mr2075439qkh.301.1476177723072;
        Tue, 11 Oct 2016 02:22:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j37si1047584qte.49.2016.10.11.02.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 02:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bttG6-0007AK-IB
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 05:22:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bttF3-0006UV-18
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 05:21:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bttE6-00042N-Ry
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 05:20:56 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bttE6-00041i-KB
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 05:19:58 -0400
Received: by mail-vk0-x22e.google.com with SMTP id z126so13185965vkd.0
	for <qemu-arm@nongnu.org>; Tue, 11 Oct 2016 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rpL5o9ZLCEMqIKoWmpF7hQvWNnp49OoTR3UyLOi4S2c=;
	b=G2t3229Edjhe3vP+bO8/oWVx6Ms+0j1K2dJ/Z0RlIhkVtlHozxjxUi4744srWXKIQ1
	uqAk8hN0/LSGozfezpeBJOgUVOv24plKrF93C85r937F4ECN1UjWuZL8lx93ctrp/57X
	SSnusYTceYmERTK6qCcDHNN5LomK+bci3e2NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rpL5o9ZLCEMqIKoWmpF7hQvWNnp49OoTR3UyLOi4S2c=;
	b=eljgyYjhiS75n5G99jHc8zKTPWHZfp+qLCn7UXp7h3QTCpOYHgneCsmFdofBJBe0yJ
	xXjsQauAPdZy+DzKe2wuJ/+E0bbHFS+wMUtS8VEMb/HI34YJXvaR+12tCFyqdSeSkN4l
	8xmkQqn9SaI7DIKf1gi65biMXdGTvklRQZ6irv48YbFSom03Bxyc9KX68CL5Rqj3BVAV
	BytFnq0Ctu/5nMNAToKDCNwZ3On2KT/yrG4R4MoNvBlM/OMs4/vaBNPIH5XxGdqZU8Rx
	F6kF5RSHwYPg6x6+D47zQwoajtgFihrT0LjZfNKPIkEaflBAn/wfi9+9RjKLtTG43wiy
	YzXg==
X-Gm-Message-State: AA6/9Rmny4D0IbXdB/CItYAVx0SQoZHxjCiQxgcoH6Gauz4QORNH4TN2rleNg8TszznJLN0fG9juxsovjKLfzQ9t
X-Received: by 10.31.16.73 with SMTP id g70mr2274927vki.175.1476177597993;
	Tue, 11 Oct 2016 02:19:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 11 Oct 2016 02:19:37 -0700 (PDT)
In-Reply-To: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
References: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Oct 2016 10:19:37 +0100
Message-ID: <CAFEAcA-z9E7yF_DKfH3-pM2DRVtFYXGbFQhY-gN4nRjAGVAvoQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/3] preliminaries for GICv3
 virt support
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
Cc: Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bj4YGbbWsrIa

On 6 October 2016 at 14:21, Peter Maydell <peter.maydell@linaro.org> wrote:
> This set of three straightforward patches is a preliminary
> for adding virtualization support to the GICv3 emulation:
>  * add a (nop implementation of) MDCCINT_EL1, since KVM
>    will read/write it on worldswitch
>  * fix some bugs in the GICv3 trace events
>  * add trace events for the generic timers
>    (which I have been using for debugging)
>
> I actually have almost all of the GICv3 virt code written,
> but it currently has bugs which mean that a guest kernel
> under KVM won't boot. Debugging in progress...
>
> thanks
> -- PMM
>
> Peter Maydell (3):
>   target-arm: Implement dummy MDCCINT_EL1
>   target-arm: Add trace events for the generic timers
>   hw/intc/arm_gicv3: Fix ICC register tracepoints
>
>  Makefile.objs             |  1 +
>  hw/intc/arm_gicv3_cpuif.c | 23 +++++++++++++++--------
>  hw/intc/trace-events      | 14 +++++++-------
>  target-arm/helper.c       | 28 ++++++++++++++++++++++++----
>  4 files changed, 47 insertions(+), 19 deletions(-)

Patchew points out that I forgot to git-add target-arm/trace-events.
Will resend shortly.

thanks
-- PMM
