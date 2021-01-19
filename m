Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2903839lfq;
        Mon, 18 Jan 2021 16:32:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNM7eBCWi/R9XptJjEygQ08LemPLCFAlLszukJBU8QTmbEMZjeoxF/phmbgx2LvjeM0Rze
X-Received: by 2002:a25:2404:: with SMTP id k4mr2289131ybk.197.1611016357235;
        Mon, 18 Jan 2021 16:32:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611016357; cv=none;
        d=google.com; s=arc-20160816;
        b=fguqkx+UipfFLEnE/0BZoMtQNClHyaXCz9M2N3qpeB/mTBiI/fV1ihmYmfJKbNndyU
         pyPBgaBhXk7baJZE+DTnN7HshCCPBqmZ7fJF2JealjI4Y07T+5xr+Mt4gmq9ScoEKn71
         rw8u85YpXlkrIY8X1dKAalbdglohYAJAjWoRunRz1LBhedR0HoMvu8v13hs2vLipd6Ig
         1AHGAkq7IPTQk5ayUciYbPTpXpyEmd1Snf6dKqMKTQzsNczFMCc4uPSR+QZZ1i1HgAFl
         +sCa4NSNy+KMaHTJj4gNsvOJoyyUk3kCARj6UoHSgpA8TEXu/49S4IQiUNHBUmmF9dXn
         8wsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=D4JaKsT93d23Qhkd9NhRZXlNzvrRaD6b4x+N/ddgOzc=;
        b=DO5emnWfz2WDiZZEqJ1HkOX8+wnnKxHamJi36bHiW55k5vhNgE4SpZb0RDqsly+a5N
         NyrmDA2Xb1ZiqijMOJkQgG7lC3TGJkKu/GekoZ4n8biGQYE2B4kJk/K91qO5J5Qt6Ae2
         FwNYnO7mGKeKHRuQSTPtCpTIlf5nxmGHy+/triPZkGXbP+pHByuLqcBR0ZWLPIfcAcGU
         w1d/vlQzraDLB7FqBzhDVCRIgNltv/syYtftl+fFWhanxaZmECp1/8vIirE2i5d0ehqk
         FBS1vdX4z5CbtwOxO7Tl4MZxJ4e+1RD2k5jPF0gzMNTuKaD6gjJl+mhGk4HVbyJpw6vb
         CP1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=YL14kqXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7si16911322ybm.252.2021.01.18.16.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jan 2021 16:32:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=YL14kqXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1ewm-0002yM-Jh
	for alex.bennee@linaro.org; Mon, 18 Jan 2021 19:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1l1ewd-0002yB-QL; Mon, 18 Jan 2021 19:32:27 -0500
