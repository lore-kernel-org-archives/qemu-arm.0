Received: by 10.25.221.202 with SMTP id w71csp1205176lfi;
        Thu, 3 Aug 2017 14:52:45 -0700 (PDT)
X-Received: by 10.55.130.66 with SMTP id e63mr323271qkd.253.1501797164905;
        Thu, 03 Aug 2017 14:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501797164; cv=none;
        d=google.com; s=arc-20160816;
        b=qqvJhHGugmb+H2HcGMysL7rbBkFPhnq7KYc1GfoC+Qae1Z3US4GjBCVmoxM2M/Tepn
         FxDIFKhBNhMn4xwo15yaI4FmiDf+WfoGfUX3U4hNTZqKCMImILc8ciSSTaw2uQlhvyf0
         IdwdTn/593tqe19Tre2OtQyDMG1cYityJYXwr94rKlo0YqlvRjuzELxyAgqs4DKAFkA5
         qcOTt36sxjRDxTkxtxerMx9KgavPYLVeMhYzS1ZBH9qcmNzA6dJXsRSgqSGDAxey3q1r
         8vCn8Y4om2Q6radk+Gmx6MusNbpiEhiKWibx7tWUx52hMg7uaFqQ1VT3+Txk5hP4AqQ4
         2P+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=RJ0t2d+8ZxBLI9FDLkCvRD6rWChvupS/1SsE5Thfrqc=;
        b=v7ARzs9x+EuwBSIRsJQ2F2DSvpY8eHEGTiASqwUa0Ydw0aQMb716SUImCKVFjVXorp
         MN39iCJynzZll5jjUaVIJbV2B33tfZXNq/c4JtxwaKfkbJGxivLcZMxMmaRQch8PAWo2
         yZh7+Yrrlp2JovT9Na0WDiQ5y80w+xl7AEUK27qNqQbBM6JEEfIci6os336dALZmIlIM
         oMB+8XdF2JrjfiSq/txwoWZ44Y0NzXPrVDXrHnKv7H6cLoIj83Yz5B05MGLTIPY453XL
         9mJZq/r1RTMQDuw7hjvNA/Hv3GHxZOXUYeHoNZe5LfDJLMW/TrLUbQw0jCWFuUipbxJq
         lbgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=rNqzV5fJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h65si3184032qkh.488.2017.08.03.14.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 14:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=rNqzV5fJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddO2s-0004e8-84
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 17:52:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddO1v-00046B-CL
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 17:51:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddO1q-0001wm-R7
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 17:51:43 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:38148)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddO1q-0001vT-Lh; Thu, 03 Aug 2017 17:51:38 -0400
Received: by mail-pf0-x242.google.com with SMTP id h75so1449601pfh.5;
	Thu, 03 Aug 2017 14:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RJ0t2d+8ZxBLI9FDLkCvRD6rWChvupS/1SsE5Thfrqc=;
	b=rNqzV5fJWl/7IPwk7jfUlkgqk1zvO6IGsAMKnwpKmZn5xWyjWDtVd1suqxnHCGTFSW
	oqxMja9O2XexjsUeM07G8AVm5mPgaaiTsl+YKpCdG3cFK4eAd8Um3fGWXFo533849NqX
	BLwqUEC6xYqg1fLxZvTD1Pfyx6QONM1OaZswdil03uYAMMOuxaM6aweYMnD2uSrAn0oT
	puYCgL6D78TX5FBH82OFBd4H4+y3p55nQrt1bcRObUeE7VtEFwr2lhNx/XVo/zEvZVP4
	QTyLdluSi+5c8ac+/n91hznHr63WiAvD6MaLa1aQrBLMcg4GBklso3Nn8azwMOf/W4I7
	6pTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RJ0t2d+8ZxBLI9FDLkCvRD6rWChvupS/1SsE5Thfrqc=;
	b=MxAE5/1DobIBZUJcuV5pmSq9yFl/8mgg4zjfTpaXFIS7kYm8yeQxyJ4/UuFXCHtSvD
	iBe+QsQlq+DR0+dVI/+CLRThaAZn7CpOMwnWCSe8hPxSuDAr/5oWQPVY/CgJcmx1UhMU
	4XAJ8jAQB4UW+/yzGsROMLT8OHxgwXGIw2fAfUUFuHNF5CIFNRLhMmlFULTxQSZ6ralt
	VygmGtWpqi5TnXjvqJn9LuKSVFuM2fJj3LWJZfJr1VZELPVd5+yY9KbnUdZOSNJZywVT
	Rbaov7aaN0hCaiUear3hjk3x+Cro4EC3pABgFj+TM3lX62rf76wlrHydCMylzXEAwqT3
	rQtg==
X-Gm-Message-State: AIVw1112Oi6ziBjnWPMPGns/+AzA+5NzHu3hlKyLQNXkqO3E7Jgdm0iB
	PtlIkLDnYFFmMg==
X-Received: by 10.84.232.13 with SMTP id h13mr309248plk.168.1501797097670;
	Thu, 03 Aug 2017 14:51:37 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	22sm23448874pfx.73.2017.08.03.14.51.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 14:51:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-9-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <80e9ff87-14d8-2e18-7c21-c1c7803b3a58@twiddle.net>
Date: Thu, 3 Aug 2017 14:51:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-devel] [PATCH 08/15] target/arm: Define and use XPSR bit
 masks
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fJMpVKPnhWs3

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> The M profile XPSR is almost the same format as the A profile CPSR,
> but not quite. Define some XPSR_* macros and use them where we
> definitely dealing with an XPSR rather than reusing the CPSR ones.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h    | 38 ++++++++++++++++++++++++++++----------
>  target/arm/helper.c | 15 ++++++++-------
>  2 files changed, 36 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

