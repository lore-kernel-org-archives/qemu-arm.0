Received: by 10.80.163.71 with SMTP id 65csp349615edn;
        Sun, 18 Sep 2016 04:43:56 -0700 (PDT)
X-Received: by 10.237.46.226 with SMTP id k89mr15315918qtd.146.1474199036883;
        Sun, 18 Sep 2016 04:43:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l86si12800943qki.337.2016.09.18.04.43.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 18 Sep 2016 04:43:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1blaVo-0007Eg-Cr
	for alex.bennee@linaro.org; Sun, 18 Sep 2016 07:43:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1blaVj-0007Dx-8P
	for qemu-arm@nongnu.org; Sun, 18 Sep 2016 07:43:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1blaVh-0003wm-DL
	for qemu-arm@nongnu.org; Sun, 18 Sep 2016 07:43:50 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:33314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1blaVh-0003w4-9C
	for qemu-arm@nongnu.org; Sun, 18 Sep 2016 07:43:49 -0400
Received: by mail-vk0-x22f.google.com with SMTP id 192so87198503vkl.0
	for <qemu-arm@nongnu.org>; Sun, 18 Sep 2016 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xHQ9Qhh3VnwngAYZViRRccim0UAoUF4b8EQrYfIbhVQ=;
	b=O7fp6EV9hD+jGEchMdaO9XTnRSANpNqi0wYyzdcTMXz2TA6TAffNg837cQaQk5VSXi
	PF57NXFYzsL85Dwkg58qN4ZV3OhB5fB3s/rR+De9/9tEHT1TIWHFTsUfL//TFgGHWM2l
	b4c/+D+ys2D6V7q6x2BTtY/qY0hCwzf/tJJLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xHQ9Qhh3VnwngAYZViRRccim0UAoUF4b8EQrYfIbhVQ=;
	b=lmIpkkHmcuwI1k6pWeFTvsu4xbMSkLB9/fxHOui2GRflefmfy/LaeQAPhZ0FGRSD4/
	EQolbBX5aDcuJjG52e+fCU7Xv7KYm0/LJ1ECBTDFDZtxic6jDDSfWggEfoJPJAoPJXq0
	JT5W9YUql/YkmU/2hrO9JSGHsnJhpWEEz6uBiqPfN+Z8sSbpFFm0iiWIGld08P80Hva0
	dNkrI2PaK5Phr2esYxQ6sf17xCVJsa839MurH27rG49oCOieRDp8ZnMjtpMDv2l/jGc7
	jJ5dhZ/Bpe0JrPXq+v4DUAOSR/yiri3KG4UESNwbYvoxZNkkXO1WWV8Nk7qKI6+l8cp7
	BIxQ==
X-Gm-Message-State: AE9vXwPvVxnk7fQHTuT6jVNFpY9yLZguD1AiZzDgDe8FNIw4sACD11spmhYXfs7M/KC5TYpygDIL/dqBSk5uYpM4
X-Received: by 10.31.233.3 with SMTP id g3mr11702713vkh.175.1474199027281;
	Sun, 18 Sep 2016 04:43:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Sun, 18 Sep 2016 04:43:26 -0700 (PDT)
In-Reply-To: <1457334350-5675-4-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<1457334350-5675-4-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Sep 2016 12:43:26 +0100
Message-ID: <CAFEAcA8gOXSxXSfam2oyeUQRV+YGDNL1ex4kwb6u6EEU+wN4Ow@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Subject: Re: [Qemu-arm] [PATCH 3/9] hw/arm: QOM'ify integratorcp.c
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
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9jzx7pX1H6I+

On 7 March 2016 at 07:05, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> * Drop the use of old SysBus init function and use instance_init
> * Remove the empty 'icp_pic_class_init' from Typeinfo
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>

Hi Xiaoqiang; this commit has been reported as causing a regression:
https://bugs.launchpad.net/bugs/1624726

Do you have time to have a look into that?

thanks
-- PMM
