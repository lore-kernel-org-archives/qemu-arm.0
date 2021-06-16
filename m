Received: by 2002:a05:6214:c86:0:0:0:0 with SMTP id r6csp1058725qvr;
        Wed, 16 Jun 2021 09:22:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0U8u0WWwhmQzDA0bd5Jrw7T/8MUZMBLWRACpm8T5y3uHJtWSN0/r9oCVFDbKm+oVI4DFv
X-Received: by 2002:aa7:dd0b:: with SMTP id i11mr552992edv.51.1623860521856;
        Wed, 16 Jun 2021 09:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623860521; cv=none;
        d=google.com; s=arc-20160816;
        b=HRi6NR8XKDS4HSWXxGyHyWvS6a4YsrMOPi4FtECSFgFRVIcs5pgpOmBRBu0n0JG3lZ
         UheHJBTLq5lQ53WLw+0rWeFX8BeCZ2q2BfjydOdzz9DTrAl9i3VsptAYf9Te6JeWqk/v
         IJS2T2JXOzOy/6eS+ZksThPx4kf8odJZ8zUbLw5xRks1GAKwZoWazarqwscS9GEm3aX/
         wVSAUIAjNjYUQIP0qZw4vlQaiYMyjSt2fNWOz9uTPpr6nz/TEmY3bCcEiEs5Kp00tENm
         ZqnsxQ9Nq+EgmE9KDuS4DRk8nu6a1FyHIAZxCobIccqvICPL6jV45vPggBmvme8hbzV4
         icTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xiYohDNx8TlWsyn3BtTL6DGqTBwgAW/ROdRkO4E8HY4=;
        b=h5KQPBNMGatoSIHs55nu0VRge5lfkY1lLhlnEAUUefMMb24YzgfsKJFTatOU97k9VM
         QSIyOK1gaDT+5MvMrGFZh0fpqtoeLRUhuw1pOyjqArce12MKyw5F7ELynv1uIuWnxqQB
         gRuzaUG5gobr3HpsQXJeAVH22A8Cd5AIOLBIkNi2a6NdzLz7tyMlMg8tBZMoMuLtwnau
         y73QiMzxYCavU56uD3P7r+qm+YslZwZ0zrInHg1cPlDNO+8tLX7sYii3mSPOdQgwybYo
         BxLmwS6ifXnlkFVCr9UbFWfUU0rMq85EigdeGQQb6r8UFCOrfrLLtLk+r5P4gt80kebE
         XFOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aOtuR9WI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3si3111407ejj.448.2021.06.16.09.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 09:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aOtuR9WI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltYIi-0006Su-Kf
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 12:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBu-0002zS-C9; Wed, 16 Jun 2021 12:14:58 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBs-0005zm-PV; Wed, 16 Jun 2021 12:14:58 -0400
Received: by mail-wr1-x432.google.com with SMTP id r9so3310591wrz.10;
 Wed, 16 Jun 2021 09:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xiYohDNx8TlWsyn3BtTL6DGqTBwgAW/ROdRkO4E8HY4=;
 b=aOtuR9WIqaAD8EuWlMHLswsX7qgNibUGV9gDa9D+IJqM1HBSjtFGI0DQ40mWrk540y
 kKZZtEDPCaa0vPBcO0Yi1z6vaD86iKshbzdgvVU8b3U1sembRN7RIvFLW5uDpgf1y0rX
 csbghzGiUxhsmrMoEG8XV9alJ52ZsfOTHwbvM+Bm2sl5gx7Zke71qnGkHAp9AbBLEnvy
 NWydfgUEoTUkf64bpMXVbO28lxqOKfSsI3i/76BIvdmRjBTaHOUmFALwDjeJAPFV/DhT
 Qor5ZnHnguxIFG6sFp32DKCcsAfWdyEjIdTyoPgzTMvAe+S2Oxhvd3DeNujG3xOwJCh8
 18tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xiYohDNx8TlWsyn3BtTL6DGqTBwgAW/ROdRkO4E8HY4=;
 b=b6+rB1sy0QSpEo1LPyUjVRPU9xw4zAyk1oAiKR/Ud+yV57DrHhBPK9N9aSqBFHCjSp
 Lv4Bw9IdAb/ITj7neSikV6DMEq1h2GakwR9WjEcuZ97MeE/AWSF8eINWqZfq4JkbzKXl
 ra4ykvR/XYHRqrFs6X6sQH6hPb02gRJafRl7twsYTKoMOA3gCOzs7o6XrS0ZHQBjK42s
 BEk3amT4UaB3l2c50myPxtJKVlwdl+95rkwIREARXpHtCtk5myB6FHBkn1vmDw0DOC8a
 LmDYGjZVPoXje/AKYw3a6AHW8UKSDbMRgnAM/FP3Q5FPhJGEdBzp9hncTHvXZ0svwqG6
 5GBQ==
X-Gm-Message-State: AOAM531Q0kE4aogHqgX0CWHoBb6v1ZZ5bEabj57MVtwebRI8CmS08Nu3
 70F13xH3WVgx1v3GEjXUMgWnOxCrg/d6iw==
X-Received: by 2002:a5d:6747:: with SMTP id l7mr242368wrw.220.1623860094387;
 Wed, 16 Jun 2021 09:14:54 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l9sm2272104wme.21.2021.06.16.09.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:14:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/13] hw/misc/auxbus: Fix MOT/classic I2C mode
Date: Wed, 16 Jun 2021 18:14:12 +0200
Message-Id: <20210616161418.2514095-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WA14J2OJ9WsK

Since its introduction in commit 6fc7f77fd2 i2c_start_transfer()
uses incorrectly the direction of the transfer (the last argument
is called 'is_recv'). Fix by inverting the argument, we now have
is_recv = !is_write.

Fixes: 6fc7f77fd2 ("introduce aux-bus")
Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 6c099ae2a2d..148b070ce4a 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -139,7 +139,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, is_write)) {
+        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
             ret = AUX_I2C_NACK;
             break;
         }
@@ -170,7 +170,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -179,7 +179,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
                 break;
             }
         }
-- 
2.31.1

