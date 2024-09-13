Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp899912nji;
        Fri, 13 Sep 2024 06:31:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWM5ddUL3ZI207hPZYofsPWtpAvCufUrKj+oB+M52az2o3So0R/ZZqvt6dd4A3CIEkxZ7D/3XrYU2plNw==@linaro.org
X-Google-Smtp-Source: AGHT+IGLJD4M7iXp7rNqh10gsO1QFtkKrLAU/tyLNI5tsooNpf19dtsTtcwZRkuSA/M+dQWgz5Cw
X-Received: by 2002:a05:6102:c13:b0:49b:f8f4:6a77 with SMTP id ada2fe7eead31-49c159ecd02mr10504193137.5.1726234289635;
        Fri, 13 Sep 2024 06:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726234289; cv=none;
        d=google.com; s=arc-20240605;
        b=FnGnNLh38XAsZoJVX59bggKSJ9KaUv2cXyju7ncuuLv+rb0UXobOA/jHNufF4T+GCE
         aMVC9+IVQ7hgvnUN0ip7uGTzs/gMBDMuEsbepfE+/5uzWJ1dXUBZNg2ffgR9gcszLIRv
         +nnwd6resrucYpyGEEcYtf0UPvmOBqu+cP3y7Aol6Hpj6dSuedQgjmKB881FsPcqpiBy
         qUYs7xzxHc2vyxPVRaEpNgU7M+h3hitAZwos1rDgm4e1qBRrh/iy45HkzZJYPoKFMzOg
         zgE6SRsQBai/W1zhejWzNN95Z+E5xEHnHH5lMFi44KmHssezdXSbykZeJKFxVmOKWMsl
         eXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=GvGBItUkDfqFh1oLJWbFeeOAiWJ5xgJuYz7EKc9ObyY=;
        fh=5RHBl2tROctjkVd6XKf+dfaibSINdKHf+mm55LjkRFE=;
        b=SRwx2xB3oKP5ObsfRCDXvcqzDNmJzqLlSU0Dn07kr6TxcniqAvWlh/CymcR37+Bne5
         OWYtxjkVAQByc0NCNd/b7MN4ZU8Ye41iyVnIHVQg4SuwvKcadC2wF5IkHRfqkDlzA0gZ
         s/khiC4yKWAtWwDEm1l/Ek/JJE8v8TBgMtVBVUKqmSzTFIqU+dq4i2GRAX42vHMwVFBp
         ha2ytfn1GIQaKMhZIIGFECfELx0NatO77OTpoxsgAyVxbhwPd5T/sM4hv5KHlIzRWcJ/
         Y/uCLaFf47eUVfymJBtjHX+UJ1iI/c55+wwzBfF334J+fHSb2H0UYWoXFrc3rcq9uZ46
         WnNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eLdMUMVP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-84906e6a0ecsi1068142241.122.2024.09.13.06.31.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 06:31:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eLdMUMVP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sp6OO-0002Yp-I5; Fri, 13 Sep 2024 09:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sp6OL-0002VF-Hu
 for qemu-arm@nongnu.org; Fri, 13 Sep 2024 09:31:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sp6OF-0004oV-T2
 for qemu-arm@nongnu.org; Fri, 13 Sep 2024 09:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726234264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GvGBItUkDfqFh1oLJWbFeeOAiWJ5xgJuYz7EKc9ObyY=;
 b=eLdMUMVPUM94QH71DxVu+jJWEVT7aT3wkfGBq8osLFV4BZmewuyb6B2vpJFZCPMESDDZkq
 fUueC/IifhjC53Z/rJ0H4chE4dy5uP2iAdec/bOm14yS7HE39H+rNPxO/PIdoBWYPPTvUV
 S8G8diutIbe0nGzoJmRcL+nECM59ThQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-b80_NYSkMUS34SVRlp-J5A-1; Fri, 13 Sep 2024 09:31:03 -0400
X-MC-Unique: b80_NYSkMUS34SVRlp-J5A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3750b4feb9fso1074439f8f.1
 for <qemu-arm@nongnu.org>; Fri, 13 Sep 2024 06:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726234262; x=1726839062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GvGBItUkDfqFh1oLJWbFeeOAiWJ5xgJuYz7EKc9ObyY=;
 b=S3ZTrhDGWazooCpEjJNjocSKyMR7DGFGUQRyFaoFUATjYV1yDMoz+2YkzF0o0+lEIe
 b0bovWEZwD17VWBrsdw06r5jH0U+ul5NF7DuFQz1qabXLk4aLZSRq+Fk43s1If9rQk7+
 HC78+IdF1iq3m42eRyuhCSLKZs6Cwt+W3ZhZnu+vBO0UUGwszo+NYuUuDjdyOja3jw+e
 lQCkZv9HGPtALdWST33padVFC43RDrKw6gNzLuDYV9zuQ3uQ/sMTg0Wm/VEa3RSoTu3g
 dL4ojl/o/T5m4bdCnJjSVrXYkOn+NRLrP8vpIvrglQdImnJtD9AU+75ivHgMpWmYgRZ+
 8dUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSq0lL4e+Q6JYcvzMOKDEwt6WtxNZv/TgYt1CQIlWlrvRm4JyPV2OyNennkYyRaryqMi3mAF54/A==@nongnu.org
