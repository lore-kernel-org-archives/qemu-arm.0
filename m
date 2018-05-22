Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1436262wme;
        Tue, 22 May 2018 05:34:03 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqEkktfZq7UVwv/U42m+xS2CUnB+bP5KTt5/YCB+5Fq4Nsy+6mHn623SgL1/ZuTLwMtIohh
X-Received: by 2002:a37:ba42:: with SMTP id k63-v6mr20940859qkf.436.1526992442965;
        Tue, 22 May 2018 05:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526992442; cv=none;
        d=google.com; s=arc-20160816;
        b=YJdbW+FXEv/cg/Jlg+6rZ2OBpwdkWmNZIttPAACoKwd68LN4n7rBM3uwqjkr+VpvNI
         XmtpqLnakqu0jfKGdKsOi2vrDu+FDMYRjGaWXuFqbu8mAfGHqsYvrGMHheH/siSz5CCU
         IhWUKNRKl+kT3JKzNlatlJ3IlnzwtmdBckdAXygqmhng3lj/khyjp8KHGIIzFIkp6Aym
         SIZuwlMj3DXpUsnYRxgKFMs2q0ojR4BVRM4jB62uGpTxAvrL3cxHyfVRoXTrBP0MY4Av
         SVe9a+NLIxk/UUP5yavlySlTb528qsDcJOMUnD4C43G4QUMH0vUt1IlyZMaUjhv8k9aL
         yE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=F4XVp8mj9LxzT1QsJhWaDywfp1TMSNS/g42EXg+n/0I=;
        b=iK4JiBivkhIbNr+aqRsk3YX0E7eruGXWPyWpRAZ/TK0zUMK/HOszt1eWhLqF07pTdq
         m/i+cGlSoV5fWN+UAupQrBMfs6bcjumMASlf8WcQwgJ57V/9jcwgiVJWg5abROFw0omx
         1wc0WTla7xEVR8RzbsJsZ+g7QGqCM53gmCU4iI3RcIT6vtZt0LflvXIcELChI0dv4NbT
         YMRTWnIyeMAf8gZqjLnuSHf/9y41t1e5dMEgrhR5wMV74BREyf/GrUNbVwVWq7RCzP2P
         MdowkBfAfKviIStA85+qMpdlTOstoq54yBE56WbVsJJJd4BXsyO/JDtC9r9xt+bsYxDb
         no9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UUBUSa32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 44-v6si1548151qte.76.2018.05.22.05.34.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 05:34:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UUBUSa32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fL6UM-0001Ix-Eb
	for alex.bennee@linaro.org; Tue, 22 May 2018 08:34:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6UB-0001Ip-VT
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6UB-0000td-39
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:33:52 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:41112)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fL6UA-0000tK-Tq
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:33:51 -0400
Received: by mail-oi0-x243.google.com with SMTP id 11-v6so16011300ois.8
	for <qemu-arm@nongnu.org>; Tue, 22 May 2018 05:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F4XVp8mj9LxzT1QsJhWaDywfp1TMSNS/g42EXg+n/0I=;
	b=UUBUSa32S+iG/Pbtao2GNRyiDaB3H5g5wUc6geuiN51GCSJK3fSpXSw3uzxDeKfV3L
	M7f/A4gPMsghcYd49Opj9cG/Gi2kwHq+g72kPFBMfF+KTSnX1GKHDsnPDnmx7DrRXYCd
	xi6vFCiXey2TbGh9v0zjMncfskkQ9z2OqG86E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F4XVp8mj9LxzT1QsJhWaDywfp1TMSNS/g42EXg+n/0I=;
	b=CDHLc3mth5jNonYMpdeWZv02v+k3p+KUYkqX4+dfeTQOeujfIafMtKs9FlZvng9i2/
	l0cwXVeM6WQgSXPUK9xTUJdTwEpb2/QKZ/sxsDQtsIR5O/HvycIeviU0GX+FKVwGPHc5
	FM7eTWRll6shmSSLdXQLwY21hRlBWL0EI7lPjJOvA9zWuugGRqkJZzc/dtSuBSJnEJtT
	WszuJAquHOQvRYaKNAlkbIkJqVXwnT2Yx0+HaEt7uN32tlrtCZsOutWmbLX2aGCUzJWr
	TZY6Ugthd5a16fpP/L35YxpHyj6T8eZq5VxShzeuN0Nv9Xp5GxkcuEbhWgOx0fe4+x4x
	dCkQ==
X-Gm-Message-State: ALKqPwfuFlutyAj7XAZg9Y5rMRK48a+pidwsAizLLMfJHihjHMRCuGZC
	Ifhplbep0vj50rF4gj/TnIMqJ+L3+n/phj0tPDxb9w==
X-Received: by 2002:aca:d447:: with SMTP id
	l68-v6mr14462958oig.102.1526992430079; 
	Tue, 22 May 2018 05:33:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 05:33:29
	-0700 (PDT)
In-Reply-To: <1526222114-5324-3-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
	<1526222114-5324-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 13:33:29 +0100
Message-ID: <CAFEAcA8T0sQ_dZ7079WSx0FHp21F3xiWfNY6OFgO4Z0uBAPpLA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [RFC v2 2/7] target/arm: Allow KVM device address
 overwriting
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
Cc: Andrew Jones <drjones@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lh8Edu1IlVAU

On 13 May 2018 at 15:35, Eric Auger <eric.auger@redhat.com> wrote:
> for KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION attribute, the attribute
> data pointed to by kvm_device_attr.addr is a OR of the
> redistributor region address and other fields such as the index
> of the redistributor region and the number of redistributors the
> region can contain.
>
> The existing machine init done notifier framework sets the address
> field to the actual address of the device and does not allow to OR
> this value with other fields.
>
> This patch extends the KVMDevice struct with a new kda_addr_fixup
> member. Its value is passed at registration time and OR'ed with the
> resolved address on kvm_arm_set_device_addr().


> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 1e23640..4050017 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -34,6 +34,7 @@ int kvm_arm_vcpu_init(CPUState *cs);
>   * @group: device control API group for setting addresses
>   * @attr: device control API address type
>   * @dev_fd: device control device file descriptor (or -1 if not supported)
> + * @addr_fixup: value to be OR'ed with resolved address

I think addr_fixup is a bit vague; how about
 addr_fixed_bits ?
(here and in the function argument name). Or something else if
somebody has a better idea.

>   *
>   * Remember the memory region @mr, and when it is mapped by the
>   * machine model, tell the kernel that base address using the
> @@ -45,7 +46,7 @@ int kvm_arm_vcpu_init(CPUState *cs);
>   * address at the point where machine init is complete.
>   */
>  void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
> -                             uint64_t attr, int dev_fd);
> +                             uint64_t attr, int dev_fd, uint64_t addr_fixup);
>
>  /**
>   * kvm_arm_init_cpreg_list:
> --
> 2.5.5

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
