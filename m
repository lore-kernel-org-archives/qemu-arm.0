Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp309756njb;
        Thu, 27 Feb 2025 07:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXjrpxlZRfY5AlGTWq/VJHmGW5yGWTrfCoMOQKKNUePm2kyhI664+aa95g+RjAK75wE9+rLIPvlWRzvCA==@linaro.org
X-Google-Smtp-Source: AGHT+IFMtm9bYVSsSmRpSgKoQBK3cYrkzp4ligkSUJsAYgOYKOS6pEN40nWqLHx7HpgnnxubqRbF
X-Received: by 2002:a05:6214:d65:b0:6e4:2f90:a9ca with SMTP id 6a1803df08f44-6e6b0036108mr369844386d6.3.1740670841197;
        Thu, 27 Feb 2025 07:40:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740670841; cv=none;
        d=google.com; s=arc-20240605;
        b=NdXyqOFGk8ncd17deDP5lEcrpbJTlhfQe3NpTvF5Ox9xA44uerTSYSGeXpvxNLQSkP
         AV3pEV9GfawEtLcBDbMdaPNaybOotCExm3gjoj7RM3dXHESgmiZHiamsILHCVneg79T6
         3pkgmSIwGbWUZtANm2Lmbi3v1vm3RVAPvkfnJMRPmjDloGWYO1nX87dz2GeWXotwdcIy
         QcKiD3ZIuaW+U5FYJBZZqNwyhb4aN9nilmO4xcgsDDGS4idRGR7Tpm1eYxK9qpqS+CCW
         5W5ic9u/LL6VC9ov/L6f0xNDgt3+dFo5o6pIshVF7fa7DDcem/XcQIe4waciuggSTPxI
         fUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=vATRtvB1MuGKCPpZKPTC8CQ1uuM3KZNlItHcM8oSpj4=;
        fh=oqzpWZ88REkxZFG07DQr9IjYYrt1isV6xce//oKMXng=;
        b=Q3IjpV9fFCLJrO/puo/esDmtS0OgE5iI1MqzluivI/ONrWwgkLV1u1YYj5Hm7WfcjR
         B/j3TqBUA0hqGn7AdOzXfYt3yy7IFuWr33GogJKz2VxWPCQyIwdLNemJwtPJMIU2ezKG
         8zTr3lvbOO18Ta/X/tdFiPtN9gke/mE1rJ7RgWIXhmPS1nN3EFBSoBj5iDQ8TCIRDSqe
         t5XLE0k3Pg8wmZDzOdrBrIqLVHDLBAAZTKh0ym0oVZsZLdkuwUmbwoKZJ+dXwg0FqH0T
         YWrTcuW3JdrcqSJi1V+Ann7HKYZgCM24VdMkkD/Fl0knAJLBpoXi249yVnkrgBJAn+ap
         IGiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ZtM92sZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4747240c85esi15240721cf.353.2025.02.27.07.40.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 07:40:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=ZtM92sZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnfzg-0004ON-BH; Thu, 27 Feb 2025 10:40:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VofAZwcKCKsgPYefcPRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--venture.bounces.google.com>)
 id 1tnfze-0004Mv-D8
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 10:40:10 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VofAZwcKCKsgPYefcPRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--venture.bounces.google.com>)
 id 1tnfzc-0003Ml-BT
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 10:40:09 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc1cb0c2cbso3544936a91.1
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 07:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740670806; x=1741275606; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vATRtvB1MuGKCPpZKPTC8CQ1uuM3KZNlItHcM8oSpj4=;
 b=ZtM92sZBrUlJNH/YSlkSjUaGpV898nYLNL4jz/UEjY8qfuPmw4VTcSl8sH/qpLzp3h
 vvsC8l4hNOhd28ky8+SgvAILgRG2OFvHl/uaMNiq8w56CgJRx9l2iF6BLu5xNbFHBNJ0
 +c+HHK55+3lPuqlBJGYMHQlKsvyzDXbDC+R7/83aU70yOl1QYAj90qcTDkgdJ/JKrudv
 LuVFEvQJc2cWDa+c3JgCdAZ7s+dtS2yQkc9YivOFHTkTPlC8HPUoTukFnsNoJ8UdsuZk
 oKNfFf6fuDBnSwhzdj+IckdtVWZSg8qeLpRGYJoKnsi4YCSkCB1g+m9iiZQevqWKSfN7
 SJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740670806; x=1741275606;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vATRtvB1MuGKCPpZKPTC8CQ1uuM3KZNlItHcM8oSpj4=;
 b=YGVYJhkkN7jI8YsF4pOEJzK6xvywRok3wAcqk8KsFMUP1z2+P7xwZ6joiSXYG/YYjI
 UMHWIAEwtw80qrDUzNcDhP+Rh0t7QzdPxeo0kqSsf+/EJ8vAY4/5IUuOVUsZejJ6eE/t
 m93UKebAfsViCe+9oTRzQL3ToVjjg7xfXeuJcAviLjKG22qnuwhqxnv9fFfEIeyob0yi
 VA1mtlp+PVePy3NeO88llMRELiPw8APB24OD1j/fwClk50mrPdadQoZPPa873vbwxMEG
 XmtfdriaYLqEDDgZMNgbUL7rsKUJumX6dIHXvKP625F7n+K+01nteNdhC32PUiy/uSyU
 eqBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9fhGSTFqC4CXh9BUSPiSKGWZchSbjxnaj6oPSzOlvvmh6UxfukBPfquqp5n4iA1aKwOyUCOb8Sg==@nongnu.org
X-Gm-Message-State: AOJu0Yy3XFmcaspA6CwXuV0ETEhFk4rAwZy8/xgHZXsYRdbm0BgN+I+J
 2y7YNgUU+cM/AQ200VhQvHP2PB/uVRn7oW2tmhxGIMC+AkSq1K6PQGgamegs+nxXlzP6UH/f/VA
 UkP1uQQ==
X-Received: from pgby4.prod.google.com ([2002:a63:6404:0:b0:ad5:1ae7:2563])
 (user=venture job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3a93:b0:1ee:e0c0:85a8
 with SMTP id adf61e73a8af0-1f0fc139c4fmr20808069637.15.1740670806091; Thu, 27
 Feb 2025 07:40:06 -0800 (PST)
Date: Thu, 27 Feb 2025 15:40:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250227154003.1646017-1-venture@google.com>
Subject: [PATCH] hw/net: npcm7xx_emc: fix alignment to eth_hdr
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: kfting@nuvoton.com, wuhaotsh@google.com, jasowang@redhat.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3VofAZwcKCKsgPYefcPRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--venture.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: ESLejRrwGwpP

'const struct eth_header', which requires 2 byte alignment

Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/net/npcm7xx_emc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
index e06f652629..11ed4a9e6a 100644
--- a/hw/net/npcm7xx_emc.c
+++ b/hw/net/npcm7xx_emc.c
@@ -424,7 +424,12 @@ static bool emc_can_receive(NetClientState *nc)
 static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8_t *buf,
                                 size_t len, const char **fail_reason)
 {
-    eth_pkt_types_e pkt_type = get_eth_packet_type(PKT_GET_ETH_HDR(buf));
+    struct eth_header eth_hdr = {};
+    eth_pkt_types_e pkt_type;
+
+    memcpy(&eth_hdr, PKT_GET_ETH_HDR(buf),
+           (sizeof(eth_hdr) > len) ? len : sizeof(eth_hdr));
+    pkt_type = get_eth_packet_type(&eth_hdr);
 
     switch (pkt_type) {
     case ETH_PKT_BCAST:
-- 
2.48.1.658.g4767266eb4-goog

