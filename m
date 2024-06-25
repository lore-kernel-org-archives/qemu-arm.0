Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp699658njc;
        Tue, 25 Jun 2024 08:11:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJ9j/AYJ1zC3gSW9+NzzMeVREGdH1BLXo1fQZLFWhIImkhUw2aMa7glIKJfop1YDAz/XHZ7OA06sb0uW6iendiEBQ3SNDY
X-Google-Smtp-Source: AGHT+IHF3S3gE3DLZLR6MdFARsZ9SuV2Te/h/meAWpTRHBE3ReL9i2NVQAJh04HswgjXQW6NdLma
X-Received: by 2002:a05:620a:462c:b0:795:4972:3698 with SMTP id af79cd13be357-79be6e53fcamr836919485a.23.1719328287293;
        Tue, 25 Jun 2024 08:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328287; cv=none;
        d=google.com; s=arc-20160816;
        b=iMNL/FQKpaK0H4/S3ivgTOWNCyhghcuT0MUvNsgsKiXRGbVaaZyhg/eGA8a12qRCrA
         GBZEu8PbAAx8saZqiaNt1vf8NaamrYJ/RueUTsqPsslQ93tibmjU+BUWWnQJ20LhhlvB
         koeDmfc68X6czEhO3HcjOp0injMKubci/9KkjuAs3geifeTvhYsSuIU4nJRTLvKu41RC
         aVSxXk1iWXvABKppto4PMlYCnh8Lsa4OAOfDnHIe7b0c0ZQSsZvAaYb6x9dpvXm4HuYn
         CDNNKh8kaWYBdg1I27DW9vDtwxdu7n2c0Rbqiw3KjtblmqGOzK2avBgwp8fM3R5E/sra
         1UjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DmQd1XYOjtrz6GVJ8DgvhIvqtRGpPGZCjPKcIxlbjuY=;
        fh=1pUHL//VjQ6NMLEt24B8VNbDUGNZmWjoBrXL0DH6aWE=;
        b=F/nBF/saSBry01/glPWXdONCQqpgEvAeuWxBVvLOPBRnOQiRgPtVcSE5KTUjcuVplU
         BZkNFI5kQvizfpNJapzoHsFMkJ3OJpMGHCr9anEirZq0fDE4TT+1M+sWwE5QjWsxiGrS
         L1Q7qPvBCO0lUG0JIC9QFcBy9l4C8qY4KTZLAAizdzjx6q8FxY0bu6BKNxrsfT6IuPQy
         lUTdDFripJ2eZSXHqbdLJqFZ8r7+oIVNNx0d7W4dljRmok85ZKPFCEijVb4limwaM+qp
         eIag/TG4GcR6zFXH/gMSu8l2Brb6L6y9Da1ne1+ItfDrRZe83gnUx9LV+ev0AnKu5v5O
         YHNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="R/dlbnri";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce881700si1094064885a.151.2024.06.25.08.11.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:11:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="R/dlbnri";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM7ns-0001sk-JF; Tue, 25 Jun 2024 11:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7nr-0001s4-LE
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:09:51 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7np-0006ZR-IG
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:09:51 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-70666aceb5bso2612926b3a.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 08:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328188; x=1719932988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DmQd1XYOjtrz6GVJ8DgvhIvqtRGpPGZCjPKcIxlbjuY=;
 b=R/dlbnriKxbaTTkzNry5kldSEbM3bfsLirydCWeLUHeP3FFbM/1JOHW5cj73ChJ4Pv
 DzP79EQs3R9x76NR+3IhlbsSCmsrrhokAcA3KyQoepa6w5E5N1SnQHFOvQvYjqMM4Hiw
 S7JRV7ueGDFsYOdjdX0abcPxJ1fkpP30IN9tR9wASxtVDM07cIG8oKhIjyRT4nwT2J/k
 qB4GWD7kyOGgOW4RmU8NiPysPIlFI8RUZSOGcJNSltgnslBC7eBNkXtIOwsV4YZ5lS5I
 ogqMwhV+Aa7eWyEC6mKOeo279L4yR33P8t2NBRbRnTNtMmveYFbaP2CXXuqcSKym7Cyt
 lAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328188; x=1719932988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DmQd1XYOjtrz6GVJ8DgvhIvqtRGpPGZCjPKcIxlbjuY=;
 b=N+DAQYYAlf3fBhHI5Si+kpNcAn7R9GkxV7/qxR+Fb7fhY0PfOM0Q4AbvbAWPPr+Kft
 LvcEDSz5s7aXOv+T1NOj9FkTqvt6DIxsbIk8ZTJokkhfz6VHIbGDB0ouwGG6s+P0yXRn
 l1YfCYaeMRE73+PZSTmg4lVlVnG2aU545bUkFj7elB7Z5Sm42IZ8UA7nrIKCPrWRUq0z
 ai4j75PxmZDpq8oCqQp0lz/knTkMuTlSEa2cRD3NolPzx5T3MzVR086wjVRJQXGfwq0/
 Q0AumhOmDY8cvEO2cK5aCmFIaVs3ter6i0t2f+Bt/9P1A4wXS/ZvNMQxK3VzTMZqsSue
 GYiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdY9A9jrqT4O0kkjoCYhql/zelNzOVu5Au4FWYyGiigEPfdS58BZavt2ZVLxkTBlPu/CXsWagIybEav5JokdhQzN+M
