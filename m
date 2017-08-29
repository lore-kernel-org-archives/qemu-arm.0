Received: by 10.223.188.70 with SMTP id a6csp6122396wrh;
        Tue, 29 Aug 2017 08:30:00 -0700 (PDT)
X-Received: by 10.200.25.218 with SMTP id s26mr6493617qtk.295.1504020599984;
        Tue, 29 Aug 2017 08:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504020599; cv=none;
        d=google.com; s=arc-20160816;
        b=hJ1yQ8omQoS+fdBQQv/XOzAa71dvNQ6oPrJjtfohBv32xUAETV0itGqgzzGsQV1vCE
         CaelfYvG+56mSE8nTw3/hCauCUOVMPwjWxeaYV0YdcKsAZybn6VvQm59iXQ4kh5NhU3f
         +tKjzrAgFVgyrDrHEUr3U2z1M9j62aRVCUsi6sZfvnCRdzKHmGTlcV8gQyPqKoqS/4Hi
         hQ6z6uWx7Pb6S3QrFEhK4qD4IMg57QG50w27WzNSu/CFz8g5IxzSqOaI3PTrFnVy8pcJ
         g4aSlHOoJdNLP8qcmuDDmSgxwP6WZed9RO2I1Xcv24Dqklz71h/vdSMSsq5I76w48un7
         Dz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=I3NcubL//tMSU7UPk3eAg4rfEj/O4BiG3j+gmxxhq8E=;
        b=oasnlxfyQW7sTMtNtaUJoQUYLS1lDNngRh4vSeIvYIAezQzpdE/O6p4mU6gaRDeDYK
         A25h9kyOoZpVDVcOgY/OEkSJFBx+DJAvx4hl8Nt25OqgZxLh4EzlNSQTn8sOHxiov5sY
         2hKRQmQ07RITNVawblrutAY9NagFUDxZRDt4EaBf9nLile/DCBMM/CT2ReUYwOJivu44
         cqyXi8wuSpPnDMm6uj/RFCJm2d+zUZViDJ1JdglsfkvBHa5b0bTsAdPnC9gSLuq9ZRJ2
         GlQdr5cpDrTp3BhFU1eJYE5nD16j5s7kjTLA/Ioolig3hntO5jSzRQim9JjbgVEO9/n8
         7zfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZYvRfg0x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22si3009586qth.443.2017.08.29.08.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 08:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZYvRfg0x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmiSj-0000u7-FG
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 11:29:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiSc-0000nC-EY
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:29:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiSZ-0002v0-B8
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:29:50 -0400
Received: from mail-pg0-x22a.google.com ([2607:f8b0:400e:c05::22a]:32922)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmiSZ-0002u8-5a
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:29:47 -0400
Received: by mail-pg0-x22a.google.com with SMTP id t3so11837620pgt.0
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=I3NcubL//tMSU7UPk3eAg4rfEj/O4BiG3j+gmxxhq8E=;
	b=ZYvRfg0xhvVcvQ0/vwANwDslIgNYmjiuIg/VGsFXILT/I10ko4AduLjdnuMGXreSZg
	YYGEC6vzBaI58fUOY7H6fV7P56zqmx+ql9U7PQV6IdmV68tVKL+Owj9z1m3ifGpFDB/B
	/WSBAVMNcdW+FHVBkCr/FGf2QrPS08kACGtqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=I3NcubL//tMSU7UPk3eAg4rfEj/O4BiG3j+gmxxhq8E=;
	b=thqAL0Ig1NP9neoot9FLk2UYbzZcQkhZzealNtg3+3iDOqC+oSWDFUZQ/6Ac1MN15n
	ijEWE3Xk5jbCy51REQmGe9hYNDb+BYq93Mav0frSjY4Vrtn5y9gfV0GHViRRxP6ixZk0
	EEmdBgLcXTFcTXqgQ3IG7ce1IcOO+BepQwGuu8gSE7NL3MPfxVx8zFG/xOkKenpKgxCg
	ja0I4Ker9UIPOfESF/TXbq/sI8lVHx8pTPdpXwIpoa8FdvGBDlVyWxMaJyv+CIdJqV0f
	kTYEI9c9/AFbNWmWXqjkBFQhmsUyh+4QVbfjNyVuyHNi1vqQpaH2iOU6Xi6WDGUtwL8j
	Of4g==
X-Gm-Message-State: AHYfb5ht+/7Ipo0l9goF+kgL4aOp4Kgkh5HLBlHLfAhSDmAPVU0xTyew
	z4bO7KJfsVeZhjH2
X-Received: by 10.84.141.1 with SMTP id 1mr911686plu.189.1504020586404;
	Tue, 29 Aug 2017 08:29:46 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	187sm5184567pgj.22.2017.08.29.08.29.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 08:29:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-5-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0ddcc01-ef6d-828a-8d6b-9c777c21c0e3@linaro.org>
Date: Tue, 29 Aug 2017 08:29:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/20] target/arm: Register
 second AddressSpace for secure v8M CPUs
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
X-TUID: rx+3L/uljrYJ

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> If a v8M CPU supports the security extension then we need to
> give it two AddressSpaces, the same way we do already for
> an A profile core with EL3.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

