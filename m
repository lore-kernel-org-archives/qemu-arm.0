Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp151317njc;
        Fri, 21 Jun 2024 05:03:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXv53RfFdLm+UM9QiH2GijjGwKLmJ1iY2LEnmFXHb+a3QuMT0X0follstSytH3kDwMGq5AGGLfbBmsrFbM5b+hRT8v3jnDg
X-Google-Smtp-Source: AGHT+IEkboX2NKApXaCzCwU7UjxtXX5KWRyw55EDwKtEGKxh8WAPdOiZspU1CoOpY2WbJaP4Dwd5
X-Received: by 2002:ac8:57d0:0:b0:43d:e6fa:4dc6 with SMTP id d75a77b69052e-444a79e4428mr86876181cf.38.1718971394979;
        Fri, 21 Jun 2024 05:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718971394; cv=none;
        d=google.com; s=arc-20160816;
        b=ISGy/+u2OH7437cq58ZnT+Ws2746OIV7G5Lj4WTme74yauzRcUpV8EG8f4bNoHFQGb
         E97BbSamrVGwCMwp6dV9g66YiQ5Zrw6HEJVyCSAeJtpNqvZcx6gOnW6rX6p3QFWsqrE7
         k5g72ocEy1ZYSIhjNsIJddX/igBl2P4w551P4InSPFMT/P1Utb19dIcGMJwn0R/+4CkN
         5W/gby7eh1W+QMFvquc1yXX6kRNV5DnlfhiTFn/XsHfpQKVB7s8N1JdPx2GIRwWOE9gs
         Vf6ggpKfQekgKIpFnpiRn2xQg0UAMP3Qx44PEZgyS8Ueg4dyqQeo/r+nJON0KrNNWEGl
         Zw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RHCVHGsnm67vgclIl82zPh5XLBIaF6XqB4NGAAUBUiE=;
        fh=M6faf41HwYICzOVaUoPZD61d1KIzbzSQMs4UV/1geyE=;
        b=qwBbZ8l1Lt0mPgsPL+AAbPN/wYrBs+jESjkYbfFSZmo1UJTZ9gon+R0nqKNFsMrbiJ
         J/kFGfVtOcolLBH5Kz//nbbPwtiQz/uvxYEw+VEy/xJQlIj/ZP8ndGtQdfyFJUMf2MFS
         tPpkQPZrFetf0OwuIBlMFAWiIPiyfODlvJaAF51am7xN1EnwqRLaWVVlwQ8+Hgzx0/rl
         4RfQjmDSdx/fYlSor+GXp6LrHTtz6PHp5YL6sjz9vXy0BQyKzOCt7i5IsiX+ZHvBT/Fr
         DKiA3KYyCmI9DTcvI3xKFNlzj/JH9uIsXxZWWNn1IXUj/suc4v/SW+85SlBUjswecZ09
         JeYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=PuQ8CqSF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c671b9si15416341cf.649.2024.06.21.05.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 05:03:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=PuQ8CqSF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKcwz-0006fO-G8; Fri, 21 Jun 2024 08:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcwT-0005mu-Dz
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 08:00:36 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcwR-0003fm-8s
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 08:00:33 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1f9aa039327so16352305ad.2
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718971229; x=1719576029; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RHCVHGsnm67vgclIl82zPh5XLBIaF6XqB4NGAAUBUiE=;
 b=PuQ8CqSFNkCzv2vaMZHSEuS6fcHYH9nugu+6FuT9i2F4h1OXhLOdbOSxMIwlwRPK8B
 BKV7WS8Ri5QvXWstFwfxGsMKdZDRiNJ9mOVGF+wTh7VyLVbCS/28dSR7J6ZTT/tVkoWz
 Fxjs9eGakGx5KRTrm9riGUWKwMuBVTMwqrGpVpDj2MMuG0hh5qgqaUW812GCnmBRB9+b
 5ZvR5Gxka6koJFzUBM/lXjxdNEkaykXjSFUQD2rLyggFRp8j9/gZ1c63L4AOWBfhM3I/
 UWNPBHQMJ3r6Idb8JRos9MrgsAWmBR7Z5gq/5Gmpoc7+JBu7YZ2o3xfuwgKMtEI6hpyh
 EPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718971229; x=1719576029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RHCVHGsnm67vgclIl82zPh5XLBIaF6XqB4NGAAUBUiE=;
 b=OcwXUWFD+nWgO//YTvpxRdSkAvWIxGg1r4eHAJTVh/4hSf9mZac8k7xg3rO+mVZmAC
 nseJsfGTeRPLlmwr6hq/6HaOxknOo93TmO4ZcFn8xK3D0xZhSR6NkQw0Za1Jh+Uv75jK
 Nn4reaBCEtSLiclVCCkv3aDRBXRphXJ2DyIzXLcVsQG8B5ZXu6z0+oZOjzZOIHZrYj2J
 qa7fVKM9DNP41iz6xTbTXNL95G7yBubz1jhltu2rMgZYphWDnb3L0qey4hUor+8U3iBs
 0IfSET5+WNeXbNajvLGXW28T9iKfl0WUGDuD2C/yAfpiyxTZmjMT7XJf1oC3S12DsXme
 6VfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe2fV5XYvfqkcfgBX5FWoejTgLavE/FG9DHDuF7fIVzi82jt0Y2W+9OX/6fPNBSLLQccyXuQ1c1zVHswLorlLbU2m0
