Received: by 10.25.208.137 with SMTP id h131csp1162538lfg;
        Mon, 16 May 2016 01:56:39 -0700 (PDT)
X-Received: by 10.141.30.201 with SMTP id t70mr29826818qhf.3.1463388999313;
        Mon, 16 May 2016 01:56:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w81si2242504qke.145.2016.05.16.01.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 01:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2EKM-0002g2-UY
	for alex.bennee@linaro.org; Mon, 16 May 2016 04:56:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2EKJ-0002ao-W5
	for qemu-arm@nongnu.org; Mon, 16 May 2016 04:56:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2EKI-0002NH-1G
	for qemu-arm@nongnu.org; Mon, 16 May 2016 04:56:34 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:35298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b2EKH-0002Mp-4E
	for qemu-arm@nongnu.org; Mon, 16 May 2016 04:56:33 -0400
Received: by mail-vk0-x22b.google.com with SMTP id f66so205425936vkh.2
	for <qemu-arm@nongnu.org>; Mon, 16 May 2016 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aKKXDKjlYYtLfUQ5IFG+e700qQ0EkNHi0h70hZvoa14=;
	b=htJRLZHEAW+AtKNU5SuM1/znDh1EqHtyym8JauJH8PV7dBDQed2WoFFjUzmasPSrpe
	URUjr2FCKnEDcyV0aszzI5x10p7jh2CsHqdShVh3UxUTn9ui0+/+hWiZv4oxzhe9ItQe
	OQF+rptHF5fgWyFmrAqN0eiHQ0gS7RD5MYrYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aKKXDKjlYYtLfUQ5IFG+e700qQ0EkNHi0h70hZvoa14=;
	b=LHf9Y8W7yltBAgzaSuyw7jOEUzj5lr97I3t/GwiMso01tVvdiK8W8BkvSnk9UkwqhZ
	fJMpReXZI8wMM5j2POP6PKkW8An/FkFmw3FefPSEnkBqsUBNJ96SZxdW25WqzEXWOFAn
	lROimmp494WhGxnqpxkUDR2Jfv9+NorqWZL5mfNo8HZdqG4hFwn98gNjCqEkUsxr0QwK
	TYjERNqe8nJJC5aAAGXZuCT0qP9xZw+jaok8F5scO5cVq+hlepbGqaOaV3/8eneIsaK8
	aNf1YUvNXuObYBhLT3Tk6puGun1RP0a5iKaDqUBvjKqP8G9fjU/ocLPB8lvAghYE2MRJ
	jBpg==
X-Gm-Message-State: AOPr4FWW3OS79z3lTuyTvE09Y0Q2kWCFXzG6jHn9ADUU/DdQSq9t1i5UH9CzLy0PAfRBoZhStwjAoXQ6M94Ve0Ap
X-Received: by 10.176.0.204 with SMTP id 70mr14738332uaj.4.1463388992225; Mon,
	16 May 2016 01:56:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 16 May 2016 01:56:12 -0700 (PDT)
In-Reply-To: <CAFEAcA_9ZuAb79S1-PCU2kJ=6cHTYbuHTmD2VaZyecgBG_oFuw@mail.gmail.com>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<1462814989-24360-12-git-send-email-peter.maydell@linaro.org>
	<5735ED3B.8010904@linaro.org>
	<CAFEAcA_9ZuAb79S1-PCU2kJ=6cHTYbuHTmD2VaZyecgBG_oFuw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2016 09:56:12 +0100
Message-ID: <CAFEAcA-dJA2iz=u-Omc4pYUO1TdvRsCY08-+ma1+ForF6iof_A@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH 11/23] hw/intc/arm_gicv3: Implement GICv3
 distributor registers
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Ph9JxS5m76Q

On 13 May 2016 at 16:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 13 May 2016 at 16:05, Shannon Zhao <shannon.zhao@linaro.org> wrote:
>> So I think it shouldn't call gicv3_update if attrs.secure is true and
>> irq < 32. And it should check the parameter irq in gicv3_update().
>
> If irq < 32 then gicd_write_ipriority() will return without
> doing anything. We'll unnecessarily call gicv3_update(), but that
> does no harm, and I don't think being slightly inefficient for
> an access a correctly functioning guest will never make is a big problem.

Thinking about this again over the weekend I realised you're right,
because gicv3_update() doesn't handle out-of-range irq numbers.
I need to either make gicv3_update() return doing nothing for
out of range IRQs or ensure we don't call it in that case (and
add an assert just in case).

thanks
-- PMM
