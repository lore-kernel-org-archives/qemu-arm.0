Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1420696lfb;
        Thu, 21 May 2020 03:14:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydJ87NAqrO9zgDr8MGwRUff6idoYPjuRUt0DsXkHciUyPvNrGUyFs3VSW9f6VayhRVQhnI
X-Received: by 2002:a05:6214:13ce:: with SMTP id cg14mr9121968qvb.103.1590056057649;
        Thu, 21 May 2020 03:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590056057; cv=none;
        d=google.com; s=arc-20160816;
        b=PKasVE+wjcNndHdTNu1a1XGJjt/me07vjyegJ4Bo3NGyRc+I84deKIy1P9SNOcwLp1
         4eVYTVqLw8nkKV4A1zvf2oOLZucNHHGW6fm4s/cKuVZ099RuUpKpzAVfaGLupINV5xiG
         sq/46wlx5b+2SB9VAHjpr6296oiiK/lFLOdD07lcooj+/cWE4ViWe6GSlmZOOix5Zibv
         c9lZ3O8R8I9UOUrKG73PjQYBzYKGajsiaJZIp643PE10YEt+A8+5kJEENJJKl6z+TxI5
         0QtLIMqPCVCUZ/HSNTKGvzmwtKfRMcUKCrvfzMXnnYhyFQNuBDBr69bmKuaSj+6Y2Jqb
         GUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=1QY+aiT5rT0UBmZ14JhETlIRue5uShjq6ECHNLxm3yM=;
        b=BcMBfKmFsiuBMPjZ894MG3G4U0jTPbf+78l36M9t0fcHP4zdCrF1IGuiIS1POQ+rnB
         r7HeNt83jYX3GT8I7yhtDm4bDry54oukJzhZsINjT4hBBFowlNFFFP7ayV1mntzX79jK
         G1bPndY1sYI7kIT33aD6hb6nmaV23ySXsYVSNptKY9h+hw7TaLCopTgJ1wFEyqLYoVOB
         VY8QlEzLGvn39eqx6ezjNlU42tRuraed7Zn6oA4NuhfIzGvhukVh3pCtbbC8z5FY69EX
         QnA/4j9p++Lo2E5h6b1zCiG4KLcQJZVyrVYZlL90mf+kePxsdwvBlc6FdVK9+GvrwiyP
         8K5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZWsAqJYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w27si508868qtb.311.2020.05.21.03.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 03:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZWsAqJYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbiDR-0005PV-3w
	for alex.bennee@linaro.org; Thu, 21 May 2020 06:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbiDK-0005Og-Nt
 for qemu-arm@nongnu.org; Thu, 21 May 2020 06:14:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54733
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbiDK-0000UO-3V
 for qemu-arm@nongnu.org; Thu, 21 May 2020 06:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590056049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QY+aiT5rT0UBmZ14JhETlIRue5uShjq6ECHNLxm3yM=;
 b=ZWsAqJYXXSM9FzftewwkuAina1oCZ0cxllzf8ripF/HwzTmW+7t43G/OLmmD9x6afyjHp3
 zqOBxrk/+ov1ne98VI+MhQSX6IU4clabGEM0c2J2KrsZI6SMFsYJEpthfsTjwoKJRqAgAb
 4e8C9sJaSWZoZH1+XpJ+8m3sCw+vYsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-fqwwW_M9PfaRN_z5QddDgQ-1; Thu, 21 May 2020 06:14:04 -0400
X-MC-Unique: fqwwW_M9PfaRN_z5QddDgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAEED460;
 Thu, 21 May 2020 10:14:02 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C60D5D9C9;
 Thu, 21 May 2020 10:13:51 +0000 (UTC)
Date: Thu, 21 May 2020 12:13:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 18/22] microvm/acpi: use GSI 16-23 for virtio
Message-ID: <20200521121347.00ec6a26@redhat.com>
In-Reply-To: <20200520132003.9492-19-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-19-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 06:06:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R+c9cHj8GqWQ

On Wed, 20 May 2020 15:19:59 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> With ACPI enabled and IO-APIC being properly declared in the ACPI tables
> we can use interrupt lines 16-23 for virtio and avoid shared interrupts.
> 
> With acpi disabled we continue to use lines 8-15.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/microvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index b38321112baa..7d8174809ae1 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -125,7 +125,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>  
>      kvmclock_create();
>  
> -    mms->virtio_irq_base = 8;
> +    mms->virtio_irq_base = x86_machine_is_acpi_enabled(x86ms) ? 16 : 8;
>      for (i = 0; i < VIRTIO_NUM_TRANSPORTS; i++) {
>          sysbus_create_simple("virtio-mmio",
>                               VIRTIO_MMIO_BASE + i * 512,

