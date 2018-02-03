Received: by 10.28.71.27 with SMTP id u27csp905062wma;
        Sat, 3 Feb 2018 13:26:36 -0800 (PST)
X-Google-Smtp-Source: AH8x22542iLVwEd5o8LVyx7ExDobIQgLxM91YGrY+dvj/RgIE5vmGYq8MBONgolAj/cRJfk/0aSc
X-Received: by 10.37.209.132 with SMTP id i126mr30636484ybg.29.1517693195944;
        Sat, 03 Feb 2018 13:26:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517693195; cv=none;
        d=google.com; s=arc-20160816;
        b=tay9Py22ISa8wpIDtWq1FT4wkjq+YxLMKz/0u+IKRFXMt2q7rTRU7/MUr5eKhXZxcu
         qmvJoPYwlvn/3NxcM2MpFzC7mmK0ucHC1njbV3Aa4tS6hsL5Su/yGUKTWOd7zllq2TRR
         5uSLLykIXRWuNNb7pQlirvWL1aeBLBT6PNfcsWYv62mduxWMyr8wUSFnAcisHgo91IC4
         QIgfYQPAUo0E82dUMQ5qqpL9ug7dGF6boPVwuqjBOnyjiL1D4z6BuhGzy0CebHJMz+Si
         D8Z+w40POPF9Hmr5H8zSsrjmjoUWKxtrxkpp2ae32ultromWdmNk5ZTFmw0MQk+dVs20
         RKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=LSedijmC3/lZ8k8z2v41ZTdi1cT8DtzfeW1dlZJJczE=;
        b=Q5PJZXuCtBuT01kr4yYEvpoP0mFGmqWNGtQoyPjH11aTdtEM8I6uIsDYA1O+2Ywbfz
         KWeya6Qb02Yfuko6dBjg27eO96SvIROCsDmaSkz5ObiJ/xghMzrAd7jkNWMANVNMO07s
         noiq1kvS1RqMQWvUZcq9+ZnM0iI+GlztSLmHCFkmn3ZGBPPIG+EiM/ZCZ9em4D7ABfBY
         TU8qnxmPpfk9zQudNSUhmYe6xdUq4kX6BYm2QdDDTSW/KTGO5GnTb5C5dmrwLbTaarK2
         lmqM7KgZ97yc1fLRtfYax67936QYw1Y3LRXJWv+ZHRDUFLX/XFU4H8QhhFKIekftIurg
         x7qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C9UhVASv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3si380780ybc.812.2018.02.03.13.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 13:26:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C9UhVASv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ei5KV-0005Sl-D2
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 16:26:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei5KN-0005S6-It
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:26:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei5KK-0006bE-Dd
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:26:27 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:40194)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ei5KK-0006aC-72
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:26:24 -0500
Received: by mail-pl0-x244.google.com with SMTP id g18so8971947plo.7
	for <qemu-arm@nongnu.org>; Sat, 03 Feb 2018 13:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LSedijmC3/lZ8k8z2v41ZTdi1cT8DtzfeW1dlZJJczE=;
	b=C9UhVASvHDYCMR4d6pYZLYZnwivtBsorFJcICSo6S5LQSL2Qhde5aSRlVT3NiT5EGy
	K6/bXbjso9PNJDxH8kwm2QlqZ1NMCICaD0nMY3Gfhj10/xJQR/nzTQn8rCoAlUtOmvRi
	L5ji2WuUZ59BmlMvPO0t1Xbo4UCx+KkXdkVow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LSedijmC3/lZ8k8z2v41ZTdi1cT8DtzfeW1dlZJJczE=;
	b=KcEtByIVV+nrXTOdl2drkhIHkNPvFEd7V6pa7EpxmJVt83pek9QaKSKfxGQSlbbVdl
	FtUUBAakxsjDBl78ZcWagDiq7mc32UcfmJRpsWT5BWQFyJYKoLDC7PyrW6mL5Cc19Rcp
	ZXavK8/yn9v8SubyeooNDuDcNLT7O95FWL7soyLCL0FukU0qPDsLVayw/iiISxH+VQoa
	3/XR7wDqCcW4PvbA1W3k0Psxz3h+Q8OPgKJF4JQuHxhjGRNee1Z+QUMj+yRlRlt7m3C4
	zHDyqByvgMPUtaYR1H2ormrF+0/1pV5Jg3jE9yDmsymormeD35jcFDxIHBkuBPt7DuhS
	QhzA==
X-Gm-Message-State: AKwxytej6dmwiVCNEaiJzPGyubj3xXtJMTmonNS/POISBKX9tXhdTsvP
	esNnVwvUHVg3MabLf/naXm6Oxg==
X-Received: by 2002:a17:902:6b83:: with SMTP id
	p3-v6mr3660827plk.18.1517693183218; 
	Sat, 03 Feb 2018 13:26:23 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	e82sm4759489pfh.53.2018.02.03.13.26.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Feb 2018 13:26:22 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-6-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <918763b8-f185-66bc-c712-6acdd9445960@linaro.org>
Date: Sat, 3 Feb 2018 13:26:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517324542-6607-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/7] target/arm: Make
 v7m_push_callee_stack() honour MPU
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
X-TUID: r3sdCfr1NVfR

On 01/30/2018 07:02 AM, Peter Maydell wrote:
> Make v7m_push_callee_stack() honour the MPU by using the
> new v7m_stack_write() function. We return a flag to indicate
> whether the pushes failed, which we can then use in
> v7m_exception_taken() to cause us to handle the derived
> exception correctly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 64 ++++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 49 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
