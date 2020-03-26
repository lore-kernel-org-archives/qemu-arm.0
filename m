Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2422304lfi;
        Thu, 26 Mar 2020 14:44:12 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsEKcK50PTcAOTVo44oujGUQHLXncwqM3FzCshTYkqkAgTA+YedMNnAoQPOA3Xk2GT4tGmY
X-Received: by 2002:a0c:c187:: with SMTP id n7mr11049215qvh.240.1585259052531;
        Thu, 26 Mar 2020 14:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585259052; cv=none;
        d=google.com; s=arc-20160816;
        b=Ff9okqg/b0uhUvD7Zq+c1y6zT9jR+giRRpcwRwrin1J7P4+o/hS2f5D/p8mjKCiuct
         8uJK9ej7ZcEye7hU0ezkE3tybMkPyxruE69f41t9xcMa5lFr8iUWHHameDhkRGYSPyd/
         aVZ4kn4AzKTrldCJok1Qob6tTQ0yU7bj9Ts22q4bYg2CeZ6pEFuJc6tjRegxvhWXrL3o
         aNARra0U9v08zvG5r1hwBmdGMGQBk6EJLtNbUItylVz2ihYAp4W0r46zmuNsbY/xEKzp
         LwEmdi+8/0cfUokzSVQzMKXMZ/YIhkr8Cjh3e9lyscazre+7UrawiansihLJ+D9CKax4
         JbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xvQuM1t+AMalZIyQmGqvVV5WcXOTpPBqjnsxou10UMI=;
        b=ORx706r9N3o/R8ypwuAicbIHfP85qcNFPJE4ajtSW2pBrbvUzr5ZiN1fWY+C0Mzqoo
         HyaKK78Sh6/KlDl5Te8R+0V9ULReghwZQ3zXuglBvmkoPwkh8IbfQg9vFLmjePqCeqFy
         CvVbjGMDUxCAwPvL7oL9Uj+mWLuvfvatnjevQLBuxWeQtALn4/uxC/CmG0MG0ksin5N5
         HmUxhpuXgRtYK526OJeS4Kl+iEmtobVe3E4jip3Wi5ESgFTrs80Wx8e/R5fe+ebYlaqq
         xp4xMtN3jvWLdUllttuGJ1I/GdwaOyDF3Wst5pXWRf3YET4D74qMLobbowEIhjqawvX0
         9gpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cIfWr7+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19si2347850qks.314.2020.03.26.14.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:44:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cIfWr7+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHaIN-0001vO-Vo
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaID-0001to-Fy
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:44:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaIC-0008FI-1C
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:44:01 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45484)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaIB-0008DG-OP
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:43:59 -0400
Received: by mail-oi1-x244.google.com with SMTP id l22so6953764oii.12
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 14:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xvQuM1t+AMalZIyQmGqvVV5WcXOTpPBqjnsxou10UMI=;
 b=cIfWr7+79kzguSu2V3Sa46UNOBIRSKKuTOhRBj75G5/ncXWZgLWn6rHFUcm58jBz4n
 1NgfoyHMCGsDexQfb4jItOz9nsObsYWhblDWparPVYqQKl7OW40U+KOKc1yqrDzf+hJ2
 U5tPvoCplXbW9n3qzpsn85YX8FM8cRmU3oTG/f5YI84XeUlq1MEJBUw5cAm92XMi5P4T
 FhNnoRWoYb1Ymu8x+uqT2FK0zBNkGv5kvME1PDCjRIsxoYtmPc+cT1lntrSTcjAMOkK+
 yuIyku7CJnusz9cm9VAO480Nr/G+M5MHIyzvIrmFJ//PQl0AtwWEKPXKeUAXB+8I3VvM
 tfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xvQuM1t+AMalZIyQmGqvVV5WcXOTpPBqjnsxou10UMI=;
 b=Lp+qPwy92wzLXKpeNsWYEuDJYCLwj5bSmLxafUuLfdktIUkgdqPhz0C1aZlhgTCIdK
 h5O5ZNvLUVsZTNMxmHsLJheqcOt53D8lEz1uye/4PPFkdQ9alGtazpzZPj2PsPakmuxj
 dvYsQXbjpCr46xeoibzCjDEXlfRA/1E4IjJg7t+57apPMp6vcRlUep3hwm4XaZ1dnMQ1
 0DzNi62cSut0CvrXehwfuBRdmmzstAkmINn83NKcbGtcPOKT1QyI+2NyZUMIQVVZsd11
 zVnDIxnt//bZkjvHwhlpesY7UIGlW2M9GupEupzjr6k/CFrMTxvxKFUN20wHAk14hDY4
 BPAA==
X-Gm-Message-State: ANhLgQ0BpHX0awUOWNvgbP2CUug9WRX9BngMY/NR1jPg6qIIV44eRvGb
 mOmj0dI6MAjeVY4zR+K7VV3UIETP4k0ruHFrhWZeJi+qtWo=
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr1766287oij.48.1585259038796; 
 Thu, 26 Mar 2020 14:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-8-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-8-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:43:47 +0000
Message-ID: <CAFEAcA8X5_9G8i31A17DxZDagyHoVYQ7Ctsf5n_9weHqGM6ksA@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 07/12] hw/mips/cps: Add missing error-propagation
 code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sWENzfYWVW0+

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/mips/cps.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>

>      /* Inter-Thread Communication Unit */
>      if (itu_present) {
>          sysbus_init_child_obj(OBJECT(dev), "itu", &s->itu, sizeof(s->itu=
),
>                                TYPE_MIPS_ITU);
>          object_property_set_int(OBJECT(&s->itu), 16, "num-fifo", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_int(OBJECT(&s->itu), 16, "num-semaphores", &=
err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_bool(OBJECT(&s->itu), saar_present, "saar-pr=
esent",
>                                   &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          if (saar_present) {
>              s->itu.saar =3D &env->CP0_SAAR;
>          }
>          object_property_set_bool(OBJECT(&s->itu), true, "realized", &err=
);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          if (err !=3D NULL) {
>              error_propagate(errp, err);
>              return;
>          }

I think Coccinelle has been fooled here by the slightly non-idiomatic
use of "err !=3D NULL" in the guard and has inserted a duplicate
check...

>          memory_region_add_subregion(&s->container, 0,
>                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->itu=
), 0));
>      }
>
>      /* Cluster Power Controller */
>      sysbus_init_child_obj(OBJECT(dev), "cpc", &s->cpc, sizeof(s->cpc),
>                            TYPE_MIPS_CPC);
>      object_property_set_int(OBJECT(&s->cpc), s->num_vp, "num-vp", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_int(OBJECT(&s->cpc), 1, "vp-start-running", &err=
);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->cpc), true, "realized", &err);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }

...but oddly it gets it right here and in a couple of other cases
in this patch.

thanks
-- PMM
