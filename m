Received: by 10.25.15.230 with SMTP id 99csp3016176lfp;
        Fri, 31 Mar 2017 04:43:00 -0700 (PDT)
X-Received: by 10.237.48.228 with SMTP id 91mr2451708qtf.292.1490960579931;
        Fri, 31 Mar 2017 04:42:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 25si4363224qts.283.2017.03.31.04.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Mar 2017 04:42:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ctuxH-0007i2-CG
	for alex.bennee@linaro.org; Fri, 31 Mar 2017 07:42:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ctuxA-0007hg-NS
	for qemu-arm@nongnu.org; Fri, 31 Mar 2017 07:42:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ctuxA-0007u9-3l
	for qemu-arm@nongnu.org; Fri, 31 Mar 2017 07:42:52 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:34241)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ctux9-0007tW-Tl
	for qemu-arm@nongnu.org; Fri, 31 Mar 2017 07:42:52 -0400
Received: by mail-wr0-x235.google.com with SMTP id l43so103729958wre.1
	for <qemu-arm@nongnu.org>; Fri, 31 Mar 2017 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oG0GFD3SNKU7tc4mgmrSpywRWnkt6B3jlyLkBcFmM1k=;
	b=NqI0zetzNtg1rc13+cALgeI/d9H15IaKuIz85VwamDdAuUVm4irk11kYStpBJH3rLb
	twXrczo+RQkTFMNGzgylYmwFbml31d8aJw5IZ1r7Fg7Qy8sV3H28BjdpX8/h0q5jJqO5
	1MTyuw3c4iBaxLjgD1Vri0s0znf229QLV2nzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oG0GFD3SNKU7tc4mgmrSpywRWnkt6B3jlyLkBcFmM1k=;
	b=sas4WgSWKVHm0v1qBb6dLkth3RQEPL/F41dBHXyozg9vvTzmfSpYGFBXfF58/fn09r
	l5AlV189q+adkJSXpuRN1ugY9AXi+minHhtkQsprZW7S59EXeQ8Pks6QWqvE1f/CIGsx
	+vw923/Gqfy6g6ZhpN+wWZAF+5b8ih2zNvGlQfjczRREGVZIncuZuVJM+ZDn7xWAiegH
	KgPYMNiHrNHJqeOV/awE7yS66WhRQpNrYpunvKdrfz57Bse/T8m9rrOs7akNijJTIrMT
	jX6tFkHds4DiK4yOm9bdqm4T4rrtvouSOTbbv6q67BEzLIWv/AFB35O1ZUd/KDUpKp51
	Qrmw==
X-Gm-Message-State: AFeK/H06dx1qxwn1UzJrJYikr1LKM2VQQ4gFt3bzTeZo9JiuMGih7DpYIoqCqeHWkbKq0dUah1aC3+oQ0B3RnBsF
X-Received: by 10.223.169.70 with SMTP id u64mr2402605wrc.187.1490960570661;
	Fri, 31 Mar 2017 04:42:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.171.69 with HTTP; Fri, 31 Mar 2017 04:42:28 -0700 (PDT)
In-Reply-To: <1490721640-13052-1-git-send-email-eric.auger@redhat.com>
References: <1490721640-13052-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Mar 2017 12:42:28 +0100
Message-ID: <CAFEAcA8Or3XtKwRudnf5jc=bH_OTwqWrvbPivNf49zYg-RgaeA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-arm] [PATCH v2] hw/intc/arm_gicv3_kvm: Check
 KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS in reset
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
	bprakash@caviumnetworks.com, QEMU Developers <qemu-devel@nongnu.org>,
	Prakash B <bjsprakash.linux@gmail.com>, "Kumar,
	Vijaya" <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Sunil Goutham <sgoutham@cavium.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hg45NgUR2rWk

On 28 March 2017 at 18:20, Eric Auger <eric.auger@redhat.com> wrote:
> KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS needs to be checked before
> attempting to read ICC_CTLR_EL1; otherwise kernel versions not
> exposing this kvm device group will be incompatible with qemu 2.9.
>
> Fixes: 07a5628  ("hw/intc/arm_gicv3_kvm: Reset GICv3 cpu interface registers")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Prakash B <bjsprakash.linux@gmail.com>

Applied to master, thanks.

-- PMM
