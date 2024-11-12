Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7534943njc;
        Tue, 12 Nov 2024 10:12:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6tHFeg2m3NiuZzkSobEGBv0tlmEsGnqA+rsxnlpcQGlPeXoQvH/8ZsW3e/5AvcJ6xnSddNEUWlEkOOg==@linaro.org
X-Google-Smtp-Source: AGHT+IE6gl5ZE25U1iz0uOOr1LmB7K4i5SRM2aZuMTRfKkVwdaYagogVpUBZ8r8a60A9hm0sSVEU
X-Received: by 2002:a05:6102:3a0d:b0:4a4:7c8d:2a87 with SMTP id ada2fe7eead31-4aae13c16a9mr16792461137.16.1731435177648;
        Tue, 12 Nov 2024 10:12:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435177; cv=none;
        d=google.com; s=arc-20240605;
        b=NqOh+eO1uc+SuiB6kzVrU2IqhQdjs6H2/Qr+mhYrlMXLdzomIGmOePf2en8m+tOwdc
         +oo6xNXP3lH/7L7rFfk+Gns6NRutaTLQBO1e6vhvgU6OXYOaHUw3CTiYZRAecmsJxk1p
         ecj7M2M+UsL8ThYg6F/QqaodYslOpyHiZte5HtTcEJSdWFr6KlKgEVhDCwBLjpzG2Jq9
         wWL7dg1LqK78AGI6efxeiCHhr/Lt5XCcqOvnv5xttrRvEzVG4RiWfzj1pwdUlOkPhxoz
         VjNcrQXuty6aaeU9cC/eiJRAKT0HP5A+PwywydWgBh/6/zfyoC87B0fQ7Wbq+uar/vQl
         w3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=90u2pbXGOCmIRt7v1T1RJKt/kgJQ6BpSNcFSvHFisE0=;
        fh=Px+oEeU4UNBSlFDVO3vbcNtVd6BQUY+H6gDZ+ChCbO8=;
        b=MNDWKYk5g3+Y/yrySo3PtkeLWXLYEwTOVApvDNu4Ah2Xpkx2wzpLKGRpLbWPZYzCJq
         DEIqoCnQ9KpBDYJF3UysdsP6QdPygZzjAOzfFgPGzqJHG3JqZ7BKkW9NAPWatBR4wbK6
         f78MFNZOll+4ypuh4G3tTYol++k28MDplOzAtpkXJKi9fndjPZVUjxy/cY8h8kr7y42w
         HCE1AnpRUvPw3pANT60/89eISaRU8IFjmkTWWh01syRFY3NUFqvVjAdMn9WtbfP1Emek
         l202sKa9CKcsvBvEaFNpsa891njpVIyKhMNlnSCuAmERpYlnYo3TrGoXkQ8EDy5s/oDJ
         N12A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=STnerbud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aaa7ba9994si3275173137.384.2024.11.12.10.12.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:12:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=STnerbud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvNF-00060W-N4; Tue, 12 Nov 2024 13:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMy-0005TN-4d
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:12:07 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMu-0001yg-5z
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:12:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso75272675e9.3
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435117; x=1732039917; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=90u2pbXGOCmIRt7v1T1RJKt/kgJQ6BpSNcFSvHFisE0=;
 b=STnerbudDb1Q7FXX+K8frKsaQz4r7B+S/PkQdELdzfO03HGTBozhsjoTR/i4qG7eiJ
 aS8IkvFB6CGndI3zTB6oEYtp5HLjYR6V8aUqF+qu5I7AI6Tr1LVSkxuW8Act0oO9rAaC
 Gecuyqa7V49bnFKxPEUm3vAayM/pIv2/xwLgpcfY+T3lUrDgfqDo/bhuu92ptUa5Yv+q
 2yNBOBVNBCeqHFcTDrXB65YXvhRXgXPlH5EJAkoJ56qgfSz7lWW0fttl3I9hfiM7umMS
 7RxZnU+lbV0Ky5n0pfCZNNP+NnEhhrfLp6/RuR8b94DXUF8P8jJoo6tBRYh/TPoE9jgi
 a6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435117; x=1732039917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=90u2pbXGOCmIRt7v1T1RJKt/kgJQ6BpSNcFSvHFisE0=;
 b=PPxrJNOvzYSk3Ukvphv6PvCwXheZfE5ni3WrydI+To/f8OQ72+rek2Yfc6Xsz7Bbcn
 WJ+8rmeB7AmLw9+gO0Gm5G9iqk17OnldsI9AO++2KAKZ8W/PBbDQIfehpwaQyF6k5LZL
 RRAn9BbenOrPkZWFH/0pU8P4GbhgMEr2Os7bSkq1U4/FRWufI7GYiQX53A2k0G7Sv6VC
 BTZIzhe5wWk584OE186TpDcG57SO73VOWIcF5At4EfzqU8Btllka9EPkBaRPtYKvdX0S
 S60o22eF24PM6T6TOrKNQn3iXvKvT/zdYFux6VKjc4eZlho+So5M79oEG2bd900FQPG6
 jwNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrS+Qm900mGuvuusgRGRg5gN0NVCXMXIsxE0YputqEJyKM94WQuPoosqvaOayvkfupuRmVhr1IKA==@nongnu.org
