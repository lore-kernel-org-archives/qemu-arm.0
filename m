Received: by 10.25.15.230 with SMTP id 99csp2384087lfp;
        Wed, 29 Mar 2017 22:32:35 -0700 (PDT)
X-Received: by 10.55.40.216 with SMTP id o85mr3926737qko.247.1490851955201;
        Wed, 29 Mar 2017 22:32:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f7si976971qtf.35.2017.03.29.22.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Mar 2017 22:32:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ctShG-0005Kp-Oc
	for alex.bennee@linaro.org; Thu, 30 Mar 2017 01:32:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1ctShD-0005Kj-KO
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 01:32:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1ctShC-0000tk-NV
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 01:32:31 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:36766)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bjsprakash.linux@gmail.com>)
	id 1ctShC-0000t6-Eg; Thu, 30 Mar 2017 01:32:30 -0400
Received: by mail-lf0-x241.google.com with SMTP id n78so3545557lfi.3;
	Wed, 29 Mar 2017 22:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=68kiWHGiV+S5zZFwas7acxOwE/CufA9nMVhYrw8Lk5Y=;
	b=IAILeICGWJzsdX2ajb8DMCwbTpta67QLuT4FymVgBdhN8IY+XILoPh8LIij7AZ9EDb
	NSAPAj/u31Ti2B8rbMzFtzGGbpFHbLoWpYve5dmXRRbLOec1upmX2uLiovlUGO4jnLbX
	ByqiCT1dmlwureD3NiTzMmTrvk92SUHI4x2opONvYucF7kak6piSX7UmwRhgHMjIDjNq
	TXwbr7BEbLCvbkUX8VJPE5bepD+IxH9DVwqW1EcjNYnDdrDoRs2Qd4POYInfg/ZCGWkM
	hyPgnVSrvNU2OZ51odQ2DEEyada3Cj07uhKmNMhMkDLPbGxHYF0mDRfpBRGevmcGzA3G
	UzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=68kiWHGiV+S5zZFwas7acxOwE/CufA9nMVhYrw8Lk5Y=;
	b=AAgpd/urL8pIyxfajcge9w3TKOtGr3woPkNjYJPxQG7o0FNkyYbePN2XSlS5iQcrsY
	WjdftOcGdqt93Ckd3DWSYAehHO2lfs8Lf5YsH58Jn34cBeTMzquRa2QLMe5HwwePZCcE
	ac76LQ372a56ouyOxVZq/qm8GKD/KvixRP9N1K0FIhQXDOstgmlK88gxtoBiW9AuB62p
	OVhyekhiG81U99vZd+hP9TGOE95Ke4mssHB3qVT8RC3xqbaBeBN7nnPIvjTROBKy3dKR
	+tVBRMu4bRa1HWu+ag8PLFUnJE3voKy/lMioiHmz4AOf3f4SFGcWcXniNkNSsQnuZj4H
	smuQ==
X-Gm-Message-State: AFeK/H2odQiW43GNy6+pyfGE93E1mluhSEjgFDjiNpIDV8lDRISd42Bp0XchzzBcPhWT47MfWy4NBjCWuYd6rQ==
X-Received: by 10.25.221.132 with SMTP id w4mr1009899lfi.59.1490851948806;
	Wed, 29 Mar 2017 22:32:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.80.11 with HTTP; Wed, 29 Mar 2017 22:32:28 -0700 (PDT)
In-Reply-To: <1490709513-7180-1-git-send-email-eric.auger@redhat.com>
References: <1490709513-7180-1-git-send-email-eric.auger@redhat.com>
From: Prakash B <bjsprakash.linux@gmail.com>
Date: Thu, 30 Mar 2017 11:02:28 +0530
Message-ID: <CACJhumf7PbkyXfj2kR9he8dPu9sfHZkxjwyaAuoUi6GmdxNhqg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/intc/arm_gicv3_kvm: Check
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
	vijay.kilari@gmail.com, bprakash@caviumnetworks.com,
	qemu-devel@nongnu.org, Prakash B <bjsprakash.linux@gmail.com>,
	Vijaya.Kumar@cavium.com, qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aafr9MjpIlOu

On Tue, Mar 28, 2017 at 7:28 PM, Eric Auger <eric.auger@redhat.com> wrote:
> KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS needs to be checked before
> attempting to read ICC_CTLR_EL1; otherwise kernel versions not
> exposing this kvm device group will be incompatible with qemu 2.9.
>
> Fixes: 07a5628  ("hw/intc/arm_gicv3_kvm: Reset GICv3 cpu interface registers")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Prakash B <bjsprakash.linux@gmail.com>
>
> ---
>
Thank Eric,

Verified compatibility for host kernel versions 4.4, 4.10 and
4.11-rc3, guest booted fine with these.

Tested-by: Prakash, Brahmajyosyula <Brahmajyosyula.Prakash@cavium.com>
