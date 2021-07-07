Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2695840lfk;
        Tue, 6 Jul 2021 19:24:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYpTyu9CnDtFAvdKCTzA8WgGNWJFzVAeIgPneDmMwYAwKe24KbuBltSICpeqDh8QB+/91R
X-Received: by 2002:ac8:57d6:: with SMTP id w22mr11389320qta.372.1625624693354;
        Tue, 06 Jul 2021 19:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625624693; cv=none;
        d=google.com; s=arc-20160816;
        b=oy9If8sCpxqKb7GldgrW6NC7h/U1I8yiNLyL7D2W6H8g+ZqVbMA7Ywf/BejwRtKzcO
         xWuM+1vf9mMO5Q79bfyDVQgr2tyqm8P1whGhWqABokD2W/pMMlu+SNNpTw/tPQNmRF91
         eMkIxDACd3/wsYkGbbNpHpqhkciWYJZtX7iuCzLZeIbbHmlIBwvTBiUc+rwW1YwfhGvE
         2mkaJwj2gaMpPS0LKtZQxiuqA8PRCdO2fM10DAs2KNCt/S5hOp8nUFtMTlziKOsYTfQZ
         DfkzRkJuuoxO6UWVSTpV+fK9tmOnhZC5WHqYNnW1AsjjXCtl+jSgS33DXAGJTbiI0yr3
         FHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
        b=UCtEb5HR0ZQ5/jDi/EUxlteGdjyUoAdHHHAhj19qYS7y0PdcQTaTMSAKmapOm7JfLX
         adV1vQcYm7hPdKQEVWfLocdCoKbcjGCrF8FeROBb3S9t0lQHR+oD3i0iXwuFWCb83R0E
         NGLE12gr1uMRDi/hPmTz/Im+ZX9WwuiA2AudO0VKbPHI1cybB/Vh1FodB1d/WzCdSH/M
         AV53cRfsKuG+EQOA9FuDZoMuIYFLiqTumeaTMC9fX1Vr1u6WnmBouulpPXH00ob1bDsc
         ety/3xf5EM9euBdgewLh4gvNWmu5Y107au7xeoxWh7EFF4MAFiEDO4e+7MFutnbnZFe5
         G5cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=apcHyZXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si6240620qth.319.2021.07.06.19.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 19:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=apcHyZXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0xF6-0005HA-MJ
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 22:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x9D-0000RI-KB
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:18:47 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:37390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x8p-0001Og-K8
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:18:47 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id x6so354163qvx.4
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 19:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
 b=apcHyZXrL5OiL06X4SWkjgRhiaTnh/LHUC2lRmdQBUK4m2bGlxdvqgIf8FlL/p6BmH
 1Mkq4/NkoNvJPBjS4F6GLA+2ZXoMmzZCdd17+hsUfdDfz4aPJ608M5e8cJawDxs3pKI3
 5+xqJm5f50ElAaKtki3fQqJN84zWhzt4zw77/RdIWXoofvjQnqbc3r1oidix/lFZdjsD
 7jDXuFTBKTcM6c0vYxrkhWjEFwCL7TEw1wAHE9yoKm0KJ8DN/tRxZ3c1tQDP/+mYcreX
 QMtAgy0HP+jS/HkaI8U04B/OHrq340CDmF11oA71cBQZEsro9RjEyDGvyBN8/4t9Tfob
 2YBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axd5FwFxYr5TwF9xkQcmsEoUNJHQHfTsD3YGTro3Vwo=;
 b=CXqkO1rihMWmL1wK8cl5CFEBYfhdM6gHPxbFTsIE/+3Kcz/jlJe8M98T/qhaW2+ReP
 CcNGb/2BPwLUuvFpkKbEjTu2FxXLbmj0zXpt0XxSLZsS1lWxIdWIFj6NIkh83G3nrIWz
 XBqqpiJtaiOTQrRovhFnTLs/ZBggjna8s4wdegDwEWwV4kT9nvWYSvbBZW8cOZOsY7IB
 h194TPXpWGKcmhYBSufn2fFvFTlw5wMYuyo0Vz0azIq5EXdJ7V39HnstnkQ14PHMbhqU
 ljDMp4aFxJcRZkBA+o9d3SKTO2gZ4Rkh6Kac3zAecqvOhGwLNUUHj0iXlhcdgmLfBQ9H
 e+yQ==
X-Gm-Message-State: AOAM5333Ba/c+6058ZdbzKeAp3W8m3Z6eZp5tgcQmxcE36S4m2NYqHgT
 sAC1p5ur2SmRYkFqxgO3HhRyxg==
X-Received: by 2002:a0c:be85:: with SMTP id n5mr21497718qvi.59.1625624302855; 
 Tue, 06 Jul 2021 19:18:22 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id z6sm7768613qke.24.2021.07.06.19.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:18:22 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v6 08/10] tests/data/acpi/virt: Add IORT files for ITS
Date: Tue,  6 Jul 2021 22:18:13 -0400
Message-Id: <20210707021815.45938-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210707021815.45938-1-shashi.mallela@linaro.org>
References: <20210707021815.45938-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c4H4XMLP5KCd

Added expected IORT files applicable with latest GICv3
ITS changes.Temporarily differences in these files are
okay.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 tests/data/acpi/virt/IORT                   | 0
 tests/data/acpi/virt/IORT.memhp             | 0
 tests/data/acpi/virt/IORT.numamem           | 0
 tests/data/acpi/virt/IORT.pxb               | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..2ef211df59 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/IORT",
+"tests/data/acpi/virt/IORT.memhp",
+"tests/data/acpi/virt/IORT.numamem",
+"tests/data/acpi/virt/IORT.pxb",
-- 
2.27.0

