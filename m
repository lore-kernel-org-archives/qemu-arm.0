Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp430547njb;
        Thu, 8 May 2025 06:43:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhQyIETnQ3gqgYs0xdNnnOLwe78JwKDtEF+Fvx5Vtc0et79P1wznkwHCGb+ebDvSYkZPoylYlrgfhErQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEB97Wegd6vAmOZd7NLCZzQctqEk4jEimADxJAOP7oFNkD9u7Ewibe3wTaYoLr21IdP2cfc
X-Received: by 2002:a05:620a:24c7:b0:7c5:50ab:de04 with SMTP id af79cd13be357-7ccf9e3d4d2mr438898785a.32.1746711784737;
        Thu, 08 May 2025 06:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711784; cv=none;
        d=google.com; s=arc-20240605;
        b=Ce+P6igDfUHGA64WDrySL6CPxzcj0rMXuAe4QRP3xrgZHjAYSwG7tcA/WqFY1RB0kZ
         yvrS7gtSCQG8NnXH7aHf/5Y34uKtOtdaucAH0hOfRDWw41n2MQxYhD6bLwb1PkiS6wEO
         1RPVP9FFWFygief5D+7G26q3gqteZt9e6oUukHlEtMG/TXbCxj3KmHTiGZ2rkOoqnF4H
         BFaytsxxZ38IRxbowV/U6vUcgnHv1HGqUXEg14mG4c/XraLdFN7+d6nej62/9YPqUkvJ
         RUYw2jvCPLDJCCF8w0GTnNfz65jRQ39w4Dl4zFUAbaD9WclCDtVd/YPgooH42z8TDMnF
         T9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gg679U0oeTq/CrQiB/JmPwYk2e2+O7nBapgQj4COJfQ=;
        fh=vZqpjGjBR+f1BFxbRbhjM4qgeX9Km4r36Ib77pgWJoY=;
        b=BZv+ytRUMdoMMgpHaAH0ik4rL9C3Ot602Dh6LwIobNs/1UIefO2J/vZJ7YiNoAi5s3
         Y5717a7dDyBGxWqQJ1pjQqpUHLTXGv8cPXMakwUzpiYaFOOOTuBkcGGGoGuQzALN/qfc
         sDMv2sTT7XgM46gbTi34dqaZXj2tkIT31k1tI6RQHk6kps1v1EvrehX2A5KyruD/EqYo
         C0bgAwwn+FTuOgUxUFoSXiImaFjStspvz9Gyut3pHptT+JmimWwCk3zPQbrBxAAcnPCz
         aBssaep4gjQqWmThx0O2zMm9i7uTcq3sFkkzFR344YS/Fs/qI8Eha4z4zLtHIMVRXX2U
         OgiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VCLuXgvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf75ae0acsi468857885a.379.2025.05.08.06.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VCLuXgvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1Wa-0004S4-NC; Thu, 08 May 2025 09:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1WT-0004On-1y
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:42:49 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1WR-0004jY-6z
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:42:48 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-22c3407a87aso13408075ad.3
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711765; x=1747316565; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gg679U0oeTq/CrQiB/JmPwYk2e2+O7nBapgQj4COJfQ=;
 b=VCLuXgvoFb4mjBA3mHRP7790++foWnuIb8qexm19n/uuzXW3ybcunp9TonNPNGhUw2
 b9itChusjpb6dxe6CiIjlUeLZTyEHfp+FQbrxBa74cNw+hgY1OBOBRXXuqEkTsUvVE14
 PK0/xPHFJZw1HwRw180/adto8dysyMSZmH5l0vf7+ceA6PptajxTBlAFtC9wtjrGBZSv
 4lzAm1O5fjAbWtfgjMp2c8oygkHmJ9stlYvbSA1E7nwpb85L5I8eG2NkqTBWB9CnE6GV
 AazqTUkRrdeUxgQi8mZD76xFg6mU/5nPmJW4YbLT99GWQc9VCgdHZYOWbBUYKsgxk21V
 iTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711765; x=1747316565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gg679U0oeTq/CrQiB/JmPwYk2e2+O7nBapgQj4COJfQ=;
 b=YAlgx+a8MUl4pdtgEqRtzaBHePyw/a1QTCLTnCBFaHqQF4JtiiamT2k+ctUbnNlOO8
 G5GJapRjj+JidS2VUVE9d3JY6ixJWZ01U8gbl8VzI8tHDbD1CAH1jqb77kl97uQc4fdV
 63D3Ocp+TeKbefK/W6QrSeGMaKeR6B4n+3gr9L8DrE6Z8X+CUt3kEEjf9bn5H/iNAs82
 r/RasmGdG0Do4pBv4HR9+4V45OY6qFynShxwKYG2LUg1m2i8ek7co3rI0d7kMc+AfwOG
 yjpau+Z3v3O2NoNgjsmnUpo8kxbDKjq5fpC9NlahsMQQRRRp+aYny4GaqJxfbptowce2
 z4kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrtrbJvJMaWSmNil++eHVYScRubgW04Co2ul9r7CfRQOlRZU+MUOEiGL5/i33AbYK8FU2ZX1Oq6w==@nongnu.org
