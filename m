Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5600544njk;
        Thu, 26 Dec 2024 00:24:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQtNGAfb959djUJDdFP7+hpixIXcjxHF1SlhHjUjIBVSIk5/KfDq9nQIjDTiI+BsK9z/uXjWeVg8VFcA==@linaro.org
X-Google-Smtp-Source: AGHT+IGnXkGRhdtHMPcnlP1GQnhrcROBhrFImdphNiMnQkuP8zFD0HEs+W8+gCGTaUjbSRlMWk2R
X-Received: by 2002:ad4:5c6a:0:b0:6dd:d3b:de38 with SMTP id 6a1803df08f44-6dd23345872mr354328996d6.16.1735201472145;
        Thu, 26 Dec 2024 00:24:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201472; cv=none;
        d=google.com; s=arc-20240605;
        b=lOH+NM4hBTevlzTYqHRmvKtUOdPvF2GoqfdA/wBRguQ+OrGQzvExmTVCOPhwHjDFuB
         kcUp/lfeadUisN5sgc7ocRafj13gSPA4V5hcCxkkMvdTeip3TBd/x2UO0vUNfNbT4HPU
         go/cuuNVLOwY7L935vWM4uLlj31DwwaaxAzl1bsd3IF5HK7wEOo3A3mjL2JMNR/rLEzD
         Ot7/DWThVUpgarzY+eX26y+ckhmK6JYwITnmfuxZG6lWX3ZKw6l34tBu8NO6cPO+vyvk
         XeETm03ExXnA28+580CzExxWkrCbTpaa1qklW4MJV8M5Y/UIdbO5F087s94l+ByTQXmS
         SQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=xfNC9ogz1de0wuLdHYiHiqwKVT4pFZIRykyJquvWBMg=;
        fh=luqczq21R/WVyFsAXY3xjiSk+tbt+bB+3AXcxVMujQk=;
        b=ixCz3o4VpFc0DDpq21WNNDHS/PNnYmVrV1bpakVnsAfb6YmeDlpm7zN/NIxqu1Jnbb
         YinFQrvnov4s9Eh+97HArpsLpbLpXrieDN+y2zOkq6uhsmH7fhz/6nNAbFx3OSMr+9Rl
         qLrit8WnTljoAZdPDmP4gcGok1fkgMWM8pnVma8cc6X/mXBkCqjDCpzKPSmDq6Y7Q8Vx
         2yPGWpvhp2bDtn+y2xkqAZMdETkNG3B7irHdY+nXOaU6naVcSytuw798w8VzMNkcozkH
         Oh5lWsnX/vbszoWWbxmGu9BmjV3HgHFANWDBP//3FXzHlkF8/R8BikFofPp1iT9ZEu6D
         V9RA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TgYqc81F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd1836f7a5si176940476d6.516.2024.12.26.00.24.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:24:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=TgYqc81F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQj96-0007Fs-Tf; Thu, 26 Dec 2024 03:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3YxJtZwgKCH4ywjcqvujiqqing.eqosgow-ctopqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1tQj95-0007FJ-3n
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:23:03 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3YxJtZwgKCH4ywjcqvujiqqing.eqosgow-ctopqpipw.qti@flex--wuhaotsh.bounces.google.com>)
 id 1tQj93-0000WT-AF
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:23:02 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f2a9f056a8so7747139a91.2
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 00:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201380; x=1735806180; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xfNC9ogz1de0wuLdHYiHiqwKVT4pFZIRykyJquvWBMg=;
 b=TgYqc81F5r7Wzs9xxHIK6l3MWPch+9wrpKwXPukDjJUFyOq060hbA9O62c1s3J/qiZ
 D5uY+ZxR3UXmgAxBK5LzHg8RLXR6hgdNXlkNhEfS+NzJ8WZS4JlzVpZJaEQq9JoPhHuq
 549g/iri8Hna839GAXZWV/2N9hX82gSgbtIkC9OsHG/RZeQyBKplxFY560Bf8xiYMAVQ
 82nGeFJfJbQtg4fmz93Wz4zxOwf1xuluPW4sENKXfLRBFZVFEojjZV/NGoaoCDML8sYz
 +l+R/tYL1EY4qpLKvpAlEetGbhPLk20aVZF5dl4zRohbj5WHPC+CcPkvp1lDDqIoKKK8
 tlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201380; x=1735806180;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xfNC9ogz1de0wuLdHYiHiqwKVT4pFZIRykyJquvWBMg=;
 b=LqnG0tqlGu8rXdrrpZYbP6ZE2eFc/6OhHspe35dXsy/JPpBtsihV5NJc07W9cUpX36
 82O4ojE+i/tgAY0iRGcy2wcUplTIK1eeNV8JkNZMVMFG6hANFSzUIehI89PDn6bjQ+dY
 3K5I6M9Vwjd2ZFNVR6HFvkCMQh+oywF1lFPdXWTfquegdhmY6hl5/wd9z7bUDdYRVR5A
 rGCMAM4a0L3CVAzFhXbgEcnmz7uNaRPgJc5+3l7hvLWmShf60wYCpjAWsJO/P6bCuEMu
 t/uzha2wgQZCrwIehAfEmdqp9Uly1G5s0U0wPZnfTtCxFz56i93jPt82Nh9onQKwdNPo
 PJ4w==
