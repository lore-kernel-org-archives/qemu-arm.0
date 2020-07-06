Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp183177lfm;
        Mon, 6 Jul 2020 10:32:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZk1vPYnZ7wV+mIKzXBS0nF2MdRxjyX9rUNYDydiJSoBXrxytxiiJW1ByyteYFXLAHnZWe
X-Received: by 2002:a25:a122:: with SMTP id z31mr21019587ybh.311.1594056745546;
        Mon, 06 Jul 2020 10:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594056745; cv=none;
        d=google.com; s=arc-20160816;
        b=o3exPbrJKOwFvjxXUijBZRaBYcxQWZn34Sqk/SvXf/eiIFEZ2+SLf30vf5AxSv0R9L
         sLRZntE0vcStg/OJr1GEvlW5fqcgEIPjShMZw0Hgq3QCz1Ptc53nLyfBny2g/MGsSwW0
         CuO4a/HvPwaDgaYH8dq6roocWNfxH7ahPFoNS1ZuRFlCMg1TEQaQ2LB2dzVo4FDLst3j
         UUzqeUP/gB8D2maRs9lZXNQmZC620JYd0gA1xEVMlxoW4N1Qod5xyqV0HMaLZ8yrrd+F
         CLnyMEXgf/BgcF4s1jSBW80mJOXosnD3pIxVfPP4arcE1s2A3GWYEDHm81/tbdGMwHAC
         UApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=P0d8Iq06s1RxhBs4I7BZ5yRhluIYSvpMY7wkvFtI2Xg=;
        b=DoOH+Ot4UbWCo2fQExfNJK5Dt6MWxqmieSEQYzAwk8PJc9AQAh81mKf1teR4xxolFF
         UG6jBXxLdiZpQ5apLvLDSimiZrGPPzeB+W/ao5eDoD/6+EfL+fkY3X9hT8wRj3chPRjA
         8JvoCnU3UZ9i2pFe74ODpL4dhf7icQuXgwf6Na+c0a7bg2DyQo1J6O/EPnKynvCv5ypQ
         7VRcuSgsh8zp7metLxXLHB2ot3Qkp/3hpkdFxefs5ccFsbN/X07VzcZ/OhdvCGhefy/y
         7tBLw4bpkJ+TWeWVtMiNiTl+Im2ikozev51Hwgms9OFcZM1T4zBXK9E/XaCq/Fnyjs33
         +/gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y+NfzrMh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si19471036ybp.361.2020.07.06.10.32.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:32:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y+NfzrMh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUye-0001Rc-Tf
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUf5-0006ah-Es; Mon, 06 Jul 2020 13:12:11 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:42803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUf3-0008Fp-Cd; Mon, 06 Jul 2020 13:12:11 -0400
Received: by mail-io1-xd42.google.com with SMTP id c16so40148349ioi.9;
 Mon, 06 Jul 2020 10:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P0d8Iq06s1RxhBs4I7BZ5yRhluIYSvpMY7wkvFtI2Xg=;
 b=Y+NfzrMhVjazx3jBHloldv5qQ1eAAl6uiOiG7IwSb4NMG6+903IYIYU0tSMwa8mrC3
 cTQQBM94OvCgQ7efQJmM6schD+rLNB+ozc5/uJgypYi55rBKWT+NxRBPTgvuL6eWEhhE
 7rUuX7OsT4URw2jWCniwP0L1yU131oOJcE/YnIXdhlnn6n4G1LcX+iI6fNOgQFNSh157
 m2EprNayyIy7Rbewu0VeNMbCXbX+6iCdEKOcr8WRTrTBw4Gh4m+fC7fmitA3XMXG66WL
 XqFVF5UEWj2WlfQevGi6yVpV9hZNiy39mq2dQqoo5OhqyH5Quk+sfoOIKSNr3g+956up
 gJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P0d8Iq06s1RxhBs4I7BZ5yRhluIYSvpMY7wkvFtI2Xg=;
 b=o9kr4IPVkgZwGwhTRvh1Dg+4z3YgYEMtmUBL0sWZadUqvnpHLwWc1LjXgWwF31X5G/
 GJ3eG5rsMWkWrvxKfbXByasaNm2oKFbUoiEZ7q9YVn7lA6e3VZnc+ylsp2mZ14750nOc
 4ag0OgDwcaGFRN4bs0kZZc3TN+Wsx2zk3tpgXCuhiwb2cFX5Q2wb72Ua3vp88RgutASg
 XywiOIg66/jJ/XttM8aZz2vu+9n8hL+K8v/g263f6UUrTJ6C8+op+7jZw5vHmCP99r6W
 gzl/4C9Ze/aCuVzx9LCl/NOwwAB2/3lxlTxNNljluynun+E0tAYtMODT3uKCA//PnjFg
 Md6Q==
X-Gm-Message-State: AOAM532fnfOxkGZyGoYLqxq/wX07oCUO0QfAoWupwLarON+//1f5gukM
 cT2uJkvQkwxXkHZjemufnjgEaOoFZ0YvRrPTsGI=
X-Received: by 2002:a5d:9306:: with SMTP id l6mr26961459ion.105.1594055527579; 
 Mon, 06 Jul 2020 10:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-15-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-15-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 10:02:20 -0700
Message-ID: <CAKmqyKNYrB+BxS41KFWhYc2wXetJH4sJ_18kEDcaYPzu87r49A@mail.gmail.com>
Subject: Re: [PATCH 14/26] hw/usb/quirks: Rename included source with '.inc.c'
 suffix
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
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
X-TUID: XsPUYv8Ow5Pb

On Sat, Jul 4, 2020 at 7:58 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> This file is not a header, but contains source code which is
> included and compiled once. We use the '.inc.c' suffix in few
> other cases in the repository. Follow the same convention with
> this file.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/quirks.c                   | 2 +-
>  hw/usb/{quirks.h =3D> quirks.inc.c} | 5 -----
>  2 files changed, 1 insertion(+), 6 deletions(-)
>  rename hw/usb/{quirks.h =3D> quirks.inc.c} (99%)
>
> diff --git a/hw/usb/quirks.c b/hw/usb/quirks.c
> index 23ea7a23ea..655b36f2d5 100644
> --- a/hw/usb/quirks.c
> +++ b/hw/usb/quirks.c
> @@ -13,7 +13,7 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "quirks.h"
> +#include "quirks.inc.c"
>  #include "hw/usb.h"
>
>  static bool usb_id_match(const struct usb_device_id *ids,
> diff --git a/hw/usb/quirks.h b/hw/usb/quirks.inc.c
> similarity index 99%
> rename from hw/usb/quirks.h
> rename to hw/usb/quirks.inc.c
> index 50ef2f9c2e..004b228aba 100644
> --- a/hw/usb/quirks.h
> +++ b/hw/usb/quirks.inc.c
> @@ -12,9 +12,6 @@
>   * (at your option) any later version.
>   */
>
> -#ifndef HW_USB_QUIRKS_H
> -#define HW_USB_QUIRKS_H
> -
>  /* 1 on 1 copy of linux/drivers/usb/serial/ftdi_sio_ids.h */
>  #include "quirks-ftdi-ids.h"
>  /* 1 on 1 copy of linux/drivers/usb/serial/pl2303.h */
> @@ -915,5 +912,3 @@ static const struct usb_device_id usbredir_ftdi_seria=
l_ids[] =3D {
>
>  #undef USB_DEVICE
>  #undef USB_DEVICE_AND_INTERFACE_INFO
> -
> -#endif
> --
> 2.21.3
>
>
