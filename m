Received: by 10.25.77.65 with SMTP id a62csp2200718lfb;
        Tue, 7 Feb 2017 06:37:08 -0800 (PST)
X-Received: by 10.200.41.175 with SMTP id 44mr15888966qts.53.1486478228681;
        Tue, 07 Feb 2017 06:37:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z59si3060821qtc.317.2017.02.07.06.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Feb 2017 06:37:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cb6tF-0003yT-VG
	for alex.bennee@linaro.org; Tue, 07 Feb 2017 09:37:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cb6t9-0003vb-Ey
	for qemu-arm@nongnu.org; Tue, 07 Feb 2017 09:37:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cb6t4-0000V9-VO
	for qemu-arm@nongnu.org; Tue, 07 Feb 2017 09:36:59 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:38211)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cb6t4-0000Ua-Om
	for qemu-arm@nongnu.org; Tue, 07 Feb 2017 09:36:54 -0500
Received: by mail-wm0-x22d.google.com with SMTP id r141so154923305wmg.1
	for <qemu-arm@nongnu.org>; Tue, 07 Feb 2017 06:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3Pmr30FCa7Jq6SjB31vFTZbBWeB7o/AzYL/fe9cApr0=;
	b=bdnuND8rxSRR4BxFlWEf1wCel/8ugc+1BcdMRXbOkKE7GNdOLrTgTUOZFnLGwTH71s
	5dg3QYGk/93A8ltemk5I2NCXTZa/ta+r6Ul6HnVRxShVluw6DdaecoF++qFTSP/Zb3Ks
	Aj0P9OrtCVUgGsEOwd5I1a10HQYCLSc/h+JGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3Pmr30FCa7Jq6SjB31vFTZbBWeB7o/AzYL/fe9cApr0=;
	b=ALwK8wEt+TR0UD1+jRw3omphPYTshj9fClvQUeTigwihDtlkQOVcWStrPXOIqMd1JB
	fY+hjzHTbKF89Bjp4QiItQ78VtoCgUWXXsK3+wFovXLT49c5OZONc27wJPeFBCN/jUCh
	UUprBTWcXUO6+Y3HUJMAs9p7WUonieljdpc+oyna2oQfFXOoSq2orycY4UeovwgymF0W
	iQ4Q0QW9NdvC5Xpl9NsmblqTD5g+ZButE3YvM3taxUNNLRe/1AxPKPYnivNKVOrmQCVd
	imsiVD53wpW01KdVRNJp2RS45hQHB5NcVmp75VahjKJPTsWpZYAXBMeVzkNzAz4k620o
	vu3g==
X-Gm-Message-State: AMke39mcGCtoBcM+RtxlY5PFdRVXcPHJLJsz9OvXyqXSW3mEDCZ7rFJwKvemAlH9v6/Bbs5U+csPDKdUrqU1exOC
X-Received: by 10.28.91.16 with SMTP id p16mr12742038wmb.111.1486478213075;
	Tue, 07 Feb 2017 06:36:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 7 Feb 2017 06:36:32 -0800 (PST)
In-Reply-To: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
References: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2017 14:36:32 +0000
Message-ID: <CAFEAcA8FWjeV+Gyd5J5zwiM4yajwPjt7obTNiLJa7S7DXDemLg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [RFC 0/4] vITS save/restore
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, "Kumar, Vijaya" <Vijaya.Kumar@cavium.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I7UW8QbRpJOl

On 26 January 2017 at 09:19, Eric Auger <eric.auger@redhat.com> wrote:
> This series allows ITS save/restore and migration use cases.
> It relies on not upstreamed kernel series ([1] & [2]) and
> QEMU not upstreamed series [3].
>
> ITS tables are flushed into guest RAM on VM stop while registers
> are save on pre_save() callback. Tables and registers are restored
> on ITS post_load().
>
> The code is based on Vijaya's "GICv3 live migration support"
> series [3], based on v2.8.0-rc4.
>
> The series also uses one patch from Peter Xu that aims at allowing
> the explicit ordering of save/restore handlers [4], now upstreamed.
>
> That work was tested on Cavium ThunderX using virsh save/restore and
> virt-manager live migration.
>
> Best Regards
>
> Eric

Looks overall OK to me (you've had some review comments from
others but I don't have anything else particularly to add).

thanks
-- PMM
