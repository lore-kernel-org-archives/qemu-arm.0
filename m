Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1249666wrd;
        Thu, 23 Aug 2018 07:38:35 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxGEXGHywnBmfiSjoPv020R28iPSiSuoMSaq9HVlqFf7xw6lCoLqyNh9PK4qa/ecVkgZSvy
X-Received: by 2002:ac8:1b83:: with SMTP id z3-v6mr16744630qtj.321.1535035115633;
        Thu, 23 Aug 2018 07:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535035115; cv=none;
        d=google.com; s=arc-20160816;
        b=gjsd2Cf8oa8D1yrMsk2kQGZW7ezmNanfneeq8bWWLQss+AAQppK2Uwl3CvTwJxWRc6
         pR4IBzm+jrSqNwswRn1HFqOmIMbGN2yU+JjK/YqXxI3NfrvQzCqPkKj8pOQpOIFB002E
         d44K/rinJ5md7td9UtoYkBKP93LbE/Ipw9RBQMR9wyfgWtLzPaxhEPmTo7FNt881t2up
         aN+b8JlLlH4CfYRHVABxLWwZnVP0Ex3moFUsqsnrC8l4VdM7lRyfnTcNpXVWmf7NS/Ea
         LcnIjQqAzv0bVgmtSmbrzecNzW8xl4eYOsV9cev5N7fYf0GZHBdmY3WlZ01vntibVCmz
         f9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ZpM+TEGvoil4bH3Jgnv/wbxmo6sI/j2DnLgLrs+s/P0=;
        b=D2ZIQbCm97GzKnbjxCMgnuOVmizSHNidyxjpZB3RWRlqBfue9DIGd86cv/MxIE/XSg
         mmFPQ4yx584EeDL0z2YH4qG2efeJEZ5mMV8Z1ZOiSAcRv6wD74joOupzdnJUpaooHobl
         KcZgqqMaKLND46eXK2Qn/v7vj1MeAIlXG/OAaD19NXp3P5vtWyYwI/ZrvolfuQaQe8yH
         gTjPEYjNg7olEXfBJQCUtpyRCS/JCSbahwe14mKv/BXcu5LQOVYwn06TzF/8vvRUvVXV
         S2qdNvEdV7etSLh7iZ3nXbbbf138OH7v9Wzq8mxZ9h9hxyoMM2Uwt58RGNy8sX/C4x73
         dJGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZqX8631a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v15-v6si4598062qkf.370.2018.08.23.07.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 07:38:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZqX8631a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsqkt-0007YK-2S
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 10:38:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqRw-0004zk-4M
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:19:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqRr-0004ZP-Se
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:19:00 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45525)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fsqRr-0004Yu-Jt
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 10:18:55 -0400
Received: by mail-pg1-x542.google.com with SMTP id m4-v6so2106688pgv.12
	for <qemu-devel@nongnu.org>; Thu, 23 Aug 2018 07:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZpM+TEGvoil4bH3Jgnv/wbxmo6sI/j2DnLgLrs+s/P0=;
	b=ZqX8631adTDCyXmz/ynkAgZ/4nXru08cuGygMTD2eqbBiW8f/wRdLvJX9tHwXlAlut
	8i0f0MNkDFn2Wh5uPBBQ20IuzS6T1qKPCexn8CBXcetWDGtzwZEPj9xbuKvqBLogH/GX
	9Fq9+dEZ2pHs0OerxiaaerQoz1LHmM7cY4nec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZpM+TEGvoil4bH3Jgnv/wbxmo6sI/j2DnLgLrs+s/P0=;
	b=qHrUA9ngRA4jz2Zgiy1ET8t8vWbFBUmdBHw9GyJyhBdBEZZ5IMMW7YkO5bafSMXE/7
	cWfMZAaTq1gf0tKti/ApAFwKI5OwOVo7SHBqO/Uadh7d7gcNBGR7lfz0+BIRuvzuxTW7
	j/vkCe90u1B2L56na77Jw/MwfkeWvkRbSvEqUb9vH7lqjsqOdS+kAlfaI2j3LkY0Uuo7
	o2wrJhbeYgDX3lQu2XqnvQ5d+W8e4yMbYcS4c6KElr0ZEG72BDeUP4uKW4ttDK+Rb/4/
	Q6RoMJbbgg07zGtkxmuwaS5bNsU9XAwtxFKe0Jy4jSD59G20yAvCFDnySxELAWE7wZdV
	p3Gw==
X-Gm-Message-State: AOUpUlF/QRXT0BIL4bwsQjl0Exp5pR13lyL54MoALdhgGfySSD0Unrfv
	flqYnEDkh+1QjCqoVw+o4jA6cw==
X-Received: by 2002:a63:105c:: with SMTP id
	28-v6mr16583308pgq.254.1535033934557; 
	Thu, 23 Aug 2018 07:18:54 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	g15-v6sm13723989pfg.98.2018.08.23.07.18.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 07:18:53 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ea5e417a-c7d1-ec50-ac75-ed497451ed6b@linaro.org>
Date: Thu, 23 Aug 2018 07:18:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH 07/22] hw/arm/iotkit: Wire up the S32KTIMER
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bDaP0bBNx5t/

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> The IoTKit has a CMSDK timer device that runs on the S32KCLK.
> Create this and wire it up.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/arm/iotkit.h | 2 +-
>  hw/arm/iotkit.c         | 9 +++++----
>  2 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