X-Gm-Message-State: AOJu0YxYnjEXlWAiqBX3tSoZC7nYmWMy3RiQBO7VS3gmxchsXkMlpAtn
 zKikk0I0izbOT2OBKnr0vdLZNidEq50JqZ9ddJkAIjPXlkxPnE9+bIJ4RDAp1OQ=
X-Received: by 2002:a17:902:e743:b0:1f9:f9be:b131 with SMTP id
 d9443c01a7336-1f9f9beb3a3mr6242625ad.51.1718971229040; 
 Fri, 21 Jun 2024 05:00:29 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbb606dsm12422995ad.270.2024.06.21.05.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 05:00:28 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 13/15] tests/qtest/bios-tables-test: Add empty ACPI data
 files for RISC-V
Date: Fri, 21 Jun 2024 17:29:04 +0530
Message-Id: <20240621115906.1049832-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62a.google.com
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
X-TUID: B84Dt2to1DGU

As per process documented (steps 1-3) in bios-tables-test.c, add empty
AML data files for RISC-V ACPI tables and add the entries in
bios-tables-test-allowed-diff.h.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/riscv64/virt/APIC           | 0
 tests/data/acpi/riscv64/virt/DSDT           | 0
 tests/data/acpi/riscv64/virt/FACP           | 0
 tests/data/acpi/riscv64/virt/MCFG           | 0
 tests/data/acpi/riscv64/virt/RHCT           | 0
 tests/data/acpi/riscv64/virt/SPCR           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 7 files changed, 6 insertions(+)
 create mode 100644 tests/data/acpi/riscv64/virt/APIC
 create mode 100644 tests/data/acpi/riscv64/virt/DSDT
 create mode 100644 tests/data/acpi/riscv64/virt/FACP
 create mode 100644 tests/data/acpi/riscv64/virt/MCFG
 create mode 100644 tests/data/acpi/riscv64/virt/RHCT
 create mode 100644 tests/data/acpi/riscv64/virt/SPCR

diff --git a/tests/data/acpi/riscv64/virt/APIC b/tests/data/acpi/riscv64/virt/APIC
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/riscv64/virt/DSDT b/tests/data/acpi/riscv64/virt/DSDT
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/riscv64/virt/FACP b/tests/data/acpi/riscv64/virt/FACP
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/riscv64/virt/MCFG b/tests/data/acpi/riscv64/virt/MCFG
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/riscv64/virt/SPCR b/tests/data/acpi/riscv64/virt/SPCR
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..70474a097f 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/riscv64/virt/APIC",
+"tests/data/acpi/riscv64/virt/DSDT",
+"tests/data/acpi/riscv64/virt/FACP",
+"tests/data/acpi/riscv64/virt/MCFG",
+"tests/data/acpi/riscv64/virt/RHCT",
+"tests/data/acpi/riscv64/virt/SPCR",
-- 
2.40.1

