Received: by 10.25.44.15 with SMTP id s15csp5939100lfs;
        Tue, 18 Jul 2017 05:46:03 -0700 (PDT)
X-Received: by 10.200.8.20 with SMTP id u20mr1775515qth.4.1500381963750;
        Tue, 18 Jul 2017 05:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500381963; cv=none;
        d=google.com; s=arc-20160816;
        b=d9e+aipjxfqrFqFV4YpENcf+HPtgqDBpEMq60Y0ZMAouSaA2MI/f/v3DN+0U0BhfcB
         ikZvxZmBMZgdy9JS+R0BEMtmBfyCLc3EWHD05mYSgLmzR/hM1P9sqYHb43k6iXbI9QKV
         4nTz7J7Wj0a94LaA18lwb8bs4ull9s2v2jrTcAhPzSco/EQ5hmzLKO9VvBbDFFKGX7iw
         4SFQ0wUemTbmXmkAbvywCKyHvChGm7EE43u6DQ04BRUwYUzaWNLo5+8D2AhemLyH3YCJ
         G+VYM+DeDhffpFRUACP0MSU7vggKMttFugP83wT9LiQeRyStSFCRohZgBHQWD0E3qj72
         3qgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xYsxERifqhFB+z7d5ZA41rH9IFFGmCYDlFcUzh1Y2vQ=;
        b=t/0j2oACVAon7afat1HBL5CFXhoSfr797lXQmbtZdsdlgMRiioUeXKWsoqhjZdShr3
         oJk3IShdyAw66USTNm46JNWInGCGDQ3eVJtLRCZAIXmW19m8Q7RblZeC1kHI9gGPo5RP
         Z7cA1nwZlkbvEY8mr+AOlQh1FeCtW6xm7ZiR0rILi9JbuLZutOnrAeev4CpPkSa1Q7GQ
         m2/S0E96QE2P/eCOKFKHT+8jcqRnbbofbCIhF4iAuH0WEqRGQUUZ86r5GZDECPUCxlMP
         SewWWV6R7qYYaCYa+yBFK2FKtHAPBlrliwTGF5t0py6nc6ExKujDNU81FaUFJvUSvrvV
         mEFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=cU64egTi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s185si2002905qkc.26.2017.07.18.05.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Jul 2017 05:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=cU64egTi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXRt3-0001b4-7t
	for alex.bennee@linaro.org; Tue, 18 Jul 2017 08:46:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dXRs1-0000e3-Sh
	for qemu-devel@nongnu.org; Tue, 18 Jul 2017 08:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dXRs0-0006zd-Vl
	for qemu-devel@nongnu.org; Tue, 18 Jul 2017 08:44:57 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:35302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dXRs0-0006yA-Ok
	for qemu-devel@nongnu.org; Tue, 18 Jul 2017 08:44:56 -0400
Received: by mail-wr0-x22c.google.com with SMTP id w4so27237432wrb.2
	for <qemu-devel@nongnu.org>; Tue, 18 Jul 2017 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xYsxERifqhFB+z7d5ZA41rH9IFFGmCYDlFcUzh1Y2vQ=;
	b=cU64egTiLWvSpzI4BF3RLIP7rUqLdHAdntU+5CpT9HB3ZcaEAN6HNU6nMrCRzwen6k
	w0v6Mb2cajnmxz/mp3OJbdPOpi6bMaELeo5qm155N/1WYVLhq/3T/tA42NAhz+G3YPey
	IxRnU1wvz5BE7pvGvn/F7RfhfPM7XzgOzXgjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xYsxERifqhFB+z7d5ZA41rH9IFFGmCYDlFcUzh1Y2vQ=;
	b=t1vyj20/9OH0TvHGYJhaa8WaK+Rw6YzYsPICbyLWlMvj+9eFyZc4IUO6YpwHoAa6Qe
	BDMKI06MqUuAYR8ARjj7TUz16o4gwQLZj8zrtHmQoclWVwti8yUezjm/yINR5DGfdGV9
	4YHoleiQKlUnqIfXCihGuPQEjgF71SIm9K8O3v2hvda+cr+nFXE2/r0mPA7kvEGg7prx
	o42810jbPHso6KoKfD+fTK2CNhZxi9CIOBuQ1r+vc9QU1HRt8Ef+KEkYRqAJZO/NoQem
	O5wsyJWwjRXf8jiZneIu5Tp0aRjkbWuhUT5swtQk4bS1B61cCPjMV9KHERZxUp2CLYLt
	eW2w==