X-Gm-Message-State: AOJu0YzADiOE892QKVti63A8IPe7MZGXtcEjtgZOjPkhrqKk7gnecGaJ
 tnNq12nCqEBmGAv41VAo0WGwdtQYTJO8Q97RFXXMvnlVRORClLZpQG2FN7txkl4gRIy3dARlt47
 sT6+WlKPyfg==
X-Received: from pji12.prod.google.com ([2002:a17:90b:3fcc:b0:2ef:95f4:4619])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:53c7:b0:2ee:b2e6:4275 with SMTP id
 98e67ed59e1d1-2f452ee7147mr28000543a91.26.1735201379809; 
 Thu, 26 Dec 2024 00:22:59 -0800 (PST)
Date: Thu, 26 Dec 2024 08:22:22 +0000
In-Reply-To: <20241226082236.2884287-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082236.2884287-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082236.2884287-4-wuhaotsh@google.com>
Subject: [PATCH 03/17] pc-bios: Add NPCM8XX vBootrom
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3YxJtZwgKCH4ywjcqvujiqqing.eqosgow-ctopqpipw.qti@flex--wuhaotsh.bounces.google.com;
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
X-TUID: /4Koagl/tref

The bootrom is a minimal bootrom used to load an NPCM8XX image.
The source code is located in the same repo as the NPCM7XX one:
github.com/google/vbootrom/tree/master/npcm8xx.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 MAINTAINERS                 |   1 +
 pc-bios/README              |   8 ++++----
 pc-bios/meson.build         |   1 +
 pc-bios/npcm8xx_bootrom.bin | Bin 0 -> 608 bytes
 roms/Makefile               |   6 ++++++
 5 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 pc-bios/npcm8xx_bootrom.bin

