Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp1934641njc;
        Mon, 14 Apr 2025 04:39:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpS8F00BdcaVlijkHhEwNIVk9oLeVrwi2oLu9PyG/Inu2I6zJAXEwsyUQ44BpcQ7XDAXtEq/99eoSzBA==@linaro.org
X-Google-Smtp-Source: AGHT+IG5ipl+4nPRU3VWxOJm77kPVSwitOB8srJkc9byqwYcVgkLEeau6QiCPYa3auG7AO/mUAzr
X-Received: by 2002:a05:622a:1193:b0:477:1dd0:6d15 with SMTP id d75a77b69052e-47976cceddemr178729201cf.5.1744630790497;
        Mon, 14 Apr 2025 04:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744630790; cv=none;
        d=google.com; s=arc-20240605;
        b=DkLYxJEV2JR62/Dz31I1pQgyagkgvmUjypv5qgJjOgUD4ei2wJVIFprIqI8AxgLcPB
         D05BLnn8SvAaBhLZshjvpc8j1cwPSvD8D/2dwf5ZeGZONWEzCdBk2yyYPu1caUrlSGG5
         /U82poCNmHV3NvQzqAKfhxl/npIEr3fcEC5+MFLwglmpaUfXBGwe0jjBjeQl6iyBuDU5
         qfLVUHHsTaiKqsagohhC8F+UwNn0DUevE4xei+Es2PCI27DxDUiG4gN7lS91ohJx5sDK
         fedfGmMOPiJTfHP8IsOY/TjMmW08TLhP3L1MLxMEDRXpIlIKXtuw9byPfblzMYLF74Ww
         VLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=5URvcRM/PLa7qq1fqG1PEHfxEv6adZZhwD1Vlr/G7UY=;
        fh=HDNHVjz+bdzWPcZnqvipBTPiWE4yRPsfHN7qqVNPoPQ=;
        b=fKWa2WydVC1AFIssvPvoL1gXZ8IuxzBd2+oSwqxy00BAOzcfsSMmPJXoOPkmALYb2u
         lUQ7Pzod6Zt4fU11PbSWnA8wUTRa3bTfUc2+6M/fjBu/Qjzq9g4OgS1MbmjMM4tlisIN
         qA5thccsE4JjtDCr2B1bgoMsFiVysAfxQCzJx1x8/etSwmdGjb8qvcQAqi7ImahdVRYL
         dTT6kHiQ87i2sKRLz3JJshnXh+ojxByEQ5sCq55pOsgSZXuosVox87CCwB9WC7mCZsZy
         DzRQJvtoqqGpBl2kuU1wDy1pSF5qsyzyW1l5BiQZaoX0SrXALhIoIATOdk7Gmx3f//Op
         uVhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hLPpVfwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edd5fd1si49189671cf.385.2025.04.14.04.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Apr 2025 04:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hLPpVfwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4IA4-0003fA-3r; Mon, 14 Apr 2025 07:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1u4I9Q-0003I2-GQ
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 07:39:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1u4I9O-0005NW-Im
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 07:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744630731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5URvcRM/PLa7qq1fqG1PEHfxEv6adZZhwD1Vlr/G7UY=;
 b=hLPpVfwmLtr8i8Blbe89fhO4S/tf/gxfGiD0/pXg2RDN633JvDhax91Hw8S3DAniLlc6Qh
 34Ue+5pJIIuuAxIsVii86+/Kz9ojxuE/BjXdidFZJ2hZJ5MVfQh4W/SpX4g7lrWDNnbC4Z
 KEV8SQsO+g0QMSRxdQ2BgLxpH4TN8ig=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-fcSHFLx8NnCVov2qVffP9w-1; Mon, 14 Apr 2025 07:38:49 -0400
X-MC-Unique: fcSHFLx8NnCVov2qVffP9w-1
X-Mimecast-MFC-AGG-ID: fcSHFLx8NnCVov2qVffP9w_1744630729
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d733063cdso35181855e9.0
 for <qemu-arm@nongnu.org>; Mon, 14 Apr 2025 04:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744630729; x=1745235529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5URvcRM/PLa7qq1fqG1PEHfxEv6adZZhwD1Vlr/G7UY=;
 b=ccvF9yHDf7nS/VOjY/X2UuXWj8raUb7vNVBad4Xcw4LvOFEPFJYNf4sKmyds0z8Gd4
 4DiJWYlhMR7qld7k50nqLXiZ0Tss9THmIynUDkUV4OvIOIMNmqxidxPPv3v5ncvJruCo
 N1HpYtwjsrZgodws3y26Q5r3LyN75WNT1g+xA8CmYxGl2aESCEC6iG2Y82SKUqQvPTUs
 uZrrGNyRl0srWzDyGfB8JRm9uPuydhVzw2xUzsPSi/SpeRgJRz5+qEV8yfva19OxA2ah
 5X73Kwt2PZnXpHmO8KmOveO5Cj9IQ97gT0/rlFe2mFxttFFliHkPm8f3kCGZ1neXQ9Zo
 J6aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlriBX2JguVYlGDQ82hilZLVcJ14h7/20HzlMEdLYXQ0gvg0wxnS2In7mgaAC/Z6KG4N2jWexFeQ==@nongnu.org
