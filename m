Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3166206njb;
        Tue, 9 Jul 2024 02:20:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUq0QKvJvOIfKXBWjZI64IfLb5j7YIDspL+KXf9hWCV90VlB7HeMu4tpfE2zlO8bORAxi87PZEs1peftZb41JtjtFKOz29y
X-Google-Smtp-Source: AGHT+IHEDXFx8KVfFxl0NqOGx5YVUwSI/0JB6jiqssbK+Uzu9OhJWQVi/q+ctZHDzUp2oGcuJr9M
X-Received: by 2002:a05:622a:2cc:b0:447:f361:e2e0 with SMTP id d75a77b69052e-447faa75e7bmr22174331cf.59.1720516856692;
        Tue, 09 Jul 2024 02:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720516856; cv=none;
        d=google.com; s=arc-20160816;
        b=ZeRpTyK1zdQEn/FizMVlKc/OpoaR1e/8+L0Wy8AK2PNBrKgdQxXzsJenZcjQHSZjqy
         iTtUp5nd89eHHlWfVCvPcx8/q0+i43d/sFb/ScKtoqPFESuKyL9h8dl75P/SfCZ6Pgm+
         S/p07/WPkGSOCCXdjLUEVewZNgS3tTXs9jwVkehpexCoxPGynb113i3ncP12+yD5qutX
         0IZA70Y7eW05ARVjZspTHs5kGMApW7cNWKqghA0m6kOpQY6Vyk7q1KnKyvaEcnCUHWZR
         XVPoHoUkD5f/czHadkenBf0seH+pJq+pA7eYMExsx4APeXBTdVRARw3wLgnXIrATSSkL
         6neQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SKXAddY1zFdk25Bwax5d0DzWqhh4H+kxz4lMg+F01LQ=;
        fh=Q4Vb8spkc95frJjoUYMijUN2ZUSDcnSseNUrkBKCgTk=;
        b=SkRxQBADlbiVX+VL8Ow7WU6A0suLg6RNI+8bGiiD/4XXvoxe+uvQGKLMi/vygj2dnT
         KwavFYEHchwOAYQi8LiljE6OFENfAk5xAf6KN4q5VY0cZgzjmYqaNcUxWQSFfk9y2M1Q
         7FNICB8QeeGu4/ptXBSmg+Iaggd4eIOUSTq+u9r7omd/3OnjJPZb6qJr9JIVU1pOOjXi
         jedgPPOPiiARXa+Vaat10KFJ0msViHhhCcxdiLuTpnzXovXq7YVlOzgwkkZi13htsW1e
         lGg0ALFA6D8nW5ZQB/LyVAfoKCD8DveKQr0TIXSu5eCmAnDzK4sjTo7Ia8aAALWQvGjG
         7/7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VKCWixml;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9af4f77si20317171cf.101.2024.07.09.02.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 02:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VKCWixml;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sR71R-0000sl-O8; Tue, 09 Jul 2024 05:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sR71Q-0000qL-FR
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 05:20:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sR71N-0002Jx-O4
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 05:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720516823;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SKXAddY1zFdk25Bwax5d0DzWqhh4H+kxz4lMg+F01LQ=;
 b=VKCWixml6hKbtRJuZl8CO4KvCeIR3MVCrdkxlHyQaHY9UhD0XoBOu0wL/C4Yy+fkz6VSzJ
 FaXQfWDYnBXBvuOUw2VreIVQf7Au1frcq1LTk8sVoVM/8v/MffnCGOXuS435c9VwjPLiqm
 kQOL6B48anCUNGB1WUuzUD4tFxqoBb0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-OAOTrD_oPL-K0aQyrrDf5g-1; Tue, 09 Jul 2024 05:20:21 -0400
X-MC-Unique: OAOTrD_oPL-K0aQyrrDf5g-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-447e27e9a03so41031801cf.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 02:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720516821; x=1721121621;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SKXAddY1zFdk25Bwax5d0DzWqhh4H+kxz4lMg+F01LQ=;
 b=bCl3yy0aQPAorVIAhQwjB5X/NkNalGZUs/eM6puF6VTiLTR9QOU9eN8KMA3b8up1jy
 5wTk/6TG+Qq90yRCj2ZbxixVThVXo9pfHcxO2aIZsJll8UFjsL18/vdnVGJw2MAQ+39g
 FfLmWQ/1FuxLmNXAiNULcAcou+vygYCW9OSC1ci8cLRQpTn79kOJ4as+Zh/xyswp0IVt
 iYzig9Ezhrge6FCLgMYQj0TaN5hCAqtDlqgS3kKzfsDbYYIYfi5nIXz11iFpZ7rdnPY3
 09j4vCAB5R+i3OI2h6kV1r9uDkBOWkleAOVv1pH5IV9qTQ3DNqm0dabS/zIFEypyaBvv
 TV0A==
X-Gm-Message-State: AOJu0YzQckB6T8J2rvBTTotzyN/zUOWEZv/JqBbKfDml/A67dnbEtw5K
 7V536UI9xGql02ing3SN/CgNK6hAHxyJUequIhJiXvCwtxM1XKitsXnMhNciEUqH+nYb7Io/l5B
 QkQnfOO4pzDJggM+rMxX1NJcf1ACRD41lYIJNuMYVOt7q6QBQhg==
