Received: by 10.223.197.9 with SMTP id q9csp4641104wrf;
        Tue, 17 Oct 2017 07:08:00 -0700 (PDT)
X-Received: by 10.200.53.34 with SMTP id y31mr20162527qtb.206.1508249280855;
        Tue, 17 Oct 2017 07:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508249280; cv=none;
        d=google.com; s=arc-20160816;
        b=hyfwU7Pf8acftGDNEZzHSyZWtXjHToDkxyB3gCffKLgnSqSqvTG1jH0O76Yhsl5Yhj
         g6DV1zdSMJfuFbZfk8Rjgxj82og9KAtKSGzxEXL4UfGNm7m6n8pYLCWHOCqRXCNmuZ62
         bfKCXg0dIZkw/DrC+Qamkh04+YiYF9zcPl1rxP3ia+3CSc3qQBZp69u+3wvlflkL14Lc
         DChTWouldvPIny8e3bof63hV+YbVd4RlSnnjz/4OGVQ3NNXDHpGEHgOXWNpRZONoBUvq
         mx+jmVkNzD75a3YlblTqRawJnwSIz7AgYv2fE+E3I+ruAHV3dJq8vr8CJ8MAJKaritNH
         /q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=LITTi9V9blphJdBkFcScJtO8TCPmIpLiWClxNeN4Rqw=;
        b=k48ThGJ5D8HEXZhHCrGOH7/wsuuXe6xAGqWbSilI/p6L2zUPn7U15IaRLoXOSXs+sY
         z+kJLVi+DLOCm5Gnlja4AOfTDmxj6QWDn0mV7FFBbXtXxZ1OPe3j7OuyVcm4XiolRb8U
         BFFBWBoWfrj4pc8x5RajEhbDtR2jIMQapmKsqejVHTv1xkhQgrZJt5xkZbPY7z/hEeJf
         Rn69XTY2tlZriQUDap66xNmAGAMSr6SakQ0tMe4ZX3//rbsQK0Nn3bj/rfgf3gVJ8S8/
         9I/A4EEsjY2MnMDqQVJ4nZf3tlOZJNv/yKcsSQCqStjpaMetVgd3f3t3Tb+hQ70f2/pF
         PQ1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VPn5vzsH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i29si731989qtc.54.2017.10.17.07.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 07:08:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VPn5vzsH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39721 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4SXG-0000C9-E6
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 10:07:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4SUK-0006Kl-H6
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 10:04:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4SUF-0004Jz-Tz
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 10:04:56 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:51597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4SUF-0004Hh-OO
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 10:04:51 -0400
Received: by mail-wm0-x233.google.com with SMTP id f4so4218290wme.0
	for <qemu-arm@nongnu.org>; Tue, 17 Oct 2017 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LITTi9V9blphJdBkFcScJtO8TCPmIpLiWClxNeN4Rqw=;
	b=VPn5vzsHy7wYjz4inAEuijTuOfU5dlYWvMPssf8Wu4QMCbaB1MBkCac4OnqiRdN07V
	NNxf603vbXn5AEhNhkh/r/bblr5etjoeYChapBJnZ7Sevs0ADn/DpongAT8LNUkx64hH
	kgF7viUb44qztlGGFmpYuUQoY+wrFFv8TMm6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LITTi9V9blphJdBkFcScJtO8TCPmIpLiWClxNeN4Rqw=;
	b=DBt2zA/3iiKyeL0vfwec8d5DzEd8gHn9UqxTK/UbzJQUzX9MLTYyCo53hSlFaP2j5s
	cHlGPp1M8ynTBvBtZvpvi/ygdMAe40aCYM7Fnk3ztvrA2Pienko7USe5MFXOIpgNWtHF
	ckb+XI3zZ62lhqwymmDS5azXOhSSkZ55kDPpw8krlaz+8KfrSlw5lmsWd3Y+bn9NQfMO
	EaA2Uymxjz4bbnVaqANsjwV9hkm0yNXf2dsGml7H5wfErpf9LbQutA4mUkN7aQ0yRGDA
	XYTt7t9nPF3GmO7O3Rm3lCsyuKNMHuCxUP7FPIsJAouUanw3HicxIcGvkEXt6CTmVPc5
	ehcg==
X-Gm-Message-State: AMCzsaVQ0pzp9vhb9T2RMKiWJtBHzF9W588ruZ6BACg/ah/9wCUnuXsu
	7Ujk//YML+OZO2jSCERJeY+SpSI0HI4zaCZR+HMVyw==
X-Google-Smtp-Source: ABhQp+T0Rf9gRNyr1T8tRNNsdIlfKrbGXRZbae38StayyhCTcsuWkaxjCB565c7/7i+3eUSqdBEnBdBGExY9vVvTplY=
X-Received: by 10.28.236.203 with SMTP id h72mr4006345wmi.147.1508249090669;
	Tue, 17 Oct 2017 07:04:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 07:04:30 -0700 (PDT)
In-Reply-To: <1506737310-21880-9-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-9-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 15:04:30 +0100
Message-ID: <CAFEAcA8OTNA9J4x0qthH8zK2Ezpd4JrdSQMFirzanzkp3SfxWQ@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [PATCH 08/13] target/arm: Split arm_ccnt_enabled
 into generic pmu_counter_enabled
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
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VBX1bozi5Pem

On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3932ac0..c0ef367 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -975,17 +975,22 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
>      return pmreg_access(env, ri, isread);
>  }
>
> -static inline bool arm_ccnt_enabled(CPUARMState *env)
> +static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
>  {
>      /* Does not check PMCCFILTR_EL0, which is handled by pmu_counter_filtered */
> -
> -    if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31))) {
> +    if (!(env->cp15.c9_pmcr & PMCRE) ||
> +            !(env->cp15.c9_pmcnten & (1 << counter))) {
>          return false;
>      }
>
>      return true;
>  }
>
> +static inline bool arm_ccnt_enabled(CPUARMState *env)
> +{
> +    return pmu_counter_enabled(env, 31);
> +}
> +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
