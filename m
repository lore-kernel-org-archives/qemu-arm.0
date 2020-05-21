Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1422274lfb;
        Thu, 21 May 2020 03:16:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY257LoYOMuFlKWEzaoY95Rqb4jw9XbV0bHUk4h6cZDNHwgt0OsotHK8nYKNEbhDmXMwtZ
X-Received: by 2002:ac8:4e06:: with SMTP id c6mr9903679qtw.360.1590056177271;
        Thu, 21 May 2020 03:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590056177; cv=none;
        d=google.com; s=arc-20160816;
        b=nrNmFE3B+VDCAFyqH4qcF2utdvDTLOGnm8lslMfmkB9yoCgTJ7DIm1DGvXg6/RgHVt
         ucvBT2FcAbQVeIb8UE6G0jKyJDj1yujZGtLMoxR/5r7vU38XI2Px4uPi4Ldbphc8GMvB
         IRxSTKnnkK6nrinH7qoVuVby4tZGO68wLyZH5ElhS9pH7/wzRSbZQcoelJRcb7W3Kk+n
         uUDJUgSyHiMXeXaG/AUCVuWptMsZRN6xB/a8mjgfaFkmaZxaWKBT6cj5EJoNTfxgqI5U
         y2uxRKJPB0Qh0ROu4rS18fS/J+Bszgo5bS0vuBzvct8ReRWftgV81fNA5xP7+xL+K8Hb
         sOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=CbanrbsgnzNrBG0ZOoBhiLSlOSNfBucffzZ2jPnkCeM=;
        b=uzQSroIH4EypPSR3wlxDeJ50nFC2AKKN8ECFMKymrnzNPAEMicNmzdt6HKb2JzZ87O
         uqYLcojLiyox0CnUF+0/bnAmf3UroWf2cprW6/63UGh/OdLGGkXE+DwBDWPxnRWUVFHa
         eOVuaqZKJ/9V/sZNRbaMTZlgZGeDGTRFTun/bAty9pi/fcU6pF9VqozSpygMTP/bl546
         LuMLL7knMX1mXsyWHekoFXmeFLcI+Stz6CqpplWjviOkJbPUy7O+kgkt/hl8y93CyJo7
         uM0Jg0RrQ5lUgGI2u52k7yVOnZ5z8g7xdj3MjvM0FwImh2IYzWXitJG8gKc9hLbgMaPH
         4RIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c95WET0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si3223212qki.56.2020.05.21.03.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 03:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c95WET0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbiFM-0000qP-MU
	for alex.bennee@linaro.org; Thu, 21 May 2020 06:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbiEN-0007Wa-Gn
 for qemu-arm@nongnu.org; Thu, 21 May 2020 06:15:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41910
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbiEM-0000gT-Kk
 for qemu-arm@nongnu.org; Thu, 21 May 2020 06:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590056113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CbanrbsgnzNrBG0ZOoBhiLSlOSNfBucffzZ2jPnkCeM=;
 b=c95WET0SR/FkO1iewaPgacKzyGQs/2sTPCjc/SWP856JbomNcFX9EQg2zf2Wxg8li16Shs
 VFrGwBFftM4cttn/SUHKZQ6irxAoEHOCU1B4t+i68V6j+gVWftt6qSo9DS5p4XcI1NkMzN
 hXonKl/W3noCzgSBYywsnZ1t7Pz+PLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-KRtaBEUUMSmz6RUFP6tE_Q-1; Thu, 21 May 2020 06:15:11 -0400
X-MC-Unique: KRtaBEUUMSmz6RUFP6tE_Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 880788005AA;
 Thu, 21 May 2020 10:15:10 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AA5E62932;
 Thu, 21 May 2020 10:14:58 +0000 (UTC)
Date: Thu, 21 May 2020 12:14:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 19/22] microvm/acpi: use seabios with acpi=on
Message-ID: <20200521121457.39192559@redhat.com>
In-Reply-To: <20200520132003.9492-20-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-20-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 04:44:45
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
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bTN+xMs6tt8i

On Wed, 20 May 2020 15:20:00 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> With acpi=off continue to use qboot.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/microvm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 7d8174809ae1..ddb8570a2915 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -52,6 +52,7 @@
>  #include "hw/xen/start_info.h"
>  
>  #define MICROVM_QBOOT_FILENAME "qboot.bin"
> +#define MICROVM_BIOS_FILENAME  "bios-microvm.bin"
>  
>  static void microvm_set_rtc(MicrovmMachineState *mms, ISADevice *s)
>  {
> @@ -174,7 +175,9 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>      }
>  
>      if (bios_name == NULL) {
> -        bios_name = MICROVM_QBOOT_FILENAME;
> +        bios_name = x86_machine_is_acpi_enabled(x86ms)
> +            ? MICROVM_BIOS_FILENAME
> +            : MICROVM_QBOOT_FILENAME;
>      }
>      x86_bios_rom_init(get_system_memory(), true);
>  }

