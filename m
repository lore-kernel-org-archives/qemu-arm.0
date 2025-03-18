Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3240892njb;
        Tue, 18 Mar 2025 15:12:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlMV1iz2JDe0rTVO0nc++5KTIuk5b7db80ZCWyV6NT3l+SWfQGhFr18xKDVn/R7cTTS9S5KUsQ/OJsQA==@linaro.org
X-Google-Smtp-Source: AGHT+IHGWJ6D/gZscG07xFzvHLWJIQOipaZ7CEio5Coj2groVEZt4Z7IEnoerxbHlZCXCjSZAGQh
X-Received: by 2002:a05:6214:c6a:b0:6d8:850a:4d6a with SMTP id 6a1803df08f44-6eb29284aadmr6891266d6.1.1742335961907;
        Tue, 18 Mar 2025 15:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742335961; cv=none;
        d=google.com; s=arc-20240605;
        b=EF8YEScwzoLmgOydutv2fhTZDA68hpJmS1CxgOZs30mgUTSPELcNJy1d9Rt9Wzn9Na
         VhGHKClmdJqBKyhai/p5EFCeGauQEis7Tv1MmAeu256YCHZl3h6ESqPr3UuwPTFWs8vt
         1DgVMnFFMKkFXm5CiC39QrgL+YdyEjlH5Jwfx3vf+QoLDYYmH9Hp9CohESZZUfl/yXYo
         CPhVIefZYKyjGXd/BirjKfyOJaBeCUWPlPRU/cr2WjQc3tMokstAq5wsPFIhuNSvtwxl
         2gMqMioMlzIMma9Ql15C3yb0OGu/B1aa7tzmN5P4AwanglflzfOOgiJlBU21i4vfJB42
         4PCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZEhrFKgP48Gy7fx3ihbzsQSbAPz2a8Wl63jdqBT7ISE=;
        fh=Z48CSUiILhFqeS3slGzbGSvEcActSvpg6/23TiAAsOo=;
        b=glug1EBBzyOWzWCJtkR0eAJ5hY74OKd+qlBFTDVtupH7qKHSbfvnzhebL12eMnzbEJ
         0yg15l4QEBjR5+w7nqmnguR4k6jyMnLpHGVV+CO6zFSMj0nz7p2s9f+W50b1LD2zANS+
         0V9XHTAX9a1LWGoJAzd8KyNu9BgIMxSk+UjyyE3gXiyftHCRggeA6zrYtoeS9dG7PE0e
         S876FWSr2sOEfBdYFi8sBh/tX7CrMHeWeSxVpKW3xW6gVTLMYm7Bi43QT9lwQTr6KXlP
         E7PgBnXqHr9pKRIC6UU/IcaFKQW5YT/69u8mbUeOF3+b+2pmyYurn9cV8bwAgpwO3qeT
         SQgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N2ww+XLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573d32a63si1254853085a.606.2025.03.18.15.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 15:12:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N2ww+XLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tufAs-00008q-QG; Tue, 18 Mar 2025 18:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tufAq-00005V-H0
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 18:12:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tufAo-0002Su-0Q
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 18:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742335952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEhrFKgP48Gy7fx3ihbzsQSbAPz2a8Wl63jdqBT7ISE=;
 b=N2ww+XLv5OlbGeBIosh0hCXneGPYmWQCG9po/oWfKc2KYu2Lytx67KymkH50giMmhqHtjE
 /NjqCaK5qQ48FlTz0yD2nqcOYvrCykGSS43X0tQSQbZqRAsuhwq2atjSQ1P0WwlTRSWFRY
 8lS2ZXpQ8qhqVVrkF1tfmfCW5WPJYZE=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-XgUlsm87NSe2xA2KFzjIiQ-1; Tue, 18 Mar 2025 18:12:29 -0400
X-MC-Unique: XgUlsm87NSe2xA2KFzjIiQ-1
X-Mimecast-MFC-AGG-ID: XgUlsm87NSe2xA2KFzjIiQ_1742335948
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3d2a63dc62aso57225555ab.2
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 15:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742335948; x=1742940748;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZEhrFKgP48Gy7fx3ihbzsQSbAPz2a8Wl63jdqBT7ISE=;
 b=Gmj4g7qtz/TX1nXyP6R/8fdlDb86w520+aPXLQeKB9G7DX/eK5NEw9zrMIxLXiYzVI
 vMZEuvXggfZj/cU0W4BFyS0xT/gM9WvggzCeL6maIoVz3pIhZkUno99vhtQUtb6VyCfz
 6S9/sfYacUm5sbWF9e5eLFYL4pSd89VLTYn/goaYe6jR++osIrsQ5l2VrnSwKmCgLzBS
 sK49C2O3qqfmCSiJNF8It4a5E6NcgmFX9aC9Tk3kNVLiaSBkKYI115gCIlcELb+IFmYX
 XyePFoP+/tyfL9Q8nShUEpFXKBLmyWmdn/oyI3DnukDqg2KhuBjwgEF63sHuXUBWkGh0
 R9LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7QQy4Rar3hB4HR9xjUmG8Ymrk9fbYBeNxY182Rzn/hDt7MVbPPj0RyYTejPIB74xkrA/m3BjRPA==@nongnu.org
