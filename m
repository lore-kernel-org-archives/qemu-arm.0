Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1815711wre;
        Thu, 24 May 2018 05:39:20 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZr3hdPqn1gJS/JSwoxEv4oTvceKVHxtQlXEUwB3uE28OtaEw/pd3PjduP/HMWBoF6C53jv1
X-Received: by 2002:ac8:2779:: with SMTP id h54-v6mr6523789qth.85.1527165560277;
        Thu, 24 May 2018 05:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527165560; cv=none;
        d=google.com; s=arc-20160816;
        b=aO7/ZW8WRyEda8EmVSkvMd83QSG4+2BO43gJgFgL/vhKqhqMkr1Gl4maCG1Jgnf8pd
         cg1rLIYUJ/glkNj4OFfrWaS+nLwlDoaHNIJQ9wI4/ZohrgWFctK368VXlJSVkyLADVNj
         Vzjx+VRlzNpcXqEkiWyo1spcERH6Z7zpx+V8/ps7b5d7Q4rNENNXTL05aB3pqSGwO5lM
         Sjuez4PE5WW4F/hMh7YwXLswraXFlqvuQ48HgfdAcA4WVh/d3qMqX//tmtSebyshTcIH
         3CYkNWoOIT64ruzcTNTGheJepO4cOsHSmPuTxiAAPVB4coO8/lbhy2htWtvcLN5ZHgud
         eGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fky+y5+jXKLoaNi4IKmpmF3Hg0T1JJppbkBHLHJstJI=;
        b=ISz6ojtnThVDu6dcBXZleibLodThbmbWn56xfbDF4/xyIp+2zAq7VHMGPGKgQnwQjN
         JY5V+qBA/FFBswfj4Kmr6iLCB3w/BMvVDL1aG7ZZRmbFIxVKlqjeNNOGe+jrxGafv++K
         FyUCKoh1vgVncuBGOX0sbk11ifTv8guxa6UD8eMD3rB4+gBtiGrGGHH0rKhFj8WV3ofD
         XyETs9S8iRnIZpclkf2fHjLMCm7jcAayKMqXY70l3muP/3TS18EW0RkuzBh+K9MYY0If
         1r6aegeXZjNV3BgZjZ7vb3zdKy/ASLYQ1nQposTY+TCWNa8mzEKx5S8nWmeMaYCIUFSO
         l/4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eUmCXj70;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k17-v6si3741699qtk.362.2018.05.24.05.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 05:39:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eUmCXj70;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLpWZ-0005C9-Q5
	for alex.bennee@linaro.org; Thu, 24 May 2018 08:39:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLpWQ-0005BY-28
	for qemu-arm@nongnu.org; Thu, 24 May 2018 08:39:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLpWO-0008CP-Us
	for qemu-arm@nongnu.org; Thu, 24 May 2018 08:39:10 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:39689)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLpWO-0008C8-Pq
	for qemu-arm@nongnu.org; Thu, 24 May 2018 08:39:08 -0400
Received: by mail-ot0-x244.google.com with SMTP id l12-v6so1716861oth.6
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fky+y5+jXKLoaNi4IKmpmF3Hg0T1JJppbkBHLHJstJI=;
	b=eUmCXj70ioal3gVCq45ooYokuN3004ChklXlpfh73JKlKkaSNdC3G+OnpjJVjGiU4l
	mMgbLsfgvda83vvYkzbdy2IvG16wRbAevGZmTuYyFbUtBJUmUqiheI2ePk9OEBIZQqF4
	/uNaJ2S+05J342SLOC3Ez1/W2bN3x8B8brheE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fky+y5+jXKLoaNi4IKmpmF3Hg0T1JJppbkBHLHJstJI=;
	b=W9QEGc2XVXcj53Ii43F7kck/R9wKhrI4Pc+X6iGyVifT+jN/jjsF5E4gy+Zh91ObpX
	86O/yvxdRwn0xUyPcJ+COqZloRFNRHopuYY7UrXV2DQx1krwbLjAfG7FmiHCeg6CZfLd
	aco5j826ESxotFyhVEOc0NMmGBExqFl4dx54mlDq0HVrdEwaATiH+8cKmt2QOJ1oexKs
	+lazokrYy94F8ZcXA39vMR+zWy4fi7mUh4mEkTsD7xTdF3X5zgO4u7VIBvynUeQgXF65
	qPrAYmZn8CNQQDFondTlmOuR/u1XU5XCopVPtz8V4sEc8ZhUj6JV/5XrxvuZMZQz17Cc
	l6SQ==
X-Gm-Message-State: ALKqPwf3DgoI2hnqsyaaVMchc+Y2i1+e7cf/z8FpH+JjGEvuBX5K9xuI
	KVsHeJBsccHWQfB7T+veNqi6kNU0VnQdK9Cse6+Wgg==
X-Received: by 2002:a9d:5014:: with SMTP id
	a20-v6mr4145130oth.205.1527165548071; 
	Thu, 24 May 2018 05:39:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 24 May 2018 05:38:47
	-0700 (PDT)
In-Reply-To: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 May 2018 13:38:47 +0100
Message-ID: <CAFEAcA-2kQ2pHz=8Hm=fE-3qJ8U29nmUaPC6SdEtmC7pJVKWeA@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH V3 1/2] arm_gicv3_kvm: increase clroffset
 accordingly
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GCBseAan+soR

On 23 May 2018 at 04:53, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> It forgot to increase clroffset during the loop. So it only clear the
> first 4 bytes.
>
> Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
> Changes in V3: Add reviewed-by tag
> ---
>  hw/intc/arm_gicv3_kvm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index ec37177..3536795 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -243,6 +243,7 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
>          if (clroffset != 0) {
>              reg = 0;
>              kvm_gicd_access(s, clroffset, &reg, true);
> +            clroffset += 4;
>          }
>          reg = *gic_bmp_ptr32(bmp, irq);
>          kvm_gicd_access(s, offset, &reg, true);
> --

Applied this patch to target-arm.next.

PS: if you could remember to always provide a cover letter
for multi-patch series that would be helpful.

thanks
-- PMM
