Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp514829ejb;
        Thu, 19 Oct 2023 06:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD8QzaSbuzzJhUlXRVrLsjAOrOTShqFQXnxd4ymqky06n8pRsMoKsh5TGCRLZ72rSBaS+s
X-Received: by 2002:a05:6214:260e:b0:66d:4d2c:b0d3 with SMTP id gu14-20020a056214260e00b0066d4d2cb0d3mr2663012qvb.4.1697722182436;
        Thu, 19 Oct 2023 06:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697722182; cv=none;
        d=google.com; s=arc-20160816;
        b=WsJmZbrGS7fZJa6M3yiiVXJUuXAz3cfm2lDIW6Z1MXw/9AvaQfWzCY95fDL6paBNLH
         NAzHng6Lhl0NW7zKIlNF2ubnahiZDd8B2/jpApMoGw8/vDiw141ZnUH92bgrthmgWTQF
         eBA665KJixuiNP0PWMHvZ5KzFTgv1tu5KbScKoIPX+P//HbzqbSM9st/horoYD0ezrZo
         UJHbl0JXSaOuLeeEHulMGyO6UEbTaVX2C2CEGOSXMh7XHpR06JyEYnbNPKpL0a0HKue8
         psg9CnDs3jtZYrMqBGoLBH7D3yZWYJ6L2KmbvpT2qWrjsYhT+4AjVDMN6GcNiJvHaCHh
         M6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tH+rtCHp8sEuHFOScujW6ZyjYvw8dU0f7DGGGfLETEw=;
        fh=qS7HOACB/fnzOG4UkP/DQwrsj+RVK26yEZmW8KA6D/k=;
        b=XxoZXN2pgvhOSdr1Rwiwru3H2psTCuR5s0eBi9X3H9HbMYBuMPNVLbquOTjZFP+2sr
         XpMvPH1FkApX7zZuJ1tKLCK1+l8EUV2Obf0ABJeNATbxNs7yjyO3SN3lwoNEbFL2Vrm3
         UPz7acB4XrUt1aYdPxFVBoKLDfKZE4rCys1WCb43Kumk1Q2JuArvg2bLbjc+MprRpImW
         mUWEs0mfhNXXOpC0daP9riTuQlfACipb/opyJF//myt81xe1ZrgAZfqtgnmLbVeqSSTG
         m3LFNaxfujh4SVQVVHF07FE5cPxMziVsvH5KFnE/3ZZOp0lA+M13txAkunKs5NWLoyUr
         bL0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=OI4SeQRd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq12-20020a056214460c00b0065cfd573687si1637389qvb.292.2023.10.19.06.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=OI4SeQRd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtT4i-0004dK-0L; Thu, 19 Oct 2023 09:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT4g-0004VD-4E
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:28:30 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT4d-00074S-7p
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:28:29 -0400
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-79fa5d9f3a2so308936439f.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697722106; x=1698326906; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tH+rtCHp8sEuHFOScujW6ZyjYvw8dU0f7DGGGfLETEw=;
 b=OI4SeQRdyXlf/OUk5818AlPHXir2au7bPAjQHDK+WxDLxhiN26Fyn/T4elZDKW938/
 llBuTg+/zu9taT3z48aQ0K5cR3Z5o5Xj3BzXAJUmCxwKjuq9yCwE+qgKg2wXkPye0jLT
 oMdD5q8ONlmQOUfdFP3Vg5U2ZQr5i50oM+g+uW69n823n/RrSzK/ZdRXz7mLktTWMgq3
 CENrxQcvfB/ei+OpVcHqUdbwURuL2d52irT1ZFGQMDUODzoDI+G2/hgXr30NB5UvPgHz
 UadonGGf0g+TXNUJoL34eHQG9FhpV15YUi+zHgKWpH5lrZntlAHfYo8RrYlpoDwHu98a
 XWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697722106; x=1698326906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tH+rtCHp8sEuHFOScujW6ZyjYvw8dU0f7DGGGfLETEw=;
 b=QFdht6HfbCrYajZhUcwUcw3jVYp4Sf/6WDLP1IVwbIRk07q1xOdMBe3TvaHenVq4PN
 2wEdM2Cd5w1ByM62qVkX3/9m0lal2H2t0jQnZBRKtPP2FHB/rqjNX9A3D8eSrUl9bmI7
 AN5z+EnCCOjS9RJKkE17hJtBGrP4EWk2JZQIkMadEN0+HM8fdmAc4xSzPodw7qDT9h9w
 Gc4ydkhb1yZLOhOJxJLJxKMSP/9eIO5SDyucVuZy6N5qLXRGAbFYNCjuHPSZ7y0vP/Qw
 I4/Jx6pYjq1+/1+UFneMdqKqNIaLCeivSXS+3bNDpT59bzBxE5+c9PUQTr+aDsC3TvJ5
 GMgw==
X-Gm-Message-State: AOJu0YwxQoabZjiY78Jq3JU3XqpClshyI63FiNXVSe/It7m/e+tszrts
 G6nc3hoIw0pC1FNjgXGLbVWeyQ==
