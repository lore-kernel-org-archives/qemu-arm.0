Received: by 10.25.208.211 with SMTP id h202csp1123041lfg;
        Wed, 16 Mar 2016 04:40:02 -0700 (PDT)
X-Received: by 10.55.71.143 with SMTP id u137mr4382765qka.1.1458128402310;
        Wed, 16 Mar 2016 04:40:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k93si2920851qgf.62.2016.03.16.04.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 04:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag9o1-0001uw-Ml
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 07:40:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9nx-0001rd-JU
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:39:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9nw-0002QY-NJ
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:39:57 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:33918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9nw-0002QI-JX
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:39:56 -0400
Received: by mail-vk0-x236.google.com with SMTP id e185so57751191vkb.1
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=STPRa+bq/HRun3Jdb6ueZJ5mNWYWkEIsY3szbOThGiE=;
	b=amop1lA7pRcw9ODelITkNSVYGdAkotZRQ7MmwMaJfpa6Qs2N+OIdy85Q37rmgjwhQD
	+C+jgW7oXM+7kt3uYDuHYEXPT2Pca4qhTA0TL0X5IFHOjEZswTCK9NHzQ/3gtw2qDhjW
	GxY9HCp0t0YyCE9bWiyRSgAj3K1w6VuXIDCpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=STPRa+bq/HRun3Jdb6ueZJ5mNWYWkEIsY3szbOThGiE=;
	b=SkEQkzjInIKlpwOPu5a1NOIDVzBVlPGwc5BkTwBHOLoW48OhnVaGQFMAJ3eL/0Posm
	K/8ZZP6/8TnZd+Ebbypl5H16hqj2AtJpVq31yQAK0o+9qNusRtmg7JCOpvud3T6RFysA
	VnLFzubtzPe0DrdXqeuJuY01Gtp3V+M0fm66CeNKY6ggbT7PQVI8bNrwjXBLT6RssyYb
	BTK/4dDLJWVdbZ12P3jZ3GVEOFcWmUJgWA618UEHjiozu4gSCFBxvoY3SMGWHmtZhYHk
	w1UOsiQKZjy8JTkNCJLHzkU1SomY8nHMV2A+sESBC6Ua7dXxLctsMjxYkws5apDoilcn
	2lMQ==
X-Gm-Message-State: AD7BkJLqKJFYOaq//XS2OJ8kMb+6yzPjzl4ndTijU8JZHBGYMDIbxG+QEjn5+FoXcFE3tvNIV5YhHfb0B5iYtTnh
X-Received: by 10.31.8.17 with SMTP id 17mr3202015vki.139.1458128396129; Wed,
	16 Mar 2016 04:39:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 04:39:36 -0700 (PDT)
In-Reply-To: <1457334350-5675-10-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<1457334350-5675-10-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 11:39:36 +0000
Message-ID: <CAFEAcA--bxz9ccA4QPo84XuAPrOYVeG-VT3B2kTwqWhK1CDG9w@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 9/9] hw/arm: QOM'ify versatilepb.c
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
X-TUID: RV9v/8K88D/U

On 7 March 2016 at 07:05, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> Drop the use of old SysBus init function and use instance_init
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/arm/versatilepb.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Followup cleanups you could do for the vpb_sic code:
 * move it out of hw/arm/versatilepb.c into a new hw/intc/vpb_sic.c
 * implement a reset method

thanks
-- PMM
