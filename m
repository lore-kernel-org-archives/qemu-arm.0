Received: by 10.223.172.38 with SMTP id v35csp168731wrc;
        Thu, 7 Sep 2017 05:40:35 -0700 (PDT)
X-Received: by 10.200.28.117 with SMTP id j50mr3406959qtk.312.1504788035166;
        Thu, 07 Sep 2017 05:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504788035; cv=none;
        d=google.com; s=arc-20160816;
        b=CRLW3hL/ZFJY4kGXqRYCGfA5yIaRevscw9hzXGse4H4b9ODtIZcBbIf2n0oZCrXA/B
         NtqDKokvxaGw6zfv1FFTfmnF2DqOcIhw2MMpT06wZiOMgYPxF5pP7vnenXmU0Q/80k2Y
         lTKJoPUKqjknqNstk2fmt/J4fRxVe5aH2mPXbjL0XV87ypybRN03/rrtUOlGOiB5OvcK
         /2w+6ke1atlR/PjHfcSqLretWzmH/JKOID88h5Xr2Ty+I4KYDzZmUzjYw3m7eeLV2Fzp
         /k9FeJVQkz7ft+seZBp04w/h7/UJLde8XTq/K78AY9p+RimqxAn+ZUQrp+GzDK9fX/jy
         Y/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YGXEyickdfupltUiBew3k0VwVAmRv2rT9p5Q2tiYek4=;
        b=Cq6aSUORO762oQpqJQXvG2RW3Tv9QlAPll/zwGiL4qEkyRnHwzI/bNrQGeZA+yW+rz
         p8xvQrB6d0vjc/FYBO/MTpu2oC7OSwkPU3WXxCY3r4I0hHyux2NWx1HGNj94Nr4++2sU
         dHEYKwtnO5WEigRMMv9CmLB1jz16jiDD1Q6ZOQxQl/F2ZcRHU/OaFDEtocOJAnd5+FSm
         INP3Y5n79xUmQ+aoUUyZ3MZcUSINr3p5rRWzcOMzCLL4uoV+M2ym0rYjh3HCzPTtQ67+
         P9x6XChWxp1cQJU7xOhgCQwobABnt0bXYPBDtTvkklfQ3taeLcE+8LtXuG1g47HpANvI
         A8Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gIO84bsz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e53si2826606qta.492.2017.09.07.05.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 05:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gIO84bsz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpw6i-0007Y7-U1
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 08:40:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpw6a-0007XJ-Rm
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 08:40:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpw6W-0006qO-AD
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 08:40:24 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:38131)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpw6W-0006pv-2s
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 08:40:20 -0400
Received: by mail-wr0-x22b.google.com with SMTP id 108so19104219wra.5
	for <qemu-arm@nongnu.org>; Thu, 07 Sep 2017 05:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YGXEyickdfupltUiBew3k0VwVAmRv2rT9p5Q2tiYek4=;
	b=gIO84bszplUnUaDplhH/h/kL2oj/8ZZLLxQuX4FNc9XJx6rCek+JY/9vvrISZPuQDg
	IKyhtGH478JqCfCRAbsMeDp3y575vNGGspWiiwFAuJ2P2RL81TavDNDDKop19b2DIjCa
	gV0M4bxPRAsFOtCINRCIvFGkLDmodjCYsaBkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YGXEyickdfupltUiBew3k0VwVAmRv2rT9p5Q2tiYek4=;
	b=Mw9jGE+XihEqoWykYWr9IgFoUS9PtwGmebmQur6SnYpSaok/8kOAy+D9dOBDgbc1Wh
	4dPBPeB9myEsT1FSHwUIo5bSC8rBXdJ6xMMPM56OaXb7Vt/x3Tffk25HAK/Km6MgWJ2p
	2p6QY6drlJ5HeM1Atfk/nvonqJk9dRoUpqLmC6O/WLkQEkM4OVwjVP3GtU3WqTfhLhxV
	zCqEmv+i/Sj7boQktBxqneHtXhLQMY4uNguvniV2jfIccrZzQzdK+Wg+d/Qj4UcEqYXv
	A2NPPqpPQQjslV4o1u6FaJ+3sB1muN2QDUCiTLRwEJgb5cbMG42Ao7RSF8inhQaWQAP2
	HIkw==
X-Gm-Message-State: AHPjjUhzHAjHHOM+sz+8aIaQ3+TgtN99tMJuI7V4UyH7GXn+cVmRu2p/
	kD0dcPjLE5M7OhMIfZoUgNQdLLdYUgd+
X-Google-Smtp-Source: ADKCNb6hL1M3StmY2pPRP3qRMs16W3JtghEypsS/YN79vHer0C8DPDn7pjMeW74zBcteVqIO8kmXVGaBs4LHNNOwH88=
X-Received: by 10.223.163.71 with SMTP id d7mr1898793wrb.161.1504788018719;
	Thu, 07 Sep 2017 05:40:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Thu, 7 Sep 2017 05:39:58 -0700 (PDT)
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Sep 2017 13:39:58 +0100
Message-ID: <CAFEAcA-79barRXh-H1g16UgiswsQqtHnYKLv4_Vhp89nNxM2NQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-arm] [PATCH v7 00/20] ARM SMMUv3 Emulation Support
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lDMU2rmqf2pw

On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
> This series implements the emulation code for ARM SMMUv3.
>
> Changes since v6:
> - DPDK testpmd now running on guest with 2 assigned VFs
> - Changed the instantiation method: add the following option to
>   the QEMU command line
>   -device smmuv3 # for virtio/vhost use cases
>   -device smmuv3,caching-mode # for vfio use cases (based on [1])
> - splitted the series into smaller patches to allow the review
> - the VFIO integration based on "tlbi-on-map" smmuv3 driver
>   is isolated from the rest: last 2 patches, not for upstream.
>   This is shipped for testing/bench until a better solution is found.
> - Reworked permission flag checks and event generation

Hi Eric -- I see you've upgraded this from an RFC to a PATCH set.
Do you want the patches reviewed and (eventually) taken into git
now?

thanks
-- PMM