X-Received: by 2002:a92:d642:0:b0:357:a04c:31d2 with SMTP id
 x2-20020a92d642000000b00357a04c31d2mr2386117ilp.16.1697722105918; 
 Thu, 19 Oct 2023 06:28:25 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com
 ([2409:4071:6e8b:3a98:dd76:4e82:7da6:44ab])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a056a00228b00b0068feb378b89sm5273113pfe.171.2023.10.19.06.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 06:28:25 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 09/12] hw/pci-host/gpex: Define properties for MMIO ranges
Date: Thu, 19 Oct 2023 18:56:45 +0530
Message-Id: <20231019132648.23703-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019132648.23703-1-sunilvl@ventanamicro.com>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-io1-xd2a.google.com
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
X-TUID: zBqVsWSI0TlJ

ACPI DSDT generator needs information like ECAM range, PIO range, 32-bit
and 64-bit PCI MMIO range etc related to the PCI host bridge. Instead of
making these values machine specific, create properties for the GPEX host
bridge with default value 0. During initialization, the firmware can
initialize these properties with correct values for the platform. This
basically allows DSDT generator code independent of the machine specific
memory map accesses.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/pci-host/gpex-acpi.c    | 13 +++++++++++++
 hw/pci-host/gpex.c         | 12 ++++++++++++
 include/hw/pci-host/gpex.h | 28 ++++++++++++++++++++--------
 3 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 1092dc3b70..f69413ea2c 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -281,3 +281,16 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
 
     crs_range_set_free(&crs_range_set);
 }
+
+void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq)
+{
+    bool ambig;
+    Object *obj = object_resolve_path_type("", TYPE_GPEX_HOST, &ambig);
+
+    if (!obj || ambig) {
+        return;
+    }
+
+    GPEX_HOST(obj)->gpex_cfg.irq = irq;
+    acpi_dsdt_add_gpex(scope, &GPEX_HOST(obj)->gpex_cfg);
+}
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index a6752fac5e..41f4e73f6e 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -154,6 +154,18 @@ static Property gpex_host_properties[] = {
      */
     DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
                      allow_unmapped_accesses, true),
+    DEFINE_PROP_UINT64(PCI_HOST_ECAM_BASE, GPEXHost, gpex_cfg.ecam.base, 0),
+    DEFINE_PROP_SIZE(PCI_HOST_ECAM_SIZE, GPEXHost, gpex_cfg.ecam.size, 0),
+    DEFINE_PROP_UINT64(PCI_HOST_PIO_BASE, GPEXHost, gpex_cfg.pio.base, 0),
+    DEFINE_PROP_SIZE(PCI_HOST_PIO_SIZE, GPEXHost, gpex_cfg.pio.size, 0),
+    DEFINE_PROP_UINT64(PCI_HOST_BELOW_4G_MMIO_BASE, GPEXHost,
+                       gpex_cfg.mmio32.base, 0),
+    DEFINE_PROP_SIZE(PCI_HOST_BELOW_4G_MMIO_SIZE, GPEXHost,
+                     gpex_cfg.mmio32.size, 0),
+    DEFINE_PROP_UINT64(PCI_HOST_ABOVE_4G_MMIO_BASE, GPEXHost,
+                       gpex_cfg.mmio64.base, 0),
+    DEFINE_PROP_SIZE(PCI_HOST_ABOVE_4G_MMIO_SIZE, GPEXHost,
+                     gpex_cfg.mmio64.size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index b0240bd768..441c6b8b20 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -40,6 +40,15 @@ struct GPEXRootState {
     /*< public >*/
 };
 
+struct GPEXConfig {
+    MemMapEntry ecam;
+    MemMapEntry mmio32;
+    MemMapEntry mmio64;
+    MemMapEntry pio;
+    int         irq;
+    PCIBus      *bus;
+};
+
 struct GPEXHost {
     /*< private >*/
     PCIExpressHost parent_obj;
@@ -55,19 +64,22 @@ struct GPEXHost {
     int irq_num[GPEX_NUM_IRQS];
 
     bool allow_unmapped_accesses;
-};
 
-struct GPEXConfig {
-    MemMapEntry ecam;
-    MemMapEntry mmio32;
-    MemMapEntry mmio64;
-    MemMapEntry pio;
-    int         irq;
-    PCIBus      *bus;
+    struct GPEXConfig gpex_cfg;
 };
 
 int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
 
 void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg);
+void acpi_dsdt_add_gpex_host(Aml *scope, uint32_t irq);
+
+#define PCI_HOST_PIO_BASE               "pio-base"
+#define PCI_HOST_PIO_SIZE               "pio-size"
+#define PCI_HOST_ECAM_BASE              "ecam-base"
+#define PCI_HOST_ECAM_SIZE              "ecam-size"
+#define PCI_HOST_BELOW_4G_MMIO_BASE     "below-4g-mmio-base"
+#define PCI_HOST_BELOW_4G_MMIO_SIZE     "below-4g-mmio-size"
+#define PCI_HOST_ABOVE_4G_MMIO_BASE     "above-4g-mmio-base"
+#define PCI_HOST_ABOVE_4G_MMIO_SIZE     "above-4g-mmio-size"
 
 #endif /* HW_GPEX_H */
-- 
2.34.1

