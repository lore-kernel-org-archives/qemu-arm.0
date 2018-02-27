Received: by 10.28.71.27 with SMTP id u27csp5348471wma;
        Tue, 27 Feb 2018 14:50:12 -0800 (PST)
X-Google-Smtp-Source: AH8x227tx/2FGCV748gNgGcnoXAXSuzgz2Yk+xkJ3bgyx7KEfclvoNqU0xnUp6YPyGccowmq020x
X-Received: by 10.129.175.3 with SMTP id n3mr10389980ywh.343.1519771812470;
        Tue, 27 Feb 2018 14:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519771812; cv=none;
        d=google.com; s=arc-20160816;
        b=fk8gzJet+42GtzFCRFIFH+vPKk2p7BxpZ+nNVCPJvOiKHx+uW0YVE8Z+xsXbhmmSMo
         JN4Z1pQnhqzUj32ic3H1Uz1DmmIFhVndw8cgZs7k2mcGJr8KV5v1fR4Mmd2x1d9oLwhZ
         SW+Cqgmjfwonj0LNZExBHZIG68CPLaVx5qbzsR71hHPq2YmldyfDry4CS8jJCbdavVx1
         tuhues0LTDu9ktUB0Tvfzez5VVZP8gKh4pCdMB7z+cfjRi9KEhnjYpVNyS7W5esTG1se
         FYsLNiAEUjph7SiCT1DDeRTKlomQgZhN29j8OHsPJJE0woCF95w0EUqsm1v6G9cA3OI+
         Bahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ddH8wi7rydfgpTaf/cZrtmLbsuOPi1xtnsVUxM6fxMI=;
        b=JogNZxKRk9bVhzn+aj2YxyL5rsb2gpkQzmqMsCozzYCVq1on0T0zb/3lnVxp5aNlig
         8XuniX8S6yJwycJ2uH5ZJbP2w4Isj7kfrMRx0F/uPqB0QLTsNF+xkElWYOhVeq/Td/xa
         Byy25Pvv/sZlVwp2L08iQgul2qQM9SjGkXYXfhYr4dIJnN4MzeFiqn5R3owTCOrR/NSZ
         maF4s+DqVyQh1qfqcBytfxqZcM3xDwvioxRL1izhBkgmH6u1rdnR3S8i+jI264B8+Ciw
         Odj2I6kFLBAQqPJJjxuBxcKejUpB/wEWClicLElcYru3VBV90ieoswbQvSc0rgXFTszJ
         WZdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EdnVsEbt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y63-v6si37035yba.744.2018.02.27.14.50.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 14:50:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EdnVsEbt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqo4Z-0006io-Vd
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 17:50:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqo4Q-0006i0-FH
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:50:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqo4L-00047c-R7
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:50:02 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:39147)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqo4L-00047B-J2
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:49:57 -0500
Received: by mail-pf0-x241.google.com with SMTP id u5so191223pfh.6
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 14:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ddH8wi7rydfgpTaf/cZrtmLbsuOPi1xtnsVUxM6fxMI=;
	b=EdnVsEbtB4EiRM2sYaa8Oxbz0MiW+pcTfM56tMGSaFNmueymh3Uh2IHWWfeYRaIAFA
	/PANdz3jiEW9M+4zVFRzMXegBoERcwCXGZM9O73pmTJ6CP8Xg2BGW6B+YkIvAiSIeao8
	0k+S7qFbKLxWNF882mWCtT0wPLRLXP+BaoZfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ddH8wi7rydfgpTaf/cZrtmLbsuOPi1xtnsVUxM6fxMI=;
	b=X29W259WW1xtNdX6OYW0o1YLcexC2Z5mT/TxtY0xpyq0K/u0Ls5oxnTZsIsUvCDOdL
	8GEkEKzLubtY8mVnzr2/dGg/HSsHiN5eF+Hj2s11rlkt0xS+dQza6d0x/0NNjMWNwgwP
	dMJ5iLhxqgGzDHPYTKAoV8EsnZuvnjno1j7LaBLsAg8/NrWIFqbt3SiF91kVK9EQdin0
	8ruonbQO1t8Rn3ctjBpPRTK0LkpQvB08mSqDv6eIbuQayL6Gt1K/C34k+wyZu/lPj3bl
	gdrg2NWxY5OrWaAqZ3RE7Muix9/iIXv1sfphiv4Nq4OkKUFL7H/Hx5yoWNVZMwci05A8
	7C8A==
X-Gm-Message-State: APf1xPDDl5scBJ89f6GLbTFx7vbonDOXn6yh9esSCD9Lkvxqf3jCnrXo
	06S5x55vdGALNpf5rDpmJArEyg==
X-Received: by 10.101.82.1 with SMTP id o1mr12697228pgp.37.1519771796065;
	Tue, 27 Feb 2018 14:49:56 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id a5sm245871pfn.66.2018.02.27.14.49.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 14:49:54 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <847f6200-5d9d-98fe-bf20-54295dcdab26@linaro.org>
Date: Tue, 27 Feb 2018 14:49:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 18/19] hw/arm/iotkit: Model Arm
 IOT Kit
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dxuFTiP5bLuV

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> Model the Arm IoT Kit documented in
> http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
> 
> The Arm IoT Kit is a subsystem which includes a CPU and some devices,
> and is intended be extended by adding extra devices to form a
> complete system.  It is used in the MPS2 board's AN505 image for the
> Cortex-M33.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
