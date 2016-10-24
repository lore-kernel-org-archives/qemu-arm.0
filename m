Received: by 10.80.166.35 with SMTP id d32csp2613587edc;
        Mon, 24 Oct 2016 05:33:47 -0700 (PDT)
X-Received: by 10.200.39.200 with SMTP id x8mr14345228qtx.91.1477312426991;
        Mon, 24 Oct 2016 05:33:46 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w50si10827637qtc.38.2016.10.24.05.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 05:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byeRl-00036W-L9
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 08:33:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byeQU-0002VN-7T
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 08:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byeQQ-0007Di-Hx
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 08:32:26 -0400
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:33833)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1byeQQ-0007Da-Bv
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 08:32:22 -0400
Received: by mail-ua0-x22e.google.com with SMTP id m26so40108499uaa.1
	for <qemu-devel@nongnu.org>; Mon, 24 Oct 2016 05:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YQuQPo7qDEeHJfCQ1mQhLYcsbWKu37qCupp0gK85vp4=;
	b=Avu/Tb3pI2U35N3bFMhi7z/xJ3kU9ILRL7gN8HWW9+BZ7IOLXEE8JWglBWTzWg8Tx+
	OORKccLFKSNWNkv9Z2QK5rRyUrlz2MtYsBJuIUn/44RYt96sRfEH5rT/OQLMF5lWPtrI
	ao+1XfoP70VbtQ2GevlqyzsT/V1JVs2DEe+Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YQuQPo7qDEeHJfCQ1mQhLYcsbWKu37qCupp0gK85vp4=;
	b=N9DpxbTUxoMrmRoH0z977NxCgq5T1LM4yZoy/6RuDtnqCwrwV4+1bwmYLuShTNPU5a
	xEuc5cdDVgTHHwtPthmq2lZ+ItKeFnfEyUIFGHs1yk7mzIS7xT4dYPFngGlNs1U5VAOz
	UQXxYllj7CwyQ6h5NR1N2x8EtlfEJY3ELdTeWqOGGLNe4mNAcLtwUR6ZR7TnYaRf7Fme
	KfRmi1PobPAEBhOcz4I6WPDVLH5hsbAyd+RKoSTepE8e+Up/fF/GYClP6P/Luzla88oS
	KURxmTvyvORa/ZK7hwmv0eLLNI7b+mgr36fbV6xyx4w5Vy68iBK8ifEut49jW8NlFeTR
	NyQA==
X-Gm-Message-State: ABUngvegmA6Idp/B9cL/eRkNP13oiPeE20sq5T3bJwOXA0iTUzkesINpjbUziV4YSWcb0glgdy3aMdE4ewXrKRnG
X-Received: by 10.176.84.210 with SMTP id q18mr7600740uaa.42.1477312341320;
	Mon, 24 Oct 2016 05:32:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 24 Oct 2016 05:32:00 -0700 (PDT)
In-Reply-To: <1476707466-14300-1-git-send-email-eric.auger@redhat.com>
References: <1476707466-14300-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2016 13:32:00 +0100
Message-ID: <CAFEAcA8mQmHPQqE+1dEWwaN80291v-VfgDHbEf6EB7T=Z3F9Pw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-devel] [PATCH v3 0/2] ACPI IORT generation for ITS support
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Prem Mallappa <prem.mallappa@broadcom.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0yHWHWXR/h5W

On 17 October 2016 at 13:31, Eric Auger <eric.auger@redhat.com> wrote:
> This series completes the support of MSIs for ACPI guest featuring an ITS.
>
> It generates an ACPI IORT table which describes the IO relationship between
> the root complex and the ITS. This typically enables vhost-net support on
> such guest.
>
> The series applies on top of Drew's [PATCH 0/2] couple ITS support fixups,
> which is now on target-arm.next:
> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg02013.html
>
> Original contribution was sent by Prem Mallapa in
> [PATCH v2 9/9] [optional] arm: smmu-v3: ACPI IORT initial support,
> part of [PATCH v2 0/9] SMMUv3 Emulation support.
> https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg04350.html
>
> Prem's 1st integration targetted Root Complex - vSMMU relationship
> description whereas this series targets RC - ITS description.
>
> This was tested with a v4.8 guest + rebased Tomasz' series:
> - [PATCH V11 0/8] Introduce ACPI world to ITS,
>   https://lkml.org/lkml/2016/9/12/926

Applied to target-arm.next, thanks. (I'll tweak the commit message
for 2/2 if Andrew wants to suggest a wording.)

-- PMM
