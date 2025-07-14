Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51513C83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 15:50:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubLQt-0005Xo-Sx; Mon, 14 Jul 2025 11:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubKEZ-0001Qh-0X
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 10:32:48 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubKEW-0003Sm-Ky
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 10:32:46 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e812fc35985so3631427276.0
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752503562; x=1753108362; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=By24n6LEFYBIQMs5AN6ls3Y2G9z3UtnmydD0gpsDIsk=;
 b=wR4w4Iz8XPvaG1NtnNNlYObXvDRB1phi7uN1hy2y7xW4kM/hjYK/8a7A3cRrCYLuMY
 1L3xCISr8af6zT5CB52OsNOjpoMjGM3pWZw5bq1scqp5zTFCkowyZOdnjprbbnQl9rXV
 LD66RoQm0JVLbJ/r/lY5DIIs8zp894Y7jOgm9fw1KOE5eAR+sSggZypTaxpUNYkPXU/J
 ztCwhhsWxqxLn8k0dyu05x0Doct0InLcpoMEXLMXNSNVzqxKPLIKf9baOOUCO41EnhWu
 qGy0Ns/5hvbGOZxGaf9dNK9iXmdBffe08tOcMvLNkDZ9gF+Agx4pcLOg5YUdrZwdrpmh
 9qTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752503562; x=1753108362;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=By24n6LEFYBIQMs5AN6ls3Y2G9z3UtnmydD0gpsDIsk=;
 b=kjLulx6ltxkbUnEaV+mst05yDRqpbivzRYMrI1ABiIs0LfZzK4PN7o4zK5a//7p/ER
 +K7N6I66qSmqKCzHK/TjQmktVl+7nTJCseRLIEh+DAQZc6DeYDa10rI0p9zYYA5X0gfc
 5p1UaambZpCKZ8rLZ0M0KhskpzfdXc4nEIIh15/dfdm56ASqLX0gYZz+cUavJ3CQJZAK
 Q4yr8xRlxkFihxxVGnVSXZ8jfvzAuQQgDDqxghgQRko6MftZilRzIeipYLsDCy+TphsU
 2R0HHNLaD1HL03AsO98JzWeSSwlpN0zP+HZ4DYXpGqOdB4P/g5T9YIpcVyysWmnVoqhG
 5zKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl7dJhul1ziH3fhYWg/g7fIxpkacM6AvxiMIIO0AXkKqdh0oEKkgRtVi6LN47AOF+ZWTnXfo30ng==@nongnu.org
X-Gm-Message-State: AOJu0YxkEr7Par0Mvo8Ug57Q1yH4xeK/U7+1QJ0AV8XRaaekqYzhHW+C
 oboM09pMzZDi15bt2w0CzvMCU3Po0/YJuvABxwRMvjfFtLPZM8t6HPCzp4mDoNcBHVSNTZwPpky
 4nvxbxXB0HVv2iTHJ1qsVlO2zLc6693Qfo9/Eqme4Qw==
X-Gm-Gg: ASbGncsn46jUWH0MJFf64eo8mEA1mJfP+e/xxrZZW1kZ2M/Np+CE33aZ9LD0GXuA3du
 /HVWJSBOD8TdPHdi1zmcWbmD6K+UGSzYqw2U775SuLVhQShI7Sdi+t7N886Gs5Qq8MdBPGHEpD7
 qZvANEgth0k3oS0+ifb9M8oECEkuH48FA2oXew9NOKat45iEPjb1plpFrvA9Wd1uREH0MrYXpF1
 nmqkqGw
X-Google-Smtp-Source: AGHT+IHjLq5SdwF2gcY85LVfP7Iwun9cMGGGpg+dIGzNcHzhVO5yo0fn1tUsvdMYUPXy6gna33ZCdtewUbesxuJwCGQ=
X-Received: by 2002:a05:690c:31e:b0:70c:9364:2c62 with SMTP id
 00721157ae682-717d5dec46bmr190698497b3.25.1752503562097; Mon, 14 Jul 2025
 07:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <1752503239-222714-1-git-send-email-steven.sistare@oracle.com>
 <1752503239-222714-3-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1752503239-222714-3-git-send-email-steven.sistare@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jul 2025 15:32:30 +0100
X-Gm-Features: Ac12FXwTQxuo2cg0SZXfGBRD9vVDlUVqPTkgCGsDBwX58yrOiiBv8WvPcQw4DOs
Message-ID: <CAFEAcA8yg19zB=xWqcywe+bj57bHjfRaZ5+TBy6GhKwoeJBV-Q@mail.gmail.com>
Subject: Re: [PATCH V1 2/2] hw/intc/arm_gicv3_kvm: preserve pending interrupts
 during cpr
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Cedric Le Goater <clg@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>, 
 Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 14 Jul 2025 at 15:29, Steve Sistare <steven.sistare@oracle.com> wrote:
>
> Close a race condition that causes cpr-transfer to lose VFIO
> interrupts on ARM.
>
> CPR stops VCPUs but does not disable VFIO interrupts, which may continue
> to arrive throughout the transition to new QEMU.
>
> CPR calls kvm_irqchip_remove_irqfd_notifier_gsi in old QEMU to force
> future interrupts to the producer eventfd, where they are preserved.
> Old QEMU then destroys the old KVM instance.  However, interrupts may
> already be pended in KVM state.  To preserve them, call ioctl
> KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES to flush them to guest RAM, where
> they will be picked up when the new KVM+VCPU instance is created.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hw/intc/arm_gicv3_kvm.c            | 16 +++++++++++++++-
>  include/hw/intc/arm_gicv3_common.h |  3 +++
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 43cba6e3f1..15245af2fd 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -30,6 +30,7 @@
>  #include "gicv3_internal.h"
>  #include "vgic_common.h"
>  #include "migration/blocker.h"
> +#include "migration/misc.h"
>  #include "qom/object.h"
>  #include "target/arm/cpregs.h"
>
> @@ -783,6 +784,15 @@ static void vm_change_state_handler(void *opaque, bool running,
>      }
>  }
>
> +static int kvm_arm_gicv3_notifier(NotifierWithReturn *notifier,
> +                                  MigrationEvent *e, Error **errp)
> +{
> +    if (e->type == MIG_EVENT_PRECOPY_DONE) {
> +        GICv3State *s = container_of(notifier, GICv3State, cpr_notifier);
> +        kvm_arm_save_pending_tables(s);

This kvm_arm_gicv3_notifier() function reports an error via
an Error pointer, and the function we call inside
kvm_arm_save_pending_tables() can report errors via an
Error pointer. So I think kvm_arm_save_pending_tables()
should propagate the Error up, not ignore it.

(Or if there's a good reason we should silently ignore
the error here, we should have a comment saying why.)

> +    }
> +    return 0;
> +}

thanks
-- PMM