X-Received: by 2002:ac8:7c53:0:b0:447:d87e:7873 with SMTP id
 d75a77b69052e-447faa7bab3mr17429151cf.64.1720516821162; 
 Tue, 09 Jul 2024 02:20:21 -0700 (PDT)
X-Received: by 2002:ac8:7c53:0:b0:447:d87e:7873 with SMTP id
 d75a77b69052e-447faa7bab3mr17429001cf.64.1720516820844; 
 Tue, 09 Jul 2024 02:20:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-447f9b52a4dsm8476761cf.50.2024.07.09.02.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 02:20:20 -0700 (PDT)
Message-ID: <3d151591-4cc6-4de4-8055-27d6fb7200df@redhat.com>
Date: Tue, 9 Jul 2024 11:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 03/10] hw/arm/virt: Get the number of host-level
 SMMUv3 instances
To: Nicolin Chen <nicolinc@nvidia.com>, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, peterx@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, jgg@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, jasowang@redhat.com
References: <cover.1719361174.git.nicolinc@nvidia.com>
 <886883c4cb43117ef26e6c9434247b75cd827f31.1719361174.git.nicolinc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <886883c4cb43117ef26e6c9434247b75cd827f31.1719361174.git.nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xBreDsM/MVDX

Hi Nicolin,

On 6/26/24 02:28, Nicolin Chen wrote:
> Nested SMMUv3 feature requires the support/presence of host-level SMMUv3
> instance(s). Add a helper to read the sysfs for the number of instances.
> Log them in a vms list using a new struct VirtNestedSmmu.
>
> This will be used by a following patch to assign a passthrough device to
> corresponding nested SMMUv3 instance.
Laterly the HostIOMMUDevice has been introduced to allow, among other
things, to pass information related to the physical IOMMU to the virtual
IOMMU.
I guess it would be well fitted to associate the viommu with its
underlying piommu.

I don't think we have such kind of host introspection in machine type.
Generally in can happen in the very device or in libvirt.

Thanks

Eric
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  hw/arm/virt.c         | 35 +++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  8 ++++++++
>  2 files changed, 43 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 71093d7c60..be3d8b0ce6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2668,6 +2668,37 @@ static char *virt_get_iommu(Object *obj, Error **errp)
>      }
>  }
>  
> +static int virt_get_num_nested_smmus(VirtMachineState *vms, Error **errp)
> +{
> +    VirtNestedSmmu *nested_smmu;
> +    struct dirent *dent;
> +    DIR *dir = NULL;
> +    int num = 0;
> +
> +    dir = opendir("/sys/class/iommu");
> +    if (!dir) {
> +        error_setg_errno(errp, errno, "couldn't open /sys/class/iommu");
> +        return 0;
> +    }
> +
> +    while ((dent = readdir(dir))) {
> +        if (!strncmp(dent->d_name, "smmu3.0x", 7)) {
> +            nested_smmu = g_new0(VirtNestedSmmu, 1);
> +            nested_smmu->index = num;
> +            nested_smmu->smmu_node = g_strdup(dent->d_name);
> +            QLIST_INSERT_HEAD(&vms->nested_smmu_list, nested_smmu, next);
> +            num++;
> +        }
> +    }
> +
> +    if (num == 0) {
> +        error_setg_errno(errp, errno,
> +                         "couldn't find any SMMUv3 HW to setup nesting");
> +    }
> +
> +    return num;
> +}
> +
>  static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -2676,6 +2707,7 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>          vms->iommu = VIRT_IOMMU_SMMUV3;
>      } else if (!strcmp(value, "nested-smmuv3")) {
>          vms->iommu = VIRT_IOMMU_NESTED_SMMUV3;
> +        vms->num_nested_smmus = virt_get_num_nested_smmus(vms, errp);
>      } else if (!strcmp(value, "none")) {
>          vms->iommu = VIRT_IOMMU_NONE;
>      } else {
> @@ -3232,6 +3264,9 @@ static void virt_instance_init(Object *obj)
>      /* The default root bus is attached to iommu by default */
>      vms->default_bus_bypass_iommu = false;
>  
> +    /* Default disallows nested SMMU instantiation */
> +    vms->num_nested_smmus = 0;
> +
>      /* Default disallows RAS instantiation */
>      vms->ras = false;
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index d5cbce1a30..e0c07527c4 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -135,6 +135,12 @@ struct VirtMachineClass {
>      bool no_ns_el2_virt_timer_irq;
>  };
>  
> +typedef struct VirtNestedSmmu {
> +    int index;
> +    char *smmu_node;
> +    QLIST_ENTRY(VirtNestedSmmu) next;
> +} VirtNestedSmmu;
> +
>  struct VirtMachineState {
>      MachineState parent;
>      Notifier machine_done;
> @@ -153,6 +159,7 @@ struct VirtMachineState {
>      bool ras;
>      bool mte;
>      bool dtb_randomness;
> +    int num_nested_smmus;
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      IOMMUFDBackend *iommufd;
> @@ -178,6 +185,7 @@ struct VirtMachineState {
>      char *oem_id;
>      char *oem_table_id;
>      bool ns_el2_virt_timer_irq;
> +    QLIST_HEAD(, VirtNestedSmmu) nested_smmu_list;
>  };
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)

