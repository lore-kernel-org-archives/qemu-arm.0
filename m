Received: by 10.25.21.96 with SMTP id l93csp1366955lfi;
        Mon, 20 Jun 2016 03:04:02 -0700 (PDT)
X-Received: by 10.55.15.30 with SMTP id z30mr21134166qkg.187.1466417041995;
        Mon, 20 Jun 2016 03:04:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 86si47002812qkq.217.2016.06.20.03.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 03:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bEw3l-0004ui-ED
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 06:04:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bEw3g-0004sn-VG
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 06:03:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bEw3a-0006e6-4W
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 06:03:55 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bEw3Z-0006e0-NX
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 06:03:50 -0400
Received: by mail-vk0-x22b.google.com with SMTP id d185so189299238vkg.0
	for <qemu-arm@nongnu.org>; Mon, 20 Jun 2016 03:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=byEH18OD4QFyJ61lbfdojSbT7VJjLxpbMxfAMfsZtQA=;
	b=SyQxEH8UquBgrVNbWQTRvCfpSXnJFioWmFO+HkBDBtU94irbt0QHm5Ji0XDmIlovpq
	XNnO/lDLAcGB+rmGgua7XNLnC1ozYMlnJISD/fQi7PUHjol0yYSbK6PibFdTdiHygN94
	aRxUUw212uoQ8jN/FS3vWBrmVQxTxscCtFZ+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=byEH18OD4QFyJ61lbfdojSbT7VJjLxpbMxfAMfsZtQA=;
	b=JrD2ehZgnLblFxwgryphGOr13XD2/d3fbxLnHjJZtAA8+MdWT6blIxJupBsamLHc3H
	vFMzOtE1jdUt8cFXuXnfW0b5BHtYerhtHNYjPxmQA6RIArwpoxQ07EjZe57+FySgUJJn
	o3GUYp4UHJ1LonhNOj2f8fs0otiWQma6CHY2YzPlkcnvJI/ejiR2N4gfc/hgPBbQz7RR
	PbOe+qZ4g7Pmly/XyeZkUm7nA+O2W/0PdO3jigNg+UgBZz5qm1Ltz1Jdy7B8XnvxZc2O
	3dW62eGmv/faGbeoYgMZ25bqfk5rpBMiFnUoP4MJaJEWWKesMIFpHAcynwQcM1uYAB9Z
	6ReA==
X-Gm-Message-State: ALyK8tIfwKomjEgAPFqAxA3VqOrLStBEaS85Lt9lydRROUzyGJ/BOC5saDVsmoLHkOqf+ltbm93yrmTc/ZqQHPrD
X-Received: by 10.176.0.238 with SMTP id 101mr5077098uaj.107.1466417029247;
	Mon, 20 Jun 2016 03:03:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.193.141 with HTTP; Mon, 20 Jun 2016 03:03:29 -0700 (PDT)
In-Reply-To: <1466387717-13740-1-git-send-email-zhaoshenglong@huawei.com>
References: <1466387717-13740-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2016 11:03:29 +0100
Message-ID: <CAFEAcA9UaRWHcCAPJ1DQi1=cb2xw9cBmPth146MrYkLbnw=JXg@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gicv3: Add missing break
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vk0b4VTk67p4

On 20 June 2016 at 02:55, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> These are spotted by coverity 1356936 and 1356937.
>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>

Oops. Thanks, applied to target-arm.next.

-- PMM
