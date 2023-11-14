Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1819850ejc;
        Mon, 13 Nov 2023 21:30:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0gmP0uNgG+IuEDs4OzTNzAHa3aW/AZOnqJnH3dGmToPDimTF5U++XAIpJwyeYkq/aqX7J
X-Received: by 2002:a05:620a:318b:b0:76d:a110:856d with SMTP id bi11-20020a05620a318b00b0076da110856dmr1618553qkb.0.1699939852870;
        Mon, 13 Nov 2023 21:30:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699939852; cv=none;
        d=google.com; s=arc-20160816;
        b=p4tNnYX/8i7HABO92h7D3MilU1hfvx7LmSRH6ZIggwceDvUak8q028JwDWFIaCrx8m
         OUV4c2I0aucYtU3xbpPiYUFiFYa9nEqzATG2bveO4b9ht1Qq/4rV8HYZqcPRd01djQgH
         gAwa/y2V4ZdoCAtfiFWt8GWOaZxI/2MEWScPZnBkwyDYzzgOMVm6thBv2QzjUkU8uI8i
         gqrVk07zYAblT9JEEfs5XrLwZv2oO1p8qUK27FJ8FWK22knufDGGK2Y0uDMFCFMRbdvE
         orvaXBwtzL5MilNMtCYy+5gg8XlDNYqsgLXqAhJd3hModCFyzQB8JF0t8ye2C1qOqCic
         lTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KYdz1LdDqXxrg73NymxfuIwXOLaJadgVCvKcNkIZIj8=;
        fh=tdzKUqqqEXbCYoPkCHUvWKQ7s8X5SLWdbKsYqKMwyS8=;
        b=C4W+rG4/Wacf6YYyrx5TXdb+gvBkjFVAGVZN0VDI+tvodRcT7UxU1QdU1YBfS+2sfv
         Rjr+DD18DmZEPKkNmDo4soBhwvNwUW0hB+pfHGE6Et6ZWm0r0d0XHUfUf+Xq19HVeyU7
         PPaWfgSbBUYAvN7XpaIZD4zepTP8/vwe1QS4JxUoq3Qw7ZIDxMB8jogZ32Xdyc70sGxQ
         8/8ZLTqpdLmv31hyAMY2Ew9hfij9fHY/1lOp/8HdgnCDyga1mdhxl7q84H+1VnbGGaeL
         kOiYtzzwRiBK85FnTYbmRJtGvv1H5mJKAyFZ0BSAky4qDm4W1lEmWVAEdf4m+pk4wZDn
         JSbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PtfvZl+p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj34-20020a05620a192200b0077703bd9771si6051760qkb.364.2023.11.13.21.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 21:30:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PtfvZl+p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2m0A-0003HU-J4; Tue, 14 Nov 2023 00:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1r2m09-0003Gt-2e
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 00:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1r2m04-0008Ei-Cz
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 00:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699939811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYdz1LdDqXxrg73NymxfuIwXOLaJadgVCvKcNkIZIj8=;
 b=PtfvZl+pDw4skMZygKSuKVVtopAnoP8+eFjbjKG+FoB075D1INf5T29iXmyEAIc4d2LUjI
 E9vGQSQh1+VqQ2XazTOrmrC8PPpH+DTseefgg2d8lmD1wOkqMscl6aq75NKS/kihrj5IG4
 ONbMDIMHSYdZQs3lI2plChX+w+fynAs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-C87WZKmyNeeLgq6mJV0ndQ-1; Tue, 14 Nov 2023 00:30:09 -0500
X-MC-Unique: C87WZKmyNeeLgq6mJV0ndQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-50985abb593so5446380e87.3
 for <qemu-arm@nongnu.org>; Mon, 13 Nov 2023 21:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699939808; x=1700544608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KYdz1LdDqXxrg73NymxfuIwXOLaJadgVCvKcNkIZIj8=;
 b=CyWTWdI51WR47o6x5eu2DHIHBVlez7rIyz2skbOqF2lBBbaZi/AcCUxVXUKTXGwlyu
 SJmIi2GLZgZ6ChPRw6d9aKVTfo3fAD/EE7UzUq/3c1zcxpSZG03XMdc0VhKl5XrPoZVv
 bTCDjB6I4VH61qai5lbNtC8ZQfp2srA57uESSEpB+qrrz9UqOKY6ObCbmknTayfpUzEB
 HmKf2AzY7D3iS3H3bgVTUiekGx9vgFyAh7/Q0ZB5n3cGzReMTIIuBQWeYs0G2DjBKjpH
 QGmZ2wgA9nZ+ECuP1KJkIDCEup5qYRRMgSrsL0MIPMftSsHcG0klgbQB27hWIimShm9u
 wy+g==
X-Gm-Message-State: AOJu0Yy4pwMi5YkqXYwad6R7ZfltLXtRcDuQY03fP3tAic/8F0CnVF5a
 seCQffXy7jim+AxDlsQTRDt5/iCco/yGkISqrxbqUyDuuX2xo+VKtzeXm40JV2f1DfcA4HlMCws
 kJS1cuGUm5OmQuu5YtpPerLdNPhU6
