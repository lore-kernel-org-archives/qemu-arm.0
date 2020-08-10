Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5261706lfy;
        Mon, 10 Aug 2020 06:43:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfSqjTk51O1WgXkdM0R5PYtzPrymgRR3yF+0MFukosK80zqm7Gm0XvSZ+nr0nXhVohsdOn
X-Received: by 2002:a05:6102:242:: with SMTP id a2mr18413411vsq.58.1597067013055;
        Mon, 10 Aug 2020 06:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597067013; cv=none;
        d=google.com; s=arc-20160816;
        b=QPX68z88c1yHgL+OjddXGwxAjo9nREpzFO7YAhWrTrFhgZ3jMAZPx6AqBP6DctoI5m
         f17OeaaZzUYWxG/Zmf4Qrbq0wGUAGbHmJZX7Qax6kH3OQlvs0XvhRS6fg8jfVu8GUHLe
         Ak3QoB7KPzDV8cVyLBqLR5e/Atwh1+kvUf94aZF6txV1L3ZVAembOzSq4QZR95BaJei8
         HlULQx7rB/SpIn4jL4XYJgQbTYfcVVK1mrfKXogs+AwQizeDMAq5hRQztDbuX1YyTZ7I
         XWAoMO6EkxH8uxbF44oEbsVj6THANxb4TFBQ/B2mPE+HIStHFMpJAH9ecUmJBWBwl4yc
         VWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oaKx2OZ1h0VrAiH41NlcpdXiDkDnFX+49omO/QQAGiA=;
        b=IFjIDPdIO+6p5YcUkunRCUk3rQqbBnzfn8mgGPkOgwEb9Wr3igUCDhcFUSzpdhe8+1
         9TYdSbw8G3YdtjrSYDyBPj16x+maoVREEFnhkfjnUi9nYY5+x4u6uJ4oDw9UmxM6muty
         l3Z8pZ2pYAOfMbvpc2gmloLu0+zuiTy5Xm1cWUfTeSm3QQZVGkOyzhGdW2VsPPYO7R71
         gmVTxmjCS0J5BlP5ZeloKclkW3/grwoxfUtvqxLX13+zWUzwyC6bzlpAkG8ijR0U+96p
         1MSogiZdlo6VBlm1i1yDg5cUAEG/kMoRYtYGCLszwhR8KQdRXiY/35DN02yWEfKzcSPc
         Ro+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T7lWCNOQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si2446504vsr.213.2020.08.10.06.43.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 06:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T7lWCNOQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k585M-00048Q-6p
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 09:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1k5858-00044Y-9d
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 09:43:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24849
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1k5855-0001xT-Hf
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 09:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597066993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oaKx2OZ1h0VrAiH41NlcpdXiDkDnFX+49omO/QQAGiA=;
 b=T7lWCNOQRy5w+i5yYe/AH1EK6F5f+DekfFAAJE+s3qNvvULgstzfaoavlA3RGB8DgC8aih
 RLaoNspLwOmSDmRCUOauzoKlDYaKnm4Oe047H+a+Ffym1hLdvFHAZqbHJIl6YSb6WY62Lo
 KHosq9+rW3d/DWmuRmDZGwmhSycWwYU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-apZGMsm6P9SAC0TI8k27Sw-1; Mon, 10 Aug 2020 09:43:12 -0400
X-MC-Unique: apZGMsm6P9SAC0TI8k27Sw-1
Received: by mail-ej1-f72.google.com with SMTP id q20so3878933ejx.13
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2020 06:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oaKx2OZ1h0VrAiH41NlcpdXiDkDnFX+49omO/QQAGiA=;
 b=lAf3BrI1IFuKpGmvKEmMzmEMI2/MuenJ0ZPSc1MqzXxPGBr7XJec4BBhdD/xQihRxQ
 AsCLY0YncHXv1NJ1/phVPixAaTaXJ2H7UeEakRvAEIJ8COl9c10FE57o/RWFbP7OmStO
 p/IatHwomo+qKYmpfgVnYpnN3hvgHSJqihfbKndVyFaNJoq4CdTNR71PmfYXISeL/Zdn
 gcV/Dk1baVP6BglbUosGuunFvYutag5L+Bhm0aemQYYcxTJTT6FsLXE+TRWJrv+1skd/
 FVMQogdkw55fEldAIGQ+oWUb500VE872MJlzw57FO6orJ7uSZeX/BPf48l5VLU4Hun5D
 pvHw==
