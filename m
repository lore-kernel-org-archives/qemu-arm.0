Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2646913lfi;
        Thu, 26 Mar 2020 19:00:47 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsE6vxwFtbEZeFu3NLu8cTK8teqVKFHk3W+LbKupjP/3j6gjGFiwfC7NM/SDw1Pxd42V4sf
X-Received: by 2002:a05:620a:715:: with SMTP id 21mr11781127qkc.81.1585274447454;
        Thu, 26 Mar 2020 19:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585274447; cv=none;
        d=google.com; s=arc-20160816;
        b=HL2k1YO8q7BfWoDSi4loatlwGmt63Ad9fKxTnYYMo4Xy9T7Yv7s0q5WrCOYxZvrKCy
         pbA9yt6+95cRENKWroUjn+bH7jkHlE4OzWPGCYDp1DqCsL8Aj8+Tttg5it8XlJi1ODCp
         qSvIRIphbioPtJ19C3tay9R61c95rH1dqz2iqYvL9AH0i4nTJd+DNUnXwzUaFMv5GyQc
         z86X6xfHPfcuFgwMU6agPgzoFlYqTlg9B1R+x85DpuQM5oGMvLVBNzYtSqj1u/GelhqE
         qikapa1Q4QmGeYfCM7YyIIzAvtmnL7LX3kMe5AXLvOiirHr/X/DDqp/9CF13vZtYN/uz
         +6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=J7IpvI8cEd9ksPQGV/Jl1NmmsLCDtAPAIsIZ/FMhNhA=;
        b=nZt7/7KjACW8lXUzRiTp+KDn3dFnl0OKhGO4U7o6TCL/qsgnH0pK1qICaFIoDJ3AGV
         CkAaVR/liugYfTkHgCIokQOHBMFrpAsUbBXG19FvefvQ+uLXISXe7uPRfd/UqSx5n3CT
         Dd4El4kzBIjDOZwYlZQFfFkCnVxmZBz1Ezi3+G3jh3fsAVHAn85M9xN5J8tI/Y5lykbI
         GpxIxGNvT88Kh5N6eGZe9KRojdENm2MycocG7CYyEFPakXnhXAV/44QT16v38+IRrfvw
         oWb9ad99VnHCOUiITtDi+WFNbcJyw670yiHwsNzvzBJC7L4kI4Zuvu+fYDS0GCzWP5g0
         83Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SThafZv5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si2394901qkf.97.2020.03.26.19.00.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 19:00:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SThafZv5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHeIg-0005As-S7
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 22:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56641)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jHeIU-00058C-Uq
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 22:00:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1jHeIT-0006l2-CG
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 22:00:34 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:45124)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1jHeIT-0006ka-7Z
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 22:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585274432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7IpvI8cEd9ksPQGV/Jl1NmmsLCDtAPAIsIZ/FMhNhA=;
 b=SThafZv5PGa4iSwqt5SCpCIyzlfHBzGB5/E35KcnOcHghb6LuPAGLdArAQgaE7Qghrei7+
 jJEeqHa6HWXAI7wrnD97IUms8xKlElBdbvIOEfxv/OrhQ2tEgQy0L8NR9GaIdKqVdmtQda
 ZHTd7wTXP55ri0nFEhZhsf8cNw3LD8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-5Be39ZChOh6-BHUPPF7JZw-1; Thu, 26 Mar 2020 22:00:30 -0400
X-MC-Unique: 5Be39ZChOh6-BHUPPF7JZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CF19149C2;
 Fri, 27 Mar 2020 02:00:29 +0000 (UTC)
Received: from [10.72.13.132] (ovpn-13-132.pek2.redhat.com [10.72.13.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 885145DA2C;
 Fri, 27 Mar 2020 02:00:21 +0000 (UTC)
Subject: Re: [PATCH] hw/net/allwinner-sun8i-emac.c: Fix REG_ADDR_HIGH/LOW reads
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200324212103.7616-1-peter.maydell@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <de806c65-90ff-d872-a863-770fde658463@redhat.com>
Date: Fri, 27 Mar 2020 10:00:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200324212103.7616-1-peter.maydell@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fl1YozeofbgV


On 2020/3/25 =E4=B8=8A=E5=8D=885:21, Peter Maydell wrote:
> Coverity points out (CID 1421926) that the read code for
> REG_ADDR_HIGH reads off the end of the buffer, because it does a
> 32-bit read from byte 4 of a 6-byte buffer.
>
> The code also has an endianness issue for both REG_ADDR_HIGH and
> REG_ADDR_LOW, because it will do the wrong thing on a big-endian
> host.
>
> Rewrite the read code to use ldl_le_p() and lduw_le_p() to fix this;
> the write code is not incorrect, but for consistency we make it use
> stl_le_p() and stw_le_p().
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/allwinner-sun8i-emac.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.=
c
> index 3fc5e346401..fc67a1be70a 100644
> --- a/hw/net/allwinner-sun8i-emac.c
> +++ b/hw/net/allwinner-sun8i-emac.c
> @@ -611,10 +611,10 @@ static uint64_t allwinner_sun8i_emac_read(void *opa=
que, hwaddr offset,
>           value =3D s->mii_data;
>           break;
>       case REG_ADDR_HIGH:         /* MAC Address High */
> -        value =3D *(((uint32_t *) (s->conf.macaddr.a)) + 1);
> +        value =3D lduw_le_p(s->conf.macaddr.a + 4);
>           break;
>       case REG_ADDR_LOW:          /* MAC Address Low */
> -        value =3D *(uint32_t *) (s->conf.macaddr.a);
> +        value =3D ldl_le_p(s->conf.macaddr.a);
>           break;
>       case REG_TX_DMA_STA:        /* Transmit DMA Status */
>           break;
> @@ -728,14 +728,10 @@ static void allwinner_sun8i_emac_write(void *opaque=
, hwaddr offset,
>           s->mii_data =3D value;
>           break;
>       case REG_ADDR_HIGH:         /* MAC Address High */
> -        s->conf.macaddr.a[4] =3D (value & 0xff);
> -        s->conf.macaddr.a[5] =3D (value & 0xff00) >> 8;
> +        stw_le_p(s->conf.macaddr.a + 4, value);
>           break;
>       case REG_ADDR_LOW:          /* MAC Address Low */
> -        s->conf.macaddr.a[0] =3D (value & 0xff);
> -        s->conf.macaddr.a[1] =3D (value & 0xff00) >> 8;
> -        s->conf.macaddr.a[2] =3D (value & 0xff0000) >> 16;
> -        s->conf.macaddr.a[3] =3D (value & 0xff000000) >> 24;
> +        stl_le_p(s->conf.macaddr.a, value);
>           break;
>       case REG_TX_DMA_STA:        /* Transmit DMA Status */
>       case REG_TX_CUR_DESC:       /* Transmit Current Descriptor */


Applied.

Thanks


