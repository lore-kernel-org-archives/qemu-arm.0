Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp735975lfm;
        Fri, 17 Apr 2020 10:19:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypKZ+3t2YxFdyUtvRd/Jx4mU9YF+sJAEZpXVtgWb7p32nVagvTSXWA4LWHm2hdzle/KSLWKu
X-Received: by 2002:a37:451:: with SMTP id 78mr4340000qke.376.1587143996108;
        Fri, 17 Apr 2020 10:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587143996; cv=none;
        d=google.com; s=arc-20160816;
        b=oBnbkfomZQilnjTWPhzC+8xfOOiHM1uKVSc1tgsMU3GM32v+tEGEU7LR9cCLvjEuWQ
         eVPSrEtKRAfW/qygOdf2LNcHL0a8SDAXOvZgTboeiFeQ+ExUDBIIxSg8nMIT7kT9E58p
         utKTEFMCABwqlUrWMn6bJdG9teIpDQY1hKaHugp6HJvh2iZeQh+UEkAH9y0Bxk7UThnU
         SQJV/muXHVRpuX/oiszlzMXpJVXw6yQyi5O6KOyjEZjiK4W7sXxYBLhnktoszCBX60yD
         +sXBid2fYBSIuKUgo5jJCexQVBvt+dIkCGj/FsU1e2MP0la/mqGJjQzD66wKGgVKglsg
         9flQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ttOhgnDLQfGWXOWogf5pjl5Ry85FgVYUCdfxTn50lGM=;
        b=c39g2HFzjSQ0vabd4iURj6bCe2U1yWQZwNn5/Hl2OES2GiuqhUpkPbRiMStbc5vfM+
         vg+V+BmQ6C9RoeP92hQRmm7ZZxANdXpPu0dqYDc+VCS3SDrAWCnLD2RQlQt1obQc6cL6
         C8v7+uo7gnI7xSGWKteZZKiByQqEtpHn9P22jTVTaUgWiaIFAuYftWT1aOVSdQtibBsj
         r8snzfj1wo4jqbC/RgQuZuvkMfyS6Tr0rcraWFn4UzDducdSQP6Hd12SBWKYeblP8TWR
         vQuJ+E7j5Uz2SsbOb4kDf/Ap15/+6YJgz0UPWTKKYRdnmdOnSgV6dYZKLzz6PIJ75JkG
         C+gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kye46WVQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a143si13550846qkb.103.2020.04.17.10.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 10:19:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kye46WVQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPUeh-0005Yg-IW
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 13:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53753)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rfried.dev@gmail.com>) id 1jPUcm-0003SV-4V
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 13:17:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1jPUck-0000iU-Mj
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 13:17:56 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38841)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1jPUck-0000hB-Gq; Fri, 17 Apr 2020 13:17:54 -0400
Received: by mail-wr1-x443.google.com with SMTP id k11so3937351wrp.5;
 Fri, 17 Apr 2020 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttOhgnDLQfGWXOWogf5pjl5Ry85FgVYUCdfxTn50lGM=;
 b=Kye46WVQ4Ke9a7G/WNj0lDYC4kqam7hYN9AOj5P97fatmE21gzdjHKhOP183Gx5q8a
 58E1hO0rxjP7P3TFPUZZWHX8D3iPDcroA8xpzn1atryLsGvsdj2EEZbtPS2I/rOLZN/Q
 I6ParmCFre8+MiKChcBtG9eg/yaMlCidtzQNliy/5Fmgc3WMIv7Ztt8uvQwoq/ZeK37C
 FJFvZbqLZLSA+yOihHkep5InMauDNuiSD5c0eOMEjuTRFqxCyJqjCWHb5YNZI8o8y9UB
 Cv0OAQC9x5UZjqZQB1Wg3nvpm9SgnK7ZFSDhUJwuwvVZwIYRqUjGzHdSX9d+PWmctFy/
 0RAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttOhgnDLQfGWXOWogf5pjl5Ry85FgVYUCdfxTn50lGM=;
 b=pe5jurk60nh8RBycN36tVh+UnGE1ONs86a8dVppXu4ejW3zheCeLKgzrNn9zinF8wD
 Vf3Iq0SWc8gwXtfooFgvgdIB4NHIlwA2lGJZ0mpHisyeugfrH0HzMqLr7O6ikIaa8RZw
 EFD+ajJrLt/mAGcnqAa4szFPEAp6J/JzLfN/N8fd6F7NEWQLn5KdPq7EqS6I2TrGnZWP
 Kuzl9FJqUAKsvQdxxOpZQg9rkVrKKUdmnc83Sgrjia+mFn2hvNMgjgCnSS7CnV5sokYN
 1wwQ+iAGurNv0rMwHL0lUyf+vROvDE1EWOxLr3tyBLi079Vv66xW7Zx2PFnsIZSs8R41
 mbjg==
X-Gm-Message-State: AGi0PubhxwHuvxaLgv9YvfLT9kwmlY5U8lhIy1GRjW0dY9CHqL5hpyS0
 f7O4TIA7naBwz9oMT8W1pPE=
X-Received: by 2002:adf:e711:: with SMTP id c17mr3386425wrm.334.1587143873393; 
 Fri, 17 Apr 2020 10:17:53 -0700 (PDT)
Received: from localhost.localdomain ([37.142.6.51])
 by smtp.gmail.com with ESMTPSA id 91sm19154440wra.37.2020.04.17.10.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 10:17:52 -0700 (PDT)
From: Ramon Fried <rfried.dev@gmail.com>
To: edgar.iglesias@gmail.com, alistair@alistair23.me, peter.maydell@linaro.org,
 jasowang@redhat.com, qemu-arm@nongnu.org
Subject: [PATCH v2] Cadence: gem: fix wraparound in 64bit descriptors
Date: Fri, 17 Apr 2020 20:17:36 +0300
Message-Id: <20200417171736.441607-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Ramon Fried <rfried.dev@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p6AwVgQRICCL

Wraparound of TX descriptor cyclic buffer only updated
the low 32 bits of the descriptor.
Fix that by checking if we're working with 64bit descriptors.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
v2: Fix indention problem.

 hw/net/cadence_gem.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 51ec5a072d..b7b7985bf2 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1238,7 +1238,14 @@ static void gem_transmit(CadenceGEMState *s)
             /* read next descriptor */
             if (tx_desc_get_wrap(desc)) {
                 tx_desc_set_last(desc);
-                packet_desc_addr = s->regs[GEM_TXQBASE];
+
+                if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
+                    packet_desc_addr = s->regs[GEM_TBQPH];
+                    packet_desc_addr <<= 32;
+                } else {
+                    packet_desc_addr = 0;
+                }
+                packet_desc_addr |= s->regs[GEM_TXQBASE];
             } else {
                 packet_desc_addr += 4 * gem_get_desc_len(s, false);
             }
-- 
2.26.0

