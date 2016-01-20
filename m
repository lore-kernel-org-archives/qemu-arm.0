Received: by 10.25.159.19 with SMTP id i19csp3233437lfe;
        Wed, 20 Jan 2016 09:04:36 -0800 (PST)
X-Received: by 10.140.252.212 with SMTP id x203mr47931288qhc.48.1453309474290;
        Wed, 20 Jan 2016 09:04:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si44599437qka.96.2016.01.20.09.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 09:04:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLwBN-0002Ef-Sn
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 12:04:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aLwBM-0002EU-04
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 12:04:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aLwBH-0007Mu-Vs
	for qemu-arm@nongnu.org; Wed, 20 Jan 2016 12:04:31 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:32943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aLwBH-0007Mj-Ok; Wed, 20 Jan 2016 12:04:27 -0500
Received: by mail-lf0-x244.google.com with SMTP id z62so860882lfd.0;
	Wed, 20 Jan 2016 09:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=CGUITctfHBv166nAzV4n6EYPxHC/3KzmViGWZxeWKfU=;
	b=nnUDthJcLn8/7paKgLWY/xbyynpyvZTplG3eNkg0VI8SWDjObxmaXK4VV6/DgE4pAj
	OxeVsclQqR3pkaiL/I813ziItwZxNxG2Gz3+MDM0UF+UBmL9nYHecbJVBcngqe23KvE2
	dCQZ+ljjkuGkPsODW3EkZI8PMq/apw2FObj9kn9+frcfqZQKZO7ABMOOVnqM4f7OXu0a
	bker/slUwQMM8kdirYph0Y4Ryr/bIOx1olP1HSHOiaKM0j0CWvK+uTAegVyJHP7aYsmf
	UrywT3zSe9jXSFddyYU6+HfzHp2dyEd/SBSbRbO+pSKbYIWF3PcTvkcM7tzyqbEEsUO8
	Hurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=CGUITctfHBv166nAzV4n6EYPxHC/3KzmViGWZxeWKfU=;
	b=TMJRnvEIUCplDKk/px1+FnmFSpYXftw1JXi/iv0ro8xwYh2RUtQL5laewYgvizoxkP
	1UfF1a9Usisc80NsrIG+Cr9ceMiTcfE8BQoUqGutx03CKJ3bvfdKdSyxbDyXFiNqCbDn
	RSg3i86n6EXe0sMQ71uJoXUd1mglK3evnpv32qDI8ihXbs3LAFlV4mCwQUzzTNzSIWag
	UAj4ruOEavcwsoVwp9gP4AvZAZNk3tNH03xsPbG9GpZpeRk8nnrP4sPRg/FJI2Ki1AIN
	XKDw3BYlTi0ja7BdfhvmqFhRtm8Q9oEKCiaBWgoeWHqYw9NXBWuVR2Y2wOke1NnqfZ3R
	zsYQ==
X-Gm-Message-State: AG10YOTPikZsbdCLLZiEJsPl8dO4va8p6NMS5tkQ3swNdUoKaXeN5WDFR0cAERM0SWBlcw==
X-Received: by 10.25.84.20 with SMTP id i20mr541113lfb.7.1453309466768;
	Wed, 20 Jan 2016 09:04:26 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	f4sm4678811lbs.10.2016.01.20.09.04.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jan 2016 09:04:26 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
	<9bdf3e1d349c7cfc6d75cc37430fe4f177c20734.1452359845.git.digetx@gmail.com>
	<CAPokK=qC77XBkNpHa1y_Dajd9Hv8+a-wx9iqC1dRumeKgvUvaA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <569FBDF3.2070405@gmail.com>
Date: Wed, 20 Jan 2016 20:03:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=qC77XBkNpHa1y_Dajd9Hv8+a-wx9iqC1dRumeKgvUvaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v10 2/7] hw/ptimer: Perform tick and counter
 wrap around if timer already expired
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
X-TUID: d6mOYmrVdGUG

Hi Peter,

10.01.2016 03:44, Peter Crosthwaite пишет:
> On Sat, Jan 9, 2016 at 9:39 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
[cut]
>> In addition, there is no reason to keep expired timer tick deferred, so
>> just perform the tick from ptimer_get_count().
>>
[cut]

I noticed an issue here... The problem is that device reset invokes 
ptimer_stop() that invokes ptimer_get_count() that might cause the tick after 
reset, i.e. bogus bh would be invoked after QEMU reset. I have reproduced that 
issue.

The solution might be to introduce ptimer_reset() that would stop QEMU timer and 
reset delta/load/period without invoking ptimer_get_count. And of course all 
devices should be updated to use new ptimer_reset() prior to "Perform tick and 
counter wrap around if timer already expired" patch, but that's not an issue I 
suppose. Please let me know if you have any objections, I'm leaning to do it in V11.

void ptimer_reset(ptimer_state *s)
{
     timer_del(s->timer);
     s->enabled = 0;
     s->period_frac = 0;
     s->period = 0;
     s->delta = 0;
     s->limit = 0;
}

-- 
Dmitry
