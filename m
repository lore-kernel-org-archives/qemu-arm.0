Received: by 2002:a05:7022:3c17:b0:97:989a:5032 with SMTP id tu23csp669347dlb;
        Wed, 5 Feb 2025 17:34:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU38PvyCLY2JXcda+FdjZu+J/hwfVKwm/bF/76kJel6enk0bDeW491gudwbZLZC8yooSiusZtqIDbJEJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHL4TiEgPYgOQp/tCIMCWWdkCP8c3zU3GLOi/OVbA/twQCup/hHx7uXpndfLbh0xN/mr6mZ
X-Received: by 2002:a05:620a:4552:b0:7b6:c540:9531 with SMTP id af79cd13be357-7c039fcf48cmr769305385a.18.1738805677130;
        Wed, 05 Feb 2025 17:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738805677; cv=none;
        d=google.com; s=arc-20240605;
        b=MB8uwK7PAfD3jCJkfuhpOpcC3+DX5H2SZQj/5iXOIXdz1i7hd95561Py+g82iIyeZ0
         o84nrHMWGvIQ/VrJlzcUNORwN/Jp0fat8n9F+CaOUwVVLhpBesrAft/FVb00SO+JXFSZ
         9qOd3TFDygAMcPcFNDfdTSyBU7cWCk3xmS6vGWoFrUbhaUaeLJkTJY+uZ+YG5CnZbYai
         pT5JAHfPvhALT2VyuhLyHHQB5UAtOLZhKwDSmVHUWrFDNKecEmu+ZB92c1A1lRibU5ij
         9QVGk7cKWDbD36NLDh0UdRRdl0YH/sautCOKpZryeAZsvZzoJW/VYD/DAvIOeM0HQwjG
         rE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=EMwJqO0GVwvNpTJ+WKNZl+C56TmDUIgVRx3/tC2n9ds=;
        fh=bnYRv9auOEic40HgJoe9CbQ+z0pEkJT7dA5ZnZnRlWQ=;
        b=I2dIKQgKdbAKYVTvNV/sN5mbwTHh28wNbS39BYAkDfsWEcTQoJVLqAQO/2rBeiasx6
         g+gq4xPIiBY0ZEpwodY/cNoMHAS5ahSPHf371Zo1XJIGxff+8ZDsHe4A6Un0FXBjpvEL
         X+D1Q0gKPClqCJoFxEwuamzYiYPfeK+nfqV99PAUXG5qHb4C6gHSWg6PDoHFzxcKLrBL
         422jw85XJLzEySHW1wI4poZGrnnb94Airlplo2RGqccK+2sQhThRVqjmfN1WA3W2LtMq
         zvAqU2mnHu2CVfZ62ur4t5X8UmswBvH9oKsUrqS5WvFQpkSy+6eqO+l2nQFNPGbZSKoi
         NiJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yNyVYLVD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ed5287si21973185a.539.2025.02.05.17.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2025 17:34:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yNyVYLVD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfqkh-0005UF-TT; Wed, 05 Feb 2025 20:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-hCkZwgKCu8nlYRfkjYXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--wuhaotsh.bounces.google.com>)
 id 1tfqkD-0005GX-4K
 for qemu-devel@nongnu.org; Wed, 05 Feb 2025 20:31:59 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-hCkZwgKCu8nlYRfkjYXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--wuhaotsh.bounces.google.com>)
 id 1tfqk3-0006wu-3J
 for qemu-devel@nongnu.org; Wed, 05 Feb 2025 20:31:45 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f816a85facso768852a91.3
 for <qemu-devel@nongnu.org>; Wed, 05 Feb 2025 17:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738805498; x=1739410298; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=EMwJqO0GVwvNpTJ+WKNZl+C56TmDUIgVRx3/tC2n9ds=;
 b=yNyVYLVD6En4DINC36obiUZ6MlDsncvsylWXXulO5gGwY2Fq4PRqb/0+Zq+A892N1C
 iDIh/yVwKpRm32Ivi9kG4Z3bx3+mzwGDhXqnTw5DwJsNtO0es0SQgNGTZZz66sAh+zkv
 jQ4ROuwVczsv3wcrp6Um2i9ae797hLNe4FjZLK2Q7z2Ks/LqqMTPSFC59+RiAAw93Cnj
 b2sPp/Op1MpaKrjQpFLJmuFFZQfv6WyjNN366F/E2Hl7VUVoTUCYaXmem+7yCcvfVnC0
 FtAnbowR/oJwMMP38LAgarC8uFLDuaioCd9WJ1Qvai9MvD/cr7oq3G8ozp5PyRHd52jR
 trcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738805498; x=1739410298;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EMwJqO0GVwvNpTJ+WKNZl+C56TmDUIgVRx3/tC2n9ds=;
 b=RzTo1IWz63aOi5+md+WgkK5UbVK4I2AJrT5xOMcAwm2pmi2PMQwKAbeeJXnOy7mj10
 Lvct5TZcvLZD3ePztQpeiL4lnb9QP16n9WVSzI0gfDzs5aaDYSNiZICPXHYNZbzWk7YL
 OfdSp9v3yY1PUkY1M3tR37iScyd1j+CrQbC77qmx6vOk9pQf6T4IacMl1L8Rf7ffYIaO
 VDeGBL6xzDsgNIU4RsBFPN7yODzTPmYDhCupgHsRjjCzDbGt81BATwoeaCwpj9roAzn+
 7FJ/j5KLNMlEu1naNXrpeemr50IvsxOzh9cCRX+L+aD4LnmjshU60aYdzsnYFjrd9tRJ
 aY9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFdSFzNLsIc4vuVdBLvGA8ZfvtypuHBEFkQ8MKzqXywSapWuvelmfLgoveFQqFIMM1tT75sN5qU0s2@nongnu.org
X-Gm-Message-State: AOJu0YwE1xxP6vV0aPSMF9CSrF0yWY2V4sFLjZTbkzXmHPJ/eAvfYeTn
 ENRuTiRY24XTXlvV4q40XkGsMWcBNivhew45r3lFR2Fm5Z+V7NEg0DAtlaju++BoQdm+w/etSRE
 PZ4Im83A8LQ==
X-Received: from pjbli9.prod.google.com ([2002:a17:90b:48c9:b0:2e0:52d7:183e])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4f4b:b0:2ee:aed2:c15c with SMTP id
 98e67ed59e1d1-2f9e083cc9cmr7802162a91.28.1738805498106; 
 Wed, 05 Feb 2025 17:31:38 -0800 (PST)
Date: Wed,  5 Feb 2025 17:31:05 -0800
In-Reply-To: <20250206013105.3228344-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250206013105.3228344-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250206013105.3228344-18-wuhaotsh@google.com>
Subject: [PATCH v3 17/17] docs/system/arm: Add Description for NPCM8XX SoC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3-hCkZwgKCu8nlYRfkjYXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
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
X-TUID: hCjJh6B4jfKr

NPCM8XX SoC is the successor of the NPCM7XX. It features quad-core
Cortex-A35 (Armv8, 64-bit) CPUs and some additional peripherals.

This document describes the NPCM8XX SoC and an evaluation board
(NPCM 845 EVB).

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/system/arm/nuvoton.rst | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

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
-- 
2.48.1.362.g079036d154-goog