X-Gm-Message-State: AOJu0YxMHjjbh8FbWqsrpmCPdU72GpHWM++7XFZSEaDybsUfttgtRB8d
 xcNnsG1liW7qwfZ7ZDC5y94oFZ1gyWy3GAkl/bAUdFqrz5LaHb+QgyzoUoDInUVz/8TqOuthb0O
 U3Vc/BJF/OIzp6QloCBJzcZdT5FMayk1EKyjMIcNxy/IvbTb6Lg==
X-Gm-Gg: ASbGncuxGpW5iaby3EiFDKT4EcLItbXCe1SvHzX4w3J++ZXBJWI522vSzr2KOGKvrpX
 CXw0pljEphhdsE7Piuwq6N1xLqL2wr0wBnHUl4oywOht6VWd1tJTvgtr1RkA4k1zZ5B12gHKoNP
 LVnpoi/uy2BTeyswb/xjOS8eBmFGCBarJXeDCCnClMAuwex8pRnfhGtzpczR7QuGU7KjnPKL4lb
 qSnX3MXx8kSeTt523Xxbq/0s2oOc/SL0mFM8C/P7go/2kmetug9uHL/SuiT0a+v1oAusgwbhZvi
 nLn679xHAaTo5R+D
X-Received: by 2002:a05:6e02:1707:b0:3d4:6dd2:3989 with SMTP id
 e9e14a558f8ab-3d586bf08d9mr5041705ab.20.1742335948187; 
 Tue, 18 Mar 2025 15:12:28 -0700 (PDT)
X-Received: by 2002:a05:6e02:1707:b0:3d4:6dd2:3989 with SMTP id
 e9e14a558f8ab-3d586bf08d9mr5041455ab.20.1742335947833; 
 Tue, 18 Mar 2025 15:12:27 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f263701cebsm2920594173.27.2025.03.18.15.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 15:12:27 -0700 (PDT)
Message-ID: <b3a4ce7f-41a9-4da9-a8ca-54848b9e9cf1@redhat.com>
Date: Tue, 18 Mar 2025 18:12:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/20] hw/arm/smmuv3-accel: Associate a pxb-pcie bus
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250311141045.66620-6-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EhzlHwjl8gNHSRSt4YUF6jhsw_3z_49bRw9FPNbZLvQ_1742335948
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Ca39xql4I+5w

Shameer,

Hi!

On 3/11/25 10:10 AM, Shameer Kolothum wrote:
> User must associate a pxb-pcie root bus to smmuv3-accel
> and that is set as the primary-bus for the smmu dev.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>   hw/arm/smmuv3-accel.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index c327661636..1471b65374 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -9,6 +9,21 @@
>   #include "qemu/osdep.h"
>   
>   #include "hw/arm/smmuv3-accel.h"
> +#include "hw/pci/pci_bridge.h"
> +
> +static int smmuv3_accel_pxb_pcie_bus(Object *obj, void *opaque)
> +{
> +    DeviceState *d = opaque;
> +
> +    if (object_dynamic_cast(obj, "pxb-pcie-bus")) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj->parent)->bus;
> +        if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus->name)) {
> +            object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus),
> +                                     &error_abort);
> +        }
> +    }
> +    return 0;
> +}
>   
>   static void smmu_accel_realize(DeviceState *d, Error **errp)
>   {
> @@ -17,6 +32,9 @@ static void smmu_accel_realize(DeviceState *d, Error **errp)
>       SysBusDevice *dev = SYS_BUS_DEVICE(d);
>       Error *local_err = NULL;
>   
> +    object_child_foreach_recursive(object_get_root(),
> +                                   smmuv3_accel_pxb_pcie_bus, d);
> +
>       object_property_set_bool(OBJECT(dev), "accel", true, &error_abort);
>       c->parent_realize(d, &local_err);
>       if (local_err) {
> @@ -33,6 +51,7 @@ static void smmuv3_accel_class_init(ObjectClass *klass, void *data)
>       device_class_set_parent_realize(dc, smmu_accel_realize,
>                                       &c->parent_realize);
>       dc->hotpluggable = false;
> +    dc->bus_type = TYPE_PCIE_BUS;
>   }
>   
>   static const TypeInfo smmuv3_accel_type_info = {

I am not seeing the need for a pxb-pcie bus(switch) introduced for each 'accel'.
Isn't the IORT able to define different SMMUs for different RIDs?   if so, itsn't that sufficient
to associate (define) an SMMU<->RID association without introducing a pxb-pcie?
and again, I'm not sure how that improves/enables the device<->SMMU associativity?

Feel free to enlighten me where I may have mis-read/interpreted the IORT & SMMUv3 specs.

Thanks,
- Don

