Received: by 10.25.208.211 with SMTP id h202csp2804565lfg;
        Thu, 25 Feb 2016 05:18:48 -0800 (PST)
X-Received: by 10.55.22.162 with SMTP id 34mr40566435qkw.63.1456406327979;
        Thu, 25 Feb 2016 05:18:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g72si8007909qkh.55.2016.02.25.05.18.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 05:18:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:43268 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYvod-0003Ik-Bp
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 08:18:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYvoa-0003IU-UW
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 08:18:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYvoW-0005Ne-VM
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 08:18:44 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:34394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYvoV-0005Mu-O1
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 08:18:40 -0500
Received: by mail-vk0-x233.google.com with SMTP id e185so46827272vkb.1
	for <qemu-arm@nongnu.org>; Thu, 25 Feb 2016 05:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eEeaWXpoeV9D6z+LCRbaDjXtbgOxSgsgJrqc4+K6vIo=;
	b=Ah2UVjDoBbo/c34Iqy/Dn3IkvCzf3vVi5If/GMNkzIeqsT9d2WnDWN65AZB/9rBQCH
	0UW1NeNu0ykKP+BWNotjBPycSs1WAjI4oC+wNxxLAnn1swW2OFgc0V5t24zKqMav1Ikf
	p4u944vr68/3C+dsEEQCQuRY65HUC4LG1Xqc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eEeaWXpoeV9D6z+LCRbaDjXtbgOxSgsgJrqc4+K6vIo=;
	b=eAPAUC5JYKZnuZxElUwAnOIjeKzeO8wuGZ3DBEQcFa8eqK/gfH6qU6eCDd31ub/zP5
	5SOmnqwgI3VVXcpCf7oY5xBBAZS+o+YURo2N6IEKXfEl1WZ6BOsMJ7u/bm+s+iU1ivIQ
	yY8ZTMm9EcHL5eV5njwJHa2V+uTx7y5FfnMorINFZEFU+vc3/70j/kbTsQ6BXco0lYHF
	FN5PNlbatxs/gAB/mc9g+siXTnqtRd2qMf7KgDt0dNNsKisT9PVUaA+BUIzLNuUrhg1W
	75kKR3h6L/bKRK18FkjSEVMjCkfQtw5c4LcnA50rIcYi8xlitSPqAAWZmkPjH0WkEvAh
	yggQ==
X-Gm-Message-State: AG10YOTuzG1Wx/c8MZ0f8enICyH+RlM3xqZZJNiRvaKs+NcvFBiy7vHYPF4Y/UoHAe/IihRSw1MRKTsGqI66MekB
X-Received: by 10.31.47.207 with SMTP id v198mr37211253vkv.6.1456406319330;
	Thu, 25 Feb 2016 05:18:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 05:18:19 -0800 (PST)
In-Reply-To: <1456351128-5560-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1456351128-5560-1-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 13:18:19 +0000
Message-ID: <CAFEAcA8=DsoGbq0Z1HKtcNcYztODeGti9ejoN1i2ioXQwCJfEw@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] raspi: fix SD card with recent sdhci changes
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
X-TUID: t53BNSb21wib

On 24 February 2016 at 21:58, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Recent changes to sdhci broke SD on raspi. This change mirrors
> the logic to create the SD card device at the board level.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> The relevant change to other boards was:
> https://github.com/qemu/qemu/commit/eb4f566bbbe195b2475e8fa5d9ed29ca56a18b02

Applied to target-arm.next, thanks.

-- PMM
