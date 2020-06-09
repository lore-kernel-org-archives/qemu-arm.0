Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp378901lfc;
        Tue, 9 Jun 2020 04:07:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAIoiz/zKpQIDh+P6EC37X3NcOX1MYJR/jUD+kkR1m8+eoCv/afci0hGEnam7GjOI1kDcl
X-Received: by 2002:a25:a12a:: with SMTP id z39mr4831711ybh.481.1591700873200;
        Tue, 09 Jun 2020 04:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591700873; cv=none;
        d=google.com; s=arc-20160816;
        b=QFSEsWJjy9QjpG6WDmq3lcqJSbwj+aM2/IM3z9jx2WzBBptvcwWy+rp6z8iaf6clix
         GzjECjPeJoO/M65Rt8ejOmsfLrCqUTH3zYZ7G0LfBSUloox2MgQFy+/vQ0H0i0wIP0Rx
         R3nMKxf5v0LwkjGOPMAcw/Hw8aRLr1gKE1bv2ronpzI85xV6qbqGv+I2gXrCv3XTGbWK
         OR14WUIe39wpy0wU87uhu56ie0DzCGWnV+ELKqFaPjJ28ptWIa5mR6svnrJa8tGkAgFT
         HjWawzzXc3+W/36pfHLtkbRZbEPVAgB1rATpD2mbk3x2LXFz+K3vRtny4QEJUJus3v40
         BFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9N2hQA54vscW2wYRbiWR3tdH19bd/eus87N3YlhQewI=;
        b=QWq0lx2X9YhrE58jk4Z8oPlFJiLi/Nwx1yoHMapSWHgopCqUw8Ozy6JDhJeAsviLq1
         U6c8J24BwLsGk8/lzyeh9NSR15P4CiC6043KOz9JJVfNNiBUROxD5O0jNd4OfrYvfVuw
         rb4Sr9m7iKNl4PDXejjdFzYd8C5LJKNapOLLegj6mx33GfhbSacfWV3oX28wz6MIzOf6
         44wNo68GzWVsEfS/EqBWa2fU6KcaO5x6vAA7zDL/5ls3CISr0ORezD0ZVMIrP2OodrcX
         vUehEirlYKcVlS1FP45W5QEVcJZVWNQs3gADKSGvQrBRzY1/PjzecmbgUANKClaX3aXu
         7Hsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZTJOL9yP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si2221771ybp.320.2020.06.09.04.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 04:07:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZTJOL9yP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jic6i-000198-HE
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 07:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic6Z-00016T-H9
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:07:43 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37243
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic6Y-0001AA-R2
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9N2hQA54vscW2wYRbiWR3tdH19bd/eus87N3YlhQewI=;
 b=ZTJOL9yPanbyU6uzSdYW0J5PxT/Mxqi7lmlJR1GlDc9l8PcZg3auxay7j1r31JKU4VAKhf
 IXgs0fdVzL4zEqOJTNCU+aG7HZCGwaexsKeegmqU+yayhqhJJNrKxTmR3uSOlw8UbbIbDg
 876FTcN4arwWOuI3Qvh7bDQQ+JbkgmA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-KU6iBYnoMjeu3mQ9amjtXw-1; Tue, 09 Jun 2020 07:07:40 -0400
X-MC-Unique: KU6iBYnoMjeu3mQ9amjtXw-1
Received: by mail-wm1-f70.google.com with SMTP id j128so600796wmj.6
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 04:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9N2hQA54vscW2wYRbiWR3tdH19bd/eus87N3YlhQewI=;
 b=Sv0L5NCBvyy7ClCrd63gMv0IezayDecaaui+QiQW4M1j/ZYOej+acjCfUXzgHv6/m/
 Mtpzwv3oSEgyoJ20jbYm9nneyhTlEVbURysPiGjCGA5LAqmML2pbowdX6ALfwh5yuR58
 hUK32ZGTSdHqzR4SGzRrjtv5m8L6V0L/mrjT8EYGRAQGDSVMMxA+TmQJTjsoXw1F9ihu
 LGxvaNexExgvY2ikjMb6pJE+IHTlULp/L76TmU+++dfME7LtdlqyKLzDZedlZTDcPvcQ
 j0jm0Qpuca+y2y/qLddSjSqDak2zaMDu7m6ouI7imQrGHlRQEE69/J9HdQI1i7SsCUyW
 1dUg==
X-Gm-Message-State: AOAM530OuYcpe8uifM96nvhys5ST40KiCBlmA//fWx43o1Y9MvXjKFqK
 h4c8k+ZsDvUa3cqV48CMDfMVANQhM/zEKDqlGszorqFJwOuTCPCkOVMqWo7prWc1LFtxIQtKJAj
 FBr9t+J2jgpv2
X-Received: by 2002:a1c:bad7:: with SMTP id k206mr3381161wmf.11.1591700858755; 
 Tue, 09 Jun 2020 04:07:38 -0700 (PDT)
X-Received: by 2002:a1c:bad7:: with SMTP id k206mr3381101wmf.11.1591700858431; 
 Tue, 09 Jun 2020 04:07:38 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id s8sm3061694wrm.96.2020.06.09.04.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:07:37 -0700 (PDT)
Subject: Re: [RFC PATCH 17/35] hw/input/pckbd: Emit warning when old code is
 used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-18-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eaa0d68f-bad7-506e-d95f-5a3da2baa180@redhat.com>
Date: Tue, 9 Jun 2020 13:07:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-18-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 02:41:53
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
X-TUID: u3DHxF0Y7yai

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/input/pckbd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index 60a4130320..c7f42be63b 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -31,7 +31,7 @@
>  #include "hw/input/i8042.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> -
> +#include "hw/qdev-deprecated.h"
>  #include "trace.h"
>  
>  /*	Keyboard Controller Commands */
> @@ -467,6 +467,8 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
>  {
>      KBDState *s = g_malloc0(sizeof(KBDState));
>  
> +    qdev_warn_deprecated_function_used();
> +
>      s->irq_kbd = kbd_irq;
>      s->irq_mouse = mouse_irq;
>      s->mask = mask;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

The ISA variant is QOM-ified, but you placed the warning in the right place.

Paolo

