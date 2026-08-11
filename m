Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C58C5B572
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 14:39:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtnao-0000oO-0o; Tue, 11 Aug 2026 10:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaV-0000Jx-A5
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:21 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnaT-0001vr-MG
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:36:19 -0400
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-8efcef23d21so22078686d6.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786458977; x=1787063777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0jXwXMcIM9domi9Vq64aJDlJVcT9DGz1pqG5naol8gc=;
 b=RjoN6LqXA7Y0ZrXVmLrygATIQFWcCaY/KLJtyZyZID1Lw1+jxKPs58BBZdtOIBXiFR
 X2EL4AJ9OS/ZdRxg8f+sh88wsEsk+dQ0fqh6cneMxSGTf6EAYILox6dDV5wUJoWl8X86
 /Bx3Ugp9WbWDGOmeQOg93o7RtcfnfeJAZfBtntztEaHNdWwGrnB7RZiEMCNCQ+ehEBQy
 MLF3mBYxKJZ4O7D/0fIB0gkQCdrzADTQz8i4zTFxq/btfxOtFMNFLTp5pFtI4Z3GZ08R
 K5DfPKDYqK9rmrDjM/5dc+L1AOE8wrSCcJTlaERD/Yer8scSp5moD4nSqEe1NiBU59W/
 0CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786458977; x=1787063777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0jXwXMcIM9domi9Vq64aJDlJVcT9DGz1pqG5naol8gc=;
 b=D0z0q4nTUiXU8HjbTNu5obTnM56EY0HgbGktpSwDDBMd+FJpfldvPSVOYJ/GTIuFGI
 KD04/PcSkHi3I9XZ0y15jpFtJaRsI39SeXyDnEEp7w3HRSiCUPlapUa+EqyUzsNQx9HP
 ypjrq/17DeURa9rQt7LBX7iKVl7/9R+n4NE/dR6impnLy6jYo61h45eUZj2LrdxbrOot
 uLMn9DFw/IBbJZMH+tQWAlhQa8URcarKTjNYygl/TwF+l7W2p+l0REB+u80VPJpZ4JER
 60PnYWdxF8x3+eFF6QPymLcQYjROT0Ap1QG6NbsPeMPl43hvhumvNb141X0xCYoHqZ3J
 M0zA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqlm7+ZUQpCxoy543k5YoJRSiJ+84vmF3UZq9v3DAih2MQOuSsU5i3+6qtX3/G2yUHYJQWZ+lOapA==@nongnu.org
X-Gm-Message-State: AOJu0YyDYy2bGXRO/W/OI98kCoGs5arOJhVT2IZWC7amBlFIGd8JWwDU
 Fwwv+wvrlJoNwmEEwxaNnLVs2RW65CrdcYCVbQhRN+vlRtdz3lhOzlql
X-Gm-Gg: AR+sD10T5dimVbVitGub0IzAEzkaz8yKCrJEHFmGagwWfAIvnzIUKwUzeQlcpJq8+Yx
 75b0CH+iOv2BhzpGev/HLumQvUq6g/IQu5Yrid4gmP0n+i7h5EUjfGjv9CnXBYZZrxWf60905fP
 j0frz0A6IlDPR+j+1vrBLsVh0Xu9wQjPUEBj1PQsLzkNgml+Bt8hvTz6gtGbeF2nWVfNBQejBM1
 7xcUj+AjSuJxIMPcD5IzdI5oK9Iv3GwYza9AapRkDoqgLyqpYTpIA0DGssFEGAHN6oMJ8vdK2F/
 mD0mCJ6bZvGjzFnCUw3rR653CBKOCa5i0SVgTRAYXYI1my+E5WYmYUGziz/oUUw+EhBaflStDns
 RvyNp4OSZB+5Em6xcXQwCoiCdQHM4wdMjAaCXerv+Pv+3QXLZs9AHjiHMofT8HXM4dLK392/+f1
 /myMkKPQkTZNRmcwcYrdDDvQXbTe1fwcdM0SFtWqkJFsalvrjA7TVZXh3rWvgCjhkS7mPOeEob7
 AZlRZUWRSji53xWbqU=
X-Received: by 2002:a05:6214:404:b0:8ef:cfa:2a36 with SMTP id
 6a1803df08f44-90a6681f28amr34221656d6.9.1786458976516; 
 Tue, 11 Aug 2026 07:36:16 -0700 (PDT)
