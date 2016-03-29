Received: by 10.25.208.211 with SMTP id h202csp2227272lfg;
        Tue, 29 Mar 2016 12:01:04 -0700 (PDT)
X-Received: by 10.140.92.15 with SMTP id a15mr4782310qge.93.1459278064104;
        Tue, 29 Mar 2016 12:01:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y83si121436qka.43.2016.03.29.12.01.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2016 12:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1akysx-0003mU-OC
	for alex.bennee@linaro.org; Tue, 29 Mar 2016 15:01:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akysv-0003iZ-JL
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 15:01:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akysu-0003Mr-OX
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 15:01:01 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:34630)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akysu-0003Mf-Ke
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 15:01:00 -0400
Received: by mail-vk0-x22c.google.com with SMTP id e185so31724158vkb.1
	for <qemu-arm@nongnu.org>; Tue, 29 Mar 2016 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LiwJwlyvWRAoYWouR5CFEEIlYOPbHHksXRLV39r862o=;
	b=YQcT3U6vHtrW7QC6vXoEWuAJCJ5KXTZMZBEu8KvVby5G/PmZzot7UK2iKdo3VB/PVq
	ZBxhnawPcA2nPGrPJQUrqpB/ryEc1HtsCRIwH0hsw+53gn+IYhz2UxUIcFGJ4+ssi9YC
	aJxoAJHBQAYZCsmdiSdakAp9mMtIWZ8OttdZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LiwJwlyvWRAoYWouR5CFEEIlYOPbHHksXRLV39r862o=;
	b=YsoTnFMkNYYTS3fUTzXWiAdDnm+IBtRs9JIui91B8EW4sSmVq/tYT6OaEm8yYgONak
	yWV+b67saXrIAbV3V22ghTwLcoMtIOQ44AuM0yCndUui2steiHuS7Repm66eon/tPi1I
	XYHdyh0q96yORwt5+ecVi3SLhQT2BHtmy0iPSkawdf66I4ksvE70ftf4GlFmTQbkjUg4
	OPx1sUfJ0bLVHMccMwp72tLcEtIYmsO6FXIV5nMRsQO/4MsOtUfQZxkWUCoFHRG6binH
	IlQA03CWMx+7Qyf65s8CgkqJ1h0iGV7OG6R8roYXJA2LiMvYHSLzZoDdXXN4ADrjqjUf
	M/nw==
X-Gm-Message-State: AD7BkJJxVX6wXxL6O3eIYbaTpN4dNUE+YgWWczf/6qAcodygSWcjzK+MYsFsS5D0FmRHeJj/FjN7Y6p7ocvJmtji
X-Received: by 10.176.0.212 with SMTP id 78mr2466537uaj.4.1459278060107; Tue,
	29 Mar 2016 12:01:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 29 Mar 2016 12:00:40 -0700 (PDT)
In-Reply-To: <56F92FFC.4020805@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
	<CAFEAcA8ozt0SdmfgzKVSr+2Y7ou2u29g=Y35u-jmi5O8ZgH7qg@mail.gmail.com>
	<56F92FFC.4020805@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2016 20:00:40 +0100
Message-ID: <CAFEAcA_SCnc_C_LteDMRwSXFa80gKOt0Gimc_R8vjVURWx8pSg@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v12 0/9] PTimer fixes/features
 and ARM MPTimer conversion
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
X-TUID: itlE/0q7J/B+

On 28 March 2016 at 14:22, Dmitry Osipenko <digetx@gmail.com> wrote:
> Hello Peter,
>
> 16.03.2016 17:36, Peter Maydell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 30 January 2016 at 16:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>>> Changelog for ARM MPTimer QEMUTimer to ptimer conversion:
>>
>>
>> So, where are we with this series? It looked from the mailing list
>> threads as if there were still a few things Peter C hadn't got
>> closure on, but we're rapidly running out of time before hard
>> freeze :-(  I'd really rather not have to push it out by yet
>> another release, especially since it got posted back in January..

> It still pending for the review and the due date is tomorrow, maybe you
> would want to pick some of the PTimer patches for 2.6.
>
> PTimer fixes ready for submission:
> [PATCH v12 1/9] hw/ptimer: Fix issues caused by the adjusted timer limit
> value
> [PATCH v12 2/9] hw/ptimer: Perform counter wrap around if timer already
> expired
> [PATCH v12 3/9] hw/ptimer: Update .delta on period/freq change

I'm afraid at this point I really don't want to apply changes
to code like ptimer that affects multiple platforms; this will
have to go to 2.7 :-(

thanks
-- PMM
