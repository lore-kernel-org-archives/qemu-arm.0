Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1073867lfi;
        Wed, 25 Mar 2020 14:01:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv1qdnDiguDSVzNQXhbT6BfNDy+c1Mzks0TjCsqvK8+gT8AnnV6e/4vSOzRjzINBwHCBL3q
X-Received: by 2002:ac8:3530:: with SMTP id y45mr4959504qtb.63.1585170061323;
        Wed, 25 Mar 2020 14:01:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585170061; cv=none;
        d=google.com; s=arc-20160816;
        b=rU49ihH9XcJqFjAPDONg3TTlAq+HyAOZr+KASe8a7gSisDW4DZew4ZVO9fqJSqNX7G
         Feo4suX/LyuCILqQTOxG7nBG2tK1NWlHKiQRGtoqOl+bUBzIf2Nl3rJBDKId/hiMnOHq
         Bd6HBCyCo30SBU8WhYJisW7aZCuzPmykGcaCTM9SqBInsFoNAYOfV72m6Gqb33fcsTEP
         T0O9ORMJwWqf0nbD1rfjepmiK1WsCcdkMIuDDQyiS3NQoxqYqFhTR+9dgSTZU5Qg7FtO
         2GMbtj+AonfUDYdo4W3a9knRihTUGk450Atms3SP+xXO25gOK+KZukRumxwsaaiOv4+z
         03LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NSqU8zvJr9gAWOOehSSaghSwiKZ8629RmvA/2od8R9c=;
        b=yMtcji1yO6H8/il3PrBUuzK+kcpjFu2DTXzYMPRsmusj+gtx3Qo29Wti0UJoF+SI7K
         NGUQUczlUUuvm8laAqaw0Y1fMM4g3nC6Qa0RFX6r3UbO523SkIiflJfo1kXlGggj0OZO
         dWQ41Pp4r2OUMoPQsZyIScUr/W3nchfHXKb2b0kQylxbk+b4IMqXOinOyGCA2wpFLknf
         x+qgVjnP9M/tVWBCefhMzjU2ZL2sZ1Tan9bTf7cF5rdFqJxQ/scvQmu0h+hQ6YGWXocJ
         xUQxrtvVRp1prGY3Jt9q1QktQUK9LwcfQ8jxwUJhASpzRtAiDA+d6QH5Jd9wzXAT+0mT
         2Hnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QCEZAcQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si81579qth.191.2020.03.25.14.01.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Mar 2020 14:01:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QCEZAcQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHD92-00049Z-Mw
	for alex.bennee@linaro.org; Wed, 25 Mar 2020 17:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43191)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jHD8g-00040i-0k
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 17:00:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jHD8e-0008R4-N7
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 17:00:37 -0400
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41]:40009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jHD8b-0008Od-Uz; Wed, 25 Mar 2020 17:00:34 -0400
Received: by mail-vk1-xa41.google.com with SMTP id k63so1096451vka.7;
 Wed, 25 Mar 2020 14:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NSqU8zvJr9gAWOOehSSaghSwiKZ8629RmvA/2od8R9c=;
 b=QCEZAcQ+maX33q0z8x+o0TKyoiPi/Jrpc08n8Q9H6W4xqJI+xd0htKYtqfhB6XcRxZ
 7gU2wDDny0Ny4AmX1L2KPsYLOCDCr8vKIt9R1/hy3Hnxq8md9gemt0GPDqnIBXEaieJ9
 rwTSBDNODOTCz4C71R3MRlrGdueS3hvoa1HPcpwvDegKeVUpSb2vVLBF0+S3Yak4YioT
 PUOpn3ZZR5IU7Lxb3Zc4Kg9AB8V1qDNwtcXBjSXM0+LZFCPNd7W26bHXCOzejLJqUsd2
 uhSahT7nmFH2Y8y7Bdg5Ge/F9sHyMja21KCtw15WkhPywC5lE3SMtXBe9/mIkHaloUUA
 q7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NSqU8zvJr9gAWOOehSSaghSwiKZ8629RmvA/2od8R9c=;
 b=Pzg6/s1nloVpJgaQHGVrFbHAiekXbNk6xKdnGVFXGiYoTXEGS9gptkZDPy/Cy0CkDj
 NWkIhzCtrtH6WAEZ5NiJaoVHonemfW2a5KTzwEkZMswDCjBzBnVTGE+HNWpVsNXYKHln
 tP5X/bjU78+vNmAjic7IhBpHGpUEiI6ozyRTYf0YOftVBWxERkFPKXWCEGrLzNfG81nm
 QCy6VPGjyVZqqiiDIzId44QzcmQ+z63uyxN7p/UVJODtuyeH/enBlZsjxJdET5jgKKJZ
 5AKqgJuVMl3gx2XTrsO5nqRgqllNLGsDccqXfyVvDqi5VDUdM02q4aOrbjxI7b7g04re
 3WMw==
X-Gm-Message-State: ANhLgQ1r648mC+3uCOjC67a1JS5rvB/EIdu2/NBoE2/nOm2Xg75ehops
 tUoYD+JOp+CCxVqlRZFlM20Yu/aNAckPlg7xC2I=
X-Received: by 2002:a1f:eb04:: with SMTP id j4mr2477016vkh.16.1585170032898;
 Wed, 25 Mar 2020 14:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-12-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-12-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Mar 2020 13:52:33 -0700
Message-ID: <CAKmqyKM5dHo_7gxSWGwSWs1jPOQLB7Ewx4c-dEF72Gdej1gm7Q@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 11/12] hw/net/xilinx_axienet: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a41
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3EBiXBEjfQxS

On Wed, Mar 25, 2020 at 12:26 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
>
>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
>      s->nic =3D qemu_new_nic(&net_xilinx_enet_info, &s->conf,
>                            object_get_typename(OBJECT(dev)), dev->id, s);
>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>
>      tdk_init(&s->TEMAC.phy);
>      mdio_attach(&s->TEMAC.mdio_bus, &s->TEMAC.phy, s->c_phyaddr);
>
>      s->TEMAC.parent =3D s;
>
>      s->rxmem =3D g_malloc(s->c_rxmem);
>      return;
> --
> 2.21.1
>
>
