Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E7BF01826
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 10:54:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vySpQ-0007uv-Lh; Fri, 06 Mar 2026 05:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vySpJ-0007ms-Vb
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 05:54:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vySpH-0008TW-Gy
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 05:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772794474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Fw1IL+rPlBYwvEQdF4gP1vQFV1b4ytriE0cLP5+2pA=;
 b=SOVZc+KXG7cirrJe/NwO8bZlCAOmBduTmuyvbp+jANabau8m06uggZcwuxsOT62Hlx71fn
 yrD+nPoDwTD6+uz9KSkWD79OmDb56NTt/y80zCqAKVJpHB6FDTq76QS5iDG4TfiDsfxY9L
 3JrkS8BMd5M3vPa8q0OP7BssiwcWDWA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-wECCABBrMle4SfylS7QO1w-1; Fri, 06 Mar 2026 05:54:33 -0500
X-MC-Unique: wECCABBrMle4SfylS7QO1w-1
X-Mimecast-MFC-AGG-ID: wECCABBrMle4SfylS7QO1w_1772794472
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4837a718f41so47504965e9.2
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 02:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772794472; x=1773399272;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K2J7yrP7K6ql0nVObH6p1+KWN6oROw76uvlCKXfBMSE=;
 b=X+gSIxYpDJZj8vXyH+blttO9MWMPimZiJtc7EJKvsJEFSDVp5rUrwPc41m5DcFIIke
 EHSfe+RlWrseSNorS2x2NKn3PLsWfa+E39O0JY5dxnbKaTR/UWLJ5I+8pbQ5c4pCQ0KP
 xieKP98tVdtO1WvLHV2Wr3hQq5m6YwNaAHi8A57SMwL4TKNt1pe4H2y0ZZxulHb+ltJ+
 1Qv42jCLGXQcHiLsgbP3nkn4pLKB3o9Wq06uHyGtUfbq48R5lWHHP4YqArpbig0U5FDh
 LuGCDOQs/WDeOrRkqemN3L4vbIoO4vOxz+kiM1NaY5I9iqCxFXQGDeci6r/d2iyin5QJ
 2COA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4sRAO7IOT/im/FjMhNpwSHa1YStMEbvFgl+yxMlLPuR2qula5+elDDoMZB8LVRZPdVzKuIj7jnA==@nongnu.org
X-Gm-Message-State: AOJu0Ywzfnx+bLbwouKAskDhkZWcClnc79jbpFNDCIZ5qOLusIpXk1mm
 ZoRkwENn5I8vr/oqV2YlhzF/HvcRvAaAZLmeE4PrJ127UBQWgbMM4dh5SFKxlKVhHVFtytLxtWt
 On9hi9gtnU5ueUm+GNfLOnN/j0kqCFvp9uW2CiMLWpMtLVeJmJSkQzQ==
X-Gm-Gg: ATEYQzwv94eYZUgWWOne/I7ChvgSeOPP9N4+YHSA1tORKvZaHww6PofzdDLQKuTfHVe
 rX8rXeHXCQ3V/Cx9jcDkwkIuTR7y9WPcZwrrpec4+PHUkyhMsFPi310XC013reXZWRaXSMVB14l
 1YO3S2xY39o+Won19BQwuowSJqcl5hhSzOnE+ztpiglng3Um+tWz9jBgptsZx3BnSkhoOu65Qb8
 DGP/LL03r2/SSg9OjpIJoFs9+/SPPaptNU5YtJB2FXHHiVRmPf++C3mwErGJW2N1wOr2kRFPK5D
 mcxx10SGgefIyX9ploKlurZCWKC0R6i9TioI5Hh8x2TMKbjbU9AEvglRfDyLpUD/fRAXxQn9bOS
 RbasSqTbCIttIEhgGtS7SGEQCOuDfyk3FRLuhT+t+u3KY47ZbOby5vRoeZM0Q4QW9hdak
