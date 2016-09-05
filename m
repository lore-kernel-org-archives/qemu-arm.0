Received: by 10.25.87.130 with SMTP id l124csp305161lfb;
        Mon, 5 Sep 2016 15:13:02 -0700 (PDT)
X-Received: by 10.233.222.193 with SMTP id s184mr40564849qkf.154.1473113582724;
        Mon, 05 Sep 2016 15:13:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e45si9966213qte.88.2016.09.05.15.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Sep 2016 15:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bh28T-0002Ru-Vo
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 18:13:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bh28P-0002RI-Qp
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 18:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bh28O-0003zm-RY
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 18:12:57 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:36607)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bh28O-0003zg-51
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 18:12:56 -0400
Received: by mail-vk0-x22d.google.com with SMTP id w124so85821554vkd.3
	for <qemu-arm@nongnu.org>; Mon, 05 Sep 2016 15:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/1jb1YbhqGZGP6T38YIZx1ohb17klIs1v5iPUvL0SNE=;
	b=jvp+afnaHH91/+8zsrWW1Y8dkrkqwcbqtUsTIyTJowc/iNUxw9wB++Em/T2I5tV432
	5hBqalL4H/zU5TzZ6Xe4iNX+1/jdbn0//1juChEbxXgpMTe9wPq/Mh/6t0fuXvc7NvQy
	FFxj/zyACXFnBSeZUr8kC18Lf8HZt5y1YKjGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/1jb1YbhqGZGP6T38YIZx1ohb17klIs1v5iPUvL0SNE=;
	b=Mf02bZr4/YBUEOH/52ROViMh/cHTZduqpXOqwP1987ufyxe1aTTsbRtRNV05H3pdXH
	puhDb9zh6w4n8xmudUglE3CSIKYGx2ykcMko4uNE2/PKYaDQ4ZN/qD0KXWZTPQ3/aZ77
	BLj3oBIdl4j2fUYn77svhmQ3Bh0UKAbpVPF5JQFSgVBUghVsrQgiR+1b+vIZXYqJLJUs
	Kxqw7mbwEewb2t8yBITRXC1q5clXv3CLRlFGJntYCTP62Kf3J9PViUGA98XLO2cFEHvU
	YNQVBAtfRpDB76SKuRaHes0iCE7GD7YVu2/hRR/RnzeNFoEYEV6cQ976eUqOG8WCzlDW
	DZ3w==
X-Gm-Message-State: AE9vXwM5QPLLh6CJGpFLvvHm/Qm/mNlZDLxPzlpNxsg2O2ExLXS/ARR6i2Qj46H+Bf7rJxigN4OQ6ToEeVmB/4kI
X-Received: by 10.31.197.2 with SMTP id v2mr18463397vkf.83.1473113575501; Mon,
	05 Sep 2016 15:12:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Mon, 5 Sep 2016 15:12:35 -0700 (PDT)
In-Reply-To: <034e2688-83f6-23df-4e4f-da68ef1f580a@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
	<CAFEAcA-vNVToZ1gONUhUxa-2zwEVmd_sVSJOTLzH6ry+OnxS_A@mail.gmail.com>
	<034e2688-83f6-23df-4e4f-da68ef1f580a@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2016 23:12:35 +0100
Message-ID: <CAFEAcA9_ihKX0N4J02+yqkqAYU_h6EsHNzK-2dYubrVxBaoNEQ@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [PATCH v15 00/15] PTimer fixes/features and ARM
 MPTimer conversion
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BgiJU2GvaQiy

On 5 September 2016 at 22:52, Dmitry Osipenko <digetx@gmail.com> wrote:
> On 05.09.2016 21:14, Peter Maydell wrote:
>> I tried "check this compiles and passes the tests for each commit",
>> and what I found was that you get a lot of new warnings running
>> 'make check' about "Timer with period zero, disabling", which were
>> not there before. Could you look into this and fix it, please?

> Sure, I'll silence those ptimer error messages by making them conditional of
> qtest_enabled(). The messages are actually harmless, however not very useful in
> the context of testing. Thanks a lot for returning to that series, I appreciate it.

I had a look at the rest of the patches, but to be honest I found
it very difficult to figure out whether any of the changes were
making the right changes or the wrong changes. So it's not clear
to me that "silence the warning if running under qtest" is right:
why is the warning being produced at all?

thanks
-- PMM
