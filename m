Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp538666lff;
        Thu, 12 Aug 2021 09:58:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU3JfNdLryD+cYVrXy1A/XKhwelSis8edDbaJKi+1l1EjyhHojXsbQeFSl7Se3yU0tfYOh
X-Received: by 2002:a6b:7204:: with SMTP id n4mr3780680ioc.60.1628787490893;
        Thu, 12 Aug 2021 09:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628787490; cv=none;
        d=google.com; s=arc-20160816;
        b=Gtn0w4dr1Z9+wYhFYSCOP009I9XoAUKRRD1o6X+aJFODOO10J7QPBBhZmq7Ou54gIy
         eRctkewKF/OcE93RZnlExy82+DJi+98rN3NiP54PZqRqNjLqo1nQgqZxK1K+ixLjgs03
         i+fepMOgRDL3vO67a21VebDufgrj4ixAp2OlkXxXX4d5RKeWzkKR0C5z9/VDjoxeu4Zj
         7tx3S/wjSK/c8xqG+Ul11fxCWZjFVtR62Dg2aZr3+HVS8OIuQV3K3Qrn35hqy21AgWIv
         kqItIz4kFJy9ND3KN75P6l8hAC9jLDiwbuTbIOTYIEoTh4Kf4DF5FZwM9rU7tm9EkVN7
         BC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2Z9C/CE+ufbrmEIPZ5EzW7+qdrK3GH7DzEHvIuwOuiY=;
        b=waCLDyo+2IzOnqGP6pjw6cvlOWmT6m9UySOhMUGqG34MEZg6fufYsfE9T4F5WB/E1h
         m5UcDdF5CZDzn2bsO6p0jeuMvmbX/5oIxz61ieDssbheorTcqzGhIxiz3urj4ANzaXf1
         2+sxN/ngVY0lPH4i/+7kv0G7bmyBqZ2LpxOFYyZbhysbo9EeA4Q4v82zGrCjAZnpTPVJ
         Jl5GbHFl3gkA1k+ejup0Hv1qoR3EKZxUhw1jMgSd3Y1/83/ZYJb1qZaOvOaV8BSATf8L
         ha0oiD8kbky8c4ztB6bmFUHy2I226Q2MmO5esW3dIzeazpyCOf0QDFjNSUyGj6W9vMwq
         kQlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zDPpISjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20si4178880jas.98.2021.08.12.09.58.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 09:58:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zDPpISjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEE1y-0006rS-52
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 12:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxw-0007s3-AL
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:54:00 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:40694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxq-00064q-8B
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:54:00 -0400
Received: by mail-qk1-x731.google.com with SMTP id c130so7343451qkg.7
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Z9C/CE+ufbrmEIPZ5EzW7+qdrK3GH7DzEHvIuwOuiY=;
 b=zDPpISjA5V6kc8hUUeqRWuV2IfSKlCj7r/LnHxg/bexmj0M0ePeRNp/IJ76+hkLpvc
 ntpo5pB5tph1TAzqDc22Fb5Pt6vINoM7REapDL6nngumVEz9xkNAKZqgso0vAuVf8kir
 sha7wqjxRWd3tEdf8Vo31DXz0gPGu7MrEPRyzcAgPeGiXI6Y3AYhlvwYUi6fobAqFJ71
 jeqgS/FYb62PZeD2mFu0kB/SAdqO0//U4MQywmcrJcB185bwsqcfyK9r7btvnrc2Hr45
 7okw3tty+rk2hgb2GZQt4YtlxJL873SLb8bC9BEjn8Doj4TZKD7TCCk3SmDBiUXsdKKj
 sHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Z9C/CE+ufbrmEIPZ5EzW7+qdrK3GH7DzEHvIuwOuiY=;
 b=JdntobOrXwJyri/w3AOdVZ6egMVRbcGpAKlONoH9L9ATRMtggcHj0FQZ+8UVgbAHOu
 FP/Z+es08juaU2/ROKWwxdJUkkyCHx1v5ZjZMhKKP+BX4WR57Rc8XiJ62HAAJRPk8mkq
 vzrUXoRUQr1v4oWAySVYDC/TSZdOwjfw528Uohh7+/jdgOiT+dOj9xWXqODcdgJUDpQK
 4FqZ4GRMZA1odM3E1peIcURBzZwnE8akLADLz5CxjCVP+kKaSGbh3QFqvFH1jkpPCynu
 Uo+4SCnTZU3JExI27h+dDZdGR3itEF77AIKh8Bi2TF7ipZogvQ799F4kWEAPmE23bnvm
 WOog==
X-Gm-Message-State: AOAM531aVtygL8HOncZVKoyr8ihr+gPJkWr3+UM5Go/j2es223kt2Yig
 e78QzO2GUiRT5ahDOA6oglUF8Q==
X-Received: by 2002:ae9:e813:: with SMTP id a19mr5600845qkg.246.1628787232288; 
 Thu, 12 Aug 2021 09:53:52 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:52 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 08/10] tests/data/acpi/virt: Add IORT files for ITS
Date: Thu, 12 Aug 2021 12:53:39 -0400
Message-Id: <20210812165341.40784-9-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812165341.40784-1-shashi.mallela@linaro.org>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rHXFNe/4GHhH

Added expected IORT files applicable with latest GICv3
ITS changes.Temporarily differences in these files are
okay.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
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

