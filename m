Received: by 10.25.208.211 with SMTP id h202csp805386lfg;
        Tue, 15 Mar 2016 13:42:03 -0700 (PDT)
X-Received: by 10.140.32.245 with SMTP id h108mr101691qgh.50.1458074523308;
        Tue, 15 Mar 2016 13:42:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p129si27965304qha.127.2016.03.15.13.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 13:42:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:51448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afvn0-0003r1-T1
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 16:42:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afvmx-0003qR-7t
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 16:42:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afvmw-0001CH-8P
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 16:41:59 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:32901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afvmw-0001C4-0n
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 16:41:58 -0400
Received: by mail-vk0-x229.google.com with SMTP id k1so36882813vkb.0
	for <qemu-arm@nongnu.org>; Tue, 15 Mar 2016 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aWPJgNiT6hQqx4otpN3NXn9fpRozZzm+xVim86q20Pg=;
	b=RHIcwHIFptuTLD+pVaHME5QUmH9Ty0RE7zJUrMIdjPbRCGe0MN7rjBcfF/Kk6J09Zt
	ZYYE/7Z8zxXcvwbgB6ByC+MReXOSd8FRZ3fjbevX/5eM7pi1hWQidpIWnIOq0iG+7Bzx
	gh80U2z3/Bf5bCR0d5NWcdaCkLJaj1ck+g4qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aWPJgNiT6hQqx4otpN3NXn9fpRozZzm+xVim86q20Pg=;
	b=M3ZGBwHtnspyXjyGDslIZr+J3c4EQ+1XO5xYqCQorNrAxfTBh0LiG5iu5ceSSYhczd
	sYVenr+Y762esLawSLRjhNE63+PyYM6BOlNruhKOIES4PChJ0UaSGRt0U/kWh3MgNO9R
	9ki/ZgjdzNia0uH6BUVSk7F9iUI7qDyDHdUrW9+i6saRvWKcpS4X5HERQ91evTwWrxRf
	P1gDSQQW5voTGMU0Dn6IdYefGfJoY8zZDr6jxy2es1Wat96GAge+htYKsgX60EhwF1JS
	Zm8CF12e5qiVXvAUY048RHvY9LQ2i/7pIUnwFsI+8OVeRo9JES2ZfiFq+lpLz7CwgIpj
	nDfQ==
X-Gm-Message-State: AD7BkJIwd1Ky1Q4MWZqIqVzQAoCyoquZxy/8v5kTu2G06CwE9S0gQy2Kork3Mimwipn7ZDPVBRFiY6WkHLyhJ13i
X-Received: by 10.31.8.17 with SMTP id 17mr30018781vki.139.1458074517544; Tue,
	15 Mar 2016 13:41:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 15 Mar 2016 13:41:38 -0700 (PDT)
In-Reply-To: <CAFEAcA8SXBURzdHsKgZGNuEO==jAAKUyj6cxH3VbqrTXo1ocnw@mail.gmail.com>
References: <1458061009-7733-1-git-send-email-peter.maydell@linaro.org>
	<CAA8zJ3AxgAAKzHr_sALQQ1VT5fTHRNrxot4--VREtZ2-6kK92w@mail.gmail.com>
	<CAFEAcA8SXBURzdHsKgZGNuEO==jAAKUyj6cxH3VbqrTXo1ocnw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2016 20:41:38 +0000
Message-ID: <CAFEAcA9u1=Dp6xN9ot2DiyP_KXBWdy8-a4zOYaTxe8F0TPGMQQ@mail.gmail.com>
To: Thomas Hanson <thomas.hanson@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Patch Tracking <patches@linaro.org>, hitmoon <zxq_yx_007@163.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH] sd: Fix "info qtree" on boards with SD cards
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
X-TUID: 128U8xvNlG1x

On 15 March 2016 at 20:33, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 15 March 2016 at 20:28, Thomas Hanson <thomas.hanson@linaro.org> wrote:
>> The patch looks good.
>>
>> Would it also be good to update bus_add_child() so that it NULL-checks
>> its "bus" parameter before dereferencing it?
>
> No, I think it's just a programming error to call qdev_set_parent_bus()
> with a NULL bus parameter, so crashing is fine.

...but it might be helpful to assert in qdev_try_create() that
if we're using the default bus then the object is a sysbus
device object. At least then the problem will be immediately
clear rather than only showing up if you run a monitor command
later.

thanks
-- PMM
