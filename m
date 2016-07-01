Received: by 10.25.21.96 with SMTP id l93csp383969lfi;
        Fri, 1 Jul 2016 09:38:50 -0700 (PDT)
X-Received: by 10.55.197.87 with SMTP id p84mr29040492qki.10.1467391130504;
        Fri, 01 Jul 2016 09:38:50 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n67si2825975qka.89.2016.07.01.09.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 09:38:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ1Ss-000617-00
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 12:38:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1QZ-000483-2d
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 12:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1QX-000831-3h
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 12:36:26 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:33310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1QW-00082p-P3
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 12:36:25 -0400
Received: by mail-vk0-x236.google.com with SMTP id k68so73398474vkb.0
	for <qemu-devel@nongnu.org>; Fri, 01 Jul 2016 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/TkOmXBZZ/Texy/jzxpTtFeYsu3Vr7wRM68L1eGPiew=;
	b=VcfeSHW7unh7pIcdsoJ94QIQVIBNYBDP0NfQX2oBo8yyK0c5SmW2CLPc1igLk+Dyao
	e2SSHeKPe7W3GqqrH/fSQqt3Ploqz2YWJOB0AdT3Ez4RX7mc6d6KJRh68GPSxza0Bb4W
	n0U1OkCM+BTLn99WyzghZXiPf7qQJhBsLKBD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/TkOmXBZZ/Texy/jzxpTtFeYsu3Vr7wRM68L1eGPiew=;
	b=h5N4JPQIMiduzgdm8i86aF9XYyCeX4mlP2JM8E0BOr+Zf87a/2YFTWvnvrnI3ZYhx+
	0Wr8Qe2G2+yrkE4hKmH6pFgWJ1tYcWPbcbDSYeZv1FVpmx628mYqFwZEBgHnA4ImaBjG
	tBdKGd7aMywyxigUKqOQydQHnDT1KvEEp9ZkyDrcHegBwPwvTLubFl62O1xto+wtaQch
	/fk1ZQqb3c961RDk007uq8mhCOQdflM4uwlOqQ2u6zZzfRoDLvh0i925/srml+00BX9b
	Qatr4/bPlTUDNje6jNVVqDtJXUsowtILNjlgmlCFT/EGWdRmZHOacthCuKZANRr3Kfw+
	P+KA==
X-Gm-Message-State: ALyK8tIrnc7pUfImgPtjdeNnoL149Tc4+dOSInXR3E1NK9h9xjAoQ8i5bNkOJp0vymnxL0s5rcjflryrNwKFiucR
X-Received: by 10.31.199.6 with SMTP id x6mr10256790vkf.17.1467390984123; Fri,
	01 Jul 2016 09:36:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.50.140 with HTTP; Fri, 1 Jul 2016 09:36:00 -0700 (PDT)
In-Reply-To: <121dd825-9c64-b3b9-bca8-41bcb984ec0f@gmail.com>
References: <20160625123521.16752-1-digetx@gmail.com>
	<CAFEAcA8HFfuEHP-d8+H3DC06+RpjjXqQoCX81w2Yr+Txsn5fSw@mail.gmail.com>
	<5814242b-8a8c-852a-51e8-268033b51200@gmail.com>
	<CAFEAcA8788W2infUBneuUh4eNMLqPpdNzGXqKESgi+ZKpigdyg@mail.gmail.com>
	<121dd825-9c64-b3b9-bca8-41bcb984ec0f@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 17:36:00 +0100
Message-ID: <CAFEAcA-ZGbR2nz80n=QcxRTr=PN5EMQ-OrbncaAQnHMwmhPtZg@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-devel] [PATCH v2] hw/ptimer: Don't wrap around counter
 for expired timer that uses tick handler
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fiu+pLW+WH9q

On 30 June 2016 at 20:01, Dmitry Osipenko <digetx@gmail.com> wrote:
> On 30.06.2016 18:02, Peter Maydell wrote:
>> What I meant was: ptimer_get_count() is typically called to generate
>> a value to return from a register. That's a separate thing, conceptually,
>> from whether the device happens to also trigger an interrupt on timer
>> expiry by passing a bh to ptimer_init(). So it's very odd for a detail
>> of interrupt-on-timer-expiry (that there is a bottom half) to affect
>> the value returned when you read the timer count register.

> In order to handle wraparound correctly, software needs to track the moment of
> the wraparound - the interrupt. If software reads wrapped around counter value
> before IRQ triggered (ptimer expired), then it would assume that no wraparound
> happened and won't perform counter value correction, resulting in periodic
> counter "jumping" backwards.

That just says you need particular behaviour between counter reads
and IRQ triggers; it doesn't say that you need the behaviour to be
different if the ptimer code doesn't know about the IRQ trigger.

thanks
-- PMM
