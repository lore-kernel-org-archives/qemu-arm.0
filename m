Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp431784njb;
        Thu, 8 May 2025 06:45:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXC3tTPbwQ3SJnbLcNvQyenn7Wj0Lc4M5X0SApa/dqDVIHJymf7+VWd47IOXmxTUEJO9Xo+0kaQn6GrcA==@linaro.org
X-Google-Smtp-Source: AGHT+IG+r0Dkqv8LXgqi7gSSmPhuOFTiCinJtru6+SFWLx2MCTau0CxxfHCRQnz/d5bdO/skutEC
X-Received: by 2002:a05:622a:1f1b:b0:47c:67b5:73da with SMTP id d75a77b69052e-4944924d3bdmr52952391cf.13.1746711901479;
        Thu, 08 May 2025 06:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711901; cv=none;
        d=google.com; s=arc-20240605;
        b=M7MDj6MlDXMxpVqVkU2/7ctqewARCTIfdJNwtZla9dL/pFxj1TUQOTJXePcPOeC6ze
         n0bdgnUvKvmdK/NnMcXPaCeum8bGWRaEG4MiQJYviuGt2grMMD9dEvKV9krFjwZ4UaJ2
         nSdsQZ3z6xjmp4TsMLvovcJRoPbHfyxkFqgnA87gamjYF83L7A4sYN4fOwMA4b0JvoPj
         Hhv72bgkk8mJoFDwMVTFByVfFxzHajjXi68yD5j6R7F0mr+UZ/WpQn9FrgDjhKOQR7sz
         n9R5M3DhN9IzNsPGY/WaJN3O0tkyPiskUeuObeo7B+pUQDPTc1mMbPSIIfp8KSThuVvP
         gZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ABC8+QfGyso1WyDvOcXI+0OZWgW+TnNwcrP3jxKT+bs=;
        fh=j6vsjORnRZpTKe4G4XfTNj5CWB5esMYW+nZQbP03Fnw=;
        b=PMzTgZVE7goSQFy6xICI8BiOnYHjIpZJPMj5NUlrPAxyuP9Fv9ANP0uTT5eyI0I6UU
         TBLizFfxzHm8UADu2NKaGFrQjnB51+YdxvTsEmWbpXnvkPSwyXR7/3a4Zqdg6sxyUJtF
         cp0lTLdAv3hF3THz0h4iul+sIqnb8XKjV+3Q9R+VCEZ9BxAqVmvhLSfL4S55KdEbwJuk
         bKB8p7ubajCHsF9whNfq0B8OSDM5pX7QRs4b76PXHJEAGlHPtyF3+zBD6HSgrwsDfPCO
         a4gJK302c397u5uCRQ9nwfqpszWs0xcZqGmvtkeNV3WQua+l+mP5ekZvdnGUzaMlzDir
         JTsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QOUTzPxC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49220f81c5csi49114081cf.75.2025.05.08.06.45.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:45:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QOUTzPxC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1YL-0001bi-7l; Thu, 08 May 2025 09:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1YI-0001R9-I9
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:44:42 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1YF-0004yL-5A
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:44:42 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-30820167b47so901084a91.0
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711877; x=1747316677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ABC8+QfGyso1WyDvOcXI+0OZWgW+TnNwcrP3jxKT+bs=;
 b=QOUTzPxCqlZc4K9W/VfTZrsgac9diUmTUlj3ALrUr05YAoqk3Z9Rk+P/DD7rotCo1x
 qyY/BzuH/fE6MoGbC7zHQtqUBXjNETy/7f+zoFfpwd0G+cwiDDAFCiX4ZJ2IAg+xPdFZ
 duT+inpobW+E/hI9pL/0Ic7KFTnjC4tOFFF5CuoJRMVBfcxHO+KxaSHIkzvLSOx0ElL8
 Mgimi4UwsTiVQeQ5npRArdK0Up4TAHqTXpdDtOtqrg6OAK+hz7p976M3qoU0w+SvLRDa
 Deo6oNpHp2jU6RCqcrFXi231i4uI8u8AXZcUacUDenng5dTEJkLYe0YQdiGNPT2E5cpM
 bL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711877; x=1747316677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ABC8+QfGyso1WyDvOcXI+0OZWgW+TnNwcrP3jxKT+bs=;
 b=bO+9zv1aVSWOPbcKVLHSOkNxO7N2kmbzbsuRQCq9U3yb1kT0Zw8toGAfQXqldOna4Z
 FF00qSsDkm+km7omWsXzr+ILeW5JMpkOhRac7sm42G1bs1JkFwk8HNoE9tLJi0aNS01J
 eSguGmKH9FDs/n/GTN02zMtZWwa7sagHfkqgVqOclvbyfqH57RBy8xMHDe4tHDJ+OxP1
 e8f7f7PugH4mdZNb+2bBItEdqz1zaAIoBH4le/+xyQangjEjVndkqvFtSLWM+AymjPrc
 WFJQC5NmTO6aEyRMe4j0sx5HvYRR4qfOG3+IXRkuxwvkbA9JXiU7lPgh2CMsvLWUyTZX
 8viQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw6e1XivODjkmShiv+wkKW3Jid2aUHsU+ucN7tpO34yTI6x5ybvGilliaGDzfbAx/l3qQsbkzczQ==@nongnu.org
