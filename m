Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp81815ejs;
        Mon, 8 Jan 2024 16:03:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHARqwVZrhahGwWZcDcePo8+GVf2FVz9LFWLC6qO00J+mNkPDKO45aUO6KFcQPq5kcGm/uP
X-Received: by 2002:ad4:5f06:0:b0:67e:f470:d21b with SMTP id fo6-20020ad45f06000000b0067ef470d21bmr1062540qvb.62.1704758622912;
        Mon, 08 Jan 2024 16:03:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704758622; cv=none;
        d=google.com; s=arc-20160816;
        b=CIWICDoXFIdgZn1KFF9rNL3mb19U2U9tNBz+uh3jZHCXo8A+NRlAv2kUM5GEbz6RCx
         eC+apdlecvVif5y4rKp0kok/N5Ogw6dPqERJnu/mMitrYwkuBYjo5Q212dUXcLH1zcFC
         hmB/xbU1wAeuxkdp3/k3XPWifT1ras42R5x4mAhxaTxJ3J2Zg9rIvmTXrz9sWf7o/ZK2
         CX0kHNnf0qSbDJgfnHxKJQzQeLySk/TsER51bgON4KtsSd4VDLQ2J3tAN7CTjT4t4BQ1
         t6QxtUYagERe+IbdiTyQGmBEg9MOegk6sZMrK+e//+jiDf6sO+cFIOofNO4OaGtBIvc5
         nMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=xOJL2ZOyMozLNHCFgzyIeLuO6/ZGI2/svvRBE82xI8s=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=AzgY0l9wDMVLgpyFVR+5kywiplZ6y+qtKo5KBgmFQNabj0Fxsm2kiUEFHO79a9YZoA
         /RG+1q6PcIW4JF+Z8Mq0Y0TG3Xxi5InMRE8qv+ILmsqpNjKft09OxfAiN9bgVlCRSQe6
         TOIN8nHQ4maqmddg9VO/KtaHoT/f4fAz4HMS4Wb9TspUCl6+hyt5vwrUL2IiowLOCJvT
         rcCU6IwPSv3TidJMaPoQtHVc8wQ905WhKgt00AfvgricB9k5qR8zichijEohBIadOJqO
         CoGAwGkPGk56H10TxBSI9WfVLFenI57wHYAQVRbPlUFLpmmMrWpiFUA4FBmPsniss3CB
         eSiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pxD0rop6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12-20020a0cc98c000000b0067f9b8e26cesi1025882qvk.451.2024.01.08.16.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 16:03:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pxD0rop6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMza7-0002Ss-IK; Mon, 08 Jan 2024 19:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LI2cZQwKCOsaNOVURfgRSNaTbbTYR.PbZdRZh-NeZabaTah.beT@flex--nabihestefan.bounces.google.com>)
 id 1rMza5-0002Rk-WD
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 19:02:58 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LI2cZQwKCOsaNOVURfgRSNaTbbTYR.PbZdRZh-NeZabaTah.beT@flex--nabihestefan.bounces.google.com>)
 id 1rMza2-0002vq-7k
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 19:02:57 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-dbdc93a98a1so2782699276.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 16:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704758572; x=1705363372; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xOJL2ZOyMozLNHCFgzyIeLuO6/ZGI2/svvRBE82xI8s=;
 b=pxD0rop6s47XYHZsn/CU4J8RMakuIr0JKzIsfZu7HQQtZ/l0J5xvQumE9RawSzJRe6
 L7lZnXEBVN1Q0kAmKDe6a5XYFdkdIEDO00SCB8hZS2JeYovaRwL+nPUmcrK5dypzNq8e
 FH3LZwtBTP6hyLg4FL1gyEu68QrOUiP6UQ4eeJCgynxFL2DOb0djW85BCeR13uNbTllb
 I/j98UOrY7jnmpKaJuv2O/KA/Claw/gJRt9SEULtum6SfIf0WTPf0p4mT01lKsq5OroF
 Rjmx1UPckUwFC/DWbfEJ1J3E0dYfZNYl2Mkqx0IW07lgiH3VyDV8YidT8kx8SmuIjxIk
 i20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704758572; x=1705363372;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xOJL2ZOyMozLNHCFgzyIeLuO6/ZGI2/svvRBE82xI8s=;
 b=mkOXkmzvmyCYBwS/EkfqYiHvj11bP8MgU4rQWVDvorsQbpfJmeosuK5kaoU0juAnLW
 +GMAtgcDD38lJvoQ1eQGyl7T7zfMaFgbu2p1sMI/svtm5cVvyji7lKJS1E8/YkRsc+o6
 kKR8oH1UN9C+mlUW1v+v9JKikS0gHJCM24nzkw6498amiCxHiTU2jfazDyJ8J2DVdcBI
 gKxVf5ftGcF6d95m0rCHbIdlLWH3oZEQTzQMMDRIKTJgBc0f15s+Fooe3QWfDQjrob9x
 SOK7rMmQ3zcnJ2OyrfvX8/JfuCC8EzDi68X+TovHR9svt+KZnXO0prS6QtPU08Buy8zR
 5B0g==
