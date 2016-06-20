Received: by 10.25.21.96 with SMTP id l93csp1407295lfi;
        Mon, 20 Jun 2016 04:53:45 -0700 (PDT)
X-Received: by 10.233.222.4 with SMTP id s4mr20033149qkf.74.1466423623389;
        Mon, 20 Jun 2016 04:53:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y10si17462604qty.110.2016.06.20.04.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 04:53:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bExlu-0002Ca-Oq
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 07:53:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bExlr-0002Bn-LK
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 07:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bExlp-0003GC-Sd
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 07:53:38 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bExlp-0003Fl-P5
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 07:53:37 -0400
Received: by mail-vk0-x22c.google.com with SMTP id d185so192199234vkg.0
	for <qemu-arm@nongnu.org>; Mon, 20 Jun 2016 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NPq4WPpHeZbOuvFFScLqaROI0d6mCb+7ecQBTjdeB+E=;
	b=E6xhXBPr6481lb3uGIz10Pwzw1Mnv/RrSQbVStwUJi8nPJp05QmgRdGdz8LB7VElUI
	aq7XH3tpSER5T8fMM4PjIlC3bL3aztwiUSxs4+6Jhr2cA9hTmriVchRtTOo+lj+HJ28G
	T87JKcOA0fetFBG8urXz1zHBZyYqZf+L0S3K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NPq4WPpHeZbOuvFFScLqaROI0d6mCb+7ecQBTjdeB+E=;
	b=AikB/vRd1fvPrfoRUGmpmA8UB4fw3UepR2/haJVP3zKWuNWW9DbIwdgATMEqA9/Y3X
	AbjIghcj7t8mkQM8VyFUsk/hXhjK0erkilgQQu/Q5k+9IR1le7u+h/istdXg+8kAi+GT
	ecfjoA1Y56XAPfgmFtZSKNInksoBybxpIllE7ukYfGNrrEAT+/zccQMccLDsC7CtTQG1
	zHJxtcsfRDhTP4I4lgLAB4B+oJMO2XnQzOdwzoB6YuosCUbBOeVxjSmxUdJ4m1wKdmdJ
	TUiYz4h3d9e3kj6Q8JMuAT9nvRV0kMwAwVkmBRHBWfO0sWYXgvttc0wnRqyuwEINknow
	aEaQ==
X-Gm-Message-State: ALyK8tI9u8zkAEBJs4z2/ZyQHvt3/kwILQWmGV/1DK34cPYwICRA7trmeJFDKKldsrgHMhkv6zejMOX14jpkyEsM
X-Received: by 10.176.1.238 with SMTP id 101mr4940714ual.119.1466423616162;
	Mon, 20 Jun 2016 04:53:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.193.141 with HTTP; Mon, 20 Jun 2016 04:53:16 -0700 (PDT)
In-Reply-To: <5767C3E2.6010604@linaro.org>
References: <1466416634-9798-1-git-send-email-peter.maydell@linaro.org>
	<5767C3E2.6010604@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2016 12:53:16 +0100
Message-ID: <CAFEAcA8=+3ABnhm06BvCJC8ixC7GTKsjX-xFPAZhVQ5A7Oh+6w@mail.gmail.com>
To: Sergey Fedorov <sergey.fedorov@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gicv3: Fix compilation with
 simple trace backend
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
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y68l1gKsoE0K

On 20 June 2016 at 11:22, Sergey Fedorov <sergey.fedorov@linaro.org> wrote:
> On 20/06/16 12:57, Peter Maydell wrote:
>> Fix missing includes of qemu/log.h, which broke compilation with the
>> simple trace backend (the default backend pulls in log.h implicitly
>> via trace.h).
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Tested-by: Sergey Fedorov <sergey.fedorov@linaro.org>
> Reviewed-by: Sergey Fedorov <sergey.fedorov@linaro.org>

Thanks. Applied to master as a build fix.

-- PMM
