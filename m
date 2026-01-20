Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D180AD2ECE9
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 12:24:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viAmk-0008Ue-6q; Tue, 20 Jan 2026 07:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1viAma-0008NX-Up
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 07:24:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1viAmY-0000Bi-ML
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 07:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768911865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9je19wIsyBuozw+rhD3RjIBV+rBhjXZKLgdw4oh4Y9I=;
 b=QwKT6o6tvPH82aVoXkXEQ/uaOzrSA6ag2d8QVBtNQfVfFV2oANZsvDLqNDFzglpsmNkFcF
 /1cWMa9mXbGcXxHqcMki7sFzX9dXBhTXY+MMUf98Mb1xmhT2ituLzFEuRgQA0yXk6/eZkX
 FRspSJzifshUdmXtSs7NDgmZBYBthx4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-gGtgALxCOMKwZXCpp-c5Hw-1; Tue, 20 Jan 2026 07:24:24 -0500
X-MC-Unique: gGtgALxCOMKwZXCpp-c5Hw-1
X-Mimecast-MFC-AGG-ID: gGtgALxCOMKwZXCpp-c5Hw_1768911863
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477c49f273fso49916105e9.3
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 04:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768911863; x=1769516663;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9je19wIsyBuozw+rhD3RjIBV+rBhjXZKLgdw4oh4Y9I=;
 b=QSUQ6+LRJx20gBeh6Nond9EQcebGroO4eSiQw1OTCJfn94MEVYT3LomE6mzs45caGb
 GlEX3+uUh3bpySKBsgCNmyLWg2JYAJFA/WWsGWpdO5nUIxRurSufHzNdxyBVCYCYXtsQ
 L200JvrZMsvS5YvD3ygZggHGVhlCCSDFQxIcdlLFgQmnoWjYNinfchBAreYtzZHuJIxs
 QZO8GJGUS/UYaY7sy4Buq9/7Y2tauClMqSJ6r2PdWlh4CL0RVhjHz2jNg7TINmsfe5AE
 LKUGs4d6Vob9NWvRxj+7nxCOnVm171Yb5o2qoji/XRWpHS8GrP64y0baDEdchK4T8MCT
 sG1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYCp7bg9Evp93PL70gO58h+/ijM5ZlkbCKi5e3KNF66p7NARZ/BFCeCJXO1lZoVLgjC1pSBu1YGA==@nongnu.org
X-Gm-Message-State: AOJu0Yynf0w4H8pd8I9Y6xr0m0AAWiqMoNSZ+aAfjREb58AhxymmHBL0
 BuDlYkwZkS4pTUdCgGCB3Rw5vZctdCnEbjza5noCqQu1a0K724UgZKcb4nSKp9Tzv0c+w3iNtg2
 O/bWd/7wYPcAHM7jT1lfXxLkRvfhUqk1tVO1xGH0QEoByD+Ie3WY9Yr8vSTQx3NAxQpRA2P2rok
 tXB7GUlUyZO1Fsw8/2iwTwCmaIJXuf
X-Gm-Gg: AY/fxX5a79IYvog8O8Rg/EuNTJ1W6z2UXAiPWoLXYFgAicRdlILan4WmfRd97DS6udM
 6skrpXFeNzgus+EMsRgTJ0ovQBhUw9HEdyAbiLuq49snw3Wuop5/DUJ/q6sVuPwRKlE4PR/2Iph
 /zTQwZr+qjsP00TUhC/f7y/+w/Aub7WEBwAR+KdbuX3LnGwmz9u0j//7YjQZGun+DWpF6Fgb0zT
 cUDIAlPWKbQLl8jGpg1oxv6+upTdPdtx19vf9FkqD/F4yaZ37I/pTEW
X-Received: by 2002:a05:600c:8b8c:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-4801e2efd61mr183569205e9.4.1768911863202; 
 Tue, 20 Jan 2026 04:24:23 -0800 (PST)
X-Received: by 2002:a05:600c:8b8c:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-4801e2efd61mr183568745e9.4.1768911862760; Tue, 20 Jan 2026
 04:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
 <20260116135235.38092-23-mohamed@unpredictable.fr>
In-Reply-To: <20260116135235.38092-23-mohamed@unpredictable.fr>
From: Prasad Pandit <ppandit@redhat.com>
Date: Tue, 20 Jan 2026 17:54:06 +0530
X-Gm-Features: AZwV_Qhtw5CsOxCan4HN2G6Un9pq1T_I_qORSudBsDoj2a_cQ18XT6wEQH-jwtg
Message-ID: <CAE8KmOwJ-Gs+4gNaMmyxOXBZzU-exTCVS-vdLFBsX8f=H=K-VA@mail.gmail.com>
Subject: Re: [PATCH v16 22/26] whpx: arm64: gicv3: add migration blocker
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s5Fdq-7P47Vc2GERll1SSBs3P8gWbhI_qHKeaiFxe3Y_1768911863
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.087,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 16 Jan 2026 at 19:31, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> GICv3 state save-restore is currently not implemented yet.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/intc/arm_gicv3_whpx.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_whpx.c b/hw/intc/arm_gicv3_whpx.c
> index 9bc036d1ac..84ef16d9b7 100644
> --- a/hw/intc/arm_gicv3_whpx.c
> +++ b/hw/intc/arm_gicv3_whpx.c
> @@ -17,6 +17,7 @@
>  #include "system/whpx-internal.h"
>  #include "gicv3_internal.h"
>  #include "vgic_common.h"
> +#include "migration/blocker.h"
>  #include "qom/object.h"
>  #include "target/arm/cpregs.h"
>
> @@ -204,6 +205,15 @@ static void whpx_gicv3_realize(DeviceState *dev, Error **errp)
>          error_setg(errp, "Nested virtualisation not currently supported by WHPX.");
>          return;
>      }
> +
> +    Error *whpx_migration_blocker = NULL;
> +
> +    error_setg(&whpx_migration_blocker,
> +        "Live migration disabled because GIC state save/restore not supported on WHPX");
> +    if (migrate_add_blocker(&whpx_migration_blocker, errp)) {
> +        error_free(whpx_migration_blocker);

* This error_free() might cause an issue, IIUC
     migrate_add_blocker(&wphx_migration_blocker
      -> migrate_add_blocker_modes(reasonp,
       -> is_only_migratable(reasonp, ...) /  is_busy(reasonp, ...)
            ...
            error_propagate_prepend(errp, *reasonp, ...)
            *reasonp = NULL;
            return true;

* ie. when error_propagate_prepend() happens, errp starts pointing to
*reasonp, so *reasonp is set to NULL above. Instead of error_free() ->
say -> error_report_err(errp) above;

Thank you.
---
  - Prasad