X-Gm-Message-State: AOJu0YwEGzzfUb3ryg1bM0zVI8pbTliA5RgP1An7DuNyq5bjfm19MgkM
 EY2kZxvJfD5vGMJ7TkmD59xgiK3tu4/39fVh8Nr5uscrED2+4QJ5bqDV18xX+/WoV/cnRsLOb0g
 HcrGV2A==
X-Gm-Gg: ASbGncspRLpd5SN8EjikcF8Fs+6ISRIOXYPw3aBOBpUNv49PHqb6UPhwiPX3b8DIfpb
 GEFZJbm9+DNnXQjfHwJGSK2LX1iAnqBBIt7czEzhz3Hk1A2wZaHgISsGZdQPqC9l1ZKhfArSP1F
 SCUM03Pb4/EQKwVJlLltphYb+MSzwgl4Vhq8n2xYH4TuMKFI5fKoOj5DpnxTC01wrW92KVVBHy2
 h/3pxSX/jHprg8WOv41u8b8orVpMhp9MWP9/fno0T5vvgiJfI6MozieKJe9bxxEHXGnjpCaoSrq
 x3eOaVPwZiG15RwPNKwnr2wCHDqSzF0MOat35KWyzl6soY3lwS8b9yIVkAtvFOY2OuCucqa28sA
 CzK0uL1apWFIZ1us=
X-Received: by 2002:a17:90b:224e:b0:2ee:c30f:33c9 with SMTP id
 98e67ed59e1d1-30adbf3b191mr5502686a91.14.1746711876787; 
 Thu, 08 May 2025 06:44:36 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30ad474a05bsm2173239a91.2.2025.05.08.06.44.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:44:36 -0700 (PDT)
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
Subject: [PATCH v4 23/27] hw/i386/intel_iommu: Remove
 IntelIOMMUState::buggy_eim field
Date: Thu,  8 May 2025 15:35:46 +0200
Message-ID: <20250508133550.81391-24-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philmd@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Ik0ALnzn5zQ5

The IntelIOMMUState::buggy_eim boolean was only set in
the hw_compat_2_7[] array, via the 'x-buggy-eim=true'
property. We removed all machines using that array, lets
remove that property, simplifying vtd_decide_config().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
---
 include/hw/i386/intel_iommu.h | 1 -
 hw/i386/intel_iommu.c         | 5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.h
index e95477e8554..29304329d05 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -303,7 +303,6 @@ struct IntelIOMMUState {
     uint32_t intr_size;             /* Number of IR table entries */
     bool intr_eime;                 /* Extended interrupt mode enabled */
     OnOffAuto intr_eim;             /* Toggle for EIM cabability */
-    bool buggy_eim;                 /* Force buggy EIM unless eim=off */
     uint8_t aw_bits;                /* Host/IOVA address width (in bits) */
     bool dma_drain;                 /* Whether DMA r/w draining enabled */
     bool dma_translation;           /* Whether DMA translation supported */
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 5f8ed1243d1..c980cecb4ee 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3823,7 +3823,6 @@ static const Property vtd_properties[] = {
     DEFINE_PROP_UINT32("version", IntelIOMMUState, version, 0),
     DEFINE_PROP_ON_OFF_AUTO("eim", IntelIOMMUState, intr_eim,
                             ON_OFF_AUTO_AUTO),
-    DEFINE_PROP_BOOL("x-buggy-eim", IntelIOMMUState, buggy_eim, false),
     DEFINE_PROP_UINT8("aw-bits", IntelIOMMUState, aw_bits,
                       VTD_HOST_ADDRESS_WIDTH),
     DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, FALSE),
@@ -4731,11 +4730,11 @@ static bool vtd_decide_config(IntelIOMMUState *s, Error **errp)
     }
 
     if (s->intr_eim == ON_OFF_AUTO_AUTO) {
-        s->intr_eim = (kvm_irqchip_in_kernel() || s->buggy_eim)
+        s->intr_eim = kvm_irqchip_in_kernel()
                       && x86_iommu_ir_supported(x86_iommu) ?
                                               ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
     }
-    if (s->intr_eim == ON_OFF_AUTO_ON && !s->buggy_eim) {
+    if (s->intr_eim == ON_OFF_AUTO_ON) {
         if (kvm_irqchip_is_split() && !kvm_enable_x2apic()) {
             error_setg(errp, "eim=on requires support on the KVM side"
                              "(X2APIC_API, first shipped in v4.7)");
-- 
2.47.1

