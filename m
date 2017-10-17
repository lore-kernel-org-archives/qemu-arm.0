Received: by 10.223.197.9 with SMTP id q9csp4563955wrf;
        Tue, 17 Oct 2017 05:49:14 -0700 (PDT)
X-Received: by 10.55.79.74 with SMTP id d71mr12000342qkb.5.1508244554857;
        Tue, 17 Oct 2017 05:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508244554; cv=none;
        d=google.com; s=arc-20160816;
        b=YV825ni9/EdngbCqcGp/ogGgqKdTH83XfL+0Schv61cOAffwBbdNOHWG69vraNqeOz
         MQSRuLosZ8WG0e1RByB32p4++BT/NmSlwlHTzV9GYOsEF449ohRf7xHu8ST0Mq425P8N
         JUq3Q2pV+PuCZUCkUnH6RT09oxHnNbkp7ntEPpERKJa2jcxv04qcFf8ihXsnqzPazVFY
         o0eAe/weFMiZLx92GInSTlq4ZdoBaPb8CxYWLQK6jb1T3Nfy7fgps/nAEfkK/jzeFZZY
         eognb4setR/7Y4WpqWcWOgVErE0oggesSSOI/zJQaG3DEtjnb3RrF2y/IERyoZ7Vm4uo
         xO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Af9k4V2I+a0pHKKSS8phzxGxqzBz3YJJtS/EbXxPrSM=;
        b=RH5I5fZeEibGwZKtfDgfNsQr7T44cklBXVXFirBZp3TLpg8oedjKS7zc306JOij1qi
         fSWLkfnFHM4ZdI/R10z+W0Eoa1zXyeqigoaj291wDZxeX/DSoe7N7Y86Ccwf8uIdtHom
         B0NsuTn9scGmec62BFS16SHsnZaQE58mNbZ9NOh0NVN96ywsvI+L0tYb9gPlXptfGYH8
         kmUjOfdEciN1ZCMaxNm4eUmXH0a+lP7DSLugDbIr7LifYRy1hmb4/zKz5n6r1DTggSLp
         CrnQ3aIjtgEClQLBQx/W1xzgBB8Vb552G39RpKR+3lqxl6xI08p7mdZI4zpkUE0rB+9l
         Su/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gWWsdDb/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s47si279915qtg.164.2017.10.17.05.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 05:49:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gWWsdDb/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4RJ1-0003jo-H7
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 08:49:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4RIp-0003j9-Cl
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 08:49:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4RIo-0007nk-JI
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 08:48:59 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:51601)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4RIo-0007n5-Cc
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 08:48:58 -0400
Received: by mail-wm0-x22f.google.com with SMTP id f4so3738444wme.0
	for <qemu-arm@nongnu.org>; Tue, 17 Oct 2017 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Af9k4V2I+a0pHKKSS8phzxGxqzBz3YJJtS/EbXxPrSM=;
	b=gWWsdDb/W/KZLoj3Olo1IItz344dXquvKX3ZrKoneeBpMOWFxwlqYdkZXkTtzzwTdB
	YP0+0aw+pEQnFOaEc6srCFTLbS4sNSrymo1/rPPdWkifub4XKOK78JLtd607U1MYPdJ9
	xemL0rXaT0IqfUeAAGa4/YJ6PV4kvDovcNXKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Af9k4V2I+a0pHKKSS8phzxGxqzBz3YJJtS/EbXxPrSM=;
	b=qFwZQyP2wZfuifO3u/dFd0uJHEyuEkHJHNmzOSJ6U4eUqnEksnk+voheiDG96ugPWQ
	HvGzYHB7YRnBVYT4ZEQeS7M91zt3xbjPrtMUNqcuTfMSWYvczzXRHw7sfC9acGDhiw7D
	T/0desXvUae5iXPMBPb4qzOuK5kOSA41UfGkEQREuVqzVMj25Rtk37Y8Td1Du95N1ZaE
	1W29KFl9F8DyCBNdzw0RZBsIwjKF9ViaAVW/YnmbWu9VQNZT+EpTNXqjxa7nx1RvAgtz
	UfYTJ5WbyF9JWrKZ3ozFlCwr3vx0V14pEcTwmXnmoLMfoNcXAWR2L90zOiqkJ6v/srlA
	5JTA==
X-Gm-Message-State: AMCzsaVyKSk8xQHastUtmXOPL4L8sLq5xqyCE4gbIl4LAirMq9BQtH5X
	/zEPNWdzi+B/Lhsuiw8XNz0OUsqOR39XvthFXoEkEg==
X-Google-Smtp-Source: ABhQp+SIg20bN+pWtcuJ1p8kkrESjnlwkzRTu//ahBI5kw2uQ1X+9XamBUljcvkfc43NK+B6Dq0YSElE/PB92QkZuLo=
X-Received: by 10.28.23.3 with SMTP id 3mr3370877wmx.62.1508244537105; Tue, 17
	Oct 2017 05:48:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 05:48:36 -0700 (PDT)
In-Reply-To: <1492623684-25799-3-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
	<1492623684-25799-3-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 13:48:36 +0100
Message-ID: <CAFEAcA8jQCtXtgYhR0W_rmyLSNmFHqgc-WEy-Anbcj_PF5-4WQ@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-arm] [PATCH 02/13] target/arm: Check PMCNTEN for whether
 PMCCNTR is enabled
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Michael Spradling <mspradli@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c8iSdAdlvxNf

On 19 April 2017 at 18:41, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8cb7a94..8888391 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -964,7 +964,7 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
>  {
>      /* This does not support checking PMCCFILTR_EL0 register */
>
> -    if (!(env->cp15.c9_pmcr & PMCRE)) {
> +    if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31))) {
>          return false;
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
