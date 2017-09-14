Received: by 10.223.172.38 with SMTP id v35csp826077wrc;
        Thu, 14 Sep 2017 05:51:34 -0700 (PDT)
X-Received: by 10.200.3.87 with SMTP id w23mr2115040qtg.249.1505393494381;
        Thu, 14 Sep 2017 05:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505393494; cv=none;
        d=google.com; s=arc-20160816;
        b=Rqf2rV9PgySojbuuBZkgaA5O8EZh5q63B60EU0tnaLYQ2VlpyemWDayUXdwnfD5TKQ
         UPYbXY5ThMDhSas/taM7Ekr13VY5Z2N7hCBZ2EKwQX8rvT50OPL56WrBifvmJrPuxhsG
         6fLaysF546XvIj7i8VL2GWsXzSGYV44FBMgQqIOAOWHvIh7g95RQ/a997a4q0sIWwAmr
         GVOhiwxfEsKtJOJD0/44OS1zd3ptB71GwaHIdDD9ffibHYlvgZFt3gdFWmgeqkYAQXB4
         0lRBcWCsb1ey9ORHbuhtZ0HmAd90tpaR4BipBhX/YnOzSas0U4LBa0Jp2yCFPbNUlizS
         EcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UTNdQtkNTpVPQHnGEaBmiuflgYiIQc2Efbjw+KT/c1k=;
        b=XSOhbpJwA7My/QS9tqvfkQQxaX+YrubyI+EwfgLEpDNRT3cXFYV5K0O7afv3+J/kaV
         5fgi+gpomj/MnKswjVK+CjgA9ANqHFfSAv/KMhn85mbdqOTMiUPW8mvOUPDO7UMmEd7g
         CSlBfxeebThymg4VOofeNdMGZ+7r9FX8umz21Dd2wZ0O5AkoDQMipWWtVfWrZjr1jiwk
         oojXPl7RSrr06BFav1EmcxYt++oCyR9sXFBUUio9qbjsBeoqMikDwSP4jIDoU9zUDlPu
         +gGVo5JbtW7PGf4ubAvEL67KWSy0cKYQEdZ7wQmah7prrqVk8fCK3gY5aCjjtc5tP3mo
         rhTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OL81Rjx5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q77si16531287qka.183.2017.09.14.05.51.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 05:51:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OL81Rjx5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsTcC-0006m8-3P
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 08:51:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsTbw-0006jj-PI
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsTbr-0006wE-9d
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:51:16 -0400
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:50217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dsTbr-0006vP-3I
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:51:11 -0400
Received: by mail-wr0-x231.google.com with SMTP id w12so230387wrc.7
	for <qemu-arm@nongnu.org>; Thu, 14 Sep 2017 05:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UTNdQtkNTpVPQHnGEaBmiuflgYiIQc2Efbjw+KT/c1k=;
	b=OL81Rjx5iZSOVcSS1VXOBcWqy2J0xPujCY9dxh70DWrGhZTYswSiCKwa/KuGZiKm7A
	VY9rsBuLxGuQ69fF+CtPzSn8YexZzQK9uEyGXl/mXRSzN03ziJX273NJEPeucHTHuMPw
	HhBVoS9gSb/s/7Bzxzcl/8sWRXdKTPHpATUgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UTNdQtkNTpVPQHnGEaBmiuflgYiIQc2Efbjw+KT/c1k=;
	b=aurn/I3uSCuVqTHFOHVNGKykVvbAGzlEEvLIlHIg6xYz+0BXYylkZSQWdRHRbw0qFS
	j8gEfZuMA8S+Rq7kOQo9z3mEtPL0hZY/5BpQs1/vnYJRwTVYCBm2sR6hU4tc41O3drUP
	vvkDrX93fa4sQsGZTtwaUzKEO0YU/gsNOrswZ2IKhwELcXOU1QQ/cl8nL0TbELclPWBc
	GpUvr1z+XlaKZYJU0Tl1iTmKJJ1kp8XJQWRCYzbWkwRmn9/9rrpyGHWBrlncHHUL0qfJ
	hwPvLhBGQEGZ/1Oxf4XnxMylzQ0jBfQda/iCUeDofswIhO5wU6yTHXCjXgCGm8ex0ux3
	tTCQ==
X-Gm-Message-State: AHPjjUhxKyOO8d3h7CxSuEiP3ChyH2kM4xRe24eqsZhGmxkZTW+wcg6b
	S/y+m2V4DFduULCzpFRiMVzbWOe3NUdkKAqmS+GLkQ==
X-Google-Smtp-Source: ADKCNb7fQZPy7W0hFg+zgCfxA+VcfqOWHGw7B9bfXt8wi1oVfPL3Ry91qZhQm1SnSYAcd+GjDqeoJUX2uyaok4k+KSc=
X-Received: by 10.223.147.166 with SMTP id 35mr20794752wrp.90.1505393469841;
	Thu, 14 Sep 2017 05:51:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Thu, 14 Sep 2017 05:50:49 -0700 (PDT)
In-Reply-To: <26b702658b5bf9984edaecb22b1190be0a9d7052.1504293917.git.alistair.francis@xilinx.com>
References: <cover.1504293917.git.alistair.francis@xilinx.com>
	<26b702658b5bf9984edaecb22b1190be0a9d7052.1504293917.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Sep 2017 13:50:49 +0100
Message-ID: <CAFEAcA-A78rWzUeBh3M_k2SUmu3A8LwROQKCmw78D8PyE2neJA@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/6] aarch64-softmmu.mak: Use
 an ARM specific config
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sceE1EsxoKPX

On 1 September 2017 at 22:00, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> In preperation for having an ARM and MicroBlaze ZynqMP machine let's
> split out the current ARM specific config options.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

Acked-by: Peter Maydell <peter.maydell@linaro.org>

I'm assuming this series is going be reviewed and go into
master via a microblaze tree, not the arm one...

thanks
-- PMM
