Received: by 10.28.91.67 with SMTP id p64csp1845463wmb;
        Thu, 1 Mar 2018 05:43:43 -0800 (PST)
X-Google-Smtp-Source: AG47ELs1KUP8pPRveIPalAAUT0ZmmOPzG9wm1qM54g+eJk/JC34v2Cq9UJhJNNoLhOewT/1ZV6YX
X-Received: by 2002:a25:abd0:: with SMTP id v74-v6mr1066456ybi.294.1519911822998;
        Thu, 01 Mar 2018 05:43:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519911822; cv=none;
        d=google.com; s=arc-20160816;
        b=BNrbySb8SwJypX2JELH6wFbUTgBCoEt8RBkh2YmJC613v1F5YY+6AZAR8IRdbblL1P
         OxZl/JLTMWDp10IpHQaesL8gavyIvvCgJdWq4+R6C4xAADYkNEQwAs3C5TukJ5zI3aVB
         e53DhfKBXIGb63R1ew7tjyAXiLEeEpVs4nL03pIOKvbEnxvYtk5dGTzZinwRq7vlXYUQ
         JW9J6hG401x/qBL0S4Bp3zYjeUu41PWMfdF3ROktOjOijQpUc6Zj05o5uP6AfQlV42aG
         Thea7frAIoBlycQJGTJd5xsI6epL03HsY1/qdQDt4PPTaBTm1w5rjHoVYZYubY344k3h
         GxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jaM4Iu2ae0JTne3coh//Jwwo5DNrbcxGLXHOYo64eg8=;
        b=0hPS3K/oi0TzO5g26QeEpNp5eueu2zI4zeIxqq2TnOv3fkjrt8ThG4lNFL2DKIJnvZ
         eB5cSBCHT/PYG0e+D6p15t2iJlfoaoZWN4ejaBXwf+MCOvkovlEx4W3klcbsENF03saA
         QRmGt6VjEgAq6fp+a0l6D0kacgtRt+a53KlaEw0O8tjWnGHitcpX3ir3zGFrQIyeMljJ
         mThFvzOWyY1OZs7HSHMB29QCJn14bLCaw00BYLAAcJkoP+SqHZYSpWFEW62s7ND8Fx4q
         puSLVM1VRcumqslFDpCYGJHXokAJE27eNXQxTTDqc68a477gUuSixy6DTHKv7c1KdIiM
         5ZSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cqvj9Gig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w6si657134ywb.266.2018.03.01.05.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 05:43:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cqvj9Gig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erOUo-0008Oi-Ci
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 08:43:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erO17-00054o-Rb
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:13:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erO16-000599-VQ
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:13:01 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:44988)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erO16-00058Y-Qb
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 08:13:00 -0500
Received: by mail-ot0-x242.google.com with SMTP id 79so5482605oth.11
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 05:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jaM4Iu2ae0JTne3coh//Jwwo5DNrbcxGLXHOYo64eg8=;
	b=cqvj9GigLcQ5j25IVfQjZ2PMZN1D8Bed8nctw3RHAlMGyIzxBEiD2oCkSumiL2ydaI
	wNINjRn/CpV9qc4VUhfkMd0CKmX1KLCiavYb77aD/L/oUF2T74/Ob28Q/T+QvrvwU74o
	SuURAAtKZHR/10tvajlIsz92zEMg53q40YA98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jaM4Iu2ae0JTne3coh//Jwwo5DNrbcxGLXHOYo64eg8=;
	b=foF2z3ZToqbttwlQ8eJZkDZoIYRrc7iTgW0M9G43pjtowJhmZbBtfojZj9bSUpoLvw
	ZFR8KdRrGFk6LnMwmiKGktZ75KYeB0a79+wvPiFZQVMEq0X8j2yBbLEQGkv9+UHVr5Lg
	YJBTjWG0NRVsnFxGLZ57M7UrK7W3EkjUMWCV4M2vSxWq4x9L9NMmwJcEk/0tlMIuHD1O
	hCU95kxSJn2RYUdyWqVJ9SPKndo/L9KEDrRRpTDp0hdPHU2zpvIdfbj0x7MOvGDhu+Pt
	aeECWvsICchbd9RA+0SrGOELxA0ungJ/AIa8Z5yQkB2mCJgsw1stJ9yS+6b/emGithZ4
	I35A==
X-Gm-Message-State: AElRT7FxjlvCXaimOCsk9jMR5+NU5yOKlcrgAUY4Mh4rUuy9gL4JIftn
	td/KF5JkuYYR/tew2RHopb2SX5tvRcAhYgkzkXoYeQ==
X-Received: by 10.157.23.34 with SMTP id i34mr1333473ota.210.1519909980167;
	Thu, 01 Mar 2018 05:13:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 05:12:39 -0800 (PST)
In-Reply-To: <20180228193125.20577-3-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 13:12:39 +0000
Message-ID: <CAFEAcA_yW5DvBehZfec0jKvobiqL=pQxNBi2h0RbBvcA=HH5UA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v3 02/16] target/arm: Refactor
 disas_simd_indexed decode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jn8Sf5k/s/Z2

On 28 February 2018 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Include the U bit in the switches rather than testing separately.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 129 +++++++++++++++++++++------------------------
>  1 file changed, 61 insertions(+), 68 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
