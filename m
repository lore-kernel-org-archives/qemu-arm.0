Received: by 10.223.159.82 with SMTP id f18csp2113549wrg;
        Fri, 24 Nov 2017 05:41:27 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaQz22kPTCUOkIQDWmYTutn3IPs0A35YAXvLl9eYupwZ6tNUK9/lpkIBps46L0j+mj2SSvc
X-Received: by 10.37.212.131 with SMTP id m125mr17600220ybf.51.1511530887189;
        Fri, 24 Nov 2017 05:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511530887; cv=none;
        d=google.com; s=arc-20160816;
        b=DRser4eKf1S9FP2GtJ4NCUL8cFgLNTt5y8zeuOL8tIS6/kzkjpCQh8pBz8z3S4NCol
         3LWtue5i3qNwnXdFLFQ5K+qBUeQyCsILW3MDcm9FV/iB3l0UhP68eBQATfV2mT48GC1W
         rXmlKB2utmtpf55uygCWVPqg+CAcuf98WkIQctoLaJ28B/NZT71XvPELV/8srGxeJgy7
         aTDtwropAR364PToLeWwsPY+P5EP1GCDI9Yo9pgpBeplbZ8pN20tlKed8sxXKjt3LemK
         rga3qCZKeFmjDan7TH+MX7vfMAFYRfLS9ksXpmHVxH9VH4iKVccIO2ClNCKQdT13KZUz
         qmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=yDPX7GRS8XaCHxcZhBYrO3J7Ef+/a/sz/4UnFurbDn8=;
        b=e59/M0mSadhU64E0BVXm95GL7SEfX5sJps/ryv6/waLKX9k8vb80ehOuZfTfVLNbCu
         U+oTyUIEVWtjQdhrP/LfF6jd60f5KTDEfujwuLlkBUEY4JDSmtdUGbXblyh3shocko0X
         cbseHElOWjDrSuXk+LXLgkyULkKkoL3Ex3v3afrNe4f+TzHu081LLVBnymvuy08p8PmB
         z7v+iRoHZLeeb9sdctO+ZQLSyUsfAhLt+ZVErur4IviqFsYRcPuDjso+M5NbhgockU+Y
         qPYHVsaMKBcmzDbaaV41QM/IzyfGgqO1Hg/UjQcgbkJJFabKIbWAWPucbHq1Vo15kPRM
         S9MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ERUv3XZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z126si4559287ybz.667.2017.11.24.05.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 05:41:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ERUv3XZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIEEQ-0000gx-Fc
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 08:41:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIEEC-0000ew-VN
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:41:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIEEC-00012K-7f
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:41:13 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:41592)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eIEEC-000122-3i
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:41:12 -0500
Received: by mail-oi0-x243.google.com with SMTP id h81so15098691oib.8
	for <qemu-arm@nongnu.org>; Fri, 24 Nov 2017 05:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yDPX7GRS8XaCHxcZhBYrO3J7Ef+/a/sz/4UnFurbDn8=;
	b=ERUv3XZEqeMCTjNQJN1GurIULbWkgVjxZJDASSVSj82IZGtio2WzFZahPY8qTu7GSH
	o8USyJTx8iiklBHm29ZIukz7+hFyx9aQS1C5SqygpF1Ulu/PKLUbu/9+5tGUk77lc//p
	vmJcJ2iEoXOMnlnKSmZEMOgjnfo4Fmj0WBgJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yDPX7GRS8XaCHxcZhBYrO3J7Ef+/a/sz/4UnFurbDn8=;
	b=LnLC2q+ZCFqnuV4MfFE+XIA1P6gWylLakp7+oOj+3B+MZUKFQ0vGIxxj/rgVJRxNts
	sf9AvrHx+Jj9s5Kfac6smC6IH9I6Bl9XZH79ykjfrFsPskZ8IRoosMPA7zck+CGxtDqj
	Y+OAjg/TbQf4Q10yO61I8D3pje3PVOeoV7SRVKVEdjqgQlU+zi7wpS6OyjiuDUWWMTLn
	UcDJrLGdIQLCgjlQ7sus6KhIknEZJn6jr7As2nzU5Ch+SDNg1bpGVZrV3MnKQNPG5PJV
	OSklkQM1Q6kxh/CVSqou4YIVWLue84MIuLWafvdgGvGCSF9qMzOxYQam8VMvQq6/5UPL
	1ovg==
X-Gm-Message-State: AJaThX777nUTcwvuCZPATBTN9Eqw54icgmCAfrUBMcgHEmZOlvfQ9V46
	IkV8hr8Pl8Xoh8yNfV2h7gjk9Hs9Pdczxo8QxfziGQ==
X-Received: by 10.202.180.132 with SMTP id d126mr6138424oif.299.1511530871349; 
	Fri, 24 Nov 2017 05:41:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 24 Nov 2017 05:40:50 -0800 (PST)
In-Reply-To: <1511530238-18318-5-git-send-email-eric.auger@redhat.com>
References: <1511530238-18318-1-git-send-email-eric.auger@redhat.com>
	<1511530238-18318-5-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Nov 2017 13:40:50 +0000
Message-ID: <CAFEAcA-m6gwgu90kUFa94ZPtKGpZLKUigJzc31SidMt-DTVpTA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH v4 4/4] hw/intc/arm_gicv3_its: Implement full
 reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eOMXVhsPYAwu

On 24 November 2017 at 13:30, Eric Auger <eric.auger@redhat.com> wrote:
> Voiding the ITS caches is not supposed to happen via
> individual register writes. So we introduced a dedicated
> ITS KVM device ioctl to perform a cold reset of the ITS:
> KVM_DEV_ARM_VGIC_GRP_CTRL/KVM_DEV_ARM_ITS_CTRL_RESET. Let's
> use this latter if the kernel supports it.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/intc/arm_gicv3_its_kvm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 83e5268..bad593f 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -204,6 +204,13 @@ static void kvm_arm_its_reset(DeviceState *dev)
>
>      c->parent_reset(dev);
>
> +    if (kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
> +                               KVM_DEV_ARM_ITS_CTRL_RESET)) {
> +        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
> +                          KVM_DEV_ARM_ITS_CTRL_RESET, NULL, true, &error_abort);
> +        return;
> +    }
> +
>      error_report("ITS KVM: full reset is not supported by the host kernel");
>
>      if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> --
> 2.5.5

Ah, here's the check that makes the error message correct. If we're
applying the whole series at once, no big deal; but if we want to
put the earlier patches in 2.11 but not this one we need the
error message to be correct for the situation at that release.

thanks
-- PMM