X-Gm-Message-State: AOJu0Yxti2KF3zxgr2WsxGq81IOt8Mo8IWlP8a7IF0pWdXnPnAmSzYY1
 0DvTPn3/+81DTjKK3SGRvDgP1jzS5/uSwo8s4296mGLbDWilP7D+OxH6+lmPIeqqyyt6b9M4e70
 F7+dQ5y900loAZTlUs1dnxZ95n2hi4rJ10sFJyaDmeDTvT7e+vw==
X-Received: by 2002:adf:b342:0:b0:374:c79d:5f7e with SMTP id
 ffacd0b85a97d-378a8a9c10fmr8178224f8f.26.1726234262207; 
 Fri, 13 Sep 2024 06:31:02 -0700 (PDT)
X-Received: by 2002:adf:b342:0:b0:374:c79d:5f7e with SMTP id
 ffacd0b85a97d-378a8a9c10fmr8178193f8f.26.1726234261379; 
 Fri, 13 Sep 2024 06:31:01 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b05c984sm26274465e9.11.2024.09.13.06.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 06:31:00 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:31:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v9 04/12] acpi/ghes: better name GHES memory error function
Message-ID: <20240913153100.275ce41c@imammedo.users.ipa.redhat.com>
In-Reply-To: <ceb8b8f3537cf9f125fbdc86659bae25fdb34e3b.1724556967.git.mchehab+huawei@kernel.org>
References: <cover.1724556967.git.mchehab+huawei@kernel.org>
 <ceb8b8f3537cf9f125fbdc86659bae25fdb34e3b.1724556967.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.147,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OEsP76hMWYK4

On Sun, 25 Aug 2024 05:45:59 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The current function used to generate GHES data is specific for
> memory errors. Give a better name for it, as we now have a generic
> function as well.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes-stub.c    | 2 +-
>  hw/acpi/ghes.c         | 2 +-
>  include/hw/acpi/ghes.h | 4 ++--
>  target/arm/kvm.c       | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
> index c315de1802d6..dd41b3fd91df 100644
> --- a/hw/acpi/ghes-stub.c
> +++ b/hw/acpi/ghes-stub.c
> @@ -11,7 +11,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/acpi/ghes.h"
>  
> -int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
> +int acpi_ghes_memory_errors(uint8_t source_id, uint64_t physical_address)
>  {
>      return -1;
>  }
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 3190eb954de4..10ed9c0614ff 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -494,7 +494,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      cpu_physical_memory_write(cper_addr, cper, len);
>  }
>  
> -int acpi_ghes_record_errors(int source_id, uint64_t physical_address)
> +int acpi_ghes_memory_errors(int source_id, uint64_t physical_address)
>  {
>      /* Memory Error Section Type */
>      const uint8_t guid[] =
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 4b5af86ec077..be53b7c53c91 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -70,7 +70,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
> -int acpi_ghes_record_errors(int source_id,
> +int acpi_ghes_memory_errors(int source_id,
>                              uint64_t error_physical_addr);
>  void ghes_record_cper_errors(const void *cper, size_t len,
>                               uint16_t source_id, Error **errp);
> @@ -79,7 +79,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>   * acpi_ghes_present: Report whether ACPI GHES table is present
>   *
>   * Returns: true if the system has an ACPI GHES table and it is
> - * safe to call acpi_ghes_record_errors() to record a memory error.
> + * safe to call acpi_ghes_memory_errors() to record a memory error.
>   */
>  bool acpi_ghes_present(void);
>  #endif
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 8c4c8263b85a..8e63e9a59a5e 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2373,7 +2373,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>               */
>              if (code == BUS_MCEERR_AR) {
>                  kvm_cpu_synchronize_state(c);
> -                if (!acpi_ghes_record_errors(ARM_ACPI_HEST_SRC_ID_SEA,
> +                if (!acpi_ghes_memory_errors(ARM_ACPI_HEST_SRC_ID_SEA,
>                                               paddr)) {
>                      kvm_inject_arm_sea(c);
>                  } else {

