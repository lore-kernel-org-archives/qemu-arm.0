Received: by 10.80.163.71 with SMTP id 65csp603925edn;
        Thu, 29 Sep 2016 17:38:30 -0700 (PDT)
X-Received: by 10.55.107.1 with SMTP id g1mr4581162qkc.7.1475195910156;
        Thu, 29 Sep 2016 17:38:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o16si10423025qto.86.2016.09.29.17.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Sep 2016 17:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bplqP-0003hz-M1
	for alex.bennee@linaro.org; Thu, 29 Sep 2016 20:38:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplqJ-0003gG-JR
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:38:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplqI-0006yj-Od
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:38:23 -0400
Received: from mail-ua0-x229.google.com ([2607:f8b0:400c:c08::229]:35003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplqI-0006yU-Km
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:38:22 -0400
Received: by mail-ua0-x229.google.com with SMTP id q42so81061199uaq.2
	for <qemu-arm@nongnu.org>; Thu, 29 Sep 2016 17:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pMddMIXoeI5iD+LXqiU6S/9FpimK+/KEwYJW8A/iBaI=;
	b=N14n8+h9SP0IA1MH6OdXNqJE3JtNZbTJvrAsCkiBqVPNUWHsATQMisV/9mCZH5qAlo
	/801RafYAvitnJXYZN/pi6V0Mk0qJnTgNqtHjUHg8hPpyPRKhfA6C8sdelAt9UMcioVd
	2uXy9eXggXygP7f4KvTr8RuIUSuKXq0yS1tGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pMddMIXoeI5iD+LXqiU6S/9FpimK+/KEwYJW8A/iBaI=;
	b=h/ErmIg5UAV88j0Ii5iZzcR37ZSYfcYLXGITR7ixCcpjqDR/akgUyq91z+zqI2wZ2H
	drc+M5vNGsnE8OJsopUFdKjXkJGxNTF361K0HiYgmy+KFp7ep6d5Ysmkot0IPmfTcoX2
	XbyBr8AUYmyw75NdDn/BJCiTayBgyEIdTGDYZ8e1rOyV9nFi9xKX//qwf2cjWe3HuQdj
	4BXGe+77Xe7KBRbW4DX/Awe79Ux4d9gS3Ns3CzW6V/u6HB+k4FX52qYYUigQSoVWhYRg
	7gDWBukwMaBku84xold6UXnYufzZSIu3XTV+uUU7klug2KQrm5VVsyGKdVrR0n2k1DuH
	GzzQ==
X-Gm-Message-State: AA6/9RnOWCta67xMZzc9/9Tj6tRNG7U2qC7F3H+zJiWQo+9+TmT1GlRCPVzLOnE0J3szVVQa4tojCDcxWL8aKZ3m
X-Received: by 10.159.39.38 with SMTP id a35mr3813396uaa.140.1475195902168;
	Thu, 29 Sep 2016 17:38:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 17:38:01 -0700 (PDT)
In-Reply-To: <1474616617-366-6-git-send-email-eric.auger@redhat.com>
References: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
	<1474616617-366-6-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 17:38:01 -0700
Message-ID: <CAFEAcA8YpEL-Ox=Qdf7gFch_03VwEuAzFXW_uL+xUfoUfYr==A@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::229
Subject: Re: [Qemu-arm] [PATCH v7 5/8] hw/intc/arm_gicv3_its: Implement
 support for in-kernel ITS emulation
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +B+o4nQmF1zn

On 23 September 2016 at 00:43, Eric Auger <eric.auger@redhat.com> wrote:
> From: Pavel Fedin <p.fedin@samsung.com>
>
> The ITS control frame is in-kernel emulated while accesses to the
> GITS_TRANSLATER are mediated through the KVM_SIGNAL_MSI ioctl (MSI
> direct MSI injection advertised by the CAP_SIGNAL_MSI capability)
>
> the kvm_gsi_direct_mapping is explicitly set to false to emphasize the
> difference with GICv2M. Direct mapping cannot work with ITS since
> the content of the MSI data is not the target interrupt ID but an
> eventd id.
>
> GSI routing is advertised (kvm_gsi_routing_allowed) as well as
> msi/irqfd signaling (kvm_msi_via_irqfd_allowed).
>
> The MSI frame (GITS_TRANSLATER) absolute GPA is computed on first
> kvm_its_send_msi() call. It is then passed through KVM_SIGNAL_MSI
> ioctl.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
