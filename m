Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3462903njd;
        Wed, 2 Apr 2025 06:54:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyHKnP37OOmvgXUjOhip9VoiPXX7jvIIYRYK7AqX6M6Az/gj/WSPW7tBnHsSR+pmOHwOgXy703V4d0ig==@linaro.org
X-Google-Smtp-Source: AGHT+IHHT21ZBEGVml6sKaeRfzORqEyjQKQACf+Lb/gzMpBtewM6HIuTPJKHXc7tHLNDdun5zr98
X-Received: by 2002:a05:6214:da9:b0:6e1:715f:cdf5 with SMTP id 6a1803df08f44-6ef04e84a6fmr32786316d6.15.1743602073359;
        Wed, 02 Apr 2025 06:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743602073; cv=none;
        d=google.com; s=arc-20240605;
        b=VdrS7L7bvYi3DVDNBi0xahshYxHei72f/AKiAdyLqNzJrgy1+R779DiTTlxPp/P27J
         VyhPZyV2mlPp+sTC1qOkojBSnVqvqrDjhBrDbw7uve3FVjU6QdHdF28yed/+Kw0qbhRK
         aUlQLIEl2yNWvy2vvMTlY48SVBcsjmgmZWLcUS0+lEIXIt+WXpehW0EOQ5HTRvnGBzgQ
         9/vtv+eLiqPC0YbrFp+ohmKsRqChNJov+XeH9HaT1Hg56a2lbGD0mwvljui2bQRoudeQ
         gOMJRHA8BfMRJE/8GTU8NADX5el0leRwvetqVKuI59E+eCfpi4BWaeAY/NtcdeEw+8wm
         ShFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=G9PZV4WZkVFc5r3WtXw+MuqZv9ug6Jw0HtjL9BKEMkQ=;
        fh=gfDFskAIGpy0PZ+qJIgLediYbeLXmTeIxqjSyjA+cBA=;
        b=Ah7gP+suRnxQutFVM29Qhd4q224p2R45nxT0eCJ0JujTXLc5CH7KNMAU/gyLdswMjw
         1363SRDW45cnRD72fFEhBuDhVXGbf8HPUjMYw2zuQSxQGV7kpLU9bBbn2F9LbTtZcoes
         Qg3CebxVhZfOuw/TzSFc4/DGOsyZra5zkY7PdAjcq3udEVHkxxDBQfO/lGdn1eGRIwCn
         vV3bnZ3HGRaW+4i/fTTXgOLZDK1VngQ3ankoUjgoflmLMo9E0yyn9llGvLqBG6vWvqa2
         0HN24iZKXpuen7Npg5hYhlvkpqbpBMfX9HmvXMl8vq5XgfZrnPzjmTjROZbHbXrHBjaY
         EOMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FhZTc0nc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec97a556dsi111953536d6.344.2025.04.02.06.54.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 06:54:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FhZTc0nc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzyXy-0002Lw-9J; Wed, 02 Apr 2025 09:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangckid@gmail.com>)
 id 1tzyXs-0002G6-DP; Wed, 02 Apr 2025 09:54:21 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangckid@gmail.com>)
 id 1tzyXq-0004uY-Fc; Wed, 02 Apr 2025 09:54:19 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-225df540edcso15695625ad.0; 
 Wed, 02 Apr 2025 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743602055; x=1744206855; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G9PZV4WZkVFc5r3WtXw+MuqZv9ug6Jw0HtjL9BKEMkQ=;
 b=FhZTc0ncRG+dEh04a5jtJi73TOohVY4C5S0k/HLagWDRPVF0mBpVNTe2kDP5LoFr/2
 nSMJrWAaCT/5Rs/qgSssVYuBuD1yfcKbTq6/tXl3mNKaBSJ2n+DoFIvIXLiKiVdz+TOB
 g2MOjIT3yVruNM8oF4Pe1Rwms31p/puq0U/JqQ5tV/DctX7J64Va4oxRSdn5EDPl+r8m
 6hmknU2eh540sdm1lyFkx/zR4ToqJTnWwNbrY4H0gFSSR1Sq91sy9Puv+hc+K92acUUL
 s5PVd6aNVFPt4PZhT7tDbBsU7gpxmkIcQz1IlhkpatrwytCKiB5E8fMKpCoT2mdzXNXW
 ohHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743602055; x=1744206855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G9PZV4WZkVFc5r3WtXw+MuqZv9ug6Jw0HtjL9BKEMkQ=;
 b=eyc5ReVLtLOeiGzpTHCzj6HVoMifwAreYuTPoK6RepAn2PQ0Poi3o4DC8V7/E7jmnV
 OIWp/kFuq3IOo9vR29H/lxFoE6BVCt2ohJSPFMvEw9RCEQfxLYSXKIKx4mJwPeSZGF+/
 Tv3Pl+p27IgnPoXMv/+aa06/yYWs7K3LP/7UHAHWNhGm7/7QirwEBS03VB9s1G2b2IoI
 4pEB8v/LCrLU9MdbuWgCpnzq8yrMQB95VCYtMI6ZX+625BihkQlhOcIPg9CaS/zjmQAt
 8ar+Jcv0bTKkQ+4cg3IJOaLqEQQZ89lQ6Ff2uC7nmoXBPN4k1JNR8ferJPdP2PzD3YLC
 hdaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3XvvpEEOpy0RyIh0f8LjsjVgS1k7SEKCkimZkCF0+ZQ+RmFJ3GGOfS3vPIcauVpSbhPsbbyF4zg==@nongnu.org
