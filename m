Received: by 10.80.166.35 with SMTP id d32csp1128608edc;
        Fri, 28 Oct 2016 05:02:15 -0700 (PDT)
X-Received: by 10.55.209.147 with SMTP id o19mr11976557qkl.125.1477656134959;
        Fri, 28 Oct 2016 05:02:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y84si8111201qka.218.2016.10.28.05.02.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Oct 2016 05:02:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c05rR-0002PZ-R9
	for alex.bennee@linaro.org; Fri, 28 Oct 2016 08:02:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c05rM-0002OS-RQ
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 08:02:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c05rL-0002UV-VD
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 08:02:08 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34997)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c05rL-0002U6-ON
	for qemu-arm@nongnu.org; Fri, 28 Oct 2016 08:02:07 -0400
Received: by mail-vk0-x22a.google.com with SMTP id q126so52667235vkd.2
	for <qemu-arm@nongnu.org>; Fri, 28 Oct 2016 05:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lXELHQq14rcKPj8CIIfvT/ml/XpPbAWNBG4x2kq+5ac=;
	b=cZrqwLS/XfcvXAHlIax4VUJbLL1oo0shMhAV3iY/fEXqGEXZa2AZicA2Ua2FXUG8wl
	Zpjjv57+tPdesauU/wcLgkT648oirzhasm8EX+UDXKdGi9JNqRpaAEF3T1XdhWaqKar0
	xsJmbiyQchXIlOOJ9vHvRScXuh/kbJ+ZRR+7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lXELHQq14rcKPj8CIIfvT/ml/XpPbAWNBG4x2kq+5ac=;
	b=BCCnff/j2SKPD8jw5ah/TH6bcphT+G3veIFbuzGiMHfbrzMHO7qKkwKDh8/LZlb9fc
	3yZXs7xx9oXoNmkt2FwDjQt8xv3AeHdHnX2ZmhT8+UYzW7SEi6zEFAea4FtdDTYljy5Q
	41GKN0YiuvV/fYt+Qk56UF/TIX1iH5S38ejvokwMwrwpo5PMTa4mTKjEX8hBXfMpHh95
	fWYA45CuGLtW0kgv4fq7QU/HwWIjOF8aYGAZJkiPdDZAyzN7kl6fv84O1pp7Vo2QoyQF
	E4pRSsuXpnUijq/IMCA4vuKmvXtN6SsSz62nlmBrAgMWzuWf5ANGLMiQW2qIFGx2UGQW
	hO3w==
X-Gm-Message-State: ABUngvdcmj3dQWGUjNBmDB3kZaVQz6PO+9c4ygqTtwiT9wV2e26rw4COBdp160L4KvIxNP6tKXOxNcxB+3v/1SkZ
X-Received: by 10.31.79.3 with SMTP id d3mr6563984vkb.165.1477656126126; Fri,
	28 Oct 2016 05:02:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 28 Oct 2016 05:01:45 -0700 (PDT)
In-Reply-To: <379c3411-a2ff-1004-370e-e6bb976c1d7a@redhat.com>
References: <CAFEAcA_5+bm4xN_m3G+vY9StEvk2s-eqbtdXjcudn+2oFqaS7Q@mail.gmail.com>
	<d26e1644-06b0-12e7-2d3c-7e871fe1ecfd@redhat.com>
	<CAFEAcA8heQy52Z5BtrijWrQQ0Rka1rhgw+JObTYnT6a3jQ2s_g@mail.gmail.com>
	<379c3411-a2ff-1004-370e-e6bb976c1d7a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Oct 2016 13:01:45 +0100
Message-ID: <CAFEAcA8oGv_hLfdi2q6zOV-Q0zXjdn9er6iMi_H9iiQ=-uA74Q@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V8 0/2] Add option to configure
 guest vPMU
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
	Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dx8E7UxzFS7b

On 27 October 2016 at 21:53, Wei Huang <wei@redhat.com> wrote:
> On 10/27/2016 12:15 PM, Peter Maydell wrote:
>> Right, but at the moment the commit message says there's no
>> PMU in TCG at all. What's missing that causes there not to be one?
>> (I think maybe we just don't report it in the feature register,
>> which might be a bug.)
>
> This sounds like a bug (or incomplete). In current version of QEMU, if I
> forced vPMU declaration in the feature register under TCG mode, PMU
> driver will be loaded in VM. But as soon as "perf stat" is executed,
> guest VM panic. I think some features, like PMU IRQ, is still missing
> for TCG to turn vPMU on. I will debug it further.

You're right, we don't have the PMU IRQ implemented.
I wouldn't expect that to cause the guest to panic, though...

> Let me clarify. Assuming we can get TCG mode to support VM's PMU driver
> (see discussion above, only cycle counter supported for TCG), will the
> following be sufficient?
> (1) ,pmu=on
> perf driver can be loaded in VM, and "perf" command can use HW counters
> to profile.
> (2) ,pmu=off
> perf feature can't be detected, so the perf driver can't be loaded
> inside VM. "perf" can't use HW perf counters. But PMU registers (PMCR,
> PMCCNTR, ...) can still be accessed inside VM.

I think that's what we get today (with this patch set). But it
would seem more consistent if pmu=off didn't provide the PMCR,
PMCCNTR, etc to the guest under TCG in the same way that you
don't get them under KVM if you say pmu=off.

Anyway, I think that these patches are the right thing for KVM,
so I'm going to apply them to target-arm.next. We should probably
look at straightening out the TCG situation, but we can do that
with a separate patchset (and perhaps not for 2.8).

Thanks for your patience in working through all the revisions
of this series.

-- PMM
