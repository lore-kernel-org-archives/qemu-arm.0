Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp146279ejb;
        Wed, 31 May 2023 20:20:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5P6Gj3mVLIFmD60R4FoJNWAsaNbcTl/WIYlE6e459+yJBHJ4hCp2MP2c0Iai7AaWSZv2qL
X-Received: by 2002:a05:622a:1193:b0:3f2:1f63:2b24 with SMTP id m19-20020a05622a119300b003f21f632b24mr727463qtk.2.1685589599930;
        Wed, 31 May 2023 20:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685589599; cv=none;
        d=google.com; s=arc-20160816;
        b=RgCICcALaQ8knl6FysskO9R9W3vAUAjBF17YAOvGB3pC6pIUipV/EB+pAY9iaUzBQU
         k+bWpr3qyri28pVymIvHb+dRjo50i47BxVnY8f2KIBXKwVenlV1loIsJWb9BKwgknEZ2
         eDivBewrm0ydcTK5NIoTXyKsdOJ8MgDEH3lfIHce2UNMJwWTx/3sCfLOfhBHx74jKE6K
         zR+1V/JB5lOrevFV8nucp+7QHMFfBoTCN1/qhkj1+x+ao3FUGiGPX/gaHDKXGB/rqqSd
         qENNYNyzpOnWM5Dlx4NK0JRnhhFRlScRWZQdUioruoMzr4JshLb/hVapf5xDYmMFKDnV
         YeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zmIxJv/RQZ1r+yT76IboD8L/ibu/PXdMmNY/Ba4zw4E=;
        b=pDAEfb5EPnY1kqZChx8u3MZsx2U9P1ujOWl7cRuRvwEINsLGOPSQGcOqomAoAjLXk0
         k0nMUhPeSsjZv6L3qROTYo6KbIPTDx7ISyf7Zh/XcRISYbKo9oXdOKzRrE+zay1yMVr2
         uQeryDguz1pSIv3TjFsxy0R7rupxGBxValo6BNNP+NDdcaM9k080B99RrlXa3ZbFEdBg
         F+QjUpM0Wcch2NNFJIQnNpO+WQqUp6dw4L/9XIp5GvklbIbJn3r9+Fk8arONqWC4srlg
         rWKMgN8nID9ABegpodSMZX5yUbTcIQbcw6YFKL80rkknmjSX1/I4egEjZ/89OP2G20s8
         t1og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=LifDaFHs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020ac85b4a000000b003ef5a23a3a4si9584003qtw.418.2023.05.31.20.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 20:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=LifDaFHs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Yqb-0007Pb-UO; Wed, 31 May 2023 23:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1q4YqY-0007Oy-PU
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:19:30 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1q4YqX-0003Dy-8c
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:19:30 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b065154b79so13060675ad.1
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 20:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1685589568; x=1688181568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zmIxJv/RQZ1r+yT76IboD8L/ibu/PXdMmNY/Ba4zw4E=;
 b=LifDaFHsjEizUqk1VXUEMNKpYG+2uFwQWZ6WmhqcXRIokhq+sF0/tOYP3m8p66m5Sw
 ixVkHy6LMbrBelnPG8Q1Q9VRLCT+uqGDYCGM6cpIlvIhSQ3FFZGbw6zk85tp5GfS+ldw
 Da0krCI3eNH0oCEHagqgTjS5JGpkwahp96+PqTHoZpg3dydVTmpmjawNVceSXeK03RKl
 uDHry/5Rb534a/JTOwsP6b8N7HJmZpCpM7hLTgB3X2valR5fHWq29yMLiL9qGTiqTqCE
 IGUaKyP4J9vbFD+3AyXaVCi4WEEzIHEifi3LI1MYz+fnnZmTcLeNYfg5/h7F5O8KGHQI
 qzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685589568; x=1688181568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zmIxJv/RQZ1r+yT76IboD8L/ibu/PXdMmNY/Ba4zw4E=;
 b=HFgNOAqzMxYCBL5qbYM9jbdog2OV4HvJcf9CBOMIv4uCdC+OLOqeBab9VrIiPKhCJP
 PqDbi8lKSC0KxnYXP9iXrnru3c5hKb6gZMlZVV7iAoxHHbdjMHS9vRcJqKIZ6uGbnvLd
 /6L70hy/1I9jVVKI+ptm1qmHkc/YI9c0xzYKtgv0OyJ1gq5W1fm/GVWzQoJGRu09MO1T
 oL63Par/3cW85/rscvlJ8LlXXnf4LMVQDgJRZyTCMolPK4Z5hyjWGacln6j8PfMiS4KB
 unhRyM4LlPvkpe8A3ES5kjuI25QNlxTclZKyF64bfTlOW9kcQXzTcF50hO4dwK7pvkuT
 EKsw==
