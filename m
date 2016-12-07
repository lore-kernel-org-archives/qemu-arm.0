Received: by 10.25.159.131 with SMTP id i125csp416329lfe;
        Wed, 7 Dec 2016 08:06:53 -0800 (PST)
X-Received: by 10.200.49.165 with SMTP id h34mr58306391qte.43.1481126813572;
        Wed, 07 Dec 2016 08:06:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t44si14785781qtc.169.2016.12.07.08.06.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Dec 2016 08:06:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEek8-0004BU-Qx
	for alex.bennee@linaro.org; Wed, 07 Dec 2016 11:06:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cEek1-00048k-31
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 11:06:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cEejx-00074u-47
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 11:06:45 -0500
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34835)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cEejw-00070A-UT; Wed, 07 Dec 2016 11:06:41 -0500
Received: by mail-oi0-f68.google.com with SMTP id v84so46185741oie.2;
	Wed, 07 Dec 2016 08:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rByx19ui24hJllqKVywKZ6waNQRxEx+uaJziH5/LA58=;
	b=DEM0mLcdOV3ud1tEzrzw6crkpaF6f0oIi/AovPPzSbx+Ui16GLu9zoazN8auDo0Urc
	JuMEORKlmoSR+dBNg6+Gq3xfa9Hx1Pwc3+iae18SbjnhaBVYv4BbjFSbARBYrEDccmCs
	NVaoMxiKhoIi3+2kWMl8ojSI2zCCp89paG7YDZsdo/+xpyIhBFaZQHpbzOId0UYVoKI3
	S9G4iuP/U+ZSIxiqwDNOZcXrVW2wwfbxX1l9HWpIs3f7DuFc1qz/Fk6YsozoGP8FGYDC
	kfS0c/3v6Tej12yUzQ+8m9an8GPsmcNwIPb5ZesZLLZRuPBtH3sODJWUnvd+zwkwgmUn
	rWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rByx19ui24hJllqKVywKZ6waNQRxEx+uaJziH5/LA58=;
	b=AHcjFXYKXG4+QWPcxJ4ZVILGMSwo+NDvWn1OfVQvceOwzu0NaDj9FaQFW/PgeV+A2B
	yJoP+Lj87wusP3fEMf2WsTxgtriLQKJMKENd2EOCu8TX+TvBbZFYUvCdW/9fPdyLexUg
	0aKm/jDh+E72she8oKenJoi1WVn4kXcmx+EeME1NEILiAYvZMki59BbF+rYnj5/3bent
	qE9fQJXJUpvyQbySWV+nBjZsQFLQnZc93xn8Nt7UuN2f+s5zktvavgkgqG67Jw4/0jAm
	rK91QtqnEKBHHL+7COR0FLimP70O1Ei3+gWabdqI0mXC8I37dJ18WSvhSSz3Y0xm38D9
	m6rQ==
X-Gm-Message-State: AKaTC02w19tjJPXlsPdX+A/2p1JKwtIZtAxPbEMhubeACA22uPshwxv0YNefe9oDQzESxMCna8/k4XWPkyxUkw==
X-Received: by 10.157.5.70 with SMTP id 64mr37022351otw.104.1481126718342;
	Wed, 07 Dec 2016 08:05:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.36.15 with HTTP; Wed, 7 Dec 2016 08:05:17 -0800 (PST)
In-Reply-To: <CALicx6t=C9dmXY_nQgumgr11qAydr1Q6VseWCBBNy9uEFXaCGA@mail.gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-5-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA_O+72r2aMdMiVD-mnH41Y9YMaLRvcj1hxrbj_CNRk1Sw@mail.gmail.com>
	<CALicx6tkFEADfEK80gbbB5s6fM5xAvCUwoG26AqMyn2stQcj2A@mail.gmail.com>
	<CAFEAcA9j12HCoZNCpTt+07=+sSz6vM=Zu7rR6EN-SCq1h9GMww@mail.gmail.com>
	<CALicx6tPXCyxF_2d6oVzQrmc5W8C4R+8i4gPZWWYBGY9PWdJeA@mail.gmail.com>
	<CAFEAcA82q1jRrNwR_7Nya3Dm2knOCsx54kovaN3NS8J_9eQFeA@mail.gmail.com>
	<CALicx6t=C9dmXY_nQgumgr11qAydr1Q6VseWCBBNy9uEFXaCGA@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Wed, 7 Dec 2016 21:35:17 +0530
Message-ID: <CALicx6voxE6Bwz50dHuPhB-ErfAw0kKu6L3KBJKidDtS5Z0+qw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.218.68
Subject: Re: [Qemu-arm] [PATCH v6 4/4] hw/intc/arm_gicv3_kvm: Reset GICv3
 cpu interface registers
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OAxmRN9iqckA

Hi Peter,

On Thu, Dec 1, 2016 at 3:40 PM, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Wed, Nov 30, 2016 at 10:29 PM, Peter Maydell
> <peter.maydell@linaro.org> wrote:
>> On 30 November 2016 at 16:23, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>>> On Mon, Nov 28, 2016 at 10:05 PM, Peter Maydell
>>> <peter.maydell@linaro.org> wrote:
>>>> Still I would prefer it if we did this with the same
>>>> mechanism for both TCG and KVM. A generic mechanism for
>>>> "let the CPU reset trigger reset of many other devices in the
>>>> system" isn't widely useful because real hardware doesn't
>>>> have that kind of action-at-a-distance behaviour.
>>>
>>> To make direct call from arm_cpu_reset() to reset CPUIF,
>>> I could not find a way to get GICv3CPUState from CPUARMState or
>>> ARMCPU struct.
>>
>> You don't want to directly call from arm_cpu_reset().
>> Coprocessor regs registered via cpregs can have
>> reset functions, which get called automatically.
>> This is what the TCG gicv3 code already does to reset
>> the CPU i/f, the relevant code just needs to be
>> arranged so it's used for KVM too.
>
> Yes, the reset functions of cpregs get CPUARMState as parameter
> and still we cannot fetch GICv3CPUState from it.

I propose to add new variable to CPUARMState to store
GICV3CPUState to able to access when cpregs reset is called.
Is it ok?

>
> The TCG code in arm_gicv3_cpuif.c is rely on el_hook to get
> GICv3CPUState.
>>
>>> Any idea how to get GICv3CPUState?
>>>
>>> In  hw/intc/arm_gicv3_cpuif.c implementation,
>>> el_hook function is registered to fetch GICv3CPUState
>>> from CPUARMState struct, but it is for TCG
>>
>> Yes, you don't need the el hook.
>
> Without this is there a way to get GICv3CPUState for KVM?
> I am not familiar with this code.
>
>>
>> thanks
>> -- PMM
