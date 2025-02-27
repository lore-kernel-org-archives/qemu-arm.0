Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp324109njb;
        Thu, 27 Feb 2025 08:02:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+BokpMCcYwbZx3+phNmkI8tPB6+AX4TB73ItLoCvOga4HjQX3ws8HJ5WnN84+At0wvjAVqzi1jfX9Dw==@linaro.org
X-Google-Smtp-Source: AGHT+IFLcVOrqsZCp4qZ2Y/Chv6+taaKd+poU2dOmiAXo9YTcJhWwQONu5IY1KydLaYp90nKHQPg
X-Received: by 2002:a0c:e006:0:b0:6e4:2479:d59b with SMTP id 6a1803df08f44-6e895a29be8mr49371446d6.16.1740672171382;
        Thu, 27 Feb 2025 08:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740672171; cv=none;
        d=google.com; s=arc-20240605;
        b=fyE3z8V2YZtskHJAdQqwrbxHWOSzqdx7lE8JS6p8BlvaZ80gIT69l+BxI42BgFzUsk
         S6DCi+9RY8lG4yfx5Z7ebP7icOAwXl8xQg8IjRLnRrTCpKlPCyrG02ylIDEFsZ+36Qg2
         NWqWSsy5k28bDGVJUIlatHgV9H9ZqVm1H6d0q7UpULXobzjkUJN0QX1uNZnlPD6ekKoo
         saHtpNUgk/hsEFwg4AxvCNSG+20VhuxYskM7TZQDnVgJnXbA7hP3FYIfvM/rHv2yAZOV
         1wYSB+H56yQeVOPSsc1AHVUX6nFHwzBoy8QJDkQO5TnDN1Vqx42AjZLqjPnqmHB014ky
         qFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sgy3GLcaA+NOtCDtqkft3oTNYvjDjopOXhsvw+xS9Bg=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=b1QEAjSWcGeQFblrDrHGVqnDemmQn8xv4H9ceo9ayRX11X5St5AKSMDPgxgTk0Vtb1
         DC4tJCnpZi9aFFo7VbX508RdWaq+oBUsgHo3U1wtkuKx+OXiJ3P5mx5rcocIsxx8lcUY
         /kSkQLiGg1j3oWbDyi3ggHEP1pAfgEoXaZCifJiF70C6X4IYsHdrUPJiwvgsaa2ssDt7
         o6JlghGe+fceUnzJ3k93ZLClV5Gynlr4CTY/WVCqEIuJAuMOzCz0wu3ieggsFFa/O3vG
         TrTY4NlYlr4RqHQpBUW78qMkrq5duOqafFvRHTuv1Vr9AoxNBtt51CcbcGsefBfDodXb
         4tIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=epiYbi+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976d0822si14718476d6.315.2025.02.27.08.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 08:02:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=epiYbi+u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tngJz-00070O-Nf; Thu, 27 Feb 2025 11:01:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJu-0006xk-IM; Thu, 27 Feb 2025 11:01:06 -0500
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJs-0007Fu-Nq; Thu, 27 Feb 2025 11:01:06 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 70F2D61548;
 Thu, 27 Feb 2025 16:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89229C4CEE6;
 Thu, 27 Feb 2025 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740672062;
 bh=iDgAO7mir8XQODJDtQvfnJPGdTIDX8Gz9fG7yH7/i1s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=epiYbi+uY5SNkVdb+9ROk3zLKivJAVj3NKoqPn/wlfovwB/LEpjdBKFzX4e3VvczO
 LT3I75o/eSHOredN0+1gt9TuXzOkhHdpwBF8HGNN+R1pBKw3Pjhy6K0+YBzvRlN9E3
 cfMNhh6uStbCQX4f5UN3wMbgxQABJu1bmdS1uJF/tcmZ8rIOxltZ10A8DnvpMA9NnP
 bIreSLtkTrGTCAt5XVno4yG5ALvIUB6NQWpFbl+FQtQnwA6vtj+QJQznpGEPVhpMXK
 WalRn5CvSW6LnkzitYooyDApefz1EtHV3YFFohOW8ntwCft3tui6yo7A1RmyuPiY9f
 MunU2kcCZHqrQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJo-000000023al-36Z9; Thu, 27 Feb 2025 17:01:00 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/19] tests/acpi: virt: add an empty HEST file
Date: Thu, 27 Feb 2025 17:00:39 +0100
Message-ID: <4d281b9312cac07460ecf7822512031e778ef6b8.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c04::f03c:95ff:fe5e:7468;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: EE+VcYY8Jtff

Such file will be used to track HEST table changes.

For now, disallow HEST table check until we update it to the
current data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/aarch64/virt/HEST           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/aarch64/virt/HEST

diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..39901c58d647 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/HEST",
-- 
2.48.1