X-Gm-Message-State: AOAM532O9349iCdHknxzAZwv6OklGSth++jRipEAYLK0d1U9RA/ClPhd
 PdE5F0Ce0mbdcAc9yhLirfhVPzRkxHDEfynewdCnHyLlSlkDFv7WT+hybGCAd6tyAm+ETIF4llD
 jBgrtLvfa/sG5LKhFm37FdYPwuf7z
X-Received: by 2002:a17:906:4dcb:: with SMTP id
 f11mr21244355ejw.454.1597066991195; 
 Mon, 10 Aug 2020 06:43:11 -0700 (PDT)
X-Received: by 2002:a17:906:4dcb:: with SMTP id
 f11mr21244320ejw.454.1597066990808; 
 Mon, 10 Aug 2020 06:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-15-clg@kaod.org>
In-Reply-To: <20200806132106.747414-15-clg@kaod.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 10 Aug 2020 15:43:00 +0200
Message-ID: <CAA8xKjVfG8cp_g6FDNxUCQ6dqiMHnf17eMNCE2Wz+Vr+grAprw@mail.gmail.com>
Subject: Re: [PATCH for-5.2 14/19] ftgmac100: Fix integer overflow in
 ftgmac100_do_tx()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mcascell@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 03:31:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Frederic Konrad <konrad.frederic@yahoo.fr>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Ziming Zhang <ezrakiez@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hkS/4mhQ9aaw

On Thu, Aug 6, 2020 at 3:21 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> When inserting the VLAN tag in packets, memmove() can generate an
> integer overflow for packets whose length is less than 12 bytes.
>
> Check length against the size of the ethernet header (14 bytes) to
> avoid the crash and return FTGMAC100_INT_XPKT_LOST status. This seems
> like a good modeling choice even if Aspeed does not specify anything
> in that case.
>
> Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
> Cc: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Ziming Zhang <ezrakiez@gmail.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/net/ftgmac100.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 280aa3d3a1e2..987b843fabc4 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -540,10 +540,21 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint=
32_t tx_ring,
>                  s->isr |=3D FTGMAC100_INT_XPKT_LOST;
>                  len =3D  sizeof(s->frame) - frame_size - 4;
>              }
> -            memmove(ptr + 16, ptr + 12, len - 12);
> -            stw_be_p(ptr + 12, ETH_P_VLAN);
> -            stw_be_p(ptr + 14, bd.des1);
> -            len +=3D 4;
> +
> +            if (len < sizeof(struct eth_header)) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                         "%s: frame too small for VLAN insertion : %d by=
tes\n",
> +                         __func__, len);
> +                s->isr |=3D FTGMAC100_INT_XPKT_LOST;
> +            } else {
> +                uint8_t *vlan_hdr =3D ptr + (ETH_ALEN * 2);
> +                uint8_t *payload =3D vlan_hdr + sizeof(struct vlan_heade=
r);
> +
> +                memmove(payload, vlan_hdr, len - (ETH_ALEN * 2));
> +                stw_be_p(vlan_hdr, ETH_P_VLAN);
> +                stw_be_p(vlan_hdr + 2, FTGMAC100_TXDES1_VLANTAG_CI(bd.de=
s1));
> +                len +=3D sizeof(struct vlan_header);
> +            }
>          }
>
>          ptr +=3D len;
> --
> 2.25.4
>

I can confirm that I can't reproduce the issue with the above patch. Thank =
you.

--=20
Mauro Matteo Cascella, Red Hat Product Security
6F78 E20B 5935 928C F0A8  1A9D 4E55 23B8 BB34 10B0

