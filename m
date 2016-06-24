Received: by 10.25.21.96 with SMTP id l93csp1138047lfi;
        Fri, 24 Jun 2016 09:42:21 -0700 (PDT)
X-Received: by 10.200.55.219 with SMTP id e27mr6143225qtc.93.1466786541324;
        Fri, 24 Jun 2016 09:42:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17si5472014qke.156.2016.06.24.09.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 09:42:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGUBQ-0002sH-MF
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 12:42:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGUBM-0002qt-MI
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 12:42:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGUBL-0002pK-Ht
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 12:42:16 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35396)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bGUBL-0002pB-DA
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 12:42:15 -0400
Received: by mail-vk0-x236.google.com with SMTP id j2so158063410vkg.2
	for <qemu-arm@nongnu.org>; Fri, 24 Jun 2016 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pLjJjZvK9LvujglgvG/I2heZ9lwwDA48Xn32RA5MjGo=;
	b=F+sK5RZnpA9YnSy1YJqY7mqfmMQRsxZa46GHuRHBIWWQ13gUwHPc0QV8V8sqdRj+OB
	Pte9kJ2Mf8vTfHQTXH7q7L+KOnFy4PwPSzShjLsbmeLNstoP1n3PwFGu2KGpecepDuld
	dS2wH3/yYtFTxrAeGi2G8JQVj+KTPYPUfAALw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pLjJjZvK9LvujglgvG/I2heZ9lwwDA48Xn32RA5MjGo=;
	b=gTSm7nCe6ikftkTTddCXo6VLlaL4P7X4lbfZfHcT3xqm9zQNO985TC0T4AJnF/BCEZ
	VkIy7Va9CFi04Y5HEnPpiVEOCLeDOXSs794MGDmprjVZTnssJDPymEG3nCO+nVTv7Adz
	ikh1shrNdyPxfLCjgGOhQHUTX0urq0Atc1WU3tNFoBY6uZYan3QSIedisEJZSct3nwpK
	qtNEhwHwLU2r6B4eGYarIp/LtiPoFKwWW6HfumyYmgBTSM8VI7CyNzP8XaksZby8E9WB
	c1Vd9107vA4vgu0PkfUcxKDLmgWxzzsB4FQ8oQf2axy/Z4XduI+OkDFSnLz5LgQV35Gs
	LTpw==
X-Gm-Message-State: ALyK8tLFCAClq2uUGRXsFzPBNTTysKvH+VvZqYfqd+4De/lOB4Hs1GjpbGO+uHco0YKqO0TrlDHHJ9Kl8pBYZ3qU
X-Received: by 10.31.72.135 with SMTP id v129mr3202508vka.120.1466786535007;
	Fri, 24 Jun 2016 09:42:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 24 Jun 2016 09:41:55 -0700 (PDT)
In-Reply-To: <20160624161513.zgqxspxhdre3d67c@hawk.localdomain>
References: <1466535515-18092-1-git-send-email-drjones@redhat.com>
	<CAFEAcA-56LUe_jYK=V-H890WVL12YuDeRSZn9FK3yReiJ4p2Hw@mail.gmail.com>
	<20160624160321.nvn5run4kmywk7kc@hawk.localdomain>
	<20160624161513.zgqxspxhdre3d67c@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 17:41:55 +0100
Message-ID: <CAFEAcA8xQV3PJ7BgFa=ohYDGqyVEtQ9bssoB+0JkGaGJqtaK=w@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: gicv3: use all
 target-list bits
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1XcY5SPa0rci

On 24 June 2016 at 17:15, Andrew Jones <drjones@redhat.com> wrote:
> On Fri, Jun 24, 2016 at 06:03:21PM +0200, Andrew Jones wrote:
>> So we can either
>> a) play it safe and always use clusters of 4 for ARM guests, and
>>    KVM will get "fixed" when we start managing the guest's MPIDR
>>    from userspace, or
>> b) use 8 here, as TCG always has, and KVM does for AArch32 guests.
>>    This might be less safe, but also improves SGI efficiency.
>
> Actually AArch32 guests would even use all 16 tlist bits on gicv3, if
> there was a KVM host available to try it. So the (b) option shouldn't
> be "use 8" it should be "don't treat 32-bit guests differently"

KVM AArch32 is 4 CPUs per cluster:
http://lxr.free-electrons.com/source/arch/arm/kvm/coproc.c#L109

thanks
-- PMM
