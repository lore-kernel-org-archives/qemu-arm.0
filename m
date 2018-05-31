Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5732512wre;
        Thu, 31 May 2018 03:02:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLwbzW84UTF6XyS0P7ARIjn7fn0bMDUVieRZ7+sB+jk4t3RtHtX4VhFnsaY1tu3FssDLu3q
X-Received: by 2002:a37:9bd4:: with SMTP id d203-v6mr5500532qke.122.1527760964717;
        Thu, 31 May 2018 03:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527760964; cv=none;
        d=google.com; s=arc-20160816;
        b=NHvA+PnGM5xq1cscbzG0qC/Hi0VnROOib/nFsXop6bvVMELoIgcnJOyUn8hheQnwys
         D+D8h4PTuETDkdEFWcx7zuDMczJjr8OqSpPfhbKMXKmnUhwBq8IioYHc8u/F46AG34mi
         11x2zTazTnSY9FfSqmefHDDUa6mHeVHoPfv/G6/UHbOYrcPtA1yUNouQew6/uuYBp/zd
         c3vsfGXep4EutOROAWOLnjjJoMo60otW/bW+55RafZ5l1ZtKKj9o+yNJwV44INtQXIEc
         ncSw3rxMon31/yfoKSki9U7CfQwUJfLyeqVmf0N9Om/3fJowIyp5FreMXbsLOssf1ahN
         9t5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VuK81j6Qrq4Lad23RzIU+H8vhZrDPlSSlAjPc4biK1o=;
        b=U3fOz9pDVEhso7oI77YSN7FUK9NcYzHsVUK0fsde+Vn3hYLlsRtdIAi0tG6qpnz4u4
         u/DwGwYmlVxlY/VhfdPJfKsMXrnnAVIvFDzVadrDKe7fTVifKgDMLtG1I84FPt1FJgwM
         jpXV5XM1EPcykTp18v1FElKAXl64mSqErHxFriz+lFQxWeepFxJVvB8gO2q+fZaPvGgU
         fzxIl1YJ9atBDFobsUf6GNWTKbd7rW6DnThLVs/HlfIsYZzkzz9wFtWpXg9W9j+tnfB1
         nEJOj4Hcz4JuVpxslJNixmba7Ut1E/lNkKIJjK3dq7BedQETo20nyrnvr9j9EZGFExNT
         i5vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IZp+xym7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 29-v6si373514qkv.336.2018.05.31.03.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 03:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IZp+xym7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOKPs-0008EK-8q
	for alex.bennee@linaro.org; Thu, 31 May 2018 06:02:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOKPb-0008DL-JP
	for qemu-arm@nongnu.org; Thu, 31 May 2018 06:02:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fOKPa-0005JS-HW
	for qemu-arm@nongnu.org; Thu, 31 May 2018 06:02:27 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:34608)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fOKPa-0005Is-Bu
	for qemu-arm@nongnu.org; Thu, 31 May 2018 06:02:26 -0400
Received: by mail-ot0-x242.google.com with SMTP id i5-v6so24664557otf.1
	for <qemu-arm@nongnu.org>; Thu, 31 May 2018 03:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VuK81j6Qrq4Lad23RzIU+H8vhZrDPlSSlAjPc4biK1o=;
	b=IZp+xym7aowVeC8IjpV8QwX1NEtx7SEdp8USm4yHgwQ/470TFx8NuDzt/xg+++fA+I
	S1TDV3Nf1l0hR0ABkOhWwyHNWM8HYXJKDgqy4XeRD0jI9UAW+L5vln+OWrPPTv2bgaBl
	gsiYJVJJTJI4HDUUx9g8fII8Yne2SP9IC0lMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VuK81j6Qrq4Lad23RzIU+H8vhZrDPlSSlAjPc4biK1o=;
	b=OwY3a6KgBUXVzK4KyPik02OFWTKp/GHOl55iQ/t6ama0y/iyZ2oEXUU+1qVv7xHxG3
	5hBdkfSxsngoJ487vT99uN3HAkPrfr3XbYk/6H0Re1ZfCch8HQ2C8kfSXkQ55zsx/DSm
	diQeGRsnaU27c+Epi+p2cGy21UcAHwohRgo6yKSFJ9yV1Jqa9aQac3ZVgwDHEgpI/W/D
	l0VCCA56PODONzpzBR8CGHtrCaZQKIi5ekdeYryIwWz/M+SsSlKXJc5IFg+nz8m9SgRw
	wCooCDmUpodurr8A8ylE6y8AgdGKazIXxNbdpOVc1LUvgJEcA8d99xx95/ZqoJWP0Wdz
	Amqw==
X-Gm-Message-State: ALKqPwdvXEcAJHGCfL2nv7j5Nz5S0LBrkEE/S8GF1GMGSfiTgqzhCV0z
	BuRB6cy5phOmvzvtq1Bwp2IZ2kKxiKucTHpPAl52dA==
X-Received: by 2002:a9d:5014:: with SMTP id
	a20-v6mr3831567oth.205.1527760945653; 
	Thu, 31 May 2018 03:02:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 03:02:05
	-0700 (PDT)
In-Reply-To: <5B0E0194.3040102@huawei.com>
References: <1527247371-10592-1-git-send-email-zhaoshenglong@huawei.com>
	<1527247371-10592-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA_ZqgGTxLM0BiUX2LOhszFs1z8t4jGF=wCj6ceh06r2nQ@mail.gmail.com>
	<5B0E0194.3040102@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 11:02:05 +0100
Message-ID: <CAFEAcA9+7RYmEgCjk_BiYahYVf2+VXEorZDsEnA0LkBprE-H0g@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v4 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mBd7CmIc8sD3

On 30 May 2018 at 02:42, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2018/5/29 22:44, Peter Maydell wrote:
>> This is where we should have a comment explaining the bug and
>> what the migration data from the old broken QEMU looks like; something
>> like:
>>
>>     /* Older versions of QEMU had a bug in the handling of state save/restore
>>      * to the KVM GICv3: they got the offset in the bitmap arrays wrong,
>>      * so that instead of the data for external interrupts 32 and up
>>      * starting at bit position 32 in the bitmap, it started at bit
>>      * position 0.
> Not right here. for_each_dist_irq_reg starts from 32 and if irq is 32
> and gic_bmp_ptr32(bmp, irq) points bit 32, while offset passed to KVM is
> 0, then it will get the GICR values for bit 32 ~ bit 63. So the data
> looks like below:
> [00...0 00..0 xx..x ...]
> So we need to move the data down by 32 bits.

Yes, you're right.

thanks
-- PMM
