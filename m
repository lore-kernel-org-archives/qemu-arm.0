Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp429579njb;
        Thu, 8 May 2025 06:41:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGhfmZFM+ylMM0UMxLj9ndOyrhXYsiEqhK1j8AzX/UcxGZLfSKDVD0BJyu3PuL4Ck7HKGyGFw1Rmql6g==@linaro.org
X-Google-Smtp-Source: AGHT+IHb6ucL3rweGYpPQUak8UiErCzIMnNx2ywNTOwxmw1UoG0KZTnNdWpBCfl6dxUz/8nFHGjb
X-Received: by 2002:a05:620a:468d:b0:7c5:3e22:616f with SMTP id af79cd13be357-7caf73a197emr996008585a.21.1746711690334;
        Thu, 08 May 2025 06:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711690; cv=none;
        d=google.com; s=arc-20240605;
        b=Mi37tHqAysgxGjdcR+W1BXWwBATDWOGrsj+pDKO7ukW1dknPPDVKuq0ymqpgn/davj
         urDJv2T8T1z5QiwM5NqC5g9XN0z5fXT34C48XRRCEASriXieiHJuvYDuvCE+Gydrww3w
         CzSB76NvJpTPCQLlu1sqOn5J0CNpMPhK1XQjq6DfoVbS8vC7ilfQXyXW5gkQo+mfjX4z
         ZUwHEpiK44Vufrxh7rS2mxXjzFQgBCJ3x0htBWU72KzmcmRSqYHiNIavE87DvwZZPZ6a
         lnpGFoNAXb72YtP99JeLb1579dDr/xsxE1GhFrJSyoVB7kWSrtyYuAgfaMv+g7nOkfP2
         mRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GfnNMh8um2i71NVQR7Vo7AAo9gkZrP7mDUQkPEIxOEM=;
        fh=mrqVgQ/Zi9y5buc0Uh+k1qBn386BDuRq/zdFgpnP4ck=;
        b=ZlpZVlZVLh7YY7d7dFZhCdeZdA6QHeleGW2q5KE41qA/0VPRYhFW2DAjjBX9CwQw1a
         5l228aqlSKPTIssvgQmxg7hK+edd5XwF6fFfIiHrr/O1gxCbDWUC3XY9yXh9B9HM/XxL
         JzGdu4/Qw3293bEhZUkUBo9vU1UPxyQPRdJCg3KHoLtSVUaiFFKCCJAYqIM92RkI9aiL
         L4Loiw3KMKVfAYUYqzeDD1lf5dvAXp5XrOizsjoVptJVM35K0f1SerqdrWdPTW5Uke40
         McqONX8/2aIsYRE62JRB7tKSvZIhz5QPzJJNh9aTZe/b16xVRzBjjZv7MJ9ijNpK+EL8
         WhCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HPKYNVL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf75948easi463321985a.220.2025.05.08.06.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HPKYNVL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1V4-00010D-Ih; Thu, 08 May 2025 09:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1V2-0000rl-01
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:41:20 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Uz-0004Yi-U5
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:41:19 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b1fb650bdf7so567859a12.1
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711676; x=1747316476; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GfnNMh8um2i71NVQR7Vo7AAo9gkZrP7mDUQkPEIxOEM=;
 b=HPKYNVL/Oo3D9bI81bb6wIyVbcgPC0g8Qdd4/aj+veIe0nnneDIBgm0zxzhNlEdmHF
 QhA+uAdq7HzTNb9kdyNWfPEYDIajoWakuUrrI6Q+28+Z0U+zxjMErE+MCzp9OuhEhS4r
 EvoCxDiW3iVND21Fnu2v/BDy1GHZz7g28CpcmdFgPSFuhDxReM62i1p1KA04Y839355y
 XAiCsW14q56WCviGKwrfgmsWQ4jfUPaCnxT4v9iNNuGqEp2jztLzOxkKHkmDhxjnbnqM
 NUWQo60rCgPvLyGzauGTNA0qjEhz2X9eG90YNAPotdwpuKbEixlS9i2XCf7qLOQMwlmU
 oYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711676; x=1747316476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GfnNMh8um2i71NVQR7Vo7AAo9gkZrP7mDUQkPEIxOEM=;
 b=Eee42pZs8A8VPGlzu40i5klf29YBmJylQc+oYlM9MChqZ58wrh9ysfyFeUY5nQPpdQ
 t/jz3Pb+/9XS62FCoxWHofW/NrBd8psfAXyt/TdRnAAw2IpELbZ//U8dUBLEIzvM86ez
 ixacdyUw+2ikI9SAsskfSKEeUGch0NeWLtFJlxQa9l1fwCM0ZWXxKuo4C2f2s7Y8QDTo
 LU8nWFk1XZyED29S08m2tRZTwKd9X6+UY71fjk9FkDQLkukka4SldlitQXb6pt+A9c9K
 RkjU3+XfXHIWhBOXumMpqaDAxENPh2A233zpIWbMCemdF2hOTeVNyIoZ1Tt5L0+Fu2RD
 K/UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfy1549h2Kt47WO7Caf4oM8z8LDeT5tLMLZezvLJQ4V7mjmKYjBwQl1tWLTQzO1h9JQgzuyrXiKQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz265N98s1tDimxr6JwpXQ2rLqH4n1ywNsUyvUNMM4yPW1EL5QA
 hxUhnXwtIxjjZKZtnBzg3+j5S1bA8LK0kQyP0TjhTpsoFsyxzYnQF0HpLq4Bb9E=