X-Gm-Message-State: AOJu0YwUxexF2VnzuoD1F7nzN4fL7BlrvGJAVyKuikcbeycMUQZ9uMsa
 S/tRoauM+ukSWvAkV9GiCQ0g9ZYlk4iG/xsYbm8+U6HS9g==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:8107:0:b0:db5:45eb:75b0 with SMTP
 id o7-20020a258107000000b00db545eb75b0mr1812904ybk.6.1704758572451; Mon, 08
 Jan 2024 16:02:52 -0800 (PST)
Date: Tue,  9 Jan 2024 00:02:33 +0000
In-Reply-To: <20240109000234.2799153-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240109000234.2799153-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20240109000234.2799153-10-nabihestefan@google.com>
Subject: [PATCH v11 09/10] hw/net: GMAC Tx Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3LI2cZQwKCOsaNOVURfgRSNaTbbTYR.PbZdRZh-NeZabaTah.beT@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: pQH3XBDigTzK

From: Nabih Estefan Diaz <nabihestefan@google.com>

- Implementation of Transmit function for packets
- Implementation for reading and writing from and to descriptors in
  memory for Tx

Added relevant trace-events

NOTE: This function implements the steps detailed in the datasheet for
transmitting messages from the GMAC.

Change-Id: Icf14f9fcc6cc7808a41acd872bca67c9832087e6
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 hw/net/trace-events | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/trace-events b/hw/net/trace-events
index f91b1a4a3d..78efa2ec2c 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -478,7 +478,9 @@ npcm_gmac_packet_desc_read(const char* name, uint32_t desc_addr) "%s: attempting
 npcm_gmac_packet_receive(const char* name, uint32_t len) "%s: RX packet length: 0x%04" PRIX32
 npcm_gmac_packet_receiving_buffer(const char* name, uint32_t buf_len, uint32_t rx_buf_addr) "%s: Receiving into Buffer size: 0x%04" PRIX32 " at address 0x%04" PRIX32
 npcm_gmac_packet_received(const char* name, uint32_t len) "%s: Reception finished, packet left: 0x%04" PRIX32
+npcm_gmac_packet_sent(const char* name, uint16_t len) "%s: TX packet sent!, length: 0x%04" PRIX16
 npcm_gmac_debug_desc_data(const char* name, void* addr, uint32_t des0, uint32_t des1, uint32_t des2, uint32_t des3)"%s: Address: %p Descriptor 0: 0x%04" PRIX32 " Descriptor 1: 0x%04" PRIX32 "Descriptor 2: 0x%04" PRIX32 " Descriptor 3: 0x%04" PRIX32
+npcm_gmac_packet_tx_desc_data(const char* name, uint32_t tdes0, uint32_t tdes1) "%s: Tdes0: 0x%04" PRIX32 " Tdes1: 0x%04" PRIX32
 
 # npcm_pcs.c
 npcm_pcs_reg_read(const char *name, uint16_t indirect_access_baes, uint64_t offset, uint16_t value) "%s: IND: 0x%02" PRIx16 " offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
-- 
2.43.0.472.g3155946c3a-goog

