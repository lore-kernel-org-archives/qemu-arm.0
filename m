Received: by 10.103.86.17 with SMTP id k17csp342982vsb;
        Tue, 20 Dec 2016 09:55:15 -0800 (PST)
X-Received: by 10.55.195.148 with SMTP id r20mr607547qkl.45.1482256515501;
        Tue, 20 Dec 2016 09:55:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o55si12837429qto.279.2016.12.20.09.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Dec 2016 09:55:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52709 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJOd7-0004jp-3Q
	for alex.bennee@linaro.org; Tue, 20 Dec 2016 12:55:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cJOVT-00041x-Hb
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 12:47:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cJOVS-0001HU-Li
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 12:47:19 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cJOVS-0001HE-Gd; Tue, 20 Dec 2016 12:47:18 -0500
Received: by mail-oi0-x244.google.com with SMTP id m75so24978883oig.1;
	Tue, 20 Dec 2016 09:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nOqUerJXevupNzQdSif3vAV3uMflab7NuUfsbQ8E6zU=;
	b=GrvHrbh3RAZeSKQUKm5tFiFUYVM1CsCZQsAByI29wndm/0OjvyufOpCb3xCfNjliOB
	e6LLxi5CBZkCQGkB92Imm7XYFIKFEAXROKyfkd7wvbSxcHZmN4NnGbKplZKPmQv+wB+6
	XltSKaz7f9Tyy/lAk1IC+OIeqP7KGgO9Tb5QmRC8Uuj62idW7w3ZdOJAvvpys85VQhhs
	moCco+8hyekFio6HvzJYGK3QfHGme64OlebKR+sPPjCghcqB4oekar1YjA6AkhI8TfTI
	cU7TU08OO36jJ7/wrOUNfidHviPUy+NdJ6mJYflaCAbHTIkkec935DO5MA0dEYR3v/iw
	HqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nOqUerJXevupNzQdSif3vAV3uMflab7NuUfsbQ8E6zU=;
	b=sBGWEf3NC7sLDftZnwuW6JrQxFYxUhxAFGk/b4qa3G9rEip6Ij/VfS2h/FQQnXqGOp
	rAnPH/g+c3ywJ055idahTzLuIYy+UM6Ah8+Iy1sV4hUXX2JRABKheaQmYkMWBpvdORpn
	XS929hCWbTyNa4mesR0Y0augc/Xw0xHMJUWTTYD4ytzKSH4Fla8ld0+gYCW4OhuUSZCA
	3jRjdSiPIJ2zQzcQZ9sxKxnJEWEAgY+jRIBzWjcBO4czccbU/H3cN8H4mirFKpjLDEdL
	m/GjqWN1gRiAraQ/kKqQzA6l86T7zYAvBP8OELaZwU12Aud9JQbIoYfgVmCBsAB+Bup7
	f9IQ==
X-Gm-Message-State: AIkVDXKdsUZijI2Z5F6bN7YvDRISZv8US4OzT1TuelVHMSg9/GEcsXh+eHmnijLLGmwnGl2Byx09PtOqL8aYcg==
X-Received: by 10.157.35.71 with SMTP id k7mr338828otd.140.1482256037510; Tue,
	20 Dec 2016 09:47:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.96.6 with HTTP; Tue, 20 Dec 2016 09:46:47 -0800 (PST)
In-Reply-To: <CAFEAcA8nJfyQZHQCrmNkjBHOF05qErh1OJeRzcM_8obYvYivbQ@mail.gmail.com>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-23-git-send-email-peter.maydell@linaro.org>
	<20161213161152.GN9606@toto>
	<CAKmqyKNXugCpkY_oHv=256wP5nve9hcsGep21UQuwyLE_mm99A@mail.gmail.com>
	<CAFEAcA8nJfyQZHQCrmNkjBHOF05qErh1OJeRzcM_8obYvYivbQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Dec 2016 09:46:47 -0800
Message-ID: <CAKmqyKP0sLbCfqTG12Q9KJ1oTJESG7_v=cY83TcmTAu4fSh+HA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 22/23] target-arm: Enable EL2
 feature bit on A53 and A57
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
Cc: Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7vy491EWtTvW

On Tue, Dec 20, 2016 at 5:32 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 19 December 2016 at 22:04, Alistair Francis <alistair23@gmail.com> wrote:
>> On Tue, Dec 13, 2016 at 8:11 AM, Edgar E. Iglesias
>> <edgar.iglesias@gmail.com> wrote:
>>> On Tue, Dec 13, 2016 at 10:36:23AM +0000, Peter Maydell wrote:
>>>> Enable the ARM_FEATURE_EL2 bit on Cortex-A52 and
>>>> Cortex-A57, since this is all now sufficiently implemented
>>>> to work with the GICv3. We provide the usual CPU property
>>>> to disable it for backwards compatibility with the older
>>>> virt boards.
>>>>
>>>> In this commit, we disable the EL2 feature on the
>>>> virt and ZynpMP boards, so there is no overall effect.
>>>> Another commit will expose a board-level property to
>>>> allow the user to enable EL2.
>
>>>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
>>>> index 0d86ba3..bc4e66b 100644
>>>> --- a/hw/arm/xlnx-zynqmp.c
>>>> +++ b/hw/arm/xlnx-zynqmp.c
>>>> @@ -258,6 +258,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>>>>
>>>>          object_property_set_bool(OBJECT(&s->apu_cpu[i]),
>>>>                                   s->secure, "has_el3", NULL);
>>>> +        object_property_set_bool(OBJECT(&s->apu_cpu[i]),
>>>> +                                 false, "has_el2", NULL);
>>
>> Hey Peter,
>>
>> We would like this to be settable. I think just copying the s->secure
>> (same as EL3) should be fine here.
>>
>> Let me know what is easier for you, if you want to just add an extra
>> patch to enable it or if you want me to send a patch doing it?
>
> I'm not really set up to test the xilinx boards, so I'd rather
> let you test and send the extra patch to enable it for them.

Yeah, no worries. I'll sent a patch out to apply on top of this series.

Thanks,

Alistair

>
> thanks
> -- PMM