X-Gm-Message-State: AOJu0Ywvc/utzdgrUjTRwPNc7WOFZVV4AA+wVlhISo6TMxW6Ybm29j8t
 aFpqxnKhMxEGaDxhu2FNsuFWwd1eZbyAZ433uqADlgmbpAU3JvSh2vJGMSVSEKk=
X-Gm-Gg: ASbGncvFqd/uEGMxFQgguzz2PGh1zI4JzgL73AiCedmaCfpUQ8ssfS12Fxs/KXo2BVE
 ubu1t50HBPw+YtbYRj2lzazIjAYKS2ch1bavHeGCw2GURYblRvJmT6SiN2pLUBT5NTQMV2q9uWl
 zkTieykdy6+yaNP/nFHF3sshF2htqRM2yCpTduSwqI2Z8V0EtXw+R/XsmEdBJBKU1xDZ+hCydLQ
 btEyZj0IKWZSMBD7xpAWuP4qCdMtHONBThwRkBCBmtO3LWMcspT1yy987ju6UZ1QjhXdJHah2EH
 7Zm0alMWWgmAVmk4efa1TseJ8bb0Z2IO/YQaBcZP5l9w/KHot5KlDUxZAVjCyIWSyrFaqvSKx/Y
 uWGNy+PT37uTwqT1lXVVvUpX2dw==
X-Received: by 2002:a17:903:41ca:b0:22e:421b:49ad with SMTP id
 d9443c01a7336-22e8f0b60a9mr53754775ad.46.1746711765042; 
 Thu, 08 May 2025 06:42:45 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e15232655sm111626845ad.259.2025.05.08.06.42.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:42:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v4 18/27] hw/i386/pc: Remove pc_compat_2_7[] array
Date: Thu,  8 May 2025 15:35:41 +0200
Message-ID: <20250508133550.81391-19-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x630.google.com
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
X-TUID: QjdN/r5mCCb4

The pc_compat_2_7[] array was only used by the pc-q35-2.7
and pc-i440fx-2.7 machines, which got removed. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
---
 include/hw/i386/pc.h |  3 ---
 hw/i386/pc.c         | 10 ----------
 2 files changed, 13 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 4fb2033bc54..319ec82f709 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -289,9 +289,6 @@ extern const size_t pc_compat_2_9_len;
 extern GlobalProperty pc_compat_2_8[];
 extern const size_t pc_compat_2_8_len;
 
-extern GlobalProperty pc_compat_2_7[];
-extern const size_t pc_compat_2_7_len;
-
 #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
     static void pc_machine_##suffix##_class_init(ObjectClass *oc, \
                                                  const void *data) \
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 65a11ea8f99..c7cdbe93753 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -241,16 +241,6 @@ GlobalProperty pc_compat_2_8[] = {
 };
 const size_t pc_compat_2_8_len = G_N_ELEMENTS(pc_compat_2_8);
 
-GlobalProperty pc_compat_2_7[] = {
-    { TYPE_X86_CPU, "l3-cache", "off" },
-    { TYPE_X86_CPU, "full-cpuid-auto-level", "off" },
-    { "Opteron_G3" "-" TYPE_X86_CPU, "family", "15" },
-    { "Opteron_G3" "-" TYPE_X86_CPU, "model", "6" },
-    { "Opteron_G3" "-" TYPE_X86_CPU, "stepping", "1" },
-    { "isa-pcspk", "migrate", "off" },
-};
-const size_t pc_compat_2_7_len = G_N_ELEMENTS(pc_compat_2_7);
-
 /*
  * @PC_FW_DATA:
  * Size of the chunk of memory at the top of RAM for the BIOS ACPI tables
-- 
2.47.1

