Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp780505lfb;
        Wed, 28 Apr 2021 09:28:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoZvOENaNvz8yYS3X51jyYm+wK/b90ejAUGtPxtNTPpke6G+FcJqOtxez8db3+V/zNVnvQ
X-Received: by 2002:a37:4595:: with SMTP id s143mr29634979qka.394.1619627326550;
        Wed, 28 Apr 2021 09:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619627326; cv=none;
        d=google.com; s=arc-20160816;
        b=U25xj7hPsPXioJzDmCoaJqsItoC01I/tpnpk05i2FN1hN5jdMhtML3ozph3WvY4Kyp
         RlhQOloSwFKlV7sVXjNmR3ITXHrczXdx/9Pnjs+T/Gzds8lG4VglxGd83v0rA+7KNmve
         MGVpaXbvycaWIwGdUnvwFjMJofeGnUZA6eF94RMXVO89tJLWJ1y9pBeF9agiuDJx2O37
         jU2eqM2TmeeI4I9AHvCEVIUrqTIx7buU6Es788aqTPAE0Ivj03UUV1KbD0VjsJE/Xmxb
         4xX3xDK6K51oCMgiw6hzXoXUy6E4wlE7fdHnddgvwd8t9nWz09jbCzNIMd3nGK8UdPDe
         U4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:date:message-id:from
         :references:to:subject:dkim-signature;
        bh=eBdNOg2n+/RCuootEMPQndqR/oMDHOVm5dkHImnr1nc=;
        b=h0BajVEYRruQgUxh681RAT+GJpXasqX45ICWu/+oKlz5is9XGZNDhERRaAi7UfpmBY
         hB0JUsKxvGgo/m8k/4o42NDszaXVKvedfFzJnKoLPiIi/upIV3DY7OjrSd9MkF+H7rfq
         IY/QO037NJ9nWk1Hy69Md5v+wS7l0dllcWpqWemU+vI4yGliO9UE2syjZqpYGc4HDOIn
         h0+yqupGmbwnTsXnydU2c0O6xNNSeK6ohCk+g9GlAgxwNGnJ38JdCXF2RksDWnEc9jxy
         sBCtIy+SnQXJCCSNwZT2qePI0FBwCxY6qihfOzey/PHOtPkvzCUo3sipZ9RlQEIt4q3r
         8MpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HmkA8dNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15si284175qtl.350.2021.04.28.09.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 09:28:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HmkA8dNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbn3N-0006L8-W8
	for alex.bennee@linaro.org; Wed, 28 Apr 2021 12:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbn04-0002g1-Q2
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 12:25:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbn03-0004FN-1u
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 12:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619627118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBdNOg2n+/RCuootEMPQndqR/oMDHOVm5dkHImnr1nc=;
 b=HmkA8dNkb0PrUsdqXIQz3elxcOnEBabvIUuZCUwMtaWW5+EX6+QZUVfdfQdBAV77u/jJuE
 Xp/8TrC+it0WLmFedIqz9pAUpIwPPonWyMC5T7KMlB/1S7NMm2+XAiY6FSWW3Hyt3ChpMJ
 01Hj+/OUFFrLnc8tO7pvGLT7hRUYDiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-yc2DmH4iMKe_qfcCmGqlyQ-1; Wed, 28 Apr 2021 12:25:16 -0400
X-MC-Unique: yc2DmH4iMKe_qfcCmGqlyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CBF210CE781;
 Wed, 28 Apr 2021 16:25:15 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-188.ams2.redhat.com
 [10.36.114.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33FA560C05;
 Wed, 28 Apr 2021 16:25:03 +0000 (UTC)
Subject: Re: [PATCH 4/7] hw/acpi/vmgenid: Make ACPI_VMGENID depends on FW_CFG
 Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-5-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d35a5ecd-3fef-a178-f06e-90f3ceea49a5@redhat.com>
Date: Wed, 28 Apr 2021 18:25:02 +0200
MIME-Version: 1.0
In-Reply-To: <20210426193520.4115528-5-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IUUxA/ih6zay

On 04/26/21 21:35, Philippe Mathieu-Daudé wrote:
> The TYPE_VMGENID device depends on fw_cfg:
> 
>   $ git grep \ fw_cfg hw/acpi/vmgenid.c
>   hw/acpi/vmgenid.c:128:    fw_cfg_add_file(s, VMGENID_GUID_FW_CFG_FILE, guid->data,
>   hw/acpi/vmgenid.c:131:    fw_cfg_add_file_callback(s, VMGENID_ADDR_FW_CFG_FILE, NULL, NULL, NULL,
> 
> Add the proper Kconfig dependency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/acpi/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 1932f66af8d..b9dc932d2a7 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -40,5 +40,6 @@ config ACPI_VMGENID
>      bool
>      default y
>      depends on PC
> +    select FW_CFG
>  
>  config ACPI_HW_REDUCED
> 

The intent is certainly correct and the implementation looks plausible.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

