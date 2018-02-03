Received: by 10.28.71.27 with SMTP id u27csp908263wma;
        Sat, 3 Feb 2018 13:31:37 -0800 (PST)
X-Google-Smtp-Source: AH8x2245AmqKDjF9Yo+rGuNKqusg0FWq7yeSCvA4y0JJ4V1aXVJ+xCvfIsHfcIuqVgXGlHIWvG75
X-Received: by 10.37.64.6 with SMTP id n6mr29641548yba.415.1517693497173;
        Sat, 03 Feb 2018 13:31:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517693497; cv=none;
        d=google.com; s=arc-20160816;
        b=ReCABOdEmUUXYq//bAxkWgvYl5gpVu0dzhzRxww4LeIvR/9mI2eoRM198j8sz77wK0
         NN7LYEna6Yx1zbRiGhcbMnG6SRTxsrz5+m+QudHrjhVqZIe2PG7HbBOiZKi1sOzRFCAZ
         C8U3r8rdXM50qcSPAV6MQ+zgJpVK38FiO1woT06p53PdcNjnJq6fKrJ+Idi9BEcSGQqd
         rXnBk+lCKMNc6w3XWJVe1bY4zCzKHJi9J5DGqlLTv7xXMFV+42MgyLlAYYIOpjqEg0bP
         UNbORi6FWwjWXza26/m6Xoxnid945p5qky96+IucKSMx9Ma4YqBaU1uqoWr2chZxZ4gd
         Z8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zsO0FhxgCbJLEPp1pDfi0VsAoYPNObKSdMOptxRDAFg=;
        b=vzuogNb75ou++XKSUXCxN2POR3GgtM2pW2D/YAoWNTVuwWbBlQ7R2c4uj4RQyoSA1Q
         XG4+vLtg0sEXRelUjZBbGKbugr1JTZF0aAg59pGZQUr4q5z21rMPHCUO9QO2wZXyzOi2
         LL43ZhrvgwzjoUvwr1VyhpigTTdV9w8hU1gKkI0HuAmUqYlPVQU1YkZPXF23huweSMGa
         /Flur+vyQzM8kEoQe4ea3xlLhCK4G5gGg8eYZ7Lc5B3rAwVcQDfkn1gV7ajrHCBsiOmZ
         e5qn1t/FREoPC12zs3tmersZzaG0NC+E/tlDkIOiPQHogUiAJjdUHPDhiHXDNHeRd/vW
         FLOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AY1XzEJv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si290592ybu.12.2018.02.03.13.31.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 13:31:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AY1XzEJv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ei5PM-0000Bc-Fr
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 16:31:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ei5P7-0000Ah-Kk
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:31:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ei5P6-0000fK-RP
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:31:21 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:44325)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ei5P6-0000e4-MA
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:31:20 -0500
Received: by mail-ot0-x241.google.com with SMTP id l5so17504135otj.11
	for <qemu-arm@nongnu.org>; Sat, 03 Feb 2018 13:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zsO0FhxgCbJLEPp1pDfi0VsAoYPNObKSdMOptxRDAFg=;
	b=AY1XzEJv2RWMn/snYc8s4QW4s632nS5ZrbK61jhylgqiTjbsyGzwR/dwKiejzbn+4Z
	BJVBXyE5OJ2yuv5Ck/krYgdq96nbFOm7z5g+kps/2LRs7IjdFsTXTpJYrHAx4a4COjLC
	tV6ByA2kURc5SC/RsbmBnQw/sam4sXfPB5AwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zsO0FhxgCbJLEPp1pDfi0VsAoYPNObKSdMOptxRDAFg=;
	b=s/J1Ysi+TOQP7zioBlTM1uOqtRKxLUvjEMlHULTuCVVcD3Y6AmKBkBAGTpYJEp9FFI
	pxZbs4wPwAgNaQUDxxPERGzaRRa4Az0ancKM9KKPc8U0gwXYdrMWHHE4uOUTnS+9FADM
	PRwZpqrwUgRDS9Qgl/CeJoxgzx6ujj+BxdMb9gG2u/YcelaUa7RiwXvONsS2l+BWA2K1
	+GlpujFfrZzQNJQAUCWO4Eoyn+e4fQ7aYF250JLxFFn+8qG5gBLSbLUNLa4I20GMr4/L
	lt765PIy43oj4g+LGUUgcgM089v38Zzl5q+bMXa99NLkIRWZhYVt359bobdrCVcVeVgW
	N5yA==
X-Gm-Message-State: AKwxytdbhkPP4AJYkuQZW1UyR7ijAk+AlFVwRBTYncRz3xObedrbmONr
	ut9e/d7gevkTv8SebWqgI55uDCz5jTQD4uvlhH2YMA==
X-Received: by 10.157.29.211 with SMTP id w19mr11975300otw.24.1517693479670;
	Sat, 03 Feb 2018 13:31:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Sat, 3 Feb 2018 13:30:59 -0800 (PST)
In-Reply-To: <675ab9e3-80ec-97fc-5c01-ce28b2d2d4d1@linaro.org>
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-5-git-send-email-peter.maydell@linaro.org>
	<675ab9e3-80ec-97fc-5c01-ce28b2d2d4d1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 3 Feb 2018 21:30:59 +0000
Message-ID: <CAFEAcA9xBQO-o8wV0bR1qK1PG23xbAAWtd-JdXqS0ao9N+f3mw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/7] target/arm: Make v7M
 exception entry stack push check MPU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XbmUOS+uqFO6

On 3 February 2018 at 21:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 01/30/2018 07:02 AM, Peter Maydell wrote:
>> +    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &physaddr,
>> +                      &attrs, &prot, &page_size, &fi, NULL)) {
>
> Given that you know you're going to call this at least 8 times in a row,
> probably with all operations on the same page, it is worth querying the qemu
> tlb first, and when that fails but the lookup succeeds, installing the result
> into the tlb?

get_phys_addr and address_space_stl_le don't touch the TLB though?
We could in theory do a get_phys_addr() once per-page rather than
doing it all 8 times though, yes.

But yes, I figured I'd write the straightforward code -- M class
CPU h/w all runs much slower than the host CPU anyway so we
probably have some overhead to play with. If anybody ever
complains maybe we can profile it :-)

thanks
-- PMM
