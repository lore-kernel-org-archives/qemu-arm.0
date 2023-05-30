Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1895491ejb;
        Mon, 29 May 2023 19:44:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6LydDVObN+j1vI4OXfkq9hBN6x1Y3DarHXB+SDcV1GBftjLOOscOjWQG/kY0LZq3o+4YXI
X-Received: by 2002:ac8:5c0d:0:b0:3f7:ff4a:eaf8 with SMTP id i13-20020ac85c0d000000b003f7ff4aeaf8mr604115qti.10.1685414649135;
        Mon, 29 May 2023 19:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685414649; cv=none;
        d=google.com; s=arc-20160816;
        b=HIEnw8O922uZ3X3mhTqo9MY6kNqXO9z8cvyGn9lBNqXlFhQF0ODSjC2cechbn/TtP1
         HA1pH269gZgH6mOq5FTHwDfbl91ifJNRaFO14nOzGVi++1exuu2xhruEfBjtXPRE+5k+
         BIJAOquWVdHyYPB2pyYINS7nZyTpd8i9vBPjAWszpplTGOSnptdD3m3qZM8Q4zJJcFo0
         /39EkSoSjmkJ+cjoORiwiqn0VSE/fX+bZlxHkvLwKfwjoQn2yBxWEmI7QCf0gXCsavRh
         7WUk87/lL2UdckKnCPiU702mJd60jYOPalpr2t5udLLwy/UGtkUZYBSE0qpY021mByFg
         ufSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=swwLnIkzsF+teWY2PyMri5LA/E3FuwMRZkjgfo8Sf88=;
        b=i0iRb9JdA65c1p3uOe+GKY7Pc/OzNByYU2yulC5nf0GY/US9ZZKDqWLzoDf0PDU8b2
         lRPeubjQ29K2pbZaU0XBUrYmEl0+t+M9sW5NLEtyf2lViWmdDhF1zlgYJ9DpwVC6Z7df
         z5feEsY6pVDpzHs6c/YPFODXjtzaWkQcouY7Rm1NHVYtKX1sdgoo46duLm6wHo1EvHhe
         RfvC3pHEaFpIBO8I/E7Sm1OVy7bid71n8ggAIWVY9zUbpDKMJh5gIzzp3cnC2IZUo6rc
         8BnRFBrDKxpdZKYrtAV17p6AdzCrud6TuP6JvXD6LcwVyu7A81o/xzcdsOAxDWY+mm0Q
         QjuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Mk7dJszW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020a05622a061100b003f687c0d3c1si5910931qta.414.2023.05.29.19.44.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 May 2023 19:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Mk7dJszW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q3pKc-0000PG-Fn; Mon, 29 May 2023 22:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1q3pKb-0000Oc-4G
 for qemu-devel@nongnu.org; Mon, 29 May 2023 22:43:29 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1q3pKY-00057n-8L
 for qemu-devel@nongnu.org; Mon, 29 May 2023 22:43:28 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-64d3578c25bso4579362b3a.3
 for <qemu-devel@nongnu.org>; Mon, 29 May 2023 19:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1685414604; x=1688006604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=swwLnIkzsF+teWY2PyMri5LA/E3FuwMRZkjgfo8Sf88=;
 b=Mk7dJszWz2jAD6FWi0cao85HuTooPQab6qm7QHzPUgs/YznOaSVoUH9MQcXHmnerZP
 hR1JtUquNXQLzoQle2nym9+2/UrkKMlqwAOJAlHXH8JOu8vd6du751KrQDltRrPAe9C5
 i1VvizG0Bl3Nf1w+iysV9cthnw/1aAdUpjl9a1u7cX6ZAtNQwV7EGM9toZpV9T192QsT
 o0h6jomXg0eaMr7lSBclIWMo17OT0dP1IZg4szXD2PIilLzDOI3PuhuK1TGfGk/kvaVl
 KVHS+BTO5NgxEjKNvlVKL3EKGDw6qnxJICKErDGA00YBshaZ+29p1wqkgd3bzox0LFNV
 lBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685414604; x=1688006604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=swwLnIkzsF+teWY2PyMri5LA/E3FuwMRZkjgfo8Sf88=;
 b=XPmmTsJhRtlg7/6/o8d6kWWjvohExBVHjh4ICOiuA32ohejY2aAFb93vnoohw11Muk
 4jBI8KMNwvQ4zTbEMYGQD1dYD08NK7zabXiguRRNW0qhGHjWHYIZUDEpGm/so80mM3ji
 7kX6iQaPCDBU4v2g/NuqKqeWiGPoFltYElyi+WQibd9lowrbza4ZljtuCCFDy5wzZXxk
 vZRBha7A+PlMKc2LiLphyLJeIV/cIvX5K4+e38CBGWuw9TLCydW8STXXGmjXAC3YIfr9
 8A4SJvg5b+Doncn+A2Ea8BXFpae8yv2JzJmnukm4boeePmuD51LN72AE7+X5F7DsKQzm
 fAeQ==
