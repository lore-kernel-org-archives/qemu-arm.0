Received: by 10.223.197.9 with SMTP id q9csp712110wrf;
        Thu, 5 Oct 2017 09:09:38 -0700 (PDT)
X-Received: by 10.55.24.170 with SMTP id 42mr20716888qky.220.1507219778372;
        Thu, 05 Oct 2017 09:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507219778; cv=none;
        d=google.com; s=arc-20160816;
        b=JBU+ydVLNQnUsg57WS9qUjSGeO6hoCSl7OHreh/K3zGtW9ZztlVvt+zumE42FpUgi3
         KxdBmT0Uco8iXxIjDHbbzhVlqrkpxm9Mgw/zscPdw1ZgEtyzjUcMBbfyuTRDLjJIXqYF
         tSV56pG0QEykST0qqUQGQn3ndszMpZZ2c6oEo7Xyu6sBlHsEioYdzZ41p8/PohyYsC0w
         qwGrfU5IIw1x5H2MjxqHaPO5TM9bNskpkWdAJMLUcW5FOSwYJyA8xA3LwLm3hnFEwTuL
         XRsOY3wPQUGcX835R6ry0pqMFMcR6mJkDvyMbVmUY/ZUzrpGKiNms9Z2IwLFNlOGKc5R
         EgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=71jISXS0iP2jq8iOwS4I4qBExCWRVaYoEuvJN0V0czo=;
        b=IlFtwMPwKIs5qKkyBu9eozU2T+7R7S/Ol7DYZMTiYwzwVPA285X2UKDgKtf+rCCfhq
         Qng5v+SuzGODK5h1cDjf3XgmzyG+IW4jZwyV1C5K24IEGoBJMcZosjbJ2BMDpUAS1t6M
         wbUa3pNJicGGdN+5RnghJmB3eIgzoZZlsNedyibRhqYRhYpqrNcOJxqpX2jgGSQLxOUn
         9EvlHrApG7zmBawq6HC3Cfv4/zehpR9d2eX0DX7beJdUnpziwpRi8XDpQGLaFkdy2Azq
         3iceKiaz2uzDL4DwFsR1O1nh44x4Akh/3mgW05AKRaAx03MLWas8Pb17ViJ7Y4udpGR9
         8gXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eC0IX1b2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c64si7803862qkd.468.2017.10.05.09.09.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 09:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eC0IX1b2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40704 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e08iP-0006HK-TH
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 12:09:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e08iG-0006Gw-2O
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:09:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e08iF-0004x3-6H
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:09:28 -0400
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:50275)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e08iF-0004wU-1p
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:09:27 -0400
Received: by mail-qt0-x22b.google.com with SMTP id f15so26337220qtf.7
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 09:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=71jISXS0iP2jq8iOwS4I4qBExCWRVaYoEuvJN0V0czo=;
	b=eC0IX1b2H+CgSs0qmQxUYsgag9fHGrnV5eM8v4z2/9G6+cs6UvrrkDacvbiQVlxPCU
	YGJV41aV9C3yExYCDmNcmJutAvp6Fk7vFBWvinraFOW5Wy8Tv/lSnu7fnCOzBS7MQU+L
	5dVIxFzymv3W3TZL8OmraG5dXNbbQ5z8xMGeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=71jISXS0iP2jq8iOwS4I4qBExCWRVaYoEuvJN0V0czo=;
	b=nEHi83WhkM6alS4kED9VEjXN++6Nl9VnXS5o4cRpvBgwaozkvjNwtaS4j1Nfzzj5T9
	3++pQZE0TkeI/J8r3+y6Z2Zuodw5fQQevczEiT+ioUAASPk4Lv+lIHM13uJDA9cf/akv
	ffjrNJVXMhKFEkovDxRHAx4x4ow63dV8xUcwUcSgJAIH30cJvc0W/q2sK2MgAsbVkxMH
	ySPxfdw86K12l0HERem3na6cdYTnMqv4ts94f5ILUHpicMb1+mirZWGuLjZ9iYC9p2jW
	K0Zq1ZBVo40/XkVC0ApUl6M4a4AYyy9gJcKf3GM9KY6jbjCr4Jmb8t5UZ3z9U3WPsIg8
	UH9A==
X-Gm-Message-State: AHPjjUhPQR1woJODsYnUy4J3QGxQIioyVRxxZZiPJ8dJJZHro77qnxbn
	IUaWMHDcfb2xyJb4ID9MH6xwNA==
X-Google-Smtp-Source: AOwi7QD+X1B0TYBv4uMgIVTllUenRWrhrZKsyfeXNE4HhFXfQ2UHPNF+aQr43Fdcs7ApTfmtqacfHw==
X-Received: by 10.129.65.76 with SMTP id f12mr20346751ywk.274.1507219766479;
	Thu, 05 Oct 2017 09:09:26 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	x185sm6724958ywa.73.2017.10.05.09.09.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 09:09:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-4-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f272860f-2822-34d7-2440-3aceb62f3149@linaro.org>
Date: Thu, 5 Oct 2017 12:09:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/20] target/arm: Prepare for
 CONTROL.SPSEL being nonzero in Handler mode
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
X-TUID: oGJ5a89wgc83

On 09/22/2017 10:59 AM, Peter Maydell wrote:
> In the v7M architecture, there is an invariant that if the CPU is
> in Handler mode then the CONTROL.SPSEL bit cannot be nonzero.
> This in turn means that the current stack pointer is always
> indicated by CONTROL.SPSEL, even though Handler mode always uses
> the Main stack pointer.
> 
> In v8M, this invariant is removed, and CONTROL.SPSEL may now
> be nonzero in Handler mode (though Handler mode still always
> uses the Main stack pointer). In preparation for this change,
> change how we handle this bit: rename switch_v7m_sp() to
> the now more accurate write_v7m_control_spsel(), and make it
> check both the handler mode state and the SPSEL bit.
> 
> Note that this implicitly changes the point at which we switch
> active SP on exception exit from before we pop the exception
> frame to after it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  8 ++++++-
>  hw/intc/armv7m_nvic.c |  2 +-
>  target/arm/helper.c   | 65 ++++++++++++++++++++++++++++++++++-----------------
>  3 files changed, 51 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

