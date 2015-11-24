Received: by 10.182.158.201 with SMTP id ww9csp2312352obb;
        Tue, 24 Nov 2015 13:08:53 -0800 (PST)
X-Received: by 10.31.54.141 with SMTP id d135mr28845680vka.123.1448399333241;
        Tue, 24 Nov 2015 13:08:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 197si19959240vkk.76.2015.11.24.13.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 13:08:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:41413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1KpY-0007M9-RZ
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 16:08:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1KpW-0007Le-PL
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 16:08:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1KpV-00062Q-Ra
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 16:08:50 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1KpV-00062B-MA
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 16:08:49 -0500
Received: by vkfr145 with SMTP id r145so21392439vkf.0
	for <qemu-arm@nongnu.org>; Tue, 24 Nov 2015 13:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PBVF6DglLBUknsQxqr4WHwNy6EDhm1vJVZy3sVkoH7A=;
	b=UQPJQF9pGru+TV2uLo5aa9Yg184PBCxkr+I8SLydMl9b0n/Qxr4xpW2UmIIx8LQtax
	oTPnF92zDp8a4R9T3vXgs2D1E/TLQ2zKhGiHy/1z5N/7yT6+aVvRZhFdEgK4+2kBzPt+
	S2i9cw1qW0Ma35yaXp8rigKAdi5WiP0/i1R00tEfH9blX5clyyskOD2EvE7vgVxTIt78
	RW3zhbT4Etp/nrxxT8J6xCXWtjR9tx0nRNHgvCOQw2WklB4b5BodnD5wcBTaRxMCZ3xk
	/WIDWSxeVmu7YdHu3CLVYFxc7u6DGfRZgtMxrxrrniuqanFQMnBvzlPXOaDafWPm6ote
	5irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PBVF6DglLBUknsQxqr4WHwNy6EDhm1vJVZy3sVkoH7A=;
	b=bbwpV8vbAaRtHGOmIhjdrXpeLFDucDSdVoHpF9OqfHd9WMaELqP2HOtUsfxnqeZL9X
	sCru2k2hLipLHlEFnHII6NNytpiaAggjq6pupVqQ05+AJBHEFHz4DuER0HfK2Kcutvmb
	c22QhFiDQu5Ou0v603n26N+rSaj/9wpi+3CEuHx9E1Q+S1zJyA4atuSSThz8baqaJoqD
	TKrlwWoMy5bjWemREHIxEx38ZmlgNZuMqydYObkC7HoUPisZi4ippMOrSvUH1Wh/F0rt
	R2NF5IJzQm/ySe1u6LMvX6b1vJJwqAxidG+SB/tnCvNrDwXN4xcQxPy4g5PKYfHnpg1r
	t5jw==
X-Gm-Message-State: ALoCoQm9MnG/KAXH9GcLtq9/JLKs9PJDaNcDhvsbhcQUAb+lRMtnXmard0xfH8/H7GDHntTfIK4+
X-Received: by 10.31.52.211 with SMTP id b202mr28337951vka.82.1448399328950;
	Tue, 24 Nov 2015 13:08:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 24 Nov 2015 13:08:29 -0800 (PST)
In-Reply-To: <20151124205231.GA4383@hawk.localdomain>
References: <1447944817-13286-1-git-send-email-drjones@redhat.com>
	<1447944817-13286-6-git-send-email-drjones@redhat.com>
	<CAFEAcA-NJUUQnOiXzZJ22NSh5AsiSzmHSvPLwzDQPxkCYba-Hg@mail.gmail.com>
	<20151120214121.GC20402@hawk.localdomain>
	<20151121150537.GA3701@hawk.localdomain>
	<20151124205231.GA4383@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2015 21:08:29 +0000
Message-ID: <CAFEAcA-E8hkOY05QVkZjzytpqYOYUJ2kDdCMNBjCaZ4A+6wo_g@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/5] target-arm: support QMP
	dump-guest-memory
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
X-TUID: Fdoh+uIswlfc

On 24 November 2015 at 20:52, Andrew Jones <drjones@redhat.com> wrote:
>
> I've pulled a v2 together that I'll be testing and posting soon. Here's
> what I decided to do
>
> 1) Throw the fp registers in. Why not?
> 2) No linux-headers update, as we'd also need
>    include/uapi/linux/elfcore.h and arch/arm/include/asm/user.h.
>    However I've added comments stating where the structs come from.
> 3) Base the vmcore type on the guest kernel, i.e. use arm_el_is_aa64()
>    and (env->cp15.sctlr_el[1] & SCTLR_EE). However,
>    aarch64_write_elf64_note() will shoehorn 32-bit state into 64-bit
>    elf notes when the current state is 32-bit. Those analyzing the
>    dumps will need to look at the captured pstate to determine the
>    endianness of the registers.

Not sure what you have in mind by "endianness of the registers" --
typically registers aren't thought of as having endianness.

Also, if we're currently executing a 32-bit guest when we take
the core dump, you probably need to call aarch64_sync_32_to_64()
somewhere.

thanks
-- PMM
