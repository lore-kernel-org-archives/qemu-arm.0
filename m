Received: by 10.25.21.156 with SMTP id 28csp1273971lfv;
        Mon, 25 Jul 2016 09:57:20 -0700 (PDT)
X-Received: by 10.55.96.133 with SMTP id u127mr23968732qkb.55.1469465840200;
        Mon, 25 Jul 2016 09:57:20 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a3si18454834qke.103.2016.07.25.09.57.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 09:57:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRjBv-0000tI-L0
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 12:57:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRjAT-0000Gc-AG
	for qemu-devel@nongnu.org; Mon, 25 Jul 2016 12:55:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRjAR-0001pE-Hr
	for qemu-devel@nongnu.org; Mon, 25 Jul 2016 12:55:48 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:36488)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRjAR-0001p2-Cq
	for qemu-devel@nongnu.org; Mon, 25 Jul 2016 12:55:47 -0400
Received: by mail-vk0-x22c.google.com with SMTP id n129so206319809vke.3
	for <qemu-devel@nongnu.org>; Mon, 25 Jul 2016 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=za1vCUPOgUSMR92O8YtycuYJtayo4NC2vRC9MKna2xA=;
	b=YyOIxjhHpsWkTyKHBpEeQUjsjvCRAsEMBS4PnMPLPNKOVvBJcsl3iLhs9M+oBXPB+u
	vI3W1lQoGbo1FJOjucZk0wekRQaAEJzjwWCj8c4BgWUE64x5DTF4pe2AX6hUqP6pzHto
	1qTxQuklHczdK2w3Z/xaC8few3nGCSTSpDtbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=za1vCUPOgUSMR92O8YtycuYJtayo4NC2vRC9MKna2xA=;
	b=Y9Mw5psLomkI49Itgd5UcvNWXMLTdHGRmixOgHMZfYNgQUM2sSC/EyLrHo81Tn0nK1
	sYbISg1UclRga//ZW8Gztgi8SuL42LaFOaPY93xMUBL69QISE9mgQ513oKQ+yXScDKoO
	5f/wblmF7CrDdMHTC4g+kE14oUfMabyb+/P3pbqZ201N0Jizj0Fy+dHybU0H1CPKcjtJ
	apFJ0oWZw97qzyjd0qgI5m+WzK360AfArTMbcHhXTUl/36E7p4h+rBYIp7zi9odXlcUS
	lMvF5SGg94unF90BoViafQ+SoLBY8QkhC1YtFeOJFok0pBsNSNn2A7BHxvWJtoDVzI+n
	pPig==
X-Gm-Message-State: AEkoouuYx6kM487rcgccbilPTX9q7iYYLBpTjRXveTAgwRfrXXq8M/cVKxRlQPc1POFE5NGy6HOR3cWgI2SjDbPz
X-Received: by 10.31.58.198 with SMTP id h189mr9311700vka.74.1469465746914;
	Mon, 25 Jul 2016 09:55:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 25 Jul 2016 09:55:27 -0700 (PDT)
In-Reply-To: <CAKmqyKOvv2y2LYHYsSPKTDSCZM-jP-ytNT0k6P4SxQcBCBSYBw@mail.gmail.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
	<8bf7719a88e0b2fcb12fd230b00df01f1b70f192.1468279072.git.alistair.francis@xilinx.com>
	<CAFEAcA_H3xc_MCQSLANHYjWtUPMj+wMRtCMY3eTEfGWcnYDO1g@mail.gmail.com>
	<CAKmqyKOvv2y2LYHYsSPKTDSCZM-jP-ytNT0k6P4SxQcBCBSYBw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 17:55:27 +0100
Message-ID: <CAFEAcA-cY1kg+Y3Xzqe-kdrZg9ZR0F_=+4deCUYYXaEFGZLSxw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-devel] [PATCH v1 4/5] cadence_gem: Correct indentation
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
X-TUID: ViL3gsE9mtzO

On 25 July 2016 at 17:34, Alistair Francis <alistair.francis@xilinx.com> wrote:
> On Mon, Jul 25, 2016 at 8:48 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>> ---
>>>
>>>  hw/net/cadence_gem.c | 182 +++++++++++++++++++++++++--------------------------
>>>  1 file changed, 91 insertions(+), 91 deletions(-)
>>
>> I assume this patch comes out empty if you use 'git show -w';
>> would be nice to say so specifically in the commit message if true.
>
> It is empty, I'll update the commit message.

In that case
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