X-Gm-Gg: ASbGnctt/mj34zNLCou1VPa2XdRRofQBwZEKNyxP0RN9jqw/zAx5zskKjuywM3Vze+G
 RVdpaIHGcXe3HRPvGf7XnhIbw9S+R+GUsVHI/YptTNVkloGaMr3R9/SKc/REIDZ+izceuaqMVEs
 xNkdrjLvNiKddcXgRXW0tKy7verIpuZsSU5N1Z/WcYkP0qOQJdgC0vP62KP2CBuBsKri4+j80ia
 ACALSE4cC3N/vhIhI7W1+yS6LUFhKCepx/NUyYCw5dSPWmY2lXdertY326BdWdjPmypGI0EudDN
 mTJurAYkQahJqobQGVi48GaYhA4P/9bFBOi23qZ+Ly0ChaAXlsyCN7e//ksxbL+399sjR6Hh+Bc
 gg+Pjaqg/HBWW3+g=
X-Received: by 2002:a17:90b:278e:b0:2fa:1a23:c01d with SMTP id
 98e67ed59e1d1-30aac1b407amr10664017a91.21.1746711675615; 
 Thu, 08 May 2025 06:41:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30ad4d56981sm2115127a91.28.2025.05.08.06.41.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:41:15 -0700 (PDT)
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
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 14/27] hw/intc/apic: Remove
 APICCommonState::legacy_instance_id field
Date: Thu,  8 May 2025 15:35:37 +0200
Message-ID: <20250508133550.81391-15-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: dw+poA6gJUYw

The APICCommonState::legacy_instance_id boolean was only set
in the pc_compat_2_6[] array, via the 'legacy-instance-id=on'
property. We removed all machines using that array, lets remove
that property, simplifying apic_common_realize().

Because instance_id is initialized as initial_apic_id, we can
not register vmstate_apic_common directly via dc->vmsd.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/i386/apic_internal.h | 1 -
 hw/intc/apic_common.c           | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index 429278da618..db6a9101530 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -188,7 +188,6 @@ struct APICCommonState {
     uint32_t vapic_control;
     DeviceState *vapic;
     hwaddr vapic_paddr; /* note: persistence via kvmvapic */
-    bool legacy_instance_id;
     uint32_t extended_log_dest;
 };
 
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 37a7a7019d3..1d259b97e63 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -294,9 +294,6 @@ static void apic_common_realize(DeviceState *dev, Error **errp)
         info->enable_tpr_reporting(s, true);
     }
 
-    if (s->legacy_instance_id) {
-        instance_id = VMSTATE_INSTANCE_ID_ANY;
-    }
     vmstate_register_with_alias_id(NULL, instance_id, &vmstate_apic_common,
                                    s, -1, 0, NULL);
 
@@ -412,8 +409,6 @@ static const Property apic_properties_common[] = {
     DEFINE_PROP_UINT8("version", APICCommonState, version, 0x14),
     DEFINE_PROP_BIT("vapic", APICCommonState, vapic_control, VAPIC_ENABLE_BIT,
                     true),
-    DEFINE_PROP_BOOL("legacy-instance-id", APICCommonState, legacy_instance_id,
-                     false),
 };
 
 static void apic_common_get_id(Object *obj, Visitor *v, const char *name,
-- 
2.47.1

