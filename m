Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1308801lfq;
        Fri, 2 Oct 2020 00:44:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/qoEDYFZTQbRrChn9o7asu4AH25W8okJqp+ZB8HsN2lkrg6NgooA9MQUetCREE2iRgvKF
X-Received: by 2002:a25:3783:: with SMTP id e125mr1086862yba.423.1601624695358;
        Fri, 02 Oct 2020 00:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601624695; cv=none;
        d=google.com; s=arc-20160816;
        b=lNi1Y2bluKilthamWHlc0sCSFXUhYDdcsF8M0Uz6wx2rhUkf3so4QWGMEyDaNRlHnZ
         8YpNUwAYbcBu2wZ1a+i6v2IazppIaBynll1xEOt/rbwJapV4NTlXwuQLvmnG0ZfxeVmA
         vqUJttdiLFgZS0W6PNTXFgv30hN7xL3NAodVjZ0bym7+TH9zDgD6H0kYwPVEToK71+DX
         33D1GmYloCJKD4zxgZxvjHPuzdqhGLzpbp8QknuFSPiT8MEaHBgoXqgI3O//QYv+1tiE
         7WMw+Pb3ZEalbnY0u4na9Ha0EN/vA9nCP1ByUMmM8PZ0TWVHvm+Hs6MuPd7QW1VbeVVP
         8ndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:date:message-id:from
         :references:to:subject:dkim-signature;
        bh=QhNG1lwKb9aJUlPmfadzErQUZnjytMcR3uJSisWbXaA=;
        b=Frklu25OqJ1KRB+Ml6S6G5JjAGXf23clrTO6sc22qqXSSd8aSvz5lhALe08Ky3tkDP
         PQQDagYaZZ+OGsfbq1S+S4ov2WgKGU+BaikiDo3c5jktDbdGAy2YP8LEyJWNc45FRwe3
         5Dmp1yg1mLfK5YerDBjFg+PXOnZohz10hMzdO8HkRzqyZ4Xa/RPST/1cpk4NTHRNgTki
         +SGLfdgnk9BdJDV1+WiPDc0gMizdff4I08UudTHRpgwGgko9vk0Wk26OUXxMtZBLmehj
         5/8Rj5qmfCafVDEJwBqqXDMMsbttTY8n8nWMMgDuhEnOITBwC7eVa4FiJHttcUPmsgB0
         PoMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RDzhipq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si1054267ybk.72.2020.10.02.00.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 00:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RDzhipq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOFkM-00042P-Nq
	for alex.bennee@linaro.org; Fri, 02 Oct 2020 03:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kOFkD-00041T-35
 for qemu-arm@nongnu.org; Fri, 02 Oct 2020 03:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kOFkA-0004gE-EE
 for qemu-arm@nongnu.org; Fri, 02 Oct 2020 03:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601624680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhNG1lwKb9aJUlPmfadzErQUZnjytMcR3uJSisWbXaA=;
 b=RDzhipq5QaifRAv1hgIn+88DRDAXPTgo8UUpQphiTGPl8xgTG3c1nN/EE6VH8TA9ut9jXg
 QP7mkuFXvQffY581P4aPHpyU9FNlA3IsSIuRi12NEgTuhYWTIEs1BYiV6JmDpHQsl3rCij
 IoRczXZcZVszBd147LIGW522nZn8cxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-EIbsXZV9OIapX1eE8YTnIQ-1; Fri, 02 Oct 2020 03:44:38 -0400
X-MC-Unique: EIbsXZV9OIapX1eE8YTnIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE823188C142;
 Fri,  2 Oct 2020 07:44:36 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-188.ams2.redhat.com
 [10.36.113.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA51A619B5;
 Fri,  2 Oct 2020 07:44:27 +0000 (UTC)
Subject: Re: [PATCH v2] hw/arm: Restrict APEI tables generation to the 'virt'
 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201001162207.1566127-1-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ffeb8263-5c7a-8472-62c8-ebaeb410f429@redhat.com>
Date: Fri, 2 Oct 2020 09:44:27 +0200
MIME-Version: 1.0
In-Reply-To: <20201001162207.1566127-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Dongjiu Geng <gengdongjiu@huawei.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tr/7TraJeIj2

On 10/01/20 18:22, Philippe Mathieu-Daudé wrote:
> While APEI is a generic ACPI feature (usable by X86 and ARM64), only
> the 'virt' machine uses it, by enabling the RAS Virtualization. See
> commit 2afa8c8519: "hw/arm/virt: Introduce a RAS machine option").
> 
> Restrict the APEI tables generation code to the single user: the virt
> machine. If another machine wants to use it, it simply has to 'select
> ACPI_APEI' in its Kconfig.
> 
> Fixes: aa16508f1d ("ACPI: Build related register address fields via hardware error fw_cfg blob")
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Reworded
> 
> Cc: Laszlo Ersek <lersek@redhat.com>
> Cc: Xiang Zheng <zhengxiang9@huawei.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 1 -
>  hw/arm/Kconfig                  | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 9a94ebd0be..08a32123b4 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -43,4 +43,3 @@ CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
>  CONFIG_SEMIHOSTING=y
>  CONFIG_ALLWINNER_H3=y
> -CONFIG_ACPI_APEI=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index f303c6bead..7d040827af 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -26,6 +26,7 @@ config ARM_VIRT
>      select ACPI_MEMORY_HOTPLUG
>      select ACPI_HW_REDUCED
>      select ACPI_NVDIMM
> +    select ACPI_APEI
>  
>  config CHEETAH
>      bool
> 

Acked-by: Laszlo Ersek <lersek@redhat.com>

