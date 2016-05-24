Received: by 10.25.30.65 with SMTP id e62csp824710lfe;
        Tue, 24 May 2016 09:31:50 -0700 (PDT)
X-Received: by 10.140.25.193 with SMTP id 59mr4116433qgt.77.1464107510869;
        Tue, 24 May 2016 09:31:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b107si972120qgb.80.2016.05.24.09.31.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 09:31:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5FFG-0004aD-80
	for alex.bennee@linaro.org; Tue, 24 May 2016 12:31:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FCr-0002tQ-1H
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:29:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FCq-00040N-4d
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:29:20 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FCp-00040F-W1
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:29:20 -0400
Received: by mail-vk0-x22d.google.com with SMTP id r140so29040024vkf.0
	for <qemu-arm@nongnu.org>; Tue, 24 May 2016 09:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nMLIjMB8XX5wvxzasm/+ikj4JZad5lYVcRqLlwoehRU=;
	b=CuhsoQWkf0FOZtzWyboVDuByNCT96EWZaCUdtn4EcgmX8LuDUY+S+/DLBaXh9LCdfS
	4Vx7bjy4KaAZ1GKTAaSSW6e8o5I+vdbjvfxHLt7C7Ax1hgeqYcIyseQNSIPThKBPAuWQ
	JQpevAhnDNoohCY/Uo4rdVK90PDPDDBYsEByg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nMLIjMB8XX5wvxzasm/+ikj4JZad5lYVcRqLlwoehRU=;
	b=F0TnqBZMOEzrI28LecyGhW5Hiu8lPiWeuThdc/qb1/p8qM9//Mfj/R9//HmgNBXWXJ
	9SnZ2q+lKp2rEiTnEgd1q9X9jNctpEMfN33/YnKVSbZ+0eXmTtXxLwkaGh+W7XecWN0C
	JuxATmPQbNy50ZDNn06U4Iawt4r35YzfBVU0p7Qt/IvRWaFqzh/ne9gp3fytxPBw6qba
	Sa31LScRaoo7gf1wUW0IIz1bgLu7phFiNW22rlxcQQxu2t0D3b8QwiRJkRFkAlSG3S+4
	JDKwXPRLMM8Q4kTUYtroja9tU6Moa8+HCiRY3FfJHHegm3JF7fm87ucqLZzDqdRmgjd2
	ZoPA==
X-Gm-Message-State: ALyK8tKaRuCZ6N1L6tGCOKBx5LrX8XAnYyg+jtgQ4od+jjl53fQeTzK11kzG0X+C+BPiSKl874HEvot/nYU7Zx0s
X-Received: by 10.176.2.120 with SMTP id 111mr2558117uas.107.1464107359576;
	Tue, 24 May 2016 09:29:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Tue, 24 May 2016 09:29:00 -0700 (PDT)
In-Reply-To: <1463698459-31312-6-git-send-email-edgar.iglesias@gmail.com>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
	<1463698459-31312-6-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 May 2016 17:29:00 +0100
Message-ID: <CAFEAcA-N=N8LA11PeYeGAiSC+LMLtwfOp1GKVzJzYc5NXSwqrA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [PATCH v1 5/5] xlnx-zynqmp: Use the in kernel GIC
 model for KVM runs
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pVQdR1OH9bFl

On 19 May 2016 at 23:54, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Use the in kernel GIC model when running with KVM enabled.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-zynqmp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
