Received: by 10.25.77.65 with SMTP id a62csp529013lfb;
        Fri, 10 Feb 2017 07:12:19 -0800 (PST)
X-Received: by 10.200.41.3 with SMTP id y3mr8059271qty.205.1486739539088;
        Fri, 10 Feb 2017 07:12:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q33si1457795qtd.32.2017.02.10.07.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Feb 2017 07:12:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ccCrw-0003Ss-Df
	for alex.bennee@linaro.org; Fri, 10 Feb 2017 10:12:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ccCrp-0003Sj-Sk
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 10:12:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ccCro-0004Gl-Ri
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 10:12:09 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:37957)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ccCro-0004GR-Kk
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 10:12:08 -0500
Received: by mail-wm0-x235.google.com with SMTP id r141so50998051wmg.1
	for <qemu-arm@nongnu.org>; Fri, 10 Feb 2017 07:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4GsMSySPbEECdS63VNZLgYekgEfnziX4zFOGJhjeOtw=;
	b=fWPUKSlUYWw2qYkLR2ln2/+nebU6569oSBiXBcd6igEvVhCCWfdfZ4MYeBicRfNhdy
	RNQSXKDZwDCL4MJbKQm/PjLEMfV3GgtxO8fEtU0s0d8vY5jnNJUgPxQtmPSVBjlaeUtI
	vBu6a5dxEOtbKIjx6PzgJOR01j1kepJHp1bng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4GsMSySPbEECdS63VNZLgYekgEfnziX4zFOGJhjeOtw=;
	b=bgsjZ8AYoczZqxANvrpBghoWoqOJRUqT4jivl720ArCXu+OZbRgy2PBo55pZBU9Xas
	qpuhfxG0puQie4V0rj0S3Ck8yOAoT83lFaE5c4mU5/HPkv7RsogdJpilCgi3FqYE1KzC
	wIEHP01F5j9lOOL/lT2f1I1F6YQTYf0oMoikvVGtl9e3A9Zch6gvPkBfvRDKFVlv9DlR
	0mdGtgKnWEZbjtmtwiW1Pf+MB+EIur9z+263ubMDGCLMAf+cpSG2p9866kxN7Fq0alXi
	nb1zVn4lEB73dqZi53ivHzfPyEE8+tctLVSXKlNuQraEwXdaCrMhyO244zf4FQEJADvi
	l60g==
X-Gm-Message-State: AMke39lzwORjBwNNzbrMyKKOLUNJIClPqTLnZuigBOZeVN/pah/zwaiNLBazk1TBb5I2js8X0dwfHWScvxmA4tfF
X-Received: by 10.28.91.16 with SMTP id p16mr7722442wmb.111.1486739527546;
	Fri, 10 Feb 2017 07:12:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 10 Feb 2017 07:11:47 -0800 (PST)
In-Reply-To: <CAFEAcA8+3+ZwOeA0cNXF_BRs-kivTye5bj7pcRsDAsJ4S1HwTg@mail.gmail.com>
References: <1486504171-26807-1-git-send-email-wei@redhat.com>
	<CAFEAcA8+3+ZwOeA0cNXF_BRs-kivTye5bj7pcRsDAsJ4S1HwTg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2017 15:11:47 +0000
Message-ID: <CAFEAcA8QFWi8-XmJyiWM15y8dUqFCbaqt9wuZ70Y7_Qgsa=CyQ@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-arm] [PATCH V3 0/4] Add vPMU vPMU support under TCG mode
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vb7nRx+PrjG9

On 10 February 2017 at 15:00, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 7 February 2017 at 21:49, Wei Huang <wei@redhat.com> wrote:
>> QEMU has implemented cycle count support for guest VM under TCG mode.
>> But this feature is not complete. In fact using perf inside a
>> 64-bit Linux guest VM (under TCG) can cause the following kernel panic
>> because some PMU registers are not implemented.
>>
>> [  329.445970] [<fffffe000009e600>] armv8pmu_enable_event+0x58/0x8c
>> [  329.446713] [<fffffe0000621e74>] armpmu_start+0x4c/0x74
>>
>> This patchset solves the problem by adding support for missing vPMU
>> registers. Basic perf test can work (both ACPI and DT) now under TCG
>> by applying this patchset.
>>
>> address@hidden ~]# perf stat ls
>>  Performance counter stats for 'ls':
>>
>>         226.740256      task-clock (msec)         #    0.312 CPUs utilized
>>                 76      context-switches          #    0.335 K/sec
>>                  0      cpu-migrations            #    0.000 K/sec
>>                 64      page-faults               #    0.282 K/sec
>>        186,031,410      cycles                    #    0.820 GHz      (36.40%)
>>    <not supported>      stalled-cycles-frontend
>>    <not supported>      stalled-cycles-backend
>>      <not counted>      instructions               (0.00%)
>>    <not supported>      branches
>>      <not counted>      branch-misses              (0.00%)
>>
>> V2->V3:
>>  * Remove PMXEVCNTR_EL0 support
>>  * Add read access support for PMXEVTYPER and change the CONSTRAINED
>>    UNPREDICTABLE behavior of PMXEVTYPER to RAZ/WI.
>>
>> V1->V2:
>>   * Change most PMU registers to 64bit and the behavior of PMXEVTYPER
>>   * Add support for PMXEVCNTR_EL0
>>   * Misc fixes (DT, ID_AA64DFR0_EL1, ...) under TCG mod
>
> Applied to target-arm.next, thanks.

...though patch 1 breaks compilation of linux-user targets. I've
fixed it up by moving the #ifndef CONFIG_USER_ONLY to the right
place to cover the new regdefs.

thanks
-- PMM
