Received: by 10.25.21.156 with SMTP id 28csp2625736lfv;
        Mon, 1 Aug 2016 06:16:35 -0700 (PDT)
X-Received: by 10.55.151.198 with SMTP id z189mr71332379qkd.177.1470057395379;
        Mon, 01 Aug 2016 06:16:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r6si19886589qkf.216.2016.08.01.06.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 06:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUD58-0004fi-PZ
	for alex.bennee@linaro.org; Mon, 01 Aug 2016 09:16:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUD55-0004ei-F0
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 09:16:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUD54-0006Of-73
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 09:16:30 -0400
Received: from mail-ua0-x235.google.com ([2607:f8b0:400c:c08::235]:35830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUD52-0006O3-VQ
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 09:16:30 -0400
Received: by mail-ua0-x235.google.com with SMTP id l32so105833086ual.2
	for <qemu-arm@nongnu.org>; Mon, 01 Aug 2016 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zzQ1PCjVijsnL+ndtcyPmKC5kbs/J7ampaKxhSLhDYU=;
	b=chP5yuSqv1JOYKbFDILw1Rr/NqDgIncCVxiLNGNIRJlZMLkz5eRuxnSI95210yfj0C
	wnsBPT9ptL+ts2Fwy7zjvmhRqLeMdiMA5aV0xBrIYkcN0EBe5N/P7e0/IgRxMcdt6VXd
	8fA+yKOGW4V97kRHSMtNdj69SeRILQfoa+xX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zzQ1PCjVijsnL+ndtcyPmKC5kbs/J7ampaKxhSLhDYU=;
	b=ayEqcfwjvoYyXKDBXaFV3WAx9B2URsUAig4jG/R67Q3R59oyWpvILfUVJMKexNywLl
	y+gl/cMUsMLH4eHVF+spGVOU38OXOfMvmZSXlXWWddeaM8GO83RzXUhncdWKzWEORul/
	1tIAZvcduoOypjPlCJgfOMUKFFcmdIwvehNCbq0gjpQgasyOtmbwAmcGcd0bN8P9iTCb
	dXoWI3uw0xXCswzH3uZRls2lWhSJSUB1uVNF9mrtQrCSUG+KRo6VCK5Rr8i3dUu6dHNd
	g7USMv6oyTa0lmmWMHYnwAFMmiV/YWxCjohfrXR2fecg5Mo8e0IowIRxC+YWXNzvc1AE
	+vxw==
X-Gm-Message-State: AEkoouvI9JoPiuZPSyUL2XLPWndsRbts6cLuAKPamEl5453BIovdXO0umjn7xAfQA+sBqDyrCZRUt2AgwEGl1zCF
X-Received: by 10.176.65.71 with SMTP id j65mr26003317uad.103.1470057388463;
	Mon, 01 Aug 2016 06:16:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 1 Aug 2016 06:16:08 -0700 (PDT)
In-Reply-To: <20160801130808.2igpsx52opi7ogvk@kamzik.localdomain>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
	<1470053099.3971.11.camel@redhat.com>
	<20160801130808.2igpsx52opi7ogvk@kamzik.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2016 14:16:08 +0100
Message-ID: <CAFEAcA_eUzfStfGACRjrHMAn49-Jd9UyUWpCPOBzmQwTNXC0Mw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 1/1] arm64: add an option to
 turn on/off vpmu support
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
Cc: Shannon Zhao <shannon.zhao@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1iD/8aUxtP+0

On 1 August 2016 at 14:08, Andrew Jones <drjones@redhat.com> wrote:
> Peter had a good suggestion for this. We need to wrap the property
> addition in an arm_feature check like the has_el3 property. That will
> remove it from all cpu types that don't support it. Then there's no
> need for the enable_pmu && !has_pmu check as the has_pmu part is covered
> very early with the feature flag in arm_cpu_post_init(). Peter also
> suggested we keep the 'has_pmu' name, rather than change it to
> 'enable_pmu'. On that one I would disagree. 'has_pmu' indicates that the
> feature is available at all, which it is to all cpu types that have the
> arm feature, but not all users will want it enabled. 'enable_pmu', which
> matches x86's naming, seems more appropriate for that.

If you create the CPU with pmu=off then it does not have a PMU,
and so has_pmu is false. I don't see any reason for the naming
convention for the PMU to diverge from what we have for EL3
and for the MPU, where the property names and the struct fields
both use 'has'.

thanks
-- PMM