X-Gm-Message-State: AC+VfDzRhWAnggUIXjm2gGdAmsuH66qui1SRXoeT4pJYN9GXPpdlfwvH
 lVH7tL9a+r4zo5E74KHNxtR00w==
X-Received: by 2002:a05:6a20:ce4f:b0:10e:de4f:3437 with SMTP id
 id15-20020a056a20ce4f00b0010ede4f3437mr869413pzb.39.1685414604413; 
 Mon, 29 May 2023 19:43:24 -0700 (PDT)
Received: from alarm.. ([157.82.204.253]) by smtp.gmail.com with ESMTPSA id
 63-20020a630542000000b0051baf3f1b3esm7801785pgf.76.2023.05.29.19.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 19:43:23 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, P J P <pj.pandit@yahoo.co.in>,
 Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 0/2] net: Update MemReentrancyGuard for NIC
Date: Tue, 30 May 2023 11:43:00 +0900
Message-Id: <20230530024302.14215-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7Ur0fGLdoCOm

Recently MemReentrancyGuard was added to DeviceState to record that the
device is engaging in I/O. The network device backend needs to update it
when delivering a packet to a device.

This implementation follows what bottom half does, but it does not add
a tracepoint for the case that the network device backend started
delivering a packet to a device which is already engaging in I/O. This
is because such reentrancy frequently happens for
qemu_flush_queued_packets() and is insignificant.

This series consists of two patches. The first patch makes a bulk change to
add a new parameter to qemu_new_nic() and does not contain behavioral changes.
The second patch actually implements MemReentrancyGuard update.

Akihiko Odaki (2):
  net: Provide MemReentrancyGuard * to qemu_new_nic()
  net: Update MemReentrancyGuard for NIC

 include/net/net.h             |  2 ++
 hw/net/allwinner-sun8i-emac.c |  3 ++-
 hw/net/allwinner_emac.c       |  3 ++-
 hw/net/cadence_gem.c          |  3 ++-
 hw/net/dp8393x.c              |  3 ++-
 hw/net/e1000.c                |  3 ++-
 hw/net/e1000e.c               |  2 +-
 hw/net/eepro100.c             |  4 +++-
 hw/net/etraxfs_eth.c          |  3 ++-
 hw/net/fsl_etsec/etsec.c      |  3 ++-
 hw/net/ftgmac100.c            |  3 ++-
 hw/net/i82596.c               |  2 +-
 hw/net/igb.c                  |  2 +-
 hw/net/imx_fec.c              |  2 +-
 hw/net/lan9118.c              |  3 ++-
 hw/net/mcf_fec.c              |  3 ++-
 hw/net/mipsnet.c              |  3 ++-
 hw/net/msf2-emac.c            |  3 ++-
 hw/net/mv88w8618_eth.c        |  3 ++-
 hw/net/ne2000-isa.c           |  3 ++-
 hw/net/ne2000-pci.c           |  3 ++-
 hw/net/npcm7xx_emc.c          |  3 ++-
 hw/net/opencores_eth.c        |  3 ++-
 hw/net/pcnet.c                |  3 ++-
 hw/net/rocker/rocker_fp.c     |  4 ++--
 hw/net/rtl8139.c              |  3 ++-
 hw/net/smc91c111.c            |  3 ++-
 hw/net/spapr_llan.c           |  3 ++-
 hw/net/stellaris_enet.c       |  3 ++-
 hw/net/sungem.c               |  2 +-
 hw/net/sunhme.c               |  3 ++-
 hw/net/tulip.c                |  3 ++-
 hw/net/virtio-net.c           |  6 ++++--
 hw/net/vmxnet3.c              |  2 +-
 hw/net/xen_nic.c              |  4 ++--
 hw/net/xgmac.c                |  3 ++-
 hw/net/xilinx_axienet.c       |  3 ++-
 hw/net/xilinx_ethlite.c       |  3 ++-
 hw/usb/dev-network.c          |  3 ++-
 net/net.c                     | 15 +++++++++++++++
 40 files changed, 90 insertions(+), 41 deletions(-)

-- 
2.40.1

