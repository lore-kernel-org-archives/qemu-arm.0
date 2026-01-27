Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00876D2D8F9
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 11:08:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkgvh-0001Kc-EB; Tue, 27 Jan 2026 06:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkgvf-0001Jo-Mp
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 06:08:16 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkgve-0006ap-4n
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 06:08:15 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-794719afcd4so12181227b3.1
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 03:08:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769512093; cv=none;
 d=google.com; s=arc-20240605;
 b=Hw/agZgqOpzMGh6hsWUmn39AZw0s5E47PNMUA1l6Y0PvBW3IInlRquYHXhkEP8Lgla
 EZCi1SCo4PHovkJ3MFaoWeBXNnDBSUcEsDpLVBaO1azjyHLG9+jVhEmHGD3Mdrx219Vg
 sIK93MoujS39udIR6lYjRAUgU8sI/8t3PyQvQ0hjxGsmrwcWVZ7UxZFhY7ApK42h25Yi
 x9YpfzOe5CGpeMMcrzj9vgRP7XDqvCr3+NmE87pF3iwNBbbb9E0nX+bmdEXgXn6wK1oR
 QLa/3JbZYG1BUWErz4Bu9MoNwdSX6ztB6FY9gJeMSdNGOmgE9lGaRxNpDP5OplUFVvqH
 O5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5eJNbDbH7i6gHxVBVKbxXmOUgEgn32aasXekgexxr50=;
 fh=A1hNoSVUNLkl1v8v3xN+UlouroAfaPsQQ6tzm2sUUwo=;
 b=bGg6b7SlMgQFgBTvLh2mAsMdNc9ndFLLzDi9o+Nwvpp3B5q7+Z999NB6VCDEWaVB3p
 ylx/+zsj5oCJ9A7eIe/LMJZmbeIVuDjSRXU1Iz1kKFLMacXd+oht/sw0mmcb6zuDk6fG
 SF2tuV30uORe34WXB6Gdk8Cwul8CZaOI18PKd/mgSz5VB4pnKGQ5jbfENqE1IpZW4awH
 2tTEdM2CNQGIzxVRYp30kis0A34MDmVmV2Fz7YlXy2gN76uvTS4If2iAY/DxaOmUOJYa
 rCeiWfqOxGkCphtXTVAgSsYYI3rmSF/bCasNDaqHMME09faQHJEo84s84XtaM8LwF7H9
 ryxQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769512093; x=1770116893; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5eJNbDbH7i6gHxVBVKbxXmOUgEgn32aasXekgexxr50=;
 b=of58tUcHBf2FeheLH+N+9uZX1y/MwNFCxIXUI+Cwtm5Bu8xUnjuPPDJAR+Tft80Sji
 Uk44HPStnrptREsP7o+kp48dSYaXSAeu5yRrdaNZbgbaoQIJZLi68QaCtat1M6CqE5sQ
 DWCJyCEcxPkXntGVcOTQ32VvVsfupBjkTEhClJnLAzyKM2SJmEsOmzHmVwYvB+3goM7/
 y7u/Ez+UmRuXpd2XDchWPHfycnoyjZfdJc+znGs8hQR+ttLuQ2+DQTa46jLvM/uUmTpv
 +E1mXz/kdnyX+kdkfZA0kziLbK71K+4L+K6c2LazfAgBSqWxtFzLP/JbM3aZV1UljSiE
 0eDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769512093; x=1770116893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5eJNbDbH7i6gHxVBVKbxXmOUgEgn32aasXekgexxr50=;
 b=DC0v8cATCfPDZzEV4K8GMTSxwLuKuThd0JKuBLKabgbWxSuXkD/HyDDCeYplMRjNip
 vtYdDgV/xLWxEu5Bm+y500EfMNg4Y8SRiFE/Uc2Vw8ak0dJ2xxiDGnv6Wn1lBGM7V30Z
 Vm7QW9dRWa7xFUnlSmiKpYsHRetXsDTW9N5o+5okjcudTlFim0iGmns2iG8Gvnpav9In
 +DbIwFFkI9FN2MytsWhG/T0+tvJK9r0MA8g9ePnRmPN05ZD0K4xe30zv0YzRIbqwrypt
 4TwtnVAWp66RSednOqS/H0Jr8i9TEI93RS8yc52OJ2e4n46Qmpy0l5fA7G78kRKz1Hrl
 hKOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg97oAJbNcsSQunNwwyBrujEF79sTMvEffBJDmTH7KzicE+ABdtPIXYeyvxWY+lvsXbfOwaSDT6A==@nongnu.org
