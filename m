Received: by 10.25.159.19 with SMTP id i19csp978974lfe;
        Fri, 5 Feb 2016 03:10:45 -0800 (PST)
X-Received: by 10.140.175.134 with SMTP id v128mr16307757qhv.61.1454670645152;
        Fri, 05 Feb 2016 03:10:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si15355633qkb.35.2016.02.05.03.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 03:10:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aReHk-0007jp-CH
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 06:10:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aReGh-0006Z6-31
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 06:09:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aReGd-0005y3-4F
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 06:09:39 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:34261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aReGc-0005xv-Uj
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 06:09:35 -0500
Received: by mail-vk0-x22e.google.com with SMTP id e185so54298147vkb.1
	for <qemu-arm@nongnu.org>; Fri, 05 Feb 2016 03:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NnJbrkB1gAbPofknPiB6Rf2uRv1MrrX7C7YArQkalWU=;
	b=aOvE4dSf1bvTLgHikeJf4ecGQ877/e+kz6hrqXWd9dWQFqc4CY1zZ4sjupXD3xJT9E
	8yYZwaqN4QFrd8s7b1WCnlNlj1Rt6YKpp8ieWOBo98Twb56Mn6wicKUQvCZYvZHlUrcM
	JvWtL0or8W4EBRN9HL9/14cLhEMpgHuC6qpzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NnJbrkB1gAbPofknPiB6Rf2uRv1MrrX7C7YArQkalWU=;
	b=b6YojhWCZwmpND/XrdqHBwR3wwmkO6Z82Wq7XxzOnOlGKOZGeh8Sgmq/f4sIgErSIO
	2RuRP8o+YNs57/tRS1mn4sQS7bZDophql01f9W8otHI1G4mmSUTdUxHKxAJZlXqJUDlU
	gxxJRZ98uJ9vtLnPEx0srJKyKrxf/nZgy46zaeHHwgEQfWM7XpTrc8sy+6bY9aHQh9Jl
	6O35zbXP5riEjE28LDOvEXm/w3FIkzgJYfdddVguIMOqnvMw3b6+6C8jEGw8uDc/Oblq
	LVj7MW1eNfV41gaWGyCYLQxUJlcGkEEjqGHM/2/EzzgYm6ugnCFA/lvz/hQhVjx8kTkw
	VWfA==
X-Gm-Message-State: AG10YOR0O/4K/mWYOi9FfZ9/CDW5p27jZg/cStPa0dmQSWvRqtG0neTNH1Dydm2Q4b+eaAVBUF4gqZ9UxxMELlgU
X-Received: by 10.31.180.85 with SMTP id d82mr8011157vkf.83.1454670574434;
	Fri, 05 Feb 2016 03:09:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 5 Feb 2016 03:09:15 -0800 (PST)
In-Reply-To: <CAFEAcA9P7OBcL4sAnLLoppUo8q40yEeyAt_5M_MYnNgJAxB7RA@mail.gmail.com>
References: <CAHyh4xiVysLUreprtNnKMOLf0VUH2bTsF4thPwbkeFOfpDXFCw@mail.gmail.com>
	<CAFEAcA9P7OBcL4sAnLLoppUo8q40yEeyAt_5M_MYnNgJAxB7RA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2016 11:09:15 +0000
Message-ID: <CAFEAcA_zOvab002hN6OCUQgg_W2v-XzLdKipQO72nZRwBuTZGg@mail.gmail.com>
To: Jintack Lim <jintack@cs.columbia.edu>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christofferdall@gmail.com>
Subject: Re: [Qemu-arm] Adding sp804 timer to the virtboard
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
X-TUID: gKNInXIfyOoS

On 5 February 2016 at 10:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 February 2016 at 20:57, Jintack Lim <jintack@cs.columbia.edu> wrote:
>> About the clock property, should I also add the original clock providers
>> such as sp810 and in turn 32k, 1M and smb clocks?
>> Or canI just use apb-pclk, which is an existing clock provider in the
>> virtboard, for all three clocks?
>
> For a virtual machine the clocks are all irrelevant anyway, I think
> (we don't actually have any kind of 24MHz clock) -- we just provide
> them because the kernel insists that the dtb says something about
> clocks. So I would start by just borrowing the apb-pclk and seeing
> if that works.

Having said that I looked at the code a bit more closely and I think
it's not quite right. By default the sp804 device will have a 1MHz
clock. So you should probably arrange to tell the kernel that via
the device tree, or it will think the clock is running at a different
speed from what it really is. (Or you could set the freq0 and freq1
qdev properties on the device to make it clock at the rate your dt
says it clocks at, but 24MHz would probably mean a lot of overhead
with timer firing.)

thanks
-- PMM
