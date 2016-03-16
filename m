Received: by 10.25.208.211 with SMTP id h202csp1133953lfg;
        Wed, 16 Mar 2016 05:01:05 -0700 (PDT)
X-Received: by 10.140.104.242 with SMTP id a105mr4570150qgf.1.1458129665472;
        Wed, 16 Mar 2016 05:01:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i205si2971833qhi.98.2016.03.16.05.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 05:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agA8P-0004Kt-3k
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 08:01:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA7l-0003fY-Ir
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 08:00:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA7k-00027K-N3
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 08:00:25 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agA7k-00027E-Jq
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 08:00:24 -0400
Received: by mail-vk0-x236.google.com with SMTP id e6so58354152vkh.2
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 05:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a0+wxnPjiCAmbl0aQCFwcYcuaAFZGcw7Dk8jdJ0iRtI=;
	b=krkkX92Mp5AWrcMPwtBOB0NcxeAtdHUlQ+k83AJ8ITxlmeriEStAs9KODT7zmQ3ldJ
	equPsfhfTMiD7/1NbVJvPwsWGV3fKNiL+AQUABz1q95CmW1hNvD1uLUY9GXjOruZziYg
	UvuQ1vxwQb6ph4t6EfevsV3FUfUfLdkTgv1pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a0+wxnPjiCAmbl0aQCFwcYcuaAFZGcw7Dk8jdJ0iRtI=;
	b=Fg0WgtCgd+gi/YQ7JbkaG6+dHl2ip74nq94NTNZyUGi1/Sm55N6ftX6xgCyvkhM/5n
	DADCFO3n2D2c18dVRfzjEZhYHlM2/0fLkth67zs5tzUFDI2sIBu93chHYSOo7I7O1uNN
	dnKGu4iuHxfeqPX4760iz2rFsWGoqjbjSau4DCY/YWOs4OOrHMm7tcFrEYHidfMBBUN+
	Fv5cCeBQ+rtzbY2d+rdjEDHZ2sTRsdCDa9n8q/AkCjE+p87JecsdfMPUBsF9Lx/xrrpT
	uldLz8IM6UeteaLODBZZBh6kjCaVq2x/DMKgo6d11zYdhq9fxX/3v3FQZr+D9Ta8cgFw
	anmA==
X-Gm-Message-State: AD7BkJIF1HZ772MAycznbjR8ASnIjsVHvp7/5h3pyiWtwuuHi2p1E1vXQZVvXLTypRvYSzmViO2+5OikaJMCDZFw
X-Received: by 10.31.7.138 with SMTP id 132mr3788424vkh.92.1458129624135; Wed,
	16 Mar 2016 05:00:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 05:00:04 -0700 (PDT)
In-Reply-To: <CAFEAcA98BiQipq4PL=_9fBeOa01ESzyp7U4ghN0gZuxAyAqwoA@mail.gmail.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA98BiQipq4PL=_9fBeOa01ESzyp7U4ghN0gZuxAyAqwoA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 12:00:04 +0000
Message-ID: <CAFEAcA-P25AkJLBLst04J=BxTVvbfuQQAiE8nVS=w7oMXdtX8A@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 0/9] some QOM'ify work under hw/arm
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
X-TUID: O0vMtxzMcYxB

On 16 March 2016 at 11:31, Peter Maydell <peter.maydell@linaro.org> wrote:
> A general note -- since these aren't bug fixes and we're in soft
> freeze now, I don't think we should put them in until 2.6 is out.
> I'll review the patches in a second, though.

Well, the patches all look good -- ping me after 2.6 is out to
apply them to target-arm.next then.

Where I've noted possible further cleanups, that's intended as
an "if you like writing cleanup patches" thing -- you don't need
to try to do them as part of this patch series.

thanks
-- PMM
