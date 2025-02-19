Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1554311njb;
        Wed, 19 Feb 2025 10:49:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUuBJ94Bj10Y2lWteKCi1Ly1Z+K1Sjr5Xh9iEKLNsIT5deO7FuQ0ZsLOMmVrwWem0x28hXV7m+4tVXbBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEzFtMkj4TwM4oJzuE6Ww+w8aX7IvOuMlvlcgrEqSgTlRSo8HWZxs8ohOb7BNi2p35eP/q5
X-Received: by 2002:a05:622a:8f:b0:471:bb9b:15af with SMTP id d75a77b69052e-47208260d37mr61423781cf.5.1739990965337;
        Wed, 19 Feb 2025 10:49:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739990965; cv=none;
        d=google.com; s=arc-20240605;
        b=VQd6djPk+daWKgDLfOzwhHjNGlz9mPK9L51OdY/ulKDgl8cy/kKNlZbyNZal/0CnCk
         cJAAx5GEy8CRvEOG8eghsn6QQeHKgvDgzQOUSmbDpp+82W7tDbZor3UnHp3W7yuOUkrr
         tvSn6g6KmmpFrq84mGFkDRjnhfKMdejHbA1GHyMKDFCxSBVW2+rUnjMeEA9i6lnbomQ4
         YQs3scniV0/Cip3tkL6ZTOOB/UVRCnUA6Vu+tW0szqMhxY6W3ru/ABNp7nH8z05ipGSP
         oAfDgl8WVVmUokJfezcKFyKI3mZQlOhrpeF3rFsQ/9hqOlRSf4+p0KkMrBUOk1Myzzv3
         keEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=pqoQYyAvlYbvoO5CKrUwqrjyMLnIsAG6oK22Xi4In1A=;
        fh=A8cvdhFXmHXdOS8p3vLBNSflYX2o7w5JRAqFSPjGZPU=;
        b=CR5WPEzDO6c+LJOSoKariiyTlh1WPB6xq2AsOJRXVXmsfpTSpMh2XrGTAPnbUIaCn3
         lASZd08sx8ltPa/O4hKIvN4ktChDMO1ILkuhcPTQ2JoiwGeXq1EZijazdeyh1V6Xswdu
         3VuOkq9peBOoVC287AF9m5nTMRrtZMttOIXjPjStMkTyq6f6jxmdZ0JrOCLe8wil8Y2G
         2xcnR/fx5r3n2TgCGB+PODV+a36xXbIvUu9L+E22YRMgNKtWjuPk4H+r/Q1fOyIovtxn
         UJCrXFUrSZfOdtXG0jgG56scJVPqCaokFsYXjmCsShEKZq+1tJtuoYTPaZlumfGWy1Jp
         +BNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Dn+b7jKw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471f0654631si65596531cf.6.2025.02.19.10.49.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 10:49:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Dn+b7jKw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tkp6d-0003yQ-Ag; Wed, 19 Feb 2025 13:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HCe2ZwgKCoc75slz43srzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--wuhaotsh.bounces.google.com>)
 id 1tkp68-00038c-Cs
 for qemu-devel@nongnu.org; Wed, 19 Feb 2025 13:47:10 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HCe2ZwgKCoc75slz43srzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--wuhaotsh.bounces.google.com>)
 id 1tkp63-0004qO-0d
 for qemu-devel@nongnu.org; Wed, 19 Feb 2025 13:47:03 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-220bf94cb40so794675ad.0
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2025 10:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1739990813; x=1740595613; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=pqoQYyAvlYbvoO5CKrUwqrjyMLnIsAG6oK22Xi4In1A=;
 b=Dn+b7jKwHYJgnzO5Dba0CKciEZhbRUydFW/K3Yim+0nC+rRlrr1GIQbZ/LTeXszLPT
 LHx+tGhgTWqHsnl9kYqaKROehdDHC2po7tf5BQSAAI7fSnUUqYyfDq4kKE2x0WSbdPcR
 Pgeirawthyw0xdk/2Gw2XblzcNl5QtUD4bNnEfq437xNcYPk/tB38+sAXvjQ2yGjZxGP
 pxHRQCfbjx/GZ2KWOZ9UsWP/+qCxmLa5LhniB1IlFNxzkt4diz2TdVYDJKRLih+E0P4C
 uAlJfgWJO5Gcj7LLSBhXKbSf04UnCn/wSDJT3CKEbow8OJMfiLMIgoW90pCNftu43/I3
 o63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739990813; x=1740595613;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pqoQYyAvlYbvoO5CKrUwqrjyMLnIsAG6oK22Xi4In1A=;
 b=nDM57zeYrUJX7S3pCML2VDaCKLCV7RpMQDeEhhpTIoUzQfZcSrD9yXZuofqaiSEsC2
 E2TZ8Psu+ROOnwZ/xEDFr38HGD9K89GICzeFS9IYSdL0hEESwODl0m3AczaWfNqDVyKo
 9B+dNi0ECVyan13ISP4lmvgE7hjGgdIJKs/u5/Wzh+WVJPJ0f/8fz9VFcihuS9nVqvDj
 P7QQS9mpmdkFK2+IcFQuKQmLnakLz7uTsBQLHupb/SiPANPFINI9CTTiaPGr4WZ9dxra
 d+WdWPOluVvD2kLdAwI5HxmedB28oyEKu15Y9Q589XPVH0zJrpyvJtwbWyU1YZxBf/kY
 Kd5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDdEkeKWdqRIkoaHFHEqHplikGseGtHI3Rc9EcsUhbp7bikusIXXgiz47Uk+YThjeNGHTwE95WRWx5@nongnu.org
