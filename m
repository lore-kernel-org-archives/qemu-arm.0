Received: by 10.25.208.137 with SMTP id h131csp724897lfg;
        Thu, 5 May 2016 06:13:15 -0700 (PDT)
X-Received: by 10.28.174.70 with SMTP id x67mr3252334wme.43.1462453995020;
        Thu, 05 May 2016 06:13:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m194si3718456wmg.82.2016.05.05.06.13.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 May 2016 06:13:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ayJ5N-0006lE-Re
	for alex.bennee@linaro.org; Thu, 05 May 2016 09:12:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayJ5F-0006Wv-0d
	for qemu-arm@nongnu.org; Thu, 05 May 2016 09:12:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayJ52-000847-Q3
	for qemu-arm@nongnu.org; Thu, 05 May 2016 09:12:43 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33124)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayJ51-0007x2-IU
	for qemu-arm@nongnu.org; Thu, 05 May 2016 09:12:36 -0400
Received: by mail-vk0-x22d.google.com with SMTP id o133so24555363vka.0
	for <qemu-arm@nongnu.org>; Thu, 05 May 2016 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vRlFSdXAoGxgM3Nvm9+LAoNj7lmGzInL7SeRZn3LKMs=;
	b=HL/g5bhdKDfu9VHbMCRYv08piw+VIwOcBoljmDDlsOY4/k8cEdOcoH/Pz8Eqb90MVm
	wTZts3N+i+Ym+ZPwS+dXjNX/n5BNR6+6O2huB9MZb0TNNOzSpB928eXN6jAc6I9PN7Ds
	QDIIpbwPvPsk4mZWaU9Cqms03ODcCVWZaVcQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vRlFSdXAoGxgM3Nvm9+LAoNj7lmGzInL7SeRZn3LKMs=;
	b=OIswsrgl3UXzIC/kqKigZw8X26rnLgG++W7dk2QmEvFf+P7BokUtPBV+dghhDO+x0Q
	HaZenfC7xi+QI9tZDzI0KKnHqPbMxk/Beslaz+iIL5aByUjTlU8SikSKGShB7QwFKaDP
	Jdg9qaUEqnGbbb4u39iGYMlYYU6F+D0XwmS5EOcAl1IxnWS3Tfax36zMlc5CW1IBuyWf
	4BbqK2QkyEQm9ydpx9D1Bw1pnfl6lbq9ia5DiJXlj+rP5ow1PFDlzQasOyWEKw3pCC92
	c9XXeiOJF00d94jGXALtRC0p5cCtvo1X8hFFatDCpsDCGGXWgqA7U+S9x8ym+t0lTCTY
	AtDA==
X-Gm-Message-State: AOPr4FWzuQ0ZJi6GSR62VxORBZabYyiue6USvSsqtR35sZ3YK3INcPeXozKSJSLkMZMmAwqTK+OOSYfh7jTekag0
X-Received: by 10.159.54.232 with SMTP id p95mr9095309uap.107.1462453933689;
	Thu, 05 May 2016 06:12:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 5 May 2016 06:11:54 -0700 (PDT)
In-Reply-To: <20160426112148.oyr4imw6ac2syxkv@hawk.localdomain>
References: <1461667229-9216-1-git-send-email-zhaoshenglong@huawei.com>
	<20160426112148.oyr4imw6ac2syxkv@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2016 14:11:54 +0100
Message-ID: <CAFEAcA-etT2a9m1MRxuJLCz5Se=WUtjTsWu-jFiFWaG2qPDFew@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v8 0/5] ARM: Add NUMA support
 for machine virt
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
Cc: david.daney@cavium.com, QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T4zRSPDuLBGf

On 26 April 2016 at 12:21, Andrew Jones <drjones@redhat.com> wrote:
> On Tue, Apr 26, 2016 at 06:40:24PM +0800, Shannon Zhao wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> Add NUMA support for machine virt. Tested successfully running a guest
>> Linux kernel with the following patch applied:
>>
>> - [PATCH v16 0/6] arm64, numa: Add numa support for arm64 platforms
>> https://lkml.org/lkml/2016/4/8/571
>> - [PATCH v5 00/14] ACPI NUMA support for ARM64
>> https://lkml.org/lkml/2016/4/19/852
>
> This series looks good to me, but I guess we still need to wait
> for the DT spec[*] to be merged first. Hopefully that'll happen
> around the time that the 2.7 dev window opens.

I'm going to put this series into target-arm.next now, really just
so I can get it off my to-review list. I think the DT spec being
in the for-next branch is a reasonable implication that it's stable,
and in the worst case that we need to make fixups we have plenty
of time before our next QEMU release to do them in.
Please let me know if any spec change does happen before the DT
hits mainline...

thanks
-- PMM