X-Gm-Message-State: AIVw111/UQI9O69rRbSIf7YchN6Bau7cxEgMA0oVLwKYXeAIFaCYSqY9
	p88fDZtCmMa7r4ayH0YD3pIIa1uFi7Ci
X-Received: by 10.28.84.19 with SMTP id i19mr2041232wmb.65.1500381895356; Tue,
	18 Jul 2017 05:44:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 18 Jul 2017 05:44:34 -0700 (PDT)
In-Reply-To: <20170718123845.c2g3t4m4pyqofk2l@kamzik.brq.redhat.com>
References: <1498927637-14496-1-git-send-email-drjones@redhat.com>
	<1498927637-14496-3-git-send-email-drjones@redhat.com>
	<CAFEAcA-CQm1FuF7eyveSbSchRD1PkB-PDVNyMQhVny+bmWWAvg@mail.gmail.com>
	<20170718123845.c2g3t4m4pyqofk2l@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jul 2017 13:44:34 +0100
Message-ID: <CAFEAcA_6XronVOOCbWgJXctx6bp+nYys+cCsjUmtCiuaBjUb-g@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-devel] [PATCH 2/3] target/arm/kvm: split pmu init from
 creation
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eY086W7AtWiy

On 18 July 2017 at 13:38, Andrew Jones <drjones@redhat.com> wrote:
> On Mon, Jul 10, 2017 at 04:27:35PM +0100, Peter Maydell wrote:
>> On 1 July 2017 at 17:47, Andrew Jones <drjones@redhat.com> wrote:
>> > When adding a PMU with a userspace irqchip we only do the INIT
>> > stage of the device creation.
>>
>> Can you explain why? My assumption would be that either
>> (a) we don't need the kernel's PMU, in which case don't
>> create it at all, or
>> (b) we do need the kernel's PMU, so we should both create
>> and INIT it.
>>
>> If we do one but not the other then we've left a half
>> created and unusable PMU device in the kernel, haven't we?
>>
>
> I should have renamed the 'create' function to 'set_irq', then
> it would make sense, because after the split done by this patch
> 'create' only sets the irq, which can only be done with an
> in-kernel irqchip. Both irqchip types still require INIT though,
> see kernel doc Documentation/virtual/kvm/devices/vcpu.txt.

Oh, I see, I read the commit message as "we only do the
INIT stage when adding a PMU with a userspace irqchip",
which isn't the same meaning as what you actually wrote.
(perhaps "When adding a PMU with a userspace irqchip we
skip the set-irq stage of device creation" would be clearer?)

> I'll send a v2 that renames the create function. But, before I do,
> assuming the rename, do you have another comments on this or the
> next patch? We might as well batch all the changes :-)

I think they looked mostly OK. A minor nit:

+        if (kvm_enabled() &&
+            !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
+            return;
+        }
+        if (kvm_enabled() && !kvm_arm_pmu_init(cpu)) {
             return;
         }

might be better as
       if (kvm_enabled()) {
           if (!kvm_arm_pmu_create(...)) {
               /* error handling */
           }
           if (!kvm_arm_pmu_init(...)) {
               /* error handling */
           }
       }

(and I'm not sure "silently return" is really the right error
handling, but that is what we do currently, so whatever.)

thanks
-- PMM
