Received: by 10.37.35.205 with SMTP id j196csp3101702ybj;
        Thu, 22 Sep 2016 07:58:17 -0700 (PDT)
X-Received: by 10.55.43.85 with SMTP id r82mr2404373qkh.211.1474556296999;
        Thu, 22 Sep 2016 07:58:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q63si1391207qki.33.2016.09.22.07.58.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 07:58:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn5S4-0006Jj-IR
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 10:58:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn50f-0001an-Qv
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 10:29:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn50d-0006CN-Ud
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 10:29:56 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn50d-0006CB-OX
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 10:29:55 -0400
Received: by mail-vk0-x231.google.com with SMTP id 192so27142141vkl.0
	for <qemu-arm@nongnu.org>; Thu, 22 Sep 2016 07:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tsoo047/yOLuTaKzmLQ6rXrF9aG/5+s5EU2/O3PVLcQ=;
	b=RaWGYnwOTGkE4A8bOIQI9nzr+CTjpi8DZihZyPRGMIFKdYnBZ+lzbRkccW3L3xTxSX
	uy8+gpaLaFM1scAeUrsJ3gbUormyQhQsWA9jlAiWqj2dWIMVb1+SwSPbWXv9cnjQaUF0
	uSp2woUD19o/JNhnJRUt4XsDo3BoOtNGBL970=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tsoo047/yOLuTaKzmLQ6rXrF9aG/5+s5EU2/O3PVLcQ=;
	b=JrKPHVA4t6bCuuqa3O1o+ymFXuNIms9KwG99jEHPZV6KDjLk7YpU8bXo4VsA/FSgff
	CY3OgW+hJ3x8IDgfLCPIQ42uTkmE4ZkVAsRK+zrrFqR5fd4qB3pEvPEa9Qw6TqZDdhEC
	t96m2D0JXm2IJbhphJFpyzAb9aT4asNnvPM+xj54U0MrE2H0PN655thCDL990OIHg2WY
	sfehYR76kBWlWOs9Ih52KI7Q80BeRN0GM5NNo6YU203QjAIXdQPLLCcRiEsRMQqbhwIS
	AgwI04EURmpjnOAU0KA6wpMKoXEB2wRBEw/nfFNyFaly+BkFyvyl2iDGgZqdiQf5Vfb7
	YJVQ==
X-Gm-Message-State: AE9vXwOHR+yCeuh/Uj99ponqUnA5ar4SdZDIlIyENg3kIMtWBTnvOC4XqGXW6GwKgzVPoCRRv2J3smx17QLO/6QH
X-Received: by 10.31.75.71 with SMTP id y68mr1595450vka.51.1474554595007; Thu,
	22 Sep 2016 07:29:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 22 Sep 2016 07:29:34 -0700 (PDT)
In-Reply-To: <1473442237-3746-3-git-send-email-eric.auger@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
	<1473442237-3746-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2016 15:29:34 +0100
Message-ID: <CAFEAcA-Y1OTOD8dJb4dhby0rbva_OVZy4GqSQboB85wpswgs8g@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [PATCH v6 2/8] hw/intc/arm_gicv3_its: Implement ITS
 base class
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
X-TUID: 9kpnbPFHfgua

On 9 September 2016 at 18:30, Eric Auger <eric.auger@redhat.com> wrote:
> From: Pavel Fedin <p.fedin@samsung.com>
>
> This is the basic skeleton for both KVM and software-emulated ITS.
> Since we already prepare status structure, we also introduce complete
> VMState description. But, because we currently have no migratable
> implementations, we also set unmigratable flag.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v5 -> v6:
> - rename iomem_its into iomem_its_translation
> - remove vmstate_its fields since the device is not yet
>   migratable
> - fix gicv3_its_trans_write print format
> - add migration_blocker
>
> v4 -> v5:
> - send_msi can return 0 meaning the MSI was rejected by guest. Handle this
>   value as an error
>
> v3 -> v4:
> - fix compilation error
> - msi_supported -> msi_nonbroken
> - streamid -> requester_id
> - use PRIx64
> - read ops uses _with_attrs form
> - 16/32b write access allowed to GITS_TRANSLATER
> - move its_class_name in kvm_arm.h and remove #ifdef TARGET_AARCH64
> - add new kvm device dev_fd field
> - add new gits_translater_gpa field in GICv3ITSState
> ---
>  hw/intc/Makefile.objs                  |   1 +
>  hw/intc/arm_gicv3_its_common.c         | 148 +++++++++++++++++++++++++++++++++
>  include/hw/intc/arm_gicv3_its_common.h |  77 +++++++++++++++++
>  target-arm/kvm_arm.h                   |  19 +++++
>  4 files changed, 245 insertions(+)
>  create mode 100644 hw/intc/arm_gicv3_its_common.c
>  create mode 100644 include/hw/intc/arm_gicv3_its_common.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
