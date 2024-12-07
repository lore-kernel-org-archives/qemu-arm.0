Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378663njb;
        Sat, 7 Dec 2024 00:58:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+RHsf1OGDnp2NG3maZI4MZYvz7B11Bs6xn5qV9y4s2POgu2ZUFlV1X4MIefzoY6FY2dG0wk95f/GkUw==@linaro.org
X-Google-Smtp-Source: AGHT+IEsBKOKWtoYPsd3ZSYeAPJ+THJe9bct6QcuWUu1+41Ndmq6Qqq6reuOnLod9XA44YzPeQT0
X-Received: by 2002:a05:6214:4d06:b0:6d8:982e:b1b4 with SMTP id 6a1803df08f44-6d8d726dc02mr169237426d6.24.1733561903182;
        Sat, 07 Dec 2024 00:58:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733561903; cv=none;
        d=google.com; s=arc-20240605;
        b=EXSO+0HN7IuX/Jf7oE4Zlg0xsVtO96BxFk5i+AJAJGl11ZBmGAiT0Hg7BRJjV7sgwr
         2oGNDftWD6eYE+REXOI4kcUrNvQ6n5iszADdK7Vll3CKj8+ZQI4MVFPPTsQP7MzYXyH5
         fB0LJ38f2AQq9Sze8JAzC2Y/KQT0GPE6C6p9C1LQ2u4MYwlQoa3a+UpwK5ZT8ldbycj4
         R7DFFpC//gQwOsAdxCbTsTO+2mXcOpEv7tJEEslzkVD1EF1KztlXoYXGYGsmTknaLfmu
         QR/g5UD3P8j5hhA7ZBNkfokJz9VonCGs2wa3Uqn2P1ftfyK9a1wvxhSrj5/ZX0eTFSzS
         IEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=86D5w03GN46N4hQDaUq12ULG4qFYMYOyr19ho9PI6qM=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=G0xodQkirujHp/J8rfPiz+EpzIY70WrK+5kP795SFoIslPACJCaygvk5K9b7B8ZyW5
         whLx45xNrp+vrINjXvj+Pf6cRosPF1/NNE9q0q7QpzNz6yyjIT8CFYjdyOCrFpDxsMrv
         MQZHNHXs0VArryClcUmrxZUMvpCqd4whTOP4pLzJT6vsw3UZBwiUgX1v8NyCzDnPUnOz
         v/odKMv+Wg6FM7L640Q58yHkV53kkmW8Idz8x9o42VvBU3ygwIRwAw2cBwKly3N9BAnw
         FhD/6d9NJWt7U1ueYzn2eqx3opXHZb9DK57XiSNQruEfmGHKMv+iw2Vx2zPu3VD4mhXH
         9P9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RdDCgomI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8ff92290dsi4066876d6.8.2024.12.07.00.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Dec 2024 00:58:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RdDCgomI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJqcW-0007c1-Dl; Sat, 07 Dec 2024 03:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcS-0007ZC-D6; Sat, 07 Dec 2024 03:56:56 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcP-0002VU-K9; Sat, 07 Dec 2024 03:56:55 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 77DAF5C4BEC;
 Sat,  7 Dec 2024 08:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265F1C4CEED;
 Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733561805;
 bh=0CyS+5uMH4bliw7AWJd+kEIWAWXpqKGP1aXYbGP2T70=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RdDCgomIhkLvc2p1xqO26kbEPnAHrwkIYgncmQKl62/8DF2g140QKUK2WLrMaFHto
 1pVbr8WMxkWokXfAFIReltbivIv1hF69eXlyoDUf0n3YiYGu9oF32lci1rQRbNz+Rl
 M92P2ZIEi5nSDldRsQehcf8ObXgjgO6cJ7TFmhG2ZcMaN5Hz+qtWsr1Ob/rYQFf0mq
 566WSL5lKi5hNEVv3MS+Yypz3RAJiFQyMrqaYZTrBoUMZHl/u+1fNhfixGERelEY+L
 jeeoNOrAVwU84qLe5Rmz4qjUak4mpOZShHBOTryooDpfyn/2dt8WL273Bg0jUDJ4AG
 glNLlC/jCh+Tg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJqcF-00000005j5S-1Id0; Sat, 07 Dec 2024 09:56:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 15/16] acpi/ghes: Change ghes fill logic to work with only
 one source
Date: Sat,  7 Dec 2024 09:54:21 +0100
Message-ID: <a633f129131a22e2aad6b1b9543b88867bf9d424.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
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
X-TUID: X7kuPdOLZIRF

Extending to multiple sources require a BIOS pointer to the
beginning of the HEST table, which in turn requires a backward-compatible
code.

So, the current code supports only one source. Ensure that and simplify
the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a4453ee357bc..5efa50413af3 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -387,15 +387,13 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
      * As the current version supports only one source, the ack offset is
      * just sizeof(uint64_t).
      */
-    *read_ack_register_addr = ghes_addr +
-			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
+    *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
     uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
-    uint64_t start_addr;
     AcpiGedState *acpi_ged_state;
     AcpiGhesState *ags;
 
@@ -412,11 +410,9 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    start_addr = le64_to_cpu(ags->hw_error_le);
-
-    start_addr += source_id * sizeof(uint64_t);
-
-    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
+    assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
+    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
+                         &cper_addr, &read_ack_register_addr);
 
     if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
-- 
2.47.1

