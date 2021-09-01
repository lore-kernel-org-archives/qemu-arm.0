Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp453638lfb;
        Wed, 1 Sep 2021 05:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziADZgji0VBUKtVoXzRZHAZ1FOHz4ivjMKQMzzYAwxVLpjONfCE1/41gYptoKNbsY1S8Jw
X-Received: by 2002:a02:9698:: with SMTP id w24mr7918662jai.108.1630500627408;
        Wed, 01 Sep 2021 05:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630500627; cv=none;
        d=google.com; s=arc-20160816;
        b=QGi1eG2s5Q098Y0rVJq1EhFKTWGfLWnzu/3O4MQE2tDXHd5BSyCRdPoNrmWl77y9UA
         0vz7JFXA+NG4+ReSzIZ/gQ3x0afPRpK+Y79Njo2SMQ4XO9J0pXrlw/e7obMPfaR0Pevo
         q8zIbAQJoJjVszEcLsvppGATBkTlE8v0Amtu78AVhxbGE3kVEr1l0EyDishlfsHtbR2+
         Tq3WPJst7QRnUS3S3Vdcg2bfWJlQFOTtG+1mvTzR+w9WmrSwN7P8/oRf5CyeBJQwdNq3
         PPRtGpo7XH3Jlj3Lpn8e9On2tZeMhQfdQbqGMKdrLJZ4Yj1LHfdXA5/bYS+7tjIYPcWm
         YQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iwqv3rn3ZLXoG5hEsp2R8ezKy0ImKKf4Ph1gMyrL2HU=;
        b=tb0byhoM/Lhlf0wgMzeFEjsZN9xghd00u2kYzPYRXwIDYCWHRdJ0Ts7nyqaRZRQgvM
         4pNGFKB7M3sOGWHDHTMk/iQkkoehkrQM0T/RzTWFuzKN7bg9txSS0UsO/Y6mtyNyUHM3
         KQprmp49+M4GRtpmS1XKX7eKofMeGoBG85phhMKxvqupzpG+Fi0yJhtGgR+XVawstPdJ
         bhQBz1xj24IsyJfGZJ1wskCOpgCib5bEXt1XmGjrNQWmG5E/kzXtzNxrCcpBDgkA6mpd
         uAMUqECrn8iRUZmoaPVCBd8MMvfrGzRt1bwjalzdQArk0ybP9wShmWktSTVLkqnC1D0/
         V8DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=domoZ+gy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si25369566ilo.128.2021.09.01.05.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 05:50:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=domoZ+gy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLPhC-0002f3-Oo
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 08:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcf-0003bX-Pz; Wed, 01 Sep 2021 08:45:45 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPce-0003cJ-79; Wed, 01 Sep 2021 08:45:45 -0400
Received: by mail-pl1-x630.google.com with SMTP id n4so1413021plh.9;
 Wed, 01 Sep 2021 05:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iwqv3rn3ZLXoG5hEsp2R8ezKy0ImKKf4Ph1gMyrL2HU=;
 b=domoZ+gyU3iQRlpMhIMhkYEPtPnqY56xMUVABpdsa9dcVfv6PcFR56tqbFzZUrEVd+
 gQwSezynAPDTrGGhqFcuAZwYCWWsjXFmcCYLAejzGznnyVN54Ru9c/ffEkgD8lvN5kGV
 BXKWyyjWNma7y5firYQ01l0kllsGKZ1ANZ0hjC6Ogdzpvvz424K8u1UKR+VvSJllzpZf
 xqoiTatwKwdpyfa1ILdQrWbKDJRSmYUPrq0xkiqwFY7GcA37ovAuNhsvIMX6kTXppk74
 F/GQ5+SEHvF6hm6INv5ipU0de/H5cECyFCuwEVxlhW6g1cBzGsNx2GmA/ArBFrpb7bsU
 IQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iwqv3rn3ZLXoG5hEsp2R8ezKy0ImKKf4Ph1gMyrL2HU=;
 b=nMxQBKJEOB+AtXiKwQHQphOYyq0eg+2KRNnXpn+8h3RigQcj3J4AE6dIFLZTAzGIl9
 4Dfhy9TtsVu6vukRfjHNLHtX2MP4Hyy7aH+N3vMUjhGIUs0pi8upQPoHxt/VPi4SF8Z4
 vatlJdVQzjZOBJWMQ+ZoZr0kcLUqFFZsxKej/Fxe7DpYKLDL/UWGRRwoj4V+PBEYGqvB
 a523H3n6oXUMHQvCLJw2XjVByEnN5d2ixp9x+M1V1GskIQaDqw1yUHGhAknm4zhJ5fkq
 Y9wOi7AFO8HCVsS6m388anABn8PTwtAwTFgzrh4ywLVU8sQ5WuASe5mkAv2rbxFYJnbN
 T+fw==
X-Gm-Message-State: AOAM530CCHkR4TuMaaANSOzm5v66d9CnQpiN9eDBTWH6jIFnNonz5QY7
 DrIUstPNzHIob0wX0sC4WtY=
X-Received: by 2002:a17:90a:af92:: with SMTP id
 w18mr11348401pjq.98.1630500342574; 
 Wed, 01 Sep 2021 05:45:42 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d22sm20917134pfq.158.2021.09.01.05.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:45:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 5/6] hw/char: cadence_uart: Ignore access when unclocked or
 in reset for uart_{read, write}()
Date: Wed,  1 Sep 2021 20:45:20 +0800
Message-Id: <20210901124521.30599-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901124521.30599-1-bmeng.cn@gmail.com>
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5dNId+4IhPEc

Read or write to uart registers when unclocked or in reset should be
ignored. Add the check there, and as a result of this, the check in
uart_write_tx_fifo() is now unnecessary.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

(no changes since v2)

Changes in v2:
- new patch: hw/char: cadence_uart: Ignore access when unclocked or in reset for uart_{read,write}()

 hw/char/cadence_uart.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 8bcf2b718a..5f5a4645ac 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -335,11 +335,6 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
 static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
                                int size)
 {
-    /* ignore characters when unclocked or in reset */
-    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
-        return;
-    }
-
     if ((s->r[R_CR] & UART_CR_TX_DIS) || !(s->r[R_CR] & UART_CR_TX_EN)) {
         return;
     }
@@ -416,6 +411,11 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
 {
     CadenceUARTState *s = opaque;
 
+    /* ignore access when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return MEMTX_ERROR;
+    }
+
     DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
@@ -476,6 +476,11 @@ static MemTxResult uart_read(void *opaque, hwaddr offset,
     CadenceUARTState *s = opaque;
     uint32_t c = 0;
 
+    /* ignore access when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return MEMTX_ERROR;
+    }
+
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
         return MEMTX_DECODE_ERROR;
-- 
2.25.1

