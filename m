Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2421083njc;
        Thu, 12 Jun 2025 08:18:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoKVrxMrKVn09LHVnAB8Dl/hG6/NI6KfKrfwWs22RwxwY4csyrm0t1n+pjURRiTWREgDwwEVV6nw2c1w==@linaro.org
X-Google-Smtp-Source: AGHT+IGvuAPQd9JqvggeeaoJ+435RC7f6tWDK12MriaG4hQtvy7Bu35nq+yOT/sPUvXKS6m0KesY
X-Received: by 2002:a05:622a:4c11:b0:4a4:3186:5682 with SMTP id d75a77b69052e-4a713b95333mr135535021cf.5.1749741509585;
        Thu, 12 Jun 2025 08:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749741509; cv=none;
        d=google.com; s=arc-20240605;
        b=Ax3EgtWfBkjvFXVzT2PtKMdLoAcaD0fZOnWKJVuYA5l4D7x6W1EWexG39h9JuKikKj
         1AJW8T/evdFHh3/qPP2oOCvpg8hJvq4FHeeserVfwsl+VwR0jwA83sEzUE57lAi8fl4q
         Zb+j61MNxK8u2WVrOCZ9vQ/ifHZBIdqkJL4JNkvAj4Nm8YjGfltGCvlsEYEXRzaw+gMq
         ZlF/sqZMlVrYTgvoUZkB8TGK02nbbZSlRCvmfXswYownuEouKD7Fh4YlYEKoX2dQvp1k
         GV4DghPVpJs3wDUben7ak8MHIQAT8A3B1vvyasW8R3hG5cg6e43Y7ItGGEWkD7dv9i6D
         tm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bCRrF3U68Fk0sKvQx2oJkdKMdohcfgGb00SQagbo4wc=;
        fh=hTLU5mNQKwnri22ef6rNORXQEnayYeGogGHi7V9gOk8=;
        b=ANimEbtTQRefF/Zw+wbXsxmc271/r005Ncs40Sy8of0uN/fVx3Bk323+pR+RgMNdzh
         R7dLLvKfWFCpw9jvn7CMkrAlO+1awCScKDi0pddxlk2UK9dFLrO5I9m158XIi9YQP8+L
         3lZEcDzDWMV4De7+KL4MSUxTtXjr281saaCM+v8q516IoxqCwGtyYHLresXutcrg+Fa8
         kQMxKCdgdvVz0TSPPkOX9QR/ng1ZNa9CAzbSpUtKz73CF2CSVUJM3XFD7BoDlPMjKrBl
         0rsMpqscFkl57rjiBcdFuHZ2jzOQvJCyct+NavLK4tvhe6b3anm10QA9lPdWBJDB5rjT
         RH6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ceGV069n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a564469si10145361cf.670.2025.06.12.08.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jun 2025 08:18:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ceGV069n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPjgl-0002po-EP; Thu, 12 Jun 2025 11:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgh-0002n5-VT; Thu, 12 Jun 2025 11:17:56 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgd-0006d6-E9; Thu, 12 Jun 2025 11:17:54 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 49BEF5C65F6;
 Thu, 12 Jun 2025 15:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC39C4CEF1;
 Thu, 12 Jun 2025 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749741468;
 bh=12fECthY6pkGs+Y6n/4fbZ5eWnjF1raHBzKHenr6KjA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ceGV069nAXMj1R0JWOfcBYhLfetJ70/gc2BV93shds6zrYH3RjhHJqNQuLMbnQ7QM
 qBHeyKbV8uNuVPaw1ylPJZKO0+pLriYQ+4ivviAZbWH5aRMjT+F7I0KW4pNpxdKoMB
 N8i+SjrqmBgUSXMXFjR7cnMhx+ApM6T3FeMJlG7Pnsi1B0hnayNuNE+YN9R4xFTS6J
 lxFhMDJ624LQL40N9gdZ7yXXM2QxghSTGEYpwATOtu2s5m9EovbiRq5IB4G7mgPcw0
 6INeKdtele5OQVrzkuJnSbkOV7MiBWaNj/bGAWjPvkdbKL2AZwUO1HFHufshdkbqk+
 MdCg5tZLJeHhQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1uPjgY-00000005EvC-2rrM; Thu, 12 Jun 2025 17:17:46 +0200
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
Subject: [PATCH v10 (RESEND) 01/20] tests/acpi: virt: add an empty HEST file
Date: Thu, 12 Jun 2025 17:17:25 +0200
Message-ID: <e25ea751a23c7d8da812233c83ce943efbeaaf91.1749741085.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749741085.git.mchehab+huawei@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3b/0eOhGbhJU

Such file will be used to track HEST table changes.

For now, disallow HEST table check until we update it to the
current data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
2.49.0

