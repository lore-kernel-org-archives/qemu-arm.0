Received: by 10.182.105.169 with SMTP id gn9csp124258obb;
        Fri, 30 Oct 2015 15:09:28 -0700 (PDT)
X-Received: by 10.55.78.149 with SMTP id c143mr13265883qkb.107.1446242968013;
        Fri, 30 Oct 2015 15:09:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m5si7846418qkl.2.2015.10.30.15.09.27
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 30 Oct 2015 15:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:53403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsHrT-0001PA-QI
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 18:09:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsHrR-0001OZ-Kk
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 18:09:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsHrQ-0000U9-Lb
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 18:09:25 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35094)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsHrQ-0000TJ-I7
	for qemu-arm@nongnu.org; Fri, 30 Oct 2015 18:09:24 -0400
Received: by vkfw189 with SMTP id w189so56042316vkf.2
	for <qemu-arm@nongnu.org>; Fri, 30 Oct 2015 15:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eh/r14nk55DOfsjZiqpBbpijEDKLrmB8rgWTtuo44Rg=;
	b=lauO6nF3lO0UIoLrK9/iOx7QoYCgpBHkyFz9qU2NQR3wF5fl6xqaH9BOvBWMcG233r
	5ZZwFaooxNtkjsUNjCN3Ctl2+HivXJEuXys6DGR79TFKAMg4QzS8EuOTlTHVmMpXjz2y
	ujqMU43DulPkt1KRH3R2dEBWiNsj58+v6lsrxXE82+CzKM5ktfz40XiuSOVfKhKp6XCd
	ZRkBm+qZMGgCa3sRX1iJqFZ2dLKqE8RmK1sGxshjb6ke9IilERgyhrMEQc5F27DdA3F7
	MIRJ2E54x98oa0aZ4oyzS+0gk+osGqXAothoQTTJh17BIpHaB0JwDS1EHt9d5dMpOYN1
	7SyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eh/r14nk55DOfsjZiqpBbpijEDKLrmB8rgWTtuo44Rg=;
	b=cwROzBmX0NibuKqG9pcVmrhqJZRHyzT8bUKm7IcdZzLNZz0YyhwwLypj6IPXDLiWA0
	k28MUsTprtxS7woNWA/6C4N3F/QJ7BcsPokBAQA4ZWTIXs/JwrRp9+2nMJqGacMkEkWa
	A2t0+cw9kOpyDpd9PVX6df6JxJfn3IGhNrNTDGpDCgp3xrrAadg5Dx3EDDFgbkIeN8en
	HNU2MU/BcFDSUxoIsDvwapNoyAh0OStxGjY79B1qRKUA6QTmdyAFBGaiU6SdspxcKWO3
	NnzD/IZE65KQrPFozgYqA030eEd/OBtR2p2xsVhvSO0r5YRc//61pQ/XvVJcNUqeKFSS
	r7uA==
X-Gm-Message-State: ALoCoQmRH2vS2pFpRX5+HCWMcHyq6pSNxUvjejmpxCm3SfaROt0k8vsBTlSSAd2lREhkSi4kaI4Q
X-Received: by 10.31.8.69 with SMTP id 66mr6835745vki.82.1446242964174; Fri,
	30 Oct 2015 15:09:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 30 Oct 2015 15:09:04 -0700 (PDT)
In-Reply-To: <CAPokK=r0OGFv=nUHTL9veb2ynh9yCFdAO9WbbZFyJohiEqX+MA@mail.gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
	<f017d14547e267df4421a64533230297a2225fed.1446182614.git.crosthwaite.peter@gmail.com>
	<CAFEAcA9GyDsYY8f+G15HhrVQhRHjsMxdeo=53bNYQZOE2ScciA@mail.gmail.com>
	<CAPokK=r0OGFv=nUHTL9veb2ynh9yCFdAO9WbbZFyJohiEqX+MA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2015 22:09:04 +0000
Message-ID: <CAFEAcA9Jfqh=Yu_OPDTVzyXO+b5+ec1vUk-dFNkC+SjzCs2+2g@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-arm] [PATCH v2 5/5] arm: highbank: Implement PSCI and
	dummy monitor
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
X-TUID: +SaEVqF8NZn0

On 30 October 2015 at 21:32, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Fri, Oct 30, 2015 at 2:10 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> This still confuses me. What I was expecting to see was something like:
>>
>>     /* Monitor mode vector table; entry points which will only be reached
>>      * if the guest kernel is buggy are tight loops to avoid executing
>>      * random code by accident. The SMC vector entrypoint just returns,
>>      * making all SMC calls operate as NOPs.
>>      */
>>     0xwhatever, /* notused1: b notused1 */
>>     0xwhatever, /* notused2: b notused2 */
>>     0xwhatever, /* smc: movs pc, lr */
>>     0xwhatever, /* prefetch_abort: b prefetch_abort */
>>     0xwhatever, /* data_abort: b data_abort */
>>     0xwhatever, /* notused3: b notused3 */
>>     0xwhatever, /* irq: b irq */
>>     0xwhatever, /* fiq: b fiq */
>
> I don't get the difference between notused and prefetch_abort etc. The
> only one that is used is SMC. Which ones should tight loop and which
> ones should nop? Do we actually have to branch somewhere or can we get
> away with one-inst tight loop / nops as appropriate?

The only one which we need to have do something is the SMC entry
point. None of the others will get called unless the guest manages
to do something screwy. They're all just separate tight loops
so if you look in the debugger and it says you're looping at
0x210 you know it was an unexpected prefetch abort rather than
an unexpected irq or whatever. (The only way to get to the notused
entries is literally to jump to them, incidentally, since the
CPU itself won't use them as exception entrypoints.)

We don't need to branch anywhere, since helpfully the ret insn
for smc only takes one insn. The rest are all just branch-to-self.
(If we did ever need more complicated smc handling then we could
just have "smc: b smchandler" and put the smchandler after the
vector table somewhere.)

thanks
-- PMM
