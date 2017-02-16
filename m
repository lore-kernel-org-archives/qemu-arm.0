Received: by 10.25.77.65 with SMTP id a62csp2408188lfb;
        Thu, 16 Feb 2017 03:28:48 -0800 (PST)
X-Received: by 10.237.37.71 with SMTP id w7mr1375937qtc.287.1487244528144;
        Thu, 16 Feb 2017 03:28:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k23si5005779qtb.147.2017.02.16.03.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 03:28:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceKEx-0005iR-Lc
	for alex.bennee@linaro.org; Thu, 16 Feb 2017 06:28:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1ceKEu-0005iI-7R
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 06:28:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1ceKEt-0007FR-Eb
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 06:28:44 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1ceKEt-0007Eg-75; Thu, 16 Feb 2017 06:28:43 -0500
Received: by mail-lf0-x242.google.com with SMTP id h65so1213781lfi.3;
	Thu, 16 Feb 2017 03:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1/rFIwNTehDxAt/OqOMbyvDHcDtGyhTzUUvlTNDsK1M=;
	b=DckOVPO0iSI4ZoUIGQFy1YIVuxfk084tR8AozxK7YGD/Wx3cHqUw2w2YyS8EMcs2W9
	Yi/fyAJloZGoZ8bDczTBKIqvrDVpCokkSb8Rb6frl13Ii2pqVtJZjUGDzL0/GiG72kgr
	G8ViFd8PoeMF2R+wo40oLtNkaS0pU3+NsQSN7fmBps195Nbe63q8s0lkP1+POhYR4DsB
	tzVih9zPskAFKneS6KLMoeWiTzW4mPCaAZ2aOcFiZFs/647WtWWXqlVPWbh2iB5ypwFf
	v2mXTurZk2n0GgX5R5h4JZKlg0t7mOpO0EXv2QRz7AJ4JC8UkxkxHOcVgBmcQwgDFwe5
	OQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1/rFIwNTehDxAt/OqOMbyvDHcDtGyhTzUUvlTNDsK1M=;
	b=Dgb2A65i8+zaByETrzQYj3QM9LyjFVLcsSu/OqxG5l4NcIkoTpD1rE7R8FPlmiQtzf
	dS580PacILCqSqkQlzEXEWr7qqjH3aaarawxoyC0RF9B3+sYnluc04rMhchcAIOus/+0
	BVXcU6kJTfZYuHnrVl7OUO8m29H0zGdtWOzVgFyRAHg2rTUjwCRIECPeZ/l3GjWpa6Lk
	IBK4qYmi3vYSZF6QyGOEdkyL6ySjppBa2tdJrM86QGt70b38ApSMXt5ZCrrcnDQJSuvD
	4r3+811qLpRZNOZ5kDZabBSbYdP7Q8VWErFimg+JL5Ii56EGy5v5n797MRAm6Gnu0t0A
	W1gQ==
X-Gm-Message-State: AMke39krJP0FX6JGQqG2V88/Hf8Bid22E+NnHQEoyeJwki3l5jp+8FQFi0MeexYmxBdr27MvcmO2+RFOhPQz7Q==
X-Received: by 10.46.69.7 with SMTP id s7mr524274lja.44.1487244521551; Thu, 16
	Feb 2017 03:28:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.20.15 with HTTP; Thu, 16 Feb 2017 03:28:40 -0800 (PST)
In-Reply-To: <CAFEAcA9aQwJiwsMSgvPs=vj+qfrFbVVv6-AuhFVsEKX_xO7J2Q@mail.gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
	<1485879782-6075-6-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA-7PE_T7BsV=vSCEkQDeekB9KnX33Ou5NiUec4XeUu+zw@mail.gmail.com>
	<CALicx6vWBR_bM2g_DObYgw-12girdK9YgGS8X=zAwenz2EmPFg@mail.gmail.com>
	<CAFEAcA9aQwJiwsMSgvPs=vj+qfrFbVVv6-AuhFVsEKX_xO7J2Q@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Thu, 16 Feb 2017 16:58:40 +0530
Message-ID: <CALicx6u=i0ukrbQiiVTq4gFKM_Har925UdRrpmJuErk-U5o58Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH v7 RESEND 5/5] hw/intc/arm_gicv3_kvm: Reset
 GICv3 cpu interface registers
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /HYW2ND8eOSb

On Thu, Feb 16, 2017 at 3:39 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 16 February 2017 at 09:54, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> On Tue, Feb 7, 2017 at 8:19 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> If you want to do nothing in a read/write function there are
>>> already arm_cp_read_zero and arm_cp_write_ignore functions for
>>> this. But using the ARM_CP_NOP flag is better still.
>>
>> With ARM_CP_NOP qemu fails to boot.
>> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Invalid argument
>> Group 6 attr 0x000000000000c665
>
> Not clear to me why using ARM_CP_NOP should result in a KVM
> call failure -- can you dig further into why that is happening?

if ARM_CP_NOP is set, .reset function is not called and there by KVM fails
when SRE_EL1 is written with 0x0.

>
> thanks
> -- PMM
