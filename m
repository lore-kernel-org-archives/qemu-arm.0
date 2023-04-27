Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp678984ejm;
        Thu, 27 Apr 2023 14:11:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4DQyYvSlC/8JfT1FfElfQRF5Z1dM10xeB0L8GMdZHdmwHu+Sqb2ql+THWxLodNEMD0Ywou
X-Received: by 2002:a05:6214:4109:b0:5f3:deca:eb9 with SMTP id kc9-20020a056214410900b005f3deca0eb9mr3580493qvb.20.1682629916903;
        Thu, 27 Apr 2023 14:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682629916; cv=none;
        d=google.com; s=arc-20160816;
        b=WmjGziaAqMmtRhK8Vp5vhuoOckK8Po7QPiFQtK/QP+oi9yh7c8kicabj/i0vk6MbUo
         naiZ0cTtlaWoYIhnYkBBmdp9x6HEIrSir1hcS32nayteBSw7MkLHTfYvKJyIZWbQPMsL
         uogXpSvindp3z2aecfp/9QoMX55XdbEQRxd6UTOPElYrgKgSv+wqU8RGXGlWZc1mDu5/
         En+2+Xmdqgwq+MfK8PPAQFsrrUcvgZIzbeDh008AOesk016z/IUnIkbZhNl97Evx549k
         C7d28SExZ6iaVgWQ2XbCPq12ajl89Mye5KV/Ya/3AN2wcBdD+0IwHT/fiv/IwJKfy2Oa
         U/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:ironport-hdrordr:ironport-data;
        bh=baPw7HeUNSOgBdUdX5+Wv116KVOdtz82o0yKX11s6GY=;
        b=k1ub43yXDLWTAH7dYPgndSlJPd+4J/W/kl125fwMsbmrpHb24Tf+iyd1CZ/TVMzXML
         ACmdmAy04s0eYKypFuaqWXGYr3khhThldhSRMu+OboQcHVb2oJvr1/25lB9ul3c4k5gX
         yl5BJmKqJL2Ow/GhUwPwEgrjW9PXkeQIo1j3e/1Gz37vjKe2/AjAawnA3JjouNGQPAln
         2NUNnTbnKtKaa1pP5H1YmRNk6Y3m8seVxu1MjwFBda14JW2tgy/vvfG+zifE2SRjBRlf
         6rWAJFm+OpWYd4ZEHfcMCPrpOhFZ1pFz/G8FxC0Us3FDeyULxvLNSWFYzfGIEPVsKodP
         cQCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=B9LnlsZ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gi2-20020a056214248200b005aa83262ab6si12637261qvb.532.2023.04.27.14.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Apr 2023 14:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=B9LnlsZ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ps8tU-0005z7-8h; Thu, 27 Apr 2023 17:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tR-0005yE-K7
 for qemu-arm@nongnu.org; Thu, 27 Apr 2023 17:11:09 -0400
Received: from esa6.hc2706-39.iphmx.com ([216.71.137.79])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tQ-0005Py-3P
 for qemu-arm@nongnu.org; Thu, 27 Apr 2023 17:11:09 -0400
X-IronPort-RemoteIP: 209.85.166.198
X-IronPort-MID: 279189097
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pjcrKKx2d20wv1XsmQ56t+eLxCrEfRIJ4+MujC+fZmUNrF6WrkVWx
 2UZUTyDPfaMMTejeoonbti08ElV7Z6BmtZlSAY4pS00HyNBpPSeOdnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9j8kk/nTHNIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzN8B56r8ks156yu4mxA5TTSWNgQ1LPgvyhNZH4gDfzpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZGBiuFIPM0SRqkEqShgJ70oOHKF0hXG7Ktm+t4sZJ
 N1l7fRcQOqyV0HGsL11vxJwSkmSMUDakVNuzLfWXcG7liX7n3XQL/pGAVsfONZB9chOB2xK5
 cNHCyIvPxPbiLfjqF67YrEEasULKcDqOMYeviglw2iIXbApRpfMR6iM7thdtNsyrpoWTLCOO
 oxAN2QpNUWQC/FMEg5/5JYWleO4gHXlWzdF7l+ZuMLb5kCJk10ogOm1YYW9ltqiH51lr0KC+
 1D8wWH8O0ocaeyZ7GS02yf57gPItWahMG4IL5Wh+/t3xVSJw0QVDxsZU0b9puO24nNSQPpaI
 k0Qvysq9O08rR37CNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBYJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:Niii2qhv9M+1beoqJ+CtuCyVvHBQX/t13DAbv31ZSRFFG/Fwz/
 re+8jzpiWE7gr5OUtQ3OxoV5PwJE80maQa3WBzB8bnYOCFghrNEGgK1+KLqVCNdBEWndQ86U
 4USdkdNDSGNykYsS+V2miF+4lK+rK6GeuT9J7jJj9WPHlXggtbnkBE4vrwKDwDeOG4b6BJYa
 Z1GKB81kidkD0sH76G7gJsZZm1mzXG+aiWGiLv2nYcmUqzZePB0s+7LzGImhgZSD9B2rEk7C
 zMlBH4/Lyqt7WhxgbbzHK71eUkpDJP8Ko8OCWgsLllFtzXsHfZWK1xH7mZ+DwlquCm71gn1N
 PWpQ07Ish143TNOmmovBrkwWDboUATwm6nzUXdjWrooMT/Sj5/AdFGn5hFfhzQ7FdltM1g0b
 hMw3mSu/NsfFr9dG2U3amDa/kd/nDE7EbLv4Uo/jBiucp3Us4YkWRplHklW6vpPEnBmc8a+J
 oHNrCT2B97SyLkU5mChBgT/DWFZAVOIv9QKnJy+/B80VBt7TJE83c=
