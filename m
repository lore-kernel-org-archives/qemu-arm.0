Received: by 10.28.71.27 with SMTP id u27csp5159146wma;
        Tue, 27 Feb 2018 11:04:11 -0800 (PST)
X-Google-Smtp-Source: AH8x225DUj9yy8W3EKOfIVBPhJorzeYU1k+NWQ1y4u+djpF0NtfN2diihejuael8b3SZVJzG/9wU
X-Received: by 10.13.225.18 with SMTP id k18mr10151384ywe.512.1519758251285;
        Tue, 27 Feb 2018 11:04:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519758251; cv=none;
        d=google.com; s=arc-20160816;
        b=dhz658NObcQ6VY1y22oZb6NHxYvALKu5FPdAFfFibuIFT4Bc7iUs681x9MM8uMlxPn
         CzUhw5PBE3fqgLgLkw5cP5l41QhKs2gdTJPC+uOtMNk9W2yeyHiuF1qNESfw06w9Ye1p
         EwTsnnksjI3YMBtKwP8h/M93IZvXX/wTC1tH042Kk0JC2bgzDYS5yhp7ocMPaXhVbXf0
         YDoyAr/1S06dqfm6Up8FVEEoD8SW4oRXqU7cj2aMw6WIn9QwPC1HYAJ8LgQKDKR43nGs
         ZxQb+ycHBxnjiPlJZP/iW+G2MbRTzed/4rjShopalNhad5MOSMUq1SpiPkJv5mKwT41K
         H39g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=842gACRWW8CNJZzgIGhKZjc9KUNt2pitwi6VvzPbT1g=;
        b=iSB01f1bHrLQ0qdCXImGMJbv0157TwifR27aJUqHulAqZeVp5fKf2xPO+c83VS8ZQb
         ImohuKqu9O+46MT7YFxMUTdn+/wM4cfO68znhGFIJiGQycyczmaPeYkPCumCVmYGbdJ9
         mdeTZvydIA/L17lz1Anm47YmONk6X4Mz272cSbQqea+dz/moME3k2N1u+ye6S7CjQznx
         doCbvL/QdPAnPWUnHGyAyRyXaGO34FlPugHWux4z3P8STtgh8P4zTW8JdW0p+Nenjswf
         TPuqlCRu6eDCyexBqfDVQAfLoyZG/adjs7gUCOg0tWN0wn8E9xp4QMcRIbJmVG7GFHhH
         GSbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvU8B7mi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m10si2019419ywb.799.2018.02.27.11.04.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 11:04:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvU8B7mi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqkXq-0006D0-Kp
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 14:04:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqkWk-0005To-KX
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 14:03:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqkWf-0002Uf-1S
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 14:03:02 -0500
Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c]:38457)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqkWe-0002UP-Rp
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 14:02:56 -0500
Received: by mail-oi0-x22c.google.com with SMTP id 123so11239670oig.5
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 11:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=842gACRWW8CNJZzgIGhKZjc9KUNt2pitwi6VvzPbT1g=;
	b=RvU8B7miScasHqx2U9Gil+1s/PT3TBimOB5QpObYrp8JyHOZzJdbk5Ur4KyM6PcUtB
	x1v0KWAdlO/z/Dcq+cN35tOxNr2EfmUgFT0s9UHouJtmvevH1wcTqTC91kekIr3zzKvX
	h8anpco60FGSRGDA4EHBHqiD2Gxa5aJrHJWl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=842gACRWW8CNJZzgIGhKZjc9KUNt2pitwi6VvzPbT1g=;
	b=kUjLkzf/N9AXMj7iyx3kpYc/aX8sTUQnxemiepM0lwJ2BpOgJ+uHg1NzSrgvoABPJs
	YjvsTLA9xXBv4FBolWOJTaJ6FYLByAAJTmFfvNPL1cLqhzw9J6nnsb6GyOsZDeN4r0HE
	cq4syuhIRJzmWtWXywfJv2pNw7nIYfHZ/xSTXrw2hy+iap7L2Y5ODjsb+imYBavrq3qn
	/Ihr/qLYr3M+EXvg+D6AUgctq1g1NQ/IWEEPvT5K8sv/Df25Tj7gYl3QbFehBTI8/eD0
	FVIJZBMj6MPfle8WChPMXcUw6oWJJQ2W0gQzNaj6r6x9K+S3N9rr7SkPezpUSwLUgv3O
	XHug==
X-Gm-Message-State: APf1xPCyTnrABB65EIEDF7FT2i4TTR9HU1nTX4oiEsdIT5GJf2tle2qP
	byoe7e3/JfAdC12OrVYx1qTs0A+v/Yecnk4yZ4lKhw==
X-Received: by 10.202.90.138 with SMTP id o132mr3828427oib.11.1519758176020;
	Tue, 27 Feb 2018 11:02:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 11:02:35 -0800 (PST)
In-Reply-To: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 19:02:35 +0000
Message-ID: <CAFEAcA9KzitEO21Rgh8Azip+gVJjyobzNbk8sHuQf-ngg+Jjxg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22c
Subject: Re: [Qemu-arm] [PATCH v9 00/14] ARM SMMUv3 Emulation Support
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A1XEY15NnkvT

On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
> This series implements the emulation code for ARM SMMUv3.
>
> SMMUv3 gets instantiated by adding ",iommu=smmuv3" to the virt
> machine option.
>
> VHOST integration will be handled in a separate series. VFIO
> integration is not targeted at the moment. Only stage 1 and
> AArch64 PTW are supported.
>
> Main changes since v8:
> - fix mingw compilation (qemu/log.h)
> - put gpl v2 license on all files to respect initial license
> - change proto of smmu_ptw* to clarify inputs/outputs and
>   prepare for iotlb emulation
> - fix hash table lookup
> - cleanup access type handling during ptw
> - cleanup reset infra (parent_reset)
> - replace some inline functions by macros
> - fix some CMD fields
> - increment cmdq cons only after cmd execution
> - replace some remaining error_report by qemu_log_mask

What state is this series in now? Is it "seems ready to
go, needs review"? Are you hoping it might get in for 2.12,
or targeting 2.13 ?

thanks
-- PMM
