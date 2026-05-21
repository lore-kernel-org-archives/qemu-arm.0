Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4317ACD5BB1
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:27:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3Qh-0006WL-A5; Thu, 21 May 2026 09:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wQ3Qf-0006W2-S3
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:27:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wQ3Qe-0003OR-Ci
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779370031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=taoyeZO92Lo+Y2zM4lue4L7ITuLtAyqN4pStN57kKx4=;
 b=dAR9DAKox9aRQogo+812CO96PMJ8LAehurw5FrzH6YI6XUCExGBr2HXk3s0Ovo9hLHAwYK
 MlALcogO4N9EG/5iU0cjQ2DwiTWiv4lbbT0nNiK6vjgp7KVaWNjHHNm8yGskcYIacw3+cy
 NsYWI174UaQ7iQ42r9W+mmZ6OH1+T10=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-aw7_kuP7PjSip3yGhdYGQQ-1; Thu, 21 May 2026 09:27:05 -0400
X-MC-Unique: aw7_kuP7PjSip3yGhdYGQQ-1
X-Mimecast-MFC-AGG-ID: aw7_kuP7PjSip3yGhdYGQQ_1779370024
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-488d1b5bca0so25417375e9.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779370024; x=1779974824;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=taoyeZO92Lo+Y2zM4lue4L7ITuLtAyqN4pStN57kKx4=;
 b=ZvnLQbljqfEDHs25+8qkYJvSCs7lXX8QN5R6DeF1AqKKPFZRSwpjuWfOAV+qcBYHSM
 BsL2nVLAML7Mog0wE4q6k0/6uqjrfPijdNYEZpWsUhXbc+Oxccl9AF4nsi569yn3wiYo
 QFTe8RK+conZZAeFBcvEOiYSqe19wMeypdN3O152UB+ARIcV28d29UOQJMZpS6YujThr
 2Mg3Qj73a0SxO7gt97jgMyC9zFR3EZHwd0q9PVufwj/Jih81s6kDSchgOlgAANVB0t/g
 2aorZsvrCv+zUQJmLTVddLaUSIEJGhpXhYZhQb01pGngudUWo+Z94+zLvvPb7+55MBoE
 JdPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Ta61NTPNO2Hvk34zGujIN4OCJJ4rPZzthsgqsb1WQJ84xM15VO8fgbfKeJ9wwDeRN/oPt8bDWkQ==@nongnu.org
X-Gm-Message-State: AOJu0YxbuC96qv9t4D0QI6GwafjfPSQTfGeC3Elbt13a1Ikd+SLnxy6E
 fE0gNrf+0LFl3GId1hJrmaFWw4odFaD45qW6U0sEVhbGl3kDcIwZHEeMJcU2qszPamKflHXg2aW
 BNZJxDEgBzimc45PLPrqiU5QMCyeMTJppXIyKjrjzxBJeTNyB2LPyiQ==
X-Gm-Gg: Acq92OG23TNrHS27QDLDtvvpm70lET8B4X+lgvWh4JzC+BuPYQGCQVVGhk/vod1hg2E
 H5RX01vK6Rz82fxDRb9ZearBQGu/c+FP6B7Nl8Yjc7/C/bMF2GUKzxspQotgDGAlSrVd/diyqxd
 GuwElQGTL+M96u2j0QK1hjDG8FwTVKc+WOmzdrhrypj8bh56n8dCTke32J+gT6dSvCcO4KZf0ky
 CYMQmdpZA3mjzZV3gtudndqd6UVkiVs5uceJ1S/ooD2MnKRuRouRqcGMBoU9AZTC6Ah9rW5Z4wt
 boR2NECU4slYBO9J3zcEhtYzcPbVqV94yXs5AtVLPFOLcfeHN0hlCiHBvoQOoawhmNbNzIyVuqA
 aT9eYRt16pFUCewNzm4IHXMQ6B71wBO45zEyfllkeub4QxPpNdBn0AA+30k1XCBmvkGyl7VU=
X-Received: by 2002:a05:600c:6c8:b0:48f:f199:79f7 with SMTP id
 5b1f17b1804b1-490360c4820mr25083185e9.27.1779370023722; 
 Thu, 21 May 2026 06:27:03 -0700 (PDT)
X-Received: by 2002:a05:600c:6c8:b0:48f:f199:79f7 with SMTP id
 5b1f17b1804b1-490360c4820mr25082805e9.27.1779370023291; 
 Thu, 21 May 2026 06:27:03 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903cae778asm24857635e9.13.2026.05.21.06.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:27:02 -0700 (PDT)
Date: Thu, 21 May 2026 15:27:01 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, Cornelia Huck <cohuck@redhat.com>, 
 richard.henderson@linaro.org, skolothumtho@nvidia.com, philmd@linaro.org, 
 maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, 
 jdenemar@redhat.com
Subject: Re: [PATCH v5 08/18] target/arm/cpu_idregs: generate tables for
 Arm64 ID registers and fields
In-Reply-To: <20260519132905.145643-9-eric.auger@redhat.com>
Message-ID: <b6b3f600-220c-0b3c-25a1-5a253ba1d7e2@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-9-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8ZwiAhT6lON6ZieMVNHRrBL27TnCAMBJbpsQtAiK0MU_1779370024
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, 19 May 2026, Eric Auger wrote:
> From: Shaju Abraham <shaju.abraham@nutanix.com>
>
> Include cpu-idregs.h.inc multiple times with different definitions for the
> X-macros. This will generate tables for all Arm64 ID registers and their
> fields. Additionally, initialize the tables with all architecturally defined
> values. These tables will be consumed by the property layer in future
> patches.
>
> Co-authored-by: Khushit Shah <khushit.shah@nutanix.com>
> Signed-off-by: Shaju Abraham <shaju.abraham@nutanix.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
> target/arm/cpu-idregs.c | 50 +++++++++++++++++++++++++++++++++++++++++
> target/arm/meson.build  |  1 +
> 2 files changed, 51 insertions(+)
> create mode 100644 target/arm/cpu-idregs.c
>
> diff --git a/target/arm/cpu-idregs.c b/target/arm/cpu-idregs.c
> new file mode 100644
> index 0000000000..f79b22680c
> --- /dev/null
> +++ b/target/arm/cpu-idregs.c
> @@ -0,0 +1,50 @@
> +/*
> + *   ARM ID register field table.
> + *
> + *   Builds the per-id-register field descriptor arrays and the global
> + *   arm_idregs[] table.

arm64_id_regs[]

Reviewed-by: Sebastian Ott <sebott@redhat.com>


