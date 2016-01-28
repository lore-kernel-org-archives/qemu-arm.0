Received: by 10.25.159.19 with SMTP id i19csp400058lfe;
        Thu, 28 Jan 2016 06:17:21 -0800 (PST)
X-Received: by 10.140.150.131 with SMTP id 125mr3898669qhw.91.1453990641050;
        Thu, 28 Jan 2016 06:17:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h206si11769230qhh.10.2016.01.28.06.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jan 2016 06:17:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOnNw-0001Qy-Hg
	for alex.bennee@linaro.org; Thu, 28 Jan 2016 09:17:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aOnNa-00016j-Kh
	for qemu-devel@nongnu.org; Thu, 28 Jan 2016 09:16:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aOnNZ-0006xw-T6
	for qemu-devel@nongnu.org; Thu, 28 Jan 2016 09:16:58 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aOnNZ-0006xT-Ou
	for qemu-devel@nongnu.org; Thu, 28 Jan 2016 09:16:57 -0500
Received: by mail-vk0-x229.google.com with SMTP id e64so24515621vkg.0
	for <qemu-devel@nongnu.org>; Thu, 28 Jan 2016 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6MjibnmKtXkDwiSemVUpDh5eSUls+Lz2gBpxzt2ydbw=;
	b=aKiPUugHllUPf0usRqtSX9bDYwYzRW4VQyUHDtjS74QoN6dDET7WX3N6joAgp7LtWd
	GE1TEFFQGbrrFDpSS9xhUYa077x7sOc8RTtfSL8QdS+MPz58o+L0TmZHYaE8kaYtaSYa
	LMk2BC1Hal6Zq2ZzJtjvpJJdr2wZAl547nS3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6MjibnmKtXkDwiSemVUpDh5eSUls+Lz2gBpxzt2ydbw=;
	b=liyTqxs7qHRtURoo0cIgZdBoqJ67dM73lXEueaE22h8Arwrv4NFjTr9ZfXgMJDWJ2g
	X7UWTmfiq4KsNnlzVgiF8zlwfYbHXN1FrPoIJVLaaUvl7965eeKFttYI9jvkXUs0be2v
	vKX/AdAZ+QUMIHFEOmpWI67KfCKvLGEhMP99qyK8jNnzXY8+6j86T1Yrkejcs8D/YSTk
	KOJl4SQHXw6tkORzQNsYdYF6jimDKXVs4yoltBGBH0DQbcaWD2Fk8JD84FSjSJb1lkh3
	slZDPG6wg4AGPmkw+M9b+J/n8udAf7dJ3agJ95XiCV8S3LXV5Te29TK6XC5BX97EzS37
	qFZw==
X-Gm-Message-State: AG10YOQpHcPR7cemx3eQxwdVZiaYtc6Bkzy1HoqxlEQq8yHY4U6iYQ++9Dq+D8E9+hRF/S7wi+HutqOGgAqknMXN
X-Received: by 10.31.131.199 with SMTP id f190mr2257270vkd.90.1453990615821;
	Thu, 28 Jan 2016 06:16:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 28 Jan 2016 06:16:36 -0800 (PST)
In-Reply-To: <1453938171-13665-1-git-send-email-edgar.iglesias@gmail.com>
References: <1453938171-13665-1-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2016 14:16:36 +0000
Message-ID: <CAFEAcA8_YUZ1A2NW75qB8612Es1T92e62zQueKqkzO_ceMT8ZA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [RFC 0/1] arm: Setup EL1 and EL2 in AArch64 mode
	for 64bit Linux boots
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: le5HBwHhQZPf

On 27 January 2016 at 23:42, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Hi,
>
> I've seen some regressions in my test runs lately when enabling
> EL2 and EL3. It turns out we are not setting RW when booting 64bit
> Linux kernels.
>
> In the long run, I'm not sure if this does the right thing, for
> example we might need to revisit if we ever want to support direct
> loading of 32bit kernels on an AArch64 core.
> Anyway, this fixes my testruns for now.

Looks like the right thing to me. Applied to target-arm.next, thanks.

-- PMM
