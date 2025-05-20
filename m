Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp304956njc;
        Mon, 19 May 2025 23:44:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfDlzSONv5Rt/+Zyl5EuyKWWkEk2rlm2tWaS19LatphOqq6SvZS4NU7fFg4Yd12nYII2Fs4vxSJkLATg==@linaro.org
X-Google-Smtp-Source: AGHT+IE8fZRVb7cNovO0ZIKap2m/lL/XHmqDJuSyyYtc80F1vnr0Nuu3rnxJ6MAvCJdSdCoyeT+C
X-Received: by 2002:a05:622a:2b09:b0:48d:7cb6:c625 with SMTP id d75a77b69052e-494ae353eebmr296285681cf.4.1747723478460;
        Mon, 19 May 2025 23:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747723478; cv=none;
        d=google.com; s=arc-20240605;
        b=BR2bOGr9gNsTOb/39yfMQ3p+DXpdfzSTYI+L46ZEXF9i+nhg9sijamW6g5YA8MQFzT
         s20vE58XqFV2sNjbPCG9c8SM6bAxCIxcNBGVmOemuFs85x+lyMbyJ+ZcG6JB9UvouURj
         xyOylSAxc96/eqgyszDnf0jtCDS705du2qe0Cynx3KDeKol9PN8OjFH8qeC5d/qiKOWN
         9096mUiTf1AJ7DB4rTgfazv5HmgqGDY0t1kfrjwEO0VIQ3f/otnQ6HKjHAzRFh0N3PLB
         r/Uf48JZ/BQN4J7GlVNRCPzu9qYecVj4z5EpDxh1ipuSWAKtXfVSQUzBjs48nu88RldN
         YEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Y2ZAdYSb2J9tJtU3iudPTn7L3o5f1Uv/KnegZB/OdIo=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=IyD9rTWbxtjYb2Ew8gfxkAWyg1VEVG/kgCHQUfN6vfJSOawe4+OsTKHVmIXMA5UhyU
         wyP+tO80Lkm7PsjXdBpEsQpufq1XlYZnewVkWTd/Z2+kzApTUxm8LicZnJkOpRhwm0Wo
         uDc2BIivtqVQqZAcPpqnWxg41Csf96epkqX3OacS2wSbQcYYda4t6xKnhrixbO9Zl/GR
         SFQwVnaUD/TOjdXAuCD0un5ib+5dVUSRx6cMToq4lmddcPdR9gqhRTxTlkjCXssTqMO5
         U9LzC2gRyCINyPL35CFoLVCZTdvaklO9TflGzVTSCsUg9ggIzS03gzN0arx3pm6EgPdn
         BH9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fLc9T9ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b0999817si103597196d6.180.2025.05.19.23.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 23:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fLc9T9ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHGg0-0004k7-0o; Tue, 20 May 2025 02:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uHGfv-0004ga-QV; Tue, 20 May 2025 02:42:07 -0400
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uHGfq-0006O5-CU; Tue, 20 May 2025 02:42:07 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0692B629E1;
 Tue, 20 May 2025 06:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA28C116B1;
 Tue, 20 May 2025 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747723316;
 bh=ZjxTrDfZsR49IGnqiZ8D0BXcP9J3h4Wtg7k4Hd5ngw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fLc9T9ngjBMTJ+jBBnhKFC7+ZIBJP51vALhr/Op16RDrtQyP2xEsIKYURVsOR9RLw
 KKXHjySxmN5AM3SPSM9Qe60HNOfcOtBrGnXQabsDH5+chILHnbgAZ+tMBUHxWNqqpT
 RdwqlDBBfkxc+ljSPHHo/FsXm3GIerDqkKz+4yRXnAcCHGr9REpz/F7lzImdvsdBQP
 3oIVkE3e3KeiFZhvXhoHb98cjXcdyFdAiH89L0EiU6geAEG8NHkQZxT7u7RUq9tpf7
 4ofETkxHdNuXF+MJ3yQdc7PH14/l4HKPkKDw3Rml5fIAXzISKFHn6KqRLjLaGuVIn/
 2YyLtvzWEwqcA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1uHGfh-00000005qt6-2wY8; Tue, 20 May 2025 08:41:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v9 02/20] tests/qtest/bios-tables-test: extend to also check
 HEST table
Date: Tue, 20 May 2025 08:41:21 +0200
Message-ID: <dbb478f3ece9a23da30d0919134ff6ad7e220863.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c04:e001:324:0:1991:8:25;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.13,
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
X-TUID: KC+aAYD/1i1A

Currently, aarch64 can generate a HEST table when loaded with
-machine ras=on. Add support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec43536..8d41601cc9e9 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2122,7 +2122,7 @@ static void test_acpi_aarch64_virt_tcg(void)
 
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
-    test_acpi_one("-cpu cortex-a57 "
+    test_acpi_one("-cpu cortex-a57 -machine ras=on "
                   "-smbios type=4,max-speed=2900,current-speed=2700", &data);
     free_test_data(&data);
 }
-- 
2.49.0

