Received: by 10.25.0.147 with SMTP id 141csp808482lfa;
        Fri, 24 Feb 2017 10:25:39 -0800 (PST)
X-Received: by 10.55.122.194 with SMTP id v185mr3840721qkc.99.1487960739544;
        Fri, 24 Feb 2017 10:25:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v4si3655535qkh.330.2017.02.24.10.25.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Feb 2017 10:25:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1chKYi-0005uW-Ue
	for alex.bennee@linaro.org; Fri, 24 Feb 2017 13:25:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chK7V-0002tL-Ln
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 12:57:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chK7U-0000Xw-Km
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 12:57:29 -0500
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234]:35396)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1chK7U-0000XT-EH
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 12:57:28 -0500
Received: by mail-wr0-x234.google.com with SMTP id g10so16168113wrg.2
	for <qemu-arm@nongnu.org>; Fri, 24 Feb 2017 09:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o1JOF6Yzz8H0t3CWsLhuDcUQ4cUDcM2ZitwH8ZK/FmI=;
	b=hyZ3Qe1U1TOIbK+aGoawFg3K/qWc10XdGX1RNJidMnJQqs8aiOTl51dLQjet4+ao+F
	0nwxKuuBBi2AJNSfHC2J+yfrUcGm760ft2xJsp4D1C3RxY0rsgPN1F8xs2FgbUC7svBU
	HQxuiz/o4kz4wwruUxNLbD/54zhT60Riabx8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o1JOF6Yzz8H0t3CWsLhuDcUQ4cUDcM2ZitwH8ZK/FmI=;
	b=cjzAxSmBgVh3qgLjRbVrBWiltUvzjrY8ziesK1tc8maiXWLCxih8Y7pG8NfYW7Ejm6
	Mav3AEXOmkoH1cFkpYxNRxBFs4L+9KDABogNykQCvHXvngT7RkaYSXBavXboiNAZnPx9
	WMpgny1+kGKlpgnCMalPKv9gxIZi4GZylnc3JKDQwcDzK8nw1HEUCr6UiOA7HTluNKb5
	yhzQ0S5tqQrVm7eI9Dc2JvcQjLAHlXLp4zaT1H8VFkU5Dkzm9QrwvfTcGd4ihmlh57wF
	H+sowz5WTP3FbBdOKeIg7UwwGHbjf+nQ/T7C5T0fTfV/621zM44gI4nIXF4XOi/zWEie
	lnLA==
X-Gm-Message-State: AMke39lyMkDTbYuPhxEPaUo719dX6R07kVZYEKlEANojjSsq7tQOrAE5MHvX3S6jVl3DiNcfNogOklAB+nABE2YM
X-Received: by 10.223.152.241 with SMTP id w104mr4061019wrb.151.1487959047156; 
	Fri, 24 Feb 2017 09:57:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 24 Feb 2017 09:57:06 -0800 (PST)
In-Reply-To: <ce8aa8f7-e163-5b79-ef1e-f8132928882f@redhat.com>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
	<1487850673-26455-3-git-send-email-vijay.kilari@gmail.com>
	<ce8aa8f7-e163-5b79-ef1e-f8132928882f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 17:57:06 +0000
Message-ID: <CAFEAcA_wQueyMKEdVpeW56RPhvG+deO5-a_AHZX+xHaMtCQnyg@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::234
Subject: Re: [Qemu-arm] [PATCH v9 2/5] hw/intc/arm_gicv3_kvm: Add
 ICC_SRE_EL1 register to vmstate
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uOq52jLgt+2F

On 24 February 2017 at 17:53, Auger Eric <eric.auger@redhat.com> wrote:
> Hi,
>
> On 23/02/2017 12:51, vijay.kilari@gmail.com wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> To Save and Restore ICC_SRE_EL1 register introduce vmstate
>> subsection and load only if non-zero.
> != 7
>
>> Also initialize icc_sre_el1 with to 0x7 in pre_load
>> function.
>>
>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>> ---
>>  hw/intc/arm_gicv3_common.c         | 36 ++++++++++++++++++++++++++++++++++++
>>  include/hw/intc/arm_gicv3_common.h |  1 +
>>  2 files changed, 37 insertions(+)
>>
>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>> index 16b9b0f..5b0e456 100644
>> --- a/hw/intc/arm_gicv3_common.c
>> +++ b/hw/intc/arm_gicv3_common.c
>> @@ -70,6 +70,38 @@ static const VMStateDescription vmstate_gicv3_cpu_virt = {
>>      }
>>  };
>>
>> +static int icc_sre_el1_reg_pre_load(void *opaque)
>> +{
>> +    GICv3CPUState *cs = opaque;
>> +
>> +   /*
>> +    * If the sre_el1 subsection is not transferred this
>> +    * means SRE_EL1 is 0x7 (which might not be the same as
>> +    * our reset value).
>> +    */
>> +    cs->icc_sre_el1 = 0x7;
>> +    return 0;
>> +}
> As Peter asked before I don't really get why we need the pre_load
> function here.

No, it's correct. As the comment says, the reset value
of icc_sre_el1 might not be 7 (it is right now, but it's
less of a trap for future changes to not assume it).
So the way migration works is that we use pre-load on the destination
end to set the value to 0x7, then if the source end transfers the data
we get the transferred value, otherwise we end up with the default
value as set in the pre-load function.

thanks
-- PMM