X-Gm-Message-State: AOJu0Yz+RjsZX5KL4V9XHC42CNURBKNzfpdUw4xXj9wxv99XslPeCHjZ
 E5VYQ4ODMM5yu/lG1cOm7GjgHOdsbfUhLkkaNAxKjJFCc2YUQ780kjm0oJbN5bo=
X-Received: by 2002:a05:600c:3c99:b0:42c:ba83:3f00 with SMTP id
 5b1f17b1804b1-432b74febf4mr191045485e9.1.1731435115823; 
 Tue, 12 Nov 2024 10:11:55 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05e5871sm219236105e9.37.2024.11.12.10.11.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:11:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/20] hw/net/xilinx_ethlite: Access RX_CTRL register for each
 port
Date: Tue, 12 Nov 2024 19:10:35 +0100
Message-ID: <20241112181044.92193-12-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 21fen1kGtpGN

Rather than accessing the registers within the mixed RAM/MMIO
region as indexed register, declare a per-port RX_CTRL. This
will help to map the RAM as RAM (keeping MMIO as MMIO) in few
commits.

Previous s->regs[R_RX_CTRL0] and s->regs[R_RX_CTRL1] are now
unused. Not a concern, this array will soon disappear.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index fdbf25fd91..605451a522 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -59,6 +59,13 @@
 #define CTRL_P     0x2
 #define CTRL_S     0x1
 
+typedef struct XlnxXpsEthLitePort
+{
+    struct {
+        uint32_t rx_ctrl;
+    } reg;
+} XlnxXpsEthLitePort;
+
 #define TYPE_XILINX_ETHLITE "xlnx.xps-ethernetlite"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxXpsEthLite, XILINX_ETHLITE)
 
@@ -76,6 +83,7 @@ struct XlnxXpsEthLite
     unsigned int port_index;
 
     UnimplementedDeviceState mdio;
+    XlnxXpsEthLitePort port[2];
     uint32_t regs[R_MAX];
 };
 
@@ -110,6 +118,7 @@ static uint64_t
 eth_read(void *opaque, hwaddr addr, unsigned int size)
 {
     XlnxXpsEthLite *s = opaque;
+    unsigned port_index = addr_to_port_index(addr);
     uint32_t r = 0;
 
     addr >>= 2;
@@ -121,11 +130,13 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
         case R_TX_LEN1:
         case R_TX_CTRL1:
         case R_TX_CTRL0:
-        case R_RX_CTRL1:
-        case R_RX_CTRL0:
             r = s->regs[addr];
             break;
 
+        case R_RX_CTRL1:
+        case R_RX_CTRL0:
+            r = s->port[port_index].reg.rx_ctrl;
+
         default:
             r = tswap32(s->regs[addr]);
             break;
@@ -173,7 +184,9 @@ eth_write(void *opaque, hwaddr addr,
             if (!(value & CTRL_S)) {
                 qemu_flush_queued_packets(qemu_get_queue(s->nic));
             }
-            /* fall through */
+            s->port[port_index].reg.rx_ctrl = value;
+            break;
+
         case R_TX_LEN0:
         case R_TX_LEN1:
         case R_TX_GIE0:
@@ -203,23 +216,21 @@ static const MemoryRegionOps eth_ops = {
 static bool eth_can_rx(NetClientState *nc)
 {
     XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
-    unsigned int rxbase = s->port_index * (0x800 / 4);
 
-    return !(s->regs[rxbase + R_RX_CTRL0] & CTRL_S);
+    return !(s->port[s->port_index].reg.rx_ctrl & CTRL_S);
 }
 
 static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
 {
     XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
     unsigned int port_index = s->port_index;
-    unsigned int rxbase = port_index * (0x800 / 4);
 
     /* DA filter.  */
     if (!(buf[0] & 0x80) && memcmp(&s->conf.macaddr.a[0], buf, 6))
         return size;
 
-    if (s->regs[rxbase + R_RX_CTRL0] & CTRL_S) {
-        trace_ethlite_pkt_lost(s->regs[R_RX_CTRL0]);
+    if (s->port[port_index].reg.rx_ctrl & CTRL_S) {
+        trace_ethlite_pkt_lost(s->port[port_index].reg.rx_ctrl);
         return -1;
     }
 
@@ -229,8 +240,8 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
     }
     memcpy(rxbuf_ptr(s, port_index), buf, size);
 
-    s->regs[rxbase + R_RX_CTRL0] |= CTRL_S;
-    if (s->regs[R_RX_CTRL0] & CTRL_I) {
+    s->port[port_index].reg.rx_ctrl |= CTRL_S;
+    if (s->port[port_index].reg.rx_ctrl & CTRL_I) {
         eth_pulse_irq(s);
     }
 
-- 
2.45.2