X-Received: by 2002:a05:600c:138a:b0:477:7ae0:cd6e with SMTP id
 5b1f17b1804b1-485269196ffmr27190815e9.5.1772794471868; 
 Fri, 06 Mar 2026 02:54:31 -0800 (PST)
X-Received: by 2002:a05:600c:138a:b0:477:7ae0:cd6e with SMTP id
 5b1f17b1804b1-485269196ffmr27190435e9.5.1772794471429; 
 Fri, 06 Mar 2026 02:54:31 -0800 (PST)
Received: from rh (p200300f6af4a490003d6f56739ca055c.dip0.t-ipconnect.de.
 [2003:f6:af4a:4900:3d6:f567:39ca:55c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8d968sm2781144f8f.6.2026.03.06.02.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 02:54:31 -0800 (PST)
Date: Fri, 6 Mar 2026 11:54:29 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, peterx@redhat.com, 
 philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v8 3/6] target/arm/cpu64: Mitigate migration failures
 due to spurious TCR_EL1, PIRE0_EL1 and PIR_EL1
In-Reply-To: <20260304102249.1963784-4-eric.auger@redhat.com>
Message-ID: <14fca05b-b07b-e44a-dc01-76bafa087d61@redhat.com>
References: <20260304102249.1963784-1-eric.auger@redhat.com>
 <20260304102249.1963784-4-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uFmL1pu6RrqrDS82zZB9e5yeMAclFun3arBC4ip_bds_1772794472
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463806286-1495611457-1772794471=:10135"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.892, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.622,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463806286-1495611457-1772794471=:10135
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 4 Mar 2026, Eric Auger wrote:

> Before linux v6.13 those registers were erroneously unconditionally
> exposed and this was fixed by commits:
> - 0fcb4eea5345 ("KVM: arm64: Hide TCR2_EL1 from userspace when
>                 disabled for guests")
> - a68cddbe47ef ("KVM: arm64: Hide S1PIE registers from userspace
>                 when disabled for guests")
> in v6.13.
>
> This means if we migrate from an old kernel host to a >= 6.13 kernel
> host, migration currently fails.
>
> Declare cpreg migration tolerance for those registers.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>



> ---
> target/arm/cpu64.c | 26 ++++++++++++++++++++++++++
> 1 file changed, 26 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index d6feba220e8..4cfddc6e8c0 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -810,6 +810,31 @@ static void aarch64_a53_initfn(Object *obj)
>     define_cortex_a72_a57_a53_cp_reginfo(cpu);
> }
>
> +static void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu)
> +{
> +    /*
> +     * Registers that may be in the incoming stream and not exposed
> +     * on the destination
> +     */
> +
> +    /*
> +     * TCR_EL1 was erroneously unconditionnally exposed before linux v6.13.
> +     * See commit 0fcb4eea5345 ("KVM: arm64: Hide TCR2_EL1 from userspace
> +     * when disabled for guests")
> +     */
> +    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 2, 0, 3),
> +                                     0, 0, ToleranceNotOnBothEnds);
> +    /*
> +     * PIRE0_EL1 and PIR_EL1 were erroneously unconditionnally exposed
> +     * before linux v6.13. See commit a68cddbe47ef ("KVM: arm64: Hide
> +     * S1PIE registers from userspace when disabled for guests")
> +     */
> +    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 2),
> +                                     0, 0, ToleranceNotOnBothEnds);
> +    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 3),
> +                                     0, 0, ToleranceNotOnBothEnds);
> +}
> +
> static void aarch64_host_initfn(Object *obj)
> {
>     ARMCPU *cpu = ARM_CPU(obj);
> @@ -822,6 +847,7 @@ static void aarch64_host_initfn(Object *obj)
> #endif
>
> #if defined(CONFIG_KVM)
> +    kvm_arm_set_cpreg_mig_tolerances(cpu);
>     kvm_arm_set_cpu_features_from_host(cpu);
>     aarch64_add_sve_properties(obj);
> #elif defined(CONFIG_HVF)
> -- 
> 2.53.0
>
>
---1463806286-1495611457-1772794471=:10135--