Received: from localhost.localdomain ([198.16.145.87])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90a6c26e074sm681286d6.2.2026.08.11.07.36.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 07:36:15 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v2 16/19] hw/net/bcm2838_genet: fix bogus RX checksum reporting
Date: Tue, 11 Aug 2026 10:35:53 -0400
Message-ID: <20260811143557.7862-17-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260811143557.7862-1-marcelomanzo@gmail.com>
References: <20260811143557.7862-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

bcm2838_genet_rdma() reported the received frame's IPv4 header
checksum (in host byte order) as the descriptor's rx_csum value.
The guest driver's CHECKSUM_COMPLETE path expects a running checksum
over the L4 payload there, not the L3 header checksum, so the
mismatch made the guest reject otherwise-valid inbound packets
("hw csum failure" in dmesg, from bcmgenet_rx_poll()), breaking
DHCP and general connectivity intermittently.

Report no hardware-computed checksum instead (rx_csum = 0), which
makes the guest fall back to verifying checksums in software; this
succeeds since the packet data itself was never corrupted. Drop the
eth_get_protocols() call and its output variables along with it,
since isip4/ip4hdr_info were only ever used to compute the checksum
value being removed here.

Confirmed with the guest booted repeatedly: "hw csum failure" no
longer appears in dmesg, and ping to the gateway succeeds with 0%
loss.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 hw/net/bcm2838_genet.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/net/bcm2838_genet.c b/hw/net/bcm2838_genet.c
index dfdc5ac728..ccf3c2fef0 100644
--- a/hw/net/bcm2838_genet.c
+++ b/hw/net/bcm2838_genet.c
@@ -828,12 +828,6 @@ static ssize_t bcm2838_genet_rdma(BCM2838GenetState *s, uint32_t ring_idx,
         MemTxResult mem_tx_result = MEMTX_OK;
         uint8_t *frame_buf = dma_buf + sizeof(BCM2838GenetXmitStatus) + 2;
         BCM2838GenetXmitStatus *xmit_status = (BCM2838GenetXmitStatus *)dma_buf;
-        struct iovec iov;
-        bool isip4, isip6;
-        size_t l3hdr_off, l4hdr_off, l5hdr_off;
-        eth_ip6_hdr_info ip6hdr_info;
-        eth_ip4_hdr_info ip4hdr_info;
-        eth_l4_hdr_info  l4hdr_info;
 
         bool crc_fwd = FIELD_EX32(s->regs.umac.cmd, GENET_UMAC_CMD, CRC_FWD);
         size_t buflength;
@@ -844,12 +838,6 @@ static ssize_t bcm2838_genet_rdma(BCM2838GenetState *s, uint32_t ring_idx,
         }
 
         memcpy(frame_buf, buf + len, l);
-        iov.iov_base = frame_buf;
-        iov.iov_len = l;
-        eth_get_protocols(&iov, 1, 0,
-                          &isip4, &isip6,
-                          &l3hdr_off, &l4hdr_off, &l5hdr_off,
-                          &ip6hdr_info, &ip4hdr_info, &l4hdr_info);
 
         len += l;
 
@@ -875,10 +863,19 @@ static ssize_t bcm2838_genet_rdma(BCM2838GenetState *s, uint32_t ring_idx,
                                          MULTICAST,
                                          !!is_packet_multicast(frame_buf, l));
 
+        /*
+         * Report no hardware-computed checksum. The IP header's own
+         * checksum was previously (incorrectly) stored here, but the
+         * guest's CHECKSUM_COMPLETE path expects a running checksum over
+         * the L4 payload, not the L3 header checksum -- and it was stored
+         * in host byte order besides. That mismatch was causing the guest
+         * to reject otherwise-valid inbound packets ("hw csum failure" in
+         * dmesg, tied to bcmgenet_rx_poll), breaking DHCP/connectivity
+         * intermittently. Leaving this at 0 makes the guest fall back to
+         * verifying checksums itself in software, which succeeds since the
+         * packet data itself is intact.
+         */
         xmit_status->rx_csum = 0;
-        if (isip4) {
-            xmit_status->rx_csum = ip4hdr_info.ip4_hdr.ip_sum;
-        }
         xmit_status->length_status = desc->length_status;
 
         mem_tx_result = address_space_write(&s->dma_as, dma_buf_addr,
-- 
2.47.1


