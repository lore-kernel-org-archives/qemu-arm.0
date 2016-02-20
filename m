Received: by 10.25.208.211 with SMTP id h202csp291743lfg;
        Sat, 20 Feb 2016 03:29:22 -0800 (PST)
X-Received: by 10.140.98.116 with SMTP id n107mr23273816qge.9.1455967762409;
        Sat, 20 Feb 2016 03:29:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h75si19063638qhc.86.2016.02.20.03.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 20 Feb 2016 03:29:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aX5iz-0003Ui-Tq
	for alex.bennee@linaro.org; Sat, 20 Feb 2016 06:29:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aX5ix-0003T4-Oc
	for qemu-arm@nongnu.org; Sat, 20 Feb 2016 06:29:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aX5iw-00070W-TQ
	for qemu-arm@nongnu.org; Sat, 20 Feb 2016 06:29:19 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:34601)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aX5iw-0006zl-Np
	for qemu-arm@nongnu.org; Sat, 20 Feb 2016 06:29:18 -0500
Received: by mail-vk0-x231.google.com with SMTP id e185so95599828vkb.1
	for <qemu-arm@nongnu.org>; Sat, 20 Feb 2016 03:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Q42xnUYIz8qBlCK3hDsXH6eMnB8BdUHRzrsifoka+wg=;
	b=DH5yHse/Cwah/PVjoQaLASQCDKkTLMTJqWQ9GPDc91Gs0dFrtiIVCA1sb25nGaGtgW
	aTD7nm3V+mS2n0uDM0398Rcv4A4jSy8u0+XfE87Y5y3XMVr1yE825QpmE56mHPEASAx5
	tfb+KYA0ipPLPd1BHEyEPeXVea0A3j8NBaDGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Q42xnUYIz8qBlCK3hDsXH6eMnB8BdUHRzrsifoka+wg=;
	b=lWK0KSSdmy89JnG/9MUXoKMITY+aIbGp4y0mao+x1CSUnnbrv3qLJm7xbhHfLEyihL
	c3RWT4BfgU93oLEuKIwfdwe7evxcRg3hxq7gs+lApUfLn4YRMLKmKUYfCmgxCOYQi+8g
	ZS58HoOLWi9UW/tkqz+XArI9C7lnduldas9sLlH94J27aMe6DFN+V2Z4LNzpw6Tvxknc
	wlaY5jqG3ZFjEDz7k2Q9pAG++dCh3DpCFZ8jK7I1d+H/3dUSmyH/tS7MZsHNCHu9x9HD
	bNfQRQhUZfVEPqbJwCDoK8L6vUV10jCtaglSuaiE5dYtI69qQjiM5VF49IO/SdgFSzWh
	sQYA==
X-Gm-Message-State: AG10YOSAq/LTRDLq/4wGi1I6fBX5TTq1CmApzwDZ7KHdmqZWBkUZlNAQ3D8Zn1kYN5mjDZj4rvc/cMz9yyhMmgx6
X-Received: by 10.31.107.194 with SMTP id k63mr13474541vki.27.1455967756926;
	Sat, 20 Feb 2016 03:29:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Sat, 20 Feb 2016 03:28:57 -0800 (PST)
In-Reply-To: <CAKmqyKNy79b8_k2wOO_v0DgXc3OCwhcHv7zVkcEPe_Fft6-Gpw@mail.gmail.com>
References: <1455892784-11328-1-git-send-email-peter.maydell@linaro.org>
	<1455892784-11328-3-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKNy79b8_k2wOO_v0DgXc3OCwhcHv7zVkcEPe_Fft6-Gpw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 20 Feb 2016 11:28:57 +0000
Message-ID: <CAFEAcA8_oJZU_mHBbmSk0XvJPaevAri6A-UwBkMHCBh2op9h+A@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] target-arm: Implement
 MDCR_EL3.TPM and MDCR_EL2.TPM traps
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
X-TUID: qPq09Wya1TRz

On 19 February 2016 at 19:38, Alistair Francis <alistair23@gmail.com> wrote:
> On Fri, Feb 19, 2016 at 6:39 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
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
>> +    }
>
> Hey Peter,
>
> Why not use else if?

I generally tend not to use else-if ladders if the thing
in the conditional returns unconditionally, just as a
personal style preference. "if () { X } else if () { Y } Z"
implies a possible control flow path of "take the if
branch so run X, then skip Y, and continue after to run Z",
and if X returns unconditionally that can't happen.
It also matches up with the usual approach of
   if (something) {
       early return;
   }
   main body of function;

which you wouldn't want to write as
   if (something) {
      early return;
   } else {
      main body;
   }

thanks
-- PMM