X-Gm-Message-State: AOJu0YyKiwETSc6pNjgy1B3atCWILCHwyxhQLmfsbULe4NfvMm7PWkSH
 J/b0eIqycA+2RY1eicd+KvQ3BJNV2U5NJ31XzbZtg+FN3az2yMBu2PmZfqOt7GaUDcCEm40KJUG
 MM3JcuOCA8yg1S5GnNGCjvMcKPnz5kEoppBs2AeVtJEQLVlTKhw==
X-Gm-Gg: ASbGnctg9bnvIsdDuGWLl07Z/UIcdAPhNaMXZTx15tO3VEI6LRwrhaAiiZ4Zzj3o48l
 LMoughlzNbLOjM4n51hMdzgVS6ieK9DaD2WFcArKhiLA1xS9Va4LFqQbu+RtG2vPZcI23R5uARS
 1dpzvUCDFrsaar3cKTnYene8qPsw2DL/ORfn+m3YPTh1ytfv+8mxkN0//uOodWP199AQJaXt7mE
 mZS/mKhWYxOiMZztIm8wAFKPYovsu33tP9qzTNcq83s9yIZmHWTb3AdDRzw80yw4KUPzI0QF/KL
 46z0Kg==
X-Received: by 2002:a5d:6d86:0:b0:39c:1efc:1c1c with SMTP id
 ffacd0b85a97d-39ea5211898mr10407941f8f.34.1744630728535; 
 Mon, 14 Apr 2025 04:38:48 -0700 (PDT)
X-Received: by 2002:a5d:6d86:0:b0:39c:1efc:1c1c with SMTP id
 ffacd0b85a97d-39ea5211898mr10407907f8f.34.1744630728023; 
 Mon, 14 Apr 2025 04:38:48 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cccdsm10748166f8f.79.2025.04.14.04.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:38:47 -0700 (PDT)
Date: Mon, 14 Apr 2025 07:38:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH] hw: add compat machines for 10.1
Message-ID: <20250414073837-mutt-send-email-mst@kernel.org>
References: <20250414094543.221241-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250414094543.221241-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -Qd8fcRFJNNj4FrCFvJsPy9INQhsHqZt0vsEOWz8cZY_1744630729
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 29mE930R25QQ

