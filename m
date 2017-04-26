Received: by 10.25.0.144 with SMTP id 138csp227943lfa;
        Wed, 26 Apr 2017 04:18:14 -0700 (PDT)
X-Received: by 10.237.62.176 with SMTP id n45mr36596413qtf.208.1493205494628;
        Wed, 26 Apr 2017 04:18:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q71si3362498qke.23.2017.04.26.04.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Apr 2017 04:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3Kxa-0007Qb-3O
	for alex.bennee@linaro.org; Wed, 26 Apr 2017 07:18:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1d3KxT-0007Pf-GG
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 07:18:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1d3KxS-00058B-FY
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 07:18:07 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:34104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bjsprakash.linux@gmail.com>)
	id 1d3KxS-00057l-6h; Wed, 26 Apr 2017 07:18:06 -0400
Received: by mail-lf0-x241.google.com with SMTP id x72so24463037lfb.1;
	Wed, 26 Apr 2017 04:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w50tMejSWYjMSAqMob5KYXldDTqq94Qhb/bEy0GuQpU=;
	b=JfteJ8KUS1oZDgvPiTOywCCuP5GqmEq7wMLSAZy7yEECedgN3XoBNt0GYr1LmBWp4R
	F2mRgtjEIy78N574M/8HQ3cAiY91a0E989ig3mJaHCtZWLp/uCbl53UoppovF91BPthN
	XGKtQ1Dkf/k2xF8aOIHjMpl7KrtdE03mU3a032j0nwzZEAlFJshwDgp3T8DoDAz+sr1E
	PnBNJucY0oSmXPhlwAEn0fEA2FB7hc/Yb8lXRbGE3u+SNK/jvZ8sZSUBBTX9EYLbU6Eo
	CZgPuvZOaDPfAVnDeV9CkMwWBBtVCa5FWOHJDXntdV4wW9h4yCqgWXeEnF4SHRAS6y38
	YGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w50tMejSWYjMSAqMob5KYXldDTqq94Qhb/bEy0GuQpU=;
	b=DTf1xM7b8zgEWnvOMIs75a2IOBc1WzVLM++LHtc8FIyhJ/iqaFH6xRx+sRQ4GpPjBq
	C6H8+uh18YDkOwwrF9XRyEaqPIQQg8fhQwTa2dG50u0/jWWfXgAHF9X9PxHdCyDXIe6W
	JYJgs3wSHhWBRPyKNIqP1LTtNGfQ5U9PZY5FRzlm/0BJaVJ0F57Yl9mLr763l5h4vOdJ
	DSo2h45Sa6pVMiyyjsCN14Zx+KRW1+otQQc3bLoBwCBve2qDwH9irxwIZC3huMIsffLx
	aWPa54V0l3sw5KREAUHTHwUvGuICFBsXvoHL0oncsPKNK/CgsxUrXtjpPMe6/w+aJsR1
	x9/g==
X-Gm-Message-State: AN3rC/6dEDLyFVYBQbeT9RF2HDWwp88YwVHUxWN/0GJQGChuC0mqEcCL
	nU/egbGRAxGrSuU/OmXHDaXgXD1/TQ==
X-Received: by 10.25.153.137 with SMTP id b131mr11362710lfe.114.1493205484437; 
	Wed, 26 Apr 2017 04:18:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.80.1 with HTTP; Wed, 26 Apr 2017 04:18:04 -0700 (PDT)
In-Reply-To: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
From: Prakash B <bjsprakash.linux@gmail.com>
Date: Wed, 26 Apr 2017 16:48:04 +0530
Message-ID: <CACJhumcMAtJgnRVctCLE5XJ0eo0vpQ35zjjB8twMTkbVphfB8g@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 0/4] vITS save/restore
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
	Vijay Kilari <vijay.kilari@gmail.com>, quintela@redhat.com,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	Vijaya.Kumar@cavium.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uS+YL+X9rmDP

Verified on Cavium ThunderX platform
Continousily migrated Guest more than 500 times b/w different  hosts.
Please feel free to add  Tested-by: Prakash, Brahmajyosyula
<Brahmajyosyula.Prakash@cavium.com>

On Fri, Apr 14, 2017 at 6:16 PM, Eric Auger <eric.auger@redhat.com> wrote:
> This series allows ITS save/restore and migration use cases.
> It relies on not upstreamed kernel series [1].
>
> ITS tables are flushed into guest RAM on VM stop while registers
> are save on pre_save() callback. Tables and registers are restored
> on ITS post_load().
>
> Redistributor pending tables also are flushed on VM stop, independently
> on ITS tables.
>
> That work was tested on Cavium ThunderX using virsh save/restore and
> virt-manager live migration.
>
> Best Regards
>
> Eric
>
> Host Kernel dependencies:
> - [1] [PATCH v5 00/22] vITS save/restore
>
> History:
> v4 -> v5:
> - adapt to the new user API
> - new patch "hw/intc/arm_gicv3_kvm: Implement pending table save"
>   as the pending table save now is handled on GICV3 side.
>
> v3 -> v4:
> - oversight in v3, missed a last minute correction related to
>   reg useless declaration in kvm_arm_its_pre_save
>
> v2 -> v3:
> - GITS_IIDR is now saved and restored to check ABI revision.
> - get/put functions renamed into pre_save/post_load
> - unmigratable = false removed
> - changed the migration blocker message
> - remove the extract64 round s->ctlr
> - reword some comments
>
> v1 -> v2:
> - rebase on 2.9 soft release code
> - handle case where migrate_add_blocker fails
> - add comments along with ITS and GICv3 migration priorities
>
>
> Eric Auger (4):
>   linux-headers: Update for vITS save/restore
>   hw/intc/arm_gicv3_its: Implement state save/restore
>   hw/intc/arm_gicv3_kvm: Implement pending table save
>   hw/intc/arm_gicv3_its: Allow save/restore
>
>  hw/intc/arm_gicv3_common.c             |   1 +
>  hw/intc/arm_gicv3_its_common.c         |  11 ++-
>  hw/intc/arm_gicv3_its_kvm.c            | 120 +++++++++++++++++++++++++++++----
>  hw/intc/arm_gicv3_kvm.c                |  25 +++++++
>  include/hw/intc/arm_gicv3_its_common.h |   8 +++
>  include/migration/vmstate.h            |   2 +
>  linux-headers/asm-arm/kvm.h            |   6 +-
>  linux-headers/asm-arm64/kvm.h          |   6 +-
>  8 files changed, 164 insertions(+), 15 deletions(-)
>
> --
> 2.5.5
>
>
