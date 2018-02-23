Received: by 10.28.71.27 with SMTP id u27csp592167wma;
        Fri, 23 Feb 2018 05:29:43 -0800 (PST)
X-Google-Smtp-Source: AH8x224wOcuORfHeNhzBHaaqVbMbeShlxOFXLbIw8ogfUDYSkqRGuRrlomApWPKVT1rHLFGnBc7v
X-Received: by 10.129.4.139 with SMTP id 133mr936704ywe.298.1519392583101;
        Fri, 23 Feb 2018 05:29:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519392583; cv=none;
        d=google.com; s=arc-20160816;
        b=S9lFzR8zDt2W7HD0ZcI1HHKuu9DiUKbNhtPvVr6+MbGU4pNgagVjyPa5WqlNu6F8RB
         aUX5WZRJIlph7GKggFD2zkLOBZHAsZoBsk8RsKCkHnehy5dwqX/UKGSsPFLDPTRFAaoi
         uy6jzSiN38YTlw79FQhJKKFtcdPl2IyvmvDthxcCjLRUVt49oSG9QADszdpq2KymDAsQ
         rAKo8OlfK6M5xKBWWdWH4xsHtDQc5rtR1f70ZAyPxMd7uLrrcDb5HLSWQ5kIhDwI+6Qg
         QyHa0wtH19N5OA/4frdr4YYmhLXeBOdvGC84SqQDPMok4b/XijK3MHRkdXrE+6P7dHh8
         r1wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XDK23Ep2AMVZznuNjIY4KmSzNtEru+2vHsaiYYPyKO4=;
        b=k5HIkTZuWV19J+knVI/D08etSxYY5zTWj9pw8wAcwJ6KJAO2tZXkBMyLYzP5J8hCsM
         1NiUl95Qr9UD0odiSZjCV3axohsjAWEwRes6TiHH2ARxJK7QP+H/bHYxfV5hXVr/TnHG
         LyXlEdDqMiTU3Kdcn5mPn87BQhxblUrYSOVovi6mvd4tDo63orpnRI66eVRfcZwNckYj
         L+oPDjlpuht919yS1L4W5X8ekIvT7EQZEetAJhzv810YVU3qLdl3IPWOFDHvTje7L/Ac
         OuSPwj2C9JEpPqybwy3tlz84o7N1yFUz2V7oZ9kKrXtCJrIbQ35XIKNEr4Ek1g+Hf0PX
         r06w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CSBt+mNs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j6si390708ywb.448.2018.02.23.05.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 05:29:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CSBt+mNs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epDPy-0000TS-GZ
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 08:29:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDPd-0000SF-El
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 08:29:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDPc-0004W1-Ip
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 08:29:21 -0500
Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233]:43141)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epDPc-0004UP-Cj
	for qemu-devel@nongnu.org; Fri, 23 Feb 2018 08:29:20 -0500
Received: by mail-pf0-x233.google.com with SMTP id z14so3509327pfe.10
	for <qemu-devel@nongnu.org>; Fri, 23 Feb 2018 05:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XDK23Ep2AMVZznuNjIY4KmSzNtEru+2vHsaiYYPyKO4=;
	b=CSBt+mNsr6L6SVYRJxSJWVqNf0LisQ1v2dtYl7YwUlTQ8CJImqLOk+qMEt4xLY+JLb
	p8fl26DhoWkeY0XFTsRvrCXdWl77lfHHyBgojvZTyHVpHnPG1lk8usAChRTSexHWX6mN
	eHQVFafnWlKegSU/XEW9Hqci+5ujErJtN5/ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XDK23Ep2AMVZznuNjIY4KmSzNtEru+2vHsaiYYPyKO4=;
	b=RK3iGh/HNfbYOm4QysNkjggJDtZ6LCzgAhIuMT0WBtlNZNJQBAr4jzAxapXTIpcOAp
	HX1Hpy9HTkzGc3E3W0/XLJ4q4fktCWg9ITSEvXLBVPW2x29Qbqcd3NivQUHOCO/GxWsR
	IBRzEOGtA4nhpg6zApnmpiopgpp6rX2clGo8EICblT7OBUaauY13QmFFXgiVBJmR98Id
	NZ9nQPn6174V1Lwu2boVq8T7EaLijlqAUjAAiu1HTknPCeB1xjrMxyf41XLw0m42VuzC
	/Hy4rlSbWzcWugP15uCTRvRccKX+XQ2/eUlZMuOMwA5X8EmgSl8C7LoYEstTkWXTVFkS
	YPiQ==
X-Gm-Message-State: APf1xPBVtwfefiwja4xsYEUOgdRvW2xEYf4N7s7kXOwRgqQ2R8U5IPu0
	AgEdgFBMGJQD51kkYYiHRfxsMvKxzJKobDecH6c8XQ==
X-Received: by 10.99.120.13 with SMTP id t13mr1478754pgc.35.1519392559502;
	Fri, 23 Feb 2018 05:29:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 05:28:59 -0800 (PST)
In-Reply-To: <20180217182323.25885-20-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 13:28:59 +0000
Message-ID: <CAFEAcA-vhL6J2Ug=GBbecK4J2gVB12niZzneswvzzJ1H2j_fLA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::233
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 19/67] target/arm: Implement
 SVE Bitwise Shift - Unpredicated Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g/pfWXN5iZoj

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 12 +++++++
>  target/arm/sve_helper.c    | 30 +++++++++++++++++
>  target/arm/translate-sve.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 26 +++++++++++++++
>  4 files changed, 149 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