On Mon, Apr 14, 2025 at 11:45:43AM +0200, Cornelia Huck wrote:
> Add 10.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 13 +++++++++++--
>  hw/i386/pc_q35.c           | 13 +++++++++++--
>  hw/m68k/virt.c             |  9 ++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  10 files changed, 76 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a96452f17a48..3e72adaa918f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3408,10 +3408,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_10_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
> +
>  static void virt_machine_10_0_options(MachineClass *mc)
>  {
> +    virt_machine_10_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(10, 0)
> +DEFINE_VIRT_MACHINE(10, 0)
>  
>  static void virt_machine_9_2_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 63c6ef93d296..abfcedd4a5f7 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,6 +37,9 @@
>  #include "hw/virtio/virtio-iommu.h"
>  #include "audio/audio.h"
>  
> +GlobalProperty hw_compat_10_0[] = {};
> +const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
> +
>  GlobalProperty hw_compat_9_2[] = {
>      {"arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
>      { "virtio-balloon-pci", "vectors", "0" },
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 01d0581f62a3..1b5d55e96d51 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -79,6 +79,9 @@
>      { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
>      { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
>  
> +GlobalProperty pc_compat_10_0[] = {};
> +const size_t pc_compat_10_0_len = G_N_ELEMENTS(pc_compat_10_0);
> +
>  GlobalProperty pc_compat_9_2[] = {};
>  const size_t pc_compat_9_2_len = G_N_ELEMENTS(pc_compat_9_2);
>  
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 6c91e2d29298..dbb59df64f75 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -479,12 +479,21 @@ static void pc_i440fx_machine_options(MachineClass *m)
>                                       "Use a different south bridge than PIIX3");
>  }
>  
> -static void pc_i440fx_machine_10_0_options(MachineClass *m)
> +static void pc_i440fx_machine_10_1_options(MachineClass *m)
>  {
>      pc_i440fx_machine_options(m);
>  }
>  
> -DEFINE_I440FX_MACHINE_AS_LATEST(10, 0);
> +DEFINE_I440FX_MACHINE_AS_LATEST(10, 1);
> +
> +static void pc_i440fx_machine_10_0_options(MachineClass *m)
> +{
> +    pc_i440fx_machine_10_1_options(m);
> +    compat_props_add(m->compat_props, hw_compat_10_0, hw_compat_10_0_len);
> +    compat_props_add(m->compat_props, pc_compat_10_0, pc_compat_10_0_len);
> +}
> +
> +DEFINE_I440FX_MACHINE(10, 0);
>  
>  static void pc_i440fx_machine_9_2_options(MachineClass *m)
>  {
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index fd96d0345c7d..c538b3d05b47 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -361,12 +361,21 @@ static void pc_q35_machine_options(MachineClass *m)
>                       pc_q35_compat_defaults, pc_q35_compat_defaults_len);
>  }
>  
> -static void pc_q35_machine_10_0_options(MachineClass *m)
> +static void pc_q35_machine_10_1_options(MachineClass *m)
>  {
>      pc_q35_machine_options(m);
>  }
>  
> -DEFINE_Q35_MACHINE_AS_LATEST(10, 0);
> +DEFINE_Q35_MACHINE_AS_LATEST(10, 1);
> +
> +static void pc_q35_machine_10_0_options(MachineClass *m)
> +{
> +    pc_q35_machine_10_1_options(m);
> +    compat_props_add(m->compat_props, hw_compat_10_0, hw_compat_10_0_len);
> +    compat_props_add(m->compat_props, pc_compat_10_0, pc_compat_10_0_len);
> +}
> +
> +DEFINE_Q35_MACHINE(10, 0);
>  
>  static void pc_q35_machine_9_2_options(MachineClass *m)
>  {
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index d967bdd7438e..295a614e1619 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -366,10 +366,17 @@ type_init(virt_machine_register_types)
>  #define DEFINE_VIRT_MACHINE(major, minor) \
>      DEFINE_VIRT_MACHINE_IMPL(false, major, minor)
>  
> +static void virt_machine_10_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
> +
>  static void virt_machine_10_0_options(MachineClass *mc)
>  {
> +    virt_machine_10_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(10, 0)
> +DEFINE_VIRT_MACHINE(10, 0)
>  
>  static void virt_machine_9_2_options(MachineClass *mc)
>  {
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index b0a0f8c68951..6fef1d167ae6 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4766,15 +4766,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>  #define DEFINE_SPAPR_MACHINE(major, minor) \
>      DEFINE_SPAPR_MACHINE_IMPL(false, major, minor)
>  
> +/*
> + * pseries-10.1
> + */
> +static void spapr_machine_10_1_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE_AS_LATEST(10, 1);
> +
>  /*
>   * pseries-10.0
>   */
>  static void spapr_machine_10_0_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_10_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
>  }
>  
> -DEFINE_SPAPR_MACHINE_AS_LATEST(10, 0);
> +DEFINE_SPAPR_MACHINE(10, 0);
>  
>  /*
>   * pseries-9.2
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 75b32182eb01..d64923a2c86b 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -921,14 +921,26 @@ static const TypeInfo ccw_machine_info = {
>      DEFINE_CCW_MACHINE_IMPL(false, major, minor)
>  
>  
> +static void ccw_machine_10_1_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_10_1_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE_AS_LATEST(10, 1);
> +
>  static void ccw_machine_10_0_instance_options(MachineState *machine)
>  {
> +    ccw_machine_10_1_instance_options(machine);
>  }
>  
>  static void ccw_machine_10_0_class_options(MachineClass *mc)
>  {
> +    ccw_machine_10_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10_0_len);
>  }
> -DEFINE_CCW_MACHINE_AS_LATEST(10, 0);
> +DEFINE_CCW_MACHINE(10, 0);
>  
>  static void ccw_machine_9_2_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index f22b2e7fc75b..bfe8643a27ad 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -761,6 +761,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_10_0[];
> +extern const size_t hw_compat_10_0_len;
> +
>  extern GlobalProperty hw_compat_9_2[];
>  extern const size_t hw_compat_9_2_len;
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 103b54301f82..8677dc8950b4 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -215,6 +215,9 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
>  /* sgx.c */
>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
>  
> +extern GlobalProperty pc_compat_10_0[];
> +extern const size_t pc_compat_10_0_len;
> +
>  extern GlobalProperty pc_compat_9_2[];
>  extern const size_t pc_compat_9_2_len;
>  
> -- 
> 2.49.0

