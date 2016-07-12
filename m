Received: by 10.25.21.156 with SMTP id 28csp239283lfv;
        Tue, 12 Jul 2016 00:55:29 -0700 (PDT)
X-Received: by 10.55.154.11 with SMTP id c11mr1179020qke.117.1468310129269;
        Tue, 12 Jul 2016 00:55:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n63si1600611qkf.211.2016.07.12.00.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jul 2016 00:55:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMsXQ-0007Cj-Ns
	for alex.bennee@linaro.org; Tue, 12 Jul 2016 03:55:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMsXK-000723-Mr
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 03:55:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMsXJ-00082r-0E
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 03:55:22 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMsXI-00082j-PN
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 03:55:20 -0400
Received: by mail-vk0-x231.google.com with SMTP id x130so10949493vkc.0
	for <qemu-arm@nongnu.org>; Tue, 12 Jul 2016 00:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nwSObU8yR3PzWon12PctvIdXxCttEckr8kLQswXf1QA=;
	b=dfJb7El4XEzzx0MPKCPcR0n2g0g76WzIKxWinYruYU97htscdiqTdIBqhzYTeBEm2j
	cxKc71wxZtia8JdrQgUqmnba42McycWMocOZTxQs3gh9CthZ7ITb8Ltnuiez6/LE2Pay
	u1XOaCLz14+osVKg0sZ+Y8JXXIFECAwQNrJ9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nwSObU8yR3PzWon12PctvIdXxCttEckr8kLQswXf1QA=;
	b=Tu5Nu/mRymKgWeYTuB6zXyeOS20qcKYIww8d/zjxWN1SiRTvyMXPAKbMzPeaIX0rFE
	Dy4pmsXjTTuqPXIpJ8dsY6LIkcOGc49Tg3GHxgNe/dgHXIcZzHwQv2kEZE1rboUwiRvr
	HlE5ijndXQcdesX7bAg+X5gu5uSJyUetaVA8GHKyfvrXbYJ0SvSw18dFp1NHX4PBt+CT
	/S1xg5aqDjMxphMXYaDXQyhIJ3VrBQlQiaAbZwSxx/kxyk2JVpl9XyzMvykKbNMAZVH/
	lcM6t98gflu4tNfd/UwsiyC8DgBXbI0SB+ybG9k7kQgyYRQRJrd2/nI1tJeZHMB1MKsj
	qzoA==
X-Gm-Message-State: ALyK8tIbh5q9CnVZCVsB5uYo8tQXlbSHR/RpYdQO8+t46ojP6r62dLNWTf3HGXF6GRy5JR+z1qZ9e1FJbm+9EOXG
X-Received: by 10.31.248.73 with SMTP id w70mr396004vkh.30.1468310120123; Tue,
	12 Jul 2016 00:55:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Tue, 12 Jul 2016 00:55:00 -0700 (PDT)
In-Reply-To: <578448D5.4020208@huawei.com>
References: <1468261372-17508-1-git-send-email-peter.maydell@linaro.org>
	<578448D5.4020208@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jul 2016 08:55:00 +0100
Message-ID: <CAFEAcA9k62r9gYZ9Aqpb6WidOLuwQ17gCGnUjppXyAqzTd_0Cw@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm_gicv3: Add assert()s to
 tell Coverity that offsets are aligned
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hYQ2+TcwKuRz

On 12 July 2016 at 02:33, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2016/7/12 2:22, Peter Maydell wrote:
>> Coverity complains that the GICR_IPRIORITYR case in gicv3_readl()
>> can overflow an array, because it doesn't know that the offsets
>> passed to that function must be word aligned. Add some assert()s
>> which hopefully tell Coverity that this isn't possible.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> I don't have any way to test this except getting it into master
>> and seeing if Coverity still complains, but if it does then
>> I'll happily just mark the error as a false positive...
>>
> Since the codes are correct, maybe it could ignore the original complain
> at Coverity instead of adding the assert(). But anyway I'm fine with
> this patch.

Yeah, I was on the fence about just ignoring it. But
it's not really feasible for an analysis tool to
deduce that the unaligned case can't happen, so
a little assistance seemed in order.

thanks
-- PMM
