Received: by 10.25.27.66 with SMTP id b63csp1496765lfb;
        Mon, 6 Jun 2016 06:46:04 -0700 (PDT)
X-Received: by 10.194.23.232 with SMTP id p8mr15279325wjf.166.1465220764811;
        Mon, 06 Jun 2016 06:46:04 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id fa9si2309877wjb.208.2016.06.06.06.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 06:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9uqx-0005my-Ix
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 09:46:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9upJ-0004kv-PV
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 09:44:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9upH-0002Di-QL
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 09:44:20 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:32785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9upH-0002Da-CY
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 09:44:19 -0400
Received: by mail-vk0-x22d.google.com with SMTP id d64so75882551vkb.0
	for <qemu-devel@nongnu.org>; Mon, 06 Jun 2016 06:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QUkiDWVaUZs0ZGbfRDznpZysiLUIpcmwyNAfjl+S8CQ=;
	b=hVz+iCMUOSl+JsaLL2xldFZD5ahdeP8+ECdShi6X/GAquCYd7X04VduufUIds+tYFK
	CyyqhLzpJDhPjY0vHboVfopnUnV4p/2NeZIFt33yZE+dF2GQ0r9MfQGX+uVJLeDQABC/
	CIDPVzCWen3vckid/stXM9uTfVpi2REEU0lVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QUkiDWVaUZs0ZGbfRDznpZysiLUIpcmwyNAfjl+S8CQ=;
	b=RBahEwva9vZ7+55p1fhsWJw2m4fke9a1L9bZ8HCoS0yUzHDmgSj14iEZgj5kmlYk1C
	6cpt/s6KdEHunV9JRgIAIZQF1c6lFFP3hogmjlDWl5FKNxned/xRsH2eYyz9vPDiuGC+
	xxMhxtjjKn/zIeJrOuJasfZL0/hF3rp5VLkzJkzI3qy+rFQSPC7VwpZHWVeNgQ0hvoH0
	CD2ti/ANKQzRYKqGvvFX2xp05fxaquKjGDESVqQy1lahlyaS4HfpKT0adzHgzu2q57xc
	Ub4z0uEQ6SLX6eRaUGRqyMtBNZruh2nB+i0c1lm32gzf4nkNAMlsUYinZM4vLXV/XJ5Z
	xNVw==
X-Gm-Message-State: ALyK8tJu6k1XIsInIpnFfBUdSQK/p/ff1xLfom6wdHu/ZU95gtOD/gmsEZk4yTSqbguRn/r6riqiMqu3VRg71Nns
X-Received: by 10.159.33.68 with SMTP id 62mr8300196uab.26.1465220658836; Mon,
	06 Jun 2016 06:44:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Mon, 6 Jun 2016 06:43:59 -0700 (PDT)
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2016 14:43:59 +0100
Message-ID: <CAFEAcA-yPTCMENouvO6udM7PwK8i+JNt2FLPwao2YSr=n_A2WA@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-devel] [PATCH v13 0/8] PTimer fixes/features and ARM
 MPTimer conversion
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
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wpegqu0+KVhw

On 27 May 2016 at 18:03, Dmitry Osipenko <digetx@gmail.com> wrote:
> Hello,
>
> Current QEMU ARM MPTimer device model provides only a certain subset of the
> emulation behavior, so this patch series is supposed to add missing parts by
> converting the MPTimer to use generic ptimer helper. It fixes some important
> ptimer bugs and provides new features that are required for the ARM MPTimer.
>
> Emulation behavior is verified against the real HW by running specially
> crafted MPTimer tests in both icount and non-icount modes:
>
> https://gist.github.com/digetx/dbd46109503b1a91941a

I've applied patches 1-5 to target-arm.next; thanks.

-- PMM
