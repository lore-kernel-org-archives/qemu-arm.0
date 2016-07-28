Received: by 10.25.21.156 with SMTP id 28csp898105lfv;
        Thu, 28 Jul 2016 09:33:51 -0700 (PDT)
X-Received: by 10.55.212.134 with SMTP id s6mr45138046qks.109.1469723631208;
        Thu, 28 Jul 2016 09:33:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 71si6655803qku.207.2016.07.28.09.33.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 09:33:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSoFq-0001L7-IJ
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 12:33:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bSoFk-0001K7-4B
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:33:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bSoFi-0003wZ-Up
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:33:44 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:32986)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bSoFi-0003vU-Q8; Thu, 28 Jul 2016 12:33:42 -0400
Received: by mail-oi0-x242.google.com with SMTP id l9so4995577oih.0;
	Thu, 28 Jul 2016 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=TfUVp+oRGv57n+Q9wyCSyRWpigeDkzq0bBO86ABiRHY=;
	b=kP3VxtQ0ywXfpFAXgS0YI0j+jur+JnLWieh365wSgrG3r3zWc8HAT++OLP2AzPPl8v
	DEPOzdUSLO8PFizfQoXckztwsQGItldREkhUyGK6PY7co52Q0MBCDM10oscIDySVnkjV
	qXhV0Xr+kUTHI2A5LpryAv0y33Tihs/IzoomPaV+0XIXW8XYRgY3LpPDW2shTmTeWsWO
	GO676z+CWJhB4UjsAo8mNMpq4wfqd8vE5xtGsObEv26YDrrWRH/9yHifi9qvBIRYgr/O
	gyL4Fx2Z+c+hhRcs/KPy+qtZNt8LzJVAMdmeWxC/eg3LcGevhK/un7SRmX8CjvKQ7LeP
	mahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=TfUVp+oRGv57n+Q9wyCSyRWpigeDkzq0bBO86ABiRHY=;
	b=Li8LAUWa0zHiaW+GzkTcxpYdqLuprC3EOT25VvmsrQj2yv6N/OCyHMKcuzABJezj8X
	ocP8k+wBx7g+tvRglZg/xoK/WTDpza3NDEq8Tu7MyEK7pGp4kcPhwukvw7rpId0+T9Tk
	gRHH9t7TMNppd4ktiEFbQECSd3yEi+fB9ky8b6OzPalFpwkTAJKX8Wx0dPu5/BzHPN4W
	FSEauQ0U6lN4ggYuKXUl/fcaG1ZqfWH2NRdU0gPQvaILvx6xRRnzXnfyPEM14qJh3yO+
	xXY262EuD9PoBCauy0Eq+5DQ/3Y+oCQyQNZjSoFXxbFO4BI9PMMjuTp2xXQrvYUNwmX2
	17UA==
X-Gm-Message-State: AEkoouvaOSQXA6m2AJ4C9MvL4FQuE05g4CJtPI7cqG9zUxUdBA+y6gLr43pwBcT2tvEMnDBJy5NKZ8K2savi1w==
X-Received: by 10.157.41.134 with SMTP id n6mr20463845otb.69.1469723620980;
	Thu, 28 Jul 2016 09:33:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.14.72 with HTTP; Thu, 28 Jul 2016 09:33:11 -0700 (PDT)
In-Reply-To: <CAFEAcA_UPR+nyBPX2qSPiX1j=fVkg9-+7FCo2bxX7RpmftfNKQ@mail.gmail.com>
References: <CAFEAcA_UPR+nyBPX2qSPiX1j=fVkg9-+7FCo2bxX7RpmftfNKQ@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 28 Jul 2016 09:33:11 -0700
X-Google-Sender-Auth: ntxN-44UrFnB4ADpUAX_9cbNtJ0
Message-ID: <CAKmqyKNxG4rNa6Nke6nXzXN1frRnkMYM3cy6p3Gr3sOGv-8n1A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 4/6] cadence_gem: Add queue
 support
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EijEVWfe54Fz

On Thu, Jul 28, 2016 at 2:39 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 26 July 2016 at 19:25, Alistair Francis <alistair.francis@xilinx.com> wrote:
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>
>> There is a indentation error in this patch in the gem_transmit function.
>> I have written it like that to make it easier to see the changes. It is
>> fixed in the next patch.
>
>> @@ -1417,8 +1500,8 @@ static void gem_init(Object *obj)
>>
>>  static const VMStateDescription vmstate_cadence_gem = {
>>      .name = "cadence_gem",
>> -    .version_id = 3,
>> -    .minimum_version_id = 3,
>> +    .version_id = 4,
>> +    .minimum_version_id = 4,
>>      .fields = (VMStateField[]) {
>>          VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
>>          VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
>
> This bit should have moved into the other patch with the change of
> the CADENCE_GEM_MAXREG define, right?

Woops, I have moved it to the previous patch.

>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!

Will this make it into 2.7?

Thanks,

Alistair

>
> thanks
> -- PMM
>