X-Gm-Message-State: AOJu0YwHMtcoRjEy0ddOThJYS8i1sAuqdWKH7+Igu1iFzCKkcaKrJFlr
 fs8c+i+fLJRwxi4eBF9jDc5piH4637SCdl0Zy4OB0fTl7lo+kHYfiiCPNXbLSOdqcUU6VTKVEBy
 5Wn7Emo95BzDXxrL90lPjn+ytxHFS9lwYDx8E24cttw==
X-Gm-Gg: AZuq6aJ6I0GxVH6Ujf0ZRSG3/QYMNsu5NMlTY+M+NmdJOxbaAcBJI5exEedxoKknkw8
 fuSkSCzxfWUXo0fJeG3gmgxl8XQcsCZ2PuFHx7iB/ZDKzbO+ZzurHLflqWKrckG9z+sgoQ9WXN0
 DgS9DomvAe6yz3d5/9WPqT3EBJ5AJxtEeT1FVrB4fcF0srCh/rwKxeQTeRDEk9xYq2rzwhsUM6T
 q32mUU6+Qq9c9WEOL/TKfmvf8K3p2d39WXN1L/Hd/NoAhV8Zid+nvWBz7kd79xl1o293g==
X-Received: by 2002:a05:690c:c512:b0:794:2c3d:7952 with SMTP id
 00721157ae682-7947aa17dd7mr9459697b3.3.1769512092654; Tue, 27 Jan 2026
 03:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20260121134114.9781-1-mohamed@unpredictable.fr>
 <20260121134114.9781-12-mohamed@unpredictable.fr>
In-Reply-To: <20260121134114.9781-12-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jan 2026 11:08:01 +0000
X-Gm-Features: AZwV_Qi0_LfpwjKOz7tFzgkomsBbNs8WuqXxxRgPZlzPkcSE6ohNE3TkiWlg0UU
Message-ID: <CAFEAcA9P=3izrg-D9gEZ7spj8gJtan-GQzz_mes7P0OhLzekXA@mail.gmail.com>
Subject: Re: [PATCH v17 11/21] whpx: interrupt controller support
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>, 
 Igor Mammedov <imammedo@redhat.com>, Cameron Esfahani <dirty@apple.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 Ani Sinha <anisinha@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 21 Jan 2026 at 13:41, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  MAINTAINERS                        |   1 +
>  hw/arm/virt.c                      |  10 ++
>  hw/intc/arm_gicv3_common.c         |   3 +
>  hw/intc/arm_gicv3_whpx.c           | 238 +++++++++++++++++++++++++++++
>  hw/intc/meson.build                |   1 +
>  include/hw/intc/arm_gicv3_common.h |   3 +
>  6 files changed, 256 insertions(+)
>  create mode 100644 hw/intc/arm_gicv3_whpx.c

> +static void whpx_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    GICv3State *s;
> +    GICv3CPUState *c;
> +
> +    c = env->gicv3state;
> +    s = c->gic;
> +
> +    c->icc_pmr_el1 = 0;
> +    /*
> +     * Architecturally the reset value of the ICC_BPR registers
> +     * is UNKNOWN. We set them all to 0 here; when the kernel
> +     * uses these values to program the ICH_VMCR_EL2 fields that
> +     * determine the guest-visible ICC_BPR register values, the
> +     * hardware's "writing a value less than the minimum sets
> +     * the field to the minimum value" behaviour will result in
> +     * them effectively resetting to the correct minimum value
> +     * for the host GIC.
> +     */
> +    c->icc_bpr[GICV3_G0] = 0;
> +    c->icc_bpr[GICV3_G1] = 0;
> +    c->icc_bpr[GICV3_G1NS] = 0;
> +
> +    c->icc_sre_el1 = 0x7;
> +    memset(c->icc_apr, 0, sizeof(c->icc_apr));
> +    memset(c->icc_igrpen, 0, sizeof(c->icc_igrpen));
> +
> +    if (s->migration_blocker) {
> +        return;
> +    }

Looking a bit more closely at this, this is odd. Why the early
return? This looks like it was copied from the KVM GICv3
from prior to commit 59ad421d6. But in the KVM code before
that commit, the reason for the early return is to avoid
the "read the ICC_CTLR value from KVM" call that won't work
(the migration blocker is for the "no KVM API to read/write
GIC registers" case). And in the KVM code after that commit,
we restructured the reset to not read the register in the
reset function, so we don't need to test s->migration_blocker
at all then.

Probably you want to follow the pattern the newer KVM code
uses, but either way, this early return doesn't make much
sense for this whpx code as it stands, especially as the
whpx code isn't currently setting s->migration_blocker...

> +
> +    c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
> +}

thanks
-- PMM

