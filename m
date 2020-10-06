Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp529559lfq;
        Tue, 6 Oct 2020 03:05:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl7AMdvTQnkmQd6+FFm9J+A4dgbHpZKlb7NPv25s2rCBatfTbFvhxeS5icM+pG2Zu7TWIr
X-Received: by 2002:a25:8051:: with SMTP id a17mr5626650ybn.104.1601978756688;
        Tue, 06 Oct 2020 03:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601978756; cv=none;
        d=google.com; s=arc-20160816;
        b=p7RrUhLsNMmuivqKN3QqdHMATZBS4040PSBu6kLTHNl92qUiypVD3PTvxWprLVf+q/
         kAfJlXo5GzL1I1BvAAn+L+YeWeSlhiXJFtJhqrgW+l0oFG5xyh5fvhsmRd5iyyjL9a7c
         ZkRBgkC2pOENdzCJwxL1ac9reemZKLwZgeB8j1B3B5jrX6HFyqkddAKyI841DlotKGwa
         YPnBzSNC4ntsJpwQWszwNCJZ+l/Da2S9E7I1ifuPVjxLHNAmaIpCnIc5rT+OY2b8uc3L
         GkXM3TRndI5Rspwy2c9AeCoNkALEnIVFZLyUtkP4vBCpfTWinUk34GrMDrcQcrrrt1fu
         +Sxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=RrblmXBARzc9SOzmVezVfLhBelLQC35BvSdrmk3nDlA=;
        b=wSEpJlOxJ6zBCO8ihmf9XEPs18eZhROA5g9rM2EosBz3dQC0p0AfURhZKK1/7zliNO
         zgwzxRhS+aRjIr8drqksvxuxET5H/pUXVGwTBEFIOve6SGk4c0OCCnLJRd5NOBQDP6C8
         jXfhI+dEK7L0vab0mVe0zfL9yNV2NPqRc9GxoI1FjAgPb3iqU2B6HYLZiXEZRo1NOOps
         c+7qGoO33J4AzNvbE07Du+XISGUqtCmktBKCmBVPNTVo4r3hpiW2lR5xHzp1H4+sVuZT
         xV1NPOh1CKQFsUxanyqG53RH8/rBGzihLVdb81Zm6wMHtp/u76MuPkAKDYvb77XH2VsD
         TreQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FgtLSlwY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v202si2912774ybv.429.2020.10.06.03.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Oct 2020 03:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FgtLSlwY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kPjr2-0002VZ-3s
	for alex.bennee@linaro.org; Tue, 06 Oct 2020 06:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kPjqR-0001iK-F6
 for qemu-arm@nongnu.org; Tue, 06 Oct 2020 06:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kPjqO-00055Q-K7
 for qemu-arm@nongnu.org; Tue, 06 Oct 2020 06:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601978715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RrblmXBARzc9SOzmVezVfLhBelLQC35BvSdrmk3nDlA=;
 b=FgtLSlwYK2rLWOlxpMIFxQcJzop7OvQlK/9qEKT6bJB+toadVHlU0vruW/ArpA66S3Nfs7
 zNFiBb54A8P5M8lL/LWrbe7h6sZHgsM7p/AryytO1MTRb3dBNNEMtuMx52iw3KVsodDM1h
 AQdH+eIJOVumD1i2tnrKg3Uu+uFcp9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128--OEqxv9qOQ-17xYSyGtzzw-1; Tue, 06 Oct 2020 06:05:13 -0400
X-MC-Unique: -OEqxv9qOQ-17xYSyGtzzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A13EF100F7C8;
 Tue,  6 Oct 2020 10:05:09 +0000 (UTC)
Received: from localhost (unknown [10.40.208.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DE3B10001B3;
 Tue,  6 Oct 2020 10:05:07 +0000 (UTC)
Date: Tue, 6 Oct 2020 12:05:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2] hw/arm: Restrict APEI tables generation to the
 'virt' machine
Message-ID: <20201006120506.115c7f9c@redhat.com>
In-Reply-To: <20201001162207.1566127-1-philmd@redhat.com>
References: <20201001162207.1566127-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Xiang Zheng <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mXhNiHDYJSAJ

On Thu,  1 Oct 2020 18:22:07 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> While APEI is a generic ACPI feature (usable by X86 and ARM64), only
> the 'virt' machine uses it, by enabling the RAS Virtualization. See
> commit 2afa8c8519: "hw/arm/virt: Introduce a RAS machine option").
>=20
> Restrict the APEI tables generation code to the single user: the virt
> machine. If another machine wants to use it, it simply has to 'select
> ACPI_APEI' in its Kconfig.
>=20
> Fixes: aa16508f1d ("ACPI: Build related register address fields via hardw=
are error fw_cfg blob")
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v2: Reworded
>=20
> Cc: Laszlo Ersek <lersek@redhat.com>
> Cc: Xiang Zheng <zhengxiang9@huawei.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 1 -
>  hw/arm/Kconfig                  | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
> index 9a94ebd0be..08a32123b4 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -43,4 +43,3 @@ CONFIG_FSL_IMX7=3Dy
>  CONFIG_FSL_IMX6UL=3Dy
>  CONFIG_SEMIHOSTING=3Dy
>  CONFIG_ALLWINNER_H3=3Dy
> -CONFIG_ACPI_APEI=3Dy
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index f303c6bead..7d040827af 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -26,6 +26,7 @@ config ARM_VIRT
>      select ACPI_MEMORY_HOTPLUG
>      select ACPI_HW_REDUCED
>      select ACPI_NVDIMM
> +    select ACPI_APEI
> =20
>  config CHEETAH
>      bool

