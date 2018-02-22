Received: by 10.28.71.27 with SMTP id u27csp2214407wma;
        Thu, 22 Feb 2018 09:28:46 -0800 (PST)
X-Google-Smtp-Source: AH8x224QQ7rmX7c0Gbie8fk1JJxtP+Z/JtF08INze2aiymt1BBgumtKOWJrRhPvA+h3i3kJbWAk8
X-Received: by 2002:a25:ae1c:: with SMTP id a28-v6mr5449413ybj.87.1519320526322;
        Thu, 22 Feb 2018 09:28:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519320526; cv=none;
        d=google.com; s=arc-20160816;
        b=JmuJwhfnKlPgeoDQjdtjIsN5pi8783iCBI7whmJMzYCCE1HtKnf5c2Mo2WqKnvHBew
         b5ZaVGPqoJEGX+F/wWLKhtmRb5Zhf239Gx48QDmAJ0FLNJdOcoucoJsHam4d3sT8PK92
         /y1hoERoedYxhswIv1P6+HlD0woxzxfCdFZCy1c3x28WjaHKcK0rLyxUqxVUoNkTkJ18
         qYNpeKpyiev6DlEfs4EuVbv0IQ6Pm5J60VNqYZXXBmfhQ4qW6/qmineRvyFPLfJwVVxf
         Me982sy4VZOQw3+J914Q/leTvjIJF+rWtCjvv2BKX6+GN+glPyra2Ons3k3hOryOJ5bi
         jkBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=GEjEU7qzD8TBcqeOPJAf1YxwNW8mikfCelpCqmuznKQ=;
        b=cQFb2Muum7vp1hG467oSOFk9SgyQiV/FdTaECCqKbriXS/xjnCkZ9K4HkqBcJiSFIS
         u/bTt/DjagXjp/7ua2aG6Xr8AmarRINhXfcKnAltK6P25ci9NXN8KXm/nR5XywiGEZHq
         F4YscAoSG182VLAMoeGVCHoLYk4TKvED0W5xn4xBstX6HFT8t4ioa/rkMELm/xdqZ/0h
         mossRyjFjCushfhrkM/v3+4jQiJQ4SqplzqFNEzMo9WL1QcuywuOMAL2wd6uvRyRE2Dh
         6w1K28XMpeKDCmK+u822YZCxSRphrDIOaIo/Juu25iWiApt+UzPwtGJUxiZWsl9hKFyH
         QiJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XWku5aFH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v93-v6si83320ybi.430.2018.02.22.09.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 09:28:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XWku5aFH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoufl-0005QF-Q7
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 12:28:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eoufc-0005Pl-5q
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 12:28:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eoufb-0006v4-8a
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 12:28:36 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:44931)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eoufb-0006u4-0m
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 12:28:35 -0500
Received: by mail-ot0-x244.google.com with SMTP id 79so5296091oth.11
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 09:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GEjEU7qzD8TBcqeOPJAf1YxwNW8mikfCelpCqmuznKQ=;
	b=XWku5aFHCDYFCYYAu/BnAK39mPzjF/VpVCqNh+olq+CaMZrBFoai1b4w38mX1NUmgD
	1w6rJP00J6mhfR2WO2c5BzGwHMZEbXhz0jGYM4Lid3rIIHrbRsO8aRbC0Ifebha0tcEM
	VSItEYzJgDMLebVu7ibwSlLpAUhQ51J7YR1vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GEjEU7qzD8TBcqeOPJAf1YxwNW8mikfCelpCqmuznKQ=;
	b=Eh5nhQGwKEPW1eSoWN3skv0KOCK74bi/lRWWYVVHzWwDXBdt/uVTmEEPdm+aW0i59P
	X9kQxW961jBShDRZlDuSO+iK/uqOm0KD05Q+GsmzChDR00wjY0frZUBkcL7W4rM6kX+G
	7yT2fJwbKJYgKe56fwuR1TdXidfrckpsREhEWpiRR2VratRjTzPpTY7nu2dHXEsWgFCT
	fazahim6aiAKsmqg7adtmorHiibw1jUHW/HKxidjksdnr6jX2FYJlri8B480jV0L1XOS
	1cw48kQZ2yfifE0fFAjGrQ540d0mVQl/3hc0f3ZXUkVYPcFaZjJniJvAw8K/DpX9ezLC
	sfQQ==
X-Gm-Message-State: APf1xPCSlx4e+eXVxHbfzJRYRy9tTsYUwCk0amoaE7w3W/4WWL09/88r
	qq0iMuAC6i+NO1Rtn3DjyV+Rxb7vt1pzlXf5wajSYw==
X-Received: by 10.157.72.231 with SMTP id a36mr5900926otj.308.1519320514201;
	Thu, 22 Feb 2018 09:28:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 09:28:13 -0800 (PST)
In-Reply-To: <20180217182323.25885-2-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 17:28:13 +0000
Message-ID: <CAFEAcA-00jCXJzwSgGmC0gg=vWpmVFs0qUbrzEQ_THSzw74O9g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v2 01/67] target/arm: Enable SVE for
 aarch64-linux-user
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
X-TUID: Z9iAQ+YriXb5

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Enable ARM_FEATURE_SVE for the generic "any" cpu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c   | 7 +++++++
>  target/arm/cpu64.c | 1 +
>  2 files changed, 8 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though this should probably go at the end of the patchseries rather
than the beginning?

thanks
-- PMM
