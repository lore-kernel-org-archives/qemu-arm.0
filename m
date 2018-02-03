Received: by 10.28.71.27 with SMTP id u27csp888430wma;
        Sat, 3 Feb 2018 13:02:03 -0800 (PST)
X-Google-Smtp-Source: AH8x227bcaWuyqeGuAVchxoSgrbVPbvdqaa65a9A+RBgHuWYFlhJJtxWFtNhQ8e7PFhuCDkY8T/W
X-Received: by 10.129.160.143 with SMTP id x137mr28970803ywg.299.1517691723093;
        Sat, 03 Feb 2018 13:02:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517691723; cv=none;
        d=google.com; s=arc-20160816;
        b=GgxnK1QCiGOANg017ECfpTVhVoZCCwX4SXnk8usK65xmjSPxy4mLe314wtrogcfOAT
         AbdYk53qPQ12cWdY/9Y/C3guLVN0cK+ZE6OfLSxlRGIdnafx4kQRvJBQQJnLGPt4keRZ
         R40HgY6t8Ct9zKuDSZIBi46t4sZ3N2VQOeCeX82i//jOL83rfRGtgyznLKMHz9F6wYJ9
         aYu9Ji0cAYbOGVFF0IyWSmxtArWXMWPU2N5LveyMISNpDwt7heAmrqcMoqguECh0exTV
         NAP9xAH9qxZFWUKEb/lrwjS+xw6UeS7RL5Amjd3b2JIxFh4nihOQbv0ukxV9wB/GiO32
         pJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=MgEtFYuc+LGmt024Hu5iSQUCOlJ9tXNp5PKgNjM874A=;
        b=LOewBWo2DKHAGxPrHk0PnLXCxpo57A0cPugEW9sHnShTEuDxvFi6tNyfHngiMZUK4k
         lQM7287typ37LplQkqC6ajgGEIn4+roJrvYGLZYwwfbGQok89iPLnU2ZgyBaRKsn0kxp
         U44mLKWZjo1I6q6Emxdu/1njO8twvUiXaKHglEZ1Y9yyBALR1ZHOdlT7BDlAVaEmVglr
         ZTu3JgEt1oqWChtc2vHuXqvJ9JdJ26xnbeFpHQneRdoznlRMUPM/815KZ8enJFF4vfdB
         +xXJrFNjwSH/wKEzEawmpEPn5WIYN+5m3Yaat/CcMLXWxhkv1ZgpoiWvENlJchkkZpVd
         cuNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hlun1F00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b188si436100ywa.625.2018.02.03.13.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 13:02:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hlun1F00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ei4wk-0000nY-Ju
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 16:02:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei4wU-0000lY-Hn
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:01:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei4wP-0007Hd-Nv
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:01:46 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:40237)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ei4wP-0007HS-I2
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:01:41 -0500
Received: by mail-pf0-x244.google.com with SMTP id a14so5489717pfi.7
	for <qemu-arm@nongnu.org>; Sat, 03 Feb 2018 13:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MgEtFYuc+LGmt024Hu5iSQUCOlJ9tXNp5PKgNjM874A=;
	b=hlun1F00kFh6h53L8ZfqYouHKRKK+sCOfBocIax9r7h7LYtisG+hevbUWmgkVRN+lx
	+PXDrbKbI4q6/OxwaktrNDed9PtkC/nuWU3Ck/02dlICqFcmVQ18A0avh/im5gVHZjWE
	4AVOTDTdTCBYw5zO2jVK7lpWEPy3roS79oiX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MgEtFYuc+LGmt024Hu5iSQUCOlJ9tXNp5PKgNjM874A=;
	b=I2OUYwsuh+jmaSEJ527JcGLr1jrWC4gVQnNRC45v8nrMKsuGX5kRDyKIbqCBlzbNWP
	TKCYbrnhFIMLT3IXlT3AvBUGkiFXYty75aV4hzSAFLdApJE55s/GsNnkGqL5Vt+MLaAS
	S+fzKSS/5mtDivO293W1f+y/vRHDHi4fxFjT8GTFNsaEYbdJ6kit0xTjFsd3QFtiAr4n
	h0sejYRbME1SSItsU+bhCpXkhHP5wcxZXtqcXRf3MyNzJ3sd3zY4eMq3br3waz9KP3t4
	Pssh302urnrt7lhyCAu4KcsJVkMKOHFAkTc45v7G56m8EHlznloM4BTlKNmnt6rZ8kLJ
	HO3Q==
X-Gm-Message-State: AKwxytfHejkRAiIlxTURUpt+MyL0KrFZRnO9Z+b4Iwdw2FnASWHABBqf
	ydsUERSGTWxX9G0XIZK4hlSM0w==
X-Received: by 10.99.122.93 with SMTP id j29mr4677664pgn.351.1517691700423;
	Sat, 03 Feb 2018 13:01:40 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	p73sm10808245pfa.109.2018.02.03.13.01.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Feb 2018 13:01:39 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3b46f5ca-e789-ac0b-04f2-1df7fc0b7633@linaro.org>
Date: Sat, 3 Feb 2018 13:01:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517324542-6607-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/7] target/arm: Add
 armv7m_nvic_set_pending_derived()
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
X-TUID: 9Dn+uwiyWgXG

On 01/30/2018 07:02 AM, Peter Maydell wrote:
> In order to support derived exceptions (exceptions generated in
> the course of trying to take an exception), we need to be able
> to handle prioritizing whether to take the original exception
> or the derived exception.
> 
> We do this by introducing a new function
> armv7m_nvic_set_pending_derived() which the exception-taking code in
> helper.c will call when a derived exception occurs.  Derived
> exceptions are dealt with mostly like normal pending exceptions, so
> we share the implementation with the armv7m_nvic_set_pending()
> function.
> 
> Note that the way we structure this is significantly different
> from the v8M Arm ARM pseudocode: that does all the prioritization
> logic in the DerivedLateArrival() function, whereas we choose to
> let the existing "identify highest priority exception" logic
> do the prioritization for us. The effect is the same, though.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 13 ++++++++++
>  hw/intc/armv7m_nvic.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  hw/intc/trace-events  |  2 +-
>  3 files changed, 80 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
