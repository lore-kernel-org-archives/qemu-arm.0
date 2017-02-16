Received: by 10.25.77.65 with SMTP id a62csp2379211lfb;
        Thu, 16 Feb 2017 02:10:17 -0800 (PST)
X-Received: by 10.200.56.164 with SMTP id f33mr1315856qtc.158.1487239817238;
        Thu, 16 Feb 2017 02:10:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k17si4886312qkl.154.2017.02.16.02.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 02:10:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceJ0y-0005s3-Oy
	for alex.bennee@linaro.org; Thu, 16 Feb 2017 05:10:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceJ0s-0005q1-0H
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 05:10:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceJ0r-0000Uf-8l
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 05:10:09 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:33668)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ceJ0r-0000TD-0R
	for qemu-arm@nongnu.org; Thu, 16 Feb 2017 05:10:09 -0500
Received: by mail-wm0-x22a.google.com with SMTP id t18so2349677wmt.0
	for <qemu-arm@nongnu.org>; Thu, 16 Feb 2017 02:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3K31p8RzII/nLjP+0+K+IpEv01YF1OIzZyuGVjG6CyI=;
	b=hzr49Ocq+VDQif/MonqZ6zMhnI2a2GC071sMHJkJlHxftRUWWet6rDdrcxov6A07vL
	IY24v6WIGfG/HUGjzgPBmeV0DtwTU3r67sJkz7dLz5nRF4UXWEUMyq4hZQCj12xh2WF9
	wtCC4JbeuK36qyNzz/kCPFkfECnjJMiWrxiY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3K31p8RzII/nLjP+0+K+IpEv01YF1OIzZyuGVjG6CyI=;
	b=BVdJGgCd+kCrHjNlQF6h+afwqPh2oHceQQBqIsCQvZFCWDN/eBevHeeRIVjaPaSEfh
	8xNzdpDTmcjmidO3eOMqX5661jrVxf+dZq33aMkQZPbc4bwTQUrNvOBIGj7B7P8Hi8S4
	y58rc1fCrVVwrFmxsfOvxaZdRJTViEXOoerdmpYPKyv1AzVkOejNkICIwfCdCFoUm6zj
	srfZ8mwAbowf0NB25/ooMG10yU8vIgKML55wRGYC97CEgSugLi7kJbmPqlsVyJI2PvKL
	ajVsi28jc16Bit8owByjr0CTyEEFaEImuVbBwitwe/wHzq73IeOH0LWCaonp63Mm74bP
	U+Zw==
X-Gm-Message-State: AMke39lMZDZ9uU9q8g0l48AcjFD5zPuhfacZQ8TPCtt6Z6OD9Hft7Xm1PcyI7pxjPRocZOIr3b8/FbaqFeeQ0hXc
X-Received: by 10.28.189.135 with SMTP id n129mr1596323wmf.92.1487239808093;
	Thu, 16 Feb 2017 02:10:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 16 Feb 2017 02:09:47 -0800 (PST)
In-Reply-To: <CALicx6vWBR_bM2g_DObYgw-12girdK9YgGS8X=zAwenz2EmPFg@mail.gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
	<1485879782-6075-6-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA-7PE_T7BsV=vSCEkQDeekB9KnX33Ou5NiUec4XeUu+zw@mail.gmail.com>
	<CALicx6vWBR_bM2g_DObYgw-12girdK9YgGS8X=zAwenz2EmPFg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2017 10:09:47 +0000
Message-ID: <CAFEAcA9aQwJiwsMSgvPs=vj+qfrFbVVv6-AuhFVsEKX_xO7J2Q@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
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
X-TUID: 8X4I2W9l771F

On 16 February 2017 at 09:54, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Tue, Feb 7, 2017 at 8:19 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> If you want to do nothing in a read/write function there are
>> already arm_cp_read_zero and arm_cp_write_ignore functions for
>> this. But using the ARM_CP_NOP flag is better still.
>
> With ARM_CP_NOP qemu fails to boot.
> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Invalid argument
> Group 6 attr 0x000000000000c665

Not clear to me why using ARM_CP_NOP should result in a KVM
call failure -- can you dig further into why that is happening?

thanks
-- PMM
