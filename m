Received: by 10.80.166.35 with SMTP id d32csp1107996edc;
        Tue, 18 Oct 2016 10:23:12 -0700 (PDT)
X-Received: by 10.55.209.207 with SMTP id o76mr1539205qkl.276.1476811391953;
        Tue, 18 Oct 2016 10:23:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u24si21605639qtc.60.2016.10.18.10.23.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 10:23:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwY6Z-0001tN-7S
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 13:23:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwY6R-0001s7-P3
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 13:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwY6Q-0002P1-UC
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 13:23:03 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:35323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bwY6Q-0002Os-PC
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 13:23:02 -0400
Received: by mail-vk0-x22b.google.com with SMTP id q126so449915vkd.2
	for <qemu-arm@nongnu.org>; Tue, 18 Oct 2016 10:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TWooMWRIY9PrlNrEz/Uj1E3O+r3MauD5qM5V5BxjtQo=;
	b=dwXmE8+75s3S7HEliRBWMksMNCdvsjHYZZe5khdpsHR4IZ+XbNk9x9oQ1ULbke8A+X
	DLNhiWy5obudBkZD8fbrw5tzHUEb4PRxmBo/7VqywP1G52BgpXdQ3EdB4fdb43q341MM
	qfCj4b7R/t4OJrguF7fznI++VfbDNm/N1QNCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TWooMWRIY9PrlNrEz/Uj1E3O+r3MauD5qM5V5BxjtQo=;
	b=WGMivxnIRbBxizT2JT7ahfkbVsJQatYL9jeJ/VIOqwWS5I2YLQVhVjLMcpjDy6q+v9
	Gkjb3ym9893Jx1XL0KlYbVsDtwA7pSC01wqGPONSDojc9BnalQT+ESiOK0Bwn5KHm7/u
	HsrjAOolmO3m6MgRrjEz9kKGdaRvnx5vF5IfxNrK0itFLOFxsCnOTvbov7AekaOSb1ZS
	s23I1RwieWrF0panMTly3XunRPNkwV3Bv7WPUMa/BH20gT17opd//UAwedakvibC57Sm
	NnUzJEL1R4jOaSIIE15wcvqYZ8fzBD0Vznp4JTSSV211KKa346a4ECqWd0wUYm+tBRx5
	67UA==
X-Gm-Message-State: AA6/9RnJ9sqB/Dc4Sv472V5cqg3Kpa2Lgc4LaMa+PyOYVV280gVgScWxB/44+oSUnUHyNwa4iUqbIvqY8FZuveK4
X-Received: by 10.31.0.67 with SMTP id 64mr1648174vka.173.1476811382111; Tue,
	18 Oct 2016 10:23:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 18 Oct 2016 10:22:41 -0700 (PDT)
In-Reply-To: <20161018171638.vvpbc3ct4vztqntu@kamzik.brq.redhat.com>
References: <1475617134-28180-1-git-send-email-wei@redhat.com>
	<CAFEAcA_vTEjMK1Eex8Z41L2reWHK8oZ_XyekKv1r7eby+J+y7A@mail.gmail.com>
	<20161014074828.ewvvz2hn3cwtfpve@hawk.localdomain>
	<20161018171638.vvpbc3ct4vztqntu@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2016 18:22:41 +0100
Message-ID: <CAFEAcA-h0JsHXtLUc06CJhv8e9DMwvTA8TLe8NAzGYPfaO+1xg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V6 0/2] Add option to configure
 guest vPMU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z32LaETFdtkR

On 18 October 2016 at 18:16, Andrew Jones <drjones@redhat.com> wrote:
> On Fri, Oct 14, 2016 at 09:48:28AM +0200, Andrew Jones wrote:
>> The feature needs to be managed in order for users to be able to trade-off
>> features exposed vs. migratability. If the lack of an explicit pmu=on
>> means either you get a PMU, when it's available, or you don't, when it's
>> not, then managing the feature becomes more difficult. Also, libvirt
>> already manages this cpu property for x86, and there it defaults off.
>
> We discussed this today with Andrea. He says libvirt doesn't mind the
> default being on. x86 defaults pmu off, ppc defaults pmu on. I guess
> we might as well stick with on, it should make things easier.

If we don't have a clear architectural consensus then I think we
should stick with 'default is on'. That seems less confusing than
"it was off, then in 2.7 it was on, then in 2.8 it's off again".

> If we switch to default on, then the only way to turn it off is with
> pmu=off added to the command line. So we'll know if pmu=off is given
> and we can just ignore it for virt-2.7. If we don't care about keeping
> the property off the virt-2.7 command line then there's no need for a
> tri-state.

I don't much mind what virt-2.7 does with pmu=anything, I
just don't want a tri-state, and particularly I don't want
a tri-state just to get a particular behaviour out of a
machine=virt-2.7 command line that wouldn't have worked on the
real 2.7 release.

So we should arrange it whichever way is most convenient, I think.

thanks
-- PMM
