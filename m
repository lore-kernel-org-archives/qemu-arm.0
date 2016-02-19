Received: by 10.25.208.211 with SMTP id h202csp1179943lfg;
        Fri, 19 Feb 2016 06:15:22 -0800 (PST)
X-Received: by 10.55.26.39 with SMTP id a39mr15814606qka.98.1455891320359;
        Fri, 19 Feb 2016 06:15:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d70si14516760qkb.34.2016.02.19.06.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 06:15:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:52692 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWlq3-0007vB-QS
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 09:15:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWlq1-0007uS-90
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 09:15:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWlq0-0004H6-7x
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 09:15:17 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:32895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWlpy-0004Gb-UZ
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 09:15:16 -0500
Received: by mail-vk0-x22e.google.com with SMTP id k196so75661886vka.0
	for <qemu-arm@nongnu.org>; Fri, 19 Feb 2016 06:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Tdx7KAiK78v209helsVMQnrGBxKNaFZ2svQYAjug4S8=;
	b=PV2/2bgJay02UbvMMbWa1LuOfm+1rVxIwTuLzUK4svxm4JzX8NZluFaDru8h7vfInB
	xxcNlv6gxIWZQ4B84nWERu0+zb8/YkUU2yqlBUc4vTvwUaCkBupl+6+QcBTC79Sxjf5L
	EFKdZrIBHyfyqDqjZ2m5qPlrzR/cRNkNjEe/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Tdx7KAiK78v209helsVMQnrGBxKNaFZ2svQYAjug4S8=;
	b=K0Q+yzfM/NofgYq8GHOkc8u2z4HNTTqOcUq7dNzkT3e2VUq6jBZXMr5selrJJ3BkoG
	KSEQJAxhMmBjuDxKwIsmNL1adSXt9wMjB1Y9iAREkXF10alXu/UKNfpPaiDTrIf6/OrP
	WbLMSVnVdVOppOa5Cy/CHDe5AOwqDs3tY1a9hMJVva1ginTPcEAOxvvVTcxQYp5+9M/X
	xhOv1FMAMqdwkScw3By+Oe8Jkd2Kzxsk46bug7XrQKqLhr+YQ/97YJ8X1UyenXOYcxAj
	I7nSS68znir7ZoPYzt6I5ZPOUpNpLBa+fMB7Pv+n4AtyBWk+vVL1r3pcSRkatw7TXypB
	+Ang==
X-Gm-Message-State: AG10YOQDqYj8FW39lrEm+CMwKaomSOx5u2UuJYtzyt4lX+A/1HT+kAy0cd6KLvobyp9PoXLbJPckQdN570FG+DzR
X-Received: by 10.31.180.85 with SMTP id d82mr9354566vkf.83.1455891314453;
	Fri, 19 Feb 2016 06:15:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 19 Feb 2016 06:14:55 -0800 (PST)
In-Reply-To: <56C71B4B.4010309@gmail.com>
References: <1455881194-10865-1-git-send-email-peter.maydell@linaro.org>
	<56C71B4B.4010309@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2016 14:14:55 +0000
Message-ID: <CAFEAcA_WJpiELceHxRyzsbFVOvSp4Hka1OmsErFhZZvyuGbpiw@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Implement MDCR_EL3.TPM and
	MDCR_EL2.TPM traps
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NY+Y+ktxxrDU

On 19 February 2016 at 13:40, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 19.02.2016 14:26, Peter Maydell wrote:
>> Implement the performance monitor register traps controlled
>> by MDCR_EL3.TPM and MDCR_EL2.TPM. Most of the performance
>> registers already have an access function to deal with the
>> user-enable bit, and the TPM checks can be added there. We
>> also need a new access function which only implements the
>> TPM checks for use by the few not-EL0-accessible registers
>> and by PMUSERENR_EL0 (which is always EL0-readable).
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +/* Check for traps to performance monitor registers, which are controlled
>> + * by MDCR_EL2.TPM for EL2 and MDCR_EL3.TPM for EL3.
>> + */
>> +static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                                 bool isread)
>> +{
>> +    int el = arm_current_el(env);
>> +
>> +    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TPM)
>> +        && !arm_is_secure_below_el3(env)) {
>> +        return CP_ACCESS_TRAP_EL2;
>> +    }
>> +    if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TPM)) {
>> +        return CP_ACCESS_TRAP_EL3;
>
> This trap is only possible if EL3 is using AArch64.

You mean, we shouldn't honour the bit if EL3 is AArch32?
I guess that's true of the other MDCR_EL3 bits too (in the
32-bit SDER those bits are RES0). Probably it would be
better to implement a write function for SDCR that didn't
allow setting of reserved bits.

thanks
-- PMM
