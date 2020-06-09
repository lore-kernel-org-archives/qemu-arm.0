Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp386159lfc;
        Tue, 9 Jun 2020 04:17:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP+P01GvTUEOY9vgU7mxAEW8KhCxcStZ6dG5HX33FHuMnxJd2zrVwoY+/5iQeUY7rmH/VU
X-Received: by 2002:a25:b5c2:: with SMTP id d2mr5800859ybg.9.1591701458841;
        Tue, 09 Jun 2020 04:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591701458; cv=none;
        d=google.com; s=arc-20160816;
        b=ONpsXfQLGVH24+yrI/GmgFfy7j/p/AKrEi65TBWS/grQtYieLdcZ25ICW7qsnUeOsm
         QsB7t63Jk604ykfPzMlPjJ4xjF2SfylJUcsFPkYpxKMiVyf9iEjdgrO2S9yTfXPBmg+X
         Uk13tU3zJom/LcoyWwxiO8v8PCrBAlLkWxXf05XLkAsMBF96j/b/uZC044sl4ERaH0+f
         Qr8GSBlq1hU6Yx28pUU1FVOoFS6fkXonn2w4gi6EPhw/L0GsX12K0M8prdBOvPVrIBZ1
         Ny/SyN5jQXps1RHGh24IsFURONqfQv7SOdilopj+JhMv2nkqj/0XRA43JR9L0L54YKah
         zkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=l4X2TCEtUozOLaXo/L8sScbontTQvUPvWMYmEeL8dy0=;
        b=YsmUtR2INP5jyBWCg4cyMD4pxRZHmhyr920589E5M7xMlqPZAQ2ghPjyeNB6Pv1zU4
         ZbNQOUY3NE/IVdJ4ULEzl603jiWoffv32oWRwawbluTE6RbI/siytSD2ObmOpA/s3POt
         8P2dxBS0IhVdiJ1djESDls4MoQm3GWBL9BjQ7IUO6uWeEn0lu1xfAAMfxTPKY3pmbmfd
         xHuAK++VEuDUFa7q1iLmcd9Wec+2KcX5GlsDq+gMoeUt/k25UN6hfh8C9IKa6PLW6EKT
         Rhqt7HB4ylgLllGOg73ey4NpvRGLe3Mcwqwfb2JPAbCI4uV8F+ATJ6R7L0iqFAwfjhv2
         fZZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ae0TnIQG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si2288240ybo.273.2020.06.09.04.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 04:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ae0TnIQG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jicGA-00069z-3H
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 07:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicB6-0007U9-Cf
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:12:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31986
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jicB4-00029V-9B
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4X2TCEtUozOLaXo/L8sScbontTQvUPvWMYmEeL8dy0=;
 b=ae0TnIQG62Gq7LjIYeArcLFlWzm75OBJp88b7BHEWevKk7EGRO1LbTnWnl+SH8hPSJVX8H
 YkEeMhYn9NEdSJHZdXFatlIRERQOwPUqApONZXJLR+2oiA/f4Vs5iHPxYCwOsvJ2Jf1jMs
 n3JloEgmlmeCiwf6MER7AXTQUjehbOs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179--OzjZvalNpi-ciE67h41_Q-1; Tue, 09 Jun 2020 07:12:19 -0400
X-MC-Unique: -OzjZvalNpi-ciE67h41_Q-1
Received: by mail-wm1-f70.google.com with SMTP id p24so609668wmc.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 04:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l4X2TCEtUozOLaXo/L8sScbontTQvUPvWMYmEeL8dy0=;
 b=Ypyy2EsGTo8oo4BrUOzgJoksRc5DqCr/ibFAkXzDSUxlUZsMQzNI0hkUnys8ax9rNJ
 JAOJqJtkhjQ4C/63A4XI0pQ1qezq+6PD/5V7EtX0P0Vh14eNEmEgsh90Cg75Fe3u6IY2
 FzYTLTt1Hr1aPIJqS16uHEa9GlevndIpP44WUWUFQrScqZOEt37rdEIjIcO8gXW4Y52j
 I0oHu7FlHgYDc/0wNVY6MxhcrN6muw6TNdZ8M7KAHNcZxNMtuHDHTLEnt5JxlWY2dGrf
 Bzn7inWXwRF9Vqu8rsjggxQyu+KyBA469IK1xU75JxwQhEXm7UoG61pH/Au8Ns9nBLm7
 3MSg==
X-Gm-Message-State: AOAM5300OJm53RN9PCVg9EdsPjIisDFZCboR8fzHHxYWaPlQ3bo5Rq80
 IK7720JcJrRssLyOJhu35lFiBkQHlbvBHqrmYnBaPRxXqqm/yNDogH3tyaDZj3eAp/plXdt30hL
 Q0ss1Gf8n3crv
X-Received: by 2002:a05:600c:4102:: with SMTP id
 j2mr3433709wmi.48.1591701138458; 
 Tue, 09 Jun 2020 04:12:18 -0700 (PDT)
X-Received: by 2002:a05:600c:4102:: with SMTP id
 j2mr3433671wmi.48.1591701138230; 
 Tue, 09 Jun 2020 04:12:18 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id o18sm2614689wme.19.2020.06.09.04.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:12:17 -0700 (PDT)
Subject: Re: [RFC PATCH 30/35] hw/ppc/virtex_ml507: Emit warning when old code
 is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-31-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <85d75dcd-f08c-0506-46ee-97e2b5869e0b@redhat.com>
Date: Tue, 9 Jun 2020 13:12:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-31-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WJwoMnf2uYSG

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/ppc/virtex_ml507.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 0dacfcd236..17b8036c38 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -40,7 +40,7 @@
>  #include "qemu/log.h"
>  #include "qemu/option.h"
>  #include "exec/address-spaces.h"
> -
> +#include "hw/qdev-deprecated.h"
>  #include "hw/ppc/ppc.h"
>  #include "hw/ppc/ppc4xx.h"
>  #include "hw/qdev-properties.h"
> @@ -95,6 +95,8 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
>      CPUPPCState *env;
>      qemu_irq *irqs;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      cpu = POWERPC_CPU(cpu_create(cpu_type));
>      env = &cpu->env;
>  
> 

This one is okay.

Paolo

