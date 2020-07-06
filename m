Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp169883lfm;
        Mon, 6 Jul 2020 10:14:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxze/E2hx5Da6oxe6adM+CP6gWXKCG4qg08DYH06jkHbw4Y+CwlWL46+9Y2ex9hzrEaxjiS
X-Received: by 2002:a25:c4c4:: with SMTP id u187mr83095237ybf.374.1594055658116;
        Mon, 06 Jul 2020 10:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594055658; cv=none;
        d=google.com; s=arc-20160816;
        b=hbTjuVKrNQpgWDm9EcIMhbz3XNrwjaydlYZjE+8NtZCte8H09GDJU5PueqRe5M3SCC
         r9OG+vJboxDuBAJ33yioBRbPqk54EbUGUkz8aoxBP1fahJrkuFn0y59lPCYrdWND+InR
         /ZQsuvmPMYxYVRRMEOrB5Ej9lcXT9NQyW14COmGUVaNrx4FXoHkNQpM1R88mKbX6/V/+
         4KCkYseOOTmBs8/ZUIrqAIEIGVTgv2FOXm8Xy7uCOWHysVUUnBEcO8V3WyB0GvfRDRPm
         VFu10dBuZAffUpkhX82qw7gHf37g07iWnHMRIRqDqGSKwYe6rvJQVvpqpqX3o92PxRCl
         CILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=B6iU2F4D68kBs4rXCTy4j6Bd4sjgaDyabwwjvi+hW5Q=;
        b=OoS9imDkMkeJPmeSC0f/09d7QGlyzKywM5/aIRzoycE2+kY2mpTjKuXl41J6e5LdKo
         uSh1rLOWDGaSPbyfBs45sj8bPU20oDHmWMjaAj96z+OoZc27jYlBBjlxnYiM/R+SbyKv
         CpLFL9iI2rW9yYdD0AxYQuPCeYsUvHUhT75ewFTb9sKlQuhcmE3FXhjncz9Wv+LMY9/7
         BHVZpOV58lX6e3qK4STgeyVTmkbSwJGkp/mblV6xHNkXVBcHlBOPt3Hv/nQXBY98EuPQ
         Vq0KizdDyIbY7K9cvBvLhUWCK8iiDnDNiSw5Cierw+7U8ic/9eSNqNkUdAbruuaBk7/1
         nFmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AbJ0ON1q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e131si21202151ybb.379.2020.07.06.10.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:14:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AbJ0ON1q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUh7-0003CL-FI
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUZX-0003BM-Ed; Mon, 06 Jul 2020 13:06:27 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:35227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUZR-0007H8-Uj; Mon, 06 Jul 2020 13:06:27 -0400
Received: by mail-il1-x143.google.com with SMTP id t18so13609047ilh.2;
 Mon, 06 Jul 2020 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B6iU2F4D68kBs4rXCTy4j6Bd4sjgaDyabwwjvi+hW5Q=;
 b=AbJ0ON1qWA3F4Bki8vxBgNFCAj9bKw6GWMHnwjy0BHevGWNnPoRZOMJ0S+D6de1dhl
 0hNekgR0AHtFq5mG7yzL9shawGAV2AmKUgYcpgmrhjZljtKHOBACxfNrtufx07HwKaMW
 qPASD8vFzMlW++21+2uuY8a4B3cYDOiH2vcQJdGo42bfb58doT5aEhXx2+lGYg2TladZ
 Ss8z+SOazk9trK61OW/m2u2TWhD4ewrvaWAJWYnZPzMWA25uCSGGgRXWR8mns1NG9zn/
 Ja/0keDaRQdPfssAe8FscZ3h1S+YYXW9ePYnlkmdrTyY7zU1cCrI9V7RI3HBRPxlyq11
 C4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B6iU2F4D68kBs4rXCTy4j6Bd4sjgaDyabwwjvi+hW5Q=;
 b=awroqvqC+8c+SUV3KI3qgH/baWahgLHt5OEb5HzMxX8ZAbdweZzsCbtfGgxsxNusRW
 l0ibkXe4s+mc4WifPdXBKRX4dXw8lzEOD5HKSkGePV6NYqI/jt1sHJlbi5DTKLiILIHS
 jc+r8KRmkDAMEbL3WZlLhrRdZRT+eNTppoliuxDdG1sUMCK37MT4O1iiXctBo/9kDLTG
 8+vgiyUahRb2dpleG50CoR8CuwI6w8enSWok98gfLmAAuuWS3Xya8w+ajMAfYcpIV0ql
 BAZtqWrAOhzMhipv7Tt3ocZEyL1+UXDBCqTM/MLcUIPGtZZdYOuuLO5sVGv39N7BgyGp
 W2NQ==
X-Gm-Message-State: AOAM5310al3ivSS7vve7Xyra669jMLqAYccMEgbg3Bek58Zsq4NRZTAH
 mtkn/vvwmvBBjgEbe7FPM7QcuoxWmMs3lJstCmU=
X-Received: by 2002:a92:5f12:: with SMTP id t18mr31713705ilb.267.1594055180052; 
 Mon, 06 Jul 2020 10:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-10-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-10-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:56:33 -0700
Message-ID: <CAKmqyKMivQ6HxaB9DmJ1EgWcpC0sD1VBOC=V_09if_kkcvEwcA@mail.gmail.com>
Subject: Re: [PATCH 09/26] hw/usb/hcd-ehci: Remove unnecessary include
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZDS6sN5zwBo6

On Sat, Jul 4, 2020 at 7:55 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> As "qemu/main-loop.h" is not used, remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/hcd-ehci.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 1495e8f7fa..256fb91e0c 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -34,7 +34,6 @@
>  #include "migration/vmstate.h"
>  #include "trace.h"
>  #include "qemu/error-report.h"
> -#include "qemu/main-loop.h"
>  #include "sysemu/runstate.h"
>
>  #define FRAME_TIMER_FREQ 1000
> --
> 2.21.3
>
>
