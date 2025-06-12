Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2421281njc;
        Thu, 12 Jun 2025 08:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUX2K1MH7KQtLLXXv5V9Q4goVVZ4bhkbQDFcX5FNbpJU/VVSF2we+XQMcUlXW5gpyGy7C3ISMSMPbIT6g==@linaro.org
X-Google-Smtp-Source: AGHT+IF0O210KmEOnTeqMCA4vBXCGPQ2ofEyOF8F++yaqsO2PSGG59pDHGqqTRaDCue+Pl+B9ucp
X-Received: by 2002:a05:622a:4207:b0:4a6:f7a7:4d43 with SMTP id d75a77b69052e-4a713bb0e16mr126425701cf.14.1749741527274;
        Thu, 12 Jun 2025 08:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749741527; cv=none;
        d=google.com; s=arc-20240605;
        b=O1jZQMd9sZ6lN83tDQkX+FF1F4Rwgl4A5bjyTOBSQAF+bDPXOfLISh0hLAcKf0GlNR
         7AgRes0Qcz/cXanezQTzV2a8PZ2s+IaHDWvJV90wmve13k7xgSl3ZIo0qika2QxkSJRZ
         XlQgbWIMhDCGeQe42LpKXK3uURHrJ1ZVit393gGSWYOE0K/EbhL75EbtRZVfMpEugR0G
         n8HVTP/fbarogkqEp5L5/iLunRR/Ydz9r+1oPZaVFo74vJwBeWyhWNI09TOQeC0BkNlM
         PSB4Qtpl/4PPZ2VGQc2oe2hFnWCZg/oTtjpgwtT/V3bNafobaDk6jm/uOGYpCoj/Sks0
         sDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+RQBf/ybHaTwn/s6B9TolHsBMtoW2ZGS+Nytovzrdv8=;
        fh=hTLU5mNQKwnri22ef6rNORXQEnayYeGogGHi7V9gOk8=;
        b=G/uLztnpfFqA8BGmMg9uWpQ5mZgwpurpXTCqC/PW7p6w9LwpFXIfmH1J680USefzvJ
         UcegHslCk/tIqOb5YtkL9L/9+dQHAY8cYv6wej4IYvsjQg+D9G4o8C0L/fYWvIwcY0qs
         aUHNtDma8jZgNnmVoC0DOGM9XaZ9m5ZwQIezOIJPrajPuAOGGhNGUO981YYZ2N7APAUf
         RTKq63GPMb41M7kMgafI8QqDGKaayTH64FwbeKcRnHih737ihcaa84B2xx9X0IuLZMHN
         kY3N/eflD4dfDalPhfDfNDPFPcgKyaRn2rBxKc1GZWHg2Qjp2cqUs1kM8S38cMr97Rod
         Anlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=HqkhG5J4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a531d25si8933471cf.591.2025.06.12.08.18.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 08:18:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=HqkhG5J4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPjgq-00035B-KA; Thu, 12 Jun 2025 11:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgi-0002np-UV; Thu, 12 Jun 2025 11:17:57 -0400
Received: from sea.source.kernel.org ([172.234.252.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjge-0006da-Dw; Thu, 12 Jun 2025 11:17:56 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 626A94A7B1;
 Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38507C116D0;
 Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749741469;
 bh=5800+9pcKbpwq9CBW/e+YLPVT84qYs9jAiAX5nQsi/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HqkhG5J41imjPv1R5ZtN4zLsGMd+SJAwp0efcggHaslrKnhroV7BfEfNm3q56lo4j
 cizltsctWOzDiCKJ1h8ilyTVdeLebnqHebKBOb50a7MO80nVJKPiGf35HBDxxxuJ63
 nGSoGoFwAqXYfzAilMQalDmYibTW/GJ9cVeLeEr46s3nfBonaNI/3YHlMTZG1c1+lD
 H0U1SAuLWp+Uc06m7u1/t1R1rk6V2LXEZf5AW/ELS7zh1CnZSWwWLpNSw2gjWe7rrG
 DtXra/v2IuqDFB8pwhac8I2lrTtKagU8IWe5P+5LMXwi5iRXsyAh187Ezbo4hImRbt
 wryGJdo+gN31Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgZ-00000005Ew2-1rj9; Thu, 12 Jun 2025 17:17:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Ani Sinha" <anisinha@redhat.com>, "Dongjiu Geng" <gengdongjiu1@gmail.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Shannon Zhao" <shannon.zhaosl@gmail.com>,
 "Yanan Wang" <wangyanan55@huawei.com>, "Zhao Liu" <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 (RESEND) 14/20] tests/acpi: virt: allow acpi table changes
 at DSDT and HEST tables
Date: Thu, 12 Jun 2025 17:17:38 +0200
Message-ID: <c3d68c081655d471f6d9ab4fb24191b33137ff5e.1749741085.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749741085.git.mchehab+huawei@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.234.252.31;
 envelope-from=mchehab+huawei@kernel.org; helo=sea.source.kernel.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: LLgHorspMlO+

We'll be adding a new GED device for HEST GPIO notification and
increasing the number of entries at the HEST table.

Blocklist testing HEST and DSDT tables until such changes
are completed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..0a1a26543ba2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/HEST",
+"tests/data/acpi/aarch64/virt/DSDT",
+"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/DSDT.memhp",
+"tests/data/acpi/aarch64/virt/DSDT.pxb",
+"tests/data/acpi/aarch64/virt/DSDT.topology",
-- 
2.49.0

