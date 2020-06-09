Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp375298lfc;
        Tue, 9 Jun 2020 04:03:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8eO3myik/RqdGicOpmDNvLMfYoxTzqUZEmcd3z5e/szsqeYdzWFPbstNgZGCyoQAGFl+E
X-Received: by 2002:a25:504d:: with SMTP id e74mr5036884ybb.47.1591700610721;
        Tue, 09 Jun 2020 04:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591700610; cv=none;
        d=google.com; s=arc-20160816;
        b=dNA7l5PVeTosHFyuoeCALLPr9hboPXlmSoukqs4z3BjL975hceFAHFfB1dlSJ9yLp4
         7I4TVZe+qp4qo4azoEkk12QQdklVgOho0kVakJHVZSFRiZr3JAYnLOCNr09ryE/i9W6a
         J8Px7BpKGawQ/3iWkM317yjhqVMyhqDwUgOpejbWJ3jLicKSRxFW6SZy3UpPwBR6nBth
         VlMZcSN/hBlh5VrIin7A/HwVIp6IjqHKR4XpQrNLpapMU2Dl4uTsDs0Ow8XPJBhnigzd
         Y8lEEY8svS0fgI3oTrkCrZxr2Dvy8alukq8y9Y0TwqJYmC5hYBz8r7jpwYUfmxx8KSBY
         fq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AGuN3wM4I0BralfErs2ulp7k2NU1Mw2uS1iHN1MhyPM=;
        b=imYDxPuCLtbg4e618gz5Fab6XSmy0iMDckoqDjgP6wUQQLdVD6RLUmOJWE45D86jUO
         hV4sxJf6VIqUK9n9Sqwx2yYdNGkQ/MwQSJS4szjBmE2vqmYemG3QO1xcSYTOEuzSGVCT
         JI32YGuYU0TxvEpKAO/yTdu/MOm/aQwCbjJtGIBtJO1odO+ZZ0DIjbeXOoePFLz9j9YP
         umIVBBlo82a0b4qqi+bBB0Y2Rs6Z+fjksdsknxOCAt40pZOkj3qsrumf0Thdr9Ffa+sW
         4pziNzyhji9pdy6xDOyWEFJCSc0JkAaMw7ojwNRjFr31L7BVaCdN9uwgpNIzJhQOl14M
         9KTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hjw0DGqk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o196si2147854ybg.262.2020.06.09.04.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 04:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hjw0DGqk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jic2U-00053A-41
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 07:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic2N-00052f-0H
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:03:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29166
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic2L-0000Sm-NX
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGuN3wM4I0BralfErs2ulp7k2NU1Mw2uS1iHN1MhyPM=;
 b=Hjw0DGqkKb/riXWMqn+f9iplwRDu8qEiXr7tpDYWrz02YwUD/zijRZCAqP1N92rrJUB+kl
 jn8Wtq6GG7URPz7yUT6gXDc8W5qSrIgBM2cSnJ0GY1dkng60ODEfUZ004HlPKCnOQFhyDy
 ZNG8Ih1pRxY1PZVTRR/xYk7/HNB6jyU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-2CQGHDKlOtmHqyK5kMSZQg-1; Tue, 09 Jun 2020 07:03:18 -0400
X-MC-Unique: 2CQGHDKlOtmHqyK5kMSZQg-1
Received: by mail-wm1-f69.google.com with SMTP id a18so522006wmm.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 04:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGuN3wM4I0BralfErs2ulp7k2NU1Mw2uS1iHN1MhyPM=;
 b=TNjsx7Zb162N2+HjMVTPs0tRdQuVnMiKkQpNVGpMaQUwtSIGMnfo23RO6fmbxBSeRA
 QPMBWS681qCILhQ4za5em3dfSphh8gNG66mn+k2b3wU4QBBAYklYVBq5n0AQTh46omVb
 2PLUqSnOuFU5XcYqrE1b+Gl/qGjo70UXF91IMF39jz8QbmdbZQrcUAU2xL9xzMV7f1Oy
 wYJ+644Ro7To51dY2EQxMsisU2SOWw+PXSVnB73WMLLUeYx4H1XhTFyyE92ijQbYLKy2
 GPf13871iehnGDGXiyKs1hZQhEsNB/aEKqSGe8FKDXVhH3GbamymAdvOlmYe85AQvzhS
 eNGA==
X-Gm-Message-State: AOAM5300pn0pM3MgR/yKMTg9axjxQgOiP5hRkExvusk0JRn6jD5L2fT6
 SLdnHdb14bIixuVhpsrJVhL405hkoxE4KSGjZ9HIx8CGOPI5i2536ijgRTKCFeOddTCmsvHwyPZ
 6I05F2+HsZcir
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr3615802wrs.190.1591700597528; 
 Tue, 09 Jun 2020 04:03:17 -0700 (PDT)
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr3615759wrs.190.1591700597265; 
 Tue, 09 Jun 2020 04:03:17 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id u3sm2969549wrw.89.2020.06.09.04.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:03:16 -0700 (PDT)
Subject: Re: [RFC PATCH 33/35] hw/timer/slavio_timer: Emit warning when old
 code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-34-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0bc0385a-9738-a9ea-d3c9-115955d5e8e6@redhat.com>
Date: Tue, 9 Jun 2020 13:03:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-34-philmd@redhat.com>
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
X-TUID: 1efhJU90rKHp

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/timer/slavio_timer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
> index 4c5d65e391..16f21669bf 100644
> --- a/hw/timer/slavio_timer.c
> +++ b/hw/timer/slavio_timer.c
> @@ -31,6 +31,7 @@
>  #include "migration/vmstate.h"
>  #include "trace.h"
>  #include "qemu/module.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /*
>   * Registers of hardware timer in sun4m.
> @@ -392,6 +393,8 @@ static void slavio_timer_init(Object *obj)
>      unsigned int i;
>      TimerContext *tc;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      for (i = 0; i <= MAX_CPUS; i++) {
>          uint64_t size;
>          char timer_name[20];
> 

This one is okay.

Paolo

