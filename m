Received: by 10.25.21.156 with SMTP id 28csp1369300lfv;
        Fri, 29 Jul 2016 07:24:35 -0700 (PDT)
X-Received: by 10.129.83.131 with SMTP id h125mr1147098ywb.104.1469802274914;
        Fri, 29 Jul 2016 07:24:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m67si12319845qkb.53.2016.07.29.07.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jul 2016 07:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bT8iI-0004B6-D2
	for alex.bennee@linaro.org; Fri, 29 Jul 2016 10:24:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT8h2-0003IC-94
	for qemu-devel@nongnu.org; Fri, 29 Jul 2016 10:23:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT8h0-0003G0-AI
	for qemu-devel@nongnu.org; Fri, 29 Jul 2016 10:23:15 -0400
Received: from mail-ua0-x229.google.com ([2607:f8b0:400c:c08::229]:34786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bT8h0-0003Fg-6E
	for qemu-devel@nongnu.org; Fri, 29 Jul 2016 10:23:14 -0400
Received: by mail-ua0-x229.google.com with SMTP id 35so62886697uap.1
	for <qemu-devel@nongnu.org>; Fri, 29 Jul 2016 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fsad5riA8MfyqTMoX8xI2VGSyEfaHL6jWQ5UCh4pEeE=;
	b=ekVHpsDmXRyEKBef24n+GFBqRfugEXbYbzQxRga7QHXsFIaEh8S0ExiUXRWSimDuBo
	ShrAvHSJp79lZh/veLAJAJcPXZGzr3HvYn7aAqzZuqlELqpmbMv+XjXui/zfAW1HeQBB
	oz+0rSrJENTzO0aCURN6RwsIEmeGjMDGwYtVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fsad5riA8MfyqTMoX8xI2VGSyEfaHL6jWQ5UCh4pEeE=;
	b=l6zmgD6nj94sJMLDtdEDm4bFpdZ0Wwr9VLoPLD1MJN+YyGLqEalgzGBcKU1Pb/ndBa
	U0NB6HcE1jSEZoKvyFPzX8b4tWLSu1LZilfTSL/VA13WFg1d/xtC3vu87IuDqzeTkwyJ
	vpEILKnq1du48sdUo46RjmA80T7bb5gdbI14Or/wXXWrjdFgc0Jc2UL/ujQfdNG1R1Fj
	xE6HRuRAk5urNXGxAGwwwTmtyZDjjg1F0JnnO/m3rkTsa9LQvJ/pkkC6v2nmtU3kHVqk
	RFPNXDQFXu82k9pzNzLZYMgwHQppCyDQW5Xw3igdXPST1wXJ/f6ltNCJo3sQyHttYTfn
	OI8A==
X-Gm-Message-State: AEkoousnMkcaf3z6JreViW98anaLazUeq4LWWq6x1chubwq5cRe7aSiFkdkeQYt+PbRTL8HCUmULJAW9XP3Tv1xz
X-Received: by 10.176.0.208 with SMTP id 74mr19357837uaj.64.1469802193834;
	Fri, 29 Jul 2016 07:23:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Fri, 29 Jul 2016 07:22:54 -0700 (PDT)
In-Reply-To: <c67f4f5e-3beb-2c59-2f7a-46a370343acc@redhat.com>
References: <1467798364-9049-1-git-send-email-eric.auger@redhat.com>
	<1467798364-9049-6-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9zz0Dr4+O02oDfjsjOAo=X1m=C2h48ged8_bDQiQmb6A@mail.gmail.com>
	<c67f4f5e-3beb-2c59-2f7a-46a370343acc@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2016 15:22:54 +0100
Message-ID: <CAFEAcA_vJZQeuJHjsCa1sG2cpBRbeNyigw=Y2PyDpS_5=Or4Aw@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::229
Subject: Re: [Qemu-devel] [RFC v4 5/6] hw/intc/arm_gicv3_its: Implement
 support for in-kernel ITS emulation
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
Cc: Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Diana Craciun <diana.craciun@freescale.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wmp7zXhFOpAw

On 29 July 2016 at 15:13, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
> On 29/07/2016 15:35, Peter Maydell wrote:
>> On 6 July 2016 at 10:46, Eric Auger <eric.auger@redhat.com> wrote:
>>> +/**
>>> + *
>>> + * We currently do not use kvm_arm_register_device to provide
>>> + * the kernel with the vITS control frame base address since the
>>> + * KVM_DEV_ARM_VGIC_CTRL_INIT init MUST be called after the
>>> + * KVM_ARM_SET_DEVICE_ADDR and the kvm_arm_register_device
>>> + * infra does not allow this.
>>> + */
>>
>> So the conclusion on the kvm-arm mailing list was that the
>> kernel ought to permit DEVICE_ADDR to be set after INIT,
>> the same way it does for the GIC proper, right?
> Yes this was indeed evoked but eventually what is in next, right now is
> the same implementation where KVM_ARM_SET_DEVICE_ADDR is forbidden once
> init is done:

That's bad and we need to fix it, preferably before it hits master.

thanks
-- PMM
