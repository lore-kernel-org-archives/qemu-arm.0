Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2429250lfi;
        Thu, 26 Mar 2020 14:51:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu1fMQUORTdSRCOLxILaP2lQeXxNucufrjsjxFskx4hskQKfcNsx2RuyrcPIRP+TPr0lrrN
X-Received: by 2002:ac8:191d:: with SMTP id t29mr11305008qtj.40.1585259514913;
        Thu, 26 Mar 2020 14:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585259514; cv=none;
        d=google.com; s=arc-20160816;
        b=hxNMj2beRy/w6y5O52NAUpYOgZc3ygXsRxszLwHmxUowLcas5zZWHzj654zcKECJwU
         K2YoDtCaaR+Mg0ZAwQyiKNDKJhwNPmfzKUGVnTuHovR4WywNQLG+ds4rfRSRRyLFEz1/
         +catq5DKLENz5rR/7aL0IOh63/CRJlWYYAfZxZptJcQmm2T4XTbUOk4WUdXG/D6xWqn0
         bdDHr/f1wGJ0odMU5jWT/NqfVhr5Ozc6s4QXNf02zwVef8b5KR8sHDNAw3QjAEptKv5T
         UdhXWFJUF8Vv0t393a9a+gfcxzD4Fs2IgII6eeHYKhFqntLf9FGTRB6vy0afEmjzG+xV
         RqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8BMXqbjT3kX//KtodTDd18z0mS/t6iRmsiJbA2ZZ/PQ=;
        b=FylY9M+Adrit5Gk1Hf1K/tC+tFYRM0qYumlRut79tmDqyAy0pjAsNrflLXSas/SlIn
         bF6Z+f8NjvBxc4oYcPiNhi86diJIU1aIRHrqgRBFj4iZs00PizQ16B6XHoVZXV2x3zfg
         ZCyChwlvOGPsCfoXT1zNHD2kUACjmDJTvDxRkEPjDfWRGJLYsf52vKC60PmYQ8VwsFNo
         Ji7ft6arXWIQOVxV2lgOlhtccwf/ZpT14KTDyJAniPXSBZ7IOBLimssMj+NhEDmPU017
         q9BBhYG5ACfv09qfyv/ScPPffzHc5ag5/HBtWXzqF+zjcFYUGXgLV8O8SSMq91CzAYt3
         2B0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rQJCkE0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o136si2391494qke.186.2020.03.26.14.51.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:51:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rQJCkE0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHaPq-0001SW-BS
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52823)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaPY-0001DJ-HT
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaPX-00021F-Em
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:51:36 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39124)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaPX-00020g-9U
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:51:35 -0400
Received: by mail-oi1-x242.google.com with SMTP id d63so7005588oig.6
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 14:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8BMXqbjT3kX//KtodTDd18z0mS/t6iRmsiJbA2ZZ/PQ=;
 b=rQJCkE0qjJlZR0HC6ppwJYHbUAheHiJkesuE9U/Cf37JdnC46ZbJwz6fWf/Ph2uXEW
 JbmZPfGM3AeUKgvazyihtc5hsltwtAdkr8YxkudpVInrZMGK+4jPJyCgPiIig0LzsV6M
 IXJYA2WkYdKzc7PxuMH37zrtzgqAD1ldbZVGi8EoYbe2eL9/5yVmyJDheqhFuMHA37Ro
 zSY9Rqq3dtnErHRW5w14eTusrjE2OqsPIP9bx2Lx4PB98n8mFUBHP4kSzeQWvaauHDbd
 U+b2mQ3+zeiRYnQTKCf53Ga151u/TxNrlgIiJqIXsc4REBb+agKiN7GN48MaYziZwkus
 k7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8BMXqbjT3kX//KtodTDd18z0mS/t6iRmsiJbA2ZZ/PQ=;
 b=GLCuN6G19hIYBY9lFzKTI9oSR8Oa9haclEwnC4T98blNrYbobD8QZI6L0Wis59cDZj
 Md5dZfTZimARKeDYCYnw1II/vnQV+d2rcezG+zTu78HkNXuFUmJnNHjE7+/xtgbCkuPK
 bBrBSg4+1eUggk0jfGy5zDpi4y2W77nJKHv9MB/NzISs112Nkx+9TtBzmZvcNr3SQ6Ng
 fYtgLnLSk+J63iO7/8hjVtBh1FKqoJzHH5b0BUxBeH3tSIsiF55AVO8N8W63iMyJnybp
 3yu0oBUI59mXuBFblc3Fa8RgWerJa0DANhCh4iVUUXYMb22E98iYxglTOZAlc/Xzmvah
 y9Ng==
X-Gm-Message-State: ANhLgQ1Tdtrl0i02HJhNNywp9/cLr8Mt6jlw0DtBcwZmXMIA3jbIBU9E
 jdTUgaBYYrCmfPbUz4Gu2sXbv/IqM2r56eo2qdt/xA==
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr1784335oij.48.1585259494308; 
 Thu, 26 Mar 2020 14:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-12-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-12-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:51:23 +0000
Message-ID: <CAFEAcA-68xvoVRjS8xBrGUsa7AqXRACC0NYK4uE9oy3zgX5-vQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 11/12] hw/net/xilinx_axienet: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: ndMwlCkcGb84

On Wed, 25 Mar 2020 at 19:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Running the coccinelle script produced:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --dir hw
>
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_link() hw/net/xilinx_axienet.c:969:4]]
>
> Add the missing error_propagate() after manual review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/net/xilinx_axienet.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 704788811a..f11510a71e 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -948,39 +948,42 @@ static NetClientInfo net_xilinx_enet_info =3D {
>  static void xilinx_enet_realize(DeviceState *dev, Error **errp)
>  {
>      XilinxAXIEnet *s =3D XILINX_AXI_ENET(dev);
>      XilinxAXIEnetStreamSlave *ds =3D XILINX_AXI_ENET_DATA_STREAM(&s->rx_=
data_dev);
>      XilinxAXIEnetStreamSlave *cs =3D XILINX_AXI_ENET_CONTROL_STREAM(
>                                                              &s->rx_contr=
ol_dev);
>      Error *local_err =3D NULL;
>
>      object_property_add_link(OBJECT(ds), "enet", "xlnx.axi-ethernet",
>                               (Object **) &ds->enet,
>                               object_property_allow_set_link,
>                               OBJ_PROP_LINK_STRONG,
>                               &local_err);

Again, Coccinelle seems to have not spotted the missing error check here...

>      object_property_add_link(OBJECT(cs), "enet", "xlnx.axi-ethernet",
>                               (Object **) &cs->enet,
>                               object_property_allow_set_link,
>                               OBJ_PROP_LINK_STRONG,
>                               &local_err);
>      if (local_err) {
>          goto xilinx_enet_realize_fail;
>      }
>      object_property_set_link(OBJECT(ds), OBJECT(s), "enet", &local_err);
> +    if (local_err) {
> +        goto xilinx_enet_realize_fail;
> +    }
>      object_property_set_link(OBJECT(cs), OBJECT(s), "enet", &local_err);
>      if (local_err) {
>          goto xilinx_enet_realize_fail;
>      }

thanks
-- PMM
