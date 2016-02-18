Received: by 10.25.208.211 with SMTP id h202csp558615lfg;
        Thu, 18 Feb 2016 03:49:04 -0800 (PST)
X-Received: by 10.140.237.204 with SMTP id i195mr8821749qhc.55.1455796144253;
        Thu, 18 Feb 2016 03:49:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6si52410886qgf.122.2016.02.18.03.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 03:49:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:40332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWN4x-0000aQ-QG
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 06:49:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWN4u-0000a0-DH
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 06:49:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWN4t-0000sz-78
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 06:49:00 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:33848)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWN4t-0000sr-1W
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 06:48:59 -0500
Received: by mail-vk0-x230.google.com with SMTP id e185so41649531vkb.1
	for <qemu-arm@nongnu.org>; Thu, 18 Feb 2016 03:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Dv+YxSTHCuAubr6ReIY6dLAe8uECOq9PSN94lcBSYrI=;
	b=QK1EfxoILCn/epTjtXtUSgDLD1ibW0p3/01b7XhUV7E4WRmUSJypJXLOCl4MrOeBAo
	iOh7wJZgDtthz/ObOXOVrRTRvUB6K8cK7cQVsS9LjI5HahjPcHeIIM/H56hi7izgvWc2
	0AVMceoGSEi5SA6ERkpOlEP+Prz6/sT18kZ34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Dv+YxSTHCuAubr6ReIY6dLAe8uECOq9PSN94lcBSYrI=;
	b=CnRHO5sRoBwkLxP0Uk7+KwCg1EQDUvQyErmSmA6zNjM3RFEogHM2N+PgMo4yYa+7oz
	XRu9bcQgx9NfHpSWYJa5Fu9r6FyN+5eir8hfpeAF+FI6UN2cr+JLeEE5eQ5wV7F6/bYV
	wF+qqZpZzVUWLtQJuhZqdjkMwJiBhtBTauTCr+nbgCCat1/MvBTZLL9kKn0gW/oobWDx
	s/LTpzGAC4aR2l4pv9mxTVYltfeYX+adWrxrBEefiHFR7vRMDFoANykhGqzaMU4Xi9Ae
	HhL856RCMJ8aDRUfgd3ZVzZQQfjpglS+RarHOs/KfKnJdb+aLVtdyKPyu3a0doA5g8J6
	9m0Q==
X-Gm-Message-State: AG10YOSGsHd6NwzJ2RqOF2CZEdjzYltHU6ECu21u86O5mIFdfKbk4R+AfL9yxak4hxD3cIPJMKGaP1MSClRbhGzl
X-Received: by 10.31.141.2 with SMTP id p2mr5739080vkd.37.1455796138487; Thu,
	18 Feb 2016 03:48:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 18 Feb 2016 03:48:39 -0800 (PST)
In-Reply-To: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
References: <1455646193-13238-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2016 11:48:39 +0000
Message-ID: <CAFEAcA9RaaX9viXr3dUYJPbyT-D5_HcfjOeFNPJKw_wSO8xuYw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 00/10] hw/sd: QOMify sd.c
	(and pxa2xx_mmci)
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
X-TUID: fK9UkqNIscgo

On 16 February 2016 at 18:09, Peter Maydell <peter.maydell@linaro.org> wrote:
> This series attempts to QOMify sd.c (the actual SD card model),
> including a proper QOM bus between the controller and the card.



Applied to target-arm.next, thanks.

-- PMM
