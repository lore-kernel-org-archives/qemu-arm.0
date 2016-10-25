Received: by 10.80.166.35 with SMTP id d32csp2913329edc;
        Mon, 24 Oct 2016 17:29:36 -0700 (PDT)
X-Received: by 10.176.3.54 with SMTP id 51mr7079509uat.163.1477355376684;
        Mon, 24 Oct 2016 17:29:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m190si6579014vkf.175.2016.10.24.17.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 17:29:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bypcW-00077g-00
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 20:29:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bypcQ-00077W-Jc
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 20:29:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bypcP-0006Js-In
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 20:29:30 -0400
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:35974)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1bypcP-0006IT-Cm; Mon, 24 Oct 2016 20:29:29 -0400
Received: by mail-oi0-x234.google.com with SMTP id m72so64393019oik.3;
	Mon, 24 Oct 2016 17:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ox5284/KSCQCei73ew1bNjacWpGKgxYDW5dkQHOUfFU=;
	b=Wq87A9ckxLulXKFJsUv3nyZ6FwzbKWsjvSXzUQgRedu/75/+sy3n6SjY4osQRpHgR3
	Hz+JkbSPLT18MbX7qLlo5NLYCcDp3bIYY0g5fbkBt3ACZEUicppgVEuXvpEYI61K7ddQ
	MA2s7c7zHwLCHybYLGBlRYNUtOrZZbv3GPztQVISQcg2Hsryzj+v7gYvI+Q0bskjRDfV
	jAFRP4NsjP3iSOvIEaLYngV1Gd13DTTnwkgfxbbzbNnjf90ireAXL+LZHlblnYhxZqdy
	XqZfhXyh5QwOIyWWA9loOlpEst4HiJtB5ypIBTItWZsXdWgaDLV1M5L16C4y7br6hOA/
	6Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ox5284/KSCQCei73ew1bNjacWpGKgxYDW5dkQHOUfFU=;
	b=dicbrzc+kWjtKwv4b1FV3oJS+2EJumJh7H98QaAE0Nh1WZJM+YRioZJiS5+vpEnwi3
	Rhyf9VUq6jJ2w6MHuYvHiWdKc0eJuw2McXIp8GNcclYCXu69RVyq2iEz/hdqZr2O+Dbu
	i/Hdjqtlzkj3OoP8aRZ1ga/R5hoensBYzHYdB0KGwjPsIKqh67MxUj9c/E3pLyh3FsIz
	nXC/HNT7w/NfkdgDgPj3eb1Jw1g4/rx4khOHmzEmeXRUeWTNo1P3W+JgKCuroYE9TKok
	TicFWqmEQzgIn9CvPS0HtIXR7Bcokl3c72e5JYShskR0gd+U5yRHxl/pj9+jWyPHrq2A
	450w==
X-Gm-Message-State: ABUngvdivV8xgiWbwDS4wI+RcOK8nwMd9xjnb1LQbO43FRHRzW7UGAETuBPn8EOZbbHyOnWjVh3Zdnq/22PETA==
X-Received: by 10.202.197.88 with SMTP id v85mr362622oif.71.1477355368474;
	Mon, 24 Oct 2016 17:29:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.148.102 with HTTP; Mon, 24 Oct 2016 17:28:57 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610241852550.14846@wniryva>
References: <1476784025-27293-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8hkSJa5rVpNrL1D7w_U-1EKSf-t2G5jKzxceXL2rqRdg@mail.gmail.com>
	<alpine.LFD.2.20.1610182307550.1547@wniryva>
	<CAKmqyKOMrcTAta-rHj-yFbdpPpT_wtpO-YWAqK=AVCuUuJTT4A@mail.gmail.com>
	<alpine.LFD.2.20.1610191539170.12629@wniryva>
	<CAKmqyKMLvYDTvofMF=5k2sYNKPS+HtWYvz6RCdsd4AQG97H6nQ@mail.gmail.com>
	<alpine.LFD.2.20.1610201116520.27908@wniryva>
	<20161020172146.GA25226@toto>
	<alpine.LFD.2.20.1610211311300.18921@wniryva>
	<CAKmqyKMMFcbXPv9cE-G5P2n74vXcMtWAb0sFg_J7DP+vkyxKCg@mail.gmail.com>
	<alpine.LFD.2.20.1610241852550.14846@wniryva>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 24 Oct 2016 17:28:57 -0700
X-Google-Sender-Auth: b7Jr7AtN_U_k2p37sKP68I8C2YM
Message-ID: <CAKmqyKMfvh=YsJ_2x9N4WpDdYyvLnKdGv7nnn0AnhgZ07z6bOw@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] char: cadence: check divider
 against baud rate
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8etr7HJW1biB

On Mon, Oct 24, 2016 at 6:25 AM, P J P <ppandit@redhat.com> wrote:
> +-- On Mon, 24 Oct 2016, Alistair Francis wrote --+
> | > | http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
> |
> | Did the TRM have enough detail for you to figure out how the hardware behaves?
>
>   Yes, it defines range for 'Baud rate generator' and 'Baud rate divider'
> register values and their default reset value. I've sent patch v2.

Great!

Thanks,

Alistair

>
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
>
