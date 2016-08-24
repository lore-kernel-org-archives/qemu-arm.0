Received: by 10.25.21.156 with SMTP id 28csp258232lfv;
        Wed, 24 Aug 2016 03:54:00 -0700 (PDT)
X-Received: by 10.55.51.18 with SMTP id z18mr2421975qkz.258.1472036040187;
        Wed, 24 Aug 2016 03:54:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 13si5912043qki.173.2016.08.24.03.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 03:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcVol-0005jU-PF
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 06:53:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bcVoe-0005jI-NL
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 06:53:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bcVoY-0003yO-Uh
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 06:53:51 -0400
Received: from mail-ua0-f182.google.com ([209.85.217.182]:35077)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bcVoY-0003yI-GK
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 06:53:46 -0400
Received: by mail-ua0-f182.google.com with SMTP id n59so21164102uan.2
	for <qemu-arm@nongnu.org>; Wed, 24 Aug 2016 03:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nd8cht2obFi93iKSmNiismp792hBaPFxcbL/x/oHZ0o=;
	b=RViGEyt25A9pVOAfd04qyNyZ8QrKg+oK77Uel/tCYu/kj0V8dc/lMvyVuE6EQJEEWO
	z7LJKs2DCCdcLLlSAV+FXqaC9MlAtrHm1zfKQfIPIEiE6uflsTMC5xeL02Lc+cpbFmG5
	3y49TcjzFyh0Gr0hSaFJFSIxzvStpwMAWsk8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nd8cht2obFi93iKSmNiismp792hBaPFxcbL/x/oHZ0o=;
	b=HgJld/2YIc9EKiOU6N7UqPVkkk2d32YQfJSzT8rh5g+OLq1M6co37O0nMs8yLv1+wZ
	8A3teyDR1KiDm9DJL+HcTXmji68xyZRdyGqGyW6BmGe+y/GMUfdfOAgzslapTnr1gKLz
	tYRuLzcF2Cz7jjdGyJKZvfPUOEKxb1h+IoGG0utKN+vBT+7FO6N+CG+5ZfRNpEsDjvD3
	1xUt1/lvluVJ06vaOXe/VrNWoRvDzG8kiq0pkB720sIlnNiW6yRbFQsghsY+LficlGlT
	7b2YPX+/xuTGOg1IyRu2NgSe2UFW6d2AgFkk+p+5TdsdZzgWRX8vFLIH+8+/390ZLuxt
	aX+w==
X-Gm-Message-State: AE9vXwNwLKx1YGCGJAzNU7IT0tmVt4WPsrhQbN6N+K/tO3VZ0/oHjhCtgic8MbmxfJB08ytUvGRQDNvPP0Zi0wXv
X-Received: by 10.159.36.22 with SMTP id 22mr1016732uaq.119.1472035965645;
	Wed, 24 Aug 2016 03:52:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Wed, 24 Aug 2016 03:52:25 -0700 (PDT)
In-Reply-To: <CAGn-Tghj6gSgqD1s3ynb0zfodNwruhvMqK-P=7p0jvYVJc4ykQ@mail.gmail.com>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
	<20160824083457.GA2032@work-vm>
	<CAGn-Tghj6gSgqD1s3ynb0zfodNwruhvMqK-P=7p0jvYVJc4ykQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2016 11:52:25 +0100
Message-ID: <CAFEAcA9EkuHT4uV8RS1-ZaJBWWNrs87sGkmvhw0MfWGcAg4eoQ@mail.gmail.com>
To: Adam Richter <adamrichter4@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.182
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/7] Improve buffer_is_zero
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Liang Li <liang.z.li@intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aQUd+YeT8Sd3

On 24 August 2016 at 11:26, Adam Richter <adamrichter4@gmail.com> wrote:
> I hope that that consideration, combined with the micro-costs to
> readability and portability of using and ELF specific and perhaps
> currently GCC specific feature might tip the balance against the
> savings of a level of function call indirection that I assume the use
> of ifunc was intended to provide.

It doesn't actually save a level of indirection -- if you single step
through an ifunc call it goes via some ELF section. The thing it
does save is that you don't pay the cost of figuring out the right
ifunc to use on this system at startup, but only when the ifunc call
path is first used. That's useful for a big thing like glibc which
might have lots of ifuncs and not want to pay a big startup cost,
but for QEMU there's really no need given we only have one...

thanks
-- PMM
