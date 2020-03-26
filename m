Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2414277lfi;
        Thu, 26 Mar 2020 14:34:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtIfjtkY74l+5Q+8IwMtW5fHaGRUU3JGDFQyVIG3HXTn3YScTk9qCPMYSfmgYrSmXTJCCOn
X-Received: by 2002:a0c:bec8:: with SMTP id f8mr10978166qvj.0.1585258488558;
        Thu, 26 Mar 2020 14:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585258488; cv=none;
        d=google.com; s=arc-20160816;
        b=ytRyHFVcSqvr/3QV8LgsxpgSJ8iBWqB/3izIskKctBVcMtIb+la77Wkwww3jOhHODu
         HUdN/E/7Opif7keZVfzBShheOJDEnY38XvbJpDoGpV5Xk090G+10Oz/kGChJNtxTc5uT
         P+0azSVFwzUykvViBQ/vUXbz223JlpTaeQLM5BFY0/ErUetYnALAxdp81aEvkQ9byFOA
         uT1q9oaAw7/kKyHTy3HhRNtmQpM38YUTChptBtu161TEE8LQPJPDH5E/Y561zRM1tW/h
         6ZtpS5/mWBPzDEe+us+bMpvlXbIFOF2iwLpAj4SLqTog3u2tNkCnIsDHsmI3hJ6zUuPk
         Ri6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HknmFa0YRfLIIhNE8hZfw18tHx3/w1ozQbxIJrAl5oo=;
        b=fLixN6sJjHc/Wg1cimdzPcL1M/GM/YhwCojY7Krb/lDGnca+inM0Zj2g3Z07cijK4v
         y881jqdRPusHf9IMo23mzfRdPNU2Gbsls/D/TycL0ZAOBu+hY/e6RJJxsQgqA+DNssCt
         9py6Y/XYiUq0mTv3y4BZLZIh8+os0st3x54ZHeRyIGXQz4FXtWeXI6tFJQY3y0yyaPZ+
         GWEawScVGf7WbfDTESzBPLqQKDkcFfErTn/QIPRjmWrmhSADEI0wZhEeDHumh6Lm3RzV
         +xTj+nwmeYV9qUP21OdRCx17hV0YRhBaZ6KUuQOKwiWylgVRDyt9gg/Nyh4OIN+4gOMh
         +TaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Omqd3PtI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si2261659qkd.343.2020.03.26.14.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:34:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Omqd3PtI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHa9H-0000VH-UO
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54194)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHa93-0000RP-EJ
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:34:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHa92-0006tE-7O
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:34:33 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34626)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHa92-0006sF-2N
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:34:32 -0400
Received: by mail-oi1-x243.google.com with SMTP id d3so2398643oic.1
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 14:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HknmFa0YRfLIIhNE8hZfw18tHx3/w1ozQbxIJrAl5oo=;
 b=Omqd3PtI3mQcyJ2xNWeF8z6p7opwItOYl20pCfmWzCAM+LvMi89Vlswey280wQt5WR
 YJX6lazpkF788P6Y6pGPVhGhG/6DoFVW5WpA7ssWLoEg65kNg2B2gbXTUFwgjNssiq7p
 4DLU8B4vqmYHwv4XiL0s28x7s4bAjpYWa+ac0dRv4YXW+p3fzl82VNrtJYQrUcASrhv7
 XOXnAvMcXyou9um4tam7aFT4U24EMudcETK7q3uEPKNHF+zoH+ppVO7KcjsnV2uyAE83
 k+EmbYZOBduKa0OmaIJYq4pwzQg0wJ7RX4RG1XjtoyYIWj7/QeJvAhdvMZdHxDV9ptHm
 D73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HknmFa0YRfLIIhNE8hZfw18tHx3/w1ozQbxIJrAl5oo=;
 b=pRBelWG9L3eMjvqZz3SGf9v0W3KOzESdPwofTLrdlvTYaP+1ID+ovscCNEEm/WhKoU
 NMbvqAFeXoWTCN9Qr206k1Wn759Cg/h3HYJbfP8+sfzJAHQefJkan+q0yGh33A/jD3hH
 gV/l3usyVmg2ms7I116a1T4+/hIwKVMdVgy4WRE8bGSqtQ1OWJLSyR+dueJ74ouRT1Uk
 9gp0d+FeOYPIa0hkwWgxSCihX8Oq9n3Y3i5omOyH8MBhjLTznCA/CsAre+GNaIXYOXUA
 4X5+WuuN16NO1Xk0yeAS45PCO/H6eJmkpLsfGF2R9XS6PPJqnZ70ycYawNCHZv2ih/OJ
 Pgrw==
X-Gm-Message-State: ANhLgQ1IIp+/eS/Q5NTtZTaxt1eu1BxIH6HZRsZecZlJo53YjSaVTUKv
 ksv0dIFkUB4zp1HbaIv5g13V+gnd+1GZhPiTluK1rw==
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr1795744oih.146.1585258471238; 
 Thu, 26 Mar 2020 14:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-3-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:34:19 +0000
Message-ID: <CAFEAcA-9w4GRLv=gFUAkNryhDR+8JNTS-=UAe6oh7eso5Uyhag@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 02/12] hw/arm/bcm2835_peripherals: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-TUID: sE/UHjKV+41h

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
>  hw/arm/bcm2835_peripherals.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index edcaa4916d..a111e91069 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -133,254 +133,262 @@ static void bcm2835_peripherals_init(Object *obj)
>  static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>  {
>      BCM2835PeripheralState *s =3D BCM2835_PERIPHERALS(dev);
>      Object *obj;
>      MemoryRegion *ram;
>      Error *err =3D NULL;
>      uint64_t ram_size, vcram_size;
>      int n;

Is there a reason this patch has such an enormous amount of
context around the changes it's making ? It looks like it's
quoting the entire function.

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