X-Gm-Message-State: AOJu0YxZwmaWCiwwvncsCnGYrXe3dc0qMXjZtoF1IIW5A8dnjrLPMR/y
 mFWKedJj1Zu4w5AicW1ymxlF66zCDHTKCeXiT32qZALOSgcv9BO9Vy6inxC6LQM=
X-Gm-Gg: ASbGncsrsXyQMzywZBm2qbg30TYyB3PgGD3theU9DiA2TGVxgJ5utVA/M7UU8V8VwBM
 v4KmXaFysYD2dK3K4uXarvJoqkXP8hOVelQL4knkJ+VvKaMpcWRK4GWk4nBWrdCgzOwEcy1o7Y0
 Vi6kxPDtTFbPZQLhVCPR3pKJTHU+6J47nInwFErOtt8HecSG9efvnrZCEsRw8TmGtJYybW7q1ic
 0q+78KNmY/0qZGJ4yClEbrCIceQ+1soF5XTzDB79QJ9dSNyF86IhU5QCgUJnpA0yfSjxadKA/0G
 WoQ1ZPqRkW26bN2iqBcnv1jhUunQU+C1bt4X2xC0dPPN3w==
X-Received: by 2002:a17:902:d4c9:b0:221:1356:10c5 with SMTP id
 d9443c01a7336-2296def2cc3mr26378025ad.9.1743602055173; 
 Wed, 02 Apr 2025 06:54:15 -0700 (PDT)
Received: from localhost.localdomain ([129.227.63.233])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eedcc5csm108439025ad.66.2025.04.02.06.54.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 06:54:14 -0700 (PDT)
From: Zhang Chen <zhangckid@gmail.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Zhang Chen <zhangckid@gmail.com>
Subject: [PATCH] hw/arm/virt.c: Fix wrong default cpu type in AARCH64
Date: Wed,  2 Apr 2025 21:54:02 +0800
Message-ID: <20250402135402.14526-1-zhangckid@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=zhangckid@gmail.com; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8+nYlRiHC57H

Because of the CONFIG_TCG auto enabled, the cpu type "cortex-a15"
is mistakenly set to the default AARCH64 target.

Signed-off-by: Zhang Chen <zhangckid@gmail.com>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a96452f17a..63649e9543 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3178,9 +3178,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
 #ifdef CONFIG_TCG
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
-#else
+#ifdef TARGET_AARCH64
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
-#endif
+#endif /* TARGET_AARCH64 */
+#endif /* CONFIG_TCG */
     mc->valid_cpu_types = valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
-- 
2.49.0