X-Gm-Message-State: AOJu0Yxfxuhgm75p6znuwAalBkF4j25EXYjcFWkY9WYDJMo9neyTKkRb
 SucHkkegHBsed1J7hm7LVnbzeOfIcULltz6lnbeb64YATdd7Ix0nxQgV426N7PI=
X-Received: by 2002:a05:6a20:3a96:b0:1b4:4568:4c40 with SMTP id
 adf61e73a8af0-1bcf7e36a3dmr7473835637.12.1719328188238; 
 Tue, 25 Jun 2024 08:09:48 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:09:47 -0700 (PDT)
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
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v4 10/16] tests/data/acpi/virt: Move ARM64 ACPI tables under
 aarch64/${machine} path
Date: Tue, 25 Jun 2024 20:38:33 +0530
Message-Id: <20240625150839.1358279-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x434.google.com
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
X-TUID: 4cSFtN4IB6+M

Same machine name can be used by different architectures. Hence, create
aarch64 folder and move all aarch64 related AML files for virt machine
inside.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/{ => aarch64}/virt/APIC             | Bin
 .../data/acpi/{ => aarch64}/virt/APIC.acpihmatvirt  | Bin
 tests/data/acpi/{ => aarch64}/virt/APIC.topology    | Bin
 tests/data/acpi/{ => aarch64}/virt/DBG2             | Bin
 tests/data/acpi/{ => aarch64}/virt/DSDT             | Bin
 .../data/acpi/{ => aarch64}/virt/DSDT.acpihmatvirt  | Bin
 tests/data/acpi/{ => aarch64}/virt/DSDT.memhp       | Bin
 tests/data/acpi/{ => aarch64}/virt/DSDT.pxb         | Bin
 tests/data/acpi/{ => aarch64}/virt/DSDT.topology    | Bin
 tests/data/acpi/{ => aarch64}/virt/FACP             | Bin
 tests/data/acpi/{ => aarch64}/virt/GTDT             | Bin
 .../data/acpi/{ => aarch64}/virt/HMAT.acpihmatvirt  | Bin
 tests/data/acpi/{ => aarch64}/virt/IORT             | Bin
 tests/data/acpi/{ => aarch64}/virt/MCFG             | Bin
 tests/data/acpi/{ => aarch64}/virt/NFIT.memhp       | Bin
 tests/data/acpi/{ => aarch64}/virt/PPTT             | Bin
 .../data/acpi/{ => aarch64}/virt/PPTT.acpihmatvirt  | Bin
 tests/data/acpi/{ => aarch64}/virt/PPTT.topology    | Bin
 tests/data/acpi/{ => aarch64}/virt/SLIT.memhp       | Bin
 tests/data/acpi/{ => aarch64}/virt/SPCR             | Bin
 .../data/acpi/{ => aarch64}/virt/SRAT.acpihmatvirt  | Bin
 tests/data/acpi/{ => aarch64}/virt/SRAT.memhp       | Bin
 tests/data/acpi/{ => aarch64}/virt/SRAT.numamem     | Bin
 tests/data/acpi/{ => aarch64}/virt/SSDT.memhp       | Bin
 tests/data/acpi/{ => aarch64}/virt/VIOT             | Bin
 25 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/data/acpi/{ => aarch64}/virt/APIC (100%)
 rename tests/data/acpi/{ => aarch64}/virt/APIC.acpihmatvirt (100%)
 rename tests/data/acpi/{ => aarch64}/virt/APIC.topology (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DBG2 (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DSDT (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DSDT.acpihmatvirt (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DSDT.memhp (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DSDT.pxb (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DSDT.topology (100%)
 rename tests/data/acpi/{ => aarch64}/virt/FACP (100%)
 rename tests/data/acpi/{ => aarch64}/virt/GTDT (100%)
 rename tests/data/acpi/{ => aarch64}/virt/HMAT.acpihmatvirt (100%)
 rename tests/data/acpi/{ => aarch64}/virt/IORT (100%)
 rename tests/data/acpi/{ => aarch64}/virt/MCFG (100%)
 rename tests/data/acpi/{ => aarch64}/virt/NFIT.memhp (100%)
 rename tests/data/acpi/{ => aarch64}/virt/PPTT (100%)
 rename tests/data/acpi/{ => aarch64}/virt/PPTT.acpihmatvirt (100%)
 rename tests/data/acpi/{ => aarch64}/virt/PPTT.topology (100%)
 rename tests/data/acpi/{ => aarch64}/virt/SLIT.memhp (100%)
 rename tests/data/acpi/{ => aarch64}/virt/SPCR (100%)
 rename tests/data/acpi/{ => aarch64}/virt/SRAT.acpihmatvirt (100%)
 rename tests/data/acpi/{ => aarch64}/virt/SRAT.memhp (100%)
 rename tests/data/acpi/{ => aarch64}/virt/SRAT.numamem (100%)
 rename tests/data/acpi/{ => aarch64}/virt/SSDT.memhp (100%)
 rename tests/data/acpi/{ => aarch64}/virt/VIOT (100%)

diff --git a/tests/data/acpi/virt/APIC b/tests/data/acpi/aarch64/virt/APIC
similarity index 100%
rename from tests/data/acpi/virt/APIC
rename to tests/data/acpi/aarch64/virt/APIC
diff --git a/tests/data/acpi/virt/APIC.acpihmatvirt b/tests/data/acpi/aarch64/virt/APIC.acpihmatvirt
similarity index 100%
rename from tests/data/acpi/virt/APIC.acpihmatvirt
rename to tests/data/acpi/aarch64/virt/APIC.acpihmatvirt
diff --git a/tests/data/acpi/virt/APIC.topology b/tests/data/acpi/aarch64/virt/APIC.topology
similarity index 100%
rename from tests/data/acpi/virt/APIC.topology
rename to tests/data/acpi/aarch64/virt/APIC.topology
diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/aarch64/virt/DBG2
similarity index 100%
rename from tests/data/acpi/virt/DBG2
rename to tests/data/acpi/aarch64/virt/DBG2
diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
similarity index 100%
rename from tests/data/acpi/virt/DSDT
rename to tests/data/acpi/aarch64/virt/DSDT
diff --git a/tests/data/acpi/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
similarity index 100%
rename from tests/data/acpi/virt/DSDT.acpihmatvirt
rename to tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
similarity index 100%
rename from tests/data/acpi/virt/DSDT.memhp
rename to tests/data/acpi/aarch64/virt/DSDT.memhp
diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
similarity index 100%
rename from tests/data/acpi/virt/DSDT.pxb
rename to tests/data/acpi/aarch64/virt/DSDT.pxb
diff --git a/tests/data/acpi/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
similarity index 100%
rename from tests/data/acpi/virt/DSDT.topology
rename to tests/data/acpi/aarch64/virt/DSDT.topology
diff --git a/tests/data/acpi/virt/FACP b/tests/data/acpi/aarch64/virt/FACP
similarity index 100%
rename from tests/data/acpi/virt/FACP
rename to tests/data/acpi/aarch64/virt/FACP
diff --git a/tests/data/acpi/virt/GTDT b/tests/data/acpi/aarch64/virt/GTDT
similarity index 100%
rename from tests/data/acpi/virt/GTDT
rename to tests/data/acpi/aarch64/virt/GTDT
diff --git a/tests/data/acpi/virt/HMAT.acpihmatvirt b/tests/data/acpi/aarch64/virt/HMAT.acpihmatvirt
similarity index 100%
rename from tests/data/acpi/virt/HMAT.acpihmatvirt
rename to tests/data/acpi/aarch64/virt/HMAT.acpihmatvirt
diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/aarch64/virt/IORT
similarity index 100%
rename from tests/data/acpi/virt/IORT
rename to tests/data/acpi/aarch64/virt/IORT
diff --git a/tests/data/acpi/virt/MCFG b/tests/data/acpi/aarch64/virt/MCFG
similarity index 100%
rename from tests/data/acpi/virt/MCFG
rename to tests/data/acpi/aarch64/virt/MCFG
diff --git a/tests/data/acpi/virt/NFIT.memhp b/tests/data/acpi/aarch64/virt/NFIT.memhp
similarity index 100%
rename from tests/data/acpi/virt/NFIT.memhp
rename to tests/data/acpi/aarch64/virt/NFIT.memhp
diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/aarch64/virt/PPTT
similarity index 100%
rename from tests/data/acpi/virt/PPTT
rename to tests/data/acpi/aarch64/virt/PPTT
diff --git a/tests/data/acpi/virt/PPTT.acpihmatvirt b/tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt
similarity index 100%
rename from tests/data/acpi/virt/PPTT.acpihmatvirt
rename to tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt
diff --git a/tests/data/acpi/virt/PPTT.topology b/tests/data/acpi/aarch64/virt/PPTT.topology
similarity index 100%
rename from tests/data/acpi/virt/PPTT.topology
rename to tests/data/acpi/aarch64/virt/PPTT.topology
diff --git a/tests/data/acpi/virt/SLIT.memhp b/tests/data/acpi/aarch64/virt/SLIT.memhp
similarity index 100%
rename from tests/data/acpi/virt/SLIT.memhp
rename to tests/data/acpi/aarch64/virt/SLIT.memhp
diff --git a/tests/data/acpi/virt/SPCR b/tests/data/acpi/aarch64/virt/SPCR
similarity index 100%
rename from tests/data/acpi/virt/SPCR
rename to tests/data/acpi/aarch64/virt/SPCR
diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/aarch64/virt/SRAT.acpihmatvirt
similarity index 100%
rename from tests/data/acpi/virt/SRAT.acpihmatvirt
rename to tests/data/acpi/aarch64/virt/SRAT.acpihmatvirt
diff --git a/tests/data/acpi/virt/SRAT.memhp b/tests/data/acpi/aarch64/virt/SRAT.memhp
similarity index 100%
rename from tests/data/acpi/virt/SRAT.memhp
rename to tests/data/acpi/aarch64/virt/SRAT.memhp
diff --git a/tests/data/acpi/virt/SRAT.numamem b/tests/data/acpi/aarch64/virt/SRAT.numamem
similarity index 100%
rename from tests/data/acpi/virt/SRAT.numamem
rename to tests/data/acpi/aarch64/virt/SRAT.numamem
diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/aarch64/virt/SSDT.memhp
similarity index 100%
rename from tests/data/acpi/virt/SSDT.memhp
rename to tests/data/acpi/aarch64/virt/SSDT.memhp
diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/aarch64/virt/VIOT
similarity index 100%
rename from tests/data/acpi/virt/VIOT
rename to tests/data/acpi/aarch64/virt/VIOT
-- 
2.40.1

