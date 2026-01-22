Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD47C44500
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Jan 2026 10:31:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1virxR-000663-1Y; Thu, 22 Jan 2026 05:30:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1virxP-00065C-GL
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 05:30:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1virxN-0002k2-2r
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 05:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769077827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gm3300A4RCzEA5Ws2FiopQD8Zriwzalue3a678idUGY=;
 b=CDRqVlH8knCFWFdHm7Hg6J5Hv3kKAxscp+o2lXz8bQ1HaDBL9paa+IaZ0pMoSqAROS6HBA
 rIFZchvTSa7lFD0tfnYSUhhwE1g02tiDTmPJhWgrB7zkl7g2S/V9RL48flV+3IkiNbEkoH
 qd6vb/Y/W9UyA5//DNwv2U7MX7vS1Cc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-zXZRgdfkNCyf_SeimLnidA-1; Thu, 22 Jan 2026 05:30:25 -0500
X-MC-Unique: zXZRgdfkNCyf_SeimLnidA-1
X-Mimecast-MFC-AGG-ID: zXZRgdfkNCyf_SeimLnidA_1769077825
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4801c1056c7so6190295e9.2
 for <qemu-arm@nongnu.org>; Thu, 22 Jan 2026 02:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769077825; x=1769682625;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gm3300A4RCzEA5Ws2FiopQD8Zriwzalue3a678idUGY=;
 b=X0ZBFPfgZG6UyVrdhrtOyXUJJpNc0EsivsVAfvkomrloHzt+V7leDEwwfzdQF8Nxzs
 NeHe69zuezmtKEJKhJViQkteEQYnC5BTas5E0mTz5VQmFhQm7/A32T2NzY9zC+hho1vw
 bwfyB1KVwSmDmDOzM3tPV7aggIiq3QEKi7pz92r3ai7A6kuRPWrgM/w6ell20hjhRIo/
 aLHWl0hAHO3n6/gZ7oZG+5ErCsd80UXa6wfxuTxYtQgiL3rQmXgHz6zuFbTFfkVIYzl5
 slVO1aw8WZp1qRCqS5c1NkCYd8k+H3NT2JY+mfx7C5+uHAqn4/8HSDRZ1WWLfsyc+VBz
 mZUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGwCd0wMTb8tmWjV8iGQeTAiO4sc0+xPwsOcs579CW/ij6hULeSl/2kD82kVDol4DTyKQ3ZnVwtg==@nongnu.org
X-Gm-Message-State: AOJu0Yz+B+i+Td1IBm9I8UNSIpZcq0SWkVijrdHN41E4gnj2vPj5mxzo
 pIyCO863Lvem4PApZCweX6RLK8M19EX4JCEzysNhQ7PBcUIy8Z+06CKkgl0UiWrcAg6g94w2JsP
 D020pN4EYRzWxmbPlYXKiUNuxxBXAGO9kwp4YDjlkL85vONeyk2nfcfR7IEQ5RHRQmBfGp/P5m/
 uWddHMdMl19nhrDOcnMFV1veBmqyfB
X-Gm-Gg: AZuq6aLFj05U4H1Z2ek6j4vxnbqzd9fNIukGYgcQ1lS6JyADf1w5JV+DbVcaMVaGNrG
 r230JITmi+tN357498cw/1u0wo4u74KaHAUQDcRRA5nnpYvmH2+A3mbw0nUH0u97JCWicpxAE3X
 7t4DpjYeMVvoSSiCGOWoSV5B1Vb+5tdKKM5AO0p5TlUygDLnH7KwhmJvSjGV9i0+vQKecz5GALY
 rem97TzZ2VhL2v/dnfb+tPdIyBmtIqXQRoqB1aW66VwtoHCCRk4Jmhj
X-Received: by 2002:a05:600c:83c8:b0:47b:e2a9:2bd7 with SMTP id
 5b1f17b1804b1-4803e7e8555mr123267105e9.19.1769077824659; 
 Thu, 22 Jan 2026 02:30:24 -0800 (PST)
X-Received: by 2002:a05:600c:83c8:b0:47b:e2a9:2bd7 with SMTP id
 5b1f17b1804b1-4803e7e8555mr123266785e9.19.1769077824251; Thu, 22 Jan 2026
 02:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20260121134114.9781-1-mohamed@unpredictable.fr>
 <20260121134114.9781-20-mohamed@unpredictable.fr>
In-Reply-To: <20260121134114.9781-20-mohamed@unpredictable.fr>
From: Prasad Pandit <ppandit@redhat.com>
Date: Thu, 22 Jan 2026 16:00:07 +0530
X-Gm-Features: AZwV_Qiub1mRjDBw2NVb5xUjTSD0YffUAr6Ypyx4_qhURJ7RXzPDMy1LTGd8JQI
Message-ID: <CAE8KmOyFeo38s=HPbdc=gDXFg8-hH4BWUOKissvHGADPBF75OA@mail.gmail.com>
Subject: Re: [PATCH v17 19/21] whpx: arm64: gicv3: add migration blocker
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Alexander Graf <agraf@csgraf.de>, Igor Mammedov <imammedo@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 Ani Sinha <anisinha@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eRJwmUBNgeQkCVHNIkY18129kUiAH1I4LXzvq-SiVyE_1769077825
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.069,
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

On Wed, 21 Jan 2026 at 19:14, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> GICv3 state save-restore is currently not implemented yet.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/intc/arm_gicv3_whpx.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_whpx.c b/hw/intc/arm_gicv3_whpx.c
> index 9bc036d1ac..a2f8e3c5fb 100644
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
> @@ -204,6 +205,14 @@ static void whpx_gicv3_realize(DeviceState *dev, Error **errp)
>          error_setg(errp, "Nested virtualisation not currently supported by WHPX.");
>          return;
>      }
> +
> +    Error *whpx_migration_blocker = NULL;
> +
> +    error_setg(&whpx_migration_blocker,
> +        "Live migration disabled because GIC state save/restore not supported on WHPX");
> +    if (migrate_add_blocker(&whpx_migration_blocker, errp) < 0) {
> +        error_report_err(*errp);
> +    }
>  }
>
>  static void whpx_gicv3_class_init(ObjectClass *klass, const void *data)
> --

Reviewed-by: Prasad Pandit <pjp@fedoraproject.org>

Thank you.
---
  - Prasad