X-Talos-CUID: =?us-ascii?q?9a23=3A7VcLJWvvx1S2UB2j+kutAqqK6IsoaFTYly7fDXa?=
 =?us-ascii?q?+BGJ5d+K2W33B+/trxp8=3D?=
X-Talos-MUID: 9a23:+linsAjDqG+uPr2tB1jOxcMpbp9Y0qC0VXI3r5ADgpKCaBx2HmmspWHi
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 17:11:06 -0400
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-32aff21222eso140411895ab.3
 for <qemu-arm@nongnu.org>; Thu, 27 Apr 2023 14:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682629866; x=1685221866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baPw7HeUNSOgBdUdX5+Wv116KVOdtz82o0yKX11s6GY=;
 b=B9LnlsZ4reTNfhj0YUftjz/y+++7WeaT4lz57CBdFS3jO4lzsYFXWbnNTzcx9awe0A
 +xTSYBVgYU+f18TcPIQQHLkgk/ez49w0KRiTSrCm+Brhgo/zzBXGxIqYUL+jOUB4ogX2
 jPN+hl7Xe1WTDfm30BjxBJGJrlSBRItb6+EuwNzaHF72l5lv4jwAmyoNLsG7m0la0pup
 i2KbBb+KmggPmPncaKQDc9MfG9KuCOoLiLNF67YNWgmfj0mCA6Uuvg9dkxZQO3sqd3av
 19lU/nFEADvdAk0VTjcoAjlfS9LKTWRcTn2fozfoj9cGSSVK8nb2H/80ylVpan5wqQuF
 qZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629866; x=1685221866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=baPw7HeUNSOgBdUdX5+Wv116KVOdtz82o0yKX11s6GY=;
 b=dic8XxpkXzGf0WdugQ1RX4EMm6XdpFWj5yZUF2/iDZQDEp/9NRDQOv4iajZRb/xLiE
 IBLsexJwo4Nbh4keSwy/KNUHxnBE+jJvCIPLuZp2coHtaqdA2961mWVhxXXs5ixmIZb3
 572Zu5DyUEX2aZbHlyGSjAYiNYgeKE1ne3Vnw23DnPqlvpcoO0jTMtNXB4taAbemT7T2
 /5bNhwPGI+PFW52KwJ6IL6q0z9d0FY1hFq2JrkDXRfKLgy75D/4TQ19zpWtiLhFcBFMX
 31UpKqYyh9uXRDVp1/RbGEHP27/vzy896C6KrRVt7nG1KFz6kPas6ltt5OSr+b7BwJPB
 EAlQ==
X-Gm-Message-State: AC+VfDzKuty2j1ao7zmuAA2ILOANVFH0MIjMl84rF4hQUpX0qPnFwotc
 2Dxc6FQJF9ZMStSjORRLkTqieHaNHusL/8zfdm8PF3AEJudhRVOX6HrmEvTEdjuRa+SQp2yfSjo
 2gLf1aNxlarjxliGUpXDEkUI7d4I=
X-Received: by 2002:ac8:57c4:0:b0:3ea:bac1:a5be with SMTP id
 w4-20020ac857c4000000b003eabac1a5bemr4760091qta.42.1682629845243; 
 Thu, 27 Apr 2023 14:10:45 -0700 (PDT)
X-Received: by 2002:ac8:57c4:0:b0:3ea:bac1:a5be with SMTP id
 w4-20020ac857c4000000b003eabac1a5bemr4760042qta.42.1682629844982; 
 Thu, 27 Apr 2023 14:10:44 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 y11-20020ac8128b000000b003ef6582d971sm4947634qti.47.2023.04.27.14.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:10:44 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Raspberry Pi)
Subject: [PATCH v10 6/8] bcm2835_property: disable reentrancy detection for
 iomem
Date: Thu, 27 Apr 2023 17:10:11 -0400
Message-Id: <20230427211013.2994127-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230427211013.2994127-1-alxndr@bu.edu>
References: <20230427211013.2994127-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.79; envelope-from=alxndr@bu.edu;
 helo=esa6.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: EHq5pZzPQLHt

As the code is designed for re-entrant calls from bcm2835_property to
bcm2835_mbox and back into bcm2835_property, mark iomem as
reentrancy-safe.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/bcm2835_property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 890ae7bae5..de056ea2df 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -382,6 +382,13 @@ static void bcm2835_property_init(Object *obj)
 
     memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_property_ops, s,
                           TYPE_BCM2835_PROPERTY, 0x10);
+
+    /*
+     * bcm2835_property_ops call into bcm2835_mbox, which in-turn reads from
+     * iomem. As such, mark iomem as re-entracy safe.
+     */
+    s->iomem.disable_reentrancy_guard = true;
+
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(s), &s->mbox_irq);
 }
-- 
2.39.0

