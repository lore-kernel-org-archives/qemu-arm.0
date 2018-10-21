Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1765817wrt;
        Sun, 21 Oct 2018 06:22:36 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62pBq0oRk+TFQJwr99m2XWTbE8cVOGoC5aHZ8zZZOlj3dZyX1tUUt3g3gui6Nf7pkJ5WAKw
X-Received: by 2002:ac8:5146:: with SMTP id h6-v6mr35379814qtn.216.1540128156439;
        Sun, 21 Oct 2018 06:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540128156; cv=none;
        d=google.com; s=arc-20160816;
        b=PcFw3oVHXiNZ8dBczhfAF/XvmrP7MDGmATh0QVldCVpV+MI9Qw5d1RkkIW9/xQ2Onf
         Jdv9bbx3WiAfXhg0Fen28dhbudXYRMX0fn/rY93SC42XlioD0lwCPYOjmhVR9x9ndVac
         QPny571qziXsiM2TEmfc3ZtuWWMMMdaLwWTarNs4bDPNCIGc4ICDh+upfSpDiUl/KY/W
         aOxV1Xfdpt1NsI6j4G3Mc7OrAxX0yap5TQoDzvtPVEMBXRLRePWAOQFr3o9zjSK56y4S
         iQr9qa/F/7OM5GUDhNBRIXLAQl8FZK+ZfzZQHEFhEp0zeMlvgBYLi+ZHGVQwwPsDpA2A
         q2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=jeD5WJc5GV6CCQIYk/Lqb0H2lj88iMQ30ezdo45yb+w=;
        b=wsOXheucrrYRAS2KRhiYioSVqHyQUqnsxKexqKmd0lLUdYOCsP9mR4gkGZDawqNMFg
         U18avCya/a7E+Eu/V+YoUfsAe3UyfC/amD/LDYNJwxIJTaDzTVvRyhWL8kDa8lwIcnjh
         mDIPMXEVHvTcyQ/s/7WjdE3ZKBUJHQSj8b2eIi3eXCXwub92njQsNuPw8sB9Qroz+6LQ
         a8EFWYGviwMqVvZG/iP+Fsh9w/YLbT4Xg3RDkl5CyAraeuDt+Wq2DPyh0LEdxC/a5oWc
         X6M3mVSSi4uUx07iGf1OScIQUWCxAMiXH9oEKCLMUHNfs6WObgwwHGVOtZ7k5z9wjISX
         9WIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EmtS0H1X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w8si2736525qvc.170.2018.10.21.06.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Oct 2018 06:22:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EmtS0H1X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEDgh-0002bL-Sg
	for alex.bennee@linaro.org; Sun, 21 Oct 2018 09:22:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gEDg8-0002ZB-9I
	for qemu-devel@nongnu.org; Sun, 21 Oct 2018 09:22:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gEDg7-0004Wj-Jd
	for qemu-devel@nongnu.org; Sun, 21 Oct 2018 09:22:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gEDg7-0004WH-BI
	for qemu-devel@nongnu.org; Sun, 21 Oct 2018 09:21:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id l6-v6so41618448wrt.1
	for <qemu-devel@nongnu.org>; Sun, 21 Oct 2018 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jeD5WJc5GV6CCQIYk/Lqb0H2lj88iMQ30ezdo45yb+w=;
	b=EmtS0H1XWhTJAY7H+HHJNWQOIcemn5jDQ+stbmcAOGIubfbyt3AztBBxbEvGDyLxNC
	Zlj4sOTzVYIfNIYahl5c2IKUK+kNc2NKzkJ4M673GfCbhdNxxgfzrY2z+mPQf5Cfwjwz
	/ORVUstVN+Vbfkn+gqmbPwEfvRqc5xOJKRPjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jeD5WJc5GV6CCQIYk/Lqb0H2lj88iMQ30ezdo45yb+w=;
	b=Ra2clYotv3BoLyejdC7SW96GXDwKVUGTw7sr87XknzgFA6CV0Rv69i6nvPkcj+H+OT
	1/5gX33yYDtCI6+cIXwohEDmpt0/JKKFc97M/1NCQg32FZEKFzJl1D5CjElVRSNw9ZgV
	1eHx6hHmar9LL6D4bcgxvR/OJI11IDQvbEet4L/xjqxssznkTIfnQyeKZxwalU2fi0MQ
	uOkBYMMiiP5yHfArNRgiWMrTol/cP/0GSjhDKqmo9yqm+LxFhCxQe5l1anmZUudysVAi
	U9G/oOPi0If3vi0n9VL7DEU2D+RUCALxUycvviXUSQNIcGiZlafiHlibPcvw40gSRaLL
	cayg==
X-Gm-Message-State: ABuFfogoof59j/2G49X2rkDN451R5zSeBmmDk0NEFXA6dMORz8/fdG/S
	9e3eePbggrHYk/3KYn/3RbA/QQ==
X-Received: by 2002:a5d:568b:: with SMTP id
	f11-v6mr16429234wrv.301.1540128118244; 
	Sun, 21 Oct 2018 06:21:58 -0700 (PDT)
Received: from cloudburst.twiddle.net ([37.205.61.206])
	by smtp.gmail.com with ESMTPSA id
	p15-v6sm1387479wrm.41.2018.10.21.06.21.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Oct 2018 06:21:57 -0700 (PDT)
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <20181019010625.25294-1-cota@braap.org>
	<20181019010625.25294-30-cota@braap.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <50ad13eb-5983-c21a-3db6-f85434519cca@linaro.org>
Date: Sun, 21 Oct 2018 14:21:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181019010625.25294-30-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: Re: [Qemu-devel] [RFC v3 29/56] arm: convert to
 cpu_interrupt_request
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TlwDXfm1Ggip

On 10/19/18 2:05 AM, Emilio G. Cota wrote:
> +++ b/target/arm/helper.c
> @@ -1295,12 +1295,14 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>      CPUState *cs = ENV_GET_CPU(env);
>      uint64_t ret = 0;
>  
> -    if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
> +    cpu_mutex_lock(cs);
> +    if (cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD) {
>          ret |= CPSR_I;
>      }
> -    if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
> +    if (cpu_interrupt_request(cs) & CPU_INTERRUPT_FIQ) {
>          ret |= CPSR_F;
>      }
> +    cpu_mutex_unlock(cs);
>      /* External aborts are not possible in QEMU so A bit is always clear */
>      return ret;
>  }

I think simply reading cpu_interrupt_request once into a local variable is
better, and no need for extra locking then.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

