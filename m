Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp381346lfc;
        Tue, 9 Jun 2020 04:11:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzieh/hHpMDVNPKK5iDZFkrsaDMGoyVTr3y5Bf6R1jEokgwA6JMwTn4BvCEnfODX6swrPlQ
X-Received: by 2002:a25:e658:: with SMTP id d85mr5510475ybh.328.1591701068427;
        Tue, 09 Jun 2020 04:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591701068; cv=none;
        d=google.com; s=arc-20160816;
        b=x5EGnSfH0OxEG8wJNssarSX7zZaGez1pAZNN8WLRZR08C716261wBaFUvJwuLYwHXP
         CKDU6pEgyT3So00LF5ej4Nd3X38EJqnzBN+XcleHc+V1h598uKRo3TsMUxq2MdK36WVT
         /e988GWLl0xsBU88lNpC8aFTvkoPFzVCaxY19EPmizCfY8woKHaw1CvOuYEEHjF4pH/6
         gw1XfgpDwh53ifSfCQxnKITStVBEOR11MbpuLC44qJme6hBjm/0h48XjLJbjdmohc3zT
         /e9Te3up/MDBFVdrNrmdOkYJ3n9HT/kGHqrVC3S6Rq/y0UYzutGVVzknCaUMnf5PCS3Y
         4apQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TysuOc5GXylf1UUaen/G81fkeOnuEfcp2+jvnmZ+bCw=;
        b=c5FoYI2rhRio0XvtEyHvXZtkvIITS0E5+ea/uOEbatgAaOUf2U2rZ0TdoNzHiOjAKU
         PpSqgXmMDfHTdBMGxJ1FIu91t4C1LWmofOOA963vDoZ4MolZ0+BoVhDpg/Il1v2paD4f
         79XpVgQn69A6vqjKs5JZ2zd9cBcMQ99hwS8zurZ5xAuGxaIn5lzqlswDzLr1yC9p1Ure
         WKOKb9ubUMZqXSPkON0+WpQcYNK7HUhR0VJaQTsRWGp7opy0vvOKg5M4WSgX545IuCuS
         tI/dB8JRAfwYk4R+OlJxLX3vp63p1rmgWXgOxtHs6JcDxDc3OD+i7waUXeI+gEukIEDV
         vHVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=At29VDCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h133si2084501ybh.292.2020.06.09.04.11.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 04:11:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=At29VDCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jic9r-0005IR-Q2
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 07:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic9Y-0005Ae-7w
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:10:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56590
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic9W-0001nZ-1r
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TysuOc5GXylf1UUaen/G81fkeOnuEfcp2+jvnmZ+bCw=;
 b=At29VDCeuemu2RzApLylP3dUHKoGdpW5Ql2/qlZlEF7jsunGiVUJfVnbO0dE1LMia7Ckbd
 S3LFEcv6wRvwej/CI+ANFrXt2LI1bzYR/W9JTNPj19fKwGGzKks3UCNJfl7i8yYjJFzZXu
 Q/yyAlfo1y6Vdd7h7PEM8uX9TjB8Kjc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-oDHELylSOm2WE_FRu0DPeA-1; Tue, 09 Jun 2020 07:10:43 -0400
X-MC-Unique: oDHELylSOm2WE_FRu0DPeA-1
Received: by mail-wm1-f70.google.com with SMTP id v24so607387wmh.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 04:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TysuOc5GXylf1UUaen/G81fkeOnuEfcp2+jvnmZ+bCw=;
 b=FeSMo7FbxIFE9fZFkKW/y80AWUsOjRPoFpzLwQtQEeHEJRm9D/E+/vca32VHhGV9Ib
 hGljFRb0AsvlRAEfpfSotYkBSodrkigApvbyV/4OpzPRR6o3VdEqeUj17QNJNMCA63Eo
 CBAwapTd3yZVUc98HdDUe1fq+pdtDeyaUCJ7iyNOId7/No6x6LUBrGuE3iet9J9kSIht
 LtRO1BtW8PQyzLis17bJNAxbirfsTgI8X/BcMV08cqJak64AjLoz3LyGmY+IauhUBmz1
 hI+8uv9DMww6P9tyJO9szU/qKTjaIlybbdGM9RZwPvrmUb/3p6Kf/h/tzX/FcYN75NOT
 fVSw==
X-Gm-Message-State: AOAM531ViPUzc3xxtOLJWMYfhX6c1GqRj4qrIAaZx0VqEo9YW/Fj7X46
 pEmcAYjvwTAeat7n7M6yBrThwzBagr6KizYNq/Kd7EKmyqiR2kkzZ4lPBiGLXb6IQ09kQq80Nsv
 bnonW4GomNU/i
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr3627203wmi.126.1591701042666; 
 Tue, 09 Jun 2020 04:10:42 -0700 (PDT)
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr3627155wmi.126.1591701042347; 
 Tue, 09 Jun 2020 04:10:42 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id q1sm2521908wmc.15.2020.06.09.04.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:10:41 -0700 (PDT)
Subject: Re: [RFC PATCH 20/35] hw/intc/i8259: Emit warning when old code is
 used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-21-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <71b5e461-88f6-eab2-f46a-e8aa4783debd@redhat.com>
Date: Tue, 9 Jun 2020 13:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-21-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:44:16
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
X-TUID: Ch73EfUZ2hfB

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/intc/i8259.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 51b27f6a34..9d9609cdab 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -30,6 +30,7 @@
>  #include "qemu/log.h"
>  #include "hw/isa/i8259_internal.h"
>  #include "trace.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /* debug PIC */
>  //#define DEBUG_PIC
> @@ -414,6 +415,8 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
>      ISADevice *isadev;
>      int i;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      irq_set = g_new0(qemu_irq, ISA_NUM_IRQS);
>  
>      isadev = i8259_init_chip(TYPE_I8259, bus, true);
> 

This one is okay too.

Paolo

