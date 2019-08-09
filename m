Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8848442wrv;
        Fri, 9 Aug 2019 00:26:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPDxPwFOIXa+LLFJVOzGVcW1kDMvfBJF+kSO5Qg+ICIAR9t6KbCBU401cZ6j4mlSaWGD8Q
X-Received: by 2002:ae9:f019:: with SMTP id l25mr17051670qkg.473.1565335561030;
        Fri, 09 Aug 2019 00:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565335561; cv=none;
        d=google.com; s=arc-20160816;
        b=be+xXyQPlbu9TY+VcSOCvQpEBNK4p8MQ7gpKTchR4IxDw+77sTQMKGD0Nm3CCf/Plv
         4uEKFZQ18MSBusixCKegywoPhCd4cIf8D3veTHVMFuMHVwAF02XRqO5TSQIOLzbDOM18
         Rw2Eyr3Wjqes6OK9gZ4CMsZxQ+5xBBOUWKPeXcr3ggdxIiYhopjbDNlpJOK2/Cxotifl
         cb/m6tuxpw2gfSvXTAEmi0IbBouvo6Um3t9lKLs5rnWW0ubsrFc+ev1HSF1X/zD57gxL
         06u9V/b/cR/zZR0lblaN/MKzwRuv+KWIOHB8Ucn6TK31ymchJKycXZdzsD9B8SMyXVDI
         aO0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=5/4YpSmtyH6BPG/1zxeAbgDZu4GjwrumofWYP4xdKQY=;
        b=CRACuwjiLNMLOIkunltTwSIedf3KIfgVC/GRYXNeSJAMecL5F1LMppTim62TSwrbC5
         NJ5TW9FAgkT0Uz358/zoBuCTIHD7YSrvWEOyz/nIq2DcwB7eywJ3AqzIIRGnu1qWuEGE
         pT5syOJhJFpdeCvMfFtuzIZ+ncVUWZmGueXsFkLZU0hzQ2f5raKbV/6FX+3J58k5iVpj
         syPgYoHukJ2E9zACp2nsyF8AcRzNaxTh9qmtS64wTD3NVj/5l5DS8f44O1NhqVjExteH
         xss1NUwDyDGpfOtK+CTimNlSJ0VMD/y7UcvDNxaYqNhQ4gqjCZ7X7aH6z6izdPahOybZ
         /Dkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VH/KPdqi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si34504888qte.59.2019.08.09.00.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 00:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="VH/KPdqi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvzHk-0005or-Jo
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 03:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54899)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvzHf-0005mm-8x
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 03:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvzHe-0004qc-8e
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 03:25:55 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42201)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvzHc-0004nN-01; Fri, 09 Aug 2019 03:25:52 -0400
Received: by mail-pg1-x544.google.com with SMTP id t132so45411970pgb.9;
 Fri, 09 Aug 2019 00:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=5/4YpSmtyH6BPG/1zxeAbgDZu4GjwrumofWYP4xdKQY=;
 b=VH/KPdqi0FaG48FRDSK+vM5KAXQS8jE+xWiReCSwkZ7nXaY0y0CCpQOO4lDxzd0+z3
 oKMrQB8sfkKqAu3bUAtm/VLY++MxMrdKBp29rplxndBW3agiRrIXf1pMwgw7fujOni3d
 xh6V2Mfhn3AvA51XJ2W3IHpnjO1H1MN8P51gHosPUUgQdgm4twFK/OqxHPTFf8aMQByj
 zxmO8o2VWAbVuBFA3MZmfNKqd+dS8ZEy2vQWgQLYEIXjN2oE6JaKLB4/qQ/hR0oSDTCw
 scvTY6BexA2AXmgIGun/xI9YYDxh8y1bDF7MpQAcx1DRYR8fV6KB7560emBDLGIE0h/Z
 C3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=5/4YpSmtyH6BPG/1zxeAbgDZu4GjwrumofWYP4xdKQY=;
 b=hADxK/mzo06JTm9knmuS07Cj2PTSew2V4LHgti2C4kjZPkcv500NDq7s+TMW/2+NCf
 3/lXAGQd0yifyKr0dgM7QsHHFfrvWHcgDfWULThXZ7LJeb2xOHDgYP41hxF0eqNpnr+l
 RBQlH7Ka68zaThJ1ZhFR0ggmp+sxA0ZypxFFvu97sghTfINlJZEIMZkF2qSPrROftEm5
 Opj+SRrH+TMN1fckVUbuFmjvNQkWLicARoiqPcTsoZ6IzrlcmL4/A9fjXcYLCTjgg6Nu
 PcRi/lTYnoK1aQp9S6waTxEy5OWFExMTWO2574HePsiymvLQraHBwJx7TlAiHcjXTy+I
 S2Qg==
X-Gm-Message-State: APjAAAXhVjYd/urK/ZpxSxwMwP3j8zfJ12rn02co6pOFrL7UU+/+63o5
 Yfmn5+r7uMpPbnD94q10Q60=
X-Received: by 2002:a62:be0c:: with SMTP id l12mr20039945pff.224.1565335550279; 
 Fri, 09 Aug 2019 00:25:50 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id 23sm100737693pfn.176.2019.08.09.00.25.49
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 09 Aug 2019 00:25:49 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Fri,  9 Aug 2019 00:25:44 -0700
Message-Id: <1565335544-23584-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH v3] hw: net: cadence_gem: Fix build errors in
 DB_PRINT()
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9nivKDcWPW4x

When CADENCE_GEM_ERR_DEBUG is turned on, there are several
compilation errors in DB_PRINT(). Fix them.

While we are here, update to use appropriate modifiers in
the same DB_PRINT() call.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v3:
- use PRIx64 as rx_desc_get_buffer() returns uint64_t
- use %u for unsigned
- remove unnecessary cast in DB_PRINT()

Changes in v2:
- use HWADDR_PRIx instead of TARGET_FMT_plx for consistency
- use 'z' modifier to print sizeof(..)

 hw/net/cadence_gem.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index d412085..e26ff98 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -983,8 +983,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
             return -1;
         }
 
-        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
-                rx_desc_get_buffer(s->rx_desc[q]));
+        DB_PRINT("copy %u bytes to 0x%" PRIx64 "\n",
+                 MIN(bytes_to_copy, rxbufsize),
+                 rx_desc_get_buffer(s, s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
         address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
@@ -1156,9 +1157,9 @@ static void gem_transmit(CadenceGEMState *s)
 
             if (tx_desc_get_length(desc) > sizeof(tx_packet) -
                                                (p - tx_packet)) {
-                DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
-                         "0x%x\n", (unsigned)packet_desc_addr,
-                         (unsigned)tx_desc_get_length(desc),
+                DB_PRINT("TX descriptor @ 0x%" HWADDR_PRIx \
+                         " too large: size 0x%x space 0x%zx\n",
+                         packet_desc_addr, tx_desc_get_length(desc),
                          sizeof(tx_packet) - (p - tx_packet));
                 break;
             }
-- 
2.7.4