X-Gm-Message-State: AOJu0YwQIu1uaAz1LfTqI/tGxTMV82E0o6qG+ck2/SwUZV+Y0CiL2j9F
 K7/4JRauq9wKfj6WoLI8r2QFK10epwn5PGBz0GORNEdnWt82aiebaXDKa/xiJP+ygAtND1vF8+2
 8vDfvXm/uYw==
X-Received: from pgbcr11.prod.google.com
 ([2002:a05:6a02:410b:b0:adc:ba1b:f94f])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a108:b0:1ee:8a68:f83e with SMTP id
 adf61e73a8af0-1eed4ed2b12mr8096653637.20.1739990812748; 
 Wed, 19 Feb 2025 10:46:52 -0800 (PST)
Date: Wed, 19 Feb 2025 10:46:08 -0800
In-Reply-To: <20250219184609.1839281-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250219184609.1839281-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250219184609.1839281-18-wuhaotsh@google.com>
Subject: [PATCH v5 17/17] docs/system/arm: Add Description for NPCM8XX SoC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3HCe2ZwgKCoc75slz43srzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 21Eae5EMO0Gs

NPCM8XX SoC is the successor of the NPCM7XX. It features quad-core
Cortex-A35 (Armv8, 64-bit) CPUs and some additional peripherals.

This document describes the NPCM8XX SoC and an evaluation board
(NPCM 845 EVB).

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/nuvoton.rst | 27 ++++++++++++++++++++-------
 hw/arm/npcm8xx_boards.c     |  1 +
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 05059378e5..e4827fb43a 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -1,12 +1,13 @@
-Nuvoton iBMC boards (``kudo-bmc``, ``mori-bmc``, ``npcm750-evb``, ``quanta-gbs-bmc``, ``quanta-gsj``)
-=====================================================================================================
+Nuvoton iBMC boards (``kudo-bmc``, ``mori-bmc``, ``npcm750-evb``, ``quanta-gbs-bmc``, ``quanta-gsj``, ``npcm845-evb``)
+======================================================================================================================
 
-The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
+The `Nuvoton iBMC`_ chips are a family of Arm-based SoCs that are
 designed to be used as Baseboard Management Controllers (BMCs) in various
-servers. They all feature one or two ARM Cortex-A9 CPU cores, as well as an
-assortment of peripherals targeted for either Enterprise or Data Center /
-Hyperscale applications. The former is a superset of the latter, so NPCM750 has
-all the peripherals of NPCM730 and more.
+servers. Currently there are two families: NPCM7XX series and
+NPCM8XX series. NPCM7XX series feature one or two Arm Cortex-A9 CPU cores,
+while NPCM8XX feature 4 Arm Cortex-A35 CPU cores. Both series contain a
+different assortment of peripherals targeted for either Enterprise or Data
+Center / Hyperscale applications.
 
 .. _Nuvoton iBMC: https://www.nuvoton.com/products/cloud-computing/ibmc/
 
@@ -27,6 +28,11 @@ There are also two more SoCs, NPCM710 and NPCM705, which are single-core
 variants of NPCM750 and NPCM730, respectively. These are currently not
 supported by QEMU.
 
+The NPCM8xx SoC is the successor of the NPCM7xx SoC. It has 4 Cortex-A35 cores.
+The following machines are based on this chip :
+
+- ``npcm845-evb``       Nuvoton NPCM845 Evaluation board
+
 Supported devices
 -----------------
 
@@ -62,6 +68,8 @@ Missing devices
    * System Wake-up Control (SWC)
    * Shared memory (SHM)
    * eSPI slave interface
+   * Block-transfer interface (8XX only)
+   * Virtual UART (8XX only)
 
  * Ethernet controller (GMAC)
  * USB device (USBD)
@@ -76,6 +84,11 @@ Missing devices
  * Video capture
  * Encoding compression engine
  * Security features
+ * I3C buses (8XX only)
+ * Temperature sensor interface (8XX only)
+ * Virtual UART (8XX only)
+ * Flash monitor (8XX only)
+ * JTAG master (8XX only)
 
 Boot options
 ------------
diff --git a/hw/arm/npcm8xx_boards.c b/hw/arm/npcm8xx_boards.c
index 19610483f9..3fb8478e72 100644
--- a/hw/arm/npcm8xx_boards.c
+++ b/hw/arm/npcm8xx_boards.c
@@ -17,6 +17,7 @@
 #include "qemu/osdep.h"
 
 #include "chardev/char.h"
+#include "hw/boards.h"
 #include "hw/arm/npcm8xx.h"
 #include "hw/core/cpu.h"
 #include "hw/loader.h"
-- 
2.48.1.601.g30ceb7b040-goog

