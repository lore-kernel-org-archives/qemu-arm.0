Received: by 10.25.77.65 with SMTP id a62csp2420138lfb;
        Thu, 16 Feb 2017 03:55:21 -0800 (PST)
X-Received: by 10.55.127.2 with SMTP id a2mr1558832qkd.319.1487246121470;
        Thu, 16 Feb 2017 03:55:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b50si5050882qte.235.2017.02.16.03.55.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 03:55:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceKee-0000lV-Uj
	for alex.bennee@linaro.org; Thu, 16 Feb 2017 06:55:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceKdw-0000kP-VD
	for qemu-devel@nongnu.org; Thu, 16 Feb 2017 06:54:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ceKdw-0001NJ-62
	for qemu-devel@nongnu.org; Thu, 16 Feb 2017 06:54:37 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:38894)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ceKdv-0001Mt-W2
	for qemu-devel@nongnu.org; Thu, 16 Feb 2017 06:54:36 -0500
Received: by mail-wm0-x22f.google.com with SMTP id r141so13225480wmg.1
	for <qemu-devel@nongnu.org>; Thu, 16 Feb 2017 03:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t8mrq2Xo3UWwMk+Z76QWQ7WN5NJ3sNpU1IU2FZ7914o=;
	b=S92ywJAs9ufSKEizimmXObAl64Yewu+IlWMv89nfRrTU8WiD2aA8O3uc/v96pRTXpn
	+3xz/e7ym2IcJg8wWK54hirj2shRFgbVvOxNT/N/zGiSmIlQNMAtaJPGOsXuDDbJ80Ni
	DA2CdwE/rRZKMXAFLdd+jCyhrZPQpgbtc4Gn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t8mrq2Xo3UWwMk+Z76QWQ7WN5NJ3sNpU1IU2FZ7914o=;
	b=bVsgaLTdd8n0qsBUdYXUStAJOE5DmteibqTNTThyavdt7HWszFzKh1Ba8/Va5Jrmdk
	Y5EfoJxUdTatuz8mC8wL83JTOHOqJRz0h0iJ/Ax89r0KV6p4bQndUf/kn3OIfoQllrB9
	vdT+LOuMloHTlwuTTb8AcUegJrMK6XyqIDSaR9F8A24IAk23Lzp1MxSK8kiSaqQqF0uK
	YEmPU0BVf/lrcjA/nO2Juy7SXW+z1ku0+JMHp3gK9DNp+usap4R7i4sl9H7E4/2JM7xC
	UY8zCz/rxaSFmGlF1Bde2iA+3IP+pBlBt5eejt944Cu5xSNxmiUA9sQ4fysi8YVpvP1w
	+UIA==
X-Gm-Message-State: AMke39kA9hi4pv3Lb0/FM2vJHABgM6wfE7zx6Rfi36NTmZxVhjT8BWxgBX8UEoLvirHXE8qDrVW3regTPWFWysRh
X-Received: by 10.28.91.16 with SMTP id p16mr2013173wmb.111.1487246074750;
	Thu, 16 Feb 2017 03:54:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 16 Feb 2017 03:54:14 -0800 (PST)
In-Reply-To: <CALicx6u=i0ukrbQiiVTq4gFKM_Har925UdRrpmJuErk-U5o58Q@mail.gmail.com>
References: <1485879782-6075-1-git-send-email-vijay.kilari@gmail.com>
	<1485879782-6075-6-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA-7PE_T7BsV=vSCEkQDeekB9KnX33Ou5NiUec4XeUu+zw@mail.gmail.com>
	<CALicx6vWBR_bM2g_DObYgw-12girdK9YgGS8X=zAwenz2EmPFg@mail.gmail.com>
	<CAFEAcA9aQwJiwsMSgvPs=vj+qfrFbVVv6-AuhFVsEKX_xO7J2Q@mail.gmail.com>
	<CALicx6u=i0ukrbQiiVTq4gFKM_Har925UdRrpmJuErk-U5o58Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2017 11:54:14 +0000
Message-ID: <CAFEAcA_m30zGGDeUPT98rMtTp00kS2qyv33vp9wYBb_+f7YEiw@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-devel] [PATCH v7 RESEND 5/5] hw/intc/arm_gicv3_kvm: Reset
 GICv3 cpu interface registers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 43choFVANZzD

On 16 February 2017 at 11:28, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Thu, Feb 16, 2017 at 3:39 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 16 February 2017 at 09:54, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>>> On Tue, Feb 7, 2017 at 8:19 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> If you want to do nothing in a read/write function there are
>>>> already arm_cp_read_zero and arm_cp_write_ignore functions for
>>>> this. But using the ARM_CP_NOP flag is better still.
>>>
>>> With ARM_CP_NOP qemu fails to boot.
>>> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Invalid argument
>>> Group 6 attr 0x000000000000c665
>>
>> Not clear to me why using ARM_CP_NOP should result in a KVM
>> call failure -- can you dig further into why that is happening?
>
> if ARM_CP_NOP is set, .reset function is not called and there by KVM fails
> when SRE_EL1 is written with 0x0.

OK. Use the arm_cp_read_zero/arm_cp_write_ignore functions, and
add a comment that we don't use CP_NOP because that means our
reset function isn't called.

thanks
-- PMM