X-Received: by 2002:ac2:511e:0:b0:508:1470:6168 with SMTP id
 q30-20020ac2511e000000b0050814706168mr5922335lfb.57.1699939808112; 
 Mon, 13 Nov 2023 21:30:08 -0800 (PST)
X-Received: by 2002:ac2:511e:0:b0:508:1470:6168 with SMTP id
 q30-20020ac2511e000000b0050814706168mr5922308lfb.57.1699939807729; Mon, 13
 Nov 2023 21:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <a2cb6356-18b1-44d1-90a8-d137e8a25227@daynix.com>
In-Reply-To: <a2cb6356-18b1-44d1-90a8-d137e8a25227@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Nov 2023 13:29:55 +0800
Message-ID: <CACGkMEvyDitD-5d_mzK0LxjidcT7ZXfw_qzK_WbMPt6dd+McKQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] net: Update MemReentrancyGuard for NIC
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, P J P <pj.pandit@yahoo.co.in>,
 Alexander Bulekov <alxndr@bu.edu>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
 Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Thomas Huth <huth@tuxfamily.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Greg Kurz <groug@kaod.org>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, 
 Paul Durrant <paul@xen.org>, Rob Herring <robh@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 xen-devel@lists.xenproject.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R2TReZjCzU2B

On Thu, Sep 21, 2023 at 3:16=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> On 2023/06/01 12:18, Akihiko Odaki wrote:
> > Recently MemReentrancyGuard was added to DeviceState to record that the
> > device is engaging in I/O. The network device backend needs to update i=
t
> > when delivering a packet to a device.
> >
> > This implementation follows what bottom half does, but it does not add
> > a tracepoint for the case that the network device backend started
> > delivering a packet to a device which is already engaging in I/O. This
> > is because such reentrancy frequently happens for
> > qemu_flush_queued_packets() and is insignificant.
> >
> > This series consists of two patches. The first patch makes a bulk chang=
e to
> > add a new parameter to qemu_new_nic() and does not contain behavioral c=
hanges.
> > The second patch actually implements MemReentrancyGuard update.
> >
> > V1 -> V2: Added the 'Fixes: CVE-2023-3019' tag
> >
> > Akihiko Odaki (2):
> >    net: Provide MemReentrancyGuard * to qemu_new_nic()
> >    net: Update MemReentrancyGuard for NIC
> >
> >   include/net/net.h             |  2 ++
> >   hw/net/allwinner-sun8i-emac.c |  3 ++-
> >   hw/net/allwinner_emac.c       |  3 ++-
> >   hw/net/cadence_gem.c          |  3 ++-
> >   hw/net/dp8393x.c              |  3 ++-
> >   hw/net/e1000.c                |  3 ++-
> >   hw/net/e1000e.c               |  2 +-
> >   hw/net/eepro100.c             |  4 +++-
> >   hw/net/etraxfs_eth.c          |  3 ++-
> >   hw/net/fsl_etsec/etsec.c      |  3 ++-
> >   hw/net/ftgmac100.c            |  3 ++-
> >   hw/net/i82596.c               |  2 +-
> >   hw/net/igb.c                  |  2 +-
> >   hw/net/imx_fec.c              |  2 +-
> >   hw/net/lan9118.c              |  3 ++-
> >   hw/net/mcf_fec.c              |  3 ++-
> >   hw/net/mipsnet.c              |  3 ++-
> >   hw/net/msf2-emac.c            |  3 ++-
> >   hw/net/mv88w8618_eth.c        |  3 ++-
> >   hw/net/ne2000-isa.c           |  3 ++-
> >   hw/net/ne2000-pci.c           |  3 ++-
> >   hw/net/npcm7xx_emc.c          |  3 ++-
> >   hw/net/opencores_eth.c        |  3 ++-
> >   hw/net/pcnet.c                |  3 ++-
> >   hw/net/rocker/rocker_fp.c     |  4 ++--
> >   hw/net/rtl8139.c              |  3 ++-
> >   hw/net/smc91c111.c            |  3 ++-
> >   hw/net/spapr_llan.c           |  3 ++-
> >   hw/net/stellaris_enet.c       |  3 ++-
> >   hw/net/sungem.c               |  2 +-
> >   hw/net/sunhme.c               |  3 ++-
> >   hw/net/tulip.c                |  3 ++-
> >   hw/net/virtio-net.c           |  6 ++++--
> >   hw/net/vmxnet3.c              |  2 +-
> >   hw/net/xen_nic.c              |  4 ++--
> >   hw/net/xgmac.c                |  3 ++-
> >   hw/net/xilinx_axienet.c       |  3 ++-
> >   hw/net/xilinx_ethlite.c       |  3 ++-
> >   hw/usb/dev-network.c          |  3 ++-
> >   net/net.c                     | 15 +++++++++++++++
> >   40 files changed, 90 insertions(+), 41 deletions(-)
> >
>
> Hi Jason,
>
> Can you review this series?

For some reason it falls through the cracks.

I've queued this for rc1.

Thanks

>
> Regards,
> Akihiko Odaki
>