diff --git a/MAINTAINERS b/MAINTAINERS
index 38a290e9c2..14bfadabbb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -872,6 +872,7 @@ F: include/hw/*/npcm*
 F: tests/qtest/npcm*
 F: tests/qtest/adm1266-test.c
 F: pc-bios/npcm7xx_bootrom.bin
+F: pc-bios/npcm8xx_bootrom.bin
 F: roms/vbootrom
 F: docs/system/arm/nuvoton.rst
 F: tests/functional/test_arm_quanta_gsj.py
diff --git a/pc-bios/README b/pc-bios/README
index 7ffb2f43a4..700dcaab52 100644
--- a/pc-bios/README
+++ b/pc-bios/README
@@ -70,10 +70,10 @@
   source code also contains code reused from other projects described here:
   https://github.com/riscv/opensbi/blob/master/ThirdPartyNotices.md.
 
-- npcm7xx_bootrom.bin is a simplified, free (Apache 2.0) boot ROM for Nuvoton
-  NPCM7xx BMC devices. It currently implements the bare minimum to load, parse,
-  initialize and run boot images stored in SPI flash, but may grow more
-  features over time as needed. The source code is available at:
+- npcm{7xx,8xx}_bootrom.bin is a simplified, free (Apache 2.0) boot ROM for
+  Nuvoton NPCM7xx/8xx BMC devices. It currently implements the bare minimum to
+  load, parse, initialize and run boot images stored in SPI flash, but may grow
+  more features over time as needed. The source code is available at:
   https://github.com/google/vbootrom
 
 - hppa-firmware.img (32-bit) and hppa-firmware64.img (64-bit) are firmware
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 4823dff189..d282c43658 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -80,6 +80,7 @@ blobs = [
   'opensbi-riscv32-generic-fw_dynamic.bin',
   'opensbi-riscv64-generic-fw_dynamic.bin',
   'npcm7xx_bootrom.bin',
+  'npcm8xx_bootrom.bin',
   'vof.bin',
   'vof-nvram.bin',
 ]
diff --git a/pc-bios/npcm8xx_bootrom.bin b/pc-bios/npcm8xx_bootrom.bin
new file mode 100644
index 0000000000000000000000000000000000000000..6370d6475635c4d445d2b927311edcd591949c82
GIT binary patch
literal 608
zcmdUrKTE?<6vfX=0{*3B5ET?nwWA^;qEk()n=Xb9-4dxoSBrz#p|QJQL~zokn{Eyc
z?PBXUkU+aB?k?IbNQftG5ej|*FC2c{bKkr7zLy3jhNxj`gc_y5h&V=Ru)PgZC)Y`f
zTqA9Am28qL<U6@cMtA>Hlr*^&hT#;re-)dpxT0U42|O+cWOcx=B;{6xXH04vx?cjm
z+%U{oFx!aPpV3>ZKz0i$XA-yq{f}<H?{MHBq+VwIvR9WmcL(xr1vuIRGELcRC-S+P
zl3%RlR5(6+1;xg_<~xR#bPItDN1*Hp^{JyNs7o*BMq0Q9q1#>x4;|pb<NWIbQ8wb1
zTac^<ebj^E^Ig<?U?(PO-w>w;l#@9zGd|z-rs*H@V-o%PEV)D-)8n2%DyH5@w_^Y8
LH5R3RMV#gjxYTW}

literal 0
HcmV?d00001

diff --git a/roms/Makefile b/roms/Makefile
index 31e4b97c98..beff58d9d5 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -34,6 +34,7 @@ find-cross-gcc = $(firstword $(wildcard $(patsubst %ld,%gcc,$(call find-cross-ld
 # finally strip off path + toolname so we get the prefix
 find-cross-prefix = $(subst gcc,,$(notdir $(call find-cross-gcc,$(1))))
 
+aarch64_cross_prefix := $(call find-cross-prefix,aarch64)
 arm_cross_prefix := $(call find-cross-prefix,arm)
 powerpc64_cross_prefix := $(call find-cross-prefix,powerpc64)
 powerpc_cross_prefix := $(call find-cross-prefix,powerpc)
@@ -66,6 +67,7 @@ default help:
 	@echo "  u-boot.e500        -- update u-boot.e500"
 	@echo "  u-boot.sam460      -- update u-boot.sam460"
 	@echo "  npcm7xx_bootrom    -- update vbootrom for npcm7xx"
+	@echo "  npcm8xx_bootrom    -- update vbootrom for npcm8xx"
 	@echo "  efi                -- update UEFI (edk2) platform firmware"
 	@echo "  opensbi32-generic  -- update OpenSBI for 32-bit generic machine"
 	@echo "  opensbi64-generic  -- update OpenSBI for 64-bit generic machine"
@@ -194,6 +196,10 @@ npcm7xx_bootrom:
 	$(MAKE) -C vbootrom CROSS_COMPILE=$(arm_cross_prefix)
 	cp vbootrom/npcm7xx_bootrom.bin ../pc-bios/npcm7xx_bootrom.bin
 
+npcm8xx_bootrom:
+	$(MAKE) -C vbootrom CROSS_COMPILE=$(aarch64_cross_prefix)
+	cp vbootrom/npcm8xx_bootrom.bin ../pc-bios/npcm8xx_bootrom.bin
+
 hppa-firmware:
 	$(MAKE) -C seabios-hppa parisc
 	cp seabios-hppa/out/hppa-firmware.img      ../pc-bios/
-- 
2.47.1.613.gc27f4b7a9f-goog

