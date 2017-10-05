Received: by 10.223.197.9 with SMTP id q9csp862843wrf;
        Thu, 5 Oct 2017 12:02:41 -0700 (PDT)
X-Received: by 10.55.95.71 with SMTP id t68mr32008266qkb.233.1507230161477;
        Thu, 05 Oct 2017 12:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507230161; cv=none;
        d=google.com; s=arc-20160816;
        b=pdApurkNtXOLT7FbHHTDqR1quG/PiQOUvnrFB/2VIAAhymvnKXfscHjSFRFYCl3mNB
         NZMw7ubJR1G41MwS95YjnJ0NNBdCsmXfRS0EQY+ku3R3Y7+bWhplGtlyIWUfv/A0n8pg
         mmPacf703j7y5g5bIni1cpPu+JiJ3hTwtLntlsXLSR7KtAXjMkOZYTRAkqTR9HNhXHgv
         IdicFPy+41zFEJXn/KT4e5MiPcAgfBXnLqAlhqezijBqIVXbThAHJnDIqpbfbfD0rO1V
         w00J23hx9PZ7SHrFFNkDyRpK1x+xTlioK3w2b0TzHfn0GP1HXOWQGNisbZm/7/SwjDUi
         wvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=bXsvsNj9PHV8O045xIHiqTpoxQ6iQCA/yebyHE/gB7g=;
        b=TOyLmgn3D7XrOYEz3Q1HYDhNHb6tRNR9rgvi/VroNw53hNQTxFYx2TGD29qAsieNW/
         WskYZ+INxg2HoFyA/zyVqySg6zEGWNtLdHGHOa0A997FbU/7dnseA+5Fu1+Zn+Q1/okB
         HDANNZJNAh347NALUFexwUj7wRy2hOO4XwX2WrfyKGRy8VnKzJmEerhmA4XX+5szygDV
         W8oMBhbjZl5ow8AZoyYyPcKr/DmJfYoq8zlwKdZVKTEEs58+rgZsHa1uKDUYfZpWMbOz
         +pMG3WY36kV1mLGOmACqPuChc/6o5Sf00gprzIlPI6GezL8hcbqMTqU48/FG1vPjfG94
         cUDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VvYhBS1Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si15913801qtm.280.2017.10.05.12.02.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 12:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VvYhBS1Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0BPt-0007Op-2i
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 15:02:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0BOf-0006fB-1N
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 15:01:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0BOe-0000is-DN
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 15:01:25 -0400
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:43773)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e0BOe-0000iX-8J
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 15:01:24 -0400
Received: by mail-qt0-x22e.google.com with SMTP id a43so21384259qta.0
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 12:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=bXsvsNj9PHV8O045xIHiqTpoxQ6iQCA/yebyHE/gB7g=;
	b=VvYhBS1QnyaZt+DruxmFPSDvodABGgl9rtfPG7EFay5/dxB/jOwcZpSjew9JCrSW5w
	LSCtoZe562gkMNbGUE3fe7FtagR00O08w8eOWrI+fLk1ASbv1EqdtaPZdgnl/7LNvTtR
	EEUHqgh7wdsLkqqojBJ3YmIQyH0yt5AFL/d44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bXsvsNj9PHV8O045xIHiqTpoxQ6iQCA/yebyHE/gB7g=;
	b=ca970kgixrz+5yx1WXX6dJYGLXIttJzfN5opZSUavG9Gm+DD0fcRCRNknpjCmQCM/K
	xXgg9hzCQzc2Wb947XoWGELSOE6oExx/tXQxYd0oGeZHGkNPTFyQv+Ff8y5CENsdQ01A
	rDdidZyhjqY56fgVYWC3gieM1U341cKco4yFv7ajOpvEzjxpWa5sE2yuddeMcx3E0Huv
	DzxXFihj+nRBKUVOt5xr/XAKQAE4OLBb0qa5VZv5CtlBuKM3W8yBRL/Pe4s3aMKtgDP/
	TlRSh6fWl/Zmp2m+E98ohgjx3+FfGiwvAG7M0INjvKUMuoWyQSTC72JF26UpiO+wU/Pj
	AG7g==
X-Gm-Message-State: AMCzsaUKm3+ryVJ7HNzKYEHsuV+HzKNgzMxGnv7FMH40xMRlezxcv9Sl
	g/dNG50VsJexc9AoJK0UE+QT8Q==
X-Google-Smtp-Source: AOwi7QDleT6vQcCIyLks5+M4UiFA9FjRezibAINMX5xr6VST2zd5I3N4M4hrDUJutX74yU9lkQLj6w==
X-Received: by 10.37.178.35 with SMTP id i35mr5400028ybj.175.1507230083567;
	Thu, 05 Oct 2017 12:01:23 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id c74sm173708ywh.19.2017.10.05.12.01.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 12:01:22 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-21-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e3d42e9-a660-6a8a-067a-f31a93ad669a@linaro.org>
Date: Thu, 5 Oct 2017 15:01:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-21-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 20/20] nvic: Add missing code
 for writing SHCSR.HARDFAULTPENDED bit
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
X-TUID: cuTVZTLXVM+u

On 09/22/2017 11:00 AM, Peter Maydell wrote:
> When we added support for the new SHCSR bits in v8M in commit
> 437d59c17e9 the code to support writing to the new HARDFAULTPENDED
> bit was accidentally only added for non-secure writes; the
> secure banked version of the bit should also be writable.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