X-Gm-Message-State: AC+VfDz5Sn/m4bdFg3y6umj88Q4sBx1xAYycmOk1W/NBYJix20WNMLSq
 K3ZNK2hOjmRzXALStkZzOp6uKA==
X-Received: by 2002:a17:902:daca:b0:1ad:d542:6e14 with SMTP id
 q10-20020a170902daca00b001add5426e14mr680893plx.12.1685589567904; 
 Wed, 31 May 2023 20:19:27 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 jd5-20020a170903260500b001a245b49731sm2146753plb.128.2023.05.31.20.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 20:19:27 -0700 (PDT)
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
Subject: [PATCH v2 2/2] net: Update MemReentrancyGuard for NIC
Date: Thu,  1 Jun 2023 12:18:59 +0900
Message-Id: <20230601031859.7115-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601031859.7115-1-akihiko.odaki@daynix.com>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: wx3iEpP7r+Ly

Recently MemReentrancyGuard was added to DeviceState to record that the
device is engaging in I/O. The network device backend needs to update it
when delivering a packet to a device.

This implementation follows what bottom half does, but it does not add
a tracepoint for the case that the network device backend started
delivering a packet to a device which is already engaging in I/O. This
is because such reentrancy frequently happens for
qemu_flush_queued_packets() and is insignificant.

Fixes: CVE-2023-3019
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/net/net.h |  1 +
 net/net.c         | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index a7d8deaccb..685ec58318 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -124,6 +124,7 @@ typedef QTAILQ_HEAD(NetClientStateList, NetClientState) NetClientStateList;
 typedef struct NICState {
     NetClientState *ncs;
     NICConf *conf;
+    MemReentrancyGuard *reentrancy_guard;
     void *opaque;
     bool peer_deleted;
 } NICState;
diff --git a/net/net.c b/net/net.c
index 982df2479f..3523cceafc 100644
--- a/net/net.c
+++ b/net/net.c
@@ -332,6 +332,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
     nic = g_malloc0(info->size + sizeof(NetClientState) * queues);
     nic->ncs = (void *)nic + info->size;
     nic->conf = conf;
+    nic->reentrancy_guard = reentrancy_guard,
     nic->opaque = opaque;
 
     for (i = 0; i < queues; i++) {
@@ -805,6 +806,7 @@ static ssize_t qemu_deliver_packet_iov(NetClientState *sender,
                                        int iovcnt,
                                        void *opaque)
 {
+    MemReentrancyGuard *owned_reentrancy_guard;
     NetClientState *nc = opaque;
     int ret;
 
@@ -817,12 +819,24 @@ static ssize_t qemu_deliver_packet_iov(NetClientState *sender,
         return 0;
     }
 
+    if (nc->info->type != NET_CLIENT_DRIVER_NIC ||
+        qemu_get_nic(nc)->reentrancy_guard->engaged_in_io) {
+        owned_reentrancy_guard = NULL;
+    } else {
+        owned_reentrancy_guard = qemu_get_nic(nc)->reentrancy_guard;
+        owned_reentrancy_guard->engaged_in_io = true;
+    }
+
     if (nc->info->receive_iov && !(flags & QEMU_NET_PACKET_FLAG_RAW)) {
         ret = nc->info->receive_iov(nc, iov, iovcnt);
     } else {
         ret = nc_sendv_compat(nc, iov, iovcnt, flags);
     }
 
+    if (owned_reentrancy_guard) {
+        owned_reentrancy_guard->engaged_in_io = false;
+    }
+
     if (ret == 0) {
         nc->receive_disabled = 1;
     }
-- 
2.40.1

