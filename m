Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp586500njb;
        Fri, 31 Jan 2025 09:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVt9Zxr4Ma7lWpULhZVwbxVUrgLV/vKD1ofwFGFcQa0jrs5p9yYB6ekGZ7Q4ZXv8z/e0zWfQy6Cu2pZdg==@linaro.org
X-Google-Smtp-Source: AGHT+IE+GgfO76v+dMDkwutUiIK79hoX3sLD4H3ZA40PmcW2vqIPWtZtZoYkpa5NcOZNHF2jH/Tm
X-Received: by 2002:a05:622a:285:b0:460:8f80:909a with SMTP id d75a77b69052e-46fd0b8006amr219434651cf.32.1738345404114;
        Fri, 31 Jan 2025 09:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738345404; cv=none;
        d=google.com; s=arc-20240605;
        b=Gc95DcceXKoMt8NGkgUPzA7C+5ymu7++7d73T3NQ7kneTRCzLubKDh1hEIZs/Cr3J1
         2fdZMZM8e9mKWcb7y8EBfsoGyLR+AeWGJemuZfT2QLV+rGINhvJKIPfZ5ujtJtpI9PLY
         Qhfp6XpVpOkFu52lTbmnmpa8gcEZq15yxcUnZx+DV0Vh+OoWnC0R2odji0Tuq1lDRPm3
         8p5JL2altlrVWz3JjNPTRDdWcP5VdTskBdvptZjqetbTMp7r3VD/0MYphi7OavSr+E4L
         lRKKqEPFOh5h+sIjC65O/b++8XMcKjvoiAwisEW+OYR0IOWCRRm5Mf8hn/I6pXPDj83r
         k/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M3Wnbe6jHjLJLo9BStFZNrL2Ihra6iDRBZZXQ8zKADA=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=ZLolekvAU/Z1BH3lSYgjEkFDNGFij6H27/AfPDWUHOXYvZDYUDHWaO+inJb/bWYL3L
         +NhizeHY+7jYenkZBHUFiFl7D3gb5adp0EntUMkWES0Dh6fB2018NSvfx/EmvvJ8ESJF
         ZOr7PGBj+EZbhXEmV4un2g9S96sVEU0R7m2B2h1l3xvzHYqqD6f89WgT+UMU0CmmSQWO
         NiW0He6ihoeG4ka5F2aL/Yi76hfXdpb6KKdrOy+JauJwmyiBZKCvm+T03wecnrorTpAQ
         fYCkkQq908nP6s+EUpaL+444Hi4Yf/z6qedPazMQTJ+ELMZPHs8fKu659flDZOX39v5d
         vtUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AhSR3TPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0ad4b8si42748081cf.87.2025.01.31.09.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 09:43:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AhSR3TPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdv2w-0005zt-U3; Fri, 31 Jan 2025 12:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tdv2v-0005zf-SU; Fri, 31 Jan 2025 12:43:13 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tdv2u-0001mP-58; Fri, 31 Jan 2025 12:43:13 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA4DB5C6371;
 Fri, 31 Jan 2025 17:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C48C4AF10;
 Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738345389;
 bh=DQC3zr94ZReUfrvfTgHOE+Nuqf4J0hcEac0jCBHL1YY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AhSR3TPmd2uyS8GkZOEU5XGPMaaZoxcnOI0gv4TgqhE5P/WjUySCh4J8u35XpWWph
 1k3chwzNAiYLAZum85gPmSZdpXYEYG5YC67zCYCVYzk4pYKqBa52a+2nv5r1X1kmSE
 XHtaLGXCSHoKlxE0PMWH60LzdzsCxYt8D2TBs+yBgMqFOfnLqlHB3UWWf01hh3Stbn
 LPrL7kZVF44CQRWCVS8OukTHDcYxr2hthpH/zJkDVch0saXortRWPXLE/FAYdxTKEj
 Vy3Z/97D2mAkNpZTbmSmDweEs6WZDQvzfZQX+VDR5wKUsMlltXRFtnPeBhnzfF0+wV
 9fg2NxafMOafA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tdv2p-00000006ghI-17yo; Fri, 31 Jan 2025 18:43:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/14] tests/acpi: virt: allow acpi table changes for a new
 table: HEST
Date: Fri, 31 Jan 2025 18:42:51 +0100
Message-ID: <aebae4577793e175a03b8db3090582aa1ef31809.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-TUID: ESJCp8kUaaKA

The DSDT table will also be affected by such change.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/data/acpi/aarch64/virt/HEST           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/aarch64/virt/HEST

diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..1a4c2277bd5a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT",
-- 
2.48.1

