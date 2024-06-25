Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp699728njc;
        Tue, 25 Jun 2024 08:11:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvdR3dO/0NzliRzRhivsBVrhe3qitFnNk6sGRg9iLbFlf48AFb2PNtx+YVzxsMOuIvbVG5UoGBjY5O5jCQUeg3GU5G9mhw
X-Google-Smtp-Source: AGHT+IGDsSNv/nfVp8SBb3Hhl8MmhF/GoMKwOtw6R22KWCwnvTv2aPKAvCeTMiFZNruAO0YuM4fJ
X-Received: by 2002:a05:620a:4621:b0:79b:f689:b228 with SMTP id af79cd13be357-79bf689b561mr494313285a.24.1719328295628;
        Tue, 25 Jun 2024 08:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328295; cv=none;
        d=google.com; s=arc-20160816;
        b=EokxehFx1j/yFNbeF55m0e64hEHLc6jWFUREP3p8d1QNvSuieJBxjm/hJ4vQ9imLMl
         062YZMA6p+aLmiYrBMPIUlru+up3cS0uY3KM6iGCKqi1oDJ3gId1R1C+XQYJhciK/KrC
         zToJHxaNqnu7gJuvHq5CLR1mRLc+Y/lvuQNavOtL2ZjicHbocRXEZMh4VL7OzQey7c8D
         iQwp2zwEm5KoVQbehbLxL+/EyFTnZ9R6q1L5Q3DPmZRN5vHOe9ls9HsukQ9em7zJK3eq
         sM9pIbwcf/lx0mjCJ0opArHPuYUzp2pNMGz7x6vm81hhfB16OeBNfBn7tFkPpkh3qGGi
         6R/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RHCVHGsnm67vgclIl82zPh5XLBIaF6XqB4NGAAUBUiE=;
        fh=gmC4GW9vEZSIiJvoFOUgziNG2tzIe1Humf9dMtHd6+I=;
        b=Pzt4dBgnaNc86p1777LoUJWvdiRoIgopReLo8w/Q//FQxaGvdeEGzkg1AXv6hMW6zP
         WyQeI3XRCn6FjZ+z9OBMxpoDy65RxPpyKdouf4ND422QZAXorLov/DGx7q3m0n1INhG+
         PjSqyza8oDM5glYdDahtexqmPH6sy44FV8MNJEEsr8D1q2s4BLksu29e+HflqpKQmP0u
         SAvVnI4LdJth7UT59iw6CLwZ2KXOL4mydnmHJDaX0Kp+JSPzIq2NB0MleyuybSZe1vSJ
         SrikT0S8kCziylFkfaKQ+k1nT5HBMF3oTB9pzyRsjQZUvXe9RPqq4xZTErak3+bZDRLl
         C1Bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=RViFI9hI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce92e4e3si1095310985a.532.2024.06.25.08.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:11:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=RViFI9hI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM7oG-0002ok-AN; Tue, 25 Jun 2024 11:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7oF-0002nM-KU
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:10:15 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7oD-0006os-QH
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:10:15 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7066cba4ebbso2114723b3a.3
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 08:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328212; x=1719933012; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RHCVHGsnm67vgclIl82zPh5XLBIaF6XqB4NGAAUBUiE=;
 b=RViFI9hIVRh6mVRHK7WJGI0QtbzC9KL5AWXXup8n+e6HB696uD/ONv0DSe1n/MS1wS
 m9jW/U1olLWVARgBcnD3kQAyAspF+lCyDWv4muBPqvBifsGfPD547048Xj45n1fEEugz
 OmmbXkDEJMY20q0Z7DGY9vJcertuckSmxndhB0RUyWvfM1JoCqqLFLUPE7/3ZL2aAhzj
 cxa5D0SKVd5qtbO4FYWJQhEJtS+WdGYYtJkQkzMJOGlZP2V9RJfe2c/dX7zks9SOM2Xy
 veDOTiDSEnlGiMKzQLSe+rlIIwHTpToe0W36d2FFCla4ljh1y9XTwDRnJ2EqR45w8P38
 fZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328212; x=1719933012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RHCVHGsnm67vgclIl82zPh5XLBIaF6XqB4NGAAUBUiE=;
 b=RmifUzS/BdskVScQBagKHX9Z0AWyhsVy3rqNsuRrbnlP7mTppyhe7uP9+RjPBlnE0m
 9QOa1ijPKJr20wr87Fj7Dzh/QxQ3TMoFaA5A2xEg65gFim5PQKJaviwDSNAg/MxHq/FK
 dBdL2u9/Y5R3KzXES0vhPjaI3Z2CJO4Ajeh8R3STKuSMIZbEwX9TRJZctZerLCz6JcDd
 hefASZTe/QXY/wamqj/RRbjNyuLP2h/sh1+x6XuU/Eg3lb61ZsnraPzePy+3dS/6nDqA
 xfnWPfU6v/CpJj7UupDXuBzb5xskNW3Gb20e9FmJ+McT96O9pSmg7I9/01xh3kffCcu6
 V40Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4UTciWmMP0iGI1UgL74jcL+wYI0kvjcrZ0eKPmVUNm3JZu06Wpy7JkiTXmhXjhQQJ9xUcJXScfgstXQ7L6jO/ya8w
X-Gm-Message-State: AOJu0YydvRpQejV7DFV8VfJ48RzIw2Aa26g7bXd8DvbZBGQH+UTGuOHC
 vRDB16BY6GIHOEbKI4SBZRr23iAS8rPs4xlWnRpJpFWooDW5ZPCtxrGa8TiMCmE=
X-Received: by 2002:a05:6a20:2a05:b0:1bd:226e:6ce0 with SMTP id
 adf61e73a8af0-1bd226e6e9emr1428122637.48.1719328212462; 
 Tue, 25 Jun 2024 08:10:12 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:10:11 -0700 (PDT)
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
Subject: [PATCH v4 14/16] tests/qtest/bios-tables-test: Add empty ACPI data
 files for RISC-V
Date: Tue, 25 Jun 2024 20:38:37 +0530
Message-Id: <20240625150839.1358279-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x433.google.com
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
X-TUID: 1rS5h6s5fB0x

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

