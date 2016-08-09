Received: by 10.25.21.156 with SMTP id 28csp358020lfv;
        Tue, 9 Aug 2016 00:00:38 -0700 (PDT)
X-Received: by 10.237.46.6 with SMTP id j6mr32674065qtd.113.1470726038493;
        Tue, 09 Aug 2016 00:00:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i126si10768175qke.82.2016.08.09.00.00.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Aug 2016 00:00:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bX11h-0007fr-US
	for alex.bennee@linaro.org; Tue, 09 Aug 2016 03:00:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bX0tw-0007x0-Ut
	for qemu-arm@nongnu.org; Tue, 09 Aug 2016 02:52:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bX0tr-0003gP-RV
	for qemu-arm@nongnu.org; Tue, 09 Aug 2016 02:52:35 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35088)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bX0tr-0003gL-M3; Tue, 09 Aug 2016 02:52:31 -0400
Received: by mail-oi0-x241.google.com with SMTP id w143so451514oiw.2;
	Mon, 08 Aug 2016 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=13aVFHOKJ5a44RE3pyWKLuKkVwAjcIRzGErrqeiNqtU=;
	b=KrpODa/pJuq2c6h8BebBVLYqq7WEpiVLeq23tpXq0AaibZ5I79/MeiSqNR7SxFZ597
	KK7b5a0IQfYp4iqA9HL/T97YBc/0+1JD4eaBh9P0YvLXotIbX3/UdcIQ1ChcBFOW8XG2
	0zrg0DC7bHgVk4aCDSbcCgL8rldcWtuVP9lTYU45uZWfC05ZZpT01iskIl4M42S/6lKP
	hui/aM22ff/PEDQx22V40595v4iC9sD2FWv+wcgDREni41Ar2hSQnlRm1hxLvho34LH+
	77FjUBeVAKifCJHWko2SCeO+voPDXNebpiP7JGqqB++Nr2pSSpScZ1ySH6pWYSrpe8L8
	frNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=13aVFHOKJ5a44RE3pyWKLuKkVwAjcIRzGErrqeiNqtU=;
	b=IGEyj4MtnA/TMVzayHIdO8NSnw4pDpJykgHR00A5ZqZMTiwadcOOU7YWUIbK9qqpaj
	cS75qVR4/QwxGSHuawtbp8awein1q6/fowfqDH6P0DJbEvWpNdiIn+KUBS9osqXD048e
	8YsIGbOvyDVLQg8SH32kGNKEH08zbJ7v2NJO9NFPTPiYzhx6xlVqC5CV31AMYx4//zNc
	AYusygC8CZrXevNGqGuEv6byetMPwQw4deLW68ylquky6AijAnkldEVqF20P4Q7zvHw4
	b9W/LqEistKLfMJLwJ1s2ujAcyFJ0+XssVn6V40ivdlbU++G1tpg8qO/YBsAzsOyBI6r
	B5WA==
X-Gm-Message-State: AEkoouv6syOdYHUel+sTfn7WgLxOsDDexdw9VCCjSO2uzoHmfHupu5fiOuDGSaWQsNDSWj2OSNH2UqKtBBdRVQ==
X-Received: by 10.157.7.72 with SMTP id 66mr18206780ote.145.1470725551054;
	Mon, 08 Aug 2016 23:52:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.244 with HTTP; Mon, 8 Aug 2016 23:52:30 -0700 (PDT)
In-Reply-To: <CAFEAcA_e=PGkFX3sPn_gMPCM8niZ-zm+S4wXPDEX3gRhMpE=hQ@mail.gmail.com>
References: <1470675071-23677-1-git-send-email-vijay.kilari@gmail.com>
	<1470675071-23677-3-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA_e=PGkFX3sPn_gMPCM8niZ-zm+S4wXPDEX3gRhMpE=hQ@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Tue, 9 Aug 2016 12:22:30 +0530
Message-ID: <CALicx6uq_wb9BuUGd1OD4712aOoh+MdFAhbPnHyOSqBVuMSjMw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [RFC PATCH v2 2/2] hw/intc/arm_gicv3_kvm: Implement
 get/put functions
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
Cc: "prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J1MGNLI7hV6q

On Mon, Aug 8, 2016 at 10:27 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 8 August 2016 at 17:51,  <vijay.kilari@gmail.com> wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> This actually implements pre_save and post_load methods for in-kernel
>> vGICv3.
>>
>> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> [PMM:
>>  * use decimal, not 0bnnn
>>  * fixed typo in names of ICC_APR0R_EL1 and ICC_AP1R_EL1
>>  * completely rearranged the get and put functions to read and write
>>    the state in a natural order, rather than mixing distributor and
>>    redistributor state together]
>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>> [Vijay:
>>  * Update macro KVM_VGIC_ATTR
>>  * Use 32 bit access for gicd and gicr
>>  * GICD_IROUTER, GICD_TYPER, GICR_PROPBASER and GICR_PENDBASER reg
>>    access  are changed from 64-bit to 32-bit access]
>> ---
>
>> +        // TODO: there is no kernel API for reading/writing c->level
>
> We have now defined this API so this code should use it.

You mean storing and restoring of irq->line_level of kernel?.
I don't see any API defined in new vgic to read line level.

The irq pending information is updated when line_level is changed in
kernel. Hence pending (ispendr) holds information of pending status
of interrupt. Do you see line level is still required to save & restore?

>
>> +    // TODO: there is no kernel API for reading/writing s->level
>
> Also here (and similarly in the _get function).
>
> thanks
> -- PMM