Received: from mail.mutex.one ([62.77.152.124]:49448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1l1ewb-0004A6-PW; Mon, 18 Jan 2021 19:32:27 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 825A0BF42513;
 Tue, 19 Jan 2021 02:32:21 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ppqm5IpkYmRZ; Tue, 19 Jan 2021 02:32:21 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id D8B59BF423B3;
 Tue, 19 Jan 2021 02:32:20 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1611016341; bh=4wTVWjOzwu2FvqZ0TYOspRLJGdOCcZOJq1nz6R9tIKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YL14kqXsPmo/DcuhNmDV5G1PGymnO0W5OIUlQQB8vPBZiLpCSjqUgFtUtYU4pf1/J
 HRh8OGtI1cmDydY61++8LBcDzuH7816PFGiWp6A0kO94PdqmbiwBfe4eSqP805c1w6
 QX8NKMIhSwi08PRSn9IT08EkwDwE/lhCVMB76oO8=
From: Marian Postevca <posteuca@mutex.one>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] tests/acpi: allow updates for expected data files
Date: Tue, 19 Jan 2021 02:32:12 +0200
Message-Id: <20210119003216.17637-2-posteuca@mutex.one>
In-Reply-To: <20210119003216.17637-1-posteuca@mutex.one>
References: <20210119003216.17637-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=62.77.152.124; envelope-from=marian@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Marian Postevca <posteuca@mutex.one>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X3p7F8D2NFAo

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 94 +++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..b20ae72949 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,95 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/APIC",
+"tests/data/acpi/virt/FACP",
+"tests/data/acpi/virt/GTDT",
+"tests/data/acpi/virt/MCFG",
+"tests/data/acpi/virt/SPCR",
+"tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/APIC.numamem",
+"tests/data/acpi/virt/FACP.numamem",
+"tests/data/acpi/virt/GTDT.numamem",
+"tests/data/acpi/virt/MCFG.numamem",
+"tests/data/acpi/virt/SPCR.numamem",
+"tests/data/acpi/virt/DSDT.numamem",
+"tests/data/acpi/virt/SRAT.numamem",
+"tests/data/acpi/virt/DSDT.memhp",
+"tests/data/acpi/virt/NFIT.memhp",
+"tests/data/acpi/virt/SSDT.memhp",
+"tests/data/acpi/virt/SLIT.memhp",
+"tests/data/acpi/virt/SRAT.memhp",
+"tests/data/acpi/virt/SPCR.memhp",
+"tests/data/acpi/virt/MCFG.memhp",
+"tests/data/acpi/virt/GTDT.memhp",
+"tests/data/acpi/virt/APIC.memhp",
+"tests/data/acpi/virt/FACP.memhp",
+"tests/data/acpi/virt/DSDT.pxb",
+
+"tests/data/acpi/pc/SRAT.acpihmat",
+"tests/data/acpi/pc/HPET",
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/pc/SRAT.numamem",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/FACP",
+"tests/data/acpi/pc/SRAT.cphp",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/HMAT.acpihmat",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/APIC.dimmpxm",
+"tests/data/acpi/pc/SRAT.memhp",
+"tests/data/acpi/pc/SLIT.cphp",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/NFIT.dimmpxm",
+"tests/data/acpi/pc/APIC.cphp",
+"tests/data/acpi/pc/SSDT.dimmpxm",
+"tests/data/acpi/pc/SRAT.dimmpxm",
+"tests/data/acpi/pc/APIC.acpihmat",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/SLIT.memhp",
+"tests/data/acpi/pc/WAET",
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/APIC",
+"tests/data/acpi/pc/DSDT.roothp",
+
+"tests/data/acpi/q35/SRAT.acpihmat",
+"tests/data/acpi/q35/HPET",
+"tests/data/acpi/q35/SRAT.numamem",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/FACP",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/SRAT.cphp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/HMAT.acpihmat",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/APIC.dimmpxm",
+"tests/data/acpi/q35/SRAT.memhp",
+"tests/data/acpi/q35/SLIT.cphp",
+"tests/data/acpi/q35/NFIT.dimmpxm",
+"tests/data/acpi/q35/APIC.cphp",
+"tests/data/acpi/q35/SSDT.dimmpxm",
+"tests/data/acpi/q35/SRAT.dimmpxm",
+"tests/data/acpi/q35/APIC.acpihmat",
+"tests/data/acpi/q35/MCFG",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/SLIT.memhp",
+"tests/data/acpi/q35/WAET",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/SRAT.mmio64",
+"tests/data/acpi/q35/TPM2.tis",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/APIC",
+
+"tests/data/acpi/microvm/APIC.pcie",
+"tests/data/acpi/microvm/DSDT.pcie",
+"tests/data/acpi/microvm/DSDT.usb",
+"tests/data/acpi/microvm/DSDT.rtc",
+"tests/data/acpi/microvm/FACP",
+"tests/data/acpi/microvm/APIC.ioapic2",
+"tests/data/acpi/microvm/DSDT.ioapic2",
+"tests/data/acpi/microvm/DSDT",
+"tests/data/acpi/microvm/APIC",
-- 
2.26.2

