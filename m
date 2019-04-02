Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1385870wrx;
        Tue, 2 Apr 2019 02:33:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZ19XrvIBYxESciiEQK1vnVENVeV6jRBSXMnLgtXhjbyaqug0IYbgz2dPlZl0BHyr1zt/r
X-Received: by 2002:a25:5c6:: with SMTP id 189mr58469092ybf.100.1554197607313;
        Tue, 02 Apr 2019 02:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554197607; cv=none;
        d=google.com; s=arc-20160816;
        b=mg55w/9UztVb3sRay+xyPX3AHXuCjCXwibq0uP74f+TL8L9lFa3+sQCwEt6JY/hXIu
         R6WGVI3uC+F5aYP8SWcZGKJCrXyIS8MgNqG61BJ6R1XY/HztEIF4Xx+gZuHHnpN0XEOi
         pY3YUV48rBlAFlA7uLStgi/iABv0W/IstFs3C0BMKEU94rbvi5CTcctpl7oGt4FVEFXR
         KSV02tWlxJghhbK67kOGd9YdEHIO0AV3iFp7GV1Og+R1ZJr0lu09wJ4J0oZxnTDG5uE2
         XPW0uV83d7Hsh9G5jKaHRk8zFkseJ5YfEt3kFtuN/PFb49RhqWhAjL7AMky+reg1b74S
         556Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=UgJHrBsm3fZ4PYWDRLqiN6Nn+zNYLaOeUVsS1HMDDYo=;
        b=AAmfqYEAIIA6xWM5ShUNiqk/mJeRUjwJZ2JdB9bbChD6ceRWU4zRxzkBN5bjKrZlJ9
         LNvoAqBwaj6F+kcE4zJ1+tuRw0KqTsk+FbH8wjgGm8elGJTfyEfi4/G9dHNdX/UNtxpX
         307GmGrP86vb5EuxuIxmQfWMw3uNTLJD4VHDhG6785ZQ32bg1jp1BJOyIwS4SySk9fRf
         Kga45/Gq+Umw9D35pSspBMzaNqx7uO3ncBsxfIbiE/GnNgFLNIXbXgPTNOCC4WvM1HOv
         H7QGpZDLuILi1gsk/SI/3AKerYo+XCURw3tadXd2WZxubzYBUBMBk47w2dZKSgI0yDSK
         qj8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si7946241ybg.63.2019.04.02.02.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Apr 2019 02:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBFnK-0002br-Qf
	for alex.bennee@linaro.org; Tue, 02 Apr 2019 05:33:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hBFn7-0002bF-S4
	for qemu-arm@nongnu.org; Tue, 02 Apr 2019 05:33:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hBFn6-00081C-0u
	for qemu-arm@nongnu.org; Tue, 02 Apr 2019 05:33:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hBFn3-0007uQ-T5; Tue, 02 Apr 2019 05:33:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CBEE3006029;
	Tue,  2 Apr 2019 09:23:12 +0000 (UTC)
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 935F16141;
	Tue,  2 Apr 2019 09:23:03 +0000 (UTC)
To: Ernest Esene <eroken1@gmail.com>, qemu-devel@nongnu.org
References: <20190401181621.GA31851@erokenlabserver>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <aaa7bca9-bb25-5df8-4b69-0cf6bfbed9cc@redhat.com>
Date: Tue, 2 Apr 2019 11:23:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190401181621.GA31851@erokenlabserver>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 02 Apr 2019 09:23:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 3/3] Categorize devices: iommu
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: To8CP4twnw6r

Hi Ernest,

On 4/1/19 8:16 PM, Ernest Esene wrote:
> Set category and description for iommu devices.
> 
> Signed-off-by: Ernest Esene <eroken1@gmail.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> 
> ---
> v3:
>   * set category and describe smmuv3 as suggested by Eric
> v2:
>   * split into separate patches
> ---
>  hw/arm/smmuv3.c       | 2 ++
>  hw/i386/amd_iommu.c   | 2 ++
>  hw/i386/intel_iommu.c | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 8c4e99fecc..d5a3df047d 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1463,6 +1463,8 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
>      device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
>      c->parent_realize = dc->realize;
>      dc->realize = smmu_realize;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    dc->desc = "ARM IOMMU (SMMUv3) DMA Remapping device"
>  }
>  
>  static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 6eabdf9917..4a4e2c7fd4 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -1601,6 +1601,8 @@ static void amdvi_class_init(ObjectClass *klass, void* data)
>      dc_class->int_remap = amdvi_int_remap;
>      /* Supported by the pc-q35-* machine types */
>      dc->user_creatable = true;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
>  }
>  
>  static const TypeInfo amdvi = {
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 055a1e865d..f9781a5d20 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3727,6 +3727,8 @@ static void vtd_class_init(ObjectClass *klass, void *data)
>      x86_class->int_remap = vtd_int_remap;
>      /* Supported by the pc-q35-* machine types */
>      dc->user_creatable = true;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    dc->desc = "Intel IOMMU (VT-d) DMA Remapping device";
>  }
>  
>  static const TypeInfo vtd_info = {
> 
