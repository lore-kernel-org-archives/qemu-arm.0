Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp381022lfc;
        Tue, 9 Jun 2020 04:10:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCKOx2Wj37RDMrtbHtw0VRlBlec+7biVHrzH6lVnY1EGmhGGeTZ8L3wLN/cn12GhsUKSS9
X-Received: by 2002:a05:6902:68b:: with SMTP id i11mr5400786ybt.396.1591701041347;
        Tue, 09 Jun 2020 04:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591701041; cv=none;
        d=google.com; s=arc-20160816;
        b=ec0NhC93/PRB3M/KdX1E8cWIgjV4IiDu46jJMbpbD/gViTA6o+3V3mENMnPXMNMPyF
         GtDyGc3/UvmRnk67FIbP0Hfd9+ILTE4KvUh/L0zfiaflEqeCe7AEreIN1QRKg07kuEul
         CCfOzAVjZh55ehbyZkRFt5ufr/xZmuRij590H6PJrvZZKfUOkWZbHOqr0SE6c0lpga4M
         JHPTfG6eiynGP/MOmz/AItxGygz79wKujli0hMJu9K5c7SOhGk56q4/p6RZ5EUhE7wCP
         SflhtZAvcERNCsYjphO4Ae9Q7gQkjypiZ4kju3HJ7cB7snsAd3nqxeDf3LABy2LOZMR0
         CTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tZftxcB2LQwq4WRu0Cjx9f/yr0m/a27AoJYbbnSzCMU=;
        b=o+fTncpTjk2UnfVW10RwQWo6qwDQcUn+AoUwDuPiOHlXmph8ZoeOoU3XRZMWjqfEzZ
         E5ppKSNbKppZs/nIlbFDOrIsvd3wo1hyoNOH+p881gl9lcPPuGH+u72NR4GyOzPIIIVy
         NvRSr2tv3Ji+dNUTLXTwYvwO0XRMrstX/zkBLxB7lqAP6sRerDeEcicyJf2x5hoPGAcX
         ShaEI9gD+cuYti+QXbymOIthms+NrnvHlKaN0SUC3eEsnjt4QJbeXx6X7dJKTYCtQ0hY
         1mP7CvYzYLwLxLDMxrqQlQvK/WwVHXzFTfcptO4RLRMUfaHSzqI4mSHRUUmabXSlqjwE
         lzbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Bv8CPFN/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v131si2076521ybv.418.2020.06.09.04.10.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 04:10:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Bv8CPFN/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jic9Q-0004rd-Nd
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 07:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic94-0004We-Ry
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:10:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44143
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic94-0001di-04
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591701017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZftxcB2LQwq4WRu0Cjx9f/yr0m/a27AoJYbbnSzCMU=;
 b=Bv8CPFN/YQWM1AVbvo+3sXxeheTkFPoD3QDp9aDlOPyUse1Rtp/X4Jh5hCiEmUjUGGmkxp
 HTpYG59aK2zQsZlNdzmjiBwiBb+27TOBn1LIfOvT5rsfqRDoj9oY3goU3GMWcxpdpFoNMr
 2csbkaTbub5XgSjlA6cmIEzSgoF800w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-dFFhRGC_NpC2vo1jDye0oA-1; Tue, 09 Jun 2020 07:10:14 -0400
X-MC-Unique: dFFhRGC_NpC2vo1jDye0oA-1
Received: by mail-wm1-f72.google.com with SMTP id l2so529894wmi.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 04:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tZftxcB2LQwq4WRu0Cjx9f/yr0m/a27AoJYbbnSzCMU=;
 b=rJG6voaJv1Z3Ycec8be+HGh0k2ljCfQbflPj8DgXtEAASDvWOLLgp/lsi2ZhTK3Z+z
 jD5dI6o1mDxn4zGtyC1Lqidu7v+5xwd62gH11WIItuvVTwE6gdi4cX5CWsytpJTDSCi+
 fcp75Bl2actU3kr2na+xqlZ2zCc4DeUnNAXZRG2oTEq7oO2EcAtZHueC8zstP79F4Bmt
 AemvkThYMYU6fZXzBlsrQ6qBfR9FDDPbUfQFkETF5AwflQ2W22HRPn3tAKlV5h9qzTzQ
 HmsFp+5ex6A3cYXeFBu6iRYPe1+9SeR5IVFS8Q9R9vmKTNtG60khBNk8Y1w8aY24UI6/
 aBog==
X-Gm-Message-State: AOAM53340hkFkxeA3fSiRfyBSPwqt3T5mO06ftq4C8f36T4l+ZeEm2oY
 VPPnMDLNwF5hmLamfdJTzfE5cobhUg8Ude+Ghb2NVOK5VpulGFjnGyXsBOc+IU1rugb/qk6baje
 ENfjgqwBV3TV9
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr3355947wmh.38.1591701013441; 
 Tue, 09 Jun 2020 04:10:13 -0700 (PDT)
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr3355899wmh.38.1591701013164; 
 Tue, 09 Jun 2020 04:10:13 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id b8sm2981236wrm.35.2020.06.09.04.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:10:12 -0700 (PDT)
Subject: Re: [RFC PATCH 06/35] hw/timer/arm_timer: Emit warning when old code
 is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-7-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <57ccbbbb-2462-7ae3-52f4-c209a21795cd@redhat.com>
Date: Tue, 9 Jun 2020 13:10:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-7-philmd@redhat.com>
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
X-TUID: nf54DA22ZH9x

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/timer/arm_timer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> index 9607366d78..e23e6b4b31 100644
> --- a/hw/timer/arm_timer.c
> +++ b/hw/timer/arm_timer.c
> @@ -16,6 +16,7 @@
>  #include "hw/qdev-properties.h"
>  #include "qemu/module.h"
>  #include "qemu/log.h"
> +#include "hw/qdev-deprecated.h"
>  
>  /* Common timer implementation.  */
>  
> @@ -175,6 +176,8 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
>  {
>      arm_timer_state *s;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      s = (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
>      s->freq = freq;
>      s->control = TIMER_CTRL_IE;
> 

This one is okay, the devices that use arm_timer_init are all QOM.

Paolo

