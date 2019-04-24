Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4057732wrx;
        Tue, 23 Apr 2019 17:08:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXjaDsoUTrDOu0kcXMT3fN2/bR6lBM+yKbPqWtybcYMDvlSlvlfaPUee049I8T8hW0/W4e
X-Received: by 2002:a7b:c245:: with SMTP id b5mr4180689wmj.81.1556064499955;
        Tue, 23 Apr 2019 17:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556064499; cv=none;
        d=google.com; s=arc-20160816;
        b=TG4+XnKfYQ7sKLVniTjRRROQk5PS25xZgBMU7UoQpsCtm/Mqon09oKunyp+5J203JW
         7mhGOEkyVhZh8qtUSVDKwNjAIDzbJk6Mms17k1X4fYsK3kqgXI+qOjhr3Pu3pN278Cyc
         m+f2laD4lmFKQWbrYUDkAR3hs/KtB7diHYG4wDGA8WXV8QRynzd+yzZ8SNRj6czyWUBD
         H5yAj4OXcorzmwowlRGH74FKJWSYsOktBPcmSn8kc8l50K3c6q72HJqLvUjJwnoUEACh
         9bWcpYwR3JTUAJ6fGKvHMD3GYwNbaSCFWuAf34SLwTZM4RIJkuCQAycNVXBAtX4fOGVH
         rT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ndGQwCPP/chzUE9tD3/wdVZGVxUfX+fK6E6PsqQsiEI=;
        b=dZJgrvHB611LeJ4qXjR6QKyKUWwoWtLZiJG3CBDHxB0J2s4g7XzDHsYW6zaCawEEP1
         2123Epts+tbHqIvIb6UguaF4JXP/JSMEZyKafxu48YsxvdaHVMrpFHhUcFcT5DUdSO3X
         uIBQfrHhNcfzU125InHMyeNU0bEMej3aW4y4nm5LZDEdrm46JzU6Xr/di42iCOULlpRs
         i2EHsRH9NcCvJPxClqdgIgXK9R+JrTQ3Wc80hsHQpbf0GdMMDejMbp4GTz3qENQ3DgQp
         x5yTZCYkrc9x/f05Wk7srhvqjlCo/4dK6iFqdgV0vwwnqmDaN3AJrhnbfRKdYs+YWJQL
         jMjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y19iwTft;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si12806918wrv.444.2019.04.23.17.08.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 17:08:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y19iwTft;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ5SV-0003Qp-2G
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 20:08:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ5SJ-0003Pv-Mw
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 20:08:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ5SI-0001Ib-Ip
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 20:08:07 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ5SI-0001HN-AY
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 20:08:06 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 85so8431057pgc.3
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 17:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ndGQwCPP/chzUE9tD3/wdVZGVxUfX+fK6E6PsqQsiEI=;
	b=y19iwTftv4iJ1P2LlcK1Fpey9lEI/o2U7jXpCRRNAjW0UdE6cgJ1tZN9Xr/i1CaSYu
	iA6U97GLKx0RUjupkqO0JjPhsWnhV2AbEXuO53j2ZQ3xBOi+G85/S6F9Dyu2m7rHDhiW
	Br0kJ5gMSjkTK059thgT9dwnhUJVVFxbOypNY7B7Qz06HtkPANdzqHXnoRwkjMrM4lLz
	6dr2Fs/LbEmAobBzn7Wn82Yyn0tYofUxk8agLFoH6jB6Vyq9Kr5/C+OlEObe4PyMjpsx
	YJYfUkT1muHFi9cWwHkFWnV+WOa44QEmVbPcaPb47xRbCN5Txin7l0RFTXAIgA5jZvRF
	j2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ndGQwCPP/chzUE9tD3/wdVZGVxUfX+fK6E6PsqQsiEI=;
	b=LvgAkJ6Z6wpm+NZT9NhDeGDdKwWIFWezRiG62zbL7RqlEL7DIEMkFjdC4R/oWQVCFm
	4PBKPAiJzGQRdrztHrSGQB3ipDzhSKuj4XylfJqwJG5+iS5mKxn1F0qdJYhklKssLEEO
	Z9KpSmj2p8aQ6BE2TRQP/ZvaxG56GNBOF/ootsgMn5m7BCs+eqQnU8J6yLC05PZDJGlQ
	Tih+a21mBD7XqB8U0WXmDYacXedFhPAVLxfq/vIwXhHFtJ6dRKouk4gdQaXeM1kMMmzA
	frfPXhxEC4z120NL6GKO0Mn1yuZo1CUfukb2ds7PlYTw3EAWOfwgFu+LRwBtGD6RGcAY
	RrJQ==
X-Gm-Message-State: APjAAAVcCZo/eGWWM391V8m2aFw/2gNPZhGECYWPe+V7XCQhmiMJuY0I
	zArRDrs8fG09C9tvcN0Cd1WlUw==
X-Received: by 2002:a63:6b08:: with SMTP id g8mr27508524pgc.211.1556064484706; 
	Tue, 23 Apr 2019 17:08:04 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	d3sm22876992pfn.113.2019.04.23.17.08.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 17:08:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b888f650-cf17-b249-ecb9-7a9b9c2ae258@linaro.org>
Date: Tue, 23 Apr 2019 17:08:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52a
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 19/26] target/arm: Activate
 M-profile floating point context when FPCCR.ASPEN is set
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sVrNikNwfwLm

On 4/16/19 5:57 AM, Peter Maydell wrote:
> The M-profile FPCCR.ASPEN bit indicates that automatic floating-point
> context preservation is enabled. Before executing any floating-point
> instruction, if FPCCR.ASPEN is set and the CONTROL FPCA/SFPA bits
> indicate that there is no active floating point context then we
> must create a new context (by initializing FPSCR and setting
> FPCA/SFPA to indicate that the context is now active). In the
> pseudocode this is handled by ExecuteFPCheck().
> 
> Implement this with a new TB flag which tracks whether we
> need to create a new FP context.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       |  2 ++
>  target/arm/translate.h |  1 +
>  target/arm/helper.c    | 13 +++++++++++++
>  target/arm/translate.c | 29 +++++++++++++++++++++++++++++
>  4 files changed, 45 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

